Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8B6FC35274
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 08:42:03 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.39769.1702888916616756780
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Dec 2023 00:41:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CgYDal2h;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-50e281b149aso1643908e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 00:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702888915; x=1703493715; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LQUpypiAu98AJQhwipVu/xx+rhdqs4Z5gBz86ef+LtM=;
        b=CgYDal2htbnbO4ZlfxAEL3L66nZf0N+aA01KJGlT5sG6iV9Z/CDl/ULZHgu83WJRP2
         X0XFL78Ce+T5qtCDCli58GIF0ahVUeKsueIEUKlJybwHOMK4OQ9QWBM3aMSCUuWAklnq
         fhQIgJPHHrKaMPY2My01zemiiro9Kzt+0vyon+MJ4wvth5JiXofnVSPvojt0jDKLMNCL
         GiS8iXn0OsGtdyyjFgtTQcizWHV482zq/d5kCzyiKFabIhfg2qsiPxiUrq5bdKZqd2ox
         hCMGcuJ+QkHROnAuWCjSO48wskRJFEYG92uXkxYr1zqb4VyMaSrxI4R0n/Wa6H39SIwG
         euXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702888915; x=1703493715;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LQUpypiAu98AJQhwipVu/xx+rhdqs4Z5gBz86ef+LtM=;
        b=UQx9f8XGhUeU8BbpnwYdlAVaPPtz42fCQGbcwNj1590HZHtCAYAhHq1ZJBjRwciEEM
         XpiaGrzAS/5f7nkLxNsFCr6+ukCHTbRPTDG1/XpUFtpESiD7mLzD+VpbYP6eo82HXH1U
         A/fKVXZBb/bH+JFrL8Rpj/oSvnvEFweDblWfgVTXLICxP5d47zja7TZqj8gKo+AOIRyS
         3cflRrCeWiPiQdGBGpWkftZgSbfPGWshOejMxixS0HhXhI64hIZl7tCy4lAnDzEs+sJv
         agqXmXiwdiQQfSpQB478Zy+knIMw1HX2Lcc1Sivr8VyuhDKGInNhTyNILcuvZ5R7DSbz
         LzHQ==
X-Gm-Message-State: AOJu0Yxa7t71rHbXeTKl5x2PIIywBMCnFuwDfKpbGkVEMkCSNRxWOfSO
	1y3xNNwAbcoGEEcC395EY37O63AxVjtg7HzKS2E=
X-Google-Smtp-Source: AGHT+IF0JEJtv3lXOSBpp7k6Ui8JQJzlQpeFvpphvtuqmX1QDijDXjMhnbmEt8rX4HxdQPO3ZQ1GaFHhFCczGpzMt8E=
X-Received: by 2002:a19:645a:0:b0:50e:314c:76da with SMTP id
 b26-20020a19645a000000b0050e314c76damr917951lfj.82.1702888914512; Mon, 18 Dec
 2023 00:41:54 -0800 (PST)
MIME-Version: 1.0
References: <CANNYZj8Up+UhiQo96T5OMxp+seYj6d8VyAGeF4vCCTj7mt764g@mail.gmail.com>
 <20231218061542.1845279-1-mingli.yu@windriver.com>
In-Reply-To: <20231218061542.1845279-1-mingli.yu@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 18 Dec 2023 09:41:43 +0100
Message-ID: <CANNYZj_DszK94DujKJ_a52HsAhW92nP0eVtitfuKueKeMNQ3QA@mail.gmail.com>
Subject: Re: [PATCH v2] python3-license-expression: Fix the ptest failure
To: mingli.yu@windriver.com
Cc: openembedded-core@lists.openembedded.org, 
	Ross Burton <ross.burton@arm.com>, Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 08:42:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192611

Wait. There were two specific review requests, and both remain
unanswered. You are just resending the patch, and that is not
acceptable.

- (from Ross) can we use pytest =E2=80=94automake instead of unreadable
sed/awk monster expression?
- (from me) is ptest returning a non-zero error code when it fails
like the commit says? If it does, why isn't the failure seen when
running -c testimage, or in the autobuilder which does that?

Please do check these first, and please do pay attention to what people ask=
.

Alex



