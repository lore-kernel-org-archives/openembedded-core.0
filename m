Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E082D3EE67
	for <webhook@archiver.kernel.org>; Thu, 22 Jan 2026 13:31:49 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37343.1769088706043025912
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jan 2026 05:31:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=dRn66QyB;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E3ACDC21AA3
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Jan 2026 13:31:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 044A2606B6;
	Thu, 22 Jan 2026 13:31:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6AD2D119B81E3;
	Thu, 22 Jan 2026 14:31:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769088702; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kwChBq8uGFVetGwJqLymSq/V/WIarqTUXCD5FcSMTUQ=;
	b=dRn66QyBs4q+6+elYfyuHLx6C9pR1wxc3mpowUVijAzMELqzwLV+zyOfDlAMugEsqlbGUp
	sZ1OkBHESNlaiboyXPph81y7iZe7lNI8bjda6vjc+MPfkD2EfYTFwRPzqQitph0090Qhht
	7KAjG2VrZv3Zutb++hKxWOTVRlumwWX0ZIsjC/UI7ctkEFhfsEaE3/Gh2tnBzS18z95afY
	HX0BsbJiVDk/WHaqj2xMKs7Z/+6Uhls6tu+QaMBoAItvDCrp5sIdgXtHQHJrA82gVnZLcT
	X/cJJ7hbHhqoBtbUmnzKXhcsZO2lJgpH4xbj8dgmnQq1420vNnzuJmCwck0qeA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 22 Jan 2026 14:31:39 +0100
Message-Id: <DFV5LT7J5IUO.36TF0ODMLV8N1@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <wangmy@fujitsu.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 3/5] barebox-tools: upgrade 2025.12.0 ->
 2026.01.0
References: <20260122090513.888-1-wangmy@fujitsu.com>
 <20260122090513.888-3-wangmy@fujitsu.com>
In-Reply-To: <20260122090513.888-3-wangmy@fujitsu.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jan 2026 13:31:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229844

Hi,

On Thu Jan 22, 2026 at 10:05 AM CET, wangmy via lists.openembedded.org wrot=
e:
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  meta/recipes-bsp/barebox/barebox-common.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-bsp/barebox/barebox-common.inc b/meta/recipes-b=
sp/barebox/barebox-common.inc
> index 3b6f827afa..14a5ca9709 100644
> --- a/meta/recipes-bsp/barebox/barebox-common.inc
> +++ b/meta/recipes-bsp/barebox/barebox-common.inc
> @@ -3,6 +3,6 @@ SECTION =3D "bootloaders"
> =20
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df5125d13e000b9ca1f0d3364286c4=
192"
> =20
> -PV =3D "2025.12.0"
> +PV =3D "2026.01.0"
>  SRC_URI =3D "https://barebox.org/download/barebox-${PV}.tar.bz2"
> -SRC_URI[sha256sum] =3D "71d2cdc42bf52b2e96e62f24babc0f5a93acb5b21b048d4d=
17dd589a893529cf"
> +SRC_URI[sha256sum] =3D "219283d67c5d2f79bd22915b8a71906531223cb01e6e5b8d=
1658f299441e4169"

This is also changing the version of barebox since this modifies the .inc, =
so
the patch title is misleading.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


