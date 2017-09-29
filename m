Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2F92671984
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Sep 2017 03:09:12 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id h4so111745pfk.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Sep 2017 20:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=WWU8KJyyHPTd7GWGLfF9WvTUcyOiuea7ikW5wbumecI=;
	b=Y+FxbkW5CC/mDOWN9KE1Yu47Lhy0B7nlbSqhVLXDgUADpAHxNzVvyBLBoSi/Rpcaqd
	2G64pk3hTfayobyHs6kNJM/d8feXgbn4+ABgH/4cGjFsIjVRbGg90t5WEwNKrPPJ9qrj
	fX6zxuh3C4WfpdqsvV6OAqsniaRigMqh+vorBDKaJ2tZw99ST0Gn4k8ppIslW+PPE/nT
	7yGpibmStz0QhraKZbDRgEoACpPD2w4uWy24gJrzPakqI9u1mNgddFb10jKtvJdSv6Tm
	oSLhqIq7QavMy2QHPxMGH+FmxJcw3362UZmILUOjJdZglu4v6xni2dCdmTbFObFrIwLS
	zwAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=WWU8KJyyHPTd7GWGLfF9WvTUcyOiuea7ikW5wbumecI=;
	b=lE9j8NrBpHE2ZJqZJli7mAbKO/6jEiz1gq6tFrLxZcFEan/1bxjWG+om6tI/9TlJ6r
	XJSIbtIzogZGFM1BqpJvaHUB0LRhleaf8QAkd/h0AjBEsk/IVctGUks9n/gnE8Hi8MXq
	H9KfNB2v0Uucnu3yXmynhA+/14+Fsu9mG9VaBQ87WTBiFPTR1kAhYjusbR897cy01+nw
	FBFDg+LvBjoNMMXzDNQcvf/99HHNR02dtYMdKC9kMHlKo4SHjHvqvvJTtE0fiPEhjmCp
	wsvW4iFMPdaMJNLjrgnmURbYJIPB4MWgS9bjcJ4UmBdW9z8T5JnBrdpInIN2L6RH/K0w
	r5KQ==
X-Gm-Message-State: AMCzsaVyQunDKPsvbX/152E3hAIEaNkjIsGYwHOhAF5RDy9d0XTJc2wM
	h+l3vqHSNttq7iUy3YseM81QghOMKRfxFptWcwM=
X-Google-Smtp-Source: AOwi7QA4pcamzOpykpMxflbpIU0D9lEo4uQ+AGDcSMa+xdvQYAX9Ui6QL70IR9b2WQmXbXytIJ/hhuFCIcOhBN/7s0I=
X-Received: by 10.84.240.12 with SMTP id y12mr121322plk.215.1506654554074;
	Thu, 28 Sep 2017 20:09:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.149.73 with HTTP; Thu, 28 Sep 2017 20:08:43 -0700 (PDT)
In-Reply-To: <1506614485-31675-2-git-send-email-fabien.lahoudere@collabora.co.uk>
References: <1506614485-31675-1-git-send-email-fabien.lahoudere@collabora.co.uk>
	<1506614485-31675-2-git-send-email-fabien.lahoudere@collabora.co.uk>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Sep 2017 20:08:43 -0700
Message-ID: <CAMKF1sqtTMwQOtaGBXhnj3_WVW3sLKdUCZc8zNmeEDa247PenQ@mail.gmail.com>
To: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4 2/3] wayland: Fix installation patch issue
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
X-List-Received-Date: Fri, 29 Sep 2017 03:09:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

this is a good patch. Thanks

