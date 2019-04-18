Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
	[209.85.210.49])
	by mail.openembedded.org (Postfix) with ESMTP id 3BA0B6093F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Apr 2019 12:17:10 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id s24so1475853otk.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Apr 2019 05:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=gGf7ERQlC9tMLcbYnWvgGAh4+GnDzTslHYRLnIwrDVk=;
	b=HINkGaSduJe5qIbptNb0TWZIeVsO9ttz5r2oOIsrvZebIAsIvGzxSDJSh35UpgNn8O
	KwqgsM+S7m1pabsilFMGFiVBsV6gS/dyeqzMpBWdh2T8CyYVkDneDXu2IbwCGoq4C5CC
	Ns+yzF6r/r2LJUZQjrPVpLPDcpxoRqt/lowhJtrNYcT+mwOXF879oJXAzZug+tVELsym
	1+KL1Vz5VEjpm3iLtRPjDNVg1IVEgXv5zBArm6CoZ4JCM4WxxWevtFK4mwJpIw0oy7q5
	yyollm/+1gd9ZeOJ/UXNruCvzHBlwfTCcZDH7+L9VbXKGvQmUaOHLYs3rJzp2zNT3ZV0
	iRoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=gGf7ERQlC9tMLcbYnWvgGAh4+GnDzTslHYRLnIwrDVk=;
	b=UVAVqnMa1ZmH5uockTwYJOkfFeM/eJ6FTRsWLpHeaHiZYN/LO+1G7Ly6pOMUUP42Y9
	Ng11tgEUV9Vntus0KJoonbXMIH1OZRuqAe1anJ2djjNiHu5Rdh/fay7jAWnfhg6tAf+i
	a7KujcN67kULixr33KfddInt+9JwNCHFRstnFxiusO/nSKQKbiNnMSO2qU1RPIs9uwPU
	9rHmVzjbuC2gcDO0Se8qRvwUwjE47W4jukuibZ/8KkAmfhyIoF3FkPHoXfHWUlv2E3GU
	fOGo8WWqdB40M06Abd9Hb2dH/ZlBCXKT5wchRIFFTx2vdxN0bSVo+Xw6o4Kejz84d8Uy
	TPQg==
X-Gm-Message-State: APjAAAViyGpbz4kf5DYNsbWatpwFHk6+u8RpKD1n8XpY5pZ/93ireuLe
	yvSQQDntPdud2y/IAVZZGPk7JJiSJpOzuBru0mScyBuV
X-Google-Smtp-Source: APXvYqy9dGhvxI0LAwjS/LlCv/QSPvsQ5xSB2ZqTLOdNhrK1sKSuacJcc9it4eBL+o6hlsGX9ECPiI9kxQP51mthEX0=
X-Received: by 2002:a9d:32f5:: with SMTP id
	u108mr23252089otb.153.1555589831073; 
	Thu, 18 Apr 2019 05:17:11 -0700 (PDT)
MIME-Version: 1.0
References: <SL2P216MB028292C44E997FA682A1C8DADD260@SL2P216MB0282.KORP216.PROD.OUTLOOK.COM>
In-Reply-To: <SL2P216MB028292C44E997FA682A1C8DADD260@SL2P216MB0282.KORP216.PROD.OUTLOOK.COM>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 18 Apr 2019 14:16:59 +0200
Message-ID: <CANNYZj_nwJpa_Yj-8_YYnu194c_3GSdb1iCg5EkDhXOCjh_ZzQ@mail.gmail.com>
To: Alistair Francis <alistair@alistair23.me>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] u-boot: Fix missing Python.h build failure
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 18 Apr 2019 12:17:10 -0000
Content-Type: text/plain; charset="UTF-8"

Can we take this opportunity to teach u-boot to use Python 3.x
instead? oe-core is trying to eliminate Python 2.x dependencies
everywhere.

Alex

On Thu, 18 Apr 2019 at 13:38, Alistair Francis <alistair@alistair23.me> wrote:
>
> Signed-off-by: Alistair Francis <alistair@alistair23.me>
> ---
>  meta/recipes-bsp/u-boot/u-boot.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
> index 96c1f94011..9a754fd09b 100644
> --- a/meta/recipes-bsp/u-boot/u-boot.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> @@ -13,7 +13,7 @@ DEPENDS += "swig-native python-native"
>
>  EXTRA_OEMAKE = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}" V=1'
>  EXTRA_OEMAKE += 'HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}"'
> -EXTRA_OEMAKE += 'PYTHON=nativepython STAGING_INCDIR=${STAGING_INCDIR_NATIVE} STAGING_LIBDIR=${STAGING_LIBDIR_NATIVE}'
> +EXTRA_OEMAKE += 'PYTHON2=nativepython STAGING_INCDIR=${STAGING_INCDIR_NATIVE} STAGING_LIBDIR=${STAGING_LIBDIR_NATIVE}'
>
>  PACKAGECONFIG ??= "openssl"
>  # u-boot will compile its own tools during the build, with specific
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

