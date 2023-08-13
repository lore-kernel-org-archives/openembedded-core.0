Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50D81C001DE
	for <webhook@archiver.kernel.org>; Sun, 13 Aug 2023 14:53:57 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.86503.1691938432632093130
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Aug 2023 07:53:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gRzy4dh2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-3fe4cdb727cso36152405e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 07:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1691938431; x=1692543231;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0jB78PlP9/6rknH2wcwwbqu5IWTWcXqhWzRHzI4B2Dc=;
        b=gRzy4dh2o9V1AKSKkbqBMInplIHTt5mX7xoypbL2qVtNcu55cIIhW0THpeB34JBbMb
         sVZSvs67UXUgLR+uXnWp9li/bQB7atljUUiIBLrRIlimG98JjvhK1zBUJwWiYu16fXZY
         7YAku1Ojd+8U/7pk2WVTb8sfC/3NdjufAyRGA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691938431; x=1692543231;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0jB78PlP9/6rknH2wcwwbqu5IWTWcXqhWzRHzI4B2Dc=;
        b=K989PexK9x6N17hA6INfZu+I2560T3Bw8ULdl8+O3I/jdOEoP+p1+bFg6ehxGUqGet
         xvAMxHXuSo8xB/zUI5AiQAwOiEEpUliu5DCss+PPJOecMC+AV77LK5pHfzQ3YJFXGVex
         oQuxiIXIxbVkkQgGSin6CQiJLK3aLZBswwVxO4kUrctNS58bi+No6GtRmTHBG/nenf33
         jfu6xDb1eURnWSImOSFPD6uRNCerqoQfffbmhAOmVOLQN1g2DuHXfpqKTMxcHQhAqH07
         ottWOiH4sgPymeC32gCLOVMbwr2tQMbaeV8vdBVwgcPBWsTq7lJmyNH5toC90oPB7G3I
         C1kw==
X-Gm-Message-State: AOJu0YxZ3rNYhTgcgw5/7pfjOngOW5UdwE2w1BgDQ+LCEi3+BiWoCqAK
	FBuzjHPqq7PWhyLZ9L0acpDxvg==
X-Google-Smtp-Source: AGHT+IH8dIm1biUc0Zq00U4IuqS1/zkMLW6ZAym0cQk93z2JarzeR0Tl3e1G53f+B6F/EtsmjFuetA==
X-Received: by 2002:a5d:618e:0:b0:317:6b0d:1b1 with SMTP id j14-20020a5d618e000000b003176b0d01b1mr5554491wru.4.1691938430847;
        Sun, 13 Aug 2023 07:53:50 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:17a:7286:2cf2:8a86? ([2001:8b0:aba:5f3c:17a:7286:2cf2:8a86])
        by smtp.gmail.com with ESMTPSA id u2-20020a05600c210200b003fe1afb99a9sm11347578wml.11.2023.08.13.07.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Aug 2023 07:53:50 -0700 (PDT)
Message-ID: <89d5c672b989d1ac30a10093c89227da182748e3.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC][PATCHV2 0/4] Introduction of cargo-c class and
 recipe
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?Fr=E9d=E9ric?= Martinsons <frederic.martinsons@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 13 Aug 2023 15:53:49 +0100
In-Reply-To: <177AF35A822C5F89.12117@lists.openembedded.org>
References: <cover.1691914589.git.frederic.martinsons@gmail.com>
	 <c4d2d924272d180ed88076e61dc59abc71d227f0.camel@linuxfoundation.org>
	 <CA+cAkeptfJVB=EzEm46898iXjnNodr7Ct9TzQ7FycOkCkiA0_Q@mail.gmail.com>
	 <177AED879B83B027.8497@lists.openembedded.org>
	 <177AF35A822C5F89.12117@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 14:53:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185886

