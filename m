Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id A7D437C082
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 15:50:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id E2C3F183C7;
	Mon, 14 Jan 2019 16:50:46 +0100 (CET)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id ROYWASLG4dq9; Mon, 14 Jan 2019 16:50:45 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 2A6A61831E;
	Mon, 14 Jan 2019 16:50:45 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 18BB31E075;
	Mon, 14 Jan 2019 16:50:45 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0D7641E074;
	Mon, 14 Jan 2019 16:50:45 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Mon, 14 Jan 2019 16:50:45 +0100 (CET)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by thoth.se.axis.com (Postfix) with ESMTP id 018AD16BC;
	Mon, 14 Jan 2019 16:50:45 +0100 (CET)
Received: from xbox11.axis.com (10.0.5.25) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Mon, 14 Jan 2019 16:50:44 +0100
Received: from XBOX04.axis.com (10.0.5.18) by xbox11.axis.com (10.0.5.25) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Mon, 14 Jan 2019 16:50:44 +0100
Received: from XBOX04.axis.com ([fe80::210a:724b:68cb:a917]) by
	XBOX04.axis.com ([fe80::210a:724b:68cb:a917%22]) with mapi id
	15.00.1365.000; Mon, 14 Jan 2019 16:50:44 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 07/23] libepoxy: enable native/nativesdk
	variants
Thread-Index: AQHUrBqC9ObWwsH3qkK4cAe0K4Rf36Wu5o5w
Date: Mon, 14 Jan 2019 15:50:44 +0000
Message-ID: <3d19369484a84d2c879b580dc121a718@XBOX04.axis.com>
References: <cover.1547477793.git.alex.kanavin@gmail.com>
	<3a7a4903e87c0cd564e7652c463cbc6baead9cc6.1547477793.git.alex.kanavin@gmail.com>
In-Reply-To: <3a7a4903e87c0cd564e7652c463cbc6baead9cc6.1547477793.git.alex.kanavin@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH 07/23] libepoxy: enable native/nativesdk variants
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
X-List-Received-Date: Mon, 14 Jan 2019 15:50:47 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> core-bounces@lists.openembedded.org> On Behalf Of Alexander Kanavin
> Sent: den 14 januari 2019 16:03
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 07/23] libepoxy: enable native/nativesdk
> variants
>=20
> libepoxy is a requirement of virglrenderer. Note that we strip
> RPATH from the library, as this allows fall-through to the host
> GL implementation, instead of attempting (and failing) to use
> mesa-native.
>=20
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/recipes-graphics/libepoxy/libepoxy_1.5.3.bb | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> diff --git a/meta/recipes-graphics/libepoxy/libepoxy_1.5.3.bb
> b/meta/recipes-graphics/libepoxy/libepoxy_1.5.3.bb
> index 92f644c039d..45995325d2c 100644
> --- a/meta/recipes-graphics/libepoxy/libepoxy_1.5.3.bb
> +++ b/meta/recipes-graphics/libepoxy/libepoxy_1.5.3.bb
> @@ -14,9 +14,21 @@ UPSTREAM_CHECK_URI =3D "https://github.com/anholt/libe=
poxy/releases"
>  inherit meson pkgconfig distro_features_check
>=20
>  REQUIRED_DISTRO_FEATURES =3D "opengl"
> +REQUIRED_DISTRO_FEATURES_class-native =3D ""
> +REQUIRED_DISTRO_FEATURES_class-nativesdk =3D ""
>=20
>  PACKAGECONFIG[egl] =3D "-Degl=3Dyes, -Degl=3Dno, virtual/egl"
>  PACKAGECONFIG[x11] =3D "-Dglx=3Dyes, -Dglx=3Dno, virtual/libx11 virtual/=
libgl"
>  PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)} eg=
l"
>=20
>  EXTRA_OEMESON +=3D "-Dtests=3Dfalse"
> +
> +PACKAGECONFIG_class-native =3D "egl"
> +PACKAGECONFIG_class-nativesdk =3D "egl"
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> +
> +# This will ensure that dlopen will attempt only GL libraries provided b=
y host
> +do_install_append () {
> +    chrpath --delete ${D}${libdir}/*.so
> +}

Shouldn't this only be done for native/nativesdk? I.e.:

do_install_append_class-native() {
	chrpath --delete ${D}${libdir}/*.so
}

do_install_append_class-nativesdk() {
	chrpath --delete ${D}${libdir}/*.so
}

(I also changed the indentation to tabs as I believe that is still=20
the official OE-Core standard for shell code in recipes.)

> --
> 2.17.1

//Peter


