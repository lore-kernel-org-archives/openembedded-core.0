Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8D6CEB64DD
	for <webhook@archiver.kernel.org>; Sun, 13 Aug 2023 13:09:46 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.84759.1691932179607039206
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Aug 2023 06:09:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MXIkeCOa;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-318015ade49so3205318f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 06:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1691932178; x=1692536978;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Cm1xnxdHPxggQY5OetV3gYE9bMAER/7raRKiEL9bRCU=;
        b=MXIkeCOakC+UWtdy2QrKJueYqxYu9/A6QmBFXrkG/Llw4xJbWwKbTp4vZSWaHopoe0
         qxE0ldR2YCX9FhZEsltw3OimQ7Z5Qf/qWDkzODboG1gK2TEto+5lCOQpKDT1kC2aoWuo
         S8Pbp5RQzesBV6nPYPEKNuPWogWANxnSOdD+s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691932178; x=1692536978;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Cm1xnxdHPxggQY5OetV3gYE9bMAER/7raRKiEL9bRCU=;
        b=OWlA2XZBBa944mjzMiRFNXKBGRsPdAS/1DzuD9N5JVEHzZ9qS3i/drBiOtQSPkwmpt
         5LuW/2pYMPX2pmZBnGgknt3XPlLgvAQ0dNWAbEIUNr97IQ5+UQPXZ2TjVIaxbL2cu2sK
         f5lVPLfvZpgMYPFsrLEeFiBvo74MnQw8fNbFDMRHhm1RBTZN/66OyOdwU+HbjUBaVXBR
         Z8ozbujRcg4ggxGsxiG7IhIKyaRafBf06isoe6CaTkBLZx7RGZUT9OtpoSj1q4NnY8dH
         ynK1NwmfZESxmAteu9Z3mmWihoiDdoREfQNKXl9voFkCofbmCiLHZKxqJcEr0fLce23o
         N7tg==
X-Gm-Message-State: AOJu0YymQfyqN7rweiio25g6gX75ELt5k+hrPAZdgvYCCbt1tFEqqbzm
	gn+nq/GKZxrh7D+bhcdbZlgsZA==
X-Google-Smtp-Source: AGHT+IHMGZmEslUgH/cWwprHPA767Cz3rEWlYGI06tf+VW1Mb2zWK/siQngwIqMk7TP5VZVPxJeAdQ==
X-Received: by 2002:adf:fd50:0:b0:311:1dba:ca65 with SMTP id h16-20020adffd50000000b003111dbaca65mr4739854wrs.51.1691932177870;
        Sun, 13 Aug 2023 06:09:37 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:17a:7286:2cf2:8a86? ([2001:8b0:aba:5f3c:17a:7286:2cf2:8a86])
        by smtp.gmail.com with ESMTPSA id k13-20020a5d428d000000b0030ada01ca78sm11471110wrq.10.2023.08.13.06.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Aug 2023 06:09:37 -0700 (PDT)
Message-ID: <63c94494ab57f28cab43c4a856863d07fa7eb1b3.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC][PATCHV2 0/4] Introduction of cargo-c class and
 recipe
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?Fr=E9d=E9ric?= Martinsons <frederic.martinsons@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 13 Aug 2023 14:09:36 +0100
In-Reply-To: <177AED879B83B027.8497@lists.openembedded.org>
References: <cover.1691914589.git.frederic.martinsons@gmail.com>
	 <c4d2d924272d180ed88076e61dc59abc71d227f0.camel@linuxfoundation.org>
	 <CA+cAkeptfJVB=EzEm46898iXjnNodr7Ct9TzQ7FycOkCkiA0_Q@mail.gmail.com>
	 <177AED879B83B027.8497@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 13:09:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185883

