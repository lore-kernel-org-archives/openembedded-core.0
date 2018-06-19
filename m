Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 755DD7544D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 14:03:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id CF87818531;
	Tue, 19 Jun 2018 16:03:39 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 2_8F32C2wLEX; Tue, 19 Jun 2018 16:03:34 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id A626E18403;
	Tue, 19 Jun 2018 16:03:34 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 874C11E09A;
	Tue, 19 Jun 2018 16:03:34 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7AD211E096;
	Tue, 19 Jun 2018 16:03:34 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Tue, 19 Jun 2018 16:03:34 +0200 (CEST)
Received: from XBOX04.axis.com (xbox04.axis.com [10.0.5.18])
	by thoth.se.axis.com (Postfix) with ESMTP id 6DD4319E5;
	Tue, 19 Jun 2018 16:03:34 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX04.axis.com (10.0.5.18) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Tue, 19 Jun 2018 16:03:34 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1365.000; Tue, 19 Jun 2018 16:03:34 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH] subversion: 1.9.7 -> 1.10.0
Thread-Index: AQHUB8ZTz6YZQZ1ryUCdGjI9K5dOnKRnj0Dg
Date: Tue, 19 Jun 2018 14:03:34 +0000
Message-ID: <ead0418805544170893f57cccd105650@XBOX02.axis.com>
References: <20180619120900.12437-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20180619120900.12437-1-richard.purdie@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] subversion: 1.9.7 -> 1.10.0
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
X-List-Received-Date: Tue, 19 Jun 2018 14:03:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Richard Purdie
> Sent: den 19 juni 2018 14:09
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] subversion: 1.9.7 -> 1.10.0
>=20
> License changed since licenses for the bundled linenoise and lz4 codebase=
s
> were added. We don't build either of them. Add MIT since utf8proc is MIT
> licensed.
>=20
> Configure to use the internal utf8proc codebase since we have no copy of =
that in
> OE-Core, nor any need to add one.
>=20
> Add a dependency on lz4 which is now required rather than using the inter=
nal
> codebase within subversion.
>=20
> Drop a patch merged upstream.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  .../{subversion_1.9.7.bb =3D> subversion_1.10.0.bb}    | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>  rename meta/recipes-devtools/subversion/{subversion_1.9.7.bb =3D>
> subversion_1.10.0.bb} (91%)
>=20
> diff --git a/meta/recipes-devtools/subversion/subversion_1.9.7.bb
> b/meta/recipes-devtools/subversion/subversion_1.10.0.bb
> similarity index 91%
> rename from meta/recipes-devtools/subversion/subversion_1.9.7.bb
> rename to meta/recipes-devtools/subversion/subversion_1.10.0.bb
> index da9de9d5b92..82454ae63c3 100644
> --- a/meta/recipes-devtools/subversion/subversion_1.9.7.bb
> +++ b/meta/recipes-devtools/subversion/subversion_1.10.0.bb
> @@ -1,21 +1,20 @@
>  SUMMARY =3D "Subversion (svn) version control system client"
>  HOMEPAGE =3D "http://subversion.tigris.org"

You should change that since subversion.tigris.org contains the old=20
homepage:

HOMEPAGE =3D "http://subversion.apache.org"

>  SECTION =3D "console/network"
> -LICENSE =3D "Apache-2"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Daf81ae49ba359e70626c05e9bf313=
709"
> +LICENSE =3D "Apache-2 & MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D83206f39819e7a4dfca2ff7c190f6=
ce0"
>=20
> -DEPENDS =3D "apr-util serf sqlite3 file"
> +DEPENDS =3D "apr-util serf sqlite3 file lz4"
>  DEPENDS_append_class-native =3D " file-replacement-native"
>=20
>  SRC_URI =3D "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
>             file://disable_macos.patch \
> -           file://serf.m4-Regex-modified-to-allow-D-in-paths.patch \
>             file://0001-Fix-libtool-name-in-configure.ac.patch \
>             file://serfmacro.patch \
>             "
>=20
> -SRC_URI[md5sum] =3D "05b0c677681073920f938c1f322e0be2"
> -SRC_URI[sha256sum] =3D "c3b118333ce12e501d509e66bb0a47bcc34d053990acab45=
559431ac3e491623"
> +SRC_URI[md5sum] =3D "0126847f9e8cb8ed0b90a6a18b203309"
> +SRC_URI[sha256sum] =3D "2cf23f3abb837dea0585a6b0ebd70e80e01f95bddef7c1aa=
097c18e3eaa6b584"
>=20
>  inherit autotools pkgconfig gettext
>=20
> @@ -31,6 +30,7 @@ EXTRA_OECONF =3D " \
>      --without-berkeley-db \
>      --without-swig \
>      --disable-keychain \
> +    --with-utf8proc=3Dinternal \
>      ac_cv_path_RUBY=3Dnone \
>  "
>=20
> --
> 2.17.1

//Peter


