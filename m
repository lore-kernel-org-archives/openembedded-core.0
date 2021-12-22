Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0648DC433F5
	for <webhook@archiver.kernel.org>; Wed, 22 Dec 2021 02:11:39 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web08.14452.1640139097462122527
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Dec 2021 18:11:38 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=nvpL26F1;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1640139097;
  x=1671675097;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=dNASFxkVeSb5Lvko5Ne+x0AAT+e4cRio65fWp0MrbJo=;
  b=nvpL26F16mW94MREdKgTWnjrOEdjBTJwIkz0Xxrkajj4GjQEjALbXpyI
   E6AFGhXu79DCSXIe8Fws3tq99pjakKS7QpDt0gUHLXuMGPOPCxiVXBYAx
   mpoUQJ14q6O+hXvmSYBMe7e2beOm3Ho3VSPTtfKMxyrjpXwLG0q3juJ7O
   N9T24LvQoPff4bbOObaBnhPJ1w8UfDrz9aq0klcpgNyWp4nG4kF3pYJp/
   3+Koi7/4bzokujzrE876GFKIF1KX3VE5Jgs/X3LQ/ZlX/6ak2PziZJ9Pj
   Qdpoga+uTnGRKLy8F+6BphiLgFqlZ+HpP0+GpXakLoeaAkizim3VVGM2p
   Q==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Alexander Kanavin <alex@linutronix.de>
Subject: RE: [OE-core] [PATCH 22/26] cantarell-fonts: update 0.301 -> 0.303.1
Thread-Topic: [OE-core] [PATCH 22/26] cantarell-fonts: update 0.301 -> 0.303.1
Thread-Index: AQHX8gVWMMGnrdQiNkm9oUGTY/gjHqw9zZZQ
Date: Wed, 22 Dec 2021 02:11:33 +0000
Message-ID: <113c9b38e7734854acea1ed31ebb41fd@axis.com>
References: <20211215224034.1814148-1-alex@linutronix.de>
 <20211215224034.1814148-22-alex@linutronix.de>
In-Reply-To: <20211215224034.1814148-22-alex@linutronix.de>
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
 <openembedded-core@lists.openembedded.org>; Wed, 22 Dec 2021 02:11:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159933

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Alexander Kanavin
> Sent: den 15 december 2021 23:41
> To: openembedded-core@lists.openembedded.org
> Cc: Alexander Kanavin <alex@linutronix.de>
> Subject: [OE-core] [PATCH 22/26] cantarell-fonts: update 0.301 -> 0.303.1
>=20
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  ...antarell-fonts_0.301.bb =3D> cantarell-fonts_0.303.1.bb} | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
>  rename meta/recipes-graphics/cantarell-fonts/{cantarell-fonts_0.301.bb =
=3D> cantarell-fonts_0.303.1.bb} (73%)
>=20
> diff --git a/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.301.=
bb b/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.303.1.bb
> similarity index 73%
> rename from meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.301.b=
b
> rename to meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.303.1.b=
b
> index 8e39ef025f..a92f9cb729 100644
> --- a/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.301.bb
> +++ b/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.303.1.bb
> @@ -11,17 +11,11 @@ LICENSE =3D "OFL-1.1 & Apache-2.0"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfb1ef92b6909969a472a6ea3c4e99=
cb7"
>=20
>  inherit gnomebase meson allarch fontcache pkgconfig
> -SRC_URI[archive.sha256sum] =3D "3d35db0ac03f9e6b0d5a53577591b714238985f4=
cfc31a0aa17f26cd74675e83"
> +SRC_URI[archive.sha256sum] =3D "f9463a0659c63e57e381fdd753cf1929225395c5=
b49135989424761830530411"
>=20
>  # remove at next version upgrade or when output changes
> -PR =3D "r1"
>  HASHEQUIV_HASH_VERSION .=3D ".2"

Shouldn't all three lines above be removed now that the version changes?

>=20
>  EXTRA_OEMESON +=3D "-Duseprebuilt=3Dtrue -Dbuildappstream=3Dfalse"
>=20
>  FILES:${PN} =3D "${datadir}/fonts ${datadir}/fontconfig"
> -
> -# This isn't a GNOME-style version do gnome_verdir fails. Just return th=
e
> -# version as that is how the directory is structured.
> -def gnome_verdir(v):
> -    return v
> --
> 2.20.1

//Peter


