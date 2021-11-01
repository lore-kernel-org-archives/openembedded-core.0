Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90AD0C433EF
	for <webhook@archiver.kernel.org>; Mon,  1 Nov 2021 18:58:29 +0000 (UTC)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com
 [209.85.222.54])
 by mx.groups.io with SMTP id smtpd.web08.699.1635793108947363772
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Nov 2021 11:58:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=R9fOx/wN;
 spf=pass (domain: gmail.com, ip: 209.85.222.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f54.google.com with SMTP id b3so9909515uam.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Nov 2021 11:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Jcw1sEU0kqdEYb6jFLzAlcg+l043SKc1olxtami7wQM=;
        b=R9fOx/wNBG6jtJ5fIjg73Qvgf653EeZkKx7VLxOen/8iEo0TmX0h92LVjr4VP6TZSp
         MaQIj0ZS8SWfBH+z6lWlLMuZ1OzhTuXXC65KxeUAUroEcZuLLI9JGysbLmOiShCqFi+m
         fgcoNqzO/eMJjeAqlDEzAJ1YwqypsHYjuZnPnr37R4rKx3JUnJ4t5KvmftP14IKEtj96
         BvIV426MgzcYtUoou7P+uSyoy+z9QDH1RWWYbrETIooQPDY8CHZntcZ2P7ckiSO2oVj4
         8s5j9bEZqFx6aWlkCxitS4EqPRV4LTbkrMgMSPy5vm2QKq1miMIcmnbC2YZes1PEVt+f
         vKig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Jcw1sEU0kqdEYb6jFLzAlcg+l043SKc1olxtami7wQM=;
        b=Z9Qg8rkfrIi6yFKBivBfdUirp5Ms1PqbHUF8UzlGulV6sULiNNMaazx9Koqahub8iX
         Bpo/VJuOh36ez8K5OQtimOgU/+Y1HR4FEQqsFcIcTS8RnneLqktIDm5BoNPYYMsqwefn
         /bDFypRXqJQZKkg8KOcHPZT2ufSBz56RKPcMg5uA3zg9rsjQ0owbzDYzs4RBr3S5y3W8
         bEltWz7GhaD/hersXUoskkYGS6AeahX2W25P0mmnDPdXn1fWQKusth0GgHYSvhfL1xUW
         /fYjQCaoN4OSuoBvlPWRCJP0uFP5hIVabulI0WdJj+2VBuCMznTRrdUYrLKMFYGyQ9O8
         18zA==
X-Gm-Message-State: AOAM532kVJ9gB08PTcNXE2RlKG1Fmmh/1bKC8j5Ih0jdthCHPQx7Kb/v
	qEXQR6VJmVhHHKinld7FU0iaAKg8rYPRcvRzGyU=
X-Google-Smtp-Source: 
 ABdhPJzGU4EocQRZ6nLn40F+v80HB6UJhxE9Ty57HpTOaW6c1Y5dd/L6mScDUC/W3+YqBG/KHeOpyWeT2JnMLdvLcGo=
X-Received: by 2002:a05:6102:358e:: with SMTP id
 h14mr31694018vsu.13.1635793107773;
 Mon, 01 Nov 2021 11:58:27 -0700 (PDT)
MIME-Version: 1.0
References: <20211028184356.3890493-1-open.source@oleksandr-kravchuk.com>
 <20211028184356.3890493-2-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20211028184356.3890493-2-open.source@oleksandr-kravchuk.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 1 Nov 2021 19:58:16 +0100
Message-ID: 
 <CANNYZj9qAo=6JOHJ=RDsj+-8e4_n1Daq3mU7DhpESWq=Yj4LqA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] WIP: xserver-xorg: update to 21.1.0
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000001d6ad105cfbec3e2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Nov 2021 18:58:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157728

--0000000000001d6ad105cfbec3e2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I have a recipe that builds and runs now:
http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Dakanavin/package=
-version-updates-later

There are significant issues with this new release:
- upstream forgot to include important files in the tarball; autotools
build works but meson build does not.
- the binary crashes everywhere except x86.

There should be a 21.1.1 coming soon, let's see if it does better. X is
still dying, this all seems like hobbyist work with no corporate backing.

Alex

On Thu, 28 Oct 2021 at 20:44, Oleksandr Kravchuk <
open.source@oleksandr-kravchuk.com> wrote:

