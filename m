Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.1310.1613675113386476877
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Feb 2021 11:05:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=XqhDpokI;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1613675113;
  x=1645211113;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=m0XIJwgQO1YJVDbDEr830rfFtHPiybRnC9QmZSowN30=;
  b=XqhDpokIfPkqENaxSFjWLVMu98oNAK7iqkLDLPnMX2+JDUS7apm5M4Hi
   2JnV6FKcRu2UiFEHZjtcoRlvz9pyZwuS3Vv/njVwNbw9pOg05ksyx/SDZ
   ZHiiepKhHEWCrQyAliTLN4ovqV0BvBPtzMULJvlYbDIlvctd3ariXuJrh
   oP8c82ea49AiGeSzO25sBxpVA/M0yaDH0/Zll0jRWp9KZHhsQ3xutXdeA
   mlFFaib/peDqHq8xThD8akwZ9fDW1ouzSBY1hOj0V5YnuO8JcnV/rXccG
   VM/ByWtII6amT7RTyUDX8MEv7zmbWm9UmjLIV2alibh0GcBkMKcPpD1F1
   A==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 03/11] licenses.conf: Add missing 'or-later' mappings
Thread-Topic: [OE-core] [PATCH 03/11] licenses.conf: Add missing 'or-later'
 mappings
Thread-Index: AQHXBhcXKkFzf7oSzEiPTSfrxx6rL6peRT+g
Date: Thu, 18 Feb 2021 19:05:11 +0000
Message-ID: <9fd4f4f013a344c080e9952ce14ffeee@XBOX03.axis.com>
References: <20210218165646.2109894-1-richard.purdie@linuxfoundation.org>
 <20210218165646.2109894-3-richard.purdie@linuxfoundation.org>
In-Reply-To: <20210218165646.2109894-3-richard.purdie@linuxfoundation.org>
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
> core@lists.openembedded.org> On Behalf Of Richard Purdie
> Sent: den 18 februari 2021 17:57
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 03/11] licenses.conf: Add missing 'or-later'
> mappings
>=20
> If we handle the or-later licences separately (which we should),
> we need to add in the missing name mappings for the code to
> function correctly.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/conf/licenses.conf | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/conf/licenses.conf b/meta/conf/licenses.conf
> index a4582b9ae82..5785b0a5b53 100644
> --- a/meta/conf/licenses.conf
> +++ b/meta/conf/licenses.conf
> @@ -11,38 +11,55 @@
>=20
>  # AGPL variations
>  SPDXLICENSEMAP[AGPL-3] =3D "AGPL-3.0-only"
> +SPDXLICENSEMAP[AGPL-3+] =3D "AGPL-3.0-or-later"
>  SPDXLICENSEMAP[AGPLv3] =3D "AGPL-3.0-only"
> +SPDXLICENSEMAP[AGPLv3+] =3D "AGPL-3.0-or-later"
>  SPDXLICENSEMAP[AGPLv3.0] =3D "AGPL-3.0-only"
> +SPDXLICENSEMAP[AGPLv3.0+] =3D "AGPL-3.0-or-later"
>  SPDXLICENSEMAP[AGPL-3.0] =3D "AGPL-3.0-only"
>  SPDXLICENSEMAP[AGPL-3.0+] =3D "AGPL-3.0-or-later"
>=20
>  # GPL variations
>  SPDXLICENSEMAP[GPL-1] =3D "GPL-1.0-only"
> +SPDXLICENSEMAP[GPL-1+] =3D "GPL-1.0-or-later"
>  SPDXLICENSEMAP[GPLv1] =3D "GPL-1.0-only"
> +SPDXLICENSEMAP[GPLv1+] =3D "GPL-1.0-or-later"
>  SPDXLICENSEMAP[GPLv1.0] =3D "GPL-1.0-only"
> -SPDXLICENSEMAP[GPL-1.0+] =3D "GPL-1.0-or-later"
> +SPDXLICENSEMAP[GPLv1.0+] =3D "GPL-1.0-or-later"
>  SPDXLICENSEMAP[GPL-1.0] =3D "GPL-2.0-only"
> +SPDXLICENSEMAP[GPL-1.0+] =3D "GPL-2.0-or-later"

Change to:

SPDXLICENSEMAP[GPL-1.0+] =3D "GPL-1.0-or-later"

>  SPDXLICENSEMAP[GPL-2] =3D "GPL-2.0-only"
> +SPDXLICENSEMAP[GPL-2+] =3D "GPL-2.0-or-later"
>  SPDXLICENSEMAP[GPLv2] =3D "GPL-2.0-only"
> +SPDXLICENSEMAP[GPLv2+] =3D "GPL-2.0-or-later"
>  SPDXLICENSEMAP[GPLv2.0] =3D "GPL-2.0-only"
> +SPDXLICENSEMAP[GPLv2.0+] =3D "GPL-2.0-or-later"
>  SPDXLICENSEMAP[GPL-2.0] =3D "GPL-2.0-only"
>  SPDXLICENSEMAP[GPL-2.0+] =3D "GPL-2.0-or-later"
>  SPDXLICENSEMAP[GPL-3] =3D "GPL-3.0-only"
> +SPDXLICENSEMAP[GPL-3+] =3D "GPL-3.0-or-later"
>  SPDXLICENSEMAP[GPLv3] =3D "GPL-3.0-only"
> +SPDXLICENSEMAP[GPLv3+] =3D "GPL-3.0-or-later"
>  SPDXLICENSEMAP[GPLv3.0] =3D "GPL-3.0-only"
> +SPDXLICENSEMAP[GPLv3.0+] =3D "GPL-3.0-or-later"
>  SPDXLICENSEMAP[GPL-3.0] =3D "GPL-3.0-only"
>  SPDXLICENSEMAP[GPL-3.0+] =3D "GPL-3.0-or-later"
>=20
>  #LGPL variations
>  SPDXLICENSEMAP[LGPLv2] =3D "LGPL-2.0-only"
> +SPDXLICENSEMAP[LGPLv2+] =3D "LGPL-2.0-or-later"
>  SPDXLICENSEMAP[LGPLv2.0] =3D "LGPL-2.0-only"
> +SPDXLICENSEMAP[LGPLv2.0+] =3D "LGPL-2.0-or-later"
>  SPDXLICENSEMAP[LGPL-2.0] =3D "LGPL-2.0-only"
>  SPDXLICENSEMAP[LGPL-2.0+] =3D "LGPL-2.0-or-later"
>  SPDXLICENSEMAP[LGPL2.1] =3D "LGPL-2.1-only"
> +SPDXLICENSEMAP[LGPL2.1+] =3D "LGPL-2.1-or-later"
>  SPDXLICENSEMAP[LGPLv2.1] =3D "LGPL-2.1-only"
> +SPDXLICENSEMAP[LGPLv2.1+] =3D "LGPL-2.1-or-later"
>  SPDXLICENSEMAP[LGPL-2.1] =3D "LGPL-2.1-only"
>  SPDXLICENSEMAP[LGPL-2.1+] =3D "LGPL-2.1-or-later"
>  SPDXLICENSEMAP[LGPLv3] =3D "LGPL-3.0-only"
> +SPDXLICENSEMAP[LGPLv3+] =3D "LGPL-3.0-or-later"
>  SPDXLICENSEMAP[LGPL-3.0] =3D "LGPL-3.0-only"
>  SPDXLICENSEMAP[LGPL-3.0+] =3D "LGPL-3.0-or-later"
>=20
> --
> 2.27.0

//Peter

