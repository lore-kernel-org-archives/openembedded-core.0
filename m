Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-ob0-f169.google.com (mail-ob0-f169.google.com
	[209.85.214.169])
	by mail.openembedded.org (Postfix) with ESMTP id 53E83734B8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jun 2015 20:19:11 +0000 (UTC)
Received: by obcnx10 with SMTP id nx10so17187531obc.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Jun 2015 13:19:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=vVcxtJcWYgog5fu9JXgoZ1OzaZcfAGwQ7zz2GG14Ww0=;
	b=NA2Vqubm5oZTOY71tqzdsIRmvfX1wP1RzU1mAj5YgQNqsVlJjJPkXHgSG8KRBb/aOt
	EndlWza9fk7DqxXQm+oDRzWvXDn02WWPpxC02kqVkcvjhJp00WT8WzYNdK8/l8fSXjgg
	O5uMxQf5HFb6Es1dNuuGlZ9ha1OORUBNbPj7e8cdR9ksdCOTzsQas1SDzwGRs+33lhm8
	GFHJdLwTovsnfj2gcxxVHVeWjW9Bmk6+bvx3SVwLRWn/npiFykWCC5jLypyARFh/DEg8
	/pDXwNlN0CnkPZ8OcXieM4iaNzo6l1E/N95TPlx9rBy3Jg20Sk5ohYCyj2Sfn2CBCTgr
	gmQQ==
X-Gm-Message-State: ALoCoQmarel1JIQ1h9sG+y/+EdR9GeifQEdnRfyoA3rPjyxH/arg9eny+aAemGv+op6aMapwJeNP
X-Received: by 10.60.47.165 with SMTP id e5mr28770041oen.52.1433362752554;
	Wed, 03 Jun 2015 13:19:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.225.2 with HTTP; Wed, 3 Jun 2015 13:18:42 -0700 (PDT)
In-Reply-To: <0d3de82d935f6408e5c04ff980a2b3fd4a9e4ac3.1433349512.git.raj.khem@gmail.com>
References: <cover.1433349512.git.raj.khem@gmail.com>
	<0d3de82d935f6408e5c04ff980a2b3fd4a9e4ac3.1433349512.git.raj.khem@gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Wed, 3 Jun 2015 23:18:42 +0300
Message-ID: <CAHiDW_GjW0PSnNRGekiYkg+qdhg=xbbmiVhWY95cv6GxQPJ1Bw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] wayland/weston/libinput: Upgrade to 1.6.0 -> 1.8.0
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
X-List-Received-Date: Wed, 03 Jun 2015 20:19:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 3 June 2015 at 19:41, Khem Raj <raj.khem@gmail.com> wrote:
> Use git for repo for SRC_URI

Can you explain why? The revision looks like 0.16.0 release.