> This dirty work-in-progress patch is an open call for anyone interested
> to help with its testing.
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  .../xorg-xserver/xserver-xorg.inc             | 62 ++++++++-----------
>  ...-duplicate-definitions-of-IOPortBase.patch | 45 --------------
>  ...probing-a-non-PCI-platform-device-on.patch | 34 ----------
>  ...t-xtest-Initialize-array-with-braces.patch | 36 -----------
>  .../xorg-xserver/xserver-xorg/pkgconfig.patch | 34 ----------
>  .../xserver-xorg/sdksyms-no-build-path.patch  | 50 ---------------
>  ...xorg_1.20.13.bb =3D> xserver-xorg_21.1.0.bb} | 11 +---
>  7 files changed, 29 insertions(+), 243 deletions(-)
>  delete mode 100644
> meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Avoid-duplicate-defi=
nitions-of-IOPortBase.patch
>  delete mode 100644
> meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Fix-segfault-on-prob=
ing-a-non-PCI-platform-device-on.patch
>  delete mode 100644
> meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-test-xtest-Initializ=
e-array-with-braces.patch
>  delete mode 100644
> meta/recipes-graphics/xorg-xserver/xserver-xorg/pkgconfig.patch
>  delete mode 100644
> meta/recipes-graphics/xorg-xserver/xserver-xorg/sdksyms-no-build-path.pat=
ch
>  rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.20.13.bb =3D>
> xserver-xorg_21.1.0.bb} (60%)
>
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> index e1fc0a06dc..3732601a4a 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> @@ -12,24 +12,23 @@ PROVIDES =3D "virtual/xserver-xf86"
>  # Other packages tend to just care that there is *an* X server:
>  PROVIDES +=3D "virtual/xserver"
>
> -PE =3D "2"
> -
>  XORG_PN =3D "xorg-server"
> -SRC_URI =3D "${XORG_MIRROR}/individual/xserver/${XORG_PN}-${PV}.tar.xz"
> +#SRC_URI =3D "${XORG_MIRROR}/individual/xserver/${XORG_PN}-${PV}.tar.xz"
> +SRC_URI =3D "
> https://gitlab.freedesktop.org/xorg/xserver/-/archive/master/xserver-mast=
er.tar.gz
> "
>
>  UPSTREAM_CHECK_REGEX =3D "xorg-server-(?P<pver>\d+(\.(?!99)\d+)+)\.tar"
>
>  CVE_PRODUCT =3D "xorg-server"
>
> -S =3D "${WORKDIR}/${XORG_PN}-${PV}"
> +#S =3D "${WORKDIR}/${XORG_PN}-${PV}"
> +S =3D "${WORKDIR}/xserver-master"
>
> -inherit autotools pkgconfig
> +inherit meson features_check pkgconfig
>
> -inherit features_check
>  REQUIRED_DISTRO_FEATURES =3D "x11"
>
>  LIB_DEPS =3D "pixman libxfont2 xtrans libxau libxext libxdmcp libdrm
> libxkbfile libpciaccess"
> -DEPENDS =3D "xorgproto ${LIB_DEPS} font-util"
> +DEPENDS =3D "xorgproto ${LIB_DEPS} font-util libxcvt libepoxy"
>
>  # Split out some modules and extensions from the main package
>  # These aren't needed for basic operations and only take up space:
> @@ -52,7 +51,7 @@ PACKAGES =3D+ "${PN}-sdl \
>               ${PN}-xephyr \
>               ${PN}-xwayland \
>               ${PN}-multimedia-modules \
> -             ${PN}-extension-dri \
> +             ${PN}-extension-dri1 \
>               ${PN}-extension-dri2 \
>               ${PN}-extension-glx \
>               ${PN}-extension-record \
> @@ -67,6 +66,7 @@ PACKAGES =3D+ "${PN}-sdl \
>               ${PN}-module-xaa \
>               ${PN}-module-libxf1bpp \
>               ${PN}-module-libxf4bpp \
> +             ${PN}-module-inputtest \
>               xf86-video-modesetting"
>
>  SUMMARY:xf86-video-modesetting =3D "X.Org X server -- modesetting displa=
y
> driver"
> @@ -88,7 +88,7 @@ FILES:${PN}-utils =3D "${bindir}/scanpci
> ${bindir}/pcitweak ${bindir}/ioport ${bin
>  FILES:${PN}-xephyr =3D "${bindir}/Xephyr"
>  FILES:${PN}-xwayland =3D "${bindir}/Xwayland"
>  FILES:${PN}-multimedia-modules =3D "${libdir}/xorg/modules/multimedia/*d=
rv*"
> -FILES:${PN}-extension-dri =3D "${libdir}/xorg/modules/extensions/libdri.=
so"
> +FILES:${PN}-extension-dri1 =3D "${libdir}/xorg/modules/extensions/libdri=
.so"
>  FILES:${PN}-extension-dri2 =3D
> "${libdir}/xorg/modules/extensions/libdri2.so"
>  FILES:${PN}-extension-glx =3D "${libdir}/xorg/modules/extensions/libglx.=
so"
>  FILES:${PN}-extension-record =3D
> "${libdir}/xorg/modules/extensions/librecord.so"
> @@ -103,6 +103,7 @@ FILES:${PN}-module-exa =3D
> "${libdir}/xorg/modules/libexa.so"
>  FILES:${PN}-module-xaa =3D "${libdir}/xorg/modules/libxaa.so"
>  FILES:${PN}-module-libxf1bpp =3D "${libdir}/xorg/modules/libxf1bpp.so"
>  FILES:${PN}-module-libxf4bpp =3D "${libdir}/xorg/modules/libxf4bpp.so"
> +FILES:${PN}-module-inputtest =3D
> "${libdir}/xorg/modules/input/inputtest_drv.so"
>  FILES:xf86-video-modesetting =3D
> "${libdir}/xorg/modules/drivers/modesetting_drv.so"
>
>  EXTRA_OECONF +=3D "--with-fop=3Dno \
> @@ -121,41 +122,30 @@ EXTRA_OECONF +=3D "--with-fop=3Dno \
>                   --with-os-name=3DLinux \
>  "
>
> -OPENGL_PKGCONFIGS =3D "dri glx glamor dri3 xshmfence"
> -PACKAGECONFIG ??=3D "dga dri2 udev ${XORG_CRYPTO} \
> +OPENGL_PKGCONFIGS =3D "dri1 glx glamor dri3"
> +PACKAGECONFIG ??=3D "dga dri2 udev ${SHA1} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl',
> '${OPENGL_PKGCONFIGS}', '', d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd',
> 'systemd systemd-logind', '', d)} \
>  "
>
> -PACKAGECONFIG[udev] =3D "--enable-config-udev,--disable-config-udev,udev=
"
> -PACKAGECONFIG[dga] =3D "--enable-dga,--disable-dga"
> -PACKAGECONFIG[dri] =3D "--enable-dri,--disable-dri,virtual/mesa"
> -PACKAGECONFIG[dri2] =3D "--enable-dri2,--disable-dri2"
> +PACKAGECONFIG[udev] =3D "-Dudev=3Dtrue,-Dudev=3Dfalse, udev"
> +PACKAGECONFIG[dga] =3D "-Ddga=3Dtrue,-Ddga=3Dfalse"
> +PACKAGECONFIG[dri1] =3D "-Ddri1=3Dtrue,-Ddri1=3Dfalse, virtual/mesa"
> +PACKAGECONFIG[dri2] =3D "-Ddri2=3Dtrue,-Ddri2=3Dfalse"
>  # DRI3 requires xshmfence to also be enabled
> -PACKAGECONFIG[dri3] =3D "--enable-dri3,--disable-dri3"
> -PACKAGECONFIG[glx] =3D "--enable-glx,--disable-glx,virtual/libgl
> virtual/libx11"
> -PACKAGECONFIG[glamor] =3D "--enable-glamor,--disable-glamor,libepoxy
> virtual/libgbm,libegl"
> -PACKAGECONFIG[unwind] =3D "--enable-libunwind,--disable-libunwind,libunw=
ind"
> -PACKAGECONFIG[xshmfence] =3D
> "--enable-xshmfence,--disable-xshmfence,libxshmfence"
> -PACKAGECONFIG[xmlto] =3D "--with-xmlto, --without-xmlto, xmlto-native
> docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
> -PACKAGECONFIG[systemd-logind] =3D
> "--enable-systemd-logind=3Dyes,--enable-systemd-logind=3Dno,dbus,"
> -PACKAGECONFIG[systemd] =3D
> "--with-systemd-daemon,--without-systemd-daemon,systemd"
> -PACKAGECONFIG[xinerama] =3D "--enable-xinerama,--disable-xinerama"
> -PACKAGECONFIG[xwayland] =3D "--enable-xwayland,--disable-xwayland,waylan=
d
> wayland-native wayland-protocols libepoxy"
> +PACKAGECONFIG[dri3] =3D "-Ddri3=3Dtrue,-Ddri3=3Dfalse"
> +PACKAGECONFIG[glx] =3D "-Dglx=3Dtrue,-Dglx=3Dfalse"
> +PACKAGECONFIG[glamor] =3D "-Dglamor=3Dtrue,-Dglamor=3Dfalse"
> +PACKAGECONFIG[libunwind] =3D "-Dlibunwind=3Dtrue,-Dlibunwind=3Dfalse,lib=
unwind"
> +PACKAGECONFIG[systemd-logind] =3D
> "-Dsystemdd_logind=3Dtrue,-Dsystemd_logind=3Dfalse, dbus,"
> +PACKAGECONFIG[xinerama] =3D "-Dxinerama=3Dtrue,-Dxinerama=3Dfalse"
> +PACKAGECONFIG[xwayland] =3D "-Dxwayland=3Dtrue,-Dxwayland=3Dfalse,waylan=
d
> wayland-native wayland-protocols libepoxy"
>
>  # Xorg requires a SHA1 implementation, pick one
> -XORG_CRYPTO ??=3D "openssl"
> -PACKAGECONFIG[openssl] =3D "--with-sha1=3Dlibcrypto,,openssl"
> -PACKAGECONFIG[nettle] =3D "--with-sha1=3Dlibnettle,,nettle"
> -PACKAGECONFIG[gcrypt] =3D "--with-sha1=3Dlibgcrypt,,libgcrypt"
> -
> -do_install:append () {
> -       # Its assumed base-files creates this for us
> -       rmdir ${D}${localstatedir}/log/
> -        sed -i -e 's,${libdir}/xorg/modules,${prefix}/lib*/xorg/modules,=
'
> ${D}${mandir}/man5/xorg.conf.5
> -}
> +SHA1 ??=3D "sha1"
> +# TODO: more options
> +PACKAGECONFIG[sha1] =3D "-Dsha1=3Dlibgcrypt,,libgcrypt"
>
> -# Add runtime provides for the ABI versions of the video and input
> subsystems,
>  # so that drivers can depend on the relevant version.
>  python populate_packages:prepend() {
>      import subprocess
> diff --git
> a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Avoid-duplicate-de=
finitions-of-IOPortBase.patch
> b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Avoid-duplicate-de=
finitions-of-IOPortBase.patch
> deleted file mode 100644
> index 4737040675..0000000000
> ---
> a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Avoid-duplicate-de=
finitions-of-IOPortBase.patch
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -From fc04acfd948ac99d04a5dc08c78f3b13bc0c5c41 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Mon, 17 Aug 2020 10:50:51 -0700
> -Subject: [PATCH] Avoid duplicate definitions of IOPortBase
> -
> -This fixed build with gcc10/-fno-common
> -
> -Fixes
> -compiler.h:528: multiple definition of `IOPortBase';
> -
> -Upstream-Status: Pending
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - hw/xfree86/common/compiler.h            | 2 +-
> - hw/xfree86/os-support/linux/lnx_video.c | 1 +
> - 2 files changed, 2 insertions(+), 1 deletion(-)
> -
> -diff --git a/hw/xfree86/common/compiler.h b/hw/xfree86/common/compiler.h
> -index 2b2008b..c7d617e 100644
> ---- a/hw/xfree86/common/compiler.h
> -+++ b/hw/xfree86/common/compiler.h
> -@@ -525,7 +525,7 @@ xf86WriteMmio32Le(__volatile__ void *base, const
> unsigned long offset,
> - #define PORT_SIZE short
> - #endif
> -
> --_X_EXPORT unsigned int IOPortBase;      /* Memory mapped I/O port area =
*/
> -+extern _X_EXPORT unsigned int IOPortBase;      /* Memory mapped I/O por=
t
> area */
> -
> - static __inline__ void
> - outb(unsigned PORT_SIZE port, unsigned char val)
> -diff --git a/hw/xfree86/os-support/linux/lnx_video.c
> b/hw/xfree86/os-support/linux/lnx_video.c
> -index 04e4509..9dc7316 100644
> ---- a/hw/xfree86/os-support/linux/lnx_video.c
> -+++ b/hw/xfree86/os-support/linux/lnx_video.c
> -@@ -78,6 +78,7 @@ xf86OSInitVidMem(VidMemInfoPtr pVidMem)
> -
> /************************************************************************=
***/
> - /* I/O Permissions section
>    */
> -
> /************************************************************************=
***/
> -+_X_EXPORT unsigned int IOPortBase;      /* Memory mapped I/O port area =
*/
> -
> - #if defined(__powerpc__)
> - volatile unsigned char *ioBase =3D NULL;
> ---
> -2.28.0
> -
> diff --git
> a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Fix-segfault-on-pr=
obing-a-non-PCI-platform-device-on.patch
> b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Fix-segfault-on-pr=
obing-a-non-PCI-platform-device-on.patch
> deleted file mode 100644
> index 8b687d612d..0000000000
> ---
> a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Fix-segfault-on-pr=
obing-a-non-PCI-platform-device-on.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -From e50c85f4ebf559a3bac4817b41074c43d4691779 Mon Sep 17 00:00:00 2001
> -From: Eric Anholt <eric@anholt.net>
> -Date: Fri, 26 Oct 2018 17:47:30 -0700
> -Subject: [PATCH] Fix segfault on probing a non-PCI platform device on a
> system
> - with PCI.
> -
> -Some Broadcom set-top-box boards have PCI busses, but the GPU is still
> -probed through DT.  We would dereference a null busid here in that
> -case.
> -
> -Signed-off-by: Eric Anholt <eric@anholt.net>
> -
> -Upstream-Status: Backport [
> https://github.com/freedesktop/xorg-xserver/commit/e50c85f4e]
> -Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linaro.org>
> ----
> - hw/xfree86/common/xf86platformBus.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/hw/xfree86/common/xf86platformBus.c
> b/hw/xfree86/common/xf86platformBus.c
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
> diff --git
> a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-test-xtest-Initial=
ize-array-with-braces.patch
> b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-test-xtest-Initial=
ize-array-with-braces.patch
> deleted file mode 100644
> index c0c242814b..0000000000
> ---
> a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-test-xtest-Initial=
ize-array-with-braces.patch
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
> -test/xtest.c:64:23: error: suggest braces around initialization of
> subobject [-Werror,-Wmissing-braces]
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
> -simply get all of the CFLAGS.  Aside from completeness, this helps build=
s
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
> diff --git
> a/meta/recipes-graphics/xorg-xserver/xserver-xorg/sdksyms-no-build-path.p=
atch
> b/meta/recipes-graphics/xorg-xserver/xserver-xorg/sdksyms-no-build-path.p=
atch
> deleted file mode 100644
> index be198ece49..0000000000
> ---
> a/meta/recipes-graphics/xorg-xserver/xserver-xorg/sdksyms-no-build-path.p=
atch
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
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.13.bb
> b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.0.bb
> similarity index 60%
> rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.13.bb
> rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.0.bb
> index 01a54070c7..8cb92884b5 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.13.bb
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.0.bb
> @@ -1,14 +1,9 @@
>  require xserver-xorg.inc
>
> -SRC_URI +=3D
> "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch \
> -           file://pkgconfig.patch \
> -           file://0001-test-xtest-Initialize-array-with-braces.patch \
> -           file://sdksyms-no-build-path.patch \
> -           file://0001-drmmode_display.c-add-missing-mi.h-include.patch =
\
> -           file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
> -
>  file://0001-Fix-segfault-on-probing-a-non-PCI-platform-device-on.patch \
> +SRC_URI +=3D " \
>             "
> -SRC_URI[sha256sum] =3D
> "40aa4e96a56a81a301f15a9b10e06a22700f12b42d9e0e453c7f11d354386300"
> +#SRC_URI[sha256sum] =3D
> "50c316dd8f4472cb60dfb285aa46ca6855d7626cecfd8330f6c51da743c1fe42"
> +SRC_URI[sha256sum] =3D
> "d8381e02919ca4683bdee5d399f7dc40dff8eb5a64d8bf9e4ee7c09edd51c086"
>
>  # These extensions are now integrated into the server, so declare the
> migration
>  # path for in-place upgrades.
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157603):
> https://lists.openembedded.org/g/openembedded-core/message/157603
> Mute This Topic: https://lists.openembedded.org/mt/86659714/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000001d6ad105cfbec3e2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I have a recipe that builds and runs now:</div><div><=
a href=3D"http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Dakanav=
in/package-version-updates-later">http://git.yoctoproject.org/cgit.cgi/poky=
-contrib/log/?h=3Dakanavin/package-version-updates-later</a></div><div><br>=
</div><div>There are significant issues with this new release:</div><div>- =
upstream forgot to include important files in the tarball; autotools build =
works but meson build does not.</div><div>- the binary crashes everywhere e=
xcept x86.</div><div><br></div><div>There should be a 21.1.1 coming soon, l=
et&#39;s see if it does better. X is still dying, this all seems like hobby=
ist work with no corporate backing.</div><div><br></div><div>Alex<br></div>=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Thu, 28 Oct 2021 at 20:44, Oleksandr Kravchuk &lt;<a href=3D"mailto:open=
.source@oleksandr-kravchuk.com">open.source@oleksandr-kravchuk.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">This dirt=
y work-in-progress patch is an open call for anyone interested<br>
to help with its testing.<br>
<br>
Signed-off-by: Oleksandr Kravchuk &lt;<a href=3D"mailto:open.source@oleksan=
dr-kravchuk.com" target=3D"_blank">open.source@oleksandr-kravchuk.com</a>&g=
t;<br>
---<br>
=C2=A0.../xorg-xserver/xserver-xorg.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 62 ++++++++-----------<br>
=C2=A0...-duplicate-definitions-of-IOPortBase.patch | 45 --------------<br>
=C2=A0...probing-a-non-PCI-platform-device-on.patch | 34 ----------<br>
=C2=A0...t-xtest-Initialize-array-with-braces.patch | 36 -----------<br>
=C2=A0.../xorg-xserver/xserver-xorg/pkgconfig.patch | 34 ----------<br>
=C2=A0.../xserver-xorg/sdksyms-no-build-path.patch=C2=A0 | 50 -------------=
--<br>
=C2=A0...<a href=3D"http://xorg_1.20.13.bb" rel=3D"noreferrer" target=3D"_b=
lank">xorg_1.20.13.bb</a> =3D&gt; <a href=3D"http://xserver-xorg_21.1.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">xserver-xorg_21.1.0.bb</a>} | 11 +---=
<br>
=C2=A07 files changed, 29 insertions(+), 243 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/00=
01-Avoid-duplicate-definitions-of-IOPortBase.patch<br>
=C2=A0delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/00=
01-Fix-segfault-on-probing-a-non-PCI-platform-device-on.patch<br>
=C2=A0delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/00=
01-test-xtest-Initialize-array-with-braces.patch<br>
=C2=A0delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/pk=
gconfig.patch<br>
=C2=A0delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/sd=
ksyms-no-build-path.patch<br>
=C2=A0rename meta/recipes-graphics/xorg-xserver/{<a href=3D"http://xserver-=
xorg_1.20.13.bb" rel=3D"noreferrer" target=3D"_blank">xserver-xorg_1.20.13.=
bb</a> =3D&gt; <a href=3D"http://xserver-xorg_21.1.0.bb" rel=3D"noreferrer"=
 target=3D"_blank">xserver-xorg_21.1.0.bb</a>} (60%)<br>
<br>
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/rec=
ipes-graphics/xorg-xserver/xserver-xorg.inc<br>
index e1fc0a06dc..3732601a4a 100644<br>
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc<br>
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc<br>
@@ -12,24 +12,23 @@ PROVIDES =3D &quot;virtual/xserver-xf86&quot;<br>
=C2=A0# Other packages tend to just care that there is *an* X server:<br>
=C2=A0PROVIDES +=3D &quot;virtual/xserver&quot;<br>
<br>
-PE =3D &quot;2&quot;<br>
-<br>
=C2=A0XORG_PN =3D &quot;xorg-server&quot;<br>
-SRC_URI =3D &quot;${XORG_MIRROR}/individual/xserver/${XORG_PN}-${PV}.tar.x=
z&quot;<br>
+#SRC_URI =3D &quot;${XORG_MIRROR}/individual/xserver/${XORG_PN}-${PV}.tar.=
xz&quot;<br>
+SRC_URI =3D &quot;<a href=3D"https://gitlab.freedesktop.org/xorg/xserver/-=
/archive/master/xserver-master.tar.gz" rel=3D"noreferrer" target=3D"_blank"=
>https://gitlab.freedesktop.org/xorg/xserver/-/archive/master/xserver-maste=
r.tar.gz</a>&quot;<br>
<br>
=C2=A0UPSTREAM_CHECK_REGEX =3D &quot;xorg-server-(?P&lt;pver&gt;\d+(\.(?!99=
)\d+)+)\.tar&quot;<br>
<br>
=C2=A0CVE_PRODUCT =3D &quot;xorg-server&quot;<br>
<br>
-S =3D &quot;${WORKDIR}/${XORG_PN}-${PV}&quot;<br>
+#S =3D &quot;${WORKDIR}/${XORG_PN}-${PV}&quot;<br>
+S =3D &quot;${WORKDIR}/xserver-master&quot;<br>
<br>
-inherit autotools pkgconfig<br>
+inherit meson features_check pkgconfig<br>
<br>
-inherit features_check<br>
=C2=A0REQUIRED_DISTRO_FEATURES =3D &quot;x11&quot;<br>
<br>
=C2=A0LIB_DEPS =3D &quot;pixman libxfont2 xtrans libxau libxext libxdmcp li=
bdrm libxkbfile libpciaccess&quot;<br>
-DEPENDS =3D &quot;xorgproto ${LIB_DEPS} font-util&quot;<br>
+DEPENDS =3D &quot;xorgproto ${LIB_DEPS} font-util libxcvt libepoxy&quot;<b=
r>
<br>
=C2=A0# Split out some modules and extensions from the main package<br>
=C2=A0# These aren&#39;t needed for basic operations and only take up space=
:<br>
@@ -52,7 +51,7 @@ PACKAGES =3D+ &quot;${PN}-sdl \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PN}-xephyr \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PN}-xwayland \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PN}-multimedia-modules \=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${PN}-extension-dri \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${PN}-extension-dri1 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PN}-extension-dri2 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PN}-extension-glx \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PN}-extension-record \<b=
r>
@@ -67,6 +66,7 @@ PACKAGES =3D+ &quot;${PN}-sdl \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PN}-module-xaa \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PN}-module-libxf1bpp \<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PN}-module-libxf4bpp \<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${PN}-module-inputtest \<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xf86-video-modesetting&quo=
t;<br>
<br>
=C2=A0SUMMARY:xf86-video-modesetting =3D &quot;X.Org X server -- modesettin=
g display driver&quot;<br>
@@ -88,7 +88,7 @@ FILES:${PN}-utils =3D &quot;${bindir}/scanpci ${bindir}/p=
citweak ${bindir}/ioport ${bin<br>
=C2=A0FILES:${PN}-xephyr =3D &quot;${bindir}/Xephyr&quot;<br>
=C2=A0FILES:${PN}-xwayland =3D &quot;${bindir}/Xwayland&quot;<br>
=C2=A0FILES:${PN}-multimedia-modules =3D &quot;${libdir}/xorg/modules/multi=
media/*drv*&quot;<br>
-FILES:${PN}-extension-dri =3D &quot;${libdir}/xorg/modules/extensions/libd=
ri.so&quot;<br>
+FILES:${PN}-extension-dri1 =3D &quot;${libdir}/xorg/modules/extensions/lib=
dri.so&quot;<br>
=C2=A0FILES:${PN}-extension-dri2 =3D &quot;${libdir}/xorg/modules/extension=
s/libdri2.so&quot;<br>
=C2=A0FILES:${PN}-extension-glx =3D &quot;${libdir}/xorg/modules/extensions=
/libglx.so&quot;<br>
=C2=A0FILES:${PN}-extension-record =3D &quot;${libdir}/xorg/modules/extensi=
ons/librecord.so&quot;<br>
@@ -103,6 +103,7 @@ FILES:${PN}-module-exa =3D &quot;${libdir}/xorg/modules=
/libexa.so&quot;<br>
=C2=A0FILES:${PN}-module-xaa =3D &quot;${libdir}/xorg/modules/libxaa.so&quo=
t;<br>
=C2=A0FILES:${PN}-module-libxf1bpp =3D &quot;${libdir}/xorg/modules/libxf1b=
pp.so&quot;<br>
=C2=A0FILES:${PN}-module-libxf4bpp =3D &quot;${libdir}/xorg/modules/libxf4b=
pp.so&quot;<br>
+FILES:${PN}-module-inputtest =3D &quot;${libdir}/xorg/modules/input/inputt=
est_drv.so&quot;<br>
=C2=A0FILES:xf86-video-modesetting =3D &quot;${libdir}/xorg/modules/drivers=
/modesetting_drv.so&quot;<br>
<br>
=C2=A0EXTRA_OECONF +=3D &quot;--with-fop=3Dno \<br>
@@ -121,41 +122,30 @@ EXTRA_OECONF +=3D &quot;--with-fop=3Dno \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --with-os-na=
me=3DLinux \<br>
=C2=A0&quot;<br>
<br>
-OPENGL_PKGCONFIGS =3D &quot;dri glx glamor dri3 xshmfence&quot;<br>
-PACKAGECONFIG ??=3D &quot;dga dri2 udev ${XORG_CRYPTO} \<br>
+OPENGL_PKGCONFIGS =3D &quot;dri1 glx glamor dri3&quot;<br>
+PACKAGECONFIG ??=3D &quot;dga dri2 udev ${SHA1} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb=
.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;opengl&#39;, &#39;${OPENGL_=
PKGCONFIGS}&#39;, &#39;&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb=
.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;systemd&#39;, &#39;systemd =
systemd-logind&#39;, &#39;&#39;, d)} \<br>
=C2=A0&quot;<br>
<br>
-PACKAGECONFIG[udev] =3D &quot;--enable-config-udev,--disable-config-udev,u=
dev&quot;<br>
-PACKAGECONFIG[dga] =3D &quot;--enable-dga,--disable-dga&quot;<br>
-PACKAGECONFIG[dri] =3D &quot;--enable-dri,--disable-dri,virtual/mesa&quot;=
<br>
-PACKAGECONFIG[dri2] =3D &quot;--enable-dri2,--disable-dri2&quot;<br>
+PACKAGECONFIG[udev] =3D &quot;-Dudev=3Dtrue,-Dudev=3Dfalse, udev&quot;<br>
+PACKAGECONFIG[dga] =3D &quot;-Ddga=3Dtrue,-Ddga=3Dfalse&quot;<br>
+PACKAGECONFIG[dri1] =3D &quot;-Ddri1=3Dtrue,-Ddri1=3Dfalse, virtual/mesa&q=
uot;<br>
+PACKAGECONFIG[dri2] =3D &quot;-Ddri2=3Dtrue,-Ddri2=3Dfalse&quot;<br>
=C2=A0# DRI3 requires xshmfence to also be enabled<br>
-PACKAGECONFIG[dri3] =3D &quot;--enable-dri3,--disable-dri3&quot;<br>
-PACKAGECONFIG[glx] =3D &quot;--enable-glx,--disable-glx,virtual/libgl virt=
ual/libx11&quot;<br>
-PACKAGECONFIG[glamor] =3D &quot;--enable-glamor,--disable-glamor,libepoxy =
virtual/libgbm,libegl&quot;<br>
-PACKAGECONFIG[unwind] =3D &quot;--enable-libunwind,--disable-libunwind,lib=
unwind&quot;<br>
-PACKAGECONFIG[xshmfence] =3D &quot;--enable-xshmfence,--disable-xshmfence,=
libxshmfence&quot;<br>
-PACKAGECONFIG[xmlto] =3D &quot;--with-xmlto, --without-xmlto, xmlto-native=
 docbook-xml-dtd4-native docbook-xsl-stylesheets-native&quot;<br>
-PACKAGECONFIG[systemd-logind] =3D &quot;--enable-systemd-logind=3Dyes,--en=
able-systemd-logind=3Dno,dbus,&quot;<br>
-PACKAGECONFIG[systemd] =3D &quot;--with-systemd-daemon,--without-systemd-d=
aemon,systemd&quot;<br>
-PACKAGECONFIG[xinerama] =3D &quot;--enable-xinerama,--disable-xinerama&quo=
t;<br>
-PACKAGECONFIG[xwayland] =3D &quot;--enable-xwayland,--disable-xwayland,way=
land wayland-native wayland-protocols libepoxy&quot;<br>
+PACKAGECONFIG[dri3] =3D &quot;-Ddri3=3Dtrue,-Ddri3=3Dfalse&quot;<br>
+PACKAGECONFIG[glx] =3D &quot;-Dglx=3Dtrue,-Dglx=3Dfalse&quot;<br>
+PACKAGECONFIG[glamor] =3D &quot;-Dglamor=3Dtrue,-Dglamor=3Dfalse&quot;<br>
+PACKAGECONFIG[libunwind] =3D &quot;-Dlibunwind=3Dtrue,-Dlibunwind=3Dfalse,=
libunwind&quot;<br>
+PACKAGECONFIG[systemd-logind] =3D &quot;-Dsystemdd_logind=3Dtrue,-Dsystemd=
_logind=3Dfalse, dbus,&quot;<br>
+PACKAGECONFIG[xinerama] =3D &quot;-Dxinerama=3Dtrue,-Dxinerama=3Dfalse&quo=
t;<br>
+PACKAGECONFIG[xwayland] =3D &quot;-Dxwayland=3Dtrue,-Dxwayland=3Dfalse,way=
land wayland-native wayland-protocols libepoxy&quot;<br>
<br>
=C2=A0# Xorg requires a SHA1 implementation, pick one<br>
-XORG_CRYPTO ??=3D &quot;openssl&quot;<br>
-PACKAGECONFIG[openssl] =3D &quot;--with-sha1=3Dlibcrypto,,openssl&quot;<br=
>
-PACKAGECONFIG[nettle] =3D &quot;--with-sha1=3Dlibnettle,,nettle&quot;<br>
-PACKAGECONFIG[gcrypt] =3D &quot;--with-sha1=3Dlibgcrypt,,libgcrypt&quot;<b=
r>
-<br>
-do_install:append () {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# Its assumed base-files creates this for us<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0rmdir ${D}${localstatedir}/log/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i -e &#39;s,${libdir}/xorg/modules,${pref=
ix}/lib*/xorg/modules,&#39; ${D}${mandir}/man5/xorg.conf.5<br>
-}<br>
+SHA1 ??=3D &quot;sha1&quot;<br>
+# TODO: more options<br>
+PACKAGECONFIG[sha1] =3D &quot;-Dsha1=3Dlibgcrypt,,libgcrypt&quot;<br>
<br>
-# Add runtime provides for the ABI versions of the video and input subsyst=
ems,<br>
=C2=A0# so that drivers can depend on the relevant version.<br>
=C2=A0python populate_packages:prepend() {<br>
=C2=A0 =C2=A0 =C2=A0import subprocess<br>
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Avoid-dup=
licate-definitions-of-IOPortBase.patch b/meta/recipes-graphics/xorg-xserver=
/xserver-xorg/0001-Avoid-duplicate-definitions-of-IOPortBase.patch<br>
deleted file mode 100644<br>
index 4737040675..0000000000<br>
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Avoid-duplicate-=
definitions-of-IOPortBase.patch<br>
+++ /dev/null<br>
@@ -1,45 +0,0 @@<br>
-From fc04acfd948ac99d04a5dc08c78f3b13bc0c5c41 Mon Sep 17 00:00:00 2001<br>
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank"=
>raj.khem@gmail.com</a>&gt;<br>
-Date: Mon, 17 Aug 2020 10:50:51 -0700<br>
-Subject: [PATCH] Avoid duplicate definitions of IOPortBase<br>
-<br>
-This fixed build with gcc10/-fno-common<br>
-<br>
-Fixes<br>
-compiler.h:528: multiple definition of `IOPortBase&#39;;<br>
-<br>
-Upstream-Status: Pending<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
----<br>
- hw/xfree86/common/compiler.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2=
 +-<br>
- hw/xfree86/os-support/linux/lnx_video.c | 1 +<br>
- 2 files changed, 2 insertions(+), 1 deletion(-)<br>
-<br>
-diff --git a/hw/xfree86/common/compiler.h b/hw/xfree86/common/compiler.h<b=
r>
-index 2b2008b..c7d617e 100644<br>
---- a/hw/xfree86/common/compiler.h<br>
-+++ b/hw/xfree86/common/compiler.h<br>
-@@ -525,7 +525,7 @@ xf86WriteMmio32Le(__volatile__ void *base, const unsig=
ned long offset,<br>
- #define PORT_SIZE short<br>
- #endif<br>
- <br>
--_X_EXPORT unsigned int IOPortBase;=C2=A0 =C2=A0 =C2=A0 /* Memory mapped I=
/O port area */<br>
-+extern _X_EXPORT unsigned int IOPortBase;=C2=A0 =C2=A0 =C2=A0 /* Memory m=
apped I/O port area */<br>
- <br>
- static __inline__ void<br>
- outb(unsigned PORT_SIZE port, unsigned char val)<br>
-diff --git a/hw/xfree86/os-support/linux/lnx_video.c b/hw/xfree86/os-suppo=
rt/linux/lnx_video.c<br>
-index 04e4509..9dc7316 100644<br>
---- a/hw/xfree86/os-support/linux/lnx_video.c<br>
-+++ b/hw/xfree86/os-support/linux/lnx_video.c<br>
-@@ -78,6 +78,7 @@ xf86OSInitVidMem(VidMemInfoPtr pVidMem)<br>
- /************************************************************************=
***/<br>
- /* I/O Permissions section=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
- /************************************************************************=
***/<br>
-+_X_EXPORT unsigned int IOPortBase;=C2=A0 =C2=A0 =C2=A0 /* Memory mapped I=
/O port area */<br>
- <br>
- #if defined(__powerpc__)<br>
- volatile unsigned char *ioBase =3D NULL;<br>
--- <br>
-2.28.0<br>
-<br>
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Fix-segfa=
ult-on-probing-a-non-PCI-platform-device-on.patch b/meta/recipes-graphics/x=
org-xserver/xserver-xorg/0001-Fix-segfault-on-probing-a-non-PCI-platform-de=
vice-on.patch<br>
deleted file mode 100644<br>
index 8b687d612d..0000000000<br>
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Fix-segfault-on-=
probing-a-non-PCI-platform-device-on.patch<br>
+++ /dev/null<br>
@@ -1,34 +0,0 @@<br>
-From e50c85f4ebf559a3bac4817b41074c43d4691779 Mon Sep 17 00:00:00 2001<br>
-From: Eric Anholt &lt;<a href=3D"mailto:eric@anholt.net" target=3D"_blank"=
>eric@anholt.net</a>&gt;<br>
-Date: Fri, 26 Oct 2018 17:47:30 -0700<br>
-Subject: [PATCH] Fix segfault on probing a non-PCI platform device on a sy=
stem<br>
- with PCI.<br>
-<br>
-Some Broadcom set-top-box boards have PCI busses, but the GPU is still<br>
-probed through DT.=C2=A0 We would dereference a null busid here in that<br=
>
-case.<br>
-<br>
-Signed-off-by: Eric Anholt &lt;<a href=3D"mailto:eric@anholt.net" target=
=3D"_blank">eric@anholt.net</a>&gt;<br>
-<br>
-Upstream-Status: Backport [<a href=3D"https://github.com/freedesktop/xorg-=
xserver/commit/e50c85f4e" rel=3D"noreferrer" target=3D"_blank">https://gith=
ub.com/freedesktop/xorg-xserver/commit/e50c85f4e</a>]<br>
-Signed-off-by: An=C3=ADbal Lim=C3=B3n &lt;<a href=3D"mailto:anibal.limon@l=
inaro.org" target=3D"_blank">anibal.limon@linaro.org</a>&gt;<br>
----<br>
- hw/xfree86/common/xf86platformBus.c | 2 +-<br>
- 1 file changed, 1 insertion(+), 1 deletion(-)<br>
-<br>
-diff --git a/hw/xfree86/common/xf86platformBus.c b/hw/xfree86/common/xf86p=
latformBus.c<br>
-index cef47da03..dadbac6c8 100644<br>
---- a/hw/xfree86/common/xf86platformBus.c<br>
-+++ b/hw/xfree86/common/xf86platformBus.c<br>
-@@ -289,7 +289,7 @@ xf86platformProbe(void)<br>
-=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; xf86_num_platform_devices; i++) {=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char *busid =3D xf86_platform_odev_attri=
butes(i)-&gt;busid;<br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (pci &amp;&amp; (strncmp(busid, &quot;pci:=
&quot;, 4) =3D=3D 0)) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (pci &amp;&amp; busid &amp;&amp; (strncmp(=
busid, &quot;pci:&quot;, 4) =3D=3D 0)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0platform_find_pci_info(&am=
p;xf86_platform_devices[i], busid);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- <br>
--- <br>
-2.28.0<br>
-<br>
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-test-xtes=
t-Initialize-array-with-braces.patch b/meta/recipes-graphics/xorg-xserver/x=
server-xorg/0001-test-xtest-Initialize-array-with-braces.patch<br>
deleted file mode 100644<br>
index c0c242814b..0000000000<br>
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-test-xtest-Initi=
alize-array-with-braces.patch<br>
+++ /dev/null<br>
@@ -1,36 +0,0 @@<br>
-From 8a382c015cd3c69fcfc146ef03dcbf30c77ff207 Mon Sep 17 00:00:00 2001<br>
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank"=
>raj.khem@gmail.com</a>&gt;<br>
-Date: Fri, 1 Mar 2019 09:47:57 -0800<br>
-Subject: [PATCH] test/xtest: Initialize array with braces<br>
-<br>
-Fixes an error when extra warnings are enabled, this is caught with clang<=
br>
-<br>
-test/xtest.c:64:23: error: suggest braces around initialization of subobje=
ct [-Werror,-Wmissing-braces]<br>
-=C2=A0 =C2=A0 WindowRec root =3D {0};<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ^<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
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
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/pkgconfig.patc=
h b/meta/recipes-graphics/xorg-xserver/xserver-xorg/pkgconfig.patch<br>
deleted file mode 100644<br>
index 2ef9fa9fe4..0000000000<br>
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/pkgconfig.patch<br>
+++ /dev/null<br>
@@ -1,34 +0,0 @@<br>
-Upstream-Status: Submitted [<a href=3D"https://gitlab.freedesktop.org/xorg=
/xserver/merge_requests/22" rel=3D"noreferrer" target=3D"_blank">https://gi=
tlab.freedesktop.org/xorg/xserver/merge_requests/22</a>]<br>
-Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com" ta=
rget=3D"_blank">ross.burton@intel.com</a>&gt;<br>
-<br>
-From 5f65a6246fe752764045dd1e38912f1dccec71e4 Mon Sep 17 00:00:00 2001<br>
-From: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_=
blank">ross.burton@intel.com</a>&gt;<br>
-Date: Thu, 20 Sep 2018 20:12:24 +0100<br>
-Subject: [PATCH] xorg-server.m4: just all cflags instead of just sdkdir<br=
>
-<br>
-Instead of fetching just the sdkdir variable of xorg-server using pkg-conf=
ig,<br>
-simply get all of the CFLAGS.=C2=A0 Aside from completeness, this helps bu=
ilds in<br>
-sysroots as pkg-config knows what to do with --cflags but doesn&#39;t rema=
p<br>
-arbitrary variables.<br>
-<br>
-Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com" ta=
rget=3D"_blank">ross.burton@intel.com</a>&gt;<br>
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
--=C2=A0 =C2=A0 =C2=A0 CFLAGS=3D&quot;$CFLAGS -I`$PKG_CONFIG --variable=3Ds=
dkdir xorg-server`&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 CFLAGS=3D&quot;$CFLAGS `$PKG_CONFIG --cflags xorg-se=
rver`&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[<br>
- #include &quot;xorg-server.h&quot;<br>
- #if !defined $1<br>
--- <br>
-2.11.0<br>
-<br>
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/sdksyms-no-bui=
ld-path.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/sdksyms-no-=
build-path.patch<br>
deleted file mode 100644<br>
index be198ece49..0000000000<br>
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/sdksyms-no-build-path=
.patch<br>
+++ /dev/null<br>
@@ -1,50 +0,0 @@<br>
-Upstream-Status: Backport [<a href=3D"https://gitlab.freedesktop.org/xorg/=
xserver/merge_requests/253" rel=3D"noreferrer" target=3D"_blank">https://gi=
tlab.freedesktop.org/xorg/xserver/merge_requests/253</a>]<br>
-Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com" ta=
rget=3D"_blank">ross.burton@intel.com</a>&gt;<br>
-<br>
-From ca832598d38ba55a001088b57d73c6d7261dc9a7 Mon Sep 17 00:00:00 2001<br>
-From: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_=
blank">ross.burton@intel.com</a>&gt;<br>
-Date: Thu, 1 Aug 2019 15:24:51 +0100<br>
-Subject: [PATCH] sdksyms.sh: don&#39;t embed the build path<br>
-<br>
-This script generates a header that has a comment containing the build pat=
h for<br>
-no real reason.=C2=A0 As this source can end up deployed on targets in deb=
ug packages<br>
-this means there is both potentially sensitive information leakage about t=
he<br>
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
- ${CPP:-cpp} &quot;$@&quot; sdksyms.c | ${AWK:-awk} -v topdir=3D$topdir &#=
39;<br>
-+function basename(file) {<br>
-+=C2=A0 =C2=A0 sub(&quot;.*/&quot;, &quot;&quot;, file)<br>
-+=C2=A0 =C2=A0 return file<br>
-+}<br>
- BEGIN {<br>
-=C2=A0 =C2=A0 =C2=A0sdk =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0print(&quot;/*&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0print(&quot; * These symbols are referenced to ensure =
they&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0print(&quot; * will be available in the X Server binar=
y.&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0print(&quot; */&quot;);<br>
--=C2=A0 =C2=A0 printf(&quot;/* topdir=3D%s */\n&quot;, topdir);<br>
-=C2=A0 =C2=A0 =C2=A0print(&quot;_X_HIDDEN void *xorg_symbols[] =3D {&quot;=
);<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0printf(&quot;sdksyms.c:&quot;) &gt; &quot;sdksyms.dep&=
quot;;<br>
-@@ -337,7 +340,7 @@ BEGIN {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# remove quotes<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gsub(/&quot;/, &quot;&quot;, $3);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0line =3D $2;<br>
--=C2=A0 =C2=A0 =C2=A0 header =3D $3;<br>
-+=C2=A0 =C2=A0 =C2=A0 header =3D basename($3);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (! headers[$3]) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printf(&quot; \\\n=C2=A0 %s&quot;=
, $3) &gt;&gt; &quot;sdksyms.dep&quot;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0headers[$3] =3D 1;<br>
--- <br>
-2.20.1<br>
-<br>
diff --git a/meta/recipes-graphics/xorg-xserver/<a href=3D"http://xserver-x=
org_1.20.13.bb" rel=3D"noreferrer" target=3D"_blank">xserver-xorg_1.20.13.b=
b</a> b/meta/recipes-graphics/xorg-xserver/<a href=3D"http://xserver-xorg_2=
1.1.0.bb" rel=3D"noreferrer" target=3D"_blank">xserver-xorg_21.1.0.bb</a><b=
r>
similarity index 60%<br>
rename from meta/recipes-graphics/xorg-xserver/<a href=3D"http://xserver-xo=
rg_1.20.13.bb" rel=3D"noreferrer" target=3D"_blank">xserver-xorg_1.20.13.bb=
</a><br>
rename to meta/recipes-graphics/xorg-xserver/<a href=3D"http://xserver-xorg=
_21.1.0.bb" rel=3D"noreferrer" target=3D"_blank">xserver-xorg_21.1.0.bb</a>=
<br>
index 01a54070c7..8cb92884b5 100644<br>
--- a/meta/recipes-graphics/xorg-xserver/<a href=3D"http://xserver-xorg_1.2=
0.13.bb" rel=3D"noreferrer" target=3D"_blank">xserver-xorg_1.20.13.bb</a><b=
r>
+++ b/meta/recipes-graphics/xorg-xserver/<a href=3D"http://xserver-xorg_21.=
1.0.bb" rel=3D"noreferrer" target=3D"_blank">xserver-xorg_21.1.0.bb</a><br>
@@ -1,14 +1,9 @@<br>
=C2=A0require xserver-xorg.inc<br>
<br>
-SRC_URI +=3D &quot;file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen=
4-hardwar.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://pkgconfig.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-test-xtest-Initialize=
-array-with-braces.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://sdksyms-no-build-path.patc=
h \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-drmmode_display.c-add=
-missing-mi.h-include.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Avoid-duplicate-defin=
itions-of-IOPortBase.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Fix-segfault-on-probi=
ng-a-non-PCI-platform-device-on.patch \<br>
+SRC_URI +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-SRC_URI[sha256sum] =3D &quot;40aa4e96a56a81a301f15a9b10e06a22700f12b42d9e0=
e453c7f11d354386300&quot;<br>
+#SRC_URI[sha256sum] =3D &quot;50c316dd8f4472cb60dfb285aa46ca6855d7626cecfd=
8330f6c51da743c1fe42&quot;<br>
+SRC_URI[sha256sum] =3D &quot;d8381e02919ca4683bdee5d399f7dc40dff8eb5a64d8b=
f9e4ee7c09edd51c086&quot;<br>
<br>
=C2=A0# These extensions are now integrated into the server, so declare the=
 migration<br>
=C2=A0# path for in-place upgrades.<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#157603): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/157603" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/157603</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/86659714/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/86659714/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000001d6ad105cfbec3e2--

