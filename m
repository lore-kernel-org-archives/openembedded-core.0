Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
 by mx.groups.io with SMTP id smtpd.web11.8062.1625722704809388073
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jul 2021 22:38:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lAhrQwSd;
 spf=pass (domain: gmail.com, ip: 209.85.222.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f54.google.com with SMTP id q20so1775771uaa.3
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Jul 2021 22:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ldv9SL6/xJKy89jUoN6ZAyTsejlFOZPxcU4uAHyi1aM=;
        b=lAhrQwSd6uPnKwjiUHxW/Xq7PGKuwRxJXFdvfzgs8l5qXw+9+nfwfckdW5lATW7Z0V
         PcOBmOVvTu0CcMbVCJ6KB5XLGfVCz3aqOFdNcV/apX88reDT4TnjPQz5jx5D2NiOYZTk
         8CwKDjUBnYQXzogL8LND3kOw/i7/9Sf32g3B1QjmAdvuiLROFXaHJlOAYgkSItJro7vi
         0GXSN6zCB2k2T0izfRPNPKN7spaFUQ333P1ERQf/eLkwrC172rhXyL5/v5bL7DkevMqK
         LbxyVvWrgULHqZZqm71jRbsery014wTPzLMRWQH4Fc1AWisri/hMVyOgZpL7Th2AB7Gs
         PLCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ldv9SL6/xJKy89jUoN6ZAyTsejlFOZPxcU4uAHyi1aM=;
        b=h279mwzGn5nX/MUCgwhAnX8KJRb3YoTPrQNvbIcP3luF9QXbHvYisl2f1jnoei/6LC
         LFu8eeIW21FFE98VeLo7P2iKYBy50Bmaf6XqwvpY3rVv43KhLbhwSEs695OOt5XWbYPF
         i73605LWH3bJhsyEBdk1UYHYvJj36HZZQfqgXF6FBEsI70VjLlA+tH4NY97Q9sUYhRXF
         61aSWqN5wF2zC8garZIOg1h4nDBhsamcNZHyYG0cK67FohOHRX/eASPk4AKh3TaYTi5z
         bjHOTQJDAjHPBtrWAD1C+uxXpNbihenGHEFannGhUoiEA0KB5zuCiHnQszJ2FYTzGcQn
         fL0A==
X-Gm-Message-State: AOAM533/3ztTpxlNPQErteul/MwDptGAlNIToZXJt0Z4nBS/XtIMDTOr
	497NDOnxY/r/SfTC3ZPHUlp6SLJw4FrUFy1j7EU=
X-Google-Smtp-Source: ABdhPJw9BkAsmzb0eEyC1Kkz97KZkcAyUiegQBEop9VMVRLOkTrbcbd1AiqE1M+OHb+ALczmb5SxHXrE6DM24Dtpck4=
X-Received: by 2002:a9f:2d8c:: with SMTP id v12mr20402214uaj.22.1625722703903;
 Wed, 07 Jul 2021 22:38:23 -0700 (PDT)
MIME-Version: 1.0
References: <1625703461-5016-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1625703461-5016-1-git-send-email-wangmy@fujitsu.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 8 Jul 2021 07:38:12 +0200
Message-ID: <CANNYZj8t4RajB_8-eB8SLb7TO_i9unmaZpqDrrsjC-Mdupbu_Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] xserver-xorg: upgrade 1.20.11 -> 21.0.99.1
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000044ff5705c696109e"

--00000000000044ff5705c696109e
Content-Type: text/plain; charset="UTF-8"

This is a development snapshot, should not be used.

Alex

On Thu 8. Jul 2021 at 2.18, wangmy <wangmy@fujitsu.com> wrote:

