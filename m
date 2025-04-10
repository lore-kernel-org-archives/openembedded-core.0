Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5880C369A6
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 12:47:40 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.33231.1744289250511840560
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Apr 2025 05:47:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Dn6VybCl;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43690d4605dso6299685e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 05:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1744289249; x=1744894049; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mAeQrpstQjMVyr+dZbFiOP6Il3oEBErV9k9vZEsA6AU=;
        b=Dn6VybCltqa3G0P8LokrMb+GlBJsbLBB9SWB0K+ga186maSE2P9+ztsjJU43p/7G8r
         FSyZtCoUvZSGlOy2PgbAT5WOSGHIaFRpIMfZAYNtXoaJtA/rhw4QTqWZ6YuaqtD/3Dec
         qH2r/hc+ngQhqPakpuTdEWZwmM2bsaUwioSNo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744289249; x=1744894049;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mAeQrpstQjMVyr+dZbFiOP6Il3oEBErV9k9vZEsA6AU=;
        b=a7Eu7Lp9UBsantMIo4DPpxyHgq03C88j/ubBVuh3XhOFyszkv885n5+Ol6WgI9ax6u
         Gl1ZyGwODIZ0//fQtCjuq9YYIEZOnYX1cJVI/0etKE/QvkI118Gaa8gr74yJhmBxUn7f
         idIGafzjErGZJ4rYVAEzrVh5FoIZ5xF+OCZuITay4V7NvU27Cm9LrKv2ez7o3ICyQzh3
         dU/i1LxeBKns99Rq/QNSB1Iw2+XoPNIJQS1EwMrGel/Jtx38YPIryUyGcsQ4MK4yCRV1
         FtHdEK6GBxTq0UrEgCPyAIJ6AV1I6LkyyI8ayFSvUbgNQa3R+qpws9kz0GrhX7r53mhe
         6SxA==
X-Forwarded-Encrypted: i=1; AJvYcCU8o/2XSZ3hXQtcky5zYusE+ojtuaW6QUR34+b7hNvZvXOyfEpq7T/g3ZKtwO1LTaYRWSqol05ijedNiQ5SfTrD/A==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzq6ZNwzaYaDKaSPrbL2XEmphn7iAF3seKCDBEkgzUl0gM78Qwr
	tk+o0kFV/2utudnLMYMPwsiJvNl69A57Nnw0kez7tEAN73yX0iWGKmUqEZhiBrvA9H7Lb9GyNSl
	c
X-Gm-Gg: ASbGncvKyOE7gb6qSuoOyHUCkl37NH9GrpIbBmmK35k61SLG2TULvuUyBguZVDgBbEl
	PCsIoEI5hJjaLks7vsc5hvXL2rTTv7ozPQQycptSI+Bb/fhbYkMrXfiZT3X3Wd9kXCOh/AFW0tp
	l8qi4nt0Zhumi1PWykyeBrZAZiMaYefRuTbQNVyVhBg5fbWhS24LksSpvFGUE8ViWRZZP5D6Oz9
	eZCYYwEg+VoRAewCfV45EahT1ryIfpXJiKDWt0ZT9/GTnSfDBj+m/kX+EP60m2VA/y1nH9/i3UO
	8OJUz5hx4oqdxofObB2666E60flydC6+8BB8fV9tJVFuVhBlNJJ9dzOQh8QtltVzBDxoQIt70bz
	RXAI7lMAdhihUoH1e8fzF4sxdTWKwhg==