On Mon, 18 Dec 2023 at 07:15, <mingli.yu@windriver.com> wrote:
>
> From: Mingli Yu <mingli.yu@windriver.com>
>
> Fix the below ptest failure:
>  self =3D <test_skeleton_codestyle.BaseTests testMethod=3Dtest_skeleton_c=
odestyle>
>  def test_skeleton_codestyle(self):
>  """
>  This test shouldn't run in proliferated repositories.
>  """
>  setup_cfg =3D configparser.ConfigParser()
>  setup_cfg.read("setup.cfg")
>  > if setup_cfg["metadata"]["name"] !=3D "skeleton":
>  tests/test_skeleton_codestyle.py:22:
>  self =3D <configparser.ConfigParser object at 0x7fd87cf55110>, key =3D '=
metadata'
>  def _getitem_(self, key):
>  if key !=3D self.default_section and not self.has_section(key):
>  > raise KeyError(key)
>  E KeyError: 'metadata'
>
> After the patch:
>  # ./run-ptest
>  [snip]
>  PASS: tests/test_license_expression.py::LicensingValidateTest::test_vali=
dation_bad_syntax
>  PASS: tests/test_license_expression.py::LicensingValidateTest::test_vali=
dation_exception_as_regular_key
>  PASS: tests/test_license_expression.py::LicensingValidateTest::test_vali=
dation_exception_with_choice
>  PASS: tests/test_license_expression.py::LicensingValidateTest::test_vali=
dation_invalid_license_exception
>  PASS: tests/test_license_expression.py::LicensingValidateTest::test_vali=
dation_invalid_license_exception_strict_false
>  PASS: tests/test_license_expression.py::LicensingValidateTest::test_vali=
dation_invalid_license_key
>  PASS: tests/test_license_expression.py::UtilTest::test_build_licensing
>  PASS: tests/test_license_expression.py::UtilTest::test_build_spdx_licens=
ing
>  PASS: tests/test_license_expression.py::UtilTest::test_get_license_key_i=
nfo
>  PASS: tests/test_license_expression.py::UtilTest::test_get_license_key_i=
nfo_vendored
>  PASS: tests/test_license_expression.py::CombineExpressionTest::test_comb=
ine_expressions_with_duplicated_elements
>  PASS: tests/test_license_expression.py::CombineExpressionTest::test_comb=
ine_expressions_with_empty_input
>  PASS: tests/test_license_expression.py::CombineExpressionTest::test_comb=
ine_expressions_with_or_relationship
>  PASS: tests/test_license_expression.py::CombineExpressionTest::test_comb=
ine_expressions_with_regular
>  PASS: tests/test_skeleton_codestyle.py::BaseTests::test_skeleton_codesty=
le
>
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D 175 passed in 10.36s =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  .../python/python3-license-expression/run-ptest             | 6 +++++-
>  .../python/python3-license-expression_30.1.1.bb             | 1 +
>  2 files changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/python/python3-license-expression/run-=
ptest b/meta/recipes-devtools/python/python3-license-expression/run-ptest
> index 5cec711696..07e2dd17ee 100644
> --- a/meta/recipes-devtools/python/python3-license-expression/run-ptest
> +++ b/meta/recipes-devtools/python/python3-license-expression/run-ptest
> @@ -1,3 +1,7 @@
>  #!/bin/sh
>
> -pytest
> +rm -rf output.log
> +pytest -o log_cli=3Dtrue -o log_cli_level=3DINFO > output.log 2>&1
> +exitcode=3D$?
> +cat output.log | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -=
e 's/FAILED/FAIL/g'|sed -e 's/SKIPED/SKIP/g'| awk '{if ($NF=3D=3D"PASS" || =
$NF=3D=3D"FAIL" || $NF=3D=3D"SKIP" || $NF=3D=3D"XFAIL" || $NF=3D=3D"XPASS")=
{printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=3D=3D"PASS" || $NF=
=3D=3D"FAIL" || $NF=3D=3D"SKIP" || $NF=3D=3D"XFAIL" || $NF=3D=3D"XPASS") {$=
NF=3D"";print $0}else{print}}'
> +exit $exitcode
> diff --git a/meta/recipes-devtools/python/python3-license-expression_30.1=
.1.bb b/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb
> index 31fb88d6e5..5d3923d487 100644
> --- a/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb
> +++ b/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb
> @@ -33,4 +33,5 @@ do_install_ptest() {
>      install -d ${D}${PTEST_PATH}/src
>      cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
>      cp -rf ${S}/src/* ${D}${PTEST_PATH}/src/
> +    cp -rf ${S}/setup.cfg ${D}${PTEST_PATH}/
>  }
> --
> 2.25.1
>

