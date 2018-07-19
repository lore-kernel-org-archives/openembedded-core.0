Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id BF78E607DE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 11:07:17 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id g6-v6so7659438wrp.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 04:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=ydUR5xoacRKdmOFil5zyn6u9XTUvvGhYjZ+0BfYejp0=;
	b=raG2IxTgj8K1mXCXsDdJRoHontI8LmCk/NDLAk/4Q7YqdGzINKeA9yqLVNzSArGRgc
	oB4xuD3D6LzYvonLVtdUQyzaqBDaPvEk27NJAmAIOZKEaKxhO6NBbVrw6vngMexmEeTk
	r373wR98DHhkIbIvonTZrMq9VmRWVIUK3j6SKGBN9yJdL3gu9eK48eETGh7NVocSEdpL
	A+jqrfNAwQywPNf6isK60Zrr73v1LxSxGL2P+RcTL7ykrlDyAS6pDa5deXrr3vFAlP6X
	q7++AfqrBN1MF5xh6a6RpsiTSI9ftIS0oi1a2W7hUo7sveLsICkRnGEp1cBBAESVY/Ol
	t0og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=ydUR5xoacRKdmOFil5zyn6u9XTUvvGhYjZ+0BfYejp0=;
	b=n49BRtf9VL+pqizDqvNT4vumlau6oJ3q7mWtS7WH3YwSHId9okyEEzb5W28CWVSU99
	cGSaf2hZbA8gi53uKmk2wEnHHkBD8Sa229iZ3ezAM0C64J/xrof2+d7rj81BzDSDH1kh
	iOwY167xIAKTf3moGoBzQewYefX/NB+U2Li6pXl5F38ewEETqv14M1cb3BoJwpucgB/Y
	ld6os3Z1wUbQGkeVLI1f6UDnXNA2Vv4JkpG2iXTTWBtYxUFUt8hAiS4IfGWSgOSsS7oY
	LfOT1S/diTqQyzztZsdyUgJDhcc1gl0k3/2mN6bN3donC97m9gMcWPByRd0n418DWyGr
	1RUA==
X-Gm-Message-State: AOUpUlE4e1Jubi0eYi7GW9S82ov/SOls4p7LU07DDum9qYE1ZKU5WflT
	umA/eiZHsNhNBT87RTcLTl63NzbY
X-Google-Smtp-Source: AAOMgpdibkprdpbHujEtCZ34RcdrY2jdl+WnU9X4u620A8PEZVPCZxkaLcwxfKhRZbuqUmKefS18hA==
X-Received: by 2002:adf:9303:: with SMTP id 3-v6mr7192847wro.197.1531998438425;
	Thu, 19 Jul 2018 04:07:18 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	185-v6sm8183455wmw.23.2018.07.19.04.07.16
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 19 Jul 2018 04:07:17 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 19 Jul 2018 13:07:20 +0200
To: Carlos Rafael Giani <dv@pseudoterminal.org>
Message-ID: <20180719110720.GA1436@jama>
References: <20180719100714.9639-1-dv@pseudoterminal.org>
MIME-Version: 1.0
In-Reply-To: <20180719100714.9639-1-dv@pseudoterminal.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/6] gstreamer1.0-plugin-base: Update packageconfigs
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
X-List-Received-Date: Thu, 19 Jul 2018 11:07:18 -0000
X-Groupsio-MsgNum: 113682
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2fHTh5uZTiUOsy+g"
Content-Disposition: inline

--2fHTh5uZTiUOsy+g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 19, 2018 at 12:07:09PM +0200, Carlos Rafael Giani wrote:
> * Add patches for gbm, libpng, libjpeg to conditionally enable/disable
>   them in the configure script
> * There is no libvisual recipe in oe-core or in meta-openembedded, so
>   the visual packageconfig needs to go

No, it doesn't need to go and shouldn't.

Why are you trying to force people who already have libvisual recipe
(maybe from one of these 2
layers: http://layers.openembedded.org/layerindex/branch/master/recipes/?q=
=3Dlibvisual )
to create gstreamer1.0-plugins-base bbappend just to return the
PACKAGECONFIG and remove the --disable-libvisual from EXTRA_OECONF?
It doesn't make any sense. Extra PACKAGECONFIGs for stuff you might not
use doesn't cause any extra overhead, yes they are less tested than the
stuff which people usually have enabled/disabled, but still having the
PACKAGECONFIG available makes it much easier for project layers to
correctly configure recipes in upstream layers.

