Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id 9BE3E71AD8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Sep 2017 10:32:49 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id y138so1683528itc.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Sep 2017 03:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+0++xrMjVj3y71Pj/EwyCTvrDs/p3Q1T+ATMx0vAyno=;
	b=pndHII8PDS0xbwthVqdsddyZHp17urmCVzh4ezS6OcQZqFl0hBnFik5hwWSgXd/Fjl
	fAw8VNKtWBrUF1++sHCogStWAi+4yehTOm8c6KdF07Cqr+Q4VfWGZgIl3rjG/h+7FolC
	WIm7gTUsGrHYLrpbBRmC4qiSEkoZN6YflNqd3r+FUdCpujvQ0xXYZxpcvJ2TwUD/ss+9
	tFdQlXhHg0ArJ1jyFHMVmsY3Gbq0gYBtwdsRtqyJQeAUj6svdZ5waSbApQI2tR2vXRx+
	+w0Phbs173caNbLOKCvp2hevK1KuplQL+1IxzkbGNnkKxv9WgD8bMd2BpSsoiR2800lI
	xnjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+0++xrMjVj3y71Pj/EwyCTvrDs/p3Q1T+ATMx0vAyno=;
	b=DeTLD/+sXK5svrEAAWUduSJUVcxNjYEKrHmt78OK/MercCnaRm7EABXkg/8fcc9LYa
	Sq6zWjTwmHldxy83RqzWDZw/gGEnH+vkG+k14sk3fhFVIc5ydcRv80VFtM/f+ozL20kU
	p3SB5dgd2YDqY586Mp+GORhf2Sxe3g31n24KvEQ+kC5lxYWqbVV5Qi366CcgaUH6fAyb
	/2K5ENRI7oL3pAVIk1jpRzQUADjrZg/Ze4EQxF76X7UFsu3nx3CWpSSdYBFFqEclEAlJ
	WamagNzLeA0hyJaZ2LdKEc5qxRWHy0+mym3Zs6wC+qnGjBKXg0qKnc3C8Ugm9QfOScmV
	w1IA==
X-Gm-Message-State: AHPjjUi9nuocOmrd4cozOa//wdycQ6kSdchCM999omU+EHfKY58InqIZ
	Q6/6ksOy7fnjAU/Leeg5qxds0ZvHXQQvprsQ8O9D5w==
X-Google-Smtp-Source: AOwi7QAezTopnT/V8bWw/DALrMtcd2S97eiPSSsNQM+tZovI14tqOut+GEkqZz2he1s1sImQ0/KLBLFTseefnfUG+pM=
X-Received: by 10.36.150.4 with SMTP id z4mr6484864itd.48.1506681170560; Fri,
	29 Sep 2017 03:32:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.19.68 with HTTP; Fri, 29 Sep 2017 03:32:30 -0700 (PDT)
In-Reply-To: <1506614485-31675-2-git-send-email-fabien.lahoudere@collabora.co.uk>
References: <1506614485-31675-1-git-send-email-fabien.lahoudere@collabora.co.uk>
	<1506614485-31675-2-git-send-email-fabien.lahoudere@collabora.co.uk>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 29 Sep 2017 11:32:30 +0100
Message-ID: <CAJTo0LZ+FcABO+WPvQ10qQHuJ8QQzYYbwBbNHMQGEJC3vn62hw@mail.gmail.com>
To: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
Cc: OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Fri, 29 Sep 2017 10:32:49 -0000
Content-Type: multipart/alternative; boundary="94eb2c07ea98f64c91055a518b13"

--94eb2c07ea98f64c91055a518b13
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

With xserver-xorg I get:

| make[2]: *** No rule to make target
'//usr/share/wayland-protocols/unstable/relative-pointer/relative-pointer-u=
nstable-v1.xml',
needed by 'relative-pointer-unstable-v1-client-protocol.h'.  Stop.

(in the xwayland directory)

Ross

On 28 September 2017 at 17:01, Fabien Lahoudere <
fabien.lahoudere@collabora.co.uk> wrote:

