data "template_file" "kms_policy" {
  template = "${file("${kms_policy.json.tpl}")}"

  vars {
    account_id = ""
  }
}

resouce "aws_ams_key" "key" {
  policy = "${data.template_file.kms_policy.rendered}"
}

resource "aws_cloudwatch_log_group" "yada" {
  name = "vijay"

  kms_key_id = aws_kms_key.key.arn

}