On Sun, 2023-08-13 at 14:09 +0100, Richard Purdie via
lists.openembedded.org wrote:
> On Sun, 2023-08-13 at 12:22 +0100, Richard Purdie via
> lists.openembedded.org wrote:
> > On Sun, 2023-08-13 at 12:48 +0200, Fr=C3=A9d=C3=A9ric Martinsons wrote:
> > >=20
> > >=20
> > > Le dim. 13 ao=C3=BBt 2023, 12:23, Richard Purdie
> > > <richard.purdie@linuxfoundation.org> a =C3=A9crit=C2=A0:
> > > > On Sun, 2023-08-13 at 10:23 +0200, Frederic Martinsons wrote:
> > > > > From: Frederic Martinsons <frederic.martinsons@gmail.com>
> > > > >=20
> > > > > This is an RFC for introducing a new class and recipes that
> > > > > help building C-ABI compatible header and library around
> > > > > rust code.
> > > > >=20
> > > > > The third patch add examples and test to demonstrate
> > > > > the usage and the good working of this use case.
> > > > >=20
> > > > > Test have been passed with the following in local.conf:
> > > > >=20
> > > > > CORE_IMAGE_EXTRA_INSTALL:append =3D " openssh-sshd openssh-scp
> > > > > cargo rust rust-c-lib-example-bin"
> > > > > IMAGE_CLASSES +=3D "testimage"
> > > > > TEST_SUITES =3D "ping ssh rust"
> > > > > # To use slirp option in testimage.bbclass
> > > > > TEST_RUNQEMUPARAMS =3D "slirp"
> > > > > TEST_SERVER_IP =3D "127.0.0.1"
> > > > > QEMU_USE_SLIRP =3D "1"
> > > >=20
> > > > In testing it showed:
> > > >=20
> > > > stdio: WARNING: cargo-c-0.9.18-r0 do_recipe_qa: QA Issue: Recipe
> > > > cargo-c in /home/pokybuild/yocto-worker/a-full/build/meta/recipes-
> > > > devtools/rust/cargo-c_0.9.18.bb does not contain a SUMMARY. Please
> > > > add an entry. [missing-metadata]
> > > > stdio: WARNING: cargo-c-native-0.9.18-r0 do_recipe_qa: QA Issue:
> > > > Recipe cargo-c in /home/pokybuild/yocto-worker/a-
> > > > full/build/meta/recipes-devtools/rust/cargo-c_0.9.18.bb does not
> > > > contain a SUMMARY. Please add an entry. [missing-metadata]
> > > > stdio: WARNING: nativesdk-cargo-c-0.9.18-r0 do_recipe_qa: QA Issue:
> > > > Recipe cargo-c in /home/pokybuild/yocto-worker/a-
> > > > full/build/meta/recipes-devtools/rust/cargo-c_0.9.18.bb does not
> > > > contain a SUMMARY. Please add an entry. [missing-metadata]
> > >=20
> > > Thanks Richard, will take care of that soon.=C2=A0
> > >=20
> > > Can you tell me what commands do you run to have that sanity check?
> > > It will avoid me to do the same mistake next time I'll add a recipe.=
=C2=A0
> >=20
> > It should just show up building the recipe (e.g. "bitbake cargo-c")?
> >=20
> > There are further build failures:
> >=20
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/101/builds/6361=
/steps/14/logs/stdio
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/110/builds/6484=
/steps/14/logs/stdio
> >=20
> > and the build isn't finished yet so Is suspect there will be more.
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/5606/st=
eps/15/logs/stdio
>=20
> not all of those failures are your patches but:
>=20
> 2023-08-13 12:38:57,894 - oe-selftest - INFO - =3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> 2023-08-13 12:38:57,894 - oe-selftest - INFO - FAIL: distrodata.Distrodat=
a.test_maintainers (subunit.RemotedTestCase)
> 2023-08-13 12:38:57,894 - oe-selftest - INFO - --------------------------=
--------------------------------------------
> 2023-08-13 12:38:57,894 - oe-selftest - INFO - testtools.testresult.real.=
_StringException: Traceback (most recent call last):
>   File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/lib/oe=
qa/selftest/cases/distrodata.py", line 115, in test_maintainers
>     self.fail("""
>   File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/buildtools/=
sysroots/x86_64-pokysdk-linux/usr/lib/python3.11/unittest/case.py", line 70=
3, in fail
>     raise self.failureException(msg)
> AssertionError:=20
> Unable to find recipes for the following entries in maintainers.inc:
> rust-c-lib-example
> rust-c-lib-example-bin
>=20
>=20
> and this:
>=20
> Traceback (most recent call last):
>   File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/lib/oe=
qa/core/decorator/__init__.py", line 35, in wrapped_f
>     return func(*args, **kwargs)
>            ^^^^^^^^^^^^^^^^^^^^^
>   File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/lib/oe=
qa/core/decorator/__init__.py", line 35, in wrapped_f
>     return func(*args, **kwargs)
>            ^^^^^^^^^^^^^^^^^^^^^
>   File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/lib/oe=
qa/runtime/cases/rust.py", line 31, in test_rust_compile
>     self.assertEqual(status, 0, msg=3Dmsg)
> AssertionError: 127 !=3D 0 : rust compile failed, output: sh: rustc: not =
found
>=20
>=20
> probably is are, so 2 of the 6 failures. The other 4 are "mine" :/.
>=20

and a reproducibility failure:

https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/3355/ste=
ps/13/logs/stdio

which leads to:

http://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20230813-z_b2j3h=
a/packages/diff-html/

Cheers,

Richard


