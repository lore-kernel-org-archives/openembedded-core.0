Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web12.8175.1589184750729917410
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2020 01:12:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=mgX12I7S;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=2290; q=dns/txt; s=axis-central1;
  t=1589184751; x=1620720751;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=wwny/O6guIDEc68QaVf0I7HVMNn6ZK0ywhNrCnLS5oc=;
  b=mgX12I7S999njySrnT7uSVlDvod/fTvtA+2Ix0S+h4WTHcx/CZ7E/LrD
   kykdLnJq/t7D2pyfHlAFxEY/PUhtbBOebpYP02NixathWz1vYyl0kFnlZ
   a/Nfxd73OwzwI77uo2SvOt9dgWOh/yNrT6WiHnxGDOT+r+W/qLGLA5DDZ
   eDyqBG6H1i55UREC4QlHM5yRub26W3uXGDn5LdNy1n/PgyQcrA393Dcfj
   M9FvjZ2TM/vX3AcHzQqTO20jCixf1AGiohAAUTznx1U2h2GpVRWVtsfST
   GlI806MLk5U4XaIlP6E/gFC908UDyytPGMFgmcpeWR6KGWwVI7/q/jKbo
   w==;
IronPort-SDR: 6BBGMABafppMxbvCFiafLh7zNxtnxlWBPrQuSr6jvWcMGPsbHQTPQncW+PAQBPkpHgULrZOBdz
 YlEGfH27xF1ofspWzRGaIw6LfS3nuebYS9wB3eJu+0DygYKZKihDKuL2Quox8V9yjggwNXqOTu
 yCj/VlO3qUkLANsPVjUDMOgAhNwZXleshN3Skp2ut9vXR4SbLNeaFV1JsI3Z6NaxLtsF67VGIq
 JHiMouAXW25u1H9UyZRydA/ZVP0Y++mvvSY4iL89Bm4KRC+HchrOCN97Qaq7QZJ9gKgN7vKiPk
 2Ug=
X-IronPort-AV: E=Sophos;i="5.73,379,1583190000"; 
   d="scan'208";a="8350997"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Konrad Weihmann <kweihmann@outlook.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v3] file: add PACKAGECONFIG for auto options
Thread-Topic: [OE-core] [PATCH v3] file: add PACKAGECONFIG for auto options
Thread-Index: AQHWJwnHAFd1j77U+kCVW89tm3jGR6iiiKdg
Date: Mon, 11 May 2020 08:12:25 +0000
Message-ID: <e90a8171ae6541b595111605f5393f8e@XBOX03.axis.com>
References: <AM7PR05MB6881E5C621ACD529E1BB4F4CA8A00@AM7PR05MB6881.eurprd05.prod.outlook.com>
In-Reply-To: <AM7PR05MB6881E5C621ACD529E1BB4F4CA8A00@AM7PR05MB6881.eurprd05.prod.outlook.com>
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
> Sent: den 10 maj 2020 22:30
> To: openembedded-core@lists.openembedded.org
> Cc: Konrad Weihmann <kweihmann@outlook.com>
> Subject: [OE-core] [PATCH v3] file: add PACKAGECONFIG for auto options
>=20
> A few options of file configure are set to auto, which can lead to
> unpredictable effects when something in the sysroot does provide
> things that satisfy the autotools checks.
> In the worst case this will lead to package-qa failures as libraries are
> not set in RDEPENDS but configured for the tool.
>=20
> To mitigate changes of accidental configure set explicit options via
> newly introduced PACKAGECONFIG variables for bzip, lzma and zlib
> support, where the default is just zlib, as it was before
>=20
> Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
> ---
>  meta/recipes-devtools/file/file_5.38.bb | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/file/file_5.38.bb b/meta/recipes-
> devtools/file/file_5.38.bb
> index b8f09107e8..f5ad568936 100644
> --- a/meta/recipes-devtools/file/file_5.38.bb
> +++ b/meta/recipes-devtools/file/file_5.38.bb
> @@ -8,8 +8,8 @@ SECTION =3D "console/utils"
>  LICENSE =3D "BSD-2-Clause"
>  LIC_FILES_CHKSUM =3D
> "file://COPYING;beginline=3D2;md5=3D0251eaec1188b20d9a72c502ecfdda1b"
>=20
> -DEPENDS =3D "zlib file-replacement-native"
> -DEPENDS_class-native =3D "zlib-native"
> +DEPENDS =3D "file-replacement-native"
> +DEPENDS_class-native =3D ""
>=20
>  SRC_URI =3D "git://github.com/file/file.git"
>=20
> @@ -18,6 +18,12 @@ S =3D "${WORKDIR}/git"
>=20
>  inherit autotools update-alternatives
>=20
> +PACKAGECONFIG ??=3D "zlib"
> +PACKAGECONFIG_class-native ??=3D "zlib"

Remove PACKAGECONFIG_class-native. It is not needed since it matches=20
PACKAGECONFIG.

> +PACKAGECONFIG[bz2] =3D "--enable-bzlib, --disable-bzlib, bzip2"
> +PACKAGECONFIG[lzma] =3D "--enable-xzlib, --disable-xzlib, xz"
> +PACKAGECONFIG[zlib] =3D "--enable-zlib, --disable-zlib, zlib"
> +
>  EXTRA_OECONF +=3D "--disable-libseccomp"
>=20
>  ALTERNATIVE_${PN} =3D "file"
> --
> 2.20.1

//Peter

