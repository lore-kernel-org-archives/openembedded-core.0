Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7161E789E9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2018 12:16:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 794E018568;
	Wed, 18 Jul 2018 14:16:19 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id bd_H7ZNJWyTH; Wed, 18 Jul 2018 14:16:18 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 068CA182C6;
	Wed, 18 Jul 2018 14:16:18 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E596E1E079;
	Wed, 18 Jul 2018 14:16:17 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D9E891E078;
	Wed, 18 Jul 2018 14:16:17 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Wed, 18 Jul 2018 14:16:17 +0200 (CEST)
Received: from XBOX01.axis.com (xbox01.axis.com [10.0.5.15])
	by seth.se.axis.com (Postfix) with ESMTP id CDB0517DD;
	Wed, 18 Jul 2018 14:16:17 +0200 (CEST)
Received: from xbox12.axis.com (10.0.5.26) by XBOX01.axis.com (10.0.5.15) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Wed, 18 Jul 2018 14:16:17 +0200
Received: from XBOX02.axis.com (10.0.5.16) by xbox12.axis.com (10.0.5.26) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Wed, 18 Jul 2018 14:16:17 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1365.000; Wed, 18 Jul 2018 14:16:17 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Carlos Rafael Giani <dv@pseudoterminal.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/6] gstreamer1.0-plugin-base: Update
	packageconfigs
Thread-Index: AQHUHbLqp1s/gHbLc0Ckih3vokxxrKSU2+JQ
Date: Wed, 18 Jul 2018 12:16:17 +0000
Message-ID: <ab21735150494d73905719782959b68d@XBOX02.axis.com>
References: <20180717093523.5582-1-dv@pseudoterminal.org>
In-Reply-To: <20180717093523.5582-1-dv@pseudoterminal.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH 1/6] gstreamer1.0-plugin-base: Update	packageconfigs
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
X-List-Received-Date: Wed, 18 Jul 2018 12:16:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Carlos Rafael Giani
> Sent: den 17 juli 2018 11:35
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 1/6] gstreamer1.0-plugin-base: Update
> packageconfigs
>=20
> * Always enable zlib, since it is part of oe-core, and dependencies that
>   are in oe-core can be always enabled

Just because it can be enabled does not mean it should be unconditionally=20
enabled. If building for an environment where, e.g., flash memory is scarce=
,=20
every byte counts. Keeping the packageconfig and leaving it enabled by=20
default will give the same result, but for someone trying to remove anythin=
g=20
they do not need, it is then more obvious that the jpeg dependency is=20
optional and can be removed if wanted.

> * The jpeg packageconfig is not needed, since there are no configuration
>   switches to enable or disable it, and libjpeg-turbo is part of oe-core

Same here as for zlib.

> * libpng is a dependency, and is part of oe-core, so add it to DEPENDS

This too is optional and should have a packageconfig (which can be=20
enabled by default since it is pulled in anyway due to other dependencies).

> * There is no libvisual recipe in oe-core or in meta-openembedded, so
>   the visual packageconfig needs to go
> * Reorder the packageconfigs alphabetically

You also add dependencies on libgudev and libdrm, without mentioning it her=
e.
Why is this? They too are optional, and they have not been needed before.=20
If you want to add support for them, then do so by adding packageconfigs=20
(which I don't think should be enabled by default to maintain the=20
configuration as it was).

> Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
> ---
>  .../gstreamer1.0-plugins-base_1.14.1.bb       | 26 +++++++++++--------
>  1 file changed, 15 insertions(+), 11 deletions(-)
>=20
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_=
1.14.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.1=
4.1.bb
> index 8d7d3c6192..52722ff615 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.14.1.=
bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.14.1.=
bb
> @@ -24,18 +24,21 @@ SRC_URI[sha256sum] =3D
> "1026c7c3082d825d9b5d034c1a6dd8a4ebab60eb3738b0a0afde4ad2dc
>=20
>  S =3D "${WORKDIR}/gst-plugins-base-${PV}"
>=20
> -DEPENDS +=3D "iso-codes util-linux"
> +DEPENDS +=3D "iso-codes util-linux zlib libgudev libdrm jpeg libpng"
>=20
>  inherit gettext
>=20
>  PACKAGES_DYNAMIC =3D+ "^libgst.*"
>=20
> +# opengl packageconfig factored out to make it easy for distros
> +# and BSP layers to pick either (desktop) opengl, gles2, or no GL
>  PACKAGECONFIG_GL ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'opengl',=
 'gles2 egl', '', d)}"
