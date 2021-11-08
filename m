Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B096C433EF
	for <webhook@archiver.kernel.org>; Mon,  8 Nov 2021 14:23:21 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web09.45443.1636381400134171360
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Nov 2021 06:23:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=hRnGnvw0;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1636381400;
  x=1667917400;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=M0rSBSYrdi1wgaDOCn2/pUVtRxS3f98VnGik5RhW07w=;
  b=hRnGnvw0KB3XmdPOuU9J9o5XNW+4HDGjbjb9Xh/1qnoBwKJe8W/PtnUI
   sI/rlVus57lMfmVyHh2dmzzeAGLirKhAsmCT6Zynk8n5Y/GW6CioGpW7m
   GyKxxcG9Fd5etztcxCAurzrahuOMLPOi5K5Rrh5Hjh7ct8IMr/oBkiOni
   WUQpcg7ZZh7XrybiguGwiBk2ZyuBEyaVIFWqide391clJOisv8CH9TSDB
   +QOQ5trIm9eYNjB38oXM62DQupyKb78fhbBRBqRP2nb+gN06/hdy/0giZ
   DP9ucuwRm+MQvccCph4xR1bMAnU5mNSMpCVkW80l6QaIz7JRYdedR48/l
   w==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "Mittal, Anuj" <anuj.mittal@intel.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 1/2] libx11: Update LICENSE to better reflect
 reality
Thread-Topic: [OE-core] [PATCH 1/2] libx11: Update LICENSE to better reflect
 reality
Thread-Index: AQHX0ncISJDEWNhSqU6On+zwrw5kFqv5slyw
Date: Mon, 8 Nov 2021 14:23:08 +0000
Message-ID: <94ef310748074602b2f6964808a97bca@axis.com>
References: <16B4BB71F21BB771.453@lists.openembedded.org>
In-Reply-To: <16B4BB71F21BB771.453@lists.openembedded.org>
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
 <openembedded-core@lists.openembedded.org>; Mon, 08 Nov 2021 14:23:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157984

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Peter Kjellerstedt
> Sent: den 5 november 2021 19:58
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 1/2] libx11: Update LICENSE to better reflect r=
eality
>=20
> There are no traces of neither the BSD-2-Clause license nor the
> BSD-4-Clause license being used in the code. There is one occurrence
> of the BSD-1-Clause license. On the other hand, HPND and
> HPND-sell-variant are all over the place.
>=20
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb b/meta/recipe=
s-graphics/xorg-lib/libx11_1.7.2.bb
> index 7ee2a9c16a..f429daaf47 100644
> --- a/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb
> +++ b/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb
> @@ -20,7 +20,7 @@ SRC_URI[sha256sum] =3D "1cfa35e37aaabbe4792e9bb690468ef=
efbfbf6b147d9c69d6f90d13c30
>  PROVIDES =3D "virtual/libx11"
>=20
>  XORG_PN =3D "libX11"
> -LICENSE =3D "MIT & MIT-style & BSD-4-Clause & BSD-2-Clause"
> +LICENSE =3D "MIT & MIT-style & BSD-1-Clause & HPND & HPND-sell-variant"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D172255dee66bb0151435b2d5d709f=
cf7"
>=20
>  DEPENDS +=3D "xorgproto xtrans libxcb"

Please cherry-pick this (and the corresponding change for=20
libx11-compose-data) to Honister.

//Peter


