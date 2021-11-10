Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2DBFC433F5
	for <webhook@archiver.kernel.org>; Wed, 10 Nov 2021 22:16:04 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web12.2374.1636582564096738451
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 14:16:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=omYHjDIs;
 spf=pass (domain: gmail.com, ip: 209.85.160.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f170.google.com with SMTP id f20so3288744qtb.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 14:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=iZLNs+0qcN9+2+g/8b9aEKCgVV3O5VtVtUFnNN5BVRk=;
        b=omYHjDIsF2p8HFPA0LqcvJisndzpZ/lweC04egNahdtZdzJw/jrJiyjUFElXP+cki7
         J+wc7uARCokAPhhCuPNFuXbsrMdDs+lFityog6/8vnSZHhb0sSCBf9zc6Mwgd/Z2cVyM
         ejMVPSO+uOpT8PrjpcbSZ+Dj+SyShoRLDfUze8p3l7dQbeJT5Q3nyYSnPOGNCDT2EutQ
         qbscsKXVBa+q6GUV55DFw4vFptYloIpBD3sFoOXOGmR3lOHDlMrwF0xZ+c5XWv9KlIpn
         6NL10qPxocy0rpVyrXX7fi+QlE2UOPcMYzQ/PBuJ9ccBopIs+LAIboUHu/bPdw/tAUML
         Kzfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=iZLNs+0qcN9+2+g/8b9aEKCgVV3O5VtVtUFnNN5BVRk=;
        b=VkQ6CwCsLAj5WzZSy8IYNJDtGbzVDLO1ruYfdwa5U4CpJiC6iMot4V5WhShlEoMKUu
         d6QsdHbg8Z4DI6rePXDftGrUrADdj4rxmj9YC0BdRwyjGzRbZlWZbusYx0DjVLlEPWos
         d9++KBu9qDkSQ1SrINUWRzFvqD9ANStj1llRQ24f71GXCf68UDzMPd9UJtthwBwa7Mvt
         7Xi6eBRvcNssd8+X4gr97e6HTsZiqUgBfq6TpBrY78o1d4aiQy84ncIqYJh9TQ962zBM
         1r/fBXetPoo6pQBvfpuirw2wW52zaIdizhh42d+IfIvHo+SG3JrPjSUB/KreNh2EXGU2
         TLUg==
X-Gm-Message-State: AOAM533VOurcKbajWdb4H611UIvzJ/PCe7gDq6mFY7RszzdT7A/07ePp
	sDvH/wwRtGb/O9/GqC6qxG6Ye+cx4c7diQyglRU=
X-Google-Smtp-Source: 
 ABdhPJxp8+R5Z+C0p0gP9zTG20g+zpuQyVxeV5RrnuowJSBrE4w4yJI+j/J8hIToX71zSfuUtHxneIKDSc7zAgOHGMs=
X-Received: by 2002:ac8:45d2:: with SMTP id e18mr2770806qto.112.1636582563065;
 Wed, 10 Nov 2021 14:16:03 -0800 (PST)
MIME-Version: 1.0
References: <20211110193937.2606747-1-alex@linutronix.de>
 <20211110193937.2606747-4-alex@linutronix.de>
In-Reply-To: <20211110193937.2606747-4-alex@linutronix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 10 Nov 2021 14:15:37 -0800
Message-ID: 
 <CAMKF1soOYzBrECYF_-WTNTYxQBw2VPwo6GxaVKUbP=nwCr4JoQ@mail.gmail.com>
Subject: Re: [PATCH 04/24] xserver-xorg: update 1.20.13 -> 21.1.1
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>, Eric Anholt <eric@anholt.net>,
	=?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linaro.org>,
	Ross Burton <ross.burton@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Nov 2021 22:16:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158115

lgtm

On Wed, Nov 10, 2021 at 11:39 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> libxcvt is a new dependency (thanks Oleksandr!).
>
> Include ${libdir}/xorg/modules/input/*.so into the main
> package (if for someone separate packaging matters, please
> investigate what they do).
>
> Remove options no longer present upstream.
>
> Remove patches available upstream; drop a chunk as well.
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  .../xorg-xserver/xserver-xorg.inc             |  7 +--
>  ...-duplicate-definitions-of-IOPortBase.patch | 24 ++-------
>  ...probing-a-non-PCI-platform-device-on.patch | 34 -------------
>  ...t-xtest-Initialize-array-with-braces.patch | 36 -------------
>  .../xorg-xserver/xserver-xorg/pkgconfig.patch | 34 -------------
>  .../xserver-xorg/sdksyms-no-build-path.patch  | 50 -------------------
>  ...xorg_1.20.13.bb =3D> xserver-xorg_21.1.1.bb} |  6 +--
>  7 files changed, 7 insertions(+), 184 deletions(-)
>  delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-=
Fix-segfault-on-probing-a-non-PCI-platform-device-on.patch
>  delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-=
test-xtest-Initialize-array-with-braces.patch
>  delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/pkgco=
nfig.patch
>  delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/sdksy=
ms-no-build-path.patch
>  rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.20.13.bb =3D> =
xserver-xorg_21.1.1.bb} (77%)
>
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/r=
ecipes-graphics/xorg-xserver/xserver-xorg.inc
> index e1fc0a06dc..6a5f274046 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> @@ -28,7 +28,7 @@ inherit autotools pkgconfig
>  inherit features_check
>  REQUIRED_DISTRO_FEATURES =3D "x11"
>
> -LIB_DEPS =3D "pixman libxfont2 xtrans libxau libxext libxdmcp libdrm lib=
xkbfile libpciaccess"
> +LIB_DEPS =3D "pixman libxfont2 xtrans libxau libxext libxdmcp libdrm lib=
xkbfile libpciaccess libxcvt"
>  DEPENDS =3D "xorgproto ${LIB_DEPS} font-util"
>
>  # Split out some modules and extensions from the main package
> @@ -78,7 +78,7 @@ RRECOMMENDS:${PN}-xwayland +=3D "${XSERVER_RRECOMMENDS}=
"
>  RDEPENDS:${PN}-xvfb +=3D "xkeyboard-config"
>  RDEPENDS:${PN}-module-exa =3D "${PN} (=3D ${EXTENDPKGV})"
>
> -FILES:${PN} =3D "${bindir} ${libdir}/X11/Options ${libdir}/X11/Cards ${l=
ibdir}/X11/getconfig ${libdir}/X11/etc ${libdir}/modules/*.so ${libdir}/xor=
g/modules/*.so /etc/X11 ${libdir}/xorg/protocol.txt ${datadir}/X11/xorg.con=
f.d"
> +FILES:${PN} =3D "${bindir} ${libdir}/X11/Options ${libdir}/X11/Cards ${l=
ibdir}/X11/getconfig ${libdir}/X11/etc ${libdir}/modules/*.so ${libdir}/xor=
g/modules/input/*.so ${libdir}/xorg/modules/*.so /etc/X11 ${libdir}/xorg/pr=
otocol.txt ${datadir}/X11/xorg.conf.d"
>  FILES:${PN}-dev +=3D "${libdir}/xorg/modules/*.la ${libdir}/xorg/modules=
/*/*.la"
>  FILES:${PN}-doc +=3D "${libdir}/X11/doc ${datadir}/X11/xkb/compiled/READ=
ME.compiled ${localstatedir}/lib/xkb/README.compiled"
>  FILES:${PN}-sdl =3D "${bindir}/Xsdl"
> @@ -109,7 +109,6 @@ EXTRA_OECONF +=3D "--with-fop=3Dno \
>                   --with-pic \
>                   --disable-static \
>                   --disable-record \
> -                 --disable-dmx \
>                   --disable-xnest \
>                   --enable-xvfb \
>                   --enable-composite \
> @@ -118,7 +117,6 @@ EXTRA_OECONF +=3D "--with-fop=3Dno \
>                   --sysconfdir=3D/etc/X11 \
>                   --localstatedir=3D/var \
>                   --with-xkb-output=3D/var/lib/xkb \
> -                 --with-os-name=3DLinux \
>  "
>
>  OPENGL_PKGCONFIGS =3D "dri glx glamor dri3 xshmfence"
> @@ -141,7 +139,6 @@ PACKAGECONFIG[xmlto] =3D "--with-xmlto, --without-xml=
to, xmlto-native docbook-xml-
>  PACKAGECONFIG[systemd-logind] =3D "--enable-systemd-logind=3Dyes,--enabl=
e-systemd-logind=3Dno,dbus,"
>  PACKAGECONFIG[systemd] =3D "--with-systemd-daemon,--without-systemd-daem=
on,systemd"
>  PACKAGECONFIG[xinerama] =3D "--enable-xinerama,--disable-xinerama"
> -PACKAGECONFIG[xwayland] =3D "--enable-xwayland,--disable-xwayland,waylan=
d wayland-native wayland-protocols libepoxy"
>
>  # Xorg requires a SHA1 implementation, pick one
>  XORG_CRYPTO ??=3D "openssl"
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Avoid-d=
uplicate-definitions-of-IOPortBase.patch b/meta/recipes-graphics/xorg-xserv=
er/xserver-xorg/0001-Avoid-duplicate-definitions-of-IOPortBase.patch
> index 4737040675..11d5546537 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Avoid-duplicat=
e-definitions-of-IOPortBase.patch
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Avoid-duplicat=
e-definitions-of-IOPortBase.patch
> @@ -1,4 +1,4 @@
> -From fc04acfd948ac99d04a5dc08c78f3b13bc0c5c41 Mon Sep 17 00:00:00 2001
> +From ce3b8a230a3805c9b557c1f106795675bd034860 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Mon, 17 Aug 2020 10:50:51 -0700
>  Subject: [PATCH] Avoid duplicate definitions of IOPortBase
> @@ -10,26 +10,13 @@ compiler.h:528: multiple definition of `IOPortBase';
>
>  Upstream-Status: Pending
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
>  ---
> - hw/xfree86/common/compiler.h            | 2 +-
>   hw/xfree86/os-support/linux/lnx_video.c | 1 +
> - 2 files changed, 2 insertions(+), 1 deletion(-)
> + 1 file changed, 1 insertion(+)
>
> -diff --git a/hw/xfree86/common/compiler.h b/hw/xfree86/common/compiler.h
> -index 2b2008b..c7d617e 100644
> ---- a/hw/xfree86/common/compiler.h
> -+++ b/hw/xfree86/common/compiler.h
> -@@ -525,7 +525,7 @@ xf86WriteMmio32Le(__volatile__ void *base, const uns=
igned long offset,
> - #define PORT_SIZE short
> - #endif
> -
> --_X_EXPORT unsigned int IOPortBase;      /* Memory mapped I/O port area =
*/
> -+extern _X_EXPORT unsigned int IOPortBase;      /* Memory mapped I/O por=
t area */
> -
> - static __inline__ void
> - outb(unsigned PORT_SIZE port, unsigned char val)
>  diff --git a/hw/xfree86/os-support/linux/lnx_video.c b/hw/xfree86/os-sup=
port/linux/lnx_video.c
> -index 04e4509..9dc7316 100644
> +index fd83022..1d0d96e 100644
>  --- a/hw/xfree86/os-support/linux/lnx_video.c
>  +++ b/hw/xfree86/os-support/linux/lnx_video.c
>  @@ -78,6 +78,7 @@ xf86OSInitVidMem(VidMemInfoPtr pVidMem)
> @@ -40,6 +27,3 @@ index 04e4509..9dc7316 100644
>
>   #if defined(__powerpc__)
>   volatile unsigned char *ioBase =3D NULL;
> ---
> -2.28.0
> -
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Fix-seg=
fault-on-probing-a-non-PCI-platform-device-on.patch b/meta/recipes-graphics=
/xorg-xserver/xserver-xorg/0001-Fix-segfault-on-probing-a-non-PCI-platform-=
device-on.patch
> deleted file mode 100644
> index 8b687d612d..0000000000
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Fix-segfault-o=
n-probing-a-non-PCI-platform-device-on.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -From e50c85f4ebf559a3bac4817b41074c43d4691779 Mon Sep 17 00:00:00 2001
> -From: Eric Anholt <eric@anholt.net>
> -Date: Fri, 26 Oct 2018 17:47:30 -0700
> -Subject: [PATCH] Fix segfault on probing a non-PCI platform device on a =
system
> - with PCI.
> -
> -Some Broadcom set-top-box boards have PCI busses, but the GPU is still
> -probed through DT.  We would dereference a null busid here in that
> -case.
> -
> -Signed-off-by: Eric Anholt <eric@anholt.net>
> -
> -Upstream-Status: Backport [https://github.com/freedesktop/xorg-xserver/c=
ommit/e50c85f4e]
> -Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linaro.org>
> ----
> - hw/xfree86/common/xf86platformBus.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/hw/xfree86/common/xf86platformBus.c b/hw/xfree86/common/xf8=
6platformBus.c
> -index cef47da03..dadbac6c8 100644
> ---- a/hw/xfree86/common/xf86platformBus.c
> -+++ b/hw/xfree86/common/xf86platformBus.c
> -@@ -289,7 +289,7 @@ xf86platformProbe(void)
> -     for (i =3D 0; i < xf86_num_platform_devices; i++) {
> -         char *busid =3D xf86_platform_odev_attributes(i)->busid;
> -
> --        if (pci && (strncmp(busid, "pci:", 4) =3D=3D 0)) {
> -+        if (pci && busid && (strncmp(busid, "pci:", 4) =3D=3D 0)) {
> -             platform_find_pci_info(&xf86_platform_devices[i], busid);
> -         }
> -
> ---
> -2.28.0
> -
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-test-xt=
est-Initialize-array-with-braces.patch b/meta/recipes-graphics/xorg-xserver=
/xserver-xorg/0001-test-xtest-Initialize-array-with-braces.patch
> deleted file mode 100644
> index c0c242814b..0000000000
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-test-xtest-Ini=
tialize-array-with-braces.patch
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -From 8a382c015cd3c69fcfc146ef03dcbf30c77ff207 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 1 Mar 2019 09:47:57 -0800
> -Subject: [PATCH] test/xtest: Initialize array with braces
> -
> -Fixes an error when extra warnings are enabled, this is caught with clan=
g
> -
> -test/xtest.c:64:23: error: suggest braces around initialization of subob=
ject [-Werror,-Wmissing-braces]
> -    WindowRec root =3D {0};
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
> -     ScreenRec screen =3D {0};
> -     ClientRec server_client =3D {0};
> --    WindowRec root =3D {0};
> -+    WindowRec root =3D {{0}};
> -     WindowOptRec optional =3D {0};
> -
> -     /* random stuff that needs initialization */
> ---
> -2.21.0
> -
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/pkgconfig.pa=
tch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/pkgconfig.patch
> deleted file mode 100644
> index 2ef9fa9fe4..0000000000
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/pkgconfig.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -Upstream-Status: Submitted [https://gitlab.freedesktop.org/xorg/xserver/=
merge_requests/22]
> -Signed-off-by: Ross Burton <ross.burton@intel.com>
> -
> -From 5f65a6246fe752764045dd1e38912f1dccec71e4 Mon Sep 17 00:00:00 2001
> -From: Ross Burton <ross.burton@intel.com>
> -Date: Thu, 20 Sep 2018 20:12:24 +0100
> -Subject: [PATCH] xorg-server.m4: just all cflags instead of just sdkdir
> -
> -Instead of fetching just the sdkdir variable of xorg-server using pkg-co=
nfig,
> -simply get all of the CFLAGS.  Aside from completeness, this helps build=
s in
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
> -       SAVE_CFLAGS=3D"$CFLAGS"
> --      CFLAGS=3D"$CFLAGS -I`$PKG_CONFIG --variable=3Dsdkdir xorg-server`=
"
> -+      CFLAGS=3D"$CFLAGS `$PKG_CONFIG --cflags xorg-server`"
> -       AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
> - #include "xorg-server.h"
> - #if !defined $1
> ---
> -2.11.0
> -
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/sdksyms-no-b=
uild-path.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/sdksyms-n=
o-build-path.patch
> deleted file mode 100644
> index be198ece49..0000000000
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/sdksyms-no-build-pa=
th.patch
> +++ /dev/null
> @@ -1,50 +0,0 @@
> -Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/m=
erge_requests/253]
> -Signed-off-by: Ross Burton <ross.burton@intel.com>
> -
> -From ca832598d38ba55a001088b57d73c6d7261dc9a7 Mon Sep 17 00:00:00 2001
> -From: Ross Burton <ross.burton@intel.com>
> -Date: Thu, 1 Aug 2019 15:24:51 +0100
> -Subject: [PATCH] sdksyms.sh: don't embed the build path
> -
> -This script generates a header that has a comment containing the build p=
ath for
> -no real reason.  As this source can end up deployed on targets in debug =
packages
> -this means there is both potentially sensitive information leakage about=
 the
> -build environment, and a source of change for reproducible builds.
> ----
> - hw/xfree86/sdksyms.sh | 7 +++++--
> - 1 file changed, 5 insertions(+), 2 deletions(-)
> -
> -diff --git a/hw/xfree86/sdksyms.sh b/hw/xfree86/sdksyms.sh
> -index 39e33711d..bdf47a71a 100755
> ---- a/hw/xfree86/sdksyms.sh
> -+++ b/hw/xfree86/sdksyms.sh
> -@@ -302,13 +302,16 @@ LC_ALL=3DC
> - export LC_ALL
> - ${CPP:-cpp} "$@" sdksyms.c > /dev/null || exit $?
> - ${CPP:-cpp} "$@" sdksyms.c | ${AWK:-awk} -v topdir=3D$topdir '
> -+function basename(file) {
> -+    sub(".*/", "", file)
> -+    return file
> -+}
> - BEGIN {
> -     sdk =3D 0;
> -     print("/*");
> -     print(" * These symbols are referenced to ensure they");
> -     print(" * will be available in the X Server binary.");
> -     print(" */");
> --    printf("/* topdir=3D%s */\n", topdir);
> -     print("_X_HIDDEN void *xorg_symbols[] =3D {");
> -
> -     printf("sdksyms.c:") > "sdksyms.dep";
> -@@ -337,7 +340,7 @@ BEGIN {
> -       # remove quotes
> -       gsub(/"/, "", $3);
> -       line =3D $2;
> --      header =3D $3;
> -+      header =3D basename($3);
> -       if (! headers[$3]) {
> -           printf(" \\\n  %s", $3) >> "sdksyms.dep";
> -           headers[$3] =3D 1;
> ---
> -2.20.1
> -
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.13.bb b=
/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.1.bb
> similarity index 77%
> rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.13.bb
> rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.1.bb
> index 01a54070c7..5793e078ee 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.13.bb
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.1.bb
> @@ -1,14 +1,10 @@
>  require xserver-xorg.inc
>
>  SRC_URI +=3D "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-h=
ardwar.patch \
> -           file://pkgconfig.patch \
> -           file://0001-test-xtest-Initialize-array-with-braces.patch \
> -           file://sdksyms-no-build-path.patch \
>             file://0001-drmmode_display.c-add-missing-mi.h-include.patch =
\
>             file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
> -           file://0001-Fix-segfault-on-probing-a-non-PCI-platform-device=
-on.patch \
>             "
> -SRC_URI[sha256sum] =3D "40aa4e96a56a81a301f15a9b10e06a22700f12b42d9e0e45=
3c7f11d354386300"
> +SRC_URI[sha256sum] =3D "782e7fef2ca0c7cbe60a937b8bf42dac69c904fb841950fd=
0363e1c2346ea755"
>
>  # These extensions are now integrated into the server, so declare the mi=
gration
>  # path for in-place upgrades.
> --
> 2.20.1
>

