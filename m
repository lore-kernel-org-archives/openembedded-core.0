Return-Path: <liu.ming50@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id E4E367EF18
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2019 14:35:57 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id x1so1141400wrr.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2019 07:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5KlHoEgVegJIehoXlwQ1fB2yIQQcN5oHFiwByjRJbxU=;
	b=u8vmPqXjNwe7HJHTZr+bA29LX5/7JtnVIW5QsjbliZEG/RXeev1U7DRtBjH6TYngeL
	T9MahfizbOfBPUJahh4IX4i67pRSxsIj3odJf+cXI8u7lNcoUj7xYqlNJDedUyz24s81
	3rr80FeV/1bBnnFchsCxLluhKgUpfLs05eIq+BGNyxvRMd9/ZxwJPb1KcY+marXhyXAm
	Vt+r2/fTfxUHHnBoAKWROYkUuDvd2CrxFSn50FpY+enSWYFkGNLkyGGRxt3pgJxLeFIc
	tbI8nvLd84nyCi+ktO6KiwGTA/H8iUiFVR1E0km6XCe83M0KFDYiogr30siRq7VJs0AH
	awRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5KlHoEgVegJIehoXlwQ1fB2yIQQcN5oHFiwByjRJbxU=;
	b=eA50ufaGm429ZMlxNwuLB11qGWDzJLsLKwcLdvJ0sdmRfNfYLnH8erBN3vcUCJTwt2
	l7aJ0GNPS6OalD9M6y5Vjqk0ZT+m5dGuwG60+43amsqtKB0eNNtUJwnGhX6zpYf56pK/
	oPwFywz595YLu5GbOK4YfUGSl3+RTG2zi3v3nuxgbGj6qXd2fMOIT8PeSObbz6xiO/ur
	QPq8HWRZnpNq8Juema9SsSUH65gsXtq+44pgnqhZbXA7FwoctnJhY6Sz8wRs7nkkg8f8
	b6vw4YYJZp32lP2QZuUqows3qm4//gzhdl1T3n78tJGXjRz1d5Q9SSIOE/lur74fHy8N
	7UTg==
X-Gm-Message-State: APjAAAXgvyzLCczJalRNqVNLNn9H2ZFvcDEOj3xJrlImNA9wcge614QO
	DecK0/FO2xFQiNh91FzIQ8xmk62zloCR7h8VTfM=
X-Google-Smtp-Source: APXvYqwmmMJy1//R6ofo2oFJ3tNS2a9Xl1TPWOAhtflov4EfSnbYXfL5XHQtYrJ9DLxS/GLBnNNWlaii8FP6NnGTlrw=
X-Received: by 2002:a5d:6583:: with SMTP id q3mr144257wru.184.1564065358295;
	Thu, 25 Jul 2019 07:35:58 -0700 (PDT)
MIME-Version: 1.0
References: <1564054891-8168-1-git-send-email-liu.ming50@gmail.com>
	<c1defd307036043cf35dc7b6ced68c08@agner.ch>
In-Reply-To: <c1defd307036043cf35dc7b6ced68c08@agner.ch>
From: Ming Liu <liu.ming50@gmail.com>
Date: Thu, 25 Jul 2019 22:35:46 +0800
Message-ID: <CALatG=7VMfW7FonudLaJUdujeSYW+=hLeo2K9yXZtR3hFEf84Q@mail.gmail.com>
To: Stefan Agner <stefan@agner.ch>
Cc: Ming Liu <ming.liu@toradex.com>, luka.pivk@toradex.com,
	Stefan Agner <stefan.agner@toradex.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] weston: change to use meson build system
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
X-List-Received-Date: Thu, 25 Jul 2019 14:35:58 -0000
Content-Type: multipart/alternative; boundary="000000000000163827058e825814"

--000000000000163827058e825814
Content-Type: text/plain; charset="UTF-8"

Thanks for the review, will send a V2 as you suggested.

//Ming Liu


