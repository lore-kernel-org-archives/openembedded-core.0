Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 57DD97DF84
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 18:28:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 09D2518501;
	Fri, 17 May 2019 20:28:05 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id Jg4irObetO7B; Fri, 17 May 2019 20:28:02 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 6CCCB18618;
	Fri, 17 May 2019 20:28:02 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4B4111A07F;
	Fri, 17 May 2019 20:28:02 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3FC231A065;
	Fri, 17 May 2019 20:28:02 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Fri, 17 May 2019 20:28:02 +0200 (CEST)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by thoth.se.axis.com (Postfix) with ESMTP id 33D052FFC;
	Fri, 17 May 2019 20:28:02 +0200 (CEST)
Received: from XBOX04.axis.com (10.0.5.18) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Fri, 17 May 2019 20:28:02 +0200
Received: from XBOX04.axis.com ([fe80::210a:724b:68cb:a917]) by
	XBOX04.axis.com ([fe80::210a:724b:68cb:a917%22]) with mapi id
	15.00.1365.000; Fri, 17 May 2019 20:28:01 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 17/37] libpcre2: upgrade 10.32 -> 10.33
Thread-Index: AQHVDNxer2i6pVrwKEmFEI93J+kAYKZvodxw
Date: Fri, 17 May 2019 18:28:01 +0000
Message-ID: <c581181a21a04db892a1e2239c6201ec@XBOX04.axis.com>
References: <20190517181151.44001-1-alex.kanavin@gmail.com>
	<20190517181151.44001-17-alex.kanavin@gmail.com>
In-Reply-To: <20190517181151.44001-17-alex.kanavin@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH 17/37] libpcre2: upgrade 10.32 -> 10.33
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
X-List-Received-Date: Fri, 17 May 2019 18:28:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> core-bounces@lists.openembedded.org> On Behalf Of Alexander Kanavin
> Sent: den 17 maj 2019 20:12
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 17/37] libpcre2: upgrade 10.32 -> 10.33
>=20
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  .../{libpcre2_10.32.bb =3D> libpcre2_10.33.bb}  | 46 +++++++++++++++++--
>  1 file changed, 43 insertions(+), 3 deletions(-)
>  rename meta/recipes-support/libpcre/{libpcre2_10.32.bb =3D>
> libpcre2_10.33.bb} (61%)
>=20
> diff --git a/meta/recipes-support/libpcre/libpcre2_10.32.bb
> b/meta/recipes-support/libpcre/libpcre2_10.33.bb
> similarity index 61%
> rename from meta/recipes-support/libpcre/libpcre2_10.32.bb
> rename to meta/recipes-support/libpcre/libpcre2_10.33.bb
> index 3a0aa53029f..604f81a8f33 100644
> --- a/meta/recipes-support/libpcre/libpcre2_10.32.bb
> +++ b/meta/recipes-support/libpcre/libpcre2_10.33.bb
> @@ -1,3 +1,43 @@

A bit too much automation here I guess. ;)
Replace the below with an appropriate:

License-Update: Copyright years updated

in the commit message.

> +# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgra=
de'.
> +# The following is the difference between the old and the new license te=
xt.
> +# Please update the LICENSE value if needed, and summarize the changes i=
n
> +# the commit message via 'License-Update:' tag.
> +# (example: 'License-Update: copyright years updated.')
> +#
> +# The changes:
> +#
> +# --- LICENCE
> +# +++ LICENCE
> +# @@ -26,7 +26,7 @@
> +#  University of Cambridge Computing Service,
> +#  Cambridge, England.
> +#
> +# -Copyright (c) 1997-2018 University of Cambridge
> +# +Copyright (c) 1997-2019 University of Cambridge
> +#  All rights reserved.
> +#
> +#
> +# @@ -37,7 +37,7 @@
> +#  Email local part: hzmester
> +#  Email domain:     freemail.hu
> +#
> +# -Copyright(c) 2010-2018 Zoltan Herczeg
> +# +Copyright(c) 2010-2019 Zoltan Herczeg
> +#  All rights reserved.
> +#
> +#
> +# @@ -48,7 +48,7 @@
> +#  Email local part: hzmester
> +#  Email domain:     freemail.hu
> +#
> +# -Copyright(c) 2009-2018 Zoltan Herczeg
> +# +Copyright(c) 2009-2019 Zoltan Herczeg
> +#  All rights reserved.
> +#
> +#
> +#
> +#
> +
>  DESCRIPTION =3D "There are two major versions of the PCRE library. The \
>  newest version is PCRE2, which is a re-working of the original PCRE \
>  library to provide an entirely new API. The original, very widely \
> @@ -8,14 +48,14 @@ SUMMARY =3D "Perl Compatible Regular Expressions versi=
on 2"
>  HOMEPAGE =3D "http://www.pcre.org"
>  SECTION =3D "devel"
>  LICENSE =3D "BSD"
> -LIC_FILES_CHKSUM =3D "file://LICENCE;md5=3Dcf66d307bf03bae65d413eb7a8e60=
3a0"
> +LIC_FILES_CHKSUM =3D "file://LICENCE;md5=3Db1588d3bb4cb0e1f5a597d908f8c5=
b37"
>=20
>  SRC_URI =3D "https://ftp.pcre.org/pub/pcre/pcre2-${PV}.tar.bz2 \
>             file://pcre-cross.patch \
>  "
>=20
> -SRC_URI[md5sum] =3D "8a096287153fb994970df3570e90fcb5"
> -SRC_URI[sha256sum] =3D "f29e89cc5de813f45786580101aaee3984a65818631d4ddb=
da7b32f699b87c2e"
> +SRC_URI[md5sum] =3D "80b355f2dce909a2e2424f5c79eddb44"
> +SRC_URI[sha256sum] =3D "35514dff0ccdf02b55bd2e9fa586a1b9d01f62332c3356e3=
79eabb75f789d8aa"
>=20
>  CVE_PRODUCT =3D "pcre2"
>=20
> --
> 2.17.1

//Peter


