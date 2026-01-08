Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3F5BCF6C15
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 08:05:49 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2078.1767859547153378596
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jan 2026 00:05:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=G6chr7DT;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C46C81A26F7
	for <openembedded-core@lists.openembedded.org>; Thu,  8 Jan 2026 08:05:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 91FAB606B6;
	Thu,  8 Jan 2026 08:05:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 11637103C8674;
	Thu,  8 Jan 2026 09:05:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767859544; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kTU4Wmy91pgf81HkSx2cUTeExbnPw0FcsCIqMuxTNlE=;
	b=G6chr7DTuSGuvMDdkUlpM8QrwTaMs8VpHS6CW8LkqiJiijY+6WOVh9NwZafogkWngQkUFC
	c7gVHdXMFSzBWvvYEUlqG2zvWo5YIq9lMv14I+KAOZxm7ombF4Uv51lWzBOUhso2aqaODw
	G5St0jpEFzFXZ2bc3oJqdbj6bq9otC5oV/f70B3NOwlQjWqY67fpawUg669pJEfN4DIBV2
	vN06bLvsMREBmXG9XEJS/HrxvsYTvJqnVf8BUXe8KXIo2Q90e1b4ekRMQeSR+hNux4CKKH
	SEuRjHC8UlRRHMFPJn1J9IuJFPZWrsg+CnyX5WHDhbPHPOciET3Eig3kATnClg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 08 Jan 2026 09:05:36 +0100
Message-Id: <DFJ1WJHZ80VB.3C7F25622Y8ZI@bootlin.com>
Subject: Re: [OE-core] [PATCH] u-boot: upgrade 2025.10 -> 2026.01
Cc: <festevam@gmail.com>, <openembedded-core@lists.openembedded.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Jon Mason" <jon.mason@arm.com>, "Ross Burton" <ross.burton@arm.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260106121413.844461-1-festevam@gmail.com>
In-Reply-To: <20260106121413.844461-1-festevam@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Jan 2026 08:05:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229040

On Tue Jan 6, 2026 at 1:14 PM CET, Fabio Estevam via lists.openembedded.org=
 wrote:
> Upgrade to U-Boot 2026.01.
>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  meta/recipes-bsp/u-boot/u-boot-common.inc                       | 2 +-
>  .../u-boot/{u-boot-tools_2025.10.bb =3D> u-boot-tools_2026.01.bb} | 0
>  .../recipes-bsp/u-boot/{u-boot_2025.10.bb =3D> u-boot_2026.01.bb} | 0
>  3 files changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-bsp/u-boot/{u-boot-tools_2025.10.bb =3D> u-boot-tool=
s_2026.01.bb} (100%)
>  rename meta/recipes-bsp/u-boot/{u-boot_2025.10.bb =3D> u-boot_2026.01.bb=
} (100%)
>
> diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp=
/u-boot/u-boot-common.inc
> index 93ff0ca6ca..79ddde3f5c 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-common.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
> @@ -12,7 +12,7 @@ PE =3D "1"
> =20
>  # We use the revision in order to avoid having to fetch it from the
>  # repo during parse
> -SRCREV =3D "e50b1e8715011def8aff1588081a2649a2c6cd47"
> +SRCREV =3D "127a42c7257a6ffbbd1575ed1cbaa8f5408a44b3"
> =20
>  SRC_URI =3D "git://source.denx.de/u-boot/u-boot.git;protocol=3Dhttps;bra=
nch=3Dmaster;tag=3Dv${PV}"
> =20
> diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2025.10.bb b/meta/recip=
es-bsp/u-boot/u-boot-tools_2026.01.bb
> similarity index 100%
> rename from meta/recipes-bsp/u-boot/u-boot-tools_2025.10.bb
> rename to meta/recipes-bsp/u-boot/u-boot-tools_2026.01.bb
> diff --git a/meta/recipes-bsp/u-boot/u-boot_2025.10.bb b/meta/recipes-bsp=
/u-boot/u-boot_2026.01.bb
> similarity index 100%
> rename from meta/recipes-bsp/u-boot/u-boot_2025.10.bb
> rename to meta/recipes-bsp/u-boot/u-boot_2026.01.bb

Hi Jon, Ross,

Just a quick warning, once merged, this update will break meta-arm
builds, as some patches are conflicting:

ERROR: u-boot-1_2026.01-r0 do_patch: Applying patch '/srv/pokybuild/yocto-w=
orker/meta-arm/build/meta-arm/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-ba=
se/0001-vexpress64-Set-the-DM_RNG-property.patch' on target directory '/srv=
/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-linux/u=
-boot/2026.01/sources/u-boot-2026.01'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/meta-arm/build/build/=
tmp/work/fvp_base-poky-linux/u-boot/2026.01/recipe-sysroot-native/etc/quilt=
rc push', 0, 'stdout: Applying patch 0001-vexpress64-Set-the-DM_RNG-propert=
y.patch
patching file board/armltd/vexpress64/Kconfig
Hunk #1 FAILED at 21.
1 out of 1 hunk FAILED -- rejects in file board/armltd/vexpress64/Kconfig
Patch 0001-vexpress64-Set-the-DM_RNG-property.patch does not apply (enforce=
 with -f)

https://autobuilder.yoctoproject.org/valkyrie/#/builders/75/builds/2872

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


