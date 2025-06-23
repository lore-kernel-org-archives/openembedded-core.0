Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59D8AC7115B
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 08:17:48 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.14841.1750666666830188499
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Jun 2025 01:17:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=AMHS7C9F;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 964024316E;
	Mon, 23 Jun 2025 08:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750666665;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hj/qsChLqA4Jbyaz8llDc1WhccvlXlU0JcLsJCXnOvg=;
	b=AMHS7C9FtOGzB7KSVFWmmvitA8jROx/x9KlP63pvVV42BDXmS61JOLiYDKqaa5l+4kgjA/
	ECREuskGD3f7ESRPuzUmqEXWfd5tFmzvLySiYdhdf8DoOb4fBMm6MRHWsUwioZQKU2qQB6
	WkJe/KckI7+Z+65RbAD5aydidUvy3s7JARLq+cLd/adeDYIzwBlqLgZkN/zKNQTnYYr8ay
	0n0DqCkEDidqNbe3GqZQxTEoEH+WRjZM0q+VZE9f1cNDXHYneV/xT6AmIOymHziPCGZSae
	IVs9252hUIxVlapsBWCp1CP2wJjoawgPC1D22Fg8LLtZMZigyGqMbrkS/WMWsA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Jun 2025 10:17:44 +0200
Message-Id: <DATRJETQ7O1H.Q950SLDU2AGI@bootlin.com>
Subject: Re: [OE-core] [PATCH 1/2] libubootenv: add rrecommends from
 libubootenv to u-boot-env
Cc: <stefano.babic@swupdate.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <adrian.freihofer@siemens.com>,
 <openembedded-core@lists.openembedded.org>
References: <20250623073553.844037-1-adrian.freihofer@siemens.com>
 <20250623073553.844037-2-adrian.freihofer@siemens.com>
In-Reply-To: <20250623073553.844037-2-adrian.freihofer@siemens.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdduieehudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpegggfgtfffkufevhffvfhgjsehtqhertddttdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptdeftdeivdevfffhfeevjefhffetgedvvedvtdeigeeijeejheeutdekiedvuedtnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdphihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtoheprggurhhirghnrdhfrhgvihhhohhfvghrsehsihgvmhgvnhhsrdgtohhmpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgesl
 hhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdhrtghpthhtohepshhtvghfrghnohdrsggrsghitgesshifuhhpuggrthgvrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Jun 2025 08:17:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219202

On Mon Jun 23, 2025 at 9:35 AM CEST, Adrian Freihofer via lists.openembedde=
d.org wrote:
> From: Adrian Freihofer <adrian.freihofer@siemens.com>
>
> Without /etc/fw_env.config, the fw_printenv and fw_setenv utilities fail
> with an error, as they cannot locate the U-Boot environment.
> This limitation also affects any application linking against
> libubootenv. To address this, add an RRECOMMENDS from libubootenv to the
> u-boot-env package, which provides the necessary configuration files.
>
> While this could be an RDEPENDS, using RRECOMMENDS allows users with
> custom implementations to more easily override the dependency if needed.
>
> Some examples suggest bbappending fw_env.config directly to the
> libubootenv recipe. However, /etc/fw_env.config is machine-specific,
> whereas libubootenv is not. Additionally, the default U-Boot
> environment, which can be used by libubootenv, is also provided by the
> machine-specific u-boot-env package. Therefore, it is preferable to
> provide fw_env.config via the machine-specific u-boot recipe.
>
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>  meta/recipes-bsp/u-boot/libubootenv_0.3.6.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-bsp/u-boot/libubootenv_0.3.6.bb b/meta/recipes-=
bsp/u-boot/libubootenv_0.3.6.bb
> index 35678e2361f..a193872b83b 100644
> --- a/meta/recipes-bsp/u-boot/libubootenv_0.3.6.bb
> +++ b/meta/recipes-bsp/u-boot/libubootenv_0.3.6.bb
> @@ -21,4 +21,8 @@ DEPENDS =3D "zlib libyaml"
>  PROVIDES +=3D "u-boot-fw-utils"
>  RPROVIDES:${PN}-bin +=3D "u-boot-fw-utils"
> =20
> +# libubootenv needs /etc/fw_env.config and /etc/u-boot-initial-env confi=
guration
> +# files which are usually provided by the MACHINE specific u-boot-env pa=
ckage
> +RRECOMMENDS:${PN} +=3D "u-boot-env"
> +
>  BBCLASSEXTEND =3D "native"

Hi,

I think this patch produces the following warnings:

stdio: WARNING: Nothing RPROVIDES 'u-boot-env-native' (but virtual:native:/=
srv/pokybuild/yocto-worker/a-full/build/meta/recipes-bsp/u-boot/libubootenv=
_0.3.6.bb RDEPENDS on or otherwise requires it)
stdio: WARNING: Nothing RPROVIDES 'libubootenv-native' (but virtual:native:=
/srv/pokybuild/yocto-worker/a-full/build/meta/recipes-bsp/u-boot/libubooten=
v_0.3.6.bb RDEPENDS on or otherwise requires it)
stdio: WARNING: Nothing RPROVIDES 'libubootenv-dev-native' (but virtual:nat=
ive:/srv/pokybuild/yocto-worker/a-full/build/meta/recipes-bsp/u-boot/libubo=
otenv_0.3.6.bb RDEPENDS on or otherwise requires it)

Happens on `bitbake universe -c fetch -k`.

Can you have a look?

Full log:
https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/2765656/raw_inlin=
e

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


