Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.12598.1589107258481060467
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 May 2020 03:40:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=kDGu06FW;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=2253; q=dns/txt; s=axis-central1;
  t=1589107258; x=1620643258;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=it9ApE38n0yu8DPYxAeElWFaPrm/U2xpYPMkk2QGsLk=;
  b=kDGu06FW/z1cCO0IBUsoHvz1DOO7QyHu20rO2AcWq9W3T5E5bf1LIAg8
   RlaC/RyOHTKq6zocaXP9dv5C/3tJbw/KokwcIRb2reLI61Bj4vzQq2OzE
   dliYjZcG+/xGt4V+2sQofhSPczORLn+WL1d8DvtgZgQTxxgx0A5yPvu3N
   ihy2Jid6BNnu9Zhsm05MYpp1z68kpKyskllWnmu5g08Ju9gQBIBGyZMJq
   WXa2hfDxJS+cHnrLPazW/v8eMDhV31/N1Aj27tG5EOIFNaPkdWwxKPs1F
   HJLUpJyQwBM/rEljl//eUwDcJ4Nk7lm7nL/tTbPMEzyobS/v7+WjTqqPR
   Q==;
IronPort-SDR: 81Pc4HBgL8g5A8797EKvli3VERJeYM3kT40p5IfN827HCJLJbdswiniIOnMqT7MgPim/XWrK8J
 MyyGB+kZUI98I3koflcRvJ8r4IXNMvgbGkpCh5izX26sK6QUXxUY7zQYDIilVpK4Vj2NrIjinb
 C112gABVDf25A7NmddVnP5L93RH7ZMgFHQu9nsUVvB9wdZG6QChrELQbfRNACDbKA3+OOuYzBh
 j9Rvf7QDv9CSeOMutFxFDgarEFkqYQgVSg6Z1Reh7oEruQwKUEAQXVHHBNOINDLWxhWvStyI0A
 daw=
X-IronPort-AV: E=Sophos;i="5.73,375,1583190000"; 
   d="scan'208";a="8334037"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Konrad Weihmann <kweihmann@outlook.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2] file: add PACKAGECONFIG for auto options
Thread-Topic: [OE-core] [PATCH v2] file: add PACKAGECONFIG for auto options
Thread-Index: AQHWJkYLMekwmZaEik+fOdpRLlAhQqihIjTg
Date: Sun, 10 May 2020 10:40:56 +0000
Message-ID: <5b9cc2a2161f4842a2f2ab91ceff3efd@XBOX03.axis.com>
References: <AM7PR05MB68811EB3A3AFB3B8C6876C4EA8A30@AM7PR05MB6881.eurprd05.prod.outlook.com>
In-Reply-To: <AM7PR05MB68811EB3A3AFB3B8C6876C4EA8A30@AM7PR05MB6881.eurprd05.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Return-Path: peter.kjellerstedt@axis.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Konrad Weihmann
> Sent: den 9 maj 2020 23:08
> To: openembedded-core@lists.openembedded.org
> Cc: Konrad Weihmann <kweihmann@outlook.com>
> Subject: [OE-core] [PATCH v2] file: add PACKAGECONFIG for auto options
>=20
> A few options of file configure are set to auto, which can lead to
> unpredictable effect when something in the sysroot does provide
> things that satisfy the autotools checks.
> In the worst case this will lead to package-qa failure as libraries are
> not set in RDEPENDS but configured for the tool.
>=20
> To mitigate changes of accidental configure set explicit options via
> newly introduced PACKAGECONFIG variables for bzip, lzma and zlib
> support, where the default is just zlib, as it was before
>=20
> changes v2:
>=20
> - add explicit enable options

The v2 information belongs after the --- below as it relates to the=20
review process.

//Peter

>=20
> Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
> ---
>  meta/recipes-devtools/file/file_5.38.bb | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-devtools/file/file_5.38.bb b/meta/recipes-
> devtools/file/file_5.38.bb
> index b8f09107e8..e528d84cdd 100644
> --- a/meta/recipes-devtools/file/file_5.38.bb
> +++ b/meta/recipes-devtools/file/file_5.38.bb
> @@ -8,7 +8,7 @@ SECTION =3D "console/utils"
>  LICENSE =3D "BSD-2-Clause"
>  LIC_FILES_CHKSUM =3D
> "file://COPYING;beginline=3D2;md5=3D0251eaec1188b20d9a72c502ecfdda1b"
>=20
> -DEPENDS =3D "zlib file-replacement-native"
> +DEPENDS =3D "file-replacement-native"
>  DEPENDS_class-native =3D "zlib-native"
>=20
>  SRC_URI =3D "git://github.com/file/file.git"
> @@ -18,6 +18,11 @@ S =3D "${WORKDIR}/git"
>=20
>  inherit autotools update-alternatives
>=20
> +PACKAGECONFIG ??=3D "zlib"
> +PACKAGECONFIG[bz2] =3D "--enable-bzlib,--disable-bzlib,bzip2"
> +PACKAGECONFIG[lzma] =3D "--enable-xzlib,--disable-xzlib,xz"
> +PACKAGECONFIG[zlib] =3D "--enable-zlib,--disable-zlib,zlib"
> +
>  EXTRA_OECONF +=3D "--disable-libseccomp"
>=20
>  ALTERNATIVE_${PN} =3D "file"
> --
> 2.20.1

