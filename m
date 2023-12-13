Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 002B2C4332F
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 16:39:43 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web10.40959.1702485579980785396
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Dec 2023 08:39:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hJ1DOuqb;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2cc3647bf06so11568961fa.2
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 08:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702485578; x=1703090378; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lnCJjdarLSYy+ivVwvccZvlzZAF6bdR6sVx7GPStJPY=;
        b=hJ1DOuqbJfnhjdBDcHinN31POzJIO0SgLtosBV0m96ACXu1N3wSx6vKhY62dyihXb9
         dtNHYDPpKUo3ZDZQMxX73lthkXfJb8UPY+JKA+kzsej9zrJkJoSNFflGvtbBTN/y7Azr
         aiY3ii7kV9aI2K6FinM4edm3GoYS0+lrkMWHh3axELh1nly5sfcnGCUrBsAs3ljkteqD
         C50ikIMEDgzSMCuOPO2I1QkIWF5Jg+itenkJ4L0JGaEO7rGlt/V6em8Y8gLlZqEcKI/P
         9mPP7jaMz+QTUcjPyGGVx6mbmuSNGybPUW+ZbojQTAqwM0rauMtZlHx1Z3Sicjj8Vjx7
         V4AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702485578; x=1703090378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lnCJjdarLSYy+ivVwvccZvlzZAF6bdR6sVx7GPStJPY=;
        b=rk1Wul9wGrjH2v8vsRr64LtwyYz6uxrp5PiAZqtekW+brMve6+kqoZSOolKNiJK6xg
         40x6lr1+SdZYccEbZTNBBqMvhkbIvJ7oGPZQQAH+aDdAhDhY7tAF2nzSOvolh48KwgBI
         BtuYekluoyHkgqbwcUIzFf+S4G3EgYoJxfGGJ0+7DjxxDufLtHyzLS95G88GAtuF3bhH
         xZNF3Al5PYWfXMObcc1RalagKssLSVXY/wGELWCrgdrCQdaHzvmsWYnCUkACKdAL2YSn
         iEuNlP6iGA16LMbTe5tC5LsX0iywXeGeO00O/pqq01exot8RnpNxCw/e1cVF0mAiBEpv
         HQpA==
X-Gm-Message-State: AOJu0YxbgwkGS/kuI6OHt1lwCwd1QfwMjWebigMhTKNJ4PxgJNSzZq9S
	PktenRZdeXgvPgrezPEp4Edotjxm4ynQCnJC8dYjyQ7Z
X-Google-Smtp-Source: AGHT+IGUHca8esCyuOF04AyvA6ky67w4Q5tGNfVWmQnEoSGWEz/4wV2sQQU0X0zdQicnp4oqHCnPqFrSYXRUr7PoHM0=
X-Received: by 2002:a2e:860a:0:b0:2c9:d874:4b6f with SMTP id
 a10-20020a2e860a000000b002c9d8744b6fmr2546859lji.95.1702485578191; Wed, 13
 Dec 2023 08:39:38 -0800 (PST)
MIME-Version: 1.0
References: <20231213102129.618430-1-mingli.yu@windriver.com> <CANNYZj-gPhJLyOiMrPib6QqqHiWpcakvb_bOxZXcbw5=-CeFGQ@mail.gmail.com>
In-Reply-To: <CANNYZj-gPhJLyOiMrPib6QqqHiWpcakvb_bOxZXcbw5=-CeFGQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 13 Dec 2023 17:39:26 +0100
Message-ID: <CANNYZj_dMRQe9LfO3fnbRsgxBP5r24deRvTNoj-_U=mAK3bHqw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-license-expression: Fix the ptest failure
To: "Yu, Mingli" <mingli.yu@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 16:39:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192307

I see that run-ptest consists of a single pytest command; does that
command return a zero exit code even it fails?

Alex

On Wed, 13 Dec 2023 at 17:38, Alexander Kanavin <alex.kanavin@gmail.com> wr=
ote:
>
> Why isn't the ptest failure reported by the autobuilder? Shouldn't we
> first fix the ptest so that the failure is reported correctly, if it
> starts occurring again?
>
> Alex
>
> On Wed, 13 Dec 2023 at 11:21, Yu, Mingli <mingli.yu@eng.windriver.com> wr=
ote:
> >
> > From: Mingli Yu <mingli.yu@windriver.com>
> >
> > Fix the below ptest failure:
> >  self =3D <test_skeleton_codestyle.BaseTests testMethod=3Dtest_skeleton=
_codestyle>
> >  def test_skeleton_codestyle(self):
> >  """
> >  This test shouldn't run in proliferated repositories.
> >  """
> >  setup_cfg =3D configparser.ConfigParser()
> >  setup_cfg.read("setup.cfg")
> >  > if setup_cfg["metadata"]["name"] !=3D "skeleton":
> >  tests/test_skeleton_codestyle.py:22:
> >  self =3D <configparser.ConfigParser object at 0x7fd87cf55110>, key =3D=
 'metadata'
