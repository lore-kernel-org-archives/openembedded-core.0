Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7E7BFF885A
	for <webhook@archiver.kernel.org>; Mon,  4 May 2026 19:15:46 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22829.1777922135791064862
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2026 12:15:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=uhbheQ7B;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 83B874E42BBE
	for <openembedded-core@lists.openembedded.org>; Mon,  4 May 2026 19:15:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 54D415FD5F;
	Mon,  4 May 2026 19:15:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B9F1211AD2D92;
	Mon,  4 May 2026 21:15:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777922132; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=Cl8lGqUK6h9HILqyOHYS0/qV3J6rB+0tZmIPVPCJNDY=;
	b=uhbheQ7Bd+9cyIR3TkhH6uGVa3lsv+TniBTlfMUtVq0PYmg8un0Qqhnj4ZNHy269eJQrlr
	g4pc1qyikgOT1Ul2P8bL82VFrkLuHUuUOHtQl5t6nklxvgtsRMz/7X7Rs8AHX1HswCQlT7
	WC03U2G+2d8tCvDiKmK3IuLmuG1VCSHoszscaGFZh6Znp3/8EBogEbLEeGDR98Czhg5icx
	OShFFo7Z6E05/xiwrSZWT2xGP/h3/v3vwBIzPg2DmkbohLdHKkRUTEKgjfT62G9XDXF7il
	mEPkNsIj9ehJNnK06fcd5bH1URTRpxebz2nsZp0ULpaY6j98I49JDJCoX3g3Ow==
Message-ID: <b6550a8d-e05a-44bc-a668-237cacd94505@bootlin.com>
Date: Mon, 4 May 2026 21:15:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] u-boot-tools: Update Upstream-Status
To: Fabio Estevam <festevam@gmail.com>,
 openembedded-core@lists.openembedded.org
Cc: marek.vasut@mailbox.org
References: <20260504181050.3525410-1-festevam@gmail.com>
Content-Language: en-US, fr
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <20260504181050.3525410-1-festevam@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 May 2026 19:15:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236452

Hello, Fabio

On 5/4/26 20:10, Fabio Estevam wrote:
> The 0001-scripts-dtc-drop-yaml-in-DT-validation.patch submission has
> been applied in U-Boot mainline.
>=20
> Update the Upstream-Status line accordingly.
>=20
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>   .../files/0001-scripts-dtc-drop-yaml-in-DT-validation.patch     | 2 +=
-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-bsp/u-boot/files/0001-scripts-dtc-drop-yaml-i=
n-DT-validation.patch b/meta/recipes-bsp/u-boot/files/0001-scripts-dtc-dr=
op-yaml-in-DT-validation.patch
> index 4913366102ec..9c1adc8faf01 100644
> --- a/meta/recipes-bsp/u-boot/files/0001-scripts-dtc-drop-yaml-in-DT-va=
lidation.patch
> +++ b/meta/recipes-bsp/u-boot/files/0001-scripts-dtc-drop-yaml-in-DT-va=
lidation.patch
> @@ -23,7 +23,7 @@ libyaml-native from u-boot-tools's dependencies.
>  =20
>   Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
>  =20
> -Upstream-Status: Submitted [https://lore.kernel.org/u-boot/20260429144=
615.142350-1-joaomarcos.costa@bootlin.com/]
> +Upstream-Status: Backport [https://github.com/u-boot/u-boot/commit/8ef=
8dee4f3a2b2021decfefd853dbd2a1632b77f]
>   ---
>    scripts/Makefile.lib             | 6 ------
>    scripts/dtc/Makefile             | 8 --------

Thanks for the patch, indeed it was merged into master not long ago.

Reviewed-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
--=20
Best regards,
Jo=C3=A3o Marcos Costa