X-Google-Smtp-Source: AGHT+IFMUKEiMo38BUF64EPnxUTw0d4Fnlufo6v7JIW6aQ/7NJydURHkVQYGhMDKvZ0R1s2YznKWyA==
X-Received: by 2002:a05:600c:1d8c:b0:43c:eea9:f45d with SMTP id 5b1f17b1804b1-43f34cdbfa9mr11060875e9.18.1744289248857;
        Thu, 10 Apr 2025 05:47:28 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ddb2:da8c:e063:58d6? ([2001:8b0:aba:5f3c:ddb2:da8c:e063:58d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2075fc8esm54645765e9.30.2025.04.10.05.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 05:47:28 -0700 (PDT)
Message-ID: <09bcaac6d79659b91e88e93b712145503a926f5a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3 05/11] core-image-initramfs-boot: don't
 install RRECOMMENDS to reduce size
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mikko.rapeli@linaro.org, openembedded-core@lists.openembedded.org
Date: Thu, 10 Apr 2025 13:47:27 +0100
In-Reply-To: <20250404162932.447699-6-mikko.rapeli@linaro.org>
References: <20250404162932.447699-1-mikko.rapeli@linaro.org>
	 <20250404162932.447699-6-mikko.rapeli@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 12:47:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214662

On Fri, 2025-04-04 at 19:29 +0300, Mikko Rapeli via
lists.openembedded.org wrote:
> Disables recommends to only install important packages.
> Disable machine specific additions which are meant for
> full rootfs boot. For example on genericarm64, full
> set of kernel modules and WiFi related firmware is
> in the machine recommends and those are not needed when
> booting to rootfs from an initrd. These reduce systemd
> initrd size from 200Mb to 54Mb.
>=20
> Since recommends are not automatically installed anymore,
> explicitly add initramfs-module-rootfs, busybox-udhcpc and libkmod
> to shell script based initrd. initramfs-module-rootfs is needed to
> mount the rootfs. Installing busybox-udhcpc and libkmod
> for backwards compatibility.
>=20
> Not installing openssl-conf, openssl-ossl-module-legacy or
> ldconfig packages since they don't seem essential in initrd
> to mount the rootfs.
>=20
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
> =C2=A0meta/recipes-core/images/core-image-initramfs-boot.bb | 11
> ++++++++++-
> =C2=A01 file changed, 10 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/images/core-image-initramfs-boot.bb
> b/meta/recipes-core/images/core-image-initramfs-boot.bb
> index c66c28db76..99388476ac 100644
> --- a/meta/recipes-core/images/core-image-initramfs-boot.bb
> +++ b/meta/recipes-core/images/core-image-initramfs-boot.bb
> @@ -2,7 +2,7 @@ SUMMARY =3D "Basic initramfs to boot a fully-featured
> rootfs"
> =C2=A0DESCRIPTION =3D "Small initramfs that contains just udev and init, =
to
> find the real rootfs."
> =C2=A0LICENSE =3D "MIT"
> =C2=A0
> -INITRAMFS_SCRIPTS ?=3D "initramfs-framework-base initramfs-module-
> udev"
> +INITRAMFS_SCRIPTS ?=3D "initramfs-framework-base initramfs-module-udev
> initramfs-module-rootfs"
> =C2=A0
> =C2=A0inherit image
> =C2=A0
> @@ -20,8 +20,17 @@ PACKAGE_INSTALL =3D " \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${VIRTUAL-RUNTIME_dev_ma=
nager} \
> =C2=A0=C2=A0=C2=A0=C2=A0 ', '${INITRAMFS_SCRIPTS}', d)} \
> =C2=A0=C2=A0=C2=A0=C2=A0 base-passwd \
> +=C2=A0=C2=A0=C2=A0 busybox-udhcpc \
> +=C2=A0=C2=A0=C2=A0 libkmod \
> =C2=A0"
> =C2=A0
> +# reduce size
> +NO_RECOMMENDATIONS =3D "1"
> +
> +# don't install automatically, pick manually instead
> +MACHINE_EXTRA_RDEPENDS =3D ""

I'd probably accept that removing the rrecommends below is probably ok
for the initramfs but I'm not convinced removing rdepends is a good
move. If that works, are the things in question really rdepends for the
machine?

> +MACHINE_EXTRA_RRECOMMENDS =3D ""
> +
> =C2=A0# Ensure the initramfs only contains the bare minimum
> =C2=A0IMAGE_FEATURES =3D ""
> =C2=A0IMAGE_LINGUAS =3D ""

Cheers,

Richard

