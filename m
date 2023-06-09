Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65626C7EE25
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 07:19:47 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.7748.1686295183419172821
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jun 2023 00:19:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=bT/bUVaQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-30e53cacc10so973004f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 00:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1686295182; x=1688887182;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VZAMZll7PooLtiS/f8h7PQHHGFeX4zt78DYVGpnCc0E=;
        b=bT/bUVaQxSMIc6w7MS/Rn1kETr5YKc2pWtnCoWfzVotGHkFJLOFEiH3NKuDeVNl/gk
         +3PpJRumzoynLXornv+4U1j8xevG0aV1jt3WTkqREuB1DB+ciqGn3Hmyy6DgBxOtzFp3
         MXzJ/scyihQcKZeqNFYULZcpmFyW2qXJO9hXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686295182; x=1688887182;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VZAMZll7PooLtiS/f8h7PQHHGFeX4zt78DYVGpnCc0E=;
        b=lxUlwoiYsp8+rfDc9y0Czc1k5znXRSSplZXua9dxmIykHr2TKMuPNeA8eLFPS9jRBL
         mqvLXS8KHHxb0Lo+s2BB2IDj5qbVFH3BqIcoxtVJunRkifuVgemIE4/4/ba3lgDtQEH2
         86XmWVLWREzShXd1RJ4k8rYFHRDbN0IOjOEy0YIdYXipIhv2PIq4/N+uZ4J3sGapZUwQ
         NQPlxsEywa1p1hXulPDX/LLbSNbx76E9suQUSkz3XbtVqdY99L+KJm1strMj7O/YDIHX
         AfkfpT5HfK/k++T424xnQW9T6AG+UL2mK48yL+ovbRNuZgN/MHDf4vgK6TcOx+aCNv5O
         8C0A==
X-Gm-Message-State: AC+VfDzcIGttHe9mvgGAuNWppj7ck7cV+Yu/OFUSrhlxNhaqzHG4bS3x
	yeh9FVDUm0kyRxJpPo7ITAIAmg==
X-Google-Smtp-Source: ACHHUZ4kexHMmSbrBDd8Se9Zfqxopu5kPD1YJiguEXjJTK75BHntKzgYZlo/dnjXXws1TAxTlqvPSA==
X-Received: by 2002:a5d:6105:0:b0:303:2583:9635 with SMTP id v5-20020a5d6105000000b0030325839635mr247115wrt.20.1686295181809;
        Fri, 09 Jun 2023 00:19:41 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:d212:ac52:2ca3:dd2f? ([2001:8b0:aba:5f3c:d212:ac52:2ca3:dd2f])
        by smtp.gmail.com with ESMTPSA id k17-20020a5d4291000000b003047ea78b42sm3622620wrq.43.2023.06.09.00.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 00:19:41 -0700 (PDT)
Message-ID: <b57e0650e30de28f9f5b9c4cd375b197f45b8467.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] qemux86*: TEST only set preferred
 provider to linux-yocto-dev
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: bruce.ashfield@gmail.com
Cc: openembedded-core@lists.openembedded.org
Date: Fri, 09 Jun 2023 08:19:40 +0100
In-Reply-To: <1766EC6ECDD1A1C4.6460@lists.openembedded.org>
References: <20230608193901.363242-1-bruce.ashfield@gmail.com>
	 <20230608193901.363242-2-bruce.ashfield@gmail.com>
	 <1766EC6ECDD1A1C4.6460@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 07:19:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182540

On Fri, 2023-06-09 at 08:17 +0100, Richard Purdie via
lists.openembedded.org wrote:
> On Thu, 2023-06-08 at 19:39 +0000, bruce.ashfield@gmail.com wrote:
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >=20
> > We are seeing intermittent boot hangs on x86. To try and determine
> > if this is a 6.1-stable only issue, set the prferred provider for
> > qemux86 to linux-yocto-dev.
> >=20
> > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > ---
> >  meta/conf/machine/include/qemu.inc | 2 ++
> >  1 file changed, 2 insertions(+)
> >=20
> > diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/inc=
lude/qemu.inc
> > index 0d71bcbbad..121e8474c1 100644
> > --- a/meta/conf/machine/include/qemu.inc
> > +++ b/meta/conf/machine/include/qemu.inc
> > @@ -21,6 +21,8 @@ RDEPENDS:${KERNEL_PACKAGE_NAME}-base =3D ""
> > =20
> >  # Use a common kernel recipe for all QEMU machines
> >  PREFERRED_PROVIDER_virtual/kernel ??=3D "linux-yocto"
> > +PREFERRED_PROVIDER_virtual/kernel:qemux86 =3D "linux-yocto-dev"
> > +PREFERRED_PROVIDER_virtual/kernel:qemux86-64 =3D "linux-yocto-dev"
> > =20
> >  EXTRA_IMAGEDEPENDS +=3D "qemu-system-native qemu-helper-native:do_addt=
o_recipe_sysroot"
> > =20
>=20
> Unfortunately this has other issues:
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/7276/st=
eps/13/logs/stdio
>=20
> Traceback (most recent call last):
>   File "/home/pokybuild/yocto-worker/musl-qemux86-64/build/meta/lib/oeqa/=
core/decorator/__init__.py", line 35, in wrapped_f
>     return func(*args, **kwargs)
>            ^^^^^^^^^^^^^^^^^^^^^
>   File "/home/pokybuild/yocto-worker/musl-qemux86-64/build/meta/lib/oeqa/=
core/decorator/__init__.py", line 35, in wrapped_f
>     return func(*args, **kwargs)
>            ^^^^^^^^^^^^^^^^^^^^^
>   File "/home/pokybuild/yocto-worker/musl-qemux86-64/build/meta/lib/oeqa/=
core/decorator/__init__.py", line 35, in wrapped_f
>     return func(*args, **kwargs)
>            ^^^^^^^^^^^^^^^^^^^^^
>   [Previous line repeated 2 more times]
>   File "/home/pokybuild/yocto-worker/musl-qemux86-64/build/meta/lib/oeqa/=
runtime/cases/kernelmodule.py", line 48, in test_kernel_module
>     self.assertEqual(status, 0, msg=3D'\n'.join([cmd, output]))
> AssertionError: 1 !=3D 0 : cd /tmp && insmod hellomod.ko
> insmod: ERROR: could not insert module hellomod.ko: Invalid module format
>=20
> But also:
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/109/builds/6105/s=
teps/13/logs/stdio
>=20
> which shows ping failures, as if the networking isn't working. I
> checked the boot logs and the kernel is booting but for some reason
> networking doesn't become live and ping fails.
>=20
> I can see messages saying the "IP-Config: Complete:" with appropriate
> network config in the kernel boot log so it is all the more puzzling:
>=20
> https://autobuilder.yocto.io/pub/failed-builds-data/qemu_boot_log.2023060=
9064146
>=20
> The ping failures repeated in many other targets in that build.

There is also a perf buildpath warning:

https://autobuilder.yoctoproject.org/typhoon/#/builders/109/builds/6105/ste=
ps/12/logs/warnings

which we'll likely have to fix at some point.

Cheers,

Richard

