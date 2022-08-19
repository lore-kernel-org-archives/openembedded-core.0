Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06538C32771
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 14:38:41 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web08.3863.1660919911213895145
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 07:38:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=Tr1PP69f;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1660919912;
  x=1692455912;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Q14GUR9t8kTjd57Xu5Vul1obdAsXDZlNQv6lLENJJuY=;
  b=Tr1PP69fUZzlEHgql9YHB9tIo5ynTWy5qdKGjZ3Nu5J/rb8L2HNwH0A8
   Umm9I6v5hXa73tmasjCBCFSMK61iVV2XDf86uSDOh+CIXHkQMLNEElQiH
   8QykCsfqi6FBea05khbzuOf6FvHYCbkcY1ABVsx5HFlKoLSDS2EBrDHlA
   Jy2vUOwUzliPv6c0rkzdBVfugsNYRux2inLj2CWKYUcy9CgEXMVnt9UYb
   PoCl3NkIFMd7r1KDmqrdStcWOZZhiGKFL7tI4qJ4BXaab0IrgdcyzCtyQ
   1giGd/O/wn8DY4pWOZTpGcsM+ehA65igptHlEqXooH1qvrjD7x5Vj24Mj
   A==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Mateusz Marciniec <mateuszmar2@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Subject: RE: [OE-core] [PATCH] util-linux: Remove raw flags in EXTRA_OECONF
Thread-Topic: [OE-core] [PATCH] util-linux: Remove raw flags in EXTRA_OECONF
Thread-Index: AQHYs7+aGmzY+WDmX0iMQvGAIpakfq22SdVg
Date: Fri, 19 Aug 2022 14:38:28 +0000
Message-ID: <fedbfff08c3f42e693fe007d4066d0cf@axis.com>
References: <20220819113336.3167-1-mateuszmar2@gmail.com>
In-Reply-To: <20220819113336.3167-1-mateuszmar2@gmail.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 14:38:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169632

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Mateusz Marciniec
> Sent: den 19 augusti 2022 13:34
> To: openembedded-core@lists.openembedded.org
> Cc: Mateusz Marciniec <mateuszmar2@gmail.com>; Tomasz Dziendzielski
> <tomasz.dziendzielski@gmail.com>
> Subject: [OE-core] [PATCH] util-linux: Remove raw flags in EXTRA_OECONF
>=20
> Having both enable and disable flags for raw is confusing.
> Raw should not be enabled so both flags can be removed.
>=20
> Signed-off-by: Mateusz Marciniec <mateuszmar2@gmail.com>
> Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
> ---
>  meta/recipes-core/util-linux/util-linux_2.38.1.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-core/util-linux/util-linux_2.38.1.bb
> b/meta/recipes-core/util-linux/util-linux_2.38.1.bb
> index 8a7b47a0c6..a93ae83cd6 100644
> --- a/meta/recipes-core/util-linux/util-linux_2.38.1.bb
> +++ b/meta/recipes-core/util-linux/util-linux_2.38.1.bb
> @@ -69,12 +69,12 @@ EXTRA_OECONF =3D "\
>      --enable-libuuid --enable-libblkid \
>      \
>      --enable-fsck --enable-kill --enable-last --enable-mesg \
> -    --enable-mount --enable-partx --enable-raw --enable-rfkill \
> +    --enable-mount --enable-partx --enable-rfkill \
>      --enable-unshare --enable-write \
>      \
>      --disable-bfs --disable-login \
>      --disable-makeinstall-chown --disable-minix --disable-newgrp \
> -    --disable-use-tty-group --disable-vipw --disable-raw \
> +    --disable-use-tty-group --disable-vipw \

A quick look in configure.ac for util-linux indicates that it will=20
start to look for linux/raw.h and enable raw support if it exists=20
if you remove the --disable-raw option. So you should leave the=20
--disable-raw option to maintain the current deterministic behavior.

>      \
>      --without-udev \
>      \
> --
> 2.37.1

//Peter