> +
>  PACKAGECONFIG ??=3D " \
>      ${GSTREAMER_ORC} \
> -    ${@bb.utils.filter('DISTRO_FEATURES', 'alsa x11', d)} \
> -    gio-unix-2.0 ogg pango theora vorbis zlib jpeg \
>      ${PACKAGECONFIG_GL} \
> +    ${@bb.utils.filter('DISTRO_FEATURES', 'alsa x11', d)} \
> +    gio-unix-2.0 ogg pango theora vorbis \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland egl', ''=
, d)} \
>  "
>=20
> @@ -45,26 +48,27 @@ X11DISABLEOPTS =3D "--disable-x --disable-xvideo --
> disable-xshm"
>=20
>  PACKAGECONFIG[alsa]         =3D "--enable-alsa,--disable-alsa,alsa-lib"
>  PACKAGECONFIG[cdparanoia]   =3D "--enable-cdparanoia,--disable-cdparanoi=
a,cdparanoia"
> +PACKAGECONFIG[egl]          =3D "--enable-egl,--disable-egl,virtual/egl"
>  PACKAGECONFIG[gio-unix-2.0] =3D "--enable-gio_unix_2_0,--disable-gio_uni=
x_2_0,glib-2.0"
> +PACKAGECONFIG[gles2]        =3D "--enable-gles2,--disable-gles2,virtual/=
libgles2"
>  PACKAGECONFIG[ivorbis]      =3D "--enable-ivorbis,--disable-ivorbis,trem=
or"
>  PACKAGECONFIG[ogg]          =3D "--enable-ogg,--disable-ogg,libogg"
> +PACKAGECONFIG[opengl]       =3D "--enable-opengl,--disable-opengl,virtua=
l/libgl libglu"
>  PACKAGECONFIG[opus]         =3D "--enable-opus,--disable-opus,libopus"
>  PACKAGECONFIG[pango]        =3D "--enable-pango,--disable-pango,pango"
>  PACKAGECONFIG[theora]       =3D "--enable-theora,--disable-theora,libthe=
ora"
> -PACKAGECONFIG[visual]       =3D "--enable-libvisual,--disable-libvisual,=
libvisual"
>  PACKAGECONFIG[vorbis]       =3D "--enable-vorbis,--disable-vorbis,libvor=
bis"
>  PACKAGECONFIG[x11]          =3D "${X11ENABLEOPTS},${X11DISABLEOPTS},${X1=
1DEPENDS}"
> -PACKAGECONFIG[zlib]         =3D "--enable-zlib,--disable-zlib,zlib"
> -PACKAGECONFIG[opengl]       =3D "--enable-opengl,--disable-opengl,virtua=
l/libgl libglu"
> -PACKAGECONFIG[gles2]        =3D "--enable-gles2,--disable-gles2,virtual/=
libgles2"
> -PACKAGECONFIG[egl]          =3D "--enable-egl,--disable-egl,virtual/egl"
>  PACKAGECONFIG[wayland]      =3D "--enable-wayland,--disable-wayland,wayl=
and-native wayland wayland-protocols libdrm"
> -PACKAGECONFIG[jpeg]         =3D ",,jpeg"
>=20
> +EXTRA_OECONF +=3D " \
> +    --enable-zlib \
> +    --disable-libvisual \
> +"
> +
> +FILES_${PN}-dev +=3D "${libdir}/gstreamer-${LIBV}/include/gst/gl/gstglco=
nfig.h"
>  FILES_${MLPREFIX}libgsttag-1.0 +=3D "${datadir}/gst-plugins-base/1.0/lic=
ense-translations.dict"
>=20
>  do_compile_prepend() {
>          export GIR_EXTRA_LIBS_PATH=3D"${B}/gst-libs/gst/tag/.libs:${B}/g=
st-libs/gst/video/.libs:${B}/gst-libs/gst/audio/.libs:${B}/gst-libs/gst/rtp=
/.libs:${B}/gst-libs/gst/allocators/.libs"
>  }
> -
> -FILES_${PN}-dev +=3D "${libdir}/gstreamer-${LIBV}/include/gst/gl/gstglco=
nfig.h"
> --
> 2.17.1

//Peter