> * Reorder the packageconfigs alphabetically
>=20
> Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
> ---
>  ...r-explicitely-enabling-disabling-GBM.patch |  70 ++++++++++++
>  ...for-explicitely-enabling-disabling-P.patch | 107 ++++++++++++++++++
>  .../gstreamer1.0-plugins-base_1.14.1.bb       |  29 +++--
>  3 files changed, 196 insertions(+), 10 deletions(-)
>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugin=
s-base/0010-gl-Add-switch-for-explicitely-enabling-disabling-GBM.patch
>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugin=
s-base/0011-gl-Add-switches-for-explicitely-enabling-disabling-P.patch
>=20
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/=
0010-gl-Add-switch-for-explicitely-enabling-disabling-GBM.patch b/meta/reci=
pes-multimedia/gstreamer/gstreamer1.0-plugins-base/0010-gl-Add-switch-for-e=
xplicitely-enabling-disabling-GBM.patch
> new file mode 100644
> index 0000000000..79e0b78aaf
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0010-gl=
-Add-switch-for-explicitely-enabling-disabling-GBM.patch
> @@ -0,0 +1,70 @@
> +From 7f93afc497010384da9f9d15163c31a862bd1dfa Mon Sep 17 00:00:00 2001
> +From: Carlos Rafael Giani <dv@pseudoterminal.org>
> +Date: Thu, 19 Jul 2018 10:30:54 +0200
> +Subject: [PATCH 10/11] gl: Add switch for explicitely enabling/disabling=
 GBM