> This patch modify the way we manage wayland path issues.
> Instead of patching each recipe to make it work with wayland and its
> protocols,
> it is better to patch wayland to fix its path issues.
>
> So wayland-scanner.pc, wayland-client.pc and wayland-protocols.pc are
> patched to change paths.
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
>  ...-sysroot-path-so-that-make-finds-our-wayl.patch | 34
> ----------------------
>  ...void-finding-build-host-s-wayland-scanner.patch | 31
> --------------------
>  meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb     |  4 +--
>  .../usesysrootprefixforpkgdatadirvariable.patch    | 27 ++++++++++++++++=
+
>  .../wayland/wayland-protocols_1.10.bb              |  1 +
>  .../wayland/wayland/fixpathinpcfiles.patch         | 33
> +++++++++++++++++++++
>  meta/recipes-graphics/wayland/wayland_1.14.0.bb    |  1 +
>  meta/recipes-graphics/wayland/weston_2.0.0.bb      |  1 -
>  .../recipes-graphics/xorg-xserver/xserver-xorg.inc |  1 -
>  .../gstreamer/gstreamer1.0-plugins-bad_1.12.2.bb   |  1 -
>  11 files changed, 63 insertions(+), 72 deletions(-)
>  delete mode 100644 meta/recipes-graphics/libsdl2/
> libsdl2/0001-prepend-our-sysroot-path-so-that-make-finds-our-wayl.patch
>  delete mode 100644 meta/recipes-graphics/libsdl2/
> libsdl2/0002-Avoid-finding-build-host-s-wayland-scanner.patch
>  create mode 100644 meta/recipes-graphics/wayland/wayland-protocols/
> usesysrootprefixforpkgdatadirvariable.patch
>  create mode 100644 meta/recipes-graphics/wayland/
> wayland/fixpathinpcfiles.patch
>
> diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc
> b/meta/recipes-gnome/gtk+/gtk+3.inc
> index 0a357db..420ead2 100644
> --- a/meta/recipes-gnome/gtk+/gtk+3.inc
> +++ b/meta/recipes-gnome/gtk+/gtk+3.inc
> @@ -35,7 +35,6 @@ EXTRA_OECONF +=3D " \
>                   --enable-modules \
>                   --disable-cups \
>                   --disable-colord \
> -                 WAYLAND_PROTOCOLS_SYSROOT_DIR=3D${RECIPE_SYSROOT} \
>                   ${@bb.utils.contains("DISTRO_FEATURES", "x11", "",
> "--disable-gtk-doc", d)} \
>                   "
>
> diff --git a/meta/recipes-graphics/libsdl2/libsdl2/0001-prepend-
> our-sysroot-path-so-that-make-finds-our-wayl.patch
> b/meta/recipes-graphics/libsdl2/libsdl2/0001-prepend-
> our-sysroot-path-so-that-make-finds-our-wayl.patch
> deleted file mode 100644
> index efc8418..0000000
> --- a/meta/recipes-graphics/libsdl2/libsdl2/0001-prepend-
> our-sysroot-path-so-that-make-finds-our-wayl.patch
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
> -@@ -1206,7 +1206,7 @@ AC_HELP_STRING([--enable-video-wayland-qt-touch],
> [QtWayland server support for
> -                 WAYLAND_CFLAGS=3D`$PKG_CONFIG --cflags wayland-client
> wayland-egl wayland-cursor xkbcommon`
> -                 WAYLAND_LIBS=3D`$PKG_CONFIG --libs wayland-client
> wayland-egl wayland-cursor xkbcommon`
> -                 WAYLAND_SCANNER=3D`$PKG_CONFIG --variable=3Dwayland_sca=
nner
> wayland-scanner`
> --                WAYLAND_CORE_PROTOCOL_DIR=3D`$PKG_CONFIG
> --variable=3Dpkgdatadir wayland-client`
> --                WAYLAND_PROTOCOLS_DIR=3D`$PKG_CONFIG
> --variable=3Dpkgdatadir wayland-protocols`
> -+                WAYLAND_CORE_PROTOCOL_DIR=3D${
> WAYLAND_PROTOCOLS_SYSROOT_DIR}`$PKG_CONFIG --variable=3Dpkgdatadir
> wayland-client`
> -+                WAYLAND_PROTOCOLS_DIR=3D${WAYLAND_PROTOCOLS_SYSROOT_DIR=
}`$PKG_CONFIG
> --variable=3Dpkgdatadir wayland-protocols`
> -                 video_wayland=3Dyes
> -             fi
> -         fi
> ---
> -2.5.5
> -
> diff --git a/meta/recipes-graphics/libsdl2/libsdl2/0002-Avoid-
> finding-build-host-s-wayland-scanner.patch b/meta/recipes-graphics/
> libsdl2/libsdl2/0002-Avoid-finding-build-host-s-wayland-scanner.patch
> deleted file mode 100644
> index 7837315..0000000
> --- a/meta/recipes-graphics/libsdl2/libsdl2/0002-Avoid-
> finding-build-host-s-wayland-scanner.patch
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
> -@@ -1204,7 +1204,7 @@ AC_HELP_STRING([--enable-video-wayland-qt-touch],
> [QtWayland server support for
> -             if $PKG_CONFIG --exists wayland-client wayland-scanner
> wayland-protocols wayland-egl wayland-cursor egl xkbcommon ; then
> -                 WAYLAND_CFLAGS=3D`$PKG_CONFIG --cflags wayland-client
> wayland-egl wayland-cursor xkbcommon`
> -                 WAYLAND_LIBS=3D`$PKG_CONFIG --libs wayland-client
> wayland-egl wayland-cursor xkbcommon`
> --                WAYLAND_SCANNER=3D`$PKG_CONFIG --variable=3Dwayland_sca=
nner
> wayland-scanner`
> -+                AC_PATH_PROG([WAYLAND_SCANNER], [wayland-scanner])
> -                 WAYLAND_CORE_PROTOCOL_DIR=3D${
> WAYLAND_PROTOCOLS_SYSROOT_DIR}`$PKG_CONFIG --variable=3Dpkgdatadir
> wayland-client`
> -                 WAYLAND_PROTOCOLS_DIR=3D${WAYLAND_PROTOCOLS_SYSROOT_DIR=
}`$PKG_CONFIG
> --variable=3Dpkgdatadir wayland-protocols`
> -                 video_wayland=3Dyes
> ---
> -2.7.4
> -
> diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb
> b/meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb
> index 12d3aaf..032f45b 100644
> --- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb
> +++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb
> @@ -17,8 +17,6 @@ DEPENDS_class-nativesdk =3D "${@bb.utils.contains('DIST=
RO_FEATURES',
> 'x11', 'virtu
>  SRC_URI =3D " \
>      http://www.libsdl.org/release/SDL2-${PV}.tar.gz \
>      file://linkage.patch \
> -    file://0001-prepend-our-sysroot-path-so-that-make-finds-our-wayl.pat=
ch
> \
> -    file://0002-Avoid-finding-build-host-s-wayland-scanner.patch \
>      file://fix-build-failure-on-ppc.patch \
>  "
>
> @@ -35,7 +33,7 @@ EXTRA_OECONF =3D "--disable-oss --disable-esd
> --disable-arts \
>                  --enable-pthreads \
>                  --enable-sdl-dlopen \
>                  --disable-rpath \
> -                WAYLAND_PROTOCOLS_SYSROOT_DIR=3D${RECIPE_SYSROOT}"
> +                "
>
>  # opengl packageconfig factored out to make it easy for distros
>  # and BSP layers to pick either (desktop) opengl, gles2, or no GL
> diff --git a/meta/recipes-graphics/wayland/wayland-protocols/
> usesysrootprefixforpkgdatadirvariable.patch b/meta/recipes-graphics/
> wayland/wayland-protocols/usesysrootprefixforpkgdatadirvariable.patch
> new file mode 100644
> index 0000000..0922a4d
> --- /dev/null
> +++ b/meta/recipes-graphics/wayland/wayland-protocols/
> usesysrootprefixforpkgdatadirvariable.patch
> @@ -0,0 +1,27 @@
> +From 875130ee3cbcf62266901ef4b91b9a0fb6adad43 Mon Sep 17 00:00:00 2001
> +From: Tomek Bury <tomek.bury@broadcom.com>
> +Date: Fri, 4 Aug 2017 16:16:38 +0100
> +Subject: Use sysroot prefix for pkgdatadir variable
> +
> +The pc_sysroot is automatically added to cflags and libs but not
> +to 'pkg-config --variable'
> +
> +Upstream-Status: Backport [https://cgit.freedesktop.org/
> wayland/wayland-protocols/commit/?id=3D875130ee3cbcf62266901ef4b91b9a
> 0fb6adad43]
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
> diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.10.bb
> b/meta/recipes-graphics/wayland/wayland-protocols_1.10.bb
> index 4f9e9f3..1ff12c6 100644
> --- a/meta/recipes-graphics/wayland/wayland-protocols_1.10.bb
> +++ b/meta/recipes-graphics/wayland/wayland-protocols_1.10.bb
> @@ -10,6 +10,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D
> c7b12b6702da38ca028ace54aae3d484 \
>                      file://stable/presentation-
> time/presentation-time.xml;endline=3D26;md5=3D4646cd7d9edc9fa55db941f2d3a=
7dc
> 53"
>
>  SRC_URI =3D "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.x=
z \
> +          file://usesysrootprefixforpkgdatadirvariable.patch \
>             "
>  SRC_URI[md5sum] =3D "84a7846c2b6a6a3e265fc9be36453e60"
>  SRC_URI[sha256sum] =3D "5719c51d7354864983171c5083e93a
> 72ac99229e2b460c4bb10513de08839c0a"
> diff --git a/meta/recipes-graphics/wayland/wayland/fixpathinpcfiles.patch
> b/meta/recipes-graphics/wayland/wayland/fixpathinpcfiles.patch
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
> diff --git a/meta/recipes-graphics/wayland/wayland_1.14.0.bb
> b/meta/recipes-graphics/wayland/wayland_1.14.0.bb
> index 2a2489d..1a9ff98 100644
> --- a/meta/recipes-graphics/wayland/wayland_1.14.0.bb
> +++ b/meta/recipes-graphics/wayland/wayland_1.14.0.bb
> @@ -13,6 +13,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D
> b31d8f53b6aaf2b4985d7dd7810a70d1 \
>  DEPENDS =3D "expat libxml2 libffi wayland-native"
>
>  SRC_URI =3D "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.x=
z \
> +          file://fixpathinpcfiles.patch \
>             "
>  SRC_URI[md5sum] =3D "0235f6075c32c3be61cff94fa0b9f108"
>  SRC_URI[sha256sum] =3D "ed80cabc0961a759a42092e2c39aab
> fc1ec9a13c86c98bbe2b812f008da27ab8"
> diff --git a/meta/recipes-graphics/wayland/weston_2.0.0.bb
> b/meta/recipes-graphics/wayland/weston_2.0.0.bb
> index 54b07bd..8160f55 100644
> --- a/meta/recipes-graphics/wayland/weston_2.0.0.bb
> +++ b/meta/recipes-graphics/wayland/weston_2.0.0.bb
> @@ -25,7 +25,6 @@ DEPENDS +=3D "wayland wayland-protocols libinput
> virtual/egl pango wayland-native"
>
>  EXTRA_OECONF =3D "--enable-setuid-install \
>                  --disable-rdp-compositor \
> -                WAYLAND_PROTOCOLS_SYSROOT_DIR=3D${RECIPE_SYSROOT} \
>                  "
>  EXTRA_OECONF_append_qemux86 =3D "\
>                 WESTON_NATIVE_BACKEND=3Dfbdev-backend.so \
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
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
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-bad_1.12.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-bad_1.12.2.bb
> index 8321da0..a83a5ba 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.12.2.b=
b
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.12.2.b=
b
> @@ -22,5 +22,4 @@ SRC_URI[sha256sum] =3D "9c2c7edde4f59d74eb414e0701c551
> 31f562e5c605a3ce9b091754f106
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
>

--94eb2c07ea98f64c91055a518b13
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">With xserver-xorg I get:<div><br></div><div>| make[2]: ***=
 No rule to make target &#39;//usr/share/wayland-protocols/unstable/relativ=
e-pointer/relative-pointer-unstable-v1.xml&#39;, needed by &#39;relative-po=
inter-unstable-v1-client-protocol.h&#39;.=C2=A0 Stop.<br><div><br></div><di=
v>(in the xwayland directory)</div><div><br></div><div>Ross</div></div></di=
v><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 28 September=
 2017 at 17:01, Fabien Lahoudere <span dir=3D"ltr">&lt;<a href=3D"mailto:fa=
bien.lahoudere@collabora.co.uk" target=3D"_blank">fabien.lahoudere@collabor=
a.co.uk</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">This patch =
modify the way we manage wayland path issues.<br>
Instead of patching each recipe to make it work with wayland and its protoc=
ols,<br>
it is better to patch wayland to fix its path issues.<br>
<br>
So wayland-scanner.pc, wayland-client.pc and wayland-protocols.pc are patch=
ed to change paths.<br>
<br>
Then we can drop the following workaround:<br>
<br>
WAYLAND_PROTOCOLS_SYSROOT_DIR=3D<wbr>${RECIPE_SYSROOT}<br>
<br>
in:<br>
<br>
- gtk+3<br>
- libsdl2<br>
- xserver-xorg<br>
- gstreamer1.0-plugins-bad<br>
- weston-2.0.0<br>
<br>
We also dropped libsdl2 patches which fix wayland paths.<br>
<br>
Signed-off-by: Fabien Lahoudere &lt;<a href=3D"mailto:fabien.lahoudere@coll=
abora.co.uk">fabien.lahoudere@collabora.<wbr>co.uk</a>&gt;<br>
---<br>
=C2=A0meta/recipes-gnome/gtk+/gtk+3.<wbr>inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 -<br>
=C2=A0...-sysroot-path-so-that-make-<wbr>finds-our-wayl.patch | 34 --------=
--------------<br>
=C2=A0...void-finding-build-host-s-<wbr>wayland-scanner.patch | 31 --------=
------------<br>
=C2=A0meta/recipes-graphics/libsdl2/<a href=3D"http://libsdl2_2.0.5.bb" rel=
=3D"noreferrer" target=3D"_blank"><wbr>libsdl2_2.0.5.bb</a>=C2=A0 =C2=A0 =
=C2=A0|=C2=A0 4 +--<br>
=C2=A0.../<wbr>usesysrootprefixforpkgdatadirv<wbr>ariable.patch=C2=A0 =C2=
=A0 | 27 +++++++++++++++++<br>
=C2=A0.../wayland/<a href=3D"http://wayland-protocols_1.10.bb" rel=3D"noref=
errer" target=3D"_blank">wayland-protocols_<wbr>1.10.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A0.../wayland/wayland/<wbr>fixpathinpcfiles.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 33 +++++++++++++++++++++<br>
=C2=A0meta/recipes-graphics/wayland/<a href=3D"http://wayland_1.14.0.bb" re=
l=3D"noreferrer" target=3D"_blank"><wbr>wayland_1.14.0.bb</a>=C2=A0 =C2=A0 =
|=C2=A0 1 +<br>
=C2=A0meta/recipes-graphics/wayland/<a href=3D"http://weston_2.0.0.bb" rel=
=3D"noreferrer" target=3D"_blank"><wbr>weston_2.0.0.bb</a>=C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 1 -<br>
=C2=A0.../recipes-graphics/xorg-<wbr>xserver/xserver-xorg.inc |=C2=A0 1 -<b=
r>
=C2=A0.../gstreamer/<a href=3D"http://gstreamer1.0-plugins-bad_1.12.2.bb" r=
el=3D"noreferrer" target=3D"_blank">gstreamer1.0-<wbr>plugins-bad_1.12.2.bb=
</a>=C2=A0 =C2=A0|=C2=A0 1 -<br>
=C2=A011 files changed, 63 insertions(+), 72 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-graphics/libsdl2/<wbr>libsdl2/0001-pr=
epend-our-<wbr>sysroot-path-so-that-make-<wbr>finds-our-wayl.patch<br>
=C2=A0delete mode 100644 meta/recipes-graphics/libsdl2/<wbr>libsdl2/0002-Av=
oid-finding-<wbr>build-host-s-wayland-scanner.<wbr>patch<br>
=C2=A0create mode 100644 meta/recipes-graphics/wayland/<wbr>wayland-protoco=
ls/<wbr>usesysrootprefixforpkgdatadirv<wbr>ariable.patch<br>
=C2=A0create mode 100644 meta/recipes-graphics/wayland/<wbr>wayland/fixpath=
inpcfiles.patch<br>
<br>
diff --git a/meta/recipes-gnome/gtk+/gtk+<wbr>3.inc b/meta/recipes-gnome/gt=
k+/gtk+<wbr>3.inc<br>
index 0a357db..420ead2 100644<br>
--- a/meta/recipes-gnome/gtk+/gtk+<wbr>3.inc<br>
+++ b/meta/recipes-gnome/gtk+/gtk+<wbr>3.inc<br>
@@ -35,7 +35,6 @@ EXTRA_OECONF +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --enable-mod=
ules \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --disable-cu=
ps \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --disable-co=
lord \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0WAYLAND_PROT=
OCOLS_SYSROOT_DIR=3D<wbr>${RECIPE_SYSROOT} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.utils.=
contains(&quot;DISTRO_<wbr>FEATURES&quot;, &quot;x11&quot;, &quot;&quot;, &=
quot;--disable-gtk-doc&quot;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
diff --git a/meta/recipes-graphics/<wbr>libsdl2/libsdl2/0001-prepend-<wbr>o=
ur-sysroot-path-so-that-make-<wbr>finds-our-wayl.patch b/meta/recipes-graph=
ics/<wbr>libsdl2/libsdl2/0001-prepend-<wbr>our-sysroot-path-so-that-make-<w=
br>finds-our-wayl.patch<br>
deleted file mode 100644<br>
index efc8418..0000000<br>
--- a/meta/recipes-graphics/<wbr>libsdl2/libsdl2/0001-prepend-<wbr>our-sysr=
oot-path-so-that-make-<wbr>finds-our-wayl.patch<br>
+++ /dev/null<br>
@@ -1,34 +0,0 @@<br>
-From b44808e43130dcd13b43e5b978b9b2<wbr>4aeb4c134c Mon Sep 17 00:00:00 200=
1<br>
-From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3D<wbr>BCller?=3D &lt;<a href=3D"mail=
to:schnitzeltony@googlemail.com">schnitzeltony@googlemail.com</a>&gt;<br>
-Date: Thu, 20 Oct 2016 14:57:51 +0200<br>
-Subject: [PATCH] prepend our sysroot path so that make finds our<br>
- wayland-protocol files<br>
-MIME-Version: 1.0<br>
-Content-Type: text/plain; charset=3DUTF-8<br>
-Content-Transfer-Encoding: 8bit<br>
-<br>
-Upstream-Status: Inappropriate [embedded specific]<br>
-<br>
-Signed-off-by: Andreas M=C3=BCller &lt;<a href=3D"mailto:schnitzeltony@goo=
glemail.com">schnitzeltony@googlemail.com</a>&gt;<br>
----<br>
- <a href=3D"http://configure.in" rel=3D"noreferrer" target=3D"_blank">conf=
igure.in</a> | 4 +-<br>
- 1 file changed, 2 insertions(+), 2 deletions(-)<br>
-<br>
-diff --git a/<a href=3D"http://configure.in" rel=3D"noreferrer" target=3D"=
_blank">configure.in</a> b/<a href=3D"http://configure.in" rel=3D"noreferre=
r" target=3D"_blank">configure.in</a><br>
-index 726ded3..3376600 100644<br>
---- a/<a href=3D"http://configure.in" rel=3D"noreferrer" target=3D"_blank"=
>configure.in</a><br>
-+++ b/<a href=3D"http://configure.in" rel=3D"noreferrer" target=3D"_blank"=
>configure.in</a><br>
-@@ -1206,7 +1206,7 @@ AC_HELP_STRING([--enable-<wbr>video-wayland-qt-touch=
], [QtWayland server support for<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0WAYLAND_CFLA=
GS=3D`$PKG_CONFIG --cflags wayland-client wayland-egl wayland-cursor xkbcom=
mon`<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0WAYLAND_LIBS=
=3D`$PKG_CONFIG --libs wayland-client wayland-egl wayland-cursor xkbcommon`=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0WAYLAND_SCAN=
NER=3D`$PKG_CONFIG --variable=3Dwayland_scanner wayland-scanner`<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 WAYLAND_CORE_PROT=
OCOL_DIR=3D`$<wbr>PKG_CONFIG --variable=3Dpkgdatadir wayland-client`<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 WAYLAND_PROTOCOLS=
_DIR=3D`$PKG_<wbr>CONFIG --variable=3Dpkgdatadir wayland-protocols`<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 WAYLAND_CORE_PROT=
OCOL_DIR=3D${<wbr>WAYLAND_PROTOCOLS_SYSROOT_DIR}<wbr>`$PKG_CONFIG --variabl=
e=3Dpkgdatadir wayland-client`<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 WAYLAND_PROTOCOLS=
_DIR=3D${<wbr>WAYLAND_PROTOCOLS_SYSROOT_DIR}<wbr>`$PKG_CONFIG --variable=3D=
pkgdatadir wayland-protocols`<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0video_waylan=
d=3Dyes<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
---<br>
-2.5.5<br>
-<br>
diff --git a/meta/recipes-graphics/<wbr>libsdl2/libsdl2/0002-Avoid-<wbr>fin=
ding-build-host-s-wayland-<wbr>scanner.patch b/meta/recipes-graphics/<wbr>l=
ibsdl2/libsdl2/0002-Avoid-<wbr>finding-build-host-s-wayland-<wbr>scanner.pa=
tch<br>
deleted file mode 100644<br>
index 7837315..0000000<br>
--- a/meta/recipes-graphics/<wbr>libsdl2/libsdl2/0002-Avoid-<wbr>finding-bu=
ild-host-s-wayland-<wbr>scanner.patch<br>
+++ /dev/null<br>
@@ -1,31 +0,0 @@<br>
-From ae879091cf65cb70293b375ec7e61e<wbr>d12a96d8a7 Mon Sep 17 00:00:00 200=
1<br>
-From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3D<wbr>BCller?=3D &lt;<a href=3D"mail=
to:schnitzeltony@googlemail.com">schnitzeltony@googlemail.com</a>&gt;<br>
-Date: Fri, 2 Dec 2016 09:39:25 +0100<br>
-Subject: [PATCH] Avoid finding build host&#39;s wayland-scanner<br>
-MIME-Version: 1.0<br>
-Content-Type: text/plain; charset=3DUTF-8<br>
-Content-Transfer-Encoding: 8bit<br>
-<br>
-Upstream-Status: Inappropriate [embedded specific]<br>
-<br>
-Signed-off-by: Andreas M=C3=BCller &lt;<a href=3D"mailto:schnitzeltony@goo=
glemail.com">schnitzeltony@googlemail.com</a>&gt;<br>
----<br>
- <a href=3D"http://configure.in" rel=3D"noreferrer" target=3D"_blank">conf=
igure.in</a> | 2 +-<br>
- 1 file changed, 1 insertion(+), 1 deletion(-)<br>
-<br>
-diff --git a/<a href=3D"http://configure.in" rel=3D"noreferrer" target=3D"=
_blank">configure.in</a> b/<a href=3D"http://configure.in" rel=3D"noreferre=
r" target=3D"_blank">configure.in</a><br>
-index 3376600..2aa6ed4 100644<br>
---- a/<a href=3D"http://configure.in" rel=3D"noreferrer" target=3D"_blank"=
>configure.in</a><br>
-+++ b/<a href=3D"http://configure.in" rel=3D"noreferrer" target=3D"_blank"=
>configure.in</a><br>
-@@ -1204,7 +1204,7 @@ AC_HELP_STRING([--enable-<wbr>video-wayland-qt-touch=
], [QtWayland server support for<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if $PKG_CONFIG --exists wa=
yland-client wayland-scanner wayland-protocols wayland-egl wayland-cursor e=
gl xkbcommon ; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0WAYLAND_CFLA=
GS=3D`$PKG_CONFIG --cflags wayland-client wayland-egl wayland-cursor xkbcom=
mon`<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0WAYLAND_LIBS=
=3D`$PKG_CONFIG --libs wayland-client wayland-egl wayland-cursor xkbcommon`=
<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 WAYLAND_SCANNER=
=3D`$PKG_CONFIG --variable=3Dwayland_scanner wayland-scanner`<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_PATH_PROG([WAY=
LAND_SCANNER]<wbr>, [wayland-scanner])<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0WAYLAND_CORE=
_PROTOCOL_DIR=3D${<wbr>WAYLAND_PROTOCOLS_SYSROOT_DIR}<wbr>`$PKG_CONFIG --va=
riable=3Dpkgdatadir wayland-client`<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0WAYLAND_PROT=
OCOLS_DIR=3D${<wbr>WAYLAND_PROTOCOLS_SYSROOT_DIR}<wbr>`$PKG_CONFIG --variab=
le=3Dpkgdatadir wayland-protocols`<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0video_waylan=
d=3Dyes<br>
---<br>
-2.7.4<br>
-<br>
diff --git a/meta/recipes-graphics/<wbr>libsdl2/<a href=3D"http://libsdl2_2=
.0.5.bb" rel=3D"noreferrer" target=3D"_blank">libsdl2_2.0.5.bb</a> b/meta/r=
ecipes-graphics/<wbr>libsdl2/<a href=3D"http://libsdl2_2.0.5.bb" rel=3D"nor=
eferrer" target=3D"_blank">libsdl2_2.0.5.bb</a><br>
index 12d3aaf..032f45b 100644<br>
--- a/meta/recipes-graphics/<wbr>libsdl2/<a href=3D"http://libsdl2_2.0.5.bb=
" rel=3D"noreferrer" target=3D"_blank">libsdl2_2.0.5.bb</a><br>
+++ b/meta/recipes-graphics/<wbr>libsdl2/<a href=3D"http://libsdl2_2.0.5.bb=
" rel=3D"noreferrer" target=3D"_blank">libsdl2_2.0.5.bb</a><br>
@@ -17,8 +17,6 @@ DEPENDS_class-nativesdk =3D &quot;${@bb.utils.contains(&#=
39;DISTRO_<wbr>FEATURES&#39;, &#39;x11&#39;, &#39;virtu<br>
=C2=A0SRC_URI =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0<a href=3D"http://www.libsdl.org/release/SDL2-${PV}.tar=
.gz" rel=3D"noreferrer" target=3D"_blank">http://www.libsdl.org/release/<wb=
r>SDL2-${PV}.tar.gz</a> \<br>
=C2=A0 =C2=A0 =C2=A0file://linkage.patch \<br>
-=C2=A0 =C2=A0 file://0001-prepend-our-<wbr>sysroot-path-so-that-make-<wbr>=
finds-our-wayl.patch \<br>
-=C2=A0 =C2=A0 file://0002-Avoid-finding-<wbr>build-host-s-wayland-scanner.=
<wbr>patch \<br>
=C2=A0 =C2=A0 =C2=A0file://fix-build-failure-on-<wbr>ppc.patch \<br>
=C2=A0&quot;<br>
<br>
@@ -35,7 +33,7 @@ EXTRA_OECONF =3D &quot;--disable-oss --disable-esd --disa=
ble-arts \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--enable-pthr=
eads \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--enable-sdl-=
dlopen \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-rpa=
th \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 WAYLAND_PROTOCOLS_=
SYSROOT_DIR=3D<wbr>${RECIPE_SYSROOT}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0# opengl packageconfig factored out to make it easy for distros<br>
=C2=A0# and BSP layers to pick either (desktop) opengl, gles2, or no GL<br>
diff --git a/meta/recipes-graphics/<wbr>wayland/wayland-protocols/<wbr>uses=
ysrootprefixforpkgdatadirv<wbr>ariable.patch b/meta/recipes-graphics/<wbr>w=
ayland/wayland-protocols/<wbr>usesysrootprefixforpkgdatadirv<wbr>ariable.pa=
tch<br>
new file mode 100644<br>
index 0000000..0922a4d<br>
--- /dev/null<br>
+++ b/meta/recipes-graphics/<wbr>wayland/wayland-protocols/<wbr>usesysrootp=
refixforpkgdatadirv<wbr>ariable.patch<br>
@@ -0,0 +1,27 @@<br>
+From 875130ee3cbcf62266901ef4b91b9a<wbr>0fb6adad43 Mon Sep 17 00:00:00 200=
1<br>
+From: Tomek Bury &lt;<a href=3D"mailto:tomek.bury@broadcom.com">tomek.bury=
@broadcom.com</a>&gt;<br>
+Date: Fri, 4 Aug 2017 16:16:38 +0100<br>
+Subject: Use sysroot prefix for pkgdatadir variable<br>
+<br>
+The pc_sysroot is automatically added to cflags and libs but not<br>
+to &#39;pkg-config --variable&#39;<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://cgit.freedesktop.org/wayland=
/wayland-protocols/commit/?id=3D875130ee3cbcf62266901ef4b91b9a0fb6adad43" r=
el=3D"noreferrer" target=3D"_blank">https://cgit.freedesktop.org/<wbr>wayla=
nd/wayland-protocols/<wbr>commit/?id=3D<wbr>875130ee3cbcf62266901ef4b91b9a<=
wbr>0fb6adad43</a>]<br>
+<br>
+Reviewed-by: Daniel Stone &lt;<a href=3D"mailto:daniels@collabora.com">dan=
iels@collabora.com</a>&gt;<br>
+<br>
+diff --git a/<a href=3D"http://wayland-protocols.pc.in" rel=3D"noreferrer"=
 target=3D"_blank">wayland-protocols.pc.in</a> b/<a href=3D"http://wayland-=
protocols.pc.in" rel=3D"noreferrer" target=3D"_blank">wayland-protocols.pc.=
in</a><br>
+index a26744c..379be06 100644<br>
+--- a/<a href=3D"http://wayland-protocols.pc.in" rel=3D"noreferrer" target=
=3D"_blank">wayland-protocols.pc.in</a><br>
++++ b/<a href=3D"http://wayland-protocols.pc.in" rel=3D"noreferrer" target=
=3D"_blank">wayland-protocols.pc.in</a><br>
+@@ -1,6 +1,6 @@<br>
+ prefix=3D@prefix@<br>
+ datarootdir=3D@datarootdir@<br>
+-pkgdatadir=3D@datadir@/@<wbr>PACKAGE@<br>
++pkgdatadir=3D${pc_sysrootdir}@<wbr>datadir@/@PACKAGE@<br>
+<br>
+ Name: Wayland Protocols<br>
+ Description: Wayland protocol files<br>
+--<br>
+cgit v0.10.2<br>
+<br>
diff --git a/meta/recipes-graphics/<wbr>wayland/<a href=3D"http://wayland-p=
rotocols_1.10.bb" rel=3D"noreferrer" target=3D"_blank">wayland-protocols_1.=
<wbr>10.bb</a> b/meta/recipes-graphics/<wbr>wayland/<a href=3D"http://wayla=
nd-protocols_1.10.bb" rel=3D"noreferrer" target=3D"_blank">wayland-protocol=
s_1.<wbr>10.bb</a><br>
index 4f9e9f3..1ff12c6 100644<br>
--- a/meta/recipes-graphics/<wbr>wayland/<a href=3D"http://wayland-protocol=
s_1.10.bb" rel=3D"noreferrer" target=3D"_blank">wayland-protocols_1.<wbr>10=
.bb</a><br>
+++ b/meta/recipes-graphics/<wbr>wayland/<a href=3D"http://wayland-protocol=
s_1.10.bb" rel=3D"noreferrer" target=3D"_blank">wayland-protocols_1.<wbr>10=
.bb</a><br>
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<wbr>c7b1=
2b6702da38ca028ace54aae3d4<wbr>84 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://stable/presentation-<wbr>time/presentation-time.xml;<wbr>endline=
=3D26;md5=3D<wbr>4646cd7d9edc9fa55db941f2d3a7dc<wbr>53&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"https://wayland.freedesktop.org/releases=
/${BPN}-${PV}.tar.xz" rel=3D"noreferrer" target=3D"_blank">https://wayland.=
freedesktop.<wbr>org/releases/${BPN}-${PV}.tar.<wbr>xz</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://<wbr>usesysrootprefixforpkgdatad=
irv<wbr>ariable.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0SRC_URI[md5sum] =3D &quot;<wbr>84a7846c2b6a6a3e265fc9be36453e<wbr>60&=
quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;<wbr>5719c51d7354864983171c5083e93a<wbr>=
72ac99229e2b460c4bb10513de0883<wbr>9c0a&quot;<br>
diff --git a/meta/recipes-graphics/<wbr>wayland/wayland/<wbr>fixpathinpcfil=
es.patch b/meta/recipes-graphics/<wbr>wayland/wayland/<wbr>fixpathinpcfiles=
.patch<br>
new file mode 100644<br>
index 0000000..9fb1252<br>
--- /dev/null<br>
+++ b/meta/recipes-graphics/<wbr>wayland/wayland/<wbr>fixpathinpcfiles.patc=
h<br>
@@ -0,0 +1,33 @@<br>
+Fix wayland-client and wayland-scanner pc files<br>
+<br>
+Upstream-Status: Pending<br>
+<br>
+Signed-off-by: Fabien Lahoudere &lt;<a href=3D"mailto:fabien.lahoudere@col=
labora.co.uk">fabien.lahoudere@collabora.<wbr>co.uk</a>&gt;<br>
+<br>
+Index: wayland-1.14.0/src/<a href=3D"http://wayland-client.pc.in" rel=3D"n=
oreferrer" target=3D"_blank">wayland-<wbr>client.pc.in</a><br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- wayland-1.14.0.orig/src/<a href=3D"http://wayland-client.pc.in" rel=3D=
"noreferrer" target=3D"_blank">waylan<wbr>d-client.pc.in</a><br>
++++ wayland-1.14.0/src/<a href=3D"http://wayland-client.pc.in" rel=3D"nore=
ferrer" target=3D"_blank">wayland-<wbr>client.pc.in</a><br>
+@@ -1,7 +1,7 @@<br>
+ prefix=3D@prefix@<br>
+ exec_prefix=3D@exec_prefix@<br>
+ datarootdir=3D@datarootdir@<br>
+-pkgdatadir=3D@datadir@/@<wbr>PACKAGE@<br>
++pkgdatadir=3D${pc_sysrootdir}@<wbr>datadir@/@PACKAGE@<br>
+ libdir=3D@libdir@<br>
+ includedir=3D@includedir@<br>
+<br>
+Index: wayland-1.14.0/src/<a href=3D"http://wayland-scanner.pc.in" rel=3D"=
noreferrer" target=3D"_blank">wayland-<wbr>scanner.pc.in</a><br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- wayland-1.14.0.orig/src/<a href=3D"http://wayland-scanner.pc.in" rel=
=3D"noreferrer" target=3D"_blank">waylan<wbr>d-scanner.pc.in</a><br>
++++ wayland-1.14.0/src/<a href=3D"http://wayland-scanner.pc.in" rel=3D"nor=
eferrer" target=3D"_blank">wayland-<wbr>scanner.pc.in</a><br>
+@@ -1,8 +1,8 @@<br>
+ prefix=3D@prefix@<br>
+ exec_prefix=3D@exec_prefix@<br>
+ datarootdir=3D@datarootdir@<br>
+ pkgdatadir=3D@datadir@/@PACKAGE@<br>
+-wayland_scanner=3D@bindir@/<wbr>wayland-scanner<br>
++wayland_scanner=3Dwayland-<wbr>scanner<br>
+<br>
+ Name: Wayland Scanner<br>
+ Description: Wayland scanner<br>
diff --git a/meta/recipes-graphics/<wbr>wayland/<a href=3D"http://wayland_1=
.14.0.bb" rel=3D"noreferrer" target=3D"_blank">wayland_1.14.0.bb</a> b/meta=
/recipes-graphics/<wbr>wayland/<a href=3D"http://wayland_1.14.0.bb" rel=3D"=
noreferrer" target=3D"_blank">wayland_1.14.0.bb</a><br>
index 2a2489d..1a9ff98 100644<br>
--- a/meta/recipes-graphics/<wbr>wayland/<a href=3D"http://wayland_1.14.0.b=
b" rel=3D"noreferrer" target=3D"_blank">wayland_1.14.0.bb</a><br>
+++ b/meta/recipes-graphics/<wbr>wayland/<a href=3D"http://wayland_1.14.0.b=
b" rel=3D"noreferrer" target=3D"_blank">wayland_1.14.0.bb</a><br>
@@ -13,6 +13,7 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<wbr>b31d=
8f53b6aaf2b4985d7dd7810a70<wbr>d1 \<br>
=C2=A0DEPENDS =3D &quot;expat libxml2 libffi wayland-native&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"https://wayland.freedesktop.org/releases=
/${BPN}-${PV}.tar.xz" rel=3D"noreferrer" target=3D"_blank">https://wayland.=
freedesktop.<wbr>org/releases/${BPN}-${PV}.tar.<wbr>xz</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://fixpathinpcfiles.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0SRC_URI[md5sum] =3D &quot;<wbr>0235f6075c32c3be61cff94fa0b9f1<wbr>08&=
quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;<wbr>ed80cabc0961a759a42092e2c39aab<wbr>=
fc1ec9a13c86c98bbe2b812f008da2<wbr>7ab8&quot;<br>
diff --git a/meta/recipes-graphics/<wbr>wayland/<a href=3D"http://weston_2.=
0.0.bb" rel=3D"noreferrer" target=3D"_blank">weston_2.0.0.bb</a> b/meta/rec=
ipes-graphics/<wbr>wayland/<a href=3D"http://weston_2.0.0.bb" rel=3D"norefe=
rrer" target=3D"_blank">weston_2.0.0.bb</a><br>
index 54b07bd..8160f55 100644<br>
--- a/meta/recipes-graphics/<wbr>wayland/<a href=3D"http://weston_2.0.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">weston_2.0.0.bb</a><br>
+++ b/meta/recipes-graphics/<wbr>wayland/<a href=3D"http://weston_2.0.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">weston_2.0.0.bb</a><br>
@@ -25,7 +25,6 @@ DEPENDS +=3D &quot;wayland wayland-protocols libinput vir=
tual/egl pango wayland-native&quot;<br>
<br>
=C2=A0EXTRA_OECONF =3D &quot;--enable-setuid-install \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-rdp=
-compositor \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 WAYLAND_PROTOCOLS_=
SYSROOT_DIR=3D<wbr>${RECIPE_SYSROOT} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
=C2=A0EXTRA_OECONF_append_qemux86 =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 WESTON_NATIVE_BACKE=
ND=3Dfbdev-<wbr>backend.so \<br>
diff --git a/meta/recipes-graphics/xorg-<wbr>xserver/xserver-xorg.inc b/met=
a/recipes-graphics/xorg-<wbr>xserver/xserver-xorg.inc<br>
index 863d80c..e8025de 100644<br>
--- a/meta/recipes-graphics/xorg-<wbr>xserver/xserver-xorg.inc<br>
+++ b/meta/recipes-graphics/xorg-<wbr>xserver/xserver-xorg.inc<br>
@@ -117,7 +117,6 @@ EXTRA_OECONF +=3D &quot;--with-fop=3Dno \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --sysconfdir=
=3D/etc/X11 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --localstate=
dir=3D/var \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --with-xkb-o=
utput=3D/var/lib/xkb \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0WAYLAND_PROT=
OCOLS_SYSROOT_DIR=3D<wbr>${RECIPE_SYSROOT} \<br>
=C2=A0&quot;<br>
<br>
=C2=A0OPENGL_PKGCONFIGS =3D &quot;dri glx glamor dri3 xshmfence&quot;<br>
diff --git a/meta/recipes-multimedia/<wbr>gstreamer/<a href=3D"http://gstre=
amer1.0-plugins-bad_1.12.2.bb" rel=3D"noreferrer" target=3D"_blank">gstream=
er1.0-<wbr>plugins-bad_1.12.2.bb</a> b/meta/recipes-multimedia/<wbr>gstream=
er/<a href=3D"http://gstreamer1.0-plugins-bad_1.12.2.bb" rel=3D"noreferrer"=
 target=3D"_blank">gstreamer1.0-<wbr>plugins-bad_1.12.2.bb</a><br>
index 8321da0..a83a5ba 100644<br>
--- a/meta/recipes-multimedia/<wbr>gstreamer/<a href=3D"http://gstreamer1.0=
-plugins-bad_1.12.2.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-<=
wbr>plugins-bad_1.12.2.bb</a><br>
+++ b/meta/recipes-multimedia/<wbr>gstreamer/<a href=3D"http://gstreamer1.0=
-plugins-bad_1.12.2.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-<=
wbr>plugins-bad_1.12.2.bb</a><br>
@@ -22,5 +22,4 @@ SRC_URI[sha256sum] =3D &quot;<wbr>9c2c7edde4f59d74eb414e0=
701c551<wbr>31f562e5c605a3ce9b091754f106<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/gst-plugins-bad-${<wbr>PV}&quot;<br>
<br>
-EXTRA_OECONF +=3D &quot;WAYLAND_PROTOCOLS_SYSROOT_<wbr>DIR=3D${RECIPE_SYSR=
OOT}&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
1.8.3.1<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--94eb2c07ea98f64c91055a518b13--
