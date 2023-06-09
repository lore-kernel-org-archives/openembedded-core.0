Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3281BC7EE25
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 07:17:57 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.7656.1686295070698590105
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jun 2023 00:17:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=VU1nCfKk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-3f732d37d7cso13809305e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 00:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1686295069; x=1688887069;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=z0WLextVTsuazHyVCzvN+Ro1XHtt3DIBBMNQmsvopGA=;
        b=VU1nCfKk3h0pjpkfvSZEpOuBWlgywEgVTn+IsPxHJLu26lUq7FTN4Vl1Kx3AZzsSW1
         woDNsoaZdPO8yoQNESQ8qF20GNpcfsJSWMZ15RkO5DWzjpofFRHg/NpoOfPAOdIpQdO9
         nVFIefgX9iCiWjotbj561MpEjHakp1QG8uAXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686295069; x=1688887069;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z0WLextVTsuazHyVCzvN+Ro1XHtt3DIBBMNQmsvopGA=;
        b=OZA4QiIKt2BkmNmIzaiPL/X8kqRaItKanDC0o09YpzQDyyoZm3bYjjUpHDtd1F3pAx
         7NzWPyxKRbtNSS9FPWxF+iq2aNpUx3ovadWvyRfnIZ1a+rxLhasSSrH+IKyGZkAvPO73
         Rqu7DceHfRtxb8sdhrXs9esPxYGJ3riDeGLgVVVOfQfoU7bRG5sG+i+jcyo4KfKG2Xyk
         Nu7W3u9Oy3zLrDm0mDa8virzs4Lj3kGwNxmgx18cApkmbGrwtoWnhGIKcxc3ybmh8XJL
         TDWa9arHtp4TRwsgTPIrD7Ln2jJDhM8dZXo5pExfb4mk9w7S15uBd1MMIx3x2dFppygI
         G2Fw==
X-Gm-Message-State: AC+VfDyOppdCF6enMiEJNrjv0DhCG5hwCuQuYAYjrnVXTnLj0FMDhVMf
	ovsK1Wf3e5krRlxQXbMIMGcQMQ==
X-Google-Smtp-Source: ACHHUZ6jtI067mbm+uyBjliQMwMkV4v3qeO0FGN1cAHIGKVM5oU9jqHHdNuqqSArCdasg3u+EvPM1w==
X-Received: by 2002:a05:600c:b41:b0:3f7:eadb:941d with SMTP id k1-20020a05600c0b4100b003f7eadb941dmr470201wmr.19.1686295069094;
        Fri, 09 Jun 2023 00:17:49 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:d212:ac52:2ca3:dd2f? ([2001:8b0:aba:5f3c:d212:ac52:2ca3:dd2f])
        by smtp.gmail.com with ESMTPSA id 7-20020a05600c028700b003f60a446fe5sm1707866wmk.29.2023.06.09.00.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 00:17:48 -0700 (PDT)
Message-ID: <10ff3805df114cfd9f217a8bde4d78adc65da89e.camel@linuxfoundation.org>
Subject: Re: [PATCH 2/2] qemux86*: TEST only set preferred provider to
 linux-yocto-dev
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: bruce.ashfield@gmail.com
Cc: openembedded-core@lists.openembedded.org
Date: Fri, 09 Jun 2023 08:17:47 +0100
In-Reply-To: <20230608193901.363242-2-bruce.ashfield@gmail.com>
References: <20230608193901.363242-1-bruce.ashfield@gmail.com>
	 <20230608193901.363242-2-bruce.ashfield@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 07:17:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182539

On Thu, 2023-06-08 at 19:39 +0000, bruce.ashfield@gmail.com wrote:
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>=20
> We are seeing intermittent boot hangs on x86. To try and determine
> if this is a 6.1-stable only issue, set the prferred provider for
> qemux86 to linux-yocto-dev.
>=20
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  meta/conf/machine/include/qemu.inc | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/inclu=
de/qemu.inc
> index 0d71bcbbad..121e8474c1 100644
> --- a/meta/conf/machine/include/qemu.inc
> +++ b/meta/conf/machine/include/qemu.inc
> @@ -21,6 +21,8 @@ RDEPENDS:${KERNEL_PACKAGE_NAME}-base =3D ""
> =20
>  # Use a common kernel recipe for all QEMU machines
>  PREFERRED_PROVIDER_virtual/kernel ??=3D "linux-yocto"
> +PREFERRED_PROVIDER_virtual/kernel:qemux86 =3D "linux-yocto-dev"
> +PREFERRED_PROVIDER_virtual/kernel:qemux86-64 =3D "linux-yocto-dev"
> =20
>  EXTRA_IMAGEDEPENDS +=3D "qemu-system-native qemu-helper-native:do_addto_=
recipe_sysroot"
> =20

Unfortunately this has other issues:

https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/7276/step=
s/13/logs/stdio

Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/musl-qemux86-64/build/meta/lib/oeqa/co=
re/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^
  File "/home/pokybuild/yocto-worker/musl-qemux86-64/build/meta/lib/oeqa/co=
re/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^
  File "/home/pokybuild/yocto-worker/musl-qemux86-64/build/meta/lib/oeqa/co=
re/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^
  [Previous line repeated 2 more times]
  File "/home/pokybuild/yocto-worker/musl-qemux86-64/build/meta/lib/oeqa/ru=
ntime/cases/kernelmodule.py", line 48, in test_kernel_module
    self.assertEqual(status, 0, msg=3D'\n'.join([cmd, output]))
AssertionError: 1 !=3D 0 : cd /tmp && insmod hellomod.ko
insmod: ERROR: could not insert module hellomod.ko: Invalid module format

But also:

https://autobuilder.yoctoproject.org/typhoon/#/builders/109/builds/6105/ste=
ps/13/logs/stdio

which shows ping failures, as if the networking isn't working. I
checked the boot logs and the kernel is booting but for some reason
networking doesn't become live and ping fails.

I can see messages saying the "IP-Config: Complete:" with appropriate
network config in the kernel boot log so it is all the more puzzling:

https://autobuilder.yocto.io/pub/failed-builds-data/qemu_boot_log.202306090=
64146

The ping failures repeated in many other targets in that build.

Cheers,

Richard



