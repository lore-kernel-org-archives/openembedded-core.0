Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.3477.1587806148519638452
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Apr 2020 02:15:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=FRIhfWXk;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=1524; q=dns/txt; s=axis-central1;
  t=1587806148; x=1619342148;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=T+l1jFkVf/eS2XVKeINABhEOvNhzfZyzQ9TWwVHRcOY=;
  b=FRIhfWXkt/0aoY8yqdgRSeU8IFV1vC9vK59+0MtvLay/MoogZzyESd4N
   yFtM5ypDIdCTqRrCSdukCfsZfPfY1ZWP95nPYovrp1Ev7uEVBKmM6q6hg
   dtrPdjtLRTA2oL1i7jl7NmICkTmdRG541+tgHlZ67QjZmcekvMjUmaQQL
   1JqpkEfEV5TPqRaYR4/m1EkgoghltyIVxuGyq080uLnad/3WH7jRxK2m5
   ifEtKMNKK/5N+Z2APnG6s7L1NSJ/ZW+O/wjIaLU10rbzw60GUD4g1n1QD
   HtVQWhEAAIS4JfpZkzsa7dCrdOQ4HdfWGV0Oz+NYrMfTcPy5IsEBZJoBe
   g==;
IronPort-SDR: Tu976cmcXrIBuUeZNzNlp53h6J5uzifQItnU6IZgGsepBbSmMa0axnIpbFqSNrT24hmTHgafbd
 NSysF8WLDNIAk/ljpmaEn9XKL4Ec/gt4e5GxmkFNbcBmfuGhomgZWFEdGPRJHvskmae4w7w2mv
 vtqPtEbe4wrpXxIJJYgm35cl+Db9Xmzevu2WHg9c+JQK9BVn3ATaxRXrZ1XVWhb5btajOQTRZV
 d9TDjZwcF6cW++PUEOh2o6XKAHL4nb1YV6UdFpRQAU5EATevmcI/UMWgME3FWMjjhh4lQYjFJc
 YcI=
X-IronPort-AV: E=Sophos;i="5.73,315,1583190000"; 
   d="scan'208";a="7860166"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] busybox: Correct the name of the bzip2 license
Thread-Topic: [OE-core] [PATCH] busybox: Correct the name of the bzip2 license
Thread-Index: AQHWGuDdg9JqY547SEmtxHdiDdoU+qiJjAKA
Date: Sat, 25 Apr 2020 09:15:45 +0000
Message-ID: <7050beebd77b4954b78bc774af44c8e8@XBOX03.axis.com>
References: <160904C90D02B344.18576@lists.openembedded.org>
In-Reply-To: <160904C90D02B344.18576@lists.openembedded.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Peter Kjellerstedt
> Sent: den 25 april 2020 11:07
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] busybox: Correct the name of the bzip2 license
>=20
> The common bzip2 license was renamed from "bzip2" to "bzip2-1.0.6" in
> commit 669600ef to match the official SPDX identifier.

This raises one question though, shouldn't there have been some=20
QA warning or error to indicate that there was no definition of=20
the "bzip2" license anymore? (We have a task that combines all=20
licenses for an image into one file and it detected the problem.)

//Peter

>=20
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  meta/recipes-core/busybox/busybox.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-
> core/busybox/busybox.inc
> index 344e891f7a..6cfdcd7344 100644
> --- a/meta/recipes-core/busybox/busybox.inc
> +++ b/meta/recipes-core/busybox/busybox.inc
> @@ -7,7 +7,7 @@ DEPENDS +=3D "kern-tools-native virtual/crypt"
>=20
>  # bzip2 applet in busybox is based on lightly-modified bzip2 source
>  # the GPL is version 2 only
> -LICENSE =3D "GPLv2 & bzip2"
> +LICENSE =3D "GPLv2 & bzip2-1.0.6"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dde10de48642ab74318e893a61105a=
fbb"
>=20
>  SECTION =3D "base"
> --
> 2.21.1