On Thu, Sep 28, 2017 at 9:01 AM, Fabien Lahoudere
<fabien.lahoudere@collabora.co.uk> wrote:
> This patch modify the way we manage wayland path issues.
> Instead of patching each recipe to make it work with wayland and its prot=
ocols,
> it is better to patch wayland to fix its path issues.
>
> So wayland-scanner.pc, wayland-client.pc and wayland-protocols.pc are pat=
ched to change paths.
>
> Then we can drop the following workaround:
>
> WAYLAND_PROTOCOLS_SYSROOT_DIR=3D${RECIPE_SYSROOT}
>
> in:
>
> - gtk+3
> - libsdl2
> - xserver-xorg
> - gstreamer1.0-plugins-bad
> - weston-2.0.0
>
> We also dropped libsdl2 patches which fix wayland paths.
>
> Signed-off-by: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
> ---
>  meta/recipes-gnome/gtk+/gtk+3.inc                  |  1 -
>  ...-sysroot-path-so-that-make-finds-our-wayl.patch | 34 ----------------=
------
>  ...void-finding-build-host-s-wayland-scanner.patch | 31 ----------------=
----
>  meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb     |  4 +--
>  .../usesysrootprefixforpkgdatadirvariable.patch    | 27 ++++++++++++++++=
+
>  .../wayland/wayland-protocols_1.10.bb              |  1 +
>  .../wayland/wayland/fixpathinpcfiles.patch         | 33 ++++++++++++++++=
+++++
>  meta/recipes-graphics/wayland/wayland_1.14.0.bb    |  1 +
>  meta/recipes-graphics/wayland/weston_2.0.0.bb      |  1 -
>  .../recipes-graphics/xorg-xserver/xserver-xorg.inc |  1 -
>  .../gstreamer/gstreamer1.0-plugins-bad_1.12.2.bb   |  1 -
>  11 files changed, 63 insertions(+), 72 deletions(-)
>  delete mode 100644 meta/recipes-graphics/libsdl2/libsdl2/0001-prepend-ou=
r-sysroot-path-so-that-make-finds-our-wayl.patch
>  delete mode 100644 meta/recipes-graphics/libsdl2/libsdl2/0002-Avoid-find=
ing-build-host-s-wayland-scanner.patch
>  create mode 100644 meta/recipes-graphics/wayland/wayland-protocols/usesy=
srootprefixforpkgdatadirvariable.patch
>  create mode 100644 meta/recipes-graphics/wayland/wayland/fixpathinpcfile=
s.patch
>
> diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk+/=
gtk+3.inc
> index 0a357db..420ead2 100644
> --- a/meta/recipes-gnome/gtk+/gtk+3.inc
> +++ b/meta/recipes-gnome/gtk+/gtk+3.inc
> @@ -35,7 +35,6 @@ EXTRA_OECONF +=3D " \
>                   --enable-modules \
>                   --disable-cups \
>                   --disable-colord \
> -                 WAYLAND_PROTOCOLS_SYSROOT_DIR=3D${RECIPE_SYSROOT} \
>                   ${@bb.utils.contains("DISTRO_FEATURES", "x11", "", "--d=
isable-gtk-doc", d)} \
>                   "
>
> diff --git a/meta/recipes-graphics/libsdl2/libsdl2/0001-prepend-our-sysro=
ot-path-so-that-make-finds-our-wayl.patch b/meta/recipes-graphics/libsdl2/l=
ibsdl2/0001-prepend-our-sysroot-path-so-that-make-finds-our-wayl.patch
> deleted file mode 100644
> index efc8418..0000000
> --- a/meta/recipes-graphics/libsdl2/libsdl2/0001-prepend-our-sysroot-path=
-so-that-make-finds-our-wayl.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -From b44808e43130dcd13b43e5b978b9b24aeb4c134c Mon Sep 17 00:00:00 2001
> -From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@googlem=
ail.com>
> -Date: Thu, 20 Oct 2016 14:57:51 +0200
> -Subject: [PATCH] prepend our sysroot path so that make finds our
> - wayland-protocol files
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -Upstream-Status: Inappropriate [embedded specific]
> -
> -Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ----
> - configure.in | 4 +-
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/configure.in b/configure.in
> -index 726ded3..3376600 100644
> ---- a/configure.in
> -+++ b/configure.in
> -@@ -1206,7 +1206,7 @@ AC_HELP_STRING([--enable-video-wayland-qt-touch], =
[QtWayland server support for
> -                 WAYLAND_CFLAGS=3D`$PKG_CONFIG --cflags wayland-client w=
ayland-egl wayland-cursor xkbcommon`
> -                 WAYLAND_LIBS=3D`$PKG_CONFIG --libs wayland-client wayla=
nd-egl wayland-cursor xkbcommon`
> -                 WAYLAND_SCANNER=3D`$PKG_CONFIG --variable=3Dwayland_sca=
nner wayland-scanner`
> --                WAYLAND_CORE_PROTOCOL_DIR=3D`$PKG_CONFIG --variable=3Dp=
kgdatadir wayland-client`
> --                WAYLAND_PROTOCOLS_DIR=3D`$PKG_CONFIG --variable=3Dpkgda=
tadir wayland-protocols`
> -+                WAYLAND_CORE_PROTOCOL_DIR=3D${WAYLAND_PROTOCOLS_SYSROOT=
_DIR}`$PKG_CONFIG --variable=3Dpkgdatadir wayland-client`
> -+                WAYLAND_PROTOCOLS_DIR=3D${WAYLAND_PROTOCOLS_SYSROOT_DIR=
}`$PKG_CONFIG --variable=3Dpkgdatadir wayland-protocols`
> -                 video_wayland=3Dyes
> -             fi
> -         fi
> ---
> -2.5.5
> -
> diff --git a/meta/recipes-graphics/libsdl2/libsdl2/0002-Avoid-finding-bui=
ld-host-s-wayland-scanner.patch b/meta/recipes-graphics/libsdl2/libsdl2/000=
2-Avoid-finding-build-host-s-wayland-scanner.patch
> deleted file mode 100644
> index 7837315..0000000
> --- a/meta/recipes-graphics/libsdl2/libsdl2/0002-Avoid-finding-build-host=
-s-wayland-scanner.patch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -From ae879091cf65cb70293b375ec7e61ed12a96d8a7 Mon Sep 17 00:00:00 2001
> -From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@googlem=
ail.com>
> -Date: Fri, 2 Dec 2016 09:39:25 +0100
> -Subject: [PATCH] Avoid finding build host's wayland-scanner
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -Upstream-Status: Inappropriate [embedded specific]
> -
> -Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ----
> - configure.in | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/configure.in b/configure.in
> -index 3376600..2aa6ed4 100644
> ---- a/configure.in
> -+++ b/configure.in
> -@@ -1204,7 +1204,7 @@ AC_HELP_STRING([--enable-video-wayland-qt-touch], =
[QtWayland server support for
> -             if $PKG_CONFIG --exists wayland-client wayland-scanner wayl=
and-protocols wayland-egl wayland-cursor egl xkbcommon ; then
> -                 WAYLAND_CFLAGS=3D`$PKG_CONFIG --cflags wayland-client w=
ayland-egl wayland-cursor xkbcommon`
> -                 WAYLAND_LIBS=3D`$PKG_CONFIG --libs wayland-client wayla=
nd-egl wayland-cursor xkbcommon`
> --                WAYLAND_SCANNER=3D`$PKG_CONFIG --variable=3Dwayland_sca=
nner wayland-scanner`
> -+                AC_PATH_PROG([WAYLAND_SCANNER], [wayland-scanner])
> -                 WAYLAND_CORE_PROTOCOL_DIR=3D${WAYLAND_PROTOCOLS_SYSROOT=
_DIR}`$PKG_CONFIG --variable=3Dpkgdatadir wayland-client`
> -                 WAYLAND_PROTOCOLS_DIR=3D${WAYLAND_PROTOCOLS_SYSROOT_DIR=
}`$PKG_CONFIG --variable=3Dpkgdatadir wayland-protocols`
> -                 video_wayland=3Dyes
> ---
> -2.7.4
> -
> diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb b/meta/recipe=
s-graphics/libsdl2/libsdl2_2.0.5.bb
> index 12d3aaf..032f45b 100644
> --- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb
> +++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb
> @@ -17,8 +17,6 @@ DEPENDS_class-nativesdk =3D "${@bb.utils.contains('DIST=
RO_FEATURES', 'x11', 'virtu
>  SRC_URI =3D " \
>      http://www.libsdl.org/release/SDL2-${PV}.tar.gz \
>      file://linkage.patch \
> -    file://0001-prepend-our-sysroot-path-so-that-make-finds-our-wayl.pat=
ch \
> -    file://0002-Avoid-finding-build-host-s-wayland-scanner.patch \
>      file://fix-build-failure-on-ppc.patch \
>  "
>
> @@ -35,7 +33,7 @@ EXTRA_OECONF =3D "--disable-oss --disable-esd --disable=
-arts \
>                  --enable-pthreads \
>                  --enable-sdl-dlopen \
>                  --disable-rpath \
> -                WAYLAND_PROTOCOLS_SYSROOT_DIR=3D${RECIPE_SYSROOT}"
> +                "
>
>  # opengl packageconfig factored out to make it easy for distros
>  # and BSP layers to pick either (desktop) opengl, gles2, or no GL
> diff --git a/meta/recipes-graphics/wayland/wayland-protocols/usesysrootpr=
efixforpkgdatadirvariable.patch b/meta/recipes-graphics/wayland/wayland-pro=
tocols/usesysrootprefixforpkgdatadirvariable.patch
> new file mode 100644
> index 0000000..0922a4d
> --- /dev/null
> +++ b/meta/recipes-graphics/wayland/wayland-protocols/usesysrootprefixfor=
pkgdatadirvariable.patch
> @@ -0,0 +1,27 @@
> +From 875130ee3cbcf62266901ef4b91b9a0fb6adad43 Mon Sep 17 00:00:00 2001
> +From: Tomek Bury <tomek.bury@broadcom.com>
> +Date: Fri, 4 Aug 2017 16:16:38 +0100
> +Subject: Use sysroot prefix for pkgdatadir variable
> +
> +The pc_sysroot is automatically added to cflags and libs but not
> +to 'pkg-config --variable'
> +
> +Upstream-Status: Backport [https://cgit.freedesktop.org/wayland/wayland-=
protocols/commit/?id=3D875130ee3cbcf62266901ef4b91b9a0fb6adad43]
> +
> +Reviewed-by: Daniel Stone <daniels@collabora.com>
> +
> +diff --git a/wayland-protocols.pc.in b/wayland-protocols.pc.in
> +index a26744c..379be06 100644
> +--- a/wayland-protocols.pc.in
> ++++ b/wayland-protocols.pc.in
> +@@ -1,6 +1,6 @@
> + prefix=3D@prefix@
> + datarootdir=3D@datarootdir@
> +-pkgdatadir=3D@datadir@/@PACKAGE@
> ++pkgdatadir=3D${pc_sysrootdir}@datadir@/@PACKAGE@
> +
> + Name: Wayland Protocols
> + Description: Wayland protocol files
> +--
> +cgit v0.10.2
> +
> diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.10.bb b/me=
ta/recipes-graphics/wayland/wayland-protocols_1.10.bb
> index 4f9e9f3..1ff12c6 100644
> --- a/meta/recipes-graphics/wayland/wayland-protocols_1.10.bb
> +++ b/meta/recipes-graphics/wayland/wayland-protocols_1.10.bb
> @@ -10,6 +10,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc7b12b6702da=
38ca028ace54aae3d484 \
>                      file://stable/presentation-time/presentation-time.xm=
l;endline=3D26;md5=3D4646cd7d9edc9fa55db941f2d3a7dc53"
>
>  SRC_URI =3D "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.x=
z \
> +          file://usesysrootprefixforpkgdatadirvariable.patch \
>             "
>  SRC_URI[md5sum] =3D "84a7846c2b6a6a3e265fc9be36453e60"
>  SRC_URI[sha256sum] =3D "5719c51d7354864983171c5083e93a72ac99229e2b460c4b=
b10513de08839c0a"
> diff --git a/meta/recipes-graphics/wayland/wayland/fixpathinpcfiles.patch=
 b/meta/recipes-graphics/wayland/wayland/fixpathinpcfiles.patch
> new file mode 100644
> index 0000000..9fb1252
> --- /dev/null
> +++ b/meta/recipes-graphics/wayland/wayland/fixpathinpcfiles.patch
> @@ -0,0 +1,33 @@
> +Fix wayland-client and wayland-scanner pc files
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
> +
> +Index: wayland-1.14.0/src/wayland-client.pc.in
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- wayland-1.14.0.orig/src/wayland-client.pc.in
> ++++ wayland-1.14.0/src/wayland-client.pc.in
> +@@ -1,7 +1,7 @@
> + prefix=3D@prefix@
> + exec_prefix=3D@exec_prefix@
> + datarootdir=3D@datarootdir@
> +-pkgdatadir=3D@datadir@/@PACKAGE@
> ++pkgdatadir=3D${pc_sysrootdir}@datadir@/@PACKAGE@
> + libdir=3D@libdir@
> + includedir=3D@includedir@
> +
> +Index: wayland-1.14.0/src/wayland-scanner.pc.in
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- wayland-1.14.0.orig/src/wayland-scanner.pc.in
> ++++ wayland-1.14.0/src/wayland-scanner.pc.in
> +@@ -1,8 +1,8 @@
> + prefix=3D@prefix@
> + exec_prefix=3D@exec_prefix@
> + datarootdir=3D@datarootdir@
> + pkgdatadir=3D@datadir@/@PACKAGE@
> +-wayland_scanner=3D@bindir@/wayland-scanner
> ++wayland_scanner=3Dwayland-scanner
> +
> + Name: Wayland Scanner
> + Description: Wayland scanner
> diff --git a/meta/recipes-graphics/wayland/wayland_1.14.0.bb b/meta/recip=
es-graphics/wayland/wayland_1.14.0.bb
> index 2a2489d..1a9ff98 100644
> --- a/meta/recipes-graphics/wayland/wayland_1.14.0.bb
> +++ b/meta/recipes-graphics/wayland/wayland_1.14.0.bb
> @@ -13,6 +13,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db31d8f53b6aa=
f2b4985d7dd7810a70d1 \
>  DEPENDS =3D "expat libxml2 libffi wayland-native"
>
>  SRC_URI =3D "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.x=
z \
> +          file://fixpathinpcfiles.patch \
>             "
>  SRC_URI[md5sum] =3D "0235f6075c32c3be61cff94fa0b9f108"
>  SRC_URI[sha256sum] =3D "ed80cabc0961a759a42092e2c39aabfc1ec9a13c86c98bbe=
2b812f008da27ab8"
> diff --git a/meta/recipes-graphics/wayland/weston_2.0.0.bb b/meta/recipes=
-graphics/wayland/weston_2.0.0.bb
> index 54b07bd..8160f55 100644
> --- a/meta/recipes-graphics/wayland/weston_2.0.0.bb
> +++ b/meta/recipes-graphics/wayland/weston_2.0.0.bb
> @@ -25,7 +25,6 @@ DEPENDS +=3D "wayland wayland-protocols libinput virtua=
l/egl pango wayland-native"
>
>  EXTRA_OECONF =3D "--enable-setuid-install \
>                  --disable-rdp-compositor \
> -                WAYLAND_PROTOCOLS_SYSROOT_DIR=3D${RECIPE_SYSROOT} \
>                  "
>  EXTRA_OECONF_append_qemux86 =3D "\
>                 WESTON_NATIVE_BACKEND=3Dfbdev-backend.so \
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/r=
ecipes-graphics/xorg-xserver/xserver-xorg.inc
> index 863d80c..e8025de 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> @@ -117,7 +117,6 @@ EXTRA_OECONF +=3D "--with-fop=3Dno \
>                   --sysconfdir=3D/etc/X11 \
>                   --localstatedir=3D/var \
>                   --with-xkb-output=3D/var/lib/xkb \
> -                 WAYLAND_PROTOCOLS_SYSROOT_DIR=3D${RECIPE_SYSROOT} \
>  "
>
>  OPENGL_PKGCONFIGS =3D "dri glx glamor dri3 xshmfence"
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1=
.12.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.12.=
2.bb
> index 8321da0..a83a5ba 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.12.2.b=
b
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.12.2.b=
b
> @@ -22,5 +22,4 @@ SRC_URI[sha256sum] =3D "9c2c7edde4f59d74eb414e0701c5513=
1f562e5c605a3ce9b091754f106
>
>  S =3D "${WORKDIR}/gst-plugins-bad-${PV}"
>
> -EXTRA_OECONF +=3D "WAYLAND_PROTOCOLS_SYSROOT_DIR=3D${RECIPE_SYSROOT}"
>
> --
> 1.8.3.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