> 0001-test-xtest-Initialize-array-with-braces.patch
> pkgconfig.patch
> sdksyms-no-build-path.patch
> removed since they're included in 21.0.99.1
>
> refresh 0001-Avoid-duplicate-definitions-of-IOPortBase.patch
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../xorg-xserver/xserver-xorg.inc             |  3 +-
>  ...-duplicate-definitions-of-IOPortBase.patch | 16 +-----
>  ...t-xtest-Initialize-array-with-braces.patch | 36 -------------
>  .../xorg-xserver/xserver-xorg/pkgconfig.patch | 34 -------------
>  .../xserver-xorg/sdksyms-no-build-path.patch  | 50 -------------------
>  ...g_1.20.11.bb => xserver-xorg_21.0.99.1.bb} |  6 +--
>  6 files changed, 4 insertions(+), 141 deletions(-)
>  delete mode 100644
> meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-test-xtest-Initialize-array-with-braces.patch
>  delete mode 100644
> meta/recipes-graphics/xorg-xserver/xserver-xorg/pkgconfig.patch
>  delete mode 100644
> meta/recipes-graphics/xorg-xserver/xserver-xorg/sdksyms-no-build-path.patch
>  rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.20.11.bb =>
> xserver-xorg_21.0.99.1.bb} (77%)
>
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> index da025171db..7bbff0073b 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> @@ -65,6 +65,7 @@ PACKAGES =+ "${PN}-sdl \
>               ${PN}-module-xaa \
>               ${PN}-module-libxf1bpp \
>               ${PN}-module-libxf4bpp \
> +            ${PN}-input-modules \
>               xf86-video-modesetting"
>
>  SUMMARY_xf86-video-modesetting = "X.Org X server -- modesetting display
> driver"
> @@ -101,6 +102,7 @@ FILES_${PN}-module-exa =
> "${libdir}/xorg/modules/libexa.so"
>  FILES_${PN}-module-xaa = "${libdir}/xorg/modules/libxaa.so"
>  FILES_${PN}-module-libxf1bpp = "${libdir}/xorg/modules/libxf1bpp.so"
>  FILES_${PN}-module-libxf4bpp = "${libdir}/xorg/modules/libxf4bpp.so"
> +FILES_${PN}-input-modules = "${libdir}/xorg/modules/input/*drv*"
>  FILES_xf86-video-modesetting =
> "${libdir}/xorg/modules/drivers/modesetting_drv.so"
>
>  EXTRA_OECONF += "--with-fop=no \
> @@ -116,7 +118,6 @@ EXTRA_OECONF += "--with-fop=no \
>                   --sysconfdir=/etc/X11 \
>                   --localstatedir=/var \
>                   --with-xkb-output=/var/lib/xkb \
> -                 --with-os-name=Linux \
>  "
>
>  OPENGL_PKGCONFIGS = "dri glx glamor dri3 xshmfence"
> diff --git
> a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Avoid-duplicate-definitions-of-IOPortBase.patch
> b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Avoid-duplicate-definitions-of-IOPortBase.patch
> index 4737040675..d876958898 100644
> ---
> a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Avoid-duplicate-definitions-of-IOPortBase.patch
> +++
> b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Avoid-duplicate-definitions-of-IOPortBase.patch
> @@ -11,23 +11,9 @@ compiler.h:528: multiple definition of `IOPortBase';
>  Upstream-Status: Pending
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  ---
> - hw/xfree86/common/compiler.h            | 2 +-
>   hw/xfree86/os-support/linux/lnx_video.c | 1 +
> - 2 files changed, 2 insertions(+), 1 deletion(-)
> + 1 files changed, 1 insertions(+), 0 deletion(-)
>
> -diff --git a/hw/xfree86/common/compiler.h b/hw/xfree86/common/compiler.h
> -index 2b2008b..c7d617e 100644
> ---- a/hw/xfree86/common/compiler.h
> -+++ b/hw/xfree86/common/compiler.h
> -@@ -525,7 +525,7 @@ xf86WriteMmio32Le(__volatile__ void *base, const
> unsigned long offset,
> - #define PORT_SIZE short
> - #endif
> -
> --_X_EXPORT unsigned int IOPortBase;      /* Memory mapped I/O port area */
> -+extern _X_EXPORT unsigned int IOPortBase;      /* Memory mapped I/O port
> area */
> -
> - static __inline__ void
> - outb(unsigned PORT_SIZE port, unsigned char val)
>  diff --git a/hw/xfree86/os-support/linux/lnx_video.c
> b/hw/xfree86/os-support/linux/lnx_video.c
>  index 04e4509..9dc7316 100644
>  --- a/hw/xfree86/os-support/linux/lnx_video.c
> diff --git
> a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-test-xtest-Initialize-array-with-braces.patch
> b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-test-xtest-Initialize-array-with-braces.patch
> deleted file mode 100644
> index c0c242814b..0000000000
> ---
> a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-test-xtest-Initialize-array-with-braces.patch
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -From 8a382c015cd3c69fcfc146ef03dcbf30c77ff207 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 1 Mar 2019 09:47:57 -0800
> -Subject: [PATCH] test/xtest: Initialize array with braces
> -
> -Fixes an error when extra warnings are enabled, this is caught with clang
> -
> -test/xtest.c:64:23: error: suggest braces around initialization of
> subobject [-Werror,-Wmissing-braces]
> -    WindowRec root = {0};
> -                      ^
> -                      {}
> -1 error generated.
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - test/xtest.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/test/xtest.c b/test/xtest.c
> -index fc5e433..d7e6620 100644
> ---- a/test/xtest.c
> -+++ b/test/xtest.c
> -@@ -61,7 +61,7 @@ xtest_init_devices(void)
> - {
> -     ScreenRec screen = {0};
> -     ClientRec server_client = {0};
> --    WindowRec root = {0};
> -+    WindowRec root = {{0}};
> -     WindowOptRec optional = {0};
> -
> -     /* random stuff that needs initialization */
> ---
> -2.21.0
> -
> diff --git
> a/meta/recipes-graphics/xorg-xserver/xserver-xorg/pkgconfig.patch
> b/meta/recipes-graphics/xorg-xserver/xserver-xorg/pkgconfig.patch
> deleted file mode 100644
> index 2ef9fa9fe4..0000000000
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/pkgconfig.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -Upstream-Status: Submitted [
> https://gitlab.freedesktop.org/xorg/xserver/merge_requests/22]
> -Signed-off-by: Ross Burton <ross.burton@intel.com>
> -
> -From 5f65a6246fe752764045dd1e38912f1dccec71e4 Mon Sep 17 00:00:00 2001
> -From: Ross Burton <ross.burton@intel.com>
> -Date: Thu, 20 Sep 2018 20:12:24 +0100
> -Subject: [PATCH] xorg-server.m4: just all cflags instead of just sdkdir
> -
> -Instead of fetching just the sdkdir variable of xorg-server using
> pkg-config,
> -simply get all of the CFLAGS.  Aside from completeness, this helps builds
> in
> -sysroots as pkg-config knows what to do with --cflags but doesn't remap
> -arbitrary variables.
> -
> -Signed-off-by: Ross Burton <ross.burton@intel.com>
> ----
> - xorg-server.m4 | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/xorg-server.m4 b/xorg-server.m4
> -index 18255b91a..195bda5d8 100644
> ---- a/xorg-server.m4
> -+++ b/xorg-server.m4
> -@@ -31,7 +31,7 @@ dnl
> - AC_DEFUN([XORG_DRIVER_CHECK_EXT],[
> -       AC_REQUIRE([PKG_PROG_PKG_CONFIG])
> -       SAVE_CFLAGS="$CFLAGS"
> --      CFLAGS="$CFLAGS -I`$PKG_CONFIG --variable=sdkdir xorg-server`"
> -+      CFLAGS="$CFLAGS `$PKG_CONFIG --cflags xorg-server`"
> -       AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
> - #include "xorg-server.h"
> - #if !defined $1
> ---
> -2.11.0
> -
> diff --git
> a/meta/recipes-graphics/xorg-xserver/xserver-xorg/sdksyms-no-build-path.patch
> b/meta/recipes-graphics/xorg-xserver/xserver-xorg/sdksyms-no-build-path.patch
> deleted file mode 100644
> index be198ece49..0000000000
> ---
> a/meta/recipes-graphics/xorg-xserver/xserver-xorg/sdksyms-no-build-path.patch
> +++ /dev/null
> @@ -1,50 +0,0 @@
> -Upstream-Status: Backport [
> https://gitlab.freedesktop.org/xorg/xserver/merge_requests/253]
> -Signed-off-by: Ross Burton <ross.burton@intel.com>
> -
> -From ca832598d38ba55a001088b57d73c6d7261dc9a7 Mon Sep 17 00:00:00 2001
> -From: Ross Burton <ross.burton@intel.com>
> -Date: Thu, 1 Aug 2019 15:24:51 +0100
> -Subject: [PATCH] sdksyms.sh: don't embed the build path
> -
> -This script generates a header that has a comment containing the build
> path for
> -no real reason.  As this source can end up deployed on targets in debug
> packages
> -this means there is both potentially sensitive information leakage about
> the
> -build environment, and a source of change for reproducible builds.
> ----
> - hw/xfree86/sdksyms.sh | 7 +++++--
> - 1 file changed, 5 insertions(+), 2 deletions(-)
> -
> -diff --git a/hw/xfree86/sdksyms.sh b/hw/xfree86/sdksyms.sh
> -index 39e33711d..bdf47a71a 100755
> ---- a/hw/xfree86/sdksyms.sh
> -+++ b/hw/xfree86/sdksyms.sh
> -@@ -302,13 +302,16 @@ LC_ALL=C
> - export LC_ALL
> - ${CPP:-cpp} "$@" sdksyms.c > /dev/null || exit $?
> - ${CPP:-cpp} "$@" sdksyms.c | ${AWK:-awk} -v topdir=$topdir '
> -+function basename(file) {
> -+    sub(".*/", "", file)
> -+    return file
> -+}
> - BEGIN {
> -     sdk = 0;
> -     print("/*");
> -     print(" * These symbols are referenced to ensure they");
> -     print(" * will be available in the X Server binary.");
> -     print(" */");
> --    printf("/* topdir=%s */\n", topdir);
> -     print("_X_HIDDEN void *xorg_symbols[] = {");
> -
> -     printf("sdksyms.c:") > "sdksyms.dep";
> -@@ -337,7 +340,7 @@ BEGIN {
> -       # remove quotes
> -       gsub(/"/, "", $3);
> -       line = $2;
> --      header = $3;
> -+      header = basename($3);
> -       if (! headers[$3]) {
> -           printf(" \\\n  %s", $3) >> "sdksyms.dep";
> -           headers[$3] = 1;
> ---
> -2.20.1
> -
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.11.bb
> b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.0.99.1.bb
> similarity index 77%
> rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.11.bb
> rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_21.0.99.1.bb
> index 1eb2056b8a..53b76af312 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.11.bb
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.0.99.1.bb
> @@ -1,14 +1,10 @@
>  require xserver-xorg.inc
>
>  SRC_URI +=
> "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch \
> -           file://pkgconfig.patch \
> -           file://0001-test-xtest-Initialize-array-with-braces.patch \
> -           file://sdksyms-no-build-path.patch \
>             file://0001-drmmode_display.c-add-missing-mi.h-include.patch \
>             file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
> -
>  file://0001-Fix-segfault-on-probing-a-non-PCI-platform-device-on.patch \
>             "
> -SRC_URI[sha256sum] =
> "914c796e3ffabe1af48071d40ccc85e92117c97a9082ed1df29e4d64e3c34c49"
> +SRC_URI[sha256sum] =
> "d928de01606958e20b668cba53c26818d595ba81805b4e19693bba795b71af20"
>
>  # These extensions are now integrated into the server, so declare the
> migration
>  # path for in-place upgrades.
> --
> 2.25.1
>
>
> 
>
>

--00000000000044ff5705c696109e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">This is a development snapshot, should not be used.</div>=
<div dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><br><div class=
=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu 8. Jul 2021 =
at 2.18, wangmy &lt;<a href=3D"mailto:wangmy@fujitsu.com">wangmy@fujitsu.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-le=
ft:1ex;border-left-color:rgb(204,204,204)">0001-test-xtest-Initialize-array=
-with-braces.patch<br>
pkgconfig.patch<br>
sdksyms-no-build-path.patch<br>
removed since they&#39;re included in 21.0.99.1<br>
<br>
refresh 0001-Avoid-duplicate-definitions-of-IOPortBase.patch<br>
<br>
Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" targe=
t=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../xorg-xserver/xserver-xorg.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0|=C2=A0 3 +-<br>
=C2=A0...-duplicate-definitions-of-IOPortBase.patch | 16 +-----<br>
=C2=A0...t-xtest-Initialize-array-with-braces.patch | 36 -------------<br>
=C2=A0.../xorg-xserver/xserver-xorg/pkgconfig.patch | 34 -------------<br>
=C2=A0.../xserver-xorg/sdksyms-no-build-path.patch=C2=A0 | 50 ------------=
-------<br>
=C2=A0...<a href=3D"http://g_1.20.11.bb" rel=3D"noreferrer" target=3D"_bla=
nk">g_1.20.11.bb</a> =3D&gt; <a href=3D"http://xserver-xorg_21.0.99.1.bb" r=
el=3D"noreferrer" target=3D"_blank">xserver-xorg_21.0.99.1.bb</a>} |=C2=A0 =
6 +--<br>
=C2=A06 files changed, 4 insertions(+), 141 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0=
001-test-xtest-Initialize-array-with-braces.patch<br>
=C2=A0delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/p=
kgconfig.patch<br>
=C2=A0delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/s=
dksyms-no-build-path.patch<br>
=C2=A0rename meta/recipes-graphics/xorg-xserver/{<a href=3D"http://xserver=
-xorg_1.20.11.bb" rel=3D"noreferrer" target=3D"_blank">xserver-xorg_1.20.11=
.bb</a> =3D&gt; <a href=3D"http://xserver-xorg_21.0.99.1.bb" rel=3D"norefer=
rer" target=3D"_blank">xserver-xorg_21.0.99.1.bb</a>} (77%)<br>
<br>
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/re=
cipes-graphics/xorg-xserver/xserver-xorg.inc<br>
index da025171db..7bbff0073b 100644<br>
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc<br>
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc<br>
@@ -65,6 +65,7 @@ PACKAGES =3D+ &quot;${PN}-sdl \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PN}-module-xaa \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PN}-module-libxf1bpp \<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PN}-module-libxf4bpp \<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PN}-input-modules \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xf86-video-modesetting&qu=
ot;<br>
<br>
=C2=A0SUMMARY_xf86-video-modesetting =3D &quot;X.Org X server -- modesetti=
ng display driver&quot;<br>
@@ -101,6 +102,7 @@ FILES_${PN}-module-exa =3D &quot;${libdir}/xorg/module=
s/libexa.so&quot;<br>
=C2=A0FILES_${PN}-module-xaa =3D &quot;${libdir}/xorg/modules/libxaa.so&qu=
ot;<br>
=C2=A0FILES_${PN}-module-libxf1bpp =3D &quot;${libdir}/xorg/modules/libxf1=
bpp.so&quot;<br>
=C2=A0FILES_${PN}-module-libxf4bpp =3D &quot;${libdir}/xorg/modules/libxf4=
bpp.so&quot;<br>
+FILES_${PN}-input-modules =3D &quot;${libdir}/xorg/modules/input/*drv*&qu=
ot;<br>
=C2=A0FILES_xf86-video-modesetting =3D &quot;${libdir}/xorg/modules/driver=
s/modesetting_drv.so&quot;<br>
<br>
=C2=A0EXTRA_OECONF +=3D &quot;--with-fop=3Dno \<br>
@@ -116,7 +118,6 @@ EXTRA_OECONF +=3D &quot;--with-fop=3Dno \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --sysconfdi=
r=3D/etc/X11 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --localstat=
edir=3D/var \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --with-xkb-=
output=3D/var/lib/xkb \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--with-os-n=
ame=3DLinux \<br>
=C2=A0&quot;<br>
<br>
=C2=A0OPENGL_PKGCONFIGS =3D &quot;dri glx glamor dri3 xshmfence&quot;<br>
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Avoid-du=
plicate-definitions-of-IOPortBase.patch b/meta/recipes-graphics/xorg-xserve=
r/xserver-xorg/0001-Avoid-duplicate-definitions-of-IOPortBase.patch<br>
index 4737040675..d876958898 100644<br>
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Avoid-duplicate=
-definitions-of-IOPortBase.patch<br>
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Avoid-duplicate=
-definitions-of-IOPortBase.patch<br>
@@ -11,23 +11,9 @@ compiler.h:528: multiple definition of `IOPortBase&#39;=
;<br>
=C2=A0Upstream-Status: Pending<br>
=C2=A0Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" ta=
rget=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0---<br>
- hw/xfree86/common/compiler.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =
2 +-<br>
=C2=A0 hw/xfree86/os-support/linux/lnx_video.c | 1 +<br>
- 2 files changed, 2 insertions(+), 1 deletion(-)<br>
+ 1 files changed, 1 insertions(+), 0 deletion(-)<br>
<br>
-diff --git a/hw/xfree86/common/compiler.h b/hw/xfree86/common/compiler.h<=
br>
-index 2b2008b..c7d617e 100644<br>
---- a/hw/xfree86/common/compiler.h<br>
-+++ b/hw/xfree86/common/compiler.h<br>
-@@ -525,7 +525,7 @@ xf86WriteMmio32Le(__volatile__ void *base, const unsi=
gned long offset,<br>
- #define PORT_SIZE short<br>
- #endif<br>
- <br>
--_X_EXPORT unsigned int IOPortBase;=C2=A0 =C2=A0 =C2=A0 /* Memory mapped =
I/O port area */<br>
-+extern _X_EXPORT unsigned int IOPortBase;=C2=A0 =C2=A0 =C2=A0 /* Memory =
mapped I/O port area */<br>
- <br>
- static __inline__ void<br>
- outb(unsigned PORT_SIZE port, unsigned char val)<br>
=C2=A0diff --git a/hw/xfree86/os-support/linux/lnx_video.c b/hw/xfree86/os=
-support/linux/lnx_video.c<br>
=C2=A0index 04e4509..9dc7316 100644<br>
=C2=A0--- a/hw/xfree86/os-support/linux/lnx_video.c<br>
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-test-xte=
st-Initialize-array-with-braces.patch b/meta/recipes-graphics/xorg-xserver/=
xserver-xorg/0001-test-xtest-Initialize-array-with-braces.patch<br>
deleted file mode 100644<br>
index c0c242814b..0000000000<br>
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-test-xtest-Init=
ialize-array-with-braces.patch<br>
+++ /dev/null<br>
@@ -1,36 +0,0 @@<br>
-From 8a382c015cd3c69fcfc146ef03dcbf30c77ff207 Mon Sep 17 00:00:00 2001<br=
>
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank=
">raj.khem@gmail.com</a>&gt;<br>
-Date: Fri, 1 Mar 2019 09:47:57 -0800<br>
-Subject: [PATCH] test/xtest: Initialize array with braces<br>
-<br>
-Fixes an error when extra warnings are enabled, this is caught with clang=
<br>
-<br>
-test/xtest.c:64:23: error: suggest braces around initialization of subobj=
ect [-Werror,-Wmissing-braces]<br>
-=C2=A0 =C2=A0 WindowRec root =3D {0};<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 ^<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 {}<br>
-1 error generated.<br>
-<br>
-Upstream-Status: Pending<br>
-<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
----<br>
- test/xtest.c | 2 +-<br>
- 1 file changed, 1 insertion(+), 1 deletion(-)<br>
-<br>
-diff --git a/test/xtest.c b/test/xtest.c<br>
-index fc5e433..d7e6620 100644<br>
---- a/test/xtest.c<br>
-+++ b/test/xtest.c<br>
-@@ -61,7 +61,7 @@ xtest_init_devices(void)<br>
- {<br>
-=C2=A0 =C2=A0 =C2=A0ScreenRec screen =3D {0};<br>
-=C2=A0 =C2=A0 =C2=A0ClientRec server_client =3D {0};<br>
--=C2=A0 =C2=A0 WindowRec root =3D {0};<br>
-+=C2=A0 =C2=A0 WindowRec root =3D {{0}};<br>
-=C2=A0 =C2=A0 =C2=A0WindowOptRec optional =3D {0};<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0/* random stuff that needs initialization */<br>
--- <br>
-2.21.0<br>
-<br>
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/pkgconfig.pat=
ch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/pkgconfig.patch<br>
deleted file mode 100644<br>
index 2ef9fa9fe4..0000000000<br>
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/pkgconfig.patch<br>
+++ /dev/null<br>
@@ -1,34 +0,0 @@<br>
-Upstream-Status: Submitted [<a href=3D"https://gitlab.freedesktop.org/xor=
g/xserver/merge_requests/22" rel=3D"noreferrer" target=3D"_blank">https://g=
itlab.freedesktop.org/xorg/xserver/merge_requests/22</a>]<br>
-Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com" t=
arget=3D"_blank">ross.burton@intel.com</a>&gt;<br>
-<br>
-From 5f65a6246fe752764045dd1e38912f1dccec71e4 Mon Sep 17 00:00:00 2001<br=
>
-From: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"=
_blank">ross.burton@intel.com</a>&gt;<br>
-Date: Thu, 20 Sep 2018 20:12:24 +0100<br>
-Subject: [PATCH] xorg-server.m4: just all cflags instead of just sdkdir<b=
r>
-<br>
-Instead of fetching just the sdkdir variable of xorg-server using pkg-con=
fig,<br>
-simply get all of the CFLAGS.=C2=A0 Aside from completeness, this helps b=
uilds in<br>
-sysroots as pkg-config knows what to do with --cflags but doesn&#39;t rem=
ap<br>
-arbitrary variables.<br>
-<br>
-Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com" t=
arget=3D"_blank">ross.burton@intel.com</a>&gt;<br>
----<br>
- xorg-server.m4 | 2 +-<br>
- 1 file changed, 1 insertion(+), 1 deletion(-)<br>
-<br>
-diff --git a/xorg-server.m4 b/xorg-server.m4<br>
-index 18255b91a..195bda5d8 100644<br>
---- a/xorg-server.m4<br>
-+++ b/xorg-server.m4<br>
-@@ -31,7 +31,7 @@ dnl<br>
- AC_DEFUN([XORG_DRIVER_CHECK_EXT],[<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0AC_REQUIRE([PKG_PROG_PKG_CONFIG])<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0SAVE_CFLAGS=3D&quot;$CFLAGS&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 CFLAGS=3D&quot;$CFLAGS -I`$PKG_CONFIG --variable=3D=
sdkdir xorg-server`&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 CFLAGS=3D&quot;$CFLAGS `$PKG_CONFIG --cflags xorg-s=
erver`&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[<br>
- #include &quot;xorg-server.h&quot;<br>
- #if !defined $1<br>
--- <br>
-2.11.0<br>
-<br>
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/sdksyms-no-bu=
ild-path.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/sdksyms-no=
-build-path.patch<br>
deleted file mode 100644<br>
index be198ece49..0000000000<br>
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/sdksyms-no-build-pat=
h.patch<br>
+++ /dev/null<br>
@@ -1,50 +0,0 @@<br>
-Upstream-Status: Backport [<a href=3D"https://gitlab.freedesktop.org/xorg=
/xserver/merge_requests/253" rel=3D"noreferrer" target=3D"_blank">https://g=
itlab.freedesktop.org/xorg/xserver/merge_requests/253</a>]<br>
-Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com" t=
arget=3D"_blank">ross.burton@intel.com</a>&gt;<br>
-<br>
-From ca832598d38ba55a001088b57d73c6d7261dc9a7 Mon Sep 17 00:00:00 2001<br=
>
-From: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"=
_blank">ross.burton@intel.com</a>&gt;<br>
-Date: Thu, 1 Aug 2019 15:24:51 +0100<br>
-Subject: [PATCH] sdksyms.sh: don&#39;t embed the build path<br>
-<br>
-This script generates a header that has a comment containing the build pa=
th for<br>
-no real reason.=C2=A0 As this source can end up deployed on targets in de=
bug packages<br>
-this means there is both potentially sensitive information leakage about =
the<br>
-build environment, and a source of change for reproducible builds.<br>
----<br>
- hw/xfree86/sdksyms.sh | 7 +++++--<br>
- 1 file changed, 5 insertions(+), 2 deletions(-)<br>
-<br>
-diff --git a/hw/xfree86/sdksyms.sh b/hw/xfree86/sdksyms.sh<br>
-index 39e33711d..bdf47a71a 100755<br>
---- a/hw/xfree86/sdksyms.sh<br>
-+++ b/hw/xfree86/sdksyms.sh<br>
-@@ -302,13 +302,16 @@ LC_ALL=3DC<br>
- export LC_ALL<br>
- ${CPP:-cpp} &quot;$@&quot; sdksyms.c &gt; /dev/null || exit $?<br>
- ${CPP:-cpp} &quot;$@&quot; sdksyms.c | ${AWK:-awk} -v topdir=3D$topdir &=
#39;<br>
-+function basename(file) {<br>
-+=C2=A0 =C2=A0 sub(&quot;.*/&quot;, &quot;&quot;, file)<br>
-+=C2=A0 =C2=A0 return file<br>
-+}<br>
- BEGIN {<br>
-=C2=A0 =C2=A0 =C2=A0sdk =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0print(&quot;/*&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0print(&quot; * These symbols are referenced to ensure=
 they&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0print(&quot; * will be available in the X Server bina=
ry.&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0print(&quot; */&quot;);<br>
--=C2=A0 =C2=A0 printf(&quot;/* topdir=3D%s */\n&quot;, topdir);<br>
-=C2=A0 =C2=A0 =C2=A0print(&quot;_X_HIDDEN void *xorg_symbols[] =3D {&quot=
;);<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0printf(&quot;sdksyms.c:&quot;) &gt; &quot;sdksyms.dep=
&quot;;<br>
-@@ -337,7 +340,7 @@ BEGIN {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# remove quotes<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gsub(/&quot;/, &quot;&quot;, $3);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0line =3D $2;<br>
--=C2=A0 =C2=A0 =C2=A0 header =3D $3;<br>
-+=C2=A0 =C2=A0 =C2=A0 header =3D basename($3);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (! headers[$3]) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printf(&quot; \\\n=C2=A0 %s&quot=
;, $3) &gt;&gt; &quot;sdksyms.dep&quot;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0headers[$3] =3D 1;<br>
--- <br>
-2.20.1<br>
-<br>
diff --git a/meta/recipes-graphics/xorg-xserver/<a href=3D"http://xserver-=
xorg_1.20.11.bb" rel=3D"noreferrer" target=3D"_blank">xserver-xorg_1.20.11.=
bb</a> b/meta/recipes-graphics/xorg-xserver/<a href=3D"http://xserver-xorg_=
21.0.99.1.bb" rel=3D"noreferrer" target=3D"_blank">xserver-xorg_21.0.99.1.b=
b</a><br>
similarity index 77%<br>
rename from meta/recipes-graphics/xorg-xserver/<a href=3D"http://xserver-x=
org_1.20.11.bb" rel=3D"noreferrer" target=3D"_blank">xserver-xorg_1.20.11.b=
b</a><br>
rename to meta/recipes-graphics/xorg-xserver/<a href=3D"http://xserver-xor=
g_21.0.99.1.bb" rel=3D"noreferrer" target=3D"_blank">xserver-xorg_21.0.99.1=
.bb</a><br>
index 1eb2056b8a..53b76af312 100644<br>
--- a/meta/recipes-graphics/xorg-xserver/<a href=3D"http://xserver-xorg_1.=
20.11.bb" rel=3D"noreferrer" target=3D"_blank">xserver-xorg_1.20.11.bb</a><=
br>
+++ b/meta/recipes-graphics/xorg-xserver/<a href=3D"http://xserver-xorg_21=
.0.99.1.bb" rel=3D"noreferrer" target=3D"_blank">xserver-xorg_21.0.99.1.bb<=
/a><br>
@@ -1,14 +1,10 @@<br>
=C2=A0require xserver-xorg.inc<br>
<br>
=C2=A0SRC_URI +=3D &quot;file://0001-xf86pciBus.c-use-Intel-ddx-only-for-p=
re-gen4-hardwar.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://pkgconfig.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-test-xtest-Initializ=
e-array-with-braces.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://sdksyms-no-build-path.pat=
ch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-drmmode_display.c-ad=
d-missing-mi.h-include.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Avoid-duplicate-defi=
nitions-of-IOPortBase.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Fix-segfault-on-prob=
ing-a-non-PCI-platform-device-on.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-SRC_URI[sha256sum] =3D &quot;914c796e3ffabe1af48071d40ccc85e92117c97a9082=
ed1df29e4d64e3c34c49&quot;<br>
+SRC_URI[sha256sum] =3D &quot;d928de01606958e20b668cba53c26818d595ba81805b=
4e19693bba795b71af20&quot;<br>
<br>
=C2=A0# These extensions are now integrated into the server, so declare th=
e migration<br>
=C2=A0# path for in-place upgrades.<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>

--00000000000044ff5705c696109e--