> + support
> +
> +https://bugzilla.gnome.org/show_bug.cgi?id=3D796833
> +---
> + m4/gst-gl.m4 | 38 +++++++++++++++++++++++++++++---------
> + 1 file changed, 29 insertions(+), 9 deletions(-)
> +
> +diff --git a/m4/gst-gl.m4 b/m4/gst-gl.m4
> +index 1e9724094..20b2233de 100644
> +--- a/m4/gst-gl.m4
> ++++ b/m4/gst-gl.m4
> +@@ -117,6 +117,15 @@ AC_ARG_ENABLE([dispmanx],
> +        *) AC_MSG_ERROR([bad value ${enableval} for --enable-dispmanx]) =
;;
> +      esac],[NEED_DISPMANX=3Dauto])
> +=20
> ++AC_ARG_ENABLE([gbm],
> ++     [  --enable-gbm        Enable Mesa3D GBM support (requires EGL) @<=
:@default=3Dauto@:>@],
> ++     [case "${enableval}" in
> ++       yes)  NEED_GBM=3Dyes ;;
> ++       no)   NEED_GBM=3Dno ;;
> ++       auto) NEED_GBM=3Dauto ;;
> ++       *) AC_MSG_ERROR([bad value ${enableval} for --enable-gbm]) ;;
> ++     esac],[NEED_GBM=3Dauto])
> ++
> + AG_GST_PKG_CHECK_MODULES(X11_XCB, x11-xcb)
> + save_CPPFLAGS=3D"$CPPFLAGS"
> + save_LIBS=3D"$LIBS"
> +@@ -172,15 +181,26 @@ case $host in
> +         AC_CHECK_LIB([EGL], [fbGetDisplay], [HAVE_VIV_FB_EGL=3Dyes])
> +     fi
> +=20
> +-    if test "x$HAVE_EGL" =3D "xyes"; then
> +-        PKG_CHECK_MODULES(DRM, libdrm >=3D 2.4.55, HAVE_DRM=3Dyes, HAVE=
_DRM=3Dno)
> +-        AC_SUBST(DRM_CFLAGS)
> +-        AC_SUBST(DRM_LIBS)
> +-        if test "x$HAVE_DRM" =3D "xyes" -a "x$HAVE_GUDEV" =3D "xyes"; t=
hen
> +-          PKG_CHECK_MODULES(GBM, gbm, HAVE_GBM_EGL=3Dyes, HAVE_GBM_EGL=
=3Dno)
> +-          AC_SUBST(GBM_CFLAGS)
> +-          AC_SUBST(GBM_LIBS)
> +-       fi
> ++    if test "x$HAVE_EGL" =3D "xyes" -a "x$NEED_GBM" !=3D "xno"; then
> ++      PKG_CHECK_MODULES(DRM, libdrm >=3D 2.4.55, HAVE_DRM=3Dyes, HAVE_D=
RM=3Dno)
> ++      AC_SUBST(DRM_CFLAGS)
> ++      AC_SUBST(DRM_LIBS)
> ++      if test "x$NEED_GBM" =3D "xyes"; then
> ++        if test "x$HAVE_DRM" =3D "xno"; then
> ++          AC_MSG_ERROR([GBM support requested but libdrm is not availab=
le])
> ++        fi
> ++        if test "x$HAVE_GUDEV" =3D "xno"; then
> ++          AC_MSG_ERROR([GBM support requested but gudev is not availabl=
e])
> ++        fi
> ++      fi
> ++      if test "x$HAVE_DRM" =3D "xyes" -a "x$HAVE_GUDEV" =3D "xyes"; then
> ++        PKG_CHECK_MODULES(GBM, gbm, HAVE_GBM_EGL=3Dyes, HAVE_GBM_EGL=3D=
no)
> ++        if test "x$HAVE_GBM_EGL" =3D "xno" -a "x$NEED_GBM" =3D "xyes"; =
then
> ++          AC_MSG_ERROR([GBM support requested but gbm library is not av=
ailable])
> ++        fi
> ++        AC_SUBST(GBM_CFLAGS)
> ++        AC_SUBST(GBM_LIBS)
> ++      fi
> +     fi
> +=20
> +     dnl FIXME: Mali EGL depends on GLESv1 or GLESv2
> +--=20
> +2.17.1
> +
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/=
0011-gl-Add-switches-for-explicitely-enabling-disabling-P.patch b/meta/reci=
pes-multimedia/gstreamer/gstreamer1.0-plugins-base/0011-gl-Add-switches-for=
-explicitely-enabling-disabling-P.patch
> new file mode 100644
> index 0000000000..3e22332dab
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0011-gl=
-Add-switches-for-explicitely-enabling-disabling-P.patch
> @@ -0,0 +1,107 @@
> +From 092aadfc1df69c46d920b0cd39f98d363d6988b3 Mon Sep 17 00:00:00 2001
> +From: Carlos Rafael Giani <dv@pseudoterminal.org>
> +Date: Thu, 19 Jul 2018 11:16:05 +0200
> +Subject: [PATCH 11/11] gl: Add switches for explicitely enabling/disabli=
ng PNG
> + and JPEG support
> +
> +https://bugzilla.gnome.org/show_bug.cgi?id=3D796833
> +---
> + m4/gst-gl.m4 | 66 ++++++++++++++++++++++++++++++++++++----------------
> + 1 file changed, 46 insertions(+), 20 deletions(-)
> +
> +diff --git a/m4/gst-gl.m4 b/m4/gst-gl.m4
> +index 20b2233de..f8809981c 100644
> +--- a/m4/gst-gl.m4
> ++++ b/m4/gst-gl.m4
> +@@ -126,6 +126,24 @@ AC_ARG_ENABLE([gbm],
> +        *) AC_MSG_ERROR([bad value ${enableval} for --enable-gbm]) ;;
> +      esac],[NEED_GBM=3Dauto])
> +=20
> ++AC_ARG_ENABLE([png],
> ++     [  --enable-png        Enable libpng support @<:@default=3Dauto@:>=
@],
> ++     [case "${enableval}" in
> ++       yes)  NEED_PNG=3Dyes ;;
> ++       no)   NEED_PNG=3Dno ;;
> ++       auto) NEED_PNG=3Dauto ;;
> ++       *) AC_MSG_ERROR([bad value ${enableval} for --enable-png]) ;;
> ++     esac],[NEED_PNG=3Dauto])
> ++
> ++AC_ARG_ENABLE([jpeg],
> ++     [  --enable-jpeg        Enable libjpeg support @<:@default=3Dauto@=
:>@],
> ++     [case "${enableval}" in
> ++       yes)  NEED_JPEG=3Dyes ;;
> ++       no)   NEED_JPEG=3Dno ;;
> ++       auto) NEED_JPEG=3Dauto ;;
> ++       *) AC_MSG_ERROR([bad value ${enableval} for --enable-jpeg]) ;;
> ++     esac],[NEED_JPEG=3Dauto])
> ++
> + AG_GST_PKG_CHECK_MODULES(X11_XCB, x11-xcb)
> + save_CPPFLAGS=3D"$CPPFLAGS"
> + save_LIBS=3D"$LIBS"
> +@@ -1043,9 +1061,13 @@ dnl Needed by plugins that use g_module_*() API
> + PKG_CHECK_MODULES(GMODULE_NO_EXPORT, gmodule-no-export-2.0)
> +=20
> + dnl libpng is optional
> +-PKG_CHECK_MODULES(LIBPNG, libpng >=3D 1.0, HAVE_PNG=3Dyes, HAVE_PNG=3Dn=
o)
> +-if test "x$HAVE_PNG" =3D "xyes"; then
> +-  AC_DEFINE(HAVE_PNG, [1] , [Use libpng])
> ++if test "x$NEED_PNG" !=3D "xno"; then
> ++  PKG_CHECK_MODULES(LIBPNG, libpng >=3D 1.0, HAVE_PNG=3Dyes, HAVE_PNG=
=3Dno)
> ++  if test "x$HAVE_PNG" =3D "xyes"; then
> ++    AC_DEFINE(HAVE_PNG, [1] , [Use libpng])
> ++  elif test "x$NEED_PNG" =3D "xyes"; then
> ++    AC_MSG_ERROR([libpng support requested but libpng is not available])
> ++  fi
> + fi
> + AC_SUBST(HAVE_PNG)
> + AC_SUBST(LIBPNG_LIBS)
> +@@ -1053,25 +1075,29 @@ AC_SUBST(LIBPNG_CFLAGS)
> +=20
> + dnl libjpeg is optional
> + AC_ARG_WITH(jpeg-mmx, [  --with-jpeg-mmx, path to MMX'ified JPEG librar=
y])
> +-OLD_LIBS=3D"$LIBS"
> +-if test x$with_jpeg_mmx !=3D x; then
> +-  LIBS=3D"$LIBS -L$with_jpeg_mmx"
> +-fi
> +-AC_CHECK_LIB(jpeg-mmx, jpeg_set_defaults, HAVE_JPEG=3D"yes", HAVE_JPEG=
=3D"no")
> +-JPEG_LIBS=3D"$LIBS -ljpeg-mmx"
> +-LIBS=3D"$OLD_LIBS"
> +-if test x$HAVE_JPEG !=3D xyes; then
> +-  JPEG_LIBS=3D"-ljpeg"
> +-  AC_CHECK_LIB(jpeg, jpeg_set_defaults, HAVE_JPEG=3D"yes", HAVE_JPEG=3D=
"no")
> +-fi
> ++if test "x$NEED_JPEG" !=3D "xno"; then
> ++  OLD_LIBS=3D"$LIBS"
> ++  if test x$with_jpeg_mmx !=3D x; then
> ++    LIBS=3D"$LIBS -L$with_jpeg_mmx"
> ++  fi
> ++  AC_CHECK_LIB(jpeg-mmx, jpeg_set_defaults, HAVE_JPEG=3D"yes", HAVE_JPE=
G=3D"no")
> ++  JPEG_LIBS=3D"$LIBS -ljpeg-mmx"
> ++  LIBS=3D"$OLD_LIBS"
> ++  if test x$HAVE_JPEG !=3D xyes; then
> ++    JPEG_LIBS=3D"-ljpeg"
> ++    AC_CHECK_LIB(jpeg, jpeg_set_defaults, HAVE_JPEG=3D"yes", HAVE_JPEG=
=3D"no")
> ++  fi
> +=20
> +-if test x$HAVE_JPEG =3D xyes; then
> +-  AC_DEFINE(HAVE_JPEG, [1], [Use libjpeg])
> +-else
> +-  JPEG_LIBS=3D
> ++  if test x$HAVE_JPEG =3D xyes; then
> ++    AC_DEFINE(HAVE_JPEG, [1], [Use libjpeg])
> ++  elif test "x$NEED_JPEG" =3D "xyes"; then
> ++    AC_MSG_ERROR([libjpeg support requested but libjpeg is not availabl=
e])
> ++  else
> ++    JPEG_LIBS=3D
> ++  fi
> ++  AC_SUBST(JPEG_LIBS)
> ++  AC_SUBST(HAVE_JPEG)
> + fi
> +-AC_SUBST(JPEG_LIBS)
> +-AC_SUBST(HAVE_JPEG)
> + ])
> +=20
> + dnl -------------------------------------------------------------------=
-------
> +--=20
> +2.17.1
> +
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_=
1.14.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.1=
4.1.bb
> index 8d7d3c6192..a848fa0e01 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.14.1.=
bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.14.1.=
bb
> @@ -17,6 +17,8 @@ SRC_URI =3D " \
>              file://0004-rtsp-drop-incorrect-reference-to-gstreamer-sdp-i=
n-Ma.patch \
>              file://0009-glimagesink-Downrank-to-marginal.patch \
>              file://0001-gstreamer-gl.pc.in-don-t-append-GL_CFLAGS-to-CFL=
AGS.patch \
> +            file://0010-gl-Add-switch-for-explicitely-enabling-disabling=
-GBM.patch \
> +            file://0011-gl-Add-switches-for-explicitely-enabling-disabli=
ng-P.patch \
>              file://link-with-libvchostif.patch \
>              "
>  SRC_URI[md5sum] =3D "c42154ab6f85c59f0e449d8d7e290342"
> @@ -30,12 +32,15 @@ inherit gettext
> =20
>  PACKAGES_DYNAMIC =3D+ "^libgst.*"
> =20
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
> +    gio-unix-2.0 jpeg ogg pango png theora vorbis zlib \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland egl', ''=
, d)} \
>  "
> =20
> @@ -45,26 +50,30 @@ X11DISABLEOPTS =3D "--disable-x --disable-xvideo --di=
sable-xshm"
> =20
>  PACKAGECONFIG[alsa]         =3D "--enable-alsa,--disable-alsa,alsa-lib"
>  PACKAGECONFIG[cdparanoia]   =3D "--enable-cdparanoia,--disable-cdparanoi=
a,cdparanoia"
> +PACKAGECONFIG[egl]          =3D "--enable-egl,--disable-egl,virtual/egl"
> +PACKAGECONFIG[gbm]          =3D "--enable-gbm,--disable-gbm,virtual/libg=
bm libgudev libdrm"
>  PACKAGECONFIG[gio-unix-2.0] =3D "--enable-gio_unix_2_0,--disable-gio_uni=
x_2_0,glib-2.0"
> +PACKAGECONFIG[gles2]        =3D "--enable-gles2,--disable-gles2,virtual/=
libgles2"
>  PACKAGECONFIG[ivorbis]      =3D "--enable-ivorbis,--disable-ivorbis,trem=
or"
> +PACKAGECONFIG[jpeg]         =3D "--enable-jpeg,--disable-jpeg,jpeg"
>  PACKAGECONFIG[ogg]          =3D "--enable-ogg,--disable-ogg,libogg"
> +PACKAGECONFIG[opengl]       =3D "--enable-opengl,--disable-opengl,virtua=
l/libgl libglu"
>  PACKAGECONFIG[opus]         =3D "--enable-opus,--disable-opus,libopus"
>  PACKAGECONFIG[pango]        =3D "--enable-pango,--disable-pango,pango"
> +PACKAGECONFIG[png]          =3D "--enable-png,--disable-png,libpng"
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
> +PACKAGECONFIG[zlib]         =3D "--enable-zlib,--disable-zlib,zlib"
> +
> +EXTRA_OECONF +=3D " \
> +    --disable-libvisual \
> +"
> =20
> +FILES_${PN}-dev +=3D "${libdir}/gstreamer-${LIBV}/include/gst/gl/gstglco=
nfig.h"
>  FILES_${MLPREFIX}libgsttag-1.0 +=3D "${datadir}/gst-plugins-base/1.0/lic=
ense-translations.dict"
> =20
>  do_compile_prepend() {
>          export GIR_EXTRA_LIBS_PATH=3D"${B}/gst-libs/gst/tag/.libs:${B}/g=
st-libs/gst/video/.libs:${B}/gst-libs/gst/audio/.libs:${B}/gst-libs/gst/rtp=
/.libs:${B}/gst-libs/gst/allocators/.libs"
>  }
> -
> -FILES_${PN}-dev +=3D "${libdir}/gstreamer-${LIBV}/include/gst/gl/gstglco=
nfig.h"
> --=20
> 2.17.1
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--2fHTh5uZTiUOsy+g
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCW1Bw5gAKCRA3VSO3ZXaA
HFCHAKCLJMFUQhFZ9PZNY7+TBtCCnc2BVACgiZv5ZS3JPHMrQije2N4Z/SE85Mc=
=c6/P
-----END PGP SIGNATURE-----

--2fHTh5uZTiUOsy+g--
