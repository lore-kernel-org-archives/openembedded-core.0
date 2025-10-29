Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BC37CCF9EB
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 16:21:09 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web10.9515.1761754867331447813
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Oct 2025 09:21:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=S8NHGdJX;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B2EDC1A1748
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 16:21:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 85357606E8;
	Wed, 29 Oct 2025 16:21:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0D304117F8197;
	Wed, 29 Oct 2025 17:21:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761754865; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=wqxtnUF4iR+IwQx031/umZ33hw5lznpEW0Hnu0/kEu4=;
	b=S8NHGdJX3e5Mv2j9tEpLz8ydl/w+GYe/Lg2dmH8xGdADVOs/u/muBW1640bX3UsK+ZDxnl
	3QFf8MvuRZ//w/5VsoxUx7/WzpTvGZeEKxAicrPQrJNg2wWHM5Ls2amdg1yyLvxe9cD4oV
	vMxIl9A1zXLm9hOa5S1PXG5MrUqOMuqq5aK1irw2uw6uG3MYzZ722JcdOtjsYGXC/eCOh3
	hl+DMUMFGubuMyoTsOgE0AAmBWpdV4YsyzAVWqtiYr2gCPQWlcbPFS2DgMFX3yDreWC1+C
	A1/WueAfudvhBZChhQugQ7ZPw8brAOUQFsyVVCK751VUW4vD4OnnQ/hbcOTx2A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Oct 2025 17:21:02 +0100
Message-Id: <DDUXZ6Y7O8DE.11KXB8NS321QC@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <dmitry.baryshkov@oss.qualcomm.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/3] libconfig: upgrade 1.7.3 -> 1.8.1
References: <20251029002918.3728797-1-dmitry.baryshkov@oss.qualcomm.com>
 <20251029002918.3728797-2-dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20251029002918.3728797-2-dmitry.baryshkov@oss.qualcomm.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 16:21:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225461

Hi,

On Wed Oct 29, 2025 at 1:29 AM CET, Dmitry Baryshkov via lists.openembedded=
.org wrote:
> Upgrade libconfig to the latest release.
>
> License-Update: update LGPL-2.1 text
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  .../libconfig/{libconfig_1.7.3.bb =3D> libconfig_1.8.1.bb}     | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>  rename meta/recipes-extended/libconfig/{libconfig_1.7.3.bb =3D> libconfi=
g_1.8.1.bb} (77%)
>
> diff --git a/meta/recipes-extended/libconfig/libconfig_1.7.3.bb b/meta/re=
cipes-extended/libconfig/libconfig_1.8.1.bb
> similarity index 77%
> rename from meta/recipes-extended/libconfig/libconfig_1.7.3.bb
> rename to meta/recipes-extended/libconfig/libconfig_1.8.1.bb
> index bd7d7e64b889..924e8fd4575c 100644
> --- a/meta/recipes-extended/libconfig/libconfig_1.7.3.bb
> +++ b/meta/recipes-extended/libconfig/libconfig_1.8.1.bb
> @@ -5,12 +5,11 @@ BUGTRACKER =3D "https://github.com/hyperrealm/libconfig=
/issues"
>  SECTION =3D "libs"
> =20
>  LICENSE =3D "LGPL-2.1-only"
> -LIC_FILES_CHKSUM =3D "file://COPYING.LIB;md5=3Dfad9b3332be894bab9bc50157=
2864b29"
> +LIC_FILES_CHKSUM =3D "file://COPYING.LIB;md5=3D17c8e32f0f72580cc2906b409=
d46b5ac"
> =20
>  SRC_URI =3D "git://github.com/hyperrealm/libconfig.git;protocol=3Dhttps;=
branch=3Dmaster;tag=3Dv${PV} \
> -    file://0001-Fix-declarations-to-allow-build-with-gcc-15.patch \

The patch is removed from SRC_URI but the file is not deleted here, I think=
.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