On Sun, 2023-08-13 at 12:22 +0100, Richard Purdie via
lists.openembedded.org wrote:
> On Sun, 2023-08-13 at 12:48 +0200, Fr=C3=A9d=C3=A9ric Martinsons wrote:
> >=20
> >=20
> > Le dim. 13 ao=C3=BBt 2023, 12:23, Richard Purdie
> > <richard.purdie@linuxfoundation.org> a =C3=A9crit=C2=A0:
> > > On Sun, 2023-08-13 at 10:23 +0200, Frederic Martinsons wrote:
> > > > From: Frederic Martinsons <frederic.martinsons@gmail.com>
> > > >=20
> > > > This is an RFC for introducing a new class and recipes that
> > > > help building C-ABI compatible header and library around
> > > > rust code.
> > > >=20
> > > > The third patch add examples and test to demonstrate
> > > > the usage and the good working of this use case.
> > > >=20
> > > > Test have been passed with the following in local.conf:
> > > >=20
> > > > CORE_IMAGE_EXTRA_INSTALL:append =3D " openssh-sshd openssh-scp
> > > > cargo rust rust-c-lib-example-bin"
> > > > IMAGE_CLASSES +=3D "testimage"
> > > > TEST_SUITES =3D "ping ssh rust"
> > > > # To use slirp option in testimage.bbclass
> > > > TEST_RUNQEMUPARAMS =3D "slirp"
> > > > TEST_SERVER_IP =3D "127.0.0.1"
> > > > QEMU_USE_SLIRP =3D "1"
> > >=20
> > > In testing it showed:
> > >=20
> > > stdio: WARNING: cargo-c-0.9.18-r0 do_recipe_qa: QA Issue: Recipe
> > > cargo-c in /home/pokybuild/yocto-worker/a-full/build/meta/recipes-
> > > devtools/rust/cargo-c_0.9.18.bb does not contain a SUMMARY. Please
> > > add an entry. [missing-metadata]
> > > stdio: WARNING: cargo-c-native-0.9.18-r0 do_recipe_qa: QA Issue:
> > > Recipe cargo-c in /home/pokybuild/yocto-worker/a-
> > > full/build/meta/recipes-devtools/rust/cargo-c_0.9.18.bb does not
> > > contain a SUMMARY. Please add an entry. [missing-metadata]
> > > stdio: WARNING: nativesdk-cargo-c-0.9.18-r0 do_recipe_qa: QA Issue:
> > > Recipe cargo-c in /home/pokybuild/yocto-worker/a-
> > > full/build/meta/recipes-devtools/rust/cargo-c_0.9.18.bb does not
> > > contain a SUMMARY. Please add an entry. [missing-metadata]
> >=20
> > Thanks Richard, will take care of that soon.=C2=A0
> >=20
> > Can you tell me what commands do you run to have that sanity check?
> > It will avoid me to do the same mistake next time I'll add a recipe.=C2=
=A0
>=20
> It should just show up building the recipe (e.g. "bitbake cargo-c")?
>=20
> There are further build failures:
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/101/builds/6361/s=
teps/14/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/110/builds/6484/s=
teps/14/logs/stdio
>=20
> and the build isn't finished yet so Is suspect there will be more.

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/5606/step=
s/15/logs/stdio

not all of those failures are your patches but:

2023-08-13 12:38:57,894 - oe-selftest - INFO - =3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
2023-08-13 12:38:57,894 - oe-selftest - INFO - FAIL: distrodata.Distrodata.=
test_maintainers (subunit.RemotedTestCase)
2023-08-13 12:38:57,894 - oe-selftest - INFO - ----------------------------=
------------------------------------------
2023-08-13 12:38:57,894 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/lib/oeqa=
/selftest/cases/distrodata.py", line 115, in test_maintainers
    self.fail("""
  File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/buildtools/sy=
sroots/x86_64-pokysdk-linux/usr/lib/python3.11/unittest/case.py", line 703,=
 in fail
    raise self.failureException(msg)
AssertionError:=20
Unable to find recipes for the following entries in maintainers.inc:
rust-c-lib-example
rust-c-lib-example-bin


and this:

Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/lib/oeqa=
/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^
  File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/lib/oeqa=
/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^
  File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/lib/oeqa=
/runtime/cases/rust.py", line 31, in test_rust_compile
    self.assertEqual(status, 0, msg=3Dmsg)
AssertionError: 127 !=3D 0 : rust compile failed, output: sh: rustc: not fo=
und


probably is are, so 2 of the 6 failures. The other 4 are "mine" :/.

Cheers,

Richard


