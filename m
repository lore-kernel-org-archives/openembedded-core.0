Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
	by mail.openembedded.org (Postfix) with ESMTP id 4AD767FA42
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Dec 2019 13:00:50 +0000 (UTC)
IronPort-SDR: 0nSNTRliVHKnAWMCDGvF2aQyr8gQkauXEGuhLk3c1Cl4ZzeJTxbUxIZYoaGtkwec8JZ705/I8Q
	xfBm5rdShDSMAqsGjHKgBpcCNx2W3mYrgC7JFjuEuewjnPBO1doXodnClVkO6t5nG84FB5PzCn
	dekzuDv98ohwxDxo0w4KJCcTuVB2S6keO8bu8rVtVADl09ucUWIHtOO80BTn1Pv3JmoQynteg9
	mW9hDojK3OLN5b0/bhZGuBFuNUwpSMGVgjAV9PxHO46k8MMG/UTApq8qpXeaLtjM3GvDfVUdoq
	eNA=
X-IronPort-AV: E=Sophos;i="5.69,343,1571695200"; 
   d="scan'208";a="3724734"
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [master][zeus][PATCH] cairo: Adapt license for
	cairo-dbg	and cairo-src based on contents
Thread-Index: AQHVq7uC0kop8/hq/kG3JA3Bp1z6uKfGOCTA
Date: Sun, 22 Dec 2019 13:00:51 +0000
Message-ID: <67f9adf18b174290bd5fc91b8aa00c66@XBOX03.axis.com>
References: <20191205222617.31872-1-pkj@axis.com>
In-Reply-To: <20191205222617.31872-1-pkj@axis.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Subject: Re: [master][zeus][PATCH] cairo: Adapt license for cairo-dbg	and cairo-src based on contents
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
X-List-Received-Date: Sun, 22 Dec 2019 13:00:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

*ping*

//Peter

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-core=
-
> bounces@lists.openembedded.org> On Behalf Of Peter Kjellerstedt
> Sent: den 5 december 2019 23:26
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [master][zeus][PATCH] cairo: Adapt license for cairo-
> dbg and cairo-src based on contents
>=20
> Introduce a PACKAGECONFIG "trace" to disable cairo-trace (the only
> part of the code licensed as GPL-3.0, and which is normally packaged
> separately in cairo-perf-utils). By disabling this, we can adapt the
> licenses for cairo-dbg and cairo-src so that they do not include
> "GPLv3+" when trace is disabled and thus they can be used also when,
> e.g., GPL-3.0 is blacklisted in INCOMPATIBLE_LICENSE.
>=20
> The "trace" PACKAGECONFIG is enabled by default for backwards
> compatibility.
>=20
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  meta/recipes-graphics/cairo/cairo_1.16.0.bb | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-graphics/cairo/cairo_1.16.0.bb b/meta/recipes-
> graphics/cairo/cairo_1.16.0.bb
> index e3de3f6164..36a7b3c180 100644
> --- a/meta/recipes-graphics/cairo/cairo_1.16.0.bb
> +++ b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
> @@ -17,6 +17,10 @@ LICENSE_${PN}-doc =3D "MPL-1.1 | LGPLv2.1"
>  LICENSE_${PN}-gobject =3D "MPL-1.1 | LGPLv2.1"
>  LICENSE_${PN}-script-interpreter =3D "MPL-1.1 | LGPLv2.1"
>  LICENSE_${PN}-perf-utils =3D "GPLv3+"
> +# Adapt the licenses for cairo-dbg and cairo-src depending on whether
> +# cairo-trace is being built.
> +LICENSE_${PN}-dbg =3D "(MPL-1.1 |
> LGPLv2.1)${@bb.utils.contains('PACKAGECONFIG', 'trace', ' & GPLv3+', '',
> d)}"
> +LICENSE_${PN}-src =3D "(MPL-1.1 |
> LGPLv2.1)${@bb.utils.contains('PACKAGECONFIG', 'trace', ' & GPLv3+', '',
> d)}"
>=20
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De73e999e0c72b5ac9012424fa157a=
d77"
>=20
> @@ -40,7 +44,8 @@ X11DEPENDS =3D "virtual/libx11 libsm libxrender libxext=
"
>=20
>  PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'directfb', d=
)}
> \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11
> xcb', '', d)} \
> -                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl',
> 'opengl', '', d)}"
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl',
> 'opengl', '', d)} \
> +                   trace"
>=20
>  PACKAGECONFIG[x11] =3D "--with-x=3Dyes -enable-xlib,--with-x=3Dno --disa=
ble-
> xlib,${X11DEPENDS}"
>  PACKAGECONFIG[xcb] =3D "--enable-xcb,--disable-xcb,libxcb"
> @@ -49,6 +54,7 @@ PACKAGECONFIG[valgrind] =3D "--enable-valgrind=3Dyes,--
> disable-valgrind,valgrind"
>  PACKAGECONFIG[egl] =3D "--enable-egl=3Dyes,--disable-egl,virtual/egl"
>  PACKAGECONFIG[glesv2] =3D "--enable-glesv2,--disable-
> glesv2,virtual/libgles2"
>  PACKAGECONFIG[opengl] =3D "--enable-gl,--disable-gl,virtual/libgl"
> +PACKAGECONFIG[trace] =3D "--enable-trace,--disable-trace"
>=20
>  EXTRA_OECONF +=3D " \
>      ${@bb.utils.contains('TARGET_FPU', 'soft', '--disable-some-floating-
> point', '', d)} \
> --
> 2.21.0
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