Hi Ming,
>
> Thanks for working on that!
>
> On 2019-07-25 13:41, liu.ming50@gmail.com wrote:
> > From: Ming Liu <ming.liu@toradex.com>
> >
> > The changes include:
> > - Drop all autotools related patches.
> > - Move weston-launch setuid-install to do_install task since it's not
> >   supported yet by meson build.
> > - Drop cairo-glesv2 package config, it's not supported by meson build,
> >   it is hardcoded to cairo-image for now in weston source.
>
> It seem that upstream recommends cairo image anyway (see README.md). I
> am not exactly sure why, but this bug seems to indicate that using the
> image backend is more efficient?
> https://gitlab.freedesktop.org/wayland/weston/issues/46
>
> I actually realized that meta-freescale uses the cairo-glesv2 package
> config.
>
> [added Tom to CC who added the package config a while ago]
>
> I guess we should send a patch to remove that.
>
> Otherwise the patch looks good to me. I like the fact that this patch
> mostly migrates 1:1 to Meson without changing anything else.
>
> --
> Stefan
>
>
> > - Introduce remoting package config, without it meson would run into a
> >   build error.
> >
> > Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
> > Signed-off-by: Ming Liu <ming.liu@toradex.com>
> > ---
> >  .../wayland/weston/0001-make-error-portable.patch  | 34 ++++----
> >  ...ch-Provide-a-default-version-that-doesn-t.patch | 93
> ++++++++++++++--------
> >  meta/recipes-graphics/wayland/weston_6.0.0.bb      | 48 +++++------
> >  3 files changed, 101 insertions(+), 74 deletions(-)
> >
> > diff --git
> > a/meta/recipes-graphics/wayland/weston/0001-make-error-portable.patch
> > b/meta/recipes-graphics/wayland/weston/0001-make-error-portable.patch
> > index 0eb3d95..acea9db 100644
> > --- a/meta/recipes-graphics/wayland/weston/0001-make-error-portable.patch
> > +++ b/meta/recipes-graphics/wayland/weston/0001-make-error-portable.patch
> > @@ -9,27 +9,14 @@ kind of systemsi e.g. musl.
> >  Upstream-Status: Submitted
> >
> >  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > -
> > +Signed-off-by: Ming Liu <ming.liu@toradex.com>
> >  ---
> > - configure.ac              |  2 ++
> >   libweston/weston-error.h  | 20 ++++++++++++++++++++
> >   libweston/weston-launch.c |  2 +-
> > - 3 files changed, 23 insertions(+), 1 deletion(-)
> > + meson.build               |  1 +
> > + 3 files changed, 22 insertions(+), 1 deletion(-)
> >   create mode 100644 libweston/weston-error.h
> >
> > -diff --git a/configure.ac b/configure.ac
> > -index c05ad01..6da6e04 100644
> > ---- a/configure.ac
> > -+++ b/configure.ac
> > -@@ -126,6 +126,8 @@ AC_CHECK_DECL(CLOCK_MONOTONIC,[],
> > -           [AC_MSG_ERROR("CLOCK_MONOTONIC is needed to compile
> weston")],
> > -           [[#include <time.h>]])
> > -
> > -+AC_CHECK_HEADERS([error.h])
> > -+
> > - AC_CHECK_FUNCS([mkostemp strchrnul initgroups posix_fallocate])
> > -
> > - # check for libdrm as a build-time dependency only
> >  diff --git a/libweston/weston-error.h b/libweston/weston-error.h
> >  new file mode 100644
> >  index 0000000..2089d02
> > @@ -76,3 +63,18 @@ index bf73e0d..9064439 100644
> >
> >   #define DRM_MAJOR 226
> >
> > +diff --git a/meson.build b/meson.build
> > +index 2155b7b..baa52d9 100644
> > +--- a/meson.build
> > ++++ b/meson.build
> > +@@ -94,6 +94,7 @@ foreach func : optional_libc_funcs
> > + endforeach
> > +
> > + optional_system_headers = [
> > ++    'error.h',
> > +     'linux/sync_file.h'
> > + ]
> > + foreach hdr : optional_system_headers
> > +--
> > +2.7.4
> > +
> > diff --git
> >
> a/meta/recipes-graphics/wayland/weston/0001-weston-launch-Provide-a-default-version-that-doesn-t.patch
> >
> b/meta/recipes-graphics/wayland/weston/0001-weston-launch-Provide-a-default-version-that-doesn-t.patch
> > index a2f61bf..81cc025 100644
> > ---
> >
> a/meta/recipes-graphics/wayland/weston/0001-weston-launch-Provide-a-default-version-that-doesn-t.patch
> > +++
> >
> b/meta/recipes-graphics/wayland/weston/0001-weston-launch-Provide-a-default-version-that-doesn-t.patch
> > @@ -15,44 +15,46 @@ Upstream-Status: Pending
> >  Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
> >  Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> >  Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > -
> > +Signed-off-by: Ming Liu <ming.liu@toradex.com>
> >  ---
> > - configure.ac              |  9 +++++++--
> > + libweston/meson.build     | 16 ++++++++++++----
> >   libweston/weston-launch.c | 20 ++++++++++++++++++++
> > - 2 files changed, 27 insertions(+), 2 deletions(-)
> > + meson_options.txt         |  7 +++++++
> > + 3 files changed, 39 insertions(+), 4 deletions(-)
> >
> > -diff --git a/configure.ac b/configure.ac
> > -index 6da6e04..681f7c8 100644
> > ---- a/configure.ac
> > -+++ b/configure.ac
> > -@@ -515,13 +515,17 @@ AC_ARG_ENABLE(resize-optimization,
> > - AS_IF([test "x$enable_resize_optimization" = "xyes"],
> > -       [AC_DEFINE([USE_RESIZE_POOL], [1], [Use resize memory pool as
> > a performance optimization])])
> > -
> > -+AC_ARG_WITH(pam,
> > -+            AS_HELP_STRING([--with-pam], [Use PAM]),
> > -+            [use_pam=$withval], [use_pam=yes])
> > - AC_ARG_ENABLE(weston-launch, [  --enable-weston-launch],,
> > enable_weston_launch=yes)
> > - AM_CONDITIONAL(BUILD_WESTON_LAUNCH, test x$enable_weston_launch = xyes)
> > --if test x$enable_weston_launch = xyes; then
> > -+if test x$enable_weston_launch = xyes -a x$use_pam = xyes; then
> > -   WESTON_SEARCH_LIBS([PAM], [pam], [pam_open_session],
> > [have_pam=yes], [have_pam=no])
> > -   if test x$have_pam = xno; then
> > --    AC_ERROR([weston-launch requires pam])
> > -+    AC_ERROR([PAM support is explicitly requested, but libpam
> > couldn't be found])
> > -   fi
> > -+  AC_DEFINE([HAVE_PAM], [1], [Define if PAM is available])
> > - fi
> > -
> > - AM_CONDITIONAL(HAVE_PANGO, test "x$have_pango" = "xyes")
> > -@@ -767,6 +771,7 @@ AC_MSG_RESULT([
> > -     Enable developer documentation  ${enable_devdocs}
> > -
> > -     weston-launch utility           ${enable_weston_launch}
> > -+    PAM support                     ${use_pam}
> > -     systemd-login support           ${have_systemd_login}
> > -     systemd notify support          ${enable_systemd_notify}
> > -
> > +diff --git a/libweston/meson.build b/libweston/meson.build
> > +index 33ab970..32f495a 100644
> > +--- a/libweston/meson.build
> > ++++ b/libweston/meson.build
> > +@@ -472,16 +472,24 @@ if get_option('renderer-gl')
> > + endif
> > +
> > + if get_option('weston-launch')
> > +-    dep_pam = cc.find_library('pam')
> > ++    deps_weston_launch = [systemd_dep, dep_libdrm]
> > +
> > +-    if not cc.has_function('pam_open_session', dependencies: dep_pam)
> > +-            error('pam_open_session not found for weston-launch')
> > ++    if get_option('pam')
> > ++            dep_pam = cc.find_library('pam')
> > ++            if not cc.has_function('pam_open_session', dependencies:
> dep_pam)
> > ++                    error('pam_open_session not found for
> weston-launch')
> > ++            endif
> > ++
> > ++            if dep_pam.found()
> > ++                    deps_weston_launch += dep_pam
> > ++                    config_h.set('HAVE_PAM', '1')
> > ++            endif
> > +     endif
> > +
> > +     executable(
> > +             'weston-launch',
> > +             'weston-launch.c',
> > +-            dependencies: [dep_pam, systemd_dep, dep_libdrm],
> > ++            dependencies: deps_weston_launch,
> > +             include_directories: include_directories('..'),
> > +             install: true
> > +     )
> >  diff --git a/libweston/weston-launch.c b/libweston/weston-launch.c
> >  index 9064439..c6abe92 100644
> >  --- a/libweston/weston-launch.c
> > @@ -172,3 +174,24 @@ index 9064439..c6abe92 100644
> >
> >       if (setup_launcher_socket(&wl) < 0)
> >               exit(EXIT_FAILURE);
> > +diff --git a/meson_options.txt b/meson_options.txt
> > +index 0e1d183..9a5c3d5 100644
> > +--- a/meson_options.txt
> > ++++ b/meson_options.txt
> > +@@ -73,6 +73,13 @@ option(
> > + )
> > +
> > + option(
> > ++    'pam',
> > ++    type: 'boolean',
> > ++    value: true,
> > ++    description: 'Define if PAM is available'
> > ++)
> > ++
> > ++option(
> > +     'xwayland',
> > +     type: 'boolean',
> > +     value: true,
> > +--
> > +2.7.4
> > +
> > diff --git a/meta/recipes-graphics/wayland/weston_6.0.0.bb
> > b/meta/recipes-graphics/wayland/weston_6.0.0.bb
> > index fa08dac..19e24b3 100644
> > --- a/meta/recipes-graphics/wayland/weston_6.0.0.bb
> > +++ b/meta/recipes-graphics/wayland/weston_6.0.0.bb
> > @@ -8,8 +8,8 @@ LIC_FILES_CHKSUM =
> > "file://COPYING;md5=d79ee9e66bb0f95d3386a7acae780b70 \
> >  SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz
> \
> >             file://weston.png \
> >             file://weston.desktop \
> > -           file://0001-make-error-portable.patch \
> >             file://xwayland.weston-start \
> > +           file://0001-make-error-portable.patch \
> >
> > file://0001-weston-launch-Provide-a-default-version-that-doesn-t.patch
> > \
> >  "
> >  SRC_URI[md5sum] = "7c634e262f8a464a076c97fd50ad36b3"
> > @@ -17,7 +17,7 @@ SRC_URI[sha256sum] =
> > "546323a90607b3bd7f48809ea9d76e64cd09718102f2deca6d95aa59a8
> >
> >  UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
> >
> > -inherit autotools pkgconfig useradd distro_features_check
> > +inherit meson pkgconfig useradd distro_features_check
> >  # depends on virtual/egl
> >  REQUIRED_DISTRO_FEATURES = "opengl"
> >
> > @@ -26,10 +26,8 @@ DEPENDS += "wayland wayland-protocols libinput
> > virtual/egl pango wayland-native"
> >
> >  WESTON_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:1])}"
> >
> > -EXTRA_OECONF = "--enable-setuid-install \
> > -                --disable-rdp-compositor \
> > -                --enable-autotools \
> > -                "
> > +EXTRA_OEMESON += "-Dbackend-default=auto -Dbackend-rdp=false"
> > +
> >  PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'wayland',
> > 'kms fbdev wayland egl', '', d)} \
> >                     ${@bb.utils.contains('DISTRO_FEATURES', 'x11
> > wayland', 'xwayland', '', d)} \
> >                     ${@bb.utils.filter('DISTRO_FEATURES', 'pam systemd
> > x11', d)} \
> > @@ -38,37 +36,37 @@ PACKAGECONFIG ??=
> > "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'kms fbdev
> >  # Compositor choices
> >  #
> >  # Weston on KMS
> > -PACKAGECONFIG[kms] =
> > "--enable-drm-compositor,--disable-drm-compositor,drm udev
> > virtual/mesa virtual/libgbm mtdev"
> > +PACKAGECONFIG[kms] = "-Dbackend-drm=true,-Dbackend-drm=false,drm udev
> > virtual/mesa virtual/libgbm mtdev"
> >  # Weston on Wayland (nested Weston)
> > -PACKAGECONFIG[wayland] =
> > "--enable-wayland-compositor,--disable-wayland-compositor,virtual/mesa"
> > +PACKAGECONFIG[wayland] =
> > "-Dbackend-wayland=true,-Dbackend-wayland=false,virtual/mesa"
> >  # Weston on X11
> > -PACKAGECONFIG[x11] =
> > "--enable-x11-compositor,--disable-x11-compositor,virtual/libx11
> > libxcb libxcb libxcursor cairo"
> > +PACKAGECONFIG[x11] =
> > "-Dbackend-x11=true,-Dbackend-x11=false,virtual/libx11 libxcb libxcb
> > libxcursor cairo"
> >  # Headless Weston
> > -PACKAGECONFIG[headless] =
> > "--enable-headless-compositor,--disable-headless-compositor"
> > +PACKAGECONFIG[headless] =
> "-Dbackend-headless=true,-Dbackend-headless=false"
> >  # Weston on framebuffer
> > -PACKAGECONFIG[fbdev] =
> > "--enable-fbdev-compositor,--disable-fbdev-compositor,udev mtdev"
> > +PACKAGECONFIG[fbdev] = "-Dbackend-fbdev=true,-Dbackend-fbdev=false,udev
> mtdev"
> >  # weston-launch
> > -PACKAGECONFIG[launch] =
> "--enable-weston-launch,--disable-weston-launch,drm"
> > +PACKAGECONFIG[launch] = "-Dweston-launch=true,-Dweston-launch=false,drm"
> >  # VA-API desktop recorder
> > -PACKAGECONFIG[vaapi] =
> "--enable-vaapi-recorder,--disable-vaapi-recorder,libva"
> > +PACKAGECONFIG[vaapi] =
> >
> "-Dbackend-drm-screencast-vaapi=true,-Dbackend-drm-screencast-vaapi=false,libva"
> >  # Weston with EGL support
> > -PACKAGECONFIG[egl] = "--enable-egl
> > --enable-simple-egl-clients,--disable-egl
> > --disable-simple-egl-clients,virtual/egl"
> > -# Weston with cairo glesv2 support
> > -PACKAGECONFIG[cairo-glesv2] =
> "--with-cairo-glesv2,--with-cairo=image,cairo"
> > +PACKAGECONFIG[egl] =
> "-Drenderer-gl=true,-Drenderer-gl=false,virtual/egl"
> >  # Weston with lcms support
> > -PACKAGECONFIG[lcms] = "--enable-lcms,--disable-lcms,lcms"
> > +PACKAGECONFIG[lcms] =
> > "-Dcolor-management-lcms=true,-Dcolor-management-lcms=false,lcms"
> >  # Weston with webp support
> > -PACKAGECONFIG[webp] = "--with-webp,--without-webp,libwebp"
> > +PACKAGECONFIG[webp] = "-Dimage-webp=true,-Dimage-webp=false,libwebp"
> >  # Weston with systemd-login support
> > -PACKAGECONFIG[systemd] =
> > "--enable-systemd-login,--disable-systemd-login,systemd dbus"
> > +PACKAGECONFIG[systemd] = "-Dsystemd=true
> > -Dlauncher-logind=true,-Dsystemd=false -Dlauncher-logind=false,systemd
> > dbus"
> >  # Weston with Xwayland support (requires X11 and Wayland)
> > -PACKAGECONFIG[xwayland] = "--enable-xwayland,--disable-xwayland"
> > +PACKAGECONFIG[xwayland] = "-Dxwayland=true,-Dxwayland=false"
> >  # colord CMS support
> > -PACKAGECONFIG[colord] = "--enable-colord,--disable-colord,colord"
> > +PACKAGECONFIG[colord] =
> > "-Dcolor-management-colord=true,-Dcolor-management-colord=false,colord"
> >  # Clients support
> > -PACKAGECONFIG[clients] = "--enable-clients --enable-simple-clients
> > --enable-demo-clients-install,--disable-clients
> > --disable-simple-clients"
> > +PACKAGECONFIG[clients] = "-Dsimple-clients=all
> > -Ddemo-clients=true,-Dsimple-clients= -Ddemo-clients=false"
> > +# Virtual remote output with GStreamer on DRM backend
> > +PACKAGECONFIG[remoting] =
> "-Dremoting=true,-Dremoting=false,gstreamer-1.0"
> >  # Weston with PAM support
> > -PACKAGECONFIG[pam] = "--with-pam,--without-pam,libpam"
> > +PACKAGECONFIG[pam] = "-Dpam=true,-Dpam=false,libpam"
> >
> >  do_install_append() {
> >       # Weston doesn't need the .la files to load modules, so wipe them
> > @@ -86,6 +84,10 @@ do_install_append() {
> >       if [ "${@bb.utils.contains('PACKAGECONFIG', 'xwayland', 'yes',
> 'no',
> > d)}" = "yes" ]; then
> >               install -Dm 644 ${WORKDIR}/xwayland.weston-start
> > ${D}${datadir}/weston-start/xwayland
> >       fi
> > +
> > +     if [ "${@bb.utils.contains('PACKAGECONFIG', 'launch', 'yes', 'no',
> > d)}" = "yes" ]; then
> > +             chmod u+s ${D}${bindir}/weston-launch
> > +     fi
> >  }
> >
> >  PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'xwayland',
> > '${PN}-xwayland', '', d)} \
> > --
> > 2.7.4
>

--000000000000163827058e825814
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">Thanks for the review, will send a V2 as you suggest=
ed.</div></div><div dir=3D"auto"><br></div><div dir=3D"auto">//Ming Liu</di=
v><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">Hi Ming,<br>
<br>
Thanks for working on that!<br>
<br>
On 2019-07-25 13:41, <a href=3D"mailto:liu.ming50@gmail.com" target=3D"_bla=
nk">liu.ming50@gmail.com</a> wrote:<br>
&gt; From: Ming Liu &lt;<a href=3D"mailto:ming.liu@toradex.com" target=3D"_=
blank">ming.liu@toradex.com</a>&gt;<br>
&gt; <br>
&gt; The changes include:<br>
&gt; - Drop all autotools related patches.<br>
&gt; - Move weston-launch setuid-install to do_install task since it&#39;s =
not<br>
&gt;=C2=A0 =C2=A0supported yet by meson build.<br>
&gt; - Drop cairo-glesv2 package config, it&#39;s not supported by meson bu=
ild,<br>
&gt;=C2=A0 =C2=A0it is hardcoded to cairo-image for now in weston source.<b=
r>
<br>
It seem that upstream recommends cairo image anyway (see README.md). I<br>
am not exactly sure why, but this bug seems to indicate that using the<br>
image backend is more efficient?<br>
<a href=3D"https://gitlab.freedesktop.org/wayland/weston/issues/46" rel=3D"=
noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/wayland/weston=
/issues/46</a><br>
<br>
I actually realized that meta-freescale uses the cairo-glesv2 package<br>
config. <br>
<br>
[added Tom to CC who added the package config a while ago]<br>
<br>
I guess we should send a patch to remove that.<br>
<br>
Otherwise the patch looks good to me. I like the fact that this patch<br>
mostly migrates 1:1 to Meson without changing anything else.<br>
<br>
--<br>
Stefan<br>
<br>
<br>
&gt; - Introduce remoting package config, without it meson would run into a=
<br>
&gt;=C2=A0 =C2=A0build error.<br>
&gt; <br>
&gt; Signed-off-by: Stefan Agner &lt;<a href=3D"mailto:stefan.agner@toradex=
.com" target=3D"_blank">stefan.agner@toradex.com</a>&gt;<br>
&gt; Signed-off-by: Ming Liu &lt;<a href=3D"mailto:ming.liu@toradex.com" ta=
rget=3D"_blank">ming.liu@toradex.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../wayland/weston/0001-make-error-portable.patch=C2=A0 | 34 +++=
+----<br>
&gt;=C2=A0 ...ch-Provide-a-default-version-that-doesn-t.patch | 93 ++++++++=
++++++--------<br>
&gt;=C2=A0 meta/recipes-graphics/wayland/<a href=3D"http://weston_6.0.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">weston_6.0.0.bb</a>=C2=A0 =C2=A0 =C2=
=A0 | 48 +++++------<br>
&gt;=C2=A0 3 files changed, 101 insertions(+), 74 deletions(-)<br>
&gt; <br>
&gt; diff --git<br>
&gt; a/meta/recipes-graphics/wayland/weston/0001-make-error-portable.patch<=
br>
&gt; b/meta/recipes-graphics/wayland/weston/0001-make-error-portable.patch<=
br>
&gt; index 0eb3d95..acea9db 100644<br>
&gt; --- a/meta/recipes-graphics/wayland/weston/0001-make-error-portable.pa=
tch<br>
&gt; +++ b/meta/recipes-graphics/wayland/weston/0001-make-error-portable.pa=
tch<br>
&gt; @@ -9,27 +9,14 @@ kind of systemsi e.g. musl.<br>
&gt;=C2=A0 Upstream-Status: Submitted<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com=
" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; -<br>
&gt; +Signed-off-by: Ming Liu &lt;<a href=3D"mailto:ming.liu@toradex.com" t=
arget=3D"_blank">ming.liu@toradex.com</a>&gt;<br>
&gt;=C2=A0 ---<br>
&gt; - <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2=
 ++<br>
&gt;=C2=A0 =C2=A0libweston/weston-error.h=C2=A0 | 20 ++++++++++++++++++++<b=
r>
&gt;=C2=A0 =C2=A0libweston/weston-launch.c |=C2=A0 2 +-<br>
&gt; - 3 files changed, 23 insertions(+), 1 deletion(-)<br>
&gt; + meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 1 +<br>
&gt; + 3 files changed, 22 insertions(+), 1 deletion(-)<br>
&gt;=C2=A0 =C2=A0create mode 100644 libweston/weston-error.h<br>
&gt;=C2=A0 <br>
&gt; -diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" targe=
t=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"nore=
ferrer" target=3D"_blank">configure.ac</a><br>
&gt; -index c05ad01..6da6e04 100644<br>
&gt; ---- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
&gt; -+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
&gt; -@@ -126,6 +126,8 @@ AC_CHECK_DECL(CLOCK_MONOTONIC,[],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[AC_MSG_ERROR(&quot;CLOCK_MO=
NOTONIC is needed to compile weston&quot;)],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[[#include &lt;time.h&gt;]])=
<br>
&gt; - <br>
&gt; -+AC_CHECK_HEADERS([error.h])<br>
&gt; -+<br>
&gt; - AC_CHECK_FUNCS([mkostemp strchrnul initgroups posix_fallocate])<br>
&gt; - <br>
&gt; - # check for libdrm as a build-time dependency only<br>
&gt;=C2=A0 diff --git a/libweston/weston-error.h b/libweston/weston-error.h=
<br>
&gt;=C2=A0 new file mode 100644<br>
&gt;=C2=A0 index 0000000..2089d02<br>
&gt; @@ -76,3 +63,18 @@ index bf73e0d..9064439 100644<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0#define DRM_MAJOR 226<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +diff --git a/meson.build b/meson.build<br>
&gt; +index 2155b7b..baa52d9 100644<br>
&gt; +--- a/meson.build<br>
&gt; ++++ b/meson.build<br>
&gt; +@@ -94,6 +94,7 @@ foreach func : optional_libc_funcs<br>
&gt; + endforeach<br>
&gt; + <br>
&gt; + optional_system_headers =3D [<br>
&gt; ++=C2=A0 =C2=A0 &#39;error.h&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&#39;linux/sync_file.h&#39;<br>
&gt; + ]<br>
&gt; + foreach hdr : optional_system_headers<br>
&gt; +-- <br>
&gt; +2.7.4<br>
&gt; +<br>
&gt; diff --git<br>
&gt; a/meta/recipes-graphics/wayland/weston/0001-weston-launch-Provide-a-de=
fault-version-that-doesn-t.patch<br>
&gt; b/meta/recipes-graphics/wayland/weston/0001-weston-launch-Provide-a-de=
fault-version-that-doesn-t.patch<br>
&gt; index a2f61bf..81cc025 100644<br>
&gt; ---<br>
&gt; a/meta/recipes-graphics/wayland/weston/0001-weston-launch-Provide-a-de=
fault-version-that-doesn-t.patch<br>
&gt; +++<br>
&gt; b/meta/recipes-graphics/wayland/weston/0001-weston-launch-Provide-a-de=
fault-version-that-doesn-t.patch<br>
&gt; @@ -15,44 +15,46 @@ Upstream-Status: Pending<br>
&gt;=C2=A0 Signed-off-by: Tom Hochstein &lt;<a href=3D"mailto:tom.hochstein=
@nxp.com" target=3D"_blank">tom.hochstein@nxp.com</a>&gt;<br>
&gt;=C2=A0 Signed-off-by: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkon=
en@intel.com" target=3D"_blank">jussi.kukkonen@intel.com</a>&gt;<br>
&gt;=C2=A0 Signed-off-by: Denys Dmytriyenko &lt;<a href=3D"mailto:denys@ti.=
com" target=3D"_blank">denys@ti.com</a>&gt;<br>
&gt; -<br>
&gt; +Signed-off-by: Ming Liu &lt;<a href=3D"mailto:ming.liu@toradex.com" t=
arget=3D"_blank">ming.liu@toradex.com</a>&gt;<br>
&gt;=C2=A0 ---<br>
&gt; - <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 9=
 +++++++--<br>
&gt; + libweston/meson.build=C2=A0 =C2=A0 =C2=A0| 16 ++++++++++++----<br>
&gt;=C2=A0 =C2=A0libweston/weston-launch.c | 20 ++++++++++++++++++++<br>
&gt; - 2 files changed, 27 insertions(+), 2 deletions(-)<br>
&gt; + meson_options.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 7 +++++++=
<br>
&gt; + 3 files changed, 39 insertions(+), 4 deletions(-)<br>
&gt;=C2=A0 <br>
&gt; -diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" targe=
t=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"nore=
ferrer" target=3D"_blank">configure.ac</a><br>
&gt; -index 6da6e04..681f7c8 100644<br>
&gt; ---- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
&gt; -+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
&gt; -@@ -515,13 +515,17 @@ AC_ARG_ENABLE(resize-optimization,<br>
&gt; - AS_IF([test &quot;x$enable_resize_optimization&quot; =3D &quot;xyes&=
quot;],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0[AC_DEFINE([USE_RESIZE_POOL], [1], [Use re=
size memory pool as<br>
&gt; a performance optimization])])<br>
&gt; - <br>
&gt; -+AC_ARG_WITH(pam,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AS_HELP_STRING([--with-pam=
], [Use PAM]),<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [use_pam=3D$withval], [use=
_pam=3Dyes])<br>
&gt; - AC_ARG_ENABLE(weston-launch, [=C2=A0 --enable-weston-launch],,<br>
&gt; enable_weston_launch=3Dyes)<br>
&gt; - AM_CONDITIONAL(BUILD_WESTON_LAUNCH, test x$enable_weston_launch =3D =
xyes)<br>
&gt; --if test x$enable_weston_launch =3D xyes; then<br>
&gt; -+if test x$enable_weston_launch =3D xyes -a x$use_pam =3D xyes; then<=
br>
&gt; -=C2=A0 =C2=A0WESTON_SEARCH_LIBS([PAM], [pam], [pam_open_session],<br>
&gt; [have_pam=3Dyes], [have_pam=3Dno])<br>
&gt; -=C2=A0 =C2=A0if test x$have_pam =3D xno; then<br>
&gt; --=C2=A0 =C2=A0 AC_ERROR([weston-launch requires pam])<br>
&gt; -+=C2=A0 =C2=A0 AC_ERROR([PAM support is explicitly requested, but lib=
pam<br>
&gt; couldn&#39;t be found])<br>
&gt; -=C2=A0 =C2=A0fi<br>
&gt; -+=C2=A0 AC_DEFINE([HAVE_PAM], [1], [Define if PAM is available])<br>
&gt; - fi<br>
&gt; - <br>
&gt; - AM_CONDITIONAL(HAVE_PANGO, test &quot;x$have_pango&quot; =3D &quot;x=
yes&quot;)<br>
&gt; -@@ -767,6 +771,7 @@ AC_MSG_RESULT([<br>
&gt; -=C2=A0 =C2=A0 =C2=A0Enable developer documentation=C2=A0 ${enable_dev=
docs}<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0 =C2=A0weston-launch utility=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0${enable_weston_launch}<br>
&gt; -+=C2=A0 =C2=A0 PAM support=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${use_pam}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0systemd-login support=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0${have_systemd_login}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0systemd notify support=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 ${enable_systemd_notify}<br>
&gt; - <br>
&gt; +diff --git a/libweston/meson.build b/libweston/meson.build<br>
&gt; +index 33ab970..32f495a 100644<br>
&gt; +--- a/libweston/meson.build<br>
&gt; ++++ b/libweston/meson.build<br>
&gt; +@@ -472,16 +472,24 @@ if get_option(&#39;renderer-gl&#39;)<br>
&gt; + endif<br>
&gt; + <br>
&gt; + if get_option(&#39;weston-launch&#39;)<br>
&gt; +-=C2=A0 =C2=A0 dep_pam =3D cc.find_library(&#39;pam&#39;)<br>
&gt; ++=C2=A0 =C2=A0 deps_weston_launch =3D [systemd_dep, dep_libdrm]<br>
&gt; + <br>
&gt; +-=C2=A0 =C2=A0 if not cc.has_function(&#39;pam_open_session&#39;, dep=
endencies: dep_pam)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error(&#39;pam_open_sessio=
n not found for weston-launch&#39;)<br>
&gt; ++=C2=A0 =C2=A0 if get_option(&#39;pam&#39;)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dep_pam =3D cc.find_librar=
y(&#39;pam&#39;)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not cc.has_function(&#3=
9;pam_open_session&#39;, dependencies: dep_pam)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 error(&#39;pam_open_session not found for weston-launch&#39;)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 endif<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if dep_pam.found()<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 deps_weston_launch +=3D dep_pam<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 config_h.set(&#39;HAVE_PAM&#39;, &#39;1&#39;)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 endif<br>
&gt; +=C2=A0 =C2=A0 =C2=A0endif<br>
&gt; + <br>
&gt; +=C2=A0 =C2=A0 =C2=A0executable(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;weston-launch&#3=
9;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;weston-launch.c&=
#39;,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dependencies: [dep_pam, sy=
stemd_dep, dep_libdrm],<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dependencies: deps_weston_=
launch,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0include_directories: =
include_directories(&#39;..&#39;),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install: true<br>
&gt; +=C2=A0 =C2=A0 =C2=A0)<br>
&gt;=C2=A0 diff --git a/libweston/weston-launch.c b/libweston/weston-launch=
.c<br>
&gt;=C2=A0 index 9064439..c6abe92 100644<br>
&gt;=C2=A0 --- a/libweston/weston-launch.c<br>
&gt; @@ -172,3 +174,24 @@ index 9064439..c6abe92 100644<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (setup_launcher_socket(&amp;wl) &lt; 0)<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit(EXIT_FAILUR=
E);<br>
&gt; +diff --git a/meson_options.txt b/meson_options.txt<br>
&gt; +index 0e1d183..9a5c3d5 100644<br>
&gt; +--- a/meson_options.txt<br>
&gt; ++++ b/meson_options.txt<br>
&gt; +@@ -73,6 +73,13 @@ option(<br>
&gt; + )<br>
&gt; + <br>
&gt; + option(<br>
&gt; ++=C2=A0 =C2=A0 &#39;pam&#39;,<br>
&gt; ++=C2=A0 =C2=A0 type: &#39;boolean&#39;,<br>
&gt; ++=C2=A0 =C2=A0 value: true,<br>
&gt; ++=C2=A0 =C2=A0 description: &#39;Define if PAM is available&#39;<br>
&gt; ++)<br>
&gt; ++<br>
&gt; ++option(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&#39;xwayland&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0type: &#39;boolean&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0value: true,<br>
&gt; +-- <br>
&gt; +2.7.4<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-graphics/wayland/<a href=3D"http://weston_6.=
0.0.bb" rel=3D"noreferrer" target=3D"_blank">weston_6.0.0.bb</a><br>
&gt; b/meta/recipes-graphics/wayland/<a href=3D"http://weston_6.0.0.bb" rel=
=3D"noreferrer" target=3D"_blank">weston_6.0.0.bb</a><br>
&gt; index fa08dac..19e24b3 100644<br>
&gt; --- a/meta/recipes-graphics/wayland/<a href=3D"http://weston_6.0.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">weston_6.0.0.bb</a><br>
&gt; +++ b/meta/recipes-graphics/wayland/<a href=3D"http://weston_6.0.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">weston_6.0.0.bb</a><br>
&gt; @@ -8,8 +8,8 @@ LIC_FILES_CHKSUM =3D<br>
&gt; &quot;file://COPYING;md5=3Dd79ee9e66bb0f95d3386a7acae780b70 \<br>
&gt;=C2=A0 SRC_URI =3D &quot;<a href=3D"https://wayland.freedesktop.org/rel=
eases/$%7BBPN%7D-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">htt=
ps://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://weston.png \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://weston.desktop \=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-make-error-porta=
ble.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://xwayland.weston-=
start \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-make-error-porta=
ble.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
&gt; file://0001-weston-launch-Provide-a-default-version-that-doesn-t.patch=
<br>
&gt; \<br>
&gt;=C2=A0 &quot;<br>
&gt;=C2=A0 SRC_URI[md5sum] =3D &quot;7c634e262f8a464a076c97fd50ad36b3&quot;=
<br>
&gt; @@ -17,7 +17,7 @@ SRC_URI[sha256sum] =3D<br>
&gt; &quot;546323a90607b3bd7f48809ea9d76e64cd09718102f2deca6d95aa59a8<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://wayland.freedesk=
top.org/releases.html" rel=3D"noreferrer" target=3D"_blank">https://wayland=
.freedesktop.org/releases.html</a>&quot;<br>
&gt;=C2=A0 <br>
&gt; -inherit autotools pkgconfig useradd distro_features_check<br>
&gt; +inherit meson pkgconfig useradd distro_features_check<br>
&gt;=C2=A0 # depends on virtual/egl<br>
&gt;=C2=A0 REQUIRED_DISTRO_FEATURES =3D &quot;opengl&quot;<br>
&gt;=C2=A0 <br>
&gt; @@ -26,10 +26,8 @@ DEPENDS +=3D &quot;wayland wayland-protocols libinp=
ut<br>
&gt; virtual/egl pango wayland-native&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 WESTON_MAJOR_VERSION =3D &quot;${@&#39;.&#39;.join(d.getVar(&#39=
;PV&#39;).split(&#39;.&#39;)[0:1])}&quot;<br>
&gt;=C2=A0 <br>
&gt; -EXTRA_OECONF =3D &quot;--enable-setuid-install \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --disable-rdp=
-compositor \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --enable-auto=
tools \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt; +EXTRA_OEMESON +=3D &quot;-Dbackend-default=3Dauto -Dbackend-rdp=3Dfal=
se&quot;<br>
&gt; +<br>
&gt;=C2=A0 PACKAGECONFIG ??=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATU=
RES&#39;, &#39;wayland&#39;,<br>
&gt; &#39;kms fbdev wayland egl&#39;, &#39;&#39;, d)} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;x11<br>
&gt; wayland&#39;, &#39;xwayland&#39;, &#39;&#39;, d)} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;, &#39;pam systemd<br>
&gt; x11&#39;, d)} \<br>
&gt; @@ -38,37 +36,37 @@ PACKAGECONFIG ??=3D<br>
&gt; &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;wayland&#39=
;, &#39;kms fbdev<br>
&gt;=C2=A0 # Compositor choices<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 # Weston on KMS<br>
&gt; -PACKAGECONFIG[kms] =3D<br>
&gt; &quot;--enable-drm-compositor,--disable-drm-compositor,drm udev<br>
&gt; virtual/mesa virtual/libgbm mtdev&quot;<br>
&gt; +PACKAGECONFIG[kms] =3D &quot;-Dbackend-drm=3Dtrue,-Dbackend-drm=3Dfal=
se,drm udev<br>
&gt; virtual/mesa virtual/libgbm mtdev&quot;<br>
&gt;=C2=A0 # Weston on Wayland (nested Weston)<br>
&gt; -PACKAGECONFIG[wayland] =3D<br>
&gt; &quot;--enable-wayland-compositor,--disable-wayland-compositor,virtual=
/mesa&quot;<br>
&gt; +PACKAGECONFIG[wayland] =3D<br>
&gt; &quot;-Dbackend-wayland=3Dtrue,-Dbackend-wayland=3Dfalse,virtual/mesa&=
quot;<br>
&gt;=C2=A0 # Weston on X11<br>
&gt; -PACKAGECONFIG[x11] =3D<br>
&gt; &quot;--enable-x11-compositor,--disable-x11-compositor,virtual/libx11<=
br>
&gt; libxcb libxcb libxcursor cairo&quot;<br>
&gt; +PACKAGECONFIG[x11] =3D<br>
&gt; &quot;-Dbackend-x11=3Dtrue,-Dbackend-x11=3Dfalse,virtual/libx11 libxcb=
 libxcb<br>
&gt; libxcursor cairo&quot;<br>
&gt;=C2=A0 # Headless Weston<br>
&gt; -PACKAGECONFIG[headless] =3D<br>
&gt; &quot;--enable-headless-compositor,--disable-headless-compositor&quot;=
<br>
&gt; +PACKAGECONFIG[headless] =3D &quot;-Dbackend-headless=3Dtrue,-Dbackend=
-headless=3Dfalse&quot;<br>
&gt;=C2=A0 # Weston on framebuffer<br>
&gt; -PACKAGECONFIG[fbdev] =3D<br>
&gt; &quot;--enable-fbdev-compositor,--disable-fbdev-compositor,udev mtdev&=
quot;<br>
&gt; +PACKAGECONFIG[fbdev] =3D &quot;-Dbackend-fbdev=3Dtrue,-Dbackend-fbdev=
=3Dfalse,udev mtdev&quot;<br>
&gt;=C2=A0 # weston-launch<br>
&gt; -PACKAGECONFIG[launch] =3D &quot;--enable-weston-launch,--disable-west=
on-launch,drm&quot;<br>
&gt; +PACKAGECONFIG[launch] =3D &quot;-Dweston-launch=3Dtrue,-Dweston-launc=
h=3Dfalse,drm&quot;<br>
&gt;=C2=A0 # VA-API desktop recorder<br>
&gt; -PACKAGECONFIG[vaapi] =3D &quot;--enable-vaapi-recorder,--disable-vaap=
i-recorder,libva&quot;<br>
&gt; +PACKAGECONFIG[vaapi] =3D<br>
&gt; &quot;-Dbackend-drm-screencast-vaapi=3Dtrue,-Dbackend-drm-screencast-v=
aapi=3Dfalse,libva&quot;<br>
&gt;=C2=A0 # Weston with EGL support<br>
&gt; -PACKAGECONFIG[egl] =3D &quot;--enable-egl<br>
&gt; --enable-simple-egl-clients,--disable-egl<br>
&gt; --disable-simple-egl-clients,virtual/egl&quot;<br>
&gt; -# Weston with cairo glesv2 support<br>
&gt; -PACKAGECONFIG[cairo-glesv2] =3D &quot;--with-cairo-glesv2,--with-cair=
o=3Dimage,cairo&quot;<br>
&gt; +PACKAGECONFIG[egl] =3D &quot;-Drenderer-gl=3Dtrue,-Drenderer-gl=3Dfal=
se,virtual/egl&quot;<br>
&gt;=C2=A0 # Weston with lcms support<br>
&gt; -PACKAGECONFIG[lcms] =3D &quot;--enable-lcms,--disable-lcms,lcms&quot;=
<br>
&gt; +PACKAGECONFIG[lcms] =3D<br>
&gt; &quot;-Dcolor-management-lcms=3Dtrue,-Dcolor-management-lcms=3Dfalse,l=
cms&quot;<br>
&gt;=C2=A0 # Weston with webp support<br>
&gt; -PACKAGECONFIG[webp] =3D &quot;--with-webp,--without-webp,libwebp&quot=
;<br>
&gt; +PACKAGECONFIG[webp] =3D &quot;-Dimage-webp=3Dtrue,-Dimage-webp=3Dfals=
e,libwebp&quot;<br>
&gt;=C2=A0 # Weston with systemd-login support<br>
&gt; -PACKAGECONFIG[systemd] =3D<br>
&gt; &quot;--enable-systemd-login,--disable-systemd-login,systemd dbus&quot=
;<br>
&gt; +PACKAGECONFIG[systemd] =3D &quot;-Dsystemd=3Dtrue<br>
&gt; -Dlauncher-logind=3Dtrue,-Dsystemd=3Dfalse -Dlauncher-logind=3Dfalse,s=
ystemd<br>
&gt; dbus&quot;<br>
&gt;=C2=A0 # Weston with Xwayland support (requires X11 and Wayland)<br>
&gt; -PACKAGECONFIG[xwayland] =3D &quot;--enable-xwayland,--disable-xwaylan=
d&quot;<br>
&gt; +PACKAGECONFIG[xwayland] =3D &quot;-Dxwayland=3Dtrue,-Dxwayland=3Dfals=
e&quot;<br>
&gt;=C2=A0 # colord CMS support<br>
&gt; -PACKAGECONFIG[colord] =3D &quot;--enable-colord,--disable-colord,colo=
rd&quot;<br>
&gt; +PACKAGECONFIG[colord] =3D<br>
&gt; &quot;-Dcolor-management-colord=3Dtrue,-Dcolor-management-colord=3Dfal=
se,colord&quot;<br>
&gt;=C2=A0 # Clients support<br>
&gt; -PACKAGECONFIG[clients] =3D &quot;--enable-clients --enable-simple-cli=
ents<br>
&gt; --enable-demo-clients-install,--disable-clients<br>
&gt; --disable-simple-clients&quot;<br>
&gt; +PACKAGECONFIG[clients] =3D &quot;-Dsimple-clients=3Dall<br>
&gt; -Ddemo-clients=3Dtrue,-Dsimple-clients=3D -Ddemo-clients=3Dfalse&quot;=
<br>
&gt; +# Virtual remote output with GStreamer on DRM backend<br>
&gt; +PACKAGECONFIG[remoting] =3D &quot;-Dremoting=3Dtrue,-Dremoting=3Dfals=
e,gstreamer-1.0&quot;<br>
&gt;=C2=A0 # Weston with PAM support<br>
&gt; -PACKAGECONFIG[pam] =3D &quot;--with-pam,--without-pam,libpam&quot;<br=
>
&gt; +PACKAGECONFIG[pam] =3D &quot;-Dpam=3Dtrue,-Dpam=3Dfalse,libpam&quot;<=
br>
&gt;=C2=A0 <br>
&gt;=C2=A0 do_install_append() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# Weston doesn&#39;t need the .la files to l=
oad modules, so wipe them<br>
&gt; @@ -86,6 +84,10 @@ do_install_append() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;${@bb.utils.contains(&#39;PACKAGE=
CONFIG&#39;, &#39;xwayland&#39;, &#39;yes&#39;, &#39;no&#39;,<br>
&gt; d)}&quot; =3D &quot;yes&quot; ]; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -Dm 644 =
${WORKDIR}/xwayland.weston-start<br>
&gt; ${D}${datadir}/weston-start/xwayland<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if [ &quot;${@bb.utils.contains(&#39;PACKAGECONFI=
G&#39;, &#39;launch&#39;, &#39;yes&#39;, &#39;no&#39;,<br>
&gt; d)}&quot; =3D &quot;yes&quot; ]; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0chmod u+s ${D}${bindi=
r}/weston-launch<br>
&gt; +=C2=A0 =C2=A0 =C2=A0fi<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 PACKAGES +=3D &quot;${@bb.utils.contains(&#39;PACKAGECONFIG&#39;=
, &#39;xwayland&#39;,<br>
&gt; &#39;${PN}-xwayland&#39;, &#39;&#39;, d)} \<br>
&gt; -- <br>
&gt; 2.7.4<br>
</blockquote></div></div>

--000000000000163827058e825814--