> copyright year changed for weston compositor.c
>
> - * Copyright =C2=A9 2012 Collabora, Ltd.
> + * Copyright =C2=A9 2012-2014 Collabora, Ltd.
>
> libinput license changes are
> - COPYING: note that having linux/input.h in the tree does not make libin=
put GPL
> - Updated to 2015 where appropriate, added where missing.
> - filter: add Simon's copyright
>   This code was largely lifted from the X server in
>   bb25b2ad297891430606c367bfabc but didn't take the copyright messages
>   that applied to that code.
>
> upgrade libinput to > 0.8.0 (0.16.0) which is needed for 1.7.0+ wayland
> For x86 emulators use fbdev backend
>
> Change-Id: I49c12853699a3a764d86869ec4d43b10ecda3379
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../wayland/{libinput_0.7.0.bb =3D> libinput_git.bb} | 15 ++--
>  .../wayland/{wayland_1.6.0.bb =3D> wayland_1.8.0.bb} |  9 ++-
>  .../wayland/weston/0001-make-error-portable.patch  | 80 ++++++++++++++++=
++++++
>  .../weston/disable-wayland-scanner-pkg-check.patch | 20 +++---
>  .../wayland/{weston_1.6.0.bb =3D> weston_1.8.0.bb}   | 25 ++++---
>  5 files changed, 124 insertions(+), 25 deletions(-)
>  rename meta/recipes-graphics/wayland/{libinput_0.7.0.bb =3D> libinput_gi=
t.bb} (42%)
>  rename meta/recipes-graphics/wayland/{wayland_1.6.0.bb =3D> wayland_1.8.=
0.bb} (87%)
>  create mode 100644 meta/recipes-graphics/wayland/weston/0001-make-error-=
portable.patch
>  rename meta/recipes-graphics/wayland/{weston_1.6.0.bb =3D> weston_1.8.0.=
bb} (84%)
>
> diff --git a/meta/recipes-graphics/wayland/libinput_0.7.0.bb b/meta/recip=
es-graphics/wayland/libinput_git.bb
> similarity index 42%
> rename from meta/recipes-graphics/wayland/libinput_0.7.0.bb
> rename to meta/recipes-graphics/wayland/libinput_git.bb
> index 98d2942..dcaf7d3 100644
> --- a/meta/recipes-graphics/wayland/libinput_0.7.0.bb
> +++ b/meta/recipes-graphics/wayland/libinput_git.bb
> @@ -3,12 +3,19 @@ HOMEPAGE =3D "http://www.freedesktop.org/wiki/Software/=
libinput/"
>  SECTION =3D "libs"
>
>  LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D673e626420c7f859fbe2be3a9c136=
32d"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D277a6eaa986f26fa040fc3cfa4ae4=
4b3"
>
>  DEPENDS =3D "libevdev udev mtdev"
>
> -SRC_URI =3D "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz"
> -SRC_URI[md5sum] =3D "381b61396de28c12716ef7a5475fea50"
> -SRC_URI[sha256sum] =3D "129f485afe5e4a9394641293991c97cb99f5f3338340d0d6=
5b704ff463d1579e"
> +SRCREV =3D "078421808179baa22af5cd35ad5e0aee86dffb41"
> +PV =3D "0.16.0+git${SRCPV}"
> +
> +SRC_URI =3D "git://anongit.freedesktop.org/wayland/libinput \
> +"
> +
> +S =3D "${WORKDIR}/git"
>
>  inherit autotools pkgconfig
> +
> +FILES_${PN} +=3D "${libdir}/udev/"
> +FILES_${PN}-dbg +=3D "${libdir}/udev/.debug"
> diff --git a/meta/recipes-graphics/wayland/wayland_1.6.0.bb b/meta/recipe=
s-graphics/wayland/wayland_1.8.0.bb
> similarity index 87%
> rename from meta/recipes-graphics/wayland/wayland_1.6.0.bb
> rename to meta/recipes-graphics/wayland/wayland_1.8.0.bb
> index 00713bf..b468277 100644
> --- a/meta/recipes-graphics/wayland/wayland_1.6.0.bb
> +++ b/meta/recipes-graphics/wayland/wayland_1.8.0.bb
> @@ -10,9 +10,12 @@ LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1d4476a7d98dd5691c53d4d43a510=
c72 \
>                      file://src/wayland-server.c;endline=3D21;md5=3D079ae=
21dbf98ada52ec23744851b0a5c"
>
> -SRC_URI =3D "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz=
"
> -SRC_URI[md5sum] =3D "d34c141c975084e4fb668e77b38f840e"
> -SRC_URI[sha256sum] =3D "a7d5102dcf53d08c059d24bc62de491d7cd482070abeb673=
7a20d0d86ba6fc7f"
> +SRCREV =3D "60024af597b68974c451c89f960a7c11de11c33a"
> +
> +SRC_URI =3D "git://anongit.freedesktop.org/wayland/wayland"
> +
> +S =3D "${WORKDIR}/git"
> +
>  SRC_URI_append_class-native =3D " \
>      file://disable-macro-checks-not-used-for-scanner.patch \
>      "
> diff --git a/meta/recipes-graphics/wayland/weston/0001-make-error-portabl=
e.patch b/meta/recipes-graphics/wayland/weston/0001-make-error-portable.pat=
ch
> new file mode 100644
> index 0000000..148848d
> --- /dev/null
> +++ b/meta/recipes-graphics/wayland/weston/0001-make-error-portable.patch
> @@ -0,0 +1,80 @@
> +From c22e90365d89346258394833cbcad03ff32b2e27 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Fri, 29 May 2015 20:56:00 -0700
> +Subject: [PATCH weston] make error() portable
> +
> +error() is not posix but gnu extension so may not be available on all
> +kind of systemsi e.g. musl.
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> +Upstream-Status: Submitted
> +
> + configure.ac        |  2 ++
> + src/weston-error.h  | 20 ++++++++++++++++++++
> + src/weston-launch.c |  2 +-
> + 3 files changed, 23 insertions(+), 1 deletion(-)
> + create mode 100644 src/weston-error.h
> +
> +diff --git a/configure.ac b/configure.ac
> +index 263fc22..f52cd62 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -57,6 +57,8 @@ AC_CHECK_DECL(CLOCK_MONOTONIC,[],
> +             [[#include <time.h>]])
> + AC_CHECK_HEADERS([execinfo.h])
> +
> ++AC_CHECK_HEADERS([error.h])
> ++
> + AC_CHECK_FUNCS([mkostemp strchrnul initgroups posix_fallocate])
> +
> + COMPOSITOR_MODULES=3D"wayland-server >=3D 1.7.93 pixman-1 >=3D 0.25.2"
> +diff --git a/src/weston-error.h b/src/weston-error.h
> +new file mode 100644
> +index 0000000..2089d02
> +--- /dev/null
> ++++ b/src/weston-error.h
> +@@ -0,0 +1,20 @@
> ++#ifndef _WESTON_ERROR_H
> ++#define _WESTON_ERROR_H
> ++
> ++#if defined(HAVE_ERROR_H)
> ++#include <error.h>
> ++#else
> ++#include <err.h>
> ++#include <string.h>
> ++#define _weston_error(S, E, F, ...) do { \
> ++      if (E) \
> ++              err(S, F ": %s", ##__VA_ARGS__, strerror(E)); \
> ++      else \
> ++              err(S, F, ##__VA_ARGS__); \
> ++} while(0)
> ++
> ++#define error _weston_error
> ++#endif
> ++
> ++#endif
> ++
> +diff --git a/src/weston-launch.c b/src/weston-launch.c
> +index 10c66de..3e6d30a 100644
> +--- a/src/weston-launch.c
> ++++ b/src/weston-launch.c
> +@@ -30,7 +30,6 @@
> + #include <poll.h>
> + #include <errno.h>
> +
> +-#include <error.h>
> + #include <getopt.h>
> +
> + #include <sys/types.h>
> +@@ -56,6 +55,7 @@
> + #endif
> +
> + #include "weston-launch.h"
> ++#include "weston-error.h"
> +
> + #define DRM_MAJOR 226
> +
> +--
> +2.1.4
> +
> diff --git a/meta/recipes-graphics/wayland/weston/disable-wayland-scanner=
-pkg-check.patch b/meta/recipes-graphics/wayland/weston/disable-wayland-sca=
nner-pkg-check.patch
> index 062da5c..68ba38b 100644
> --- a/meta/recipes-graphics/wayland/weston/disable-wayland-scanner-pkg-ch=
eck.patch
> +++ b/meta/recipes-graphics/wayland/weston/disable-wayland-scanner-pkg-ch=
eck.patch
> @@ -1,13 +1,17 @@
> -Index: weston-1.5.0/configure.ac
> +Index: git/configure.ac
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- weston-1.5.0.orig/configure.ac
> -+++ weston-1.5.0/configure.ac
> -@@ -503,7 +503,7 @@ if test x$wayland_scanner =3D x; then
> -       AC_MSG_ERROR([wayland-scanner is needed to compile weston])
> +--- git.orig/configure.ac
> ++++ git/configure.ac
> +@@ -501,12 +501,6 @@ if test "x$have_lcms" =3D xyes; then
>   fi
> + AM_CONDITIONAL(HAVE_LCMS, [test "x$have_lcms" =3D xyes])
>
> --PKG_CHECK_MODULES(WAYLAND_SCANNER, wayland-scanner)
> -+#PKG_CHECK_MODULES(WAYLAND_SCANNER, wayland-scanner)
> -
> +-AC_PATH_PROG([wayland_scanner], [wayland-scanner])
> +-if test x$wayland_scanner =3D x; then
> +-      PKG_CHECK_MODULES(WAYLAND_SCANNER, [wayland-scanner])
> +-      wayland_scanner=3D`$PKG_CONFIG --variable=3Dwayland_scanner wayla=
nd-scanner`
> +-fi
> +-
>   AC_CONFIG_FILES([Makefile src/version.h src/weston.pc])
>
> + AM_CONDITIONAL([HAVE_GIT_REPO], [test -f $srcdir/.git/logs/HEAD])
> diff --git a/meta/recipes-graphics/wayland/weston_1.6.0.bb b/meta/recipes=
-graphics/wayland/weston_1.8.0.bb
> similarity index 84%
> rename from meta/recipes-graphics/wayland/weston_1.6.0.bb
> rename to meta/recipes-graphics/wayland/weston_1.8.0.bb
> index d30e48b..732dca4 100644
> --- a/meta/recipes-graphics/wayland/weston_1.6.0.bb
> +++ b/meta/recipes-graphics/wayland/weston_1.8.0.bb
> @@ -3,34 +3,39 @@ DESCRIPTION =3D "Weston is the reference implementation=
 of a Wayland compositor"
>  HOMEPAGE =3D "http://wayland.freedesktop.org"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D275efac2559a224527bd4fd593d38=
466 \
> -                    file://src/compositor.c;endline=3D23;md5=3Daa98a8db0=
3480fe7d500d0b1f4b8850c"
> +                    file://src/compositor.c;endline=3D23;md5=3Da9793f1ed=
c8d1a4c344ca8ae252352fb"
>
> -SRC_URI =3D "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz=
 \
> +SRCREV =3D "2567c93f81309c91c7c9b247ea04122563f34de1"
> +SRC_URI =3D "git://anongit.freedesktop.org/wayland/weston \
>             file://weston.png \
>             file://weston.desktop \
> -           file://disable-wayland-scanner-pkg-check.patch \
>             file://make-lcms-explicitly-configurable.patch \
>             file://make-libwebp-explicitly-configurable.patch \
> +           file://0001-make-error-portable.patch \
>  "
> -SRC_URI[md5sum] =3D "c60ce9dde99a089db0539d8f6b557827"
> -SRC_URI[sha256sum] =3D "dc3ea5d13bbf025fabc006216c5ddc0d80d5f4ebe778912b=
8c4d1d4acaaa614d"
> +
> +S =3D "${WORKDIR}/git"
>
>  inherit autotools pkgconfig useradd
>
>  DEPENDS =3D "libxkbcommon gdk-pixbuf pixman cairo glib-2.0 jpeg"
> -DEPENDS +=3D "wayland virtual/egl pango"
> +DEPENDS +=3D "wayland libinput virtual/egl pango"
>
>  EXTRA_OECONF =3D "--enable-setuid-install \
>                  --disable-xwayland \
>                  --enable-simple-clients \
>                  --enable-clients \
>                  --enable-demo-clients-install \
> -                --disable-libunwind \
>                  --disable-rpi-compositor \
>                  --disable-rdp-compositor \
>                  "
>
> -
> +EXTRA_OECONF_append_qemux86 =3D "\
> +               WESTON_NATIVE_BACKEND=3Dfbdev-backend.so \
> +               "
> +EXTRA_OECONF_append_qemux86-64 =3D "\
> +               WESTON_NATIVE_BACKEND=3Dfbdev-backend.so \
> +               "
>  PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', =
'kms fbdev wayland egl', '', d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11',=
 '', d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'launc=
h', '', d)} \
> @@ -60,8 +65,8 @@ PACKAGECONFIG[cairo-glesv2] =3D "--with-cairo-glesv2,--=
with-cairo=3Dimage,cairo"
>  PACKAGECONFIG[lcms] =3D "--enable-lcms,--disable-lcms,lcms"
>  # Weston with webp support
>  PACKAGECONFIG[webp] =3D "--enable-webp,--disable-webp,libwebp"
> -# Weston with libinput backend
> -PACKAGECONFIG[libinput] =3D "--enable-libinput-backend,--disable-libinpu=
t-backend,libinput"
> +# Weston with unwinding support
> +PACKAGECONFIG[libunwind] =3D "--enable-libunwind,--disable-libunwind,lib=
unwind"
>
>  do_install_append() {
>         # Weston doesn't need the .la files to load modules, so wipe them
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


On 3 June 2015 at 19:41, Khem Raj <raj.khem@gmail.com> wrote:
> Use git for repo for SRC_URI
>
> copyright year changed for weston compositor.c
>
> - * Copyright =C2=A9 2012 Collabora, Ltd.
> + * Copyright =C2=A9 2012-2014 Collabora, Ltd.
>
> libinput license changes are
> - COPYING: note that having linux/input.h in the tree does not make libin=
put GPL
> - Updated to 2015 where appropriate, added where missing.
> - filter: add Simon's copyright
>   This code was largely lifted from the X server in
>   bb25b2ad297891430606c367bfabc but didn't take the copyright messages
>   that applied to that code.
>
> upgrade libinput to > 0.8.0 (0.16.0) which is needed for 1.7.0+ wayland
> For x86 emulators use fbdev backend
>
> Change-Id: I49c12853699a3a764d86869ec4d43b10ecda3379
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../wayland/{libinput_0.7.0.bb =3D> libinput_git.bb} | 15 ++--
>  .../wayland/{wayland_1.6.0.bb =3D> wayland_1.8.0.bb} |  9 ++-
>  .../wayland/weston/0001-make-error-portable.patch  | 80 ++++++++++++++++=
++++++
>  .../weston/disable-wayland-scanner-pkg-check.patch | 20 +++---
>  .../wayland/{weston_1.6.0.bb =3D> weston_1.8.0.bb}   | 25 ++++---
>  5 files changed, 124 insertions(+), 25 deletions(-)
>  rename meta/recipes-graphics/wayland/{libinput_0.7.0.bb =3D> libinput_gi=
t.bb} (42%)
>  rename meta/recipes-graphics/wayland/{wayland_1.6.0.bb =3D> wayland_1.8.=
0.bb} (87%)
>  create mode 100644 meta/recipes-graphics/wayland/weston/0001-make-error-=
portable.patch
>  rename meta/recipes-graphics/wayland/{weston_1.6.0.bb =3D> weston_1.8.0.=
bb} (84%)
>
> diff --git a/meta/recipes-graphics/wayland/libinput_0.7.0.bb b/meta/recip=
es-graphics/wayland/libinput_git.bb
> similarity index 42%
> rename from meta/recipes-graphics/wayland/libinput_0.7.0.bb
> rename to meta/recipes-graphics/wayland/libinput_git.bb
> index 98d2942..dcaf7d3 100644
> --- a/meta/recipes-graphics/wayland/libinput_0.7.0.bb
> +++ b/meta/recipes-graphics/wayland/libinput_git.bb
> @@ -3,12 +3,19 @@ HOMEPAGE =3D "http://www.freedesktop.org/wiki/Software/=
libinput/"
>  SECTION =3D "libs"
>
>  LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D673e626420c7f859fbe2be3a9c136=
32d"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D277a6eaa986f26fa040fc3cfa4ae4=
4b3"
>
>  DEPENDS =3D "libevdev udev mtdev"
>
> -SRC_URI =3D "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz"
> -SRC_URI[md5sum] =3D "381b61396de28c12716ef7a5475fea50"
> -SRC_URI[sha256sum] =3D "129f485afe5e4a9394641293991c97cb99f5f3338340d0d6=
5b704ff463d1579e"
> +SRCREV =3D "078421808179baa22af5cd35ad5e0aee86dffb41"
> +PV =3D "0.16.0+git${SRCPV}"
> +
> +SRC_URI =3D "git://anongit.freedesktop.org/wayland/libinput \
> +"
> +
> +S =3D "${WORKDIR}/git"
>
>  inherit autotools pkgconfig
> +
> +FILES_${PN} +=3D "${libdir}/udev/"
> +FILES_${PN}-dbg +=3D "${libdir}/udev/.debug"
> diff --git a/meta/recipes-graphics/wayland/wayland_1.6.0.bb b/meta/recipe=
s-graphics/wayland/wayland_1.8.0.bb
> similarity index 87%
> rename from meta/recipes-graphics/wayland/wayland_1.6.0.bb
> rename to meta/recipes-graphics/wayland/wayland_1.8.0.bb
> index 00713bf..b468277 100644
> --- a/meta/recipes-graphics/wayland/wayland_1.6.0.bb
> +++ b/meta/recipes-graphics/wayland/wayland_1.8.0.bb
> @@ -10,9 +10,12 @@ LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1d4476a7d98dd5691c53d4d43a510=
c72 \
>                      file://src/wayland-server.c;endline=3D21;md5=3D079ae=
21dbf98ada52ec23744851b0a5c"
>
> -SRC_URI =3D "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz=
"
> -SRC_URI[md5sum] =3D "d34c141c975084e4fb668e77b38f840e"
> -SRC_URI[sha256sum] =3D "a7d5102dcf53d08c059d24bc62de491d7cd482070abeb673=
7a20d0d86ba6fc7f"
> +SRCREV =3D "60024af597b68974c451c89f960a7c11de11c33a"
> +
> +SRC_URI =3D "git://anongit.freedesktop.org/wayland/wayland"
> +
> +S =3D "${WORKDIR}/git"
> +
>  SRC_URI_append_class-native =3D " \
>      file://disable-macro-checks-not-used-for-scanner.patch \
>      "
> diff --git a/meta/recipes-graphics/wayland/weston/0001-make-error-portabl=
e.patch b/meta/recipes-graphics/wayland/weston/0001-make-error-portable.pat=
ch
> new file mode 100644
> index 0000000..148848d
> --- /dev/null
> +++ b/meta/recipes-graphics/wayland/weston/0001-make-error-portable.patch
> @@ -0,0 +1,80 @@
> +From c22e90365d89346258394833cbcad03ff32b2e27 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Fri, 29 May 2015 20:56:00 -0700
> +Subject: [PATCH weston] make error() portable
> +
> +error() is not posix but gnu extension so may not be available on all
> +kind of systemsi e.g. musl.
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> +Upstream-Status: Submitted
> +
> + configure.ac        |  2 ++
> + src/weston-error.h  | 20 ++++++++++++++++++++
> + src/weston-launch.c |  2 +-
> + 3 files changed, 23 insertions(+), 1 deletion(-)
> + create mode 100644 src/weston-error.h
> +
> +diff --git a/configure.ac b/configure.ac
> +index 263fc22..f52cd62 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -57,6 +57,8 @@ AC_CHECK_DECL(CLOCK_MONOTONIC,[],
> +             [[#include <time.h>]])
> + AC_CHECK_HEADERS([execinfo.h])
> +
> ++AC_CHECK_HEADERS([error.h])
> ++
> + AC_CHECK_FUNCS([mkostemp strchrnul initgroups posix_fallocate])
> +
> + COMPOSITOR_MODULES=3D"wayland-server >=3D 1.7.93 pixman-1 >=3D 0.25.2"
> +diff --git a/src/weston-error.h b/src/weston-error.h
> +new file mode 100644
> +index 0000000..2089d02
> +--- /dev/null
> ++++ b/src/weston-error.h
> +@@ -0,0 +1,20 @@
> ++#ifndef _WESTON_ERROR_H
> ++#define _WESTON_ERROR_H
> ++
> ++#if defined(HAVE_ERROR_H)
> ++#include <error.h>
> ++#else
> ++#include <err.h>
> ++#include <string.h>
> ++#define _weston_error(S, E, F, ...) do { \
> ++      if (E) \
> ++              err(S, F ": %s", ##__VA_ARGS__, strerror(E)); \
> ++      else \
> ++              err(S, F, ##__VA_ARGS__); \
> ++} while(0)
> ++
> ++#define error _weston_error
> ++#endif
> ++
> ++#endif
> ++
> +diff --git a/src/weston-launch.c b/src/weston-launch.c
> +index 10c66de..3e6d30a 100644
> +--- a/src/weston-launch.c
> ++++ b/src/weston-launch.c
> +@@ -30,7 +30,6 @@
> + #include <poll.h>
> + #include <errno.h>
> +
> +-#include <error.h>
> + #include <getopt.h>
> +
> + #include <sys/types.h>
> +@@ -56,6 +55,7 @@
> + #endif
> +
> + #include "weston-launch.h"
> ++#include "weston-error.h"
> +
> + #define DRM_MAJOR 226
> +
> +--
> +2.1.4
> +
> diff --git a/meta/recipes-graphics/wayland/weston/disable-wayland-scanner=
-pkg-check.patch b/meta/recipes-graphics/wayland/weston/disable-wayland-sca=
nner-pkg-check.patch
> index 062da5c..68ba38b 100644
> --- a/meta/recipes-graphics/wayland/weston/disable-wayland-scanner-pkg-ch=
eck.patch
> +++ b/meta/recipes-graphics/wayland/weston/disable-wayland-scanner-pkg-ch=
eck.patch
> @@ -1,13 +1,17 @@
> -Index: weston-1.5.0/configure.ac
> +Index: git/configure.ac
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- weston-1.5.0.orig/configure.ac
> -+++ weston-1.5.0/configure.ac
> -@@ -503,7 +503,7 @@ if test x$wayland_scanner =3D x; then
> -       AC_MSG_ERROR([wayland-scanner is needed to compile weston])
> +--- git.orig/configure.ac
> ++++ git/configure.ac
> +@@ -501,12 +501,6 @@ if test "x$have_lcms" =3D xyes; then
>   fi
> + AM_CONDITIONAL(HAVE_LCMS, [test "x$have_lcms" =3D xyes])
>
> --PKG_CHECK_MODULES(WAYLAND_SCANNER, wayland-scanner)
> -+#PKG_CHECK_MODULES(WAYLAND_SCANNER, wayland-scanner)
> -
> +-AC_PATH_PROG([wayland_scanner], [wayland-scanner])
> +-if test x$wayland_scanner =3D x; then
> +-      PKG_CHECK_MODULES(WAYLAND_SCANNER, [wayland-scanner])
> +-      wayland_scanner=3D`$PKG_CONFIG --variable=3Dwayland_scanner wayla=
nd-scanner`
> +-fi
> +-
>   AC_CONFIG_FILES([Makefile src/version.h src/weston.pc])
>
> + AM_CONDITIONAL([HAVE_GIT_REPO], [test -f $srcdir/.git/logs/HEAD])
> diff --git a/meta/recipes-graphics/wayland/weston_1.6.0.bb b/meta/recipes=
-graphics/wayland/weston_1.8.0.bb
> similarity index 84%
> rename from meta/recipes-graphics/wayland/weston_1.6.0.bb
> rename to meta/recipes-graphics/wayland/weston_1.8.0.bb
> index d30e48b..732dca4 100644
> --- a/meta/recipes-graphics/wayland/weston_1.6.0.bb
> +++ b/meta/recipes-graphics/wayland/weston_1.8.0.bb
> @@ -3,34 +3,39 @@ DESCRIPTION =3D "Weston is the reference implementation=
 of a Wayland compositor"
>  HOMEPAGE =3D "http://wayland.freedesktop.org"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D275efac2559a224527bd4fd593d38=
466 \
> -                    file://src/compositor.c;endline=3D23;md5=3Daa98a8db0=
3480fe7d500d0b1f4b8850c"
> +                    file://src/compositor.c;endline=3D23;md5=3Da9793f1ed=
c8d1a4c344ca8ae252352fb"
>
> -SRC_URI =3D "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz=
 \
> +SRCREV =3D "2567c93f81309c91c7c9b247ea04122563f34de1"
> +SRC_URI =3D "git://anongit.freedesktop.org/wayland/weston \
>             file://weston.png \
>             file://weston.desktop \
> -           file://disable-wayland-scanner-pkg-check.patch \
>             file://make-lcms-explicitly-configurable.patch \
>             file://make-libwebp-explicitly-configurable.patch \
> +           file://0001-make-error-portable.patch \
>  "
> -SRC_URI[md5sum] =3D "c60ce9dde99a089db0539d8f6b557827"
> -SRC_URI[sha256sum] =3D "dc3ea5d13bbf025fabc006216c5ddc0d80d5f4ebe778912b=
8c4d1d4acaaa614d"
> +
> +S =3D "${WORKDIR}/git"
>
>  inherit autotools pkgconfig useradd
>
>  DEPENDS =3D "libxkbcommon gdk-pixbuf pixman cairo glib-2.0 jpeg"
> -DEPENDS +=3D "wayland virtual/egl pango"
> +DEPENDS +=3D "wayland libinput virtual/egl pango"
>
>  EXTRA_OECONF =3D "--enable-setuid-install \
>                  --disable-xwayland \
>                  --enable-simple-clients \
>                  --enable-clients \
>                  --enable-demo-clients-install \
> -                --disable-libunwind \
>                  --disable-rpi-compositor \
>                  --disable-rdp-compositor \
>                  "
>
> -
> +EXTRA_OECONF_append_qemux86 =3D "\
> +               WESTON_NATIVE_BACKEND=3Dfbdev-backend.so \
> +               "
> +EXTRA_OECONF_append_qemux86-64 =3D "\
> +               WESTON_NATIVE_BACKEND=3Dfbdev-backend.so \
> +               "
>  PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', =
'kms fbdev wayland egl', '', d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11',=
 '', d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'launc=
h', '', d)} \
> @@ -60,8 +65,8 @@ PACKAGECONFIG[cairo-glesv2] =3D "--with-cairo-glesv2,--=
with-cairo=3Dimage,cairo"
>  PACKAGECONFIG[lcms] =3D "--enable-lcms,--disable-lcms,lcms"
>  # Weston with webp support
>  PACKAGECONFIG[webp] =3D "--enable-webp,--disable-webp,libwebp"
> -# Weston with libinput backend
> -PACKAGECONFIG[libinput] =3D "--enable-libinput-backend,--disable-libinpu=
t-backend,libinput"
> +# Weston with unwinding support
> +PACKAGECONFIG[libunwind] =3D "--enable-libunwind,--disable-libunwind,lib=
unwind"
>
>  do_install_append() {
>         # Weston doesn't need the .la files to load modules, so wipe them
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

