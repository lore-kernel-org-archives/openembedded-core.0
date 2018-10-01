Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 411BC7A499
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Oct 2018 10:33:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id EE4EB183C4;
	Mon,  1 Oct 2018 12:33:59 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id usZH0zBkDb9a; Mon,  1 Oct 2018 12:33:59 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id BF06318136;
	Mon,  1 Oct 2018 12:33:58 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 99A421E091;
	Mon,  1 Oct 2018 12:33:58 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8DEB21E090;
	Mon,  1 Oct 2018 12:33:58 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Mon,  1 Oct 2018 12:33:58 +0200 (CEST)
Received: from XBOX04.axis.com (xbox04.axis.com [10.0.5.18])
	by thoth.se.axis.com (Postfix) with ESMTP id 81BC2250A;
	Mon,  1 Oct 2018 12:33:58 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX04.axis.com (10.0.5.18) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Mon, 1 Oct 2018 12:33:58 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1365.000; Mon, 1 Oct 2018 12:33:58 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "changqing.li@windriver.com" <changqing.li@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] pango: fix ptest failed problem
Thread-Index: AQHUWGFGKrJSp+m9TEm4AR/X7AfokqUKMiig
Date: Mon, 1 Oct 2018 10:33:58 +0000
Message-ID: <59e55b7b641c4a19a258fedf95712464@XBOX02.axis.com>
References: <1538272773-298871-1-git-send-email-changqing.li@windriver.com>
In-Reply-To: <1538272773-298871-1-git-send-email-changqing.li@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH] pango: fix ptest failed problem
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
X-List-Received-Date: Mon, 01 Oct 2018 10:33:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> core-bounces@lists.openembedded.org> On Behalf Of
> changqing.li@windriver.com
> Sent: den 30 september 2018 04:00
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] pango: fix ptest failed problem
>=20
> From: Changqing Li <changqing.li@windriver.com>
>=20
> disable-debug will cause compiling with G_DISABLE_ASSERT, but ptest
> need
> it, so don't disable-debug when ptest is enabled.
>=20
> ptest fail error:
>=20
> Tests were compiled with G_DISABLE_ASSERT and are likely no-ops.
> Aborting.
> FAIL: pango/test-font.test (Child process exited with code 1)
> Running test: pango/testboundaries_ucd.test
> Tests were compiled with G_DISABLE_ASSERT and are likely no-ops.
> Aborting.
> FAIL: pango/testboundaries_ucd.test (Child process exited with code 1)
> Running test: pango/testboundaries.test
> Tests were compiled with G_DISABLE_ASSERT and are likely no-ops.
> Aborting.
> FAIL: pango/testboundaries.test (Child process exited with code 1)
> Running test: pango/testattributes.test
> Tests were compiled with G_DISABLE_ASSERT and are likely no-ops.
> Aborting.
>=20
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta/recipes-graphics/pango/pango_1.42.4.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-graphics/pango/pango_1.42.4.bb
> b/meta/recipes-graphics/pango/pango_1.42.4.bb
> index e73fd28..c680720 100644
> --- a/meta/recipes-graphics/pango/pango_1.42.4.bb
> +++ b/meta/recipes-graphics/pango/pango_1.42.4.bb
> @@ -24,7 +24,7 @@ DEPENDS =3D "glib-2.0 glib-2.0-native fontconfig freety=
pe virtual/libiconv cairo h
>  PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
>  PACKAGECONFIG[x11] =3D "--with-xft,--without-xft,virtual/libx11 libxft"
>=20
> -EXTRA_OECONF =3D "--disable-debug"
> +EXTRA_OECONF =3D "${@bb.utils.contains('DISTRO_FEATURES', 'ptest',"","--=
disable-debug",d)}"

The above can be written cleaner as:

PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'ptest x11', d)}=
"
PACKAGECONFIG[ptest] =3D "--enable-debug,--disable-debug"
PACKAGECONFIG[x11] =3D "--with-xft,--without-xft,virtual/libx11 libxft"

(I added the --enable-debug to the ptest PACKAGECONFIG for symmetry,=20
even though I assume it is the default.)

>  LEAD_SONAME =3D "libpango-1.0*"
>  LIBV =3D "1.8.0"
> --
> 2.7.4

//Peter