> >  def _getitem_(self, key):
> >  if key !=3D self.default_section and not self.has_section(key):
> >  > raise KeyError(key)
> >  E KeyError: 'metadata'
> >
> > After the patch:
> >  # ./run-ptest
> >  [snip]
> >  PASS: tests/test_license_expression.py::LicensingValidateTest::test_va=
lidation_bad_syntax
> >  PASS: tests/test_license_expression.py::LicensingValidateTest::test_va=
lidation_exception_as_regular_key
> >  PASS: tests/test_license_expression.py::LicensingValidateTest::test_va=
lidation_exception_with_choice
> >  PASS: tests/test_license_expression.py::LicensingValidateTest::test_va=
lidation_invalid_license_exception
> >  PASS: tests/test_license_expression.py::LicensingValidateTest::test_va=
lidation_invalid_license_exception_strict_false
> >  PASS: tests/test_license_expression.py::LicensingValidateTest::test_va=
lidation_invalid_license_key
> >  PASS: tests/test_license_expression.py::UtilTest::test_build_licensing
> >  PASS: tests/test_license_expression.py::UtilTest::test_build_spdx_lice=
nsing
> >  PASS: tests/test_license_expression.py::UtilTest::test_get_license_key=
_info
> >  PASS: tests/test_license_expression.py::UtilTest::test_get_license_key=
_info_vendored
> >  PASS: tests/test_license_expression.py::CombineExpressionTest::test_co=
mbine_expressions_with_duplicated_elements
> >  PASS: tests/test_license_expression.py::CombineExpressionTest::test_co=
mbine_expressions_with_empty_input
> >  PASS: tests/test_license_expression.py::CombineExpressionTest::test_co=
mbine_expressions_with_or_relationship
> >  PASS: tests/test_license_expression.py::CombineExpressionTest::test_co=
mbine_expressions_with_regular
> >  PASS: tests/test_skeleton_codestyle.py::BaseTests::test_skeleton_codes=
tyle
> >
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D 175 passed in 10.36s =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> > ---
> >  .../python/python3-license-expression/run-ptest                 | 2 +-
> >  .../python/python3-license-expression_30.1.1.bb                 | 1 +
> >  2 files changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-devtools/python/python3-license-expression/ru=
n-ptest b/meta/recipes-devtools/python/python3-license-expression/run-ptest
> > index 5cec711696..3385d68939 100644
> > --- a/meta/recipes-devtools/python/python3-license-expression/run-ptest
> > +++ b/meta/recipes-devtools/python/python3-license-expression/run-ptest
> > @@ -1,3 +1,3 @@
> >  #!/bin/sh
> >
> > -pytest
> > +pytest -o log_cli=3Dtrue -o log_cli_level=3DINFO | sed -e 's/\[...%\]/=
/g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPED/SK=
IP/g'| awk '{if ($NF=3D=3D"PASS" || $NF=3D=3D"FAIL" || $NF=3D=3D"SKIP" || $=
NF=3D=3D"XFAIL" || $NF=3D=3D"XPASS"){printf "%s: %s\n", $NF, $0}else{print}=
}'| awk '{if ($NF=3D=3D"PASS" || $NF=3D=3D"FAIL" || $NF=3D=3D"SKIP" || $NF=
=3D=3D"XFAIL" || $NF=3D=3D"XPASS") {$NF=3D"";print $0}else{print}}'
> > diff --git a/meta/recipes-devtools/python/python3-license-expression_30=
.1.1.bb b/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb
> > index 31fb88d6e5..5d3923d487 100644
> > --- a/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb
> > +++ b/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb
> > @@ -33,4 +33,5 @@ do_install_ptest() {
> >      install -d ${D}${PTEST_PATH}/src
> >      cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> >      cp -rf ${S}/src/* ${D}${PTEST_PATH}/src/
> > +    cp -rf ${S}/setup.cfg ${D}${PTEST_PATH}/
> >  }
> > --
> > 2.25.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#192278): https://lists.openembedded.org/g/openembed=
ded-core/message/192278
> > Mute This Topic: https://lists.openembedded.org/mt/103146950/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

