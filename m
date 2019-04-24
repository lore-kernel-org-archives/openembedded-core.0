Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1BBBE7D269
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 12:37:45 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id q19so5868721itk.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 05:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=+993yQ3wNGghAghPFJG1FUUXV4yV7J6IvGovxISBk30=;
	b=aijVW4FMUaKurq+lKgKx1uSee5nx4zVLMNf6vIBUH2w/lNfDlF8vIMSNa5ErLTjPHJ
	gF3l/KwpNi0TQEPY665pGeFDhpe2e6q3FCxOOCRHt5KBeaUy42C1cpvvxbytHh+gxcIK
	4kv9PzKTQ860AmxiLP59UWnRKJ3DPjzXy7ZJYnRFJgorWiMnMzDVVfh17BQM1SHKIl0X
	59K/iZOL5AhUYhlv9rKRshA18erchJ5GJqeraSm4srDgHk7MHumhoRCUmotMDE18zb0C
	lF5EtFmCgIHl9cTiLjktItvxq8oP8HaCc13N4bWk+3xnYFElPNOb9ANbO87ts8HhUW3c
	/2tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=+993yQ3wNGghAghPFJG1FUUXV4yV7J6IvGovxISBk30=;
	b=Wc4b97ZAaJ/f+HVhujdhvPV+J3Q10BJN3AC6TDv797SRPSG3wfe8jgLp3hfW2n+b33
	ojLAngCMXwtVK5NWkxwrhaUE0gWxOfIGApkQnvkRxZjiJPF/ffBR+eXvDcxZL34BuwTJ
	kecHPMHRW1TMZiFAcyCGGBJtBmYrC3JImK37Kn0YuWXmLth8wH5p3SIvZ8nvEJew7UNg
	6j6yhWncH9QlwWokgOWCbpBc+WlXMC6E18s1UgtqljIHTmP5I6oCV16GyUGu7gtJlaVm
	7ptNvMX8PMpnhSEnUlJqo2TpxfdQVcYdm1dpFkT+LXqjdZrc8e9AEUZJYvsOfU5zs6Eq
	m+bw==
X-Gm-Message-State: APjAAAVxToumX5A5zDptl8hZYi0xnaIWIzZMAE2AAaCvKyDmqyRtycI8
	8FCAP1zYFOxWq8OkXxSAN9g8Z2L8Wr++SBboblZJBQCF
X-Google-Smtp-Source: APXvYqzPcOhao8C2Cx7pIt2E7dWa6FVtS3/6y8XXUbLFJU1kliUaRQWIcSwcmO9AokeabqHFL10wYLW1jlcgfcBjTIU=
X-Received: by 2002:a02:ad15:: with SMTP id s21mr10229789jan.79.1556109466482; 
	Wed, 24 Apr 2019 05:37:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190424001333.14948-1-alistair.francis@wdc.com>
In-Reply-To: <20190424001333.14948-1-alistair.francis@wdc.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 24 Apr 2019 13:37:32 +0100
Message-ID: <CAJTo0LaGDctZU3CsUvL-7x2umjs6YBaKnf4QMF6Z+LppSf20nQ@mail.gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu: Upgrade from 3.1.0 to 4.0.0
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
X-List-Received-Date: Wed, 24 Apr 2019 12:37:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This patch doesn't apply for me, probably because it got mangled in
transport somewhere.  Is it in a branch I can pull from?

Ross

On Wed, 24 Apr 2019 at 01:15, Alistair Francis <Alistair.Francis@wdc.com> w=
rote:
>
> This commit upgrade QEMU to the latest 4.0.0 release.
>
>  - The COPYING.LIB file has changed SHA to:
>     "Synchronize the LGPL 2.1 with the version from gnu.org"
>  - SDL 1.2 has been removed, along with the --with-sdlabi command line
>     arg
>  - The backported patches have been removed
>  - Al the other patches have been refreshed and the numbering has been
>     updated
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  meta/conf/distro/include/tcmode-default.inc   |   2 +-
>  meta/recipes-devtools/qemu/qemu-native.inc    |   4 +-
>  ...u-native_3.1.0.bb =3D> qemu-native_4.0.0.bb} |   0
>  ...e_3.1.0.bb =3D> qemu-system-native_4.0.0.bb} |   1 +
>  meta/recipes-devtools/qemu/qemu.inc           |  38 +++---
>  .../qemu/0001-Add-a-missing-X11-include.patch |  65 ----------
>  ...-egl-headless-add-egl_create_context.patch |  50 --------
>  ...mu-Add-missing-wacom-HID-descriptor.patch} |   2 +-
>  ...-allow-user-to-disable-pointer-grabs.patch |  72 -----------
>  ...est-which-runs-all-unit-test-cases-.patch} |   6 +-
>  ...-environment-space-to-boot-loader-q.patch} |   6 +-
>  ...patch =3D> 0004-qemu-disable-Valgrind.patch} |   6 +-
>  ...searched-during-user-mode-emulation.patch} |   2 +-
>  ...d.bfd-fix-cflags-and-set-some-envir.patch} |   6 +-
>  ...connect-socket-to-a-spawned-command.patch} |  69 ++++++-----
>  ... 0008-apic-fixup-fallthrough-to-PIC.patch} |   6 +-
>  ...ebkitgtk-hangs-on-32-bit-x86-target.patch} |   4 +-
>  ...-fix-mmap-munmap-mprotect-mremap-sh.patch} |  20 ++--
>  ...-libcap-header-issue-on-some-distro.patch} |   2 +-
>  ...messages-when-qemi_cpu_kick_thread-.patch} |  10 +-
>  .../qemu/qemu/0014-fix-CVE-2018-16872.patch   |  85 -------------
>  .../qemu/qemu/0015-fix-CVE-2018-20124.patch   |  60 ----------
>  .../qemu/qemu/0016-fix-CVE-2018-20125.patch   |  54 ---------
>  .../qemu/qemu/0017-fix-CVE-2018-20126.patch   | 113 ------------------
>  .../qemu/qemu/0018-fix-CVE-2018-20191.patch   |  47 --------
>  .../qemu/qemu/0019-fix-CVE-2018-20216.patch   |  85 -------------
>  .../qemu/qemu/CVE-2019-3812.patch             |  39 ------
>  .../qemu/{qemu_3.1.0.bb =3D> qemu_4.0.0.bb}     |   0
>  28 files changed, 87 insertions(+), 767 deletions(-)
>  rename meta/recipes-devtools/qemu/{qemu-native_3.1.0.bb =3D> qemu-native=
_4.0.0.bb} (100%)
>  rename meta/recipes-devtools/qemu/{qemu-system-native_3.1.0.bb =3D> qemu=
-system-native_4.0.0.bb} (95%)
>  delete mode 100644 meta/recipes-devtools/qemu/qemu/0001-Add-a-missing-X1=
1-include.patch
>  delete mode 100644 meta/recipes-devtools/qemu/qemu/0001-egl-headless-add=
-egl_create_context.patch
>  rename meta/recipes-devtools/qemu/qemu/{0002-qemu-Add-missing-wacom-HID-=
descriptor.patch =3D> 0001-qemu-Add-missing-wacom-HID-descriptor.patch} (98=
%)
>  delete mode 100644 meta/recipes-devtools/qemu/qemu/0001-sdl.c-allow-user=
-to-disable-pointer-grabs.patch
>  rename meta/recipes-devtools/qemu/qemu/{0003-Add-subpackage-ptest-which-=
runs-all-unit-test-cases-.patch =3D> 0002-Add-subpackage-ptest-which-runs-a=
ll-unit-test-cases-.patch} (83%)
>  rename meta/recipes-devtools/qemu/qemu/{0004-qemu-Add-addition-environme=
nt-space-to-boot-loader-q.patch =3D> 0003-qemu-Add-addition-environment-spa=
ce-to-boot-loader-q.patch} (89%)
>  rename meta/recipes-devtools/qemu/qemu/{0005-qemu-disable-Valgrind.patch=
 =3D> 0004-qemu-disable-Valgrind.patch} (85%)
>  rename meta/recipes-devtools/qemu/qemu/{0006-qemu-Limit-paths-searched-d=
uring-user-mode-emulation.patch =3D> 0005-qemu-Limit-paths-searched-during-=
user-mode-emulation.patch} (98%)
>  rename meta/recipes-devtools/qemu/qemu/{0007-qemu-native-set-ld.bfd-fix-=
cflags-and-set-some-envir.patch =3D> 0006-qemu-native-set-ld.bfd-fix-cflags=
-and-set-some-envir.patch} (82%)
>  rename meta/recipes-devtools/qemu/qemu/{0008-chardev-connect-socket-to-a=
-spawned-command.patch =3D> 0007-chardev-connect-socket-to-a-spawned-comman=
d.patch} (80%)
>  rename meta/recipes-devtools/qemu/qemu/{0009-apic-fixup-fallthrough-to-P=
IC.patch =3D> 0008-apic-fixup-fallthrough-to-PIC.patch} (90%)
>  rename meta/recipes-devtools/qemu/qemu/{0010-linux-user-Fix-webkitgtk-ha=
ngs-on-32-bit-x86-target.patch =3D> 0009-linux-user-Fix-webkitgtk-hangs-on-=
32-bit-x86-target.patch} (93%)
>  rename meta/recipes-devtools/qemu/qemu/{0011-Revert-linux-user-fix-mmap-=
munmap-mprotect-mremap-sh.patch =3D> 0010-Revert-linux-user-fix-mmap-munmap=
-mprotect-mremap-sh.patch} (90%)
>  rename meta/recipes-devtools/qemu/qemu/{0012-fix-libcap-header-issue-on-=
some-distro.patch =3D> 0011-fix-libcap-header-issue-on-some-distro.patch} (=
97%)
>  rename meta/recipes-devtools/qemu/qemu/{0013-cpus.c-Add-error-messages-w=
hen-qemi_cpu_kick_thread-.patch =3D> 0012-cpus.c-Add-error-messages-when-qe=
mi_cpu_kick_thread-.patch} (87%)
>  delete mode 100644 meta/recipes-devtools/qemu/qemu/0014-fix-CVE-2018-168=
72.patch
>  delete mode 100644 meta/recipes-devtools/qemu/qemu/0015-fix-CVE-2018-201=
24.patch
>  delete mode 100644 meta/recipes-devtools/qemu/qemu/0016-fix-CVE-2018-201=
25.patch
>  delete mode 100644 meta/recipes-devtools/qemu/qemu/0017-fix-CVE-2018-201=
26.patch
>  delete mode 100644 meta/recipes-devtools/qemu/qemu/0018-fix-CVE-2018-201=
91.patch
>  delete mode 100644 meta/recipes-devtools/qemu/qemu/0019-fix-CVE-2018-202=
16.patch
>  delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2019-3812.patch
>  rename meta/recipes-devtools/qemu/{qemu_3.1.0.bb =3D> qemu_4.0.0.bb} (10=
0%)
>
> diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/dist=
ro/include/tcmode-default.inc
> index 04373cc0aa..02e9ddde24 100644
> --- a/meta/conf/distro/include/tcmode-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -24,7 +24,7 @@ BINUVERSION ?=3D "2.32%"
>  GDBVERSION ?=3D "8.2%"
>  GLIBCVERSION ?=3D "2.29%"
>  LINUXLIBCVERSION ?=3D "5.0%"
> -QEMUVERSION ?=3D "3.1%"
> +QEMUVERSION ?=3D "4.0%"
>  GOVERSION ?=3D "1.12%"
>
>  PREFERRED_VERSION_gcc ?=3D "${GCCVERSION}"
> diff --git a/meta/recipes-devtools/qemu/qemu-native.inc b/meta/recipes-de=
vtools/qemu/qemu-native.inc
> index 4373ad9e63..34ab8e6401 100644
> --- a/meta/recipes-devtools/qemu/qemu-native.inc
> +++ b/meta/recipes-devtools/qemu/qemu-native.inc
> @@ -3,8 +3,8 @@ inherit native
>  require qemu.inc
>
>  SRC_URI_append =3D " \
> -            file://0012-fix-libcap-header-issue-on-some-distro.patch \
> -            file://0013-cpus.c-Add-error-messages-when-qemi_cpu_kick_thr=
ead-.patch \
> +            file://0011-fix-libcap-header-issue-on-some-distro.patch \
> +            file://0012-cpus.c-Add-error-messages-when-qemi_cpu_kick_thr=
ead-.patch \
>              "
>  EXTRA_OECONF_append =3D " --python=3Dpython2.7"
>
> diff --git a/meta/recipes-devtools/qemu/qemu-native_3.1.0.bb b/meta/recip=
es-devtools/qemu/qemu-native_4.0.0.bb
> similarity index 100%
> rename from meta/recipes-devtools/qemu/qemu-native_3.1.0.bb
> rename to meta/recipes-devtools/qemu/qemu-native_4.0.0.bb
> diff --git a/meta/recipes-devtools/qemu/qemu-system-native_3.1.0.bb b/met=
a/recipes-devtools/qemu/qemu-system-native_4.0.0.bb
> similarity index 95%
> rename from meta/recipes-devtools/qemu/qemu-system-native_3.1.0.bb
> rename to meta/recipes-devtools/qemu/qemu-system-native_4.0.0.bb
> index 5bf528bec1..820883df65 100644
> --- a/meta/recipes-devtools/qemu/qemu-system-native_3.1.0.bb
> +++ b/meta/recipes-devtools/qemu/qemu-system-native_4.0.0.bb
> @@ -20,4 +20,5 @@ do_install_append() {
>      # The following is also installed by qemu-native
>      rm -f ${D}${datadir}/qemu/trace-events-all
>      rm -rf ${D}${datadir}/qemu/keymaps
> +    rm -rf ${D}${datadir}/icons/
>  }
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
> index 13f0549c25..dd666f86a8 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -5,36 +5,26 @@ LICENSE =3D "GPLv2 & LGPLv2.1"
>  RDEPENDS_${PN}-ptest =3D "bash make"
>
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D441c28d2cf86e15a37fa47e15a72f=
bac \
> -                    file://COPYING.LIB;endline=3D24;md5=3Dc04def7ae38850=
e7d3ef548588159913"
> +                    file://COPYING.LIB;endline=3D24;md5=3D8c5efda6cf1e1b=
03dcfd0e6c0d271c7f"
>
>  SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.tar.xz \
>             file://powerpc_rom.bin \
> -           file://0001-sdl.c-allow-user-to-disable-pointer-grabs.patch \
> -           file://0002-qemu-Add-missing-wacom-HID-descriptor.patch \
> -           file://0003-Add-subpackage-ptest-which-runs-all-unit-test-cas=
es-.patch \
>             file://run-ptest \
> -           file://0004-qemu-Add-addition-environment-space-to-boot-loade=
r-q.patch \
> -           file://0005-qemu-disable-Valgrind.patch \
> -           file://0006-qemu-Limit-paths-searched-during-user-mode-emulat=
ion.patch \
> -           file://0007-qemu-native-set-ld.bfd-fix-cflags-and-set-some-en=
vir.patch \
> -           file://0008-chardev-connect-socket-to-a-spawned-command.patch=
 \
> -           file://0009-apic-fixup-fallthrough-to-PIC.patch \
> -           file://0010-linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-targ=
et.patch \
> -           file://0011-Revert-linux-user-fix-mmap-munmap-mprotect-mremap=
-sh.patch \
> -           file://0001-Add-a-missing-X11-include.patch \
> -           file://0001-egl-headless-add-egl_create_context.patch \
> -           file://0014-fix-CVE-2018-16872.patch \
> -           file://0015-fix-CVE-2018-20124.patch \
> -           file://0016-fix-CVE-2018-20125.patch \
> -           file://0017-fix-CVE-2018-20126.patch \
> -           file://0018-fix-CVE-2018-20191.patch \
> -           file://0019-fix-CVE-2018-20216.patch \
> -           file://CVE-2019-3812.patch \
> +           file://0001-qemu-Add-missing-wacom-HID-descriptor.patch \
> +           file://0002-Add-subpackage-ptest-which-runs-all-unit-test-cas=
es-.patch \
> +           file://0003-qemu-Add-addition-environment-space-to-boot-loade=
r-q.patch \
> +           file://0004-qemu-disable-Valgrind.patch \
> +           file://0005-qemu-Limit-paths-searched-during-user-mode-emulat=
ion.patch \
> +           file://0006-qemu-native-set-ld.bfd-fix-cflags-and-set-some-en=
vir.patch \
> +           file://0007-chardev-connect-socket-to-a-spawned-command.patch=
 \
> +           file://0008-apic-fixup-fallthrough-to-PIC.patch \
> +           file://0009-linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-targ=
et.patch \
> +           file://0010-Revert-linux-user-fix-mmap-munmap-mprotect-mremap=
-sh.patch \
>             "
>  UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
>
> -SRC_URI[md5sum] =3D "fb687ce0b02d3bf4327e36d3b99427a8"
> -SRC_URI[sha256sum] =3D "6a0508df079a0a33c2487ca936a56c12122f105b8a96a443=
74704bef6c69abfc"
> +SRC_URI[md5sum] =3D "0afeca336fd57ae3d3086ec07f59d708"
> +SRC_URI[sha256sum] =3D "13a93dfe75b86734326f8d5b475fde82ec692d5b5a338b42=
62aeeb6b0fa4e469"
>
>  COMPATIBLE_HOST_mipsarchn32 =3D "null"
>  COMPATIBLE_HOST_mipsarchn64 =3D "null"
> @@ -133,7 +123,7 @@ make_qemu_wrapper() {
>  PACKAGECONFIG_remove_darwin =3D "kvm virglrenderer glx gtk+"
>  PACKAGECONFIG_remove_mingw32 =3D "kvm virglrenderer glx gtk+"
>
> -PACKAGECONFIG[sdl] =3D "--enable-sdl --with-sdlabi=3D2.0,--disable-sdl,l=
ibsdl2"
> +PACKAGECONFIG[sdl] =3D "--enable-sdl,--disable-sdl,libsdl2"
>  PACKAGECONFIG[virtfs] =3D "--enable-virtfs --enable-attr,--disable-virtf=
s,libcap attr,"
>  PACKAGECONFIG[aio] =3D "--enable-linux-aio,--disable-linux-aio,libaio,"
>  PACKAGECONFIG[xfs] =3D "--enable-xfsctl,--disable-xfsctl,xfsprogs,"
> diff --git a/meta/recipes-devtools/qemu/qemu/0001-Add-a-missing-X11-inclu=
de.patch b/meta/recipes-devtools/qemu/qemu/0001-Add-a-missing-X11-include.p=
atch
> deleted file mode 100644
> index 192936e1e7..0000000000
> --- a/meta/recipes-devtools/qemu/qemu/0001-Add-a-missing-X11-include.patc=
h
> +++ /dev/null
> @@ -1,65 +0,0 @@
> -From eb1a215a4f86dde4493c3e22ad9f6d698850915e Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex.kanavin@gmail.com>
> -Date: Thu, 20 Dec 2018 18:06:29 +0100
> -Subject: [PATCH] egl-helpers.h: do not depend on X11 Window type, use
> - EGLNativeWindowType
> -
> -It was assumed that mesa provides the necessary X11 includes,
> -but it is not always the case, as it can be configured without x11 suppo=
rt.
> -
> -Upstream-Status: Submitted [http://lists.nongnu.org/archive/html/qemu-de=
vel/2019-01/msg03706.html]
> -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> -
> ----
> - include/ui/egl-helpers.h | 2 +-
> - ui/egl-helpers.c         | 4 ++--
> - ui/gtk-egl.c             | 2 +-
> - 3 files changed, 4 insertions(+), 4 deletions(-)
> -
> -diff --git a/include/ui/egl-helpers.h b/include/ui/egl-helpers.h
> -index 9db7293b..3fc656a7 100644
> ---- a/include/ui/egl-helpers.h
> -+++ b/include/ui/egl-helpers.h
> -@@ -43,7 +43,7 @@ void egl_dmabuf_release_texture(QemuDmaBuf *dmabuf);
> -
> - #endif
> -
> --EGLSurface qemu_egl_init_surface_x11(EGLContext ectx, Window win);
> -+EGLSurface qemu_egl_init_surface_x11(EGLContext ectx, EGLNativeWindowTy=
pe win);
> -
> - int qemu_egl_init_dpy_x11(EGLNativeDisplayType dpy, DisplayGLMode mode)=
;
> - int qemu_egl_init_dpy_mesa(EGLNativeDisplayType dpy, DisplayGLMode mode=
);
> -diff --git a/ui/egl-helpers.c b/ui/egl-helpers.c
> -index 4f475142..5e115b3f 100644
> ---- a/ui/egl-helpers.c
> -+++ b/ui/egl-helpers.c
> -@@ -273,14 +273,14 @@ void egl_dmabuf_release_texture(QemuDmaBuf *dmabuf=
)
> -
> - /* --------------------------------------------------------------------=
-- */
> -
> --EGLSurface qemu_egl_init_surface_x11(EGLContext ectx, Window win)
> -+EGLSurface qemu_egl_init_surface_x11(EGLContext ectx, EGLNativeWindowTy=
pe win)
> - {
> -     EGLSurface esurface;
> -     EGLBoolean b;
> -
> -     esurface =3D eglCreateWindowSurface(qemu_egl_display,
> -                                       qemu_egl_config,
> --                                      (EGLNativeWindowType)win, NULL);
> -+                                      win, NULL);
> -     if (esurface =3D=3D EGL_NO_SURFACE) {
> -         error_report("egl: eglCreateWindowSurface failed");
> -         return NULL;
> -diff --git a/ui/gtk-egl.c b/ui/gtk-egl.c
> -index 5420c236..1f941162 100644
> ---- a/ui/gtk-egl.c
> -+++ b/ui/gtk-egl.c
> -@@ -54,7 +54,7 @@ void gd_egl_init(VirtualConsole *vc)
> -     }
> -
> -     vc->gfx.ectx =3D qemu_egl_init_ctx();
> --    vc->gfx.esurface =3D qemu_egl_init_surface_x11(vc->gfx.ectx, x11_wi=
ndow);
> -+    vc->gfx.esurface =3D qemu_egl_init_surface_x11(vc->gfx.ectx, (EGLNa=
tiveWindowType)x11_window);
> -
> -     assert(vc->gfx.esurface);
> - }
> diff --git a/meta/recipes-devtools/qemu/qemu/0001-egl-headless-add-egl_cr=
eate_context.patch b/meta/recipes-devtools/qemu/qemu/0001-egl-headless-add-=
egl_create_context.patch
> deleted file mode 100644
> index d9326c017a..0000000000
> --- a/meta/recipes-devtools/qemu/qemu/0001-egl-headless-add-egl_create_co=
ntext.patch
> +++ /dev/null
> @@ -1,50 +0,0 @@
> -From 952e5d584f5aabe41298c278065fe628f3f7aa7a Mon Sep 17 00:00:00 2001
> -From: Gerd Hoffmann <kraxel@redhat.com>
> -Date: Thu, 29 Nov 2018 13:35:02 +0100
> -Subject: [PATCH] egl-headless: add egl_create_context
> -
> -We must set the correct context (via eglMakeCurrent) before
> -calling qemu_egl_create_context, so we need a thin wrapper and can't
> -hook qemu_egl_create_context directly as ->dpy_gl_ctx_create callback.
> -
> -Reported-by: Frederik Carlier <frederik.carlier@quamotion.mobi>
> -Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> -Message-id: 20181129123502.30129-1-kraxel@redhat.com
> -
> -Upstream-Status: Backport [https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit=
;h=3D952e5d584f5aabe41298c278065fe628f3f7aa7a]
> -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ----
> - ui/egl-headless.c | 10 +++++++++-
> - 1 file changed, 9 insertions(+), 1 deletion(-)
> -
> -diff --git a/ui/egl-headless.c b/ui/egl-headless.c
> -index 4cf3bbc0e4..519e7bad32 100644
> ---- a/ui/egl-headless.c
> -+++ b/ui/egl-headless.c
> -@@ -38,6 +38,14 @@ static void egl_gfx_switch(DisplayChangeListener *dcl=
,
> -     edpy->ds =3D new_surface;
> - }
> -
> -+static QEMUGLContext egl_create_context(DisplayChangeListener *dcl,
> -+                                        QEMUGLParams *params)
> -+{
> -+    eglMakeCurrent(qemu_egl_display, EGL_NO_SURFACE, EGL_NO_SURFACE,
> -+                   qemu_egl_rn_ctx);
> -+    return qemu_egl_create_context(dcl, params);
> -+}
> -+
> - static void egl_scanout_disable(DisplayChangeListener *dcl)
> - {
> -     egl_dpy *edpy =3D container_of(dcl, egl_dpy, dcl);
> -@@ -150,7 +158,7 @@ static const DisplayChangeListenerOps egl_ops =3D {
> -     .dpy_gfx_update          =3D egl_gfx_update,
> -     .dpy_gfx_switch          =3D egl_gfx_switch,
> -
> --    .dpy_gl_ctx_create       =3D qemu_egl_create_context,
> -+    .dpy_gl_ctx_create       =3D egl_create_context,
> -     .dpy_gl_ctx_destroy      =3D qemu_egl_destroy_context,
> -     .dpy_gl_ctx_make_current =3D qemu_egl_make_context_current,
> -     .dpy_gl_ctx_get_current  =3D qemu_egl_get_current_context,
> ---
> -2.17.1
> -
> diff --git a/meta/recipes-devtools/qemu/qemu/0002-qemu-Add-missing-wacom-=
HID-descriptor.patch b/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-missin=
g-wacom-HID-descriptor.patch
> similarity index 98%
> rename from meta/recipes-devtools/qemu/qemu/0002-qemu-Add-missing-wacom-H=
ID-descriptor.patch
> rename to meta/recipes-devtools/qemu/qemu/0001-qemu-Add-missing-wacom-HID=
-descriptor.patch
> index 4de2688838..5373915ff0 100644
> --- a/meta/recipes-devtools/qemu/qemu/0002-qemu-Add-missing-wacom-HID-des=
criptor.patch
> +++ b/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-missing-wacom-HID-des=
criptor.patch
> @@ -1,4 +1,4 @@
> -From 7ac3c84f28866491c58cc0f52a25a706949c8ef3 Mon Sep 17 00:00:00 2001
> +From 1cb804cf0e47116202011f3386b4739af668224a Mon Sep 17 00:00:00 2001
>  From: Richard Purdie <richard.purdie@linuxfoundation.org>
>  Date: Thu, 27 Nov 2014 14:04:29 +0000
>  Subject: [PATCH] qemu: Add missing wacom HID descriptor
> diff --git a/meta/recipes-devtools/qemu/qemu/0001-sdl.c-allow-user-to-dis=
able-pointer-grabs.patch b/meta/recipes-devtools/qemu/qemu/0001-sdl.c-allow=
-user-to-disable-pointer-grabs.patch
> deleted file mode 100644
> index 5b9a1f911c..0000000000
> --- a/meta/recipes-devtools/qemu/qemu/0001-sdl.c-allow-user-to-disable-po=
inter-grabs.patch
> +++ /dev/null
> @@ -1,72 +0,0 @@
> -From c53ddb5acbee56db6423f369b9f9a9b62501b4af Mon Sep 17 00:00:00 2001
> -From: Ross Burton <ross.burton@intel.com>
> -Date: Wed, 18 Sep 2013 14:04:54 +0100
> -Subject: [PATCH] sdl.c: allow user to disable pointer grabs
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -When the pointer enters the Qemu window it calls SDL_WM_GrabInput, which=
 calls
> -XGrabPointer in a busyloop until it returns GrabSuccess. However if ther=
e's already
> -a pointer grab (screen is locked, a menu is open) then qemu will hang un=
til the
> -grab can be taken.  In the specific case of a headless X server on an au=
tobuilder, once
> -the screensaver has kicked in any qemu instance that appears underneath =
the
> -pointer will hang.
> -
> -I'm not entirely sure why pointer grabs are required (the documentation
> -explicitly says it doesn't do grabs when using a tablet, which we are) s=
o wrap
> -them in a conditional that can be set by the autobuilder environment, pr=
eserving
> -the current grabbing behaviour for everyone else.
> -
> -Upstream-Status: Pending
> -Signed-off-by: Ross Burton <ross.burton@intel.com>
> -Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
> -
> ----
> - ui/sdl.c | 13 +++++++++++--
> - 1 file changed, 11 insertions(+), 2 deletions(-)
> -
> -diff --git a/ui/sdl.c b/ui/sdl.c
> -index 190b16f5..aa89471d 100644
> ---- a/ui/sdl.c
> -+++ b/ui/sdl.c
> -@@ -69,6 +69,11 @@ static int idle_counter;
> - static const guint16 *keycode_map;
> - static size_t keycode_maplen;
> -
> -+#ifndef True
> -+#define True 1
> -+#endif
> -+static doing_grabs =3D True;
> -+
> - #define SDL_REFRESH_INTERVAL_BUSY 10
> - #define SDL_MAX_IDLE_COUNT (2 * GUI_REFRESH_INTERVAL_DEFAULT \
> -                             / SDL_REFRESH_INTERVAL_BUSY + 1)
> -@@ -399,14 +404,16 @@ static void sdl_grab_start(void)
> -         }
> -     } else
> -         sdl_hide_cursor();
> --    SDL_WM_GrabInput(SDL_GRAB_ON);
> -+    if (doing_grabs)
> -+      SDL_WM_GrabInput(SDL_GRAB_ON);
> -     gui_grab =3D 1;
> -     sdl_update_caption();
> - }
> -
> - static void sdl_grab_end(void)
> - {
> --    SDL_WM_GrabInput(SDL_GRAB_OFF);
> -+    if (doing_grabs)
> -+      SDL_WM_GrabInput(SDL_GRAB_OFF);
> -     gui_grab =3D 0;
> -     sdl_show_cursor();
> -     sdl_update_caption();
> -@@ -945,6 +952,8 @@ static void sdl1_display_init(DisplayState *ds, Disp=
layOptions *o)
> -      * This requires SDL >=3D 1.2.14. */
> -     setenv("SDL_DISABLE_LOCK_KEYS", "1", 1);
> -
> -+    doing_grabs =3D (getenv("QEMU_DONT_GRAB") =3D=3D NULL);
> -+
> -     flags =3D SDL_INIT_VIDEO | SDL_INIT_NOPARACHUTE;
> -     if (SDL_Init (flags)) {
> -         fprintf(stderr, "Could not initialize SDL(%s) - exiting\n",
> diff --git a/meta/recipes-devtools/qemu/qemu/0003-Add-subpackage-ptest-wh=
ich-runs-all-unit-test-cases-.patch b/meta/recipes-devtools/qemu/qemu/0002-=
Add-subpackage-ptest-which-runs-all-unit-test-cases-.patch
> similarity index 83%
> rename from meta/recipes-devtools/qemu/qemu/0003-Add-subpackage-ptest-whi=
ch-runs-all-unit-test-cases-.patch
> rename to meta/recipes-devtools/qemu/qemu/0002-Add-subpackage-ptest-which=
-runs-all-unit-test-cases-.patch
> index 668fc4680c..7b7c5d71a0 100644
> --- a/meta/recipes-devtools/qemu/qemu/0003-Add-subpackage-ptest-which-run=
s-all-unit-test-cases-.patch
> +++ b/meta/recipes-devtools/qemu/qemu/0002-Add-subpackage-ptest-which-run=
s-all-unit-test-cases-.patch
> @@ -1,4 +1,4 @@
> -From aac8834bfd5b79e724f2593895847b50968a1223 Mon Sep 17 00:00:00 2001
> +From 281116b31981b0b9e174bda8abe00f4eaa33c2ae Mon Sep 17 00:00:00 2001
>  From: Juro Bystricky <juro.bystricky@intel.com>
>  Date: Thu, 31 Aug 2017 11:06:56 -0700
>  Subject: [PATCH] Add subpackage -ptest which runs all unit test cases fo=
r
> @@ -15,10 +15,10 @@ Signed-off-by: Juro Bystricky <juro.bystricky@intel.c=
om>
>   1 file changed, 8 insertions(+)
>
>  diff --git a/tests/Makefile.include b/tests/Makefile.include
> -index fb0b449c..afedabd4 100644
> +index 36fc73fe..01fecd4d 100644
>  --- a/tests/Makefile.include
>  +++ b/tests/Makefile.include
> -@@ -967,4 +967,12 @@ all: $(QEMU_IOTESTS_HELPERS-y)
> +@@ -1184,4 +1184,12 @@ all: $(QEMU_IOTESTS_HELPERS-y)
>   -include $(wildcard tests/*.d)
>   -include $(wildcard tests/libqos/*.d)
>
> diff --git a/meta/recipes-devtools/qemu/qemu/0004-qemu-Add-addition-envir=
onment-space-to-boot-loader-q.patch b/meta/recipes-devtools/qemu/qemu/0003-=
qemu-Add-addition-environment-space-to-boot-loader-q.patch
> similarity index 89%
> rename from meta/recipes-devtools/qemu/qemu/0004-qemu-Add-addition-enviro=
nment-space-to-boot-loader-q.patch
> rename to meta/recipes-devtools/qemu/qemu/0003-qemu-Add-addition-environm=
ent-space-to-boot-loader-q.patch
> index b4d4c587bd..9a18ca18e4 100644
> --- a/meta/recipes-devtools/qemu/qemu/0004-qemu-Add-addition-environment-=
space-to-boot-loader-q.patch
> +++ b/meta/recipes-devtools/qemu/qemu/0003-qemu-Add-addition-environment-=
space-to-boot-loader-q.patch
> @@ -1,4 +1,4 @@
> -From 3de7a5635093c31dcb960ce9dff27da629b85d4d Mon Sep 17 00:00:00 2001
> +From bf04acef9ec31ddcc18ddbb4ac5b7b1e7368bf7d Mon Sep 17 00:00:00 2001
>  From: Jason Wessel <jason.wessel@windriver.com>
>  Date: Fri, 28 Mar 2014 17:42:43 +0800
>  Subject: [PATCH] qemu: Add addition environment space to boot loader
> @@ -19,10 +19,10 @@ Signed-off-by: Roy Li <rongqing.li@windriver.com>
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c
> -index c1cf0fe1..decffd2f 100644
> +index 439665ab..285c78ef 100644
>  --- a/hw/mips/mips_malta.c
>  +++ b/hw/mips/mips_malta.c
> -@@ -62,7 +62,7 @@
> +@@ -60,7 +60,7 @@
>
>   #define ENVP_ADDR             0x80002000l
>   #define ENVP_NB_ENTRIES               16
> diff --git a/meta/recipes-devtools/qemu/qemu/0005-qemu-disable-Valgrind.p=
atch b/meta/recipes-devtools/qemu/qemu/0004-qemu-disable-Valgrind.patch
> similarity index 85%
> rename from meta/recipes-devtools/qemu/qemu/0005-qemu-disable-Valgrind.pa=
tch
> rename to meta/recipes-devtools/qemu/qemu/0004-qemu-disable-Valgrind.patc=
h
> index f0cf8148e1..9e326081f2 100644
> --- a/meta/recipes-devtools/qemu/qemu/0005-qemu-disable-Valgrind.patch
> +++ b/meta/recipes-devtools/qemu/qemu/0004-qemu-disable-Valgrind.patch
> @@ -1,4 +1,4 @@
> -From 32e8a94b6ae664d9b5689e19d495e304c0f41954 Mon Sep 17 00:00:00 2001
> +From e40f797548bc3ff06c71b6cbe042a46406894d18 Mon Sep 17 00:00:00 2001
>  From: Ross Burton <ross.burton@intel.com>
>  Date: Tue, 20 Oct 2015 22:19:08 +0100
>  Subject: [PATCH] qemu: disable Valgrind
> @@ -13,10 +13,10 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
>   1 file changed, 9 deletions(-)
>
>  diff --git a/configure b/configure
> -index 0a3c6a72..069e0daa 100755
> +index 1c563a70..eaf9bb5e 100755
>  --- a/configure
>  +++ b/configure
> -@@ -5044,15 +5044,6 @@ fi
> +@@ -5311,15 +5311,6 @@ fi
>   # check if we have valgrind/valgrind.h
>
>   valgrind_h=3Dno
> diff --git a/meta/recipes-devtools/qemu/qemu/0006-qemu-Limit-paths-search=
ed-during-user-mode-emulation.patch b/meta/recipes-devtools/qemu/qemu/0005-=
qemu-Limit-paths-searched-during-user-mode-emulation.patch
> similarity index 98%
> rename from meta/recipes-devtools/qemu/qemu/0006-qemu-Limit-paths-searche=
d-during-user-mode-emulation.patch
> rename to meta/recipes-devtools/qemu/qemu/0005-qemu-Limit-paths-searched-=
during-user-mode-emulation.patch
> index 4b2f0137eb..819720a3f2 100644
> --- a/meta/recipes-devtools/qemu/qemu/0006-qemu-Limit-paths-searched-duri=
ng-user-mode-emulation.patch
> +++ b/meta/recipes-devtools/qemu/qemu/0005-qemu-Limit-paths-searched-duri=
ng-user-mode-emulation.patch
> @@ -1,4 +1,4 @@
> -From 02f80ee81681b6307a8032128a07686183662270 Mon Sep 17 00:00:00 2001
> +From 547c3710a1493d2fd6bb56b819cf162db433756a Mon Sep 17 00:00:00 2001
>  From: Richard Purdie <richard.purdie@linuxfoundation.org>
>  Date: Wed, 9 Mar 2016 22:49:02 +0000
>  Subject: [PATCH] qemu: Limit paths searched during user mode emulation
> diff --git a/meta/recipes-devtools/qemu/qemu/0007-qemu-native-set-ld.bfd-=
fix-cflags-and-set-some-envir.patch b/meta/recipes-devtools/qemu/qemu/0006-=
qemu-native-set-ld.bfd-fix-cflags-and-set-some-envir.patch
> similarity index 82%
> rename from meta/recipes-devtools/qemu/qemu/0007-qemu-native-set-ld.bfd-f=
ix-cflags-and-set-some-envir.patch
> rename to meta/recipes-devtools/qemu/qemu/0006-qemu-native-set-ld.bfd-fix=
-cflags-and-set-some-envir.patch
> index 4163e51884..b62a588c66 100644
> --- a/meta/recipes-devtools/qemu/qemu/0007-qemu-native-set-ld.bfd-fix-cfl=
ags-and-set-some-envir.patch
> +++ b/meta/recipes-devtools/qemu/qemu/0006-qemu-native-set-ld.bfd-fix-cfl=
ags-and-set-some-envir.patch
> @@ -1,4 +1,4 @@
> -From 74bce35b71f4733c13e96f96e25956ff943fae20 Mon Sep 17 00:00:00 2001
> +From 107fd860529a3c1319d54c3c225758457b0d9394 Mon Sep 17 00:00:00 2001
>  From: Stephen Arnold <sarnold@vctlabs.com>
>  Date: Sun, 12 Jun 2016 18:09:56 -0700
>  Subject: [PATCH] qemu-native: set ld.bfd, fix cflags, and set some envir=
onment
> @@ -10,10 +10,10 @@ Upstream-Status: Pending
>   1 file changed, 4 deletions(-)
>
>  diff --git a/configure b/configure
> -index 069e0daa..5b97f3c1 100755
> +index eaf9bb5e..de2933d1 100755
>  --- a/configure
>  +++ b/configure
> -@@ -5622,10 +5622,6 @@ write_c_skeleton
> +@@ -5928,10 +5928,6 @@ write_c_skeleton
>   if test "$gcov" =3D "yes" ; then
>     CFLAGS=3D"-fprofile-arcs -ftest-coverage -g $CFLAGS"
>     LDFLAGS=3D"-fprofile-arcs -ftest-coverage $LDFLAGS"
> diff --git a/meta/recipes-devtools/qemu/qemu/0008-chardev-connect-socket-=
to-a-spawned-command.patch b/meta/recipes-devtools/qemu/qemu/0007-chardev-c=
onnect-socket-to-a-spawned-command.patch
> similarity index 80%
> rename from meta/recipes-devtools/qemu/qemu/0008-chardev-connect-socket-t=
o-a-spawned-command.patch
> rename to meta/recipes-devtools/qemu/qemu/0007-chardev-connect-socket-to-=
a-spawned-command.patch
> index e5a2d4abca..f3f3dc3f5e 100644
> --- a/meta/recipes-devtools/qemu/qemu/0008-chardev-connect-socket-to-a-sp=
awned-command.patch
> +++ b/meta/recipes-devtools/qemu/qemu/0007-chardev-connect-socket-to-a-sp=
awned-command.patch
> @@ -1,4 +1,4 @@
> -From 9c1e976290e87a83ab1bfe38eb7ff3521ff0d684 Mon Sep 17 00:00:00 2001
> +From 136e159482a1bc8676cbe6e767055d0c3fb20065 Mon Sep 17 00:00:00 2001
>  From: Alistair Francis <alistair.francis@xilinx.com>
>  Date: Thu, 21 Dec 2017 11:35:16 -0800
>  Subject: [PATCH] chardev: connect socket to a spawned command
> @@ -46,17 +46,17 @@ Upstream-Status: Inappropriate [embedded specific]
>  Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
>
>  ---
> - chardev/char-socket.c | 102 ++++++++++++++++++++++++++++++++++++++++++
> + chardev/char-socket.c | 101 ++++++++++++++++++++++++++++++++++++++++++
>   chardev/char.c        |   3 ++
>   qapi/char.json        |   5 +++
> - 3 files changed, 110 insertions(+)
> + 3 files changed, 109 insertions(+)
>
>  diff --git a/chardev/char-socket.c b/chardev/char-socket.c
> -index eaa8e8b6..959ed183 100644
> +index 3916505d..a8e9dce8 100644
>  --- a/chardev/char-socket.c
>  +++ b/chardev/char-socket.c
> -@@ -987,6 +987,68 @@ static gboolean socket_reconnect_timeout(gpointer o=
paque)
> -     return false;
> +@@ -1273,6 +1273,67 @@ static bool qmp_chardev_validate_socket(ChardevSo=
cket *sock,
> +     return true;
>   }
>
>  +#ifndef _WIN32
> @@ -120,11 +120,10 @@ index eaa8e8b6..959ed183 100644
>  +    }
>  +}
>  +#endif
> -+
> +
>   static void qmp_chardev_open_socket(Chardev *chr,
>                                       ChardevBackend *backend,
> -                                     bool *be_opened,
> -@@ -994,6 +1056,9 @@ static void qmp_chardev_open_socket(Chardev *chr,
> +@@ -1281,6 +1342,9 @@ static void qmp_chardev_open_socket(Chardev *chr,
>   {
>       SocketChardev *s =3D SOCKET_CHARDEV(chr);
>       ChardevSocket *sock =3D backend->u.socket.data;
> @@ -134,9 +133,9 @@ index eaa8e8b6..959ed183 100644
>       bool do_nodelay     =3D sock->has_nodelay ? sock->nodelay : false;
>       bool is_listen      =3D sock->has_server  ? sock->server  : true;
>       bool is_telnet      =3D sock->has_telnet  ? sock->telnet  : false;
> -@@ -1072,6 +1137,14 @@ static void qmp_chardev_open_socket(Chardev *chr,
> -         s->reconnect_time =3D reconnect;
> -     }
> +@@ -1346,6 +1410,14 @@ static void qmp_chardev_open_socket(Chardev *chr,
> +
> +     update_disconnected_filename(s);
>
>  +#ifndef _WIN32
>  +    if (cmd) {
> @@ -146,13 +145,13 @@ index eaa8e8b6..959ed183 100644
>  +        *be_opened =3D true;
>  +    } else
>  +#endif
> -     if (s->reconnect_time) {
> -         tcp_chr_connect_async(chr);
> -     } else {
> -@@ -1131,9 +1204,26 @@ static void qemu_chr_parse_socket(QemuOpts *opts,=
 ChardevBackend *backend,
> +     if (s->is_listen) {
> +         if (qmp_chardev_open_socket_server(chr, is_telnet || is_tn3270,
> +                                            is_waitconnect, errp) < 0) {
> +@@ -1365,9 +1437,26 @@ static void qemu_chr_parse_socket(QemuOpts *opts,=
 ChardevBackend *backend,
> +     const char *host =3D qemu_opt_get(opts, "host");
>       const char *port =3D qemu_opt_get(opts, "port");
>       const char *fd =3D qemu_opt_get(opts, "fd");
> -     const char *tls_creds =3D qemu_opt_get(opts, "tls-creds");
>  +#ifndef _WIN32
>  +    const char *cmd =3D qemu_opt_get(opts, "cmd");
>  +#endif
> @@ -166,7 +165,7 @@ index eaa8e8b6..959ed183 100644
>  +         * spawning a command, otherwise unmodified code that doesn't k=
now about
>  +         * command spawning (like socket_reconnect_timeout()) might get=
 called.
>  +         */
> -+        if (path || is_listen || is_telnet || is_tn3270 || reconnect ||=
 host || port || tls_creds) {
> ++        if (path || sock->server || sock->has_telnet || sock->has_tn327=
0 || sock->reconnect || host || port || sock->tls_creds) {
>  +            error_setg(errp, "chardev: socket: cmd does not support any=
 additional options");
>  +            return;
>  +        }
> @@ -176,14 +175,14 @@ index eaa8e8b6..959ed183 100644
>       if ((!!path + !!fd + !!host) !=3D 1) {
>           error_setg(errp,
>                      "Exactly one of 'path', 'fd' or 'host' required");
> -@@ -1180,12 +1270,24 @@ static void qemu_chr_parse_socket(QemuOpts *opts=
, ChardevBackend *backend,
> -     sock->reconnect =3D reconnect;
> -     sock->tls_creds =3D g_strdup(tls_creds);
> +@@ -1410,12 +1499,24 @@ static void qemu_chr_parse_socket(QemuOpts *opts=
, ChardevBackend *backend,
> +     sock->has_tls_authz =3D qemu_opt_get(opts, "tls-authz");
> +     sock->tls_authz =3D g_strdup(qemu_opt_get(opts, "tls-authz"));
>
>  +#ifndef _WIN32
>  +    sock->cmd =3D g_strdup(cmd);
>  +#endif
> -+
> ++
>       addr =3D g_new0(SocketAddressLegacy, 1);
>  +#ifndef _WIN32
>  +    if (path || cmd) {
> @@ -202,10 +201,10 @@ index eaa8e8b6..959ed183 100644
>           addr->type =3D SOCKET_ADDRESS_LEGACY_KIND_INET;
>           addr->u.inet.data =3D g_new(InetSocketAddress, 1);
>  diff --git a/chardev/char.c b/chardev/char.c
> -index 152dde53..62d5b578 100644
> +index 514cd6b0..36a40d67 100644
>  --- a/chardev/char.c
>  +++ b/chardev/char.c
> -@@ -818,6 +818,9 @@ QemuOptsList qemu_chardev_opts =3D {
> +@@ -835,6 +835,9 @@ QemuOptsList qemu_chardev_opts =3D {
>           },{
>               .name =3D "path",
>               .type =3D QEMU_OPT_STRING,
> @@ -216,10 +215,10 @@ index 152dde53..62d5b578 100644
>               .name =3D "host",
>               .type =3D QEMU_OPT_STRING,
>  diff --git a/qapi/char.json b/qapi/char.json
> -index 79bac598..97bd161a 100644
> +index a6e81ac7..517962c6 100644
>  --- a/qapi/char.json
>  +++ b/qapi/char.json
> -@@ -242,6 +242,10 @@
> +@@ -247,6 +247,10 @@
>   #
>   # @addr: socket address to listen on (server=3Dtrue)
>   #        or connect to (server=3Dfalse)
> @@ -228,13 +227,13 @@ index 79bac598..97bd161a 100644
>  +#       is used by the chardev. Either an addr or a cmd can
>  +#       be specified, but not both.
>   # @tls-creds: the ID of the TLS credentials object (since 2.6)
> - # @server: create server socket (default: true)
> - # @wait: wait for incoming connection on server
> -@@ -261,6 +265,7 @@
> - # Since: 1.4
> + # @tls-authz: the ID of the QAuthZ authorization object against which
> + #             the client's x509 distinguished name will be validated. T=
his
> +@@ -272,6 +276,7 @@
>   ##
> - { 'struct': 'ChardevSocket', 'data': { 'addr'       : 'SocketAddressLeg=
acy',
> -+                                     '*cmd'       : 'str',
> -                                      '*tls-creds'  : 'str',
> -                                      '*server'    : 'bool',
> -                                      '*wait'      : 'bool',
> + { 'struct': 'ChardevSocket',
> +   'data': { 'addr': 'SocketAddressLegacy',
> ++            '*cmd': 'str',
> +             '*tls-creds': 'str',
> +             '*tls-authz'  : 'str',
> +             '*server': 'bool',
> diff --git a/meta/recipes-devtools/qemu/qemu/0009-apic-fixup-fallthrough-=
to-PIC.patch b/meta/recipes-devtools/qemu/qemu/0008-apic-fixup-fallthrough-=
to-PIC.patch
> similarity index 90%
> rename from meta/recipes-devtools/qemu/qemu/0009-apic-fixup-fallthrough-t=
o-PIC.patch
> rename to meta/recipes-devtools/qemu/qemu/0008-apic-fixup-fallthrough-to-=
PIC.patch
> index 1d3a2b5b21..13037f33f3 100644
> --- a/meta/recipes-devtools/qemu/qemu/0009-apic-fixup-fallthrough-to-PIC.=
patch
> +++ b/meta/recipes-devtools/qemu/qemu/0008-apic-fixup-fallthrough-to-PIC.=
patch
> @@ -1,4 +1,4 @@
> -From 4829da131996548dc86775b8b97a29c436f3d130 Mon Sep 17 00:00:00 2001
> +From 1b3f264e2ba18caf658fae27293c426c8366c6a3 Mon Sep 17 00:00:00 2001
>  From: Mark Asselstine <mark.asselstine@windriver.com>
>  Date: Tue, 26 Feb 2013 11:43:28 -0500
>  Subject: [PATCH] apic: fixup fallthrough to PIC
> @@ -30,10 +30,10 @@ Signed-off-by: He Zhe <zhe.he@windriver.com>
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/hw/intc/apic.c b/hw/intc/apic.c
> -index 97ffdd82..ef23430e 100644
> +index 6ea619c3..f892811e 100644
>  --- a/hw/intc/apic.c
>  +++ b/hw/intc/apic.c
> -@@ -603,7 +603,7 @@ int apic_accept_pic_intr(DeviceState *dev)
> +@@ -604,7 +604,7 @@ int apic_accept_pic_intr(DeviceState *dev)
>       APICCommonState *s =3D APIC(dev);
>       uint32_t lvt0;
>
> diff --git a/meta/recipes-devtools/qemu/qemu/0010-linux-user-Fix-webkitgt=
k-hangs-on-32-bit-x86-target.patch b/meta/recipes-devtools/qemu/qemu/0009-l=
inux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch
> similarity index 93%
> rename from meta/recipes-devtools/qemu/qemu/0010-linux-user-Fix-webkitgtk=
-hangs-on-32-bit-x86-target.patch
> rename to meta/recipes-devtools/qemu/qemu/0009-linux-user-Fix-webkitgtk-h=
angs-on-32-bit-x86-target.patch
> index c0d7914be0..c572ff94d0 100644
> --- a/meta/recipes-devtools/qemu/qemu/0010-linux-user-Fix-webkitgtk-hangs=
-on-32-bit-x86-target.patch
> +++ b/meta/recipes-devtools/qemu/qemu/0009-linux-user-Fix-webkitgtk-hangs=
-on-32-bit-x86-target.patch
> @@ -1,4 +1,4 @@
> -From bce25c9cda73569963615ffd31ed949cbe3a3781 Mon Sep 17 00:00:00 2001
> +From a33ae91504ea4d254b5ace64a84791d3c96c9773 Mon Sep 17 00:00:00 2001
>  From: Alistair Francis <alistair.francis@xilinx.com>
>  Date: Wed, 17 Jan 2018 10:51:49 -0800
>  Subject: [PATCH] linux-user: Fix webkitgtk hangs on 32-bit x86 target
> @@ -19,7 +19,7 @@ Signed-off-by: Alistair Francis <alistair.francis@xilin=
x.com>
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/linux-user/main.c b/linux-user/main.c
> -index 923cbb75..fe0b9ff4 100644
> +index a0aba9cb..34c54924 100644
>  --- a/linux-user/main.c
>  +++ b/linux-user/main.c
>  @@ -69,7 +69,7 @@ int have_guest_base;
> diff --git a/meta/recipes-devtools/qemu/qemu/0011-Revert-linux-user-fix-m=
map-munmap-mprotect-mremap-sh.patch b/meta/recipes-devtools/qemu/qemu/0010-=
Revert-linux-user-fix-mmap-munmap-mprotect-mremap-sh.patch
> similarity index 90%
> rename from meta/recipes-devtools/qemu/qemu/0011-Revert-linux-user-fix-mm=
ap-munmap-mprotect-mremap-sh.patch
> rename to meta/recipes-devtools/qemu/qemu/0010-Revert-linux-user-fix-mmap=
-munmap-mprotect-mremap-sh.patch
> index 066ea7865a..3418eb7c65 100644
> --- a/meta/recipes-devtools/qemu/qemu/0011-Revert-linux-user-fix-mmap-mun=
map-mprotect-mremap-sh.patch
> +++ b/meta/recipes-devtools/qemu/qemu/0010-Revert-linux-user-fix-mmap-mun=
map-mprotect-mremap-sh.patch
> @@ -1,4 +1,4 @@
> -From 496231774f8bc17ecfaf543a6603e3cad3f3f74e Mon Sep 17 00:00:00 2001
> +From 2a66bd95c856de6950fbd802c5b99075207c1d76 Mon Sep 17 00:00:00 2001
>  From: Martin Jansa <martin.jansa@lge.com>
>  Date: Fri, 1 Jun 2018 08:41:07 +0000
>  Subject: [PATCH] Revert "linux-user: fix mmap/munmap/mprotect/mremap/shm=
at"
> @@ -23,7 +23,7 @@ Upstream-Status: Pending
>   4 files changed, 15 insertions(+), 29 deletions(-)
>
>  diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
> -index 117d2fbb..90558c14 100644
> +index b16c9ec5..612db6a0 100644
>  --- a/include/exec/cpu-all.h
>  +++ b/include/exec/cpu-all.h
>  @@ -163,12 +163,8 @@ extern unsigned long guest_base;
> @@ -41,7 +41,7 @@ index 117d2fbb..90558c14 100644
>
>   #include "exec/hwaddr.h"
>  diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
> -index 95906849..ed17b3f6 100644
> +index d78041d7..845639f7 100644
>  --- a/include/exec/cpu_ldst.h
>  +++ b/include/exec/cpu_ldst.h
>  @@ -62,13 +62,15 @@ typedef uint64_t abi_ptr;
> @@ -68,7 +68,7 @@ index 95906849..ed17b3f6 100644
>   #define h2g_nocheck(x) ({ \
>       unsigned long __ret =3D (unsigned long)(x) - guest_base; \
>  diff --git a/linux-user/mmap.c b/linux-user/mmap.c
> -index 41e0983c..d0ee1c53 100644
> +index e0249efe..cfe34b35 100644
>  --- a/linux-user/mmap.c
>  +++ b/linux-user/mmap.c
>  @@ -79,7 +79,7 @@ int target_mprotect(abi_ulong start, abi_ulong len, in=
t prot)
> @@ -81,9 +81,9 @@ index 41e0983c..d0ee1c53 100644
>       }
>       prot &=3D PROT_READ | PROT_WRITE | PROT_EXEC;
>  @@ -490,8 +490,8 @@ abi_long target_mmap(abi_ulong start, abi_ulong len,=
 int prot,
> -        * It can fail only on 64-bit host with 32-bit target.
> -        * On any other target/host host mmap() handles this error correc=
tly.
> -        */
> +          * It can fail only on 64-bit host with 32-bit target.
> +          * On any other target/host host mmap() handles this error corr=
ectly.
> +          */
>  -        if (!guest_range_valid(start, len)) {
>  -            errno =3D ENOMEM;
>  +        if ((unsigned long)start + len - 1 > (abi_ulong) -1) {
> @@ -118,10 +118,10 @@ index 41e0983c..d0ee1c53 100644
>
>       if (flags & MREMAP_FIXED) {
>  diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> -index 280137da..efdd0006 100644
> +index 96cd4bf8..e6754772 100644
>  --- a/linux-user/syscall.c
>  +++ b/linux-user/syscall.c
> -@@ -3818,9 +3818,6 @@ static inline abi_ulong do_shmat(CPUArchState *cpu=
_env,
> +@@ -3860,9 +3860,6 @@ static inline abi_ulong do_shmat(CPUArchState *cpu=
_env,
>               return -TARGET_EINVAL;
>           }
>       }
> @@ -131,7 +131,7 @@ index 280137da..efdd0006 100644
>
>       mmap_lock();
>
> -@@ -6582,7 +6579,7 @@ static int open_self_maps(void *cpu_env, int fd)
> +@@ -6633,7 +6630,7 @@ static int open_self_maps(void *cpu_env, int fd)
>           }
>           if (h2g_valid(min)) {
>               int flags =3D page_get_flags(h2g(min));
> diff --git a/meta/recipes-devtools/qemu/qemu/0012-fix-libcap-header-issue=
-on-some-distro.patch b/meta/recipes-devtools/qemu/qemu/0011-fix-libcap-hea=
der-issue-on-some-distro.patch
> similarity index 97%
> rename from meta/recipes-devtools/qemu/qemu/0012-fix-libcap-header-issue-=
on-some-distro.patch
> rename to meta/recipes-devtools/qemu/qemu/0011-fix-libcap-header-issue-on=
-some-distro.patch
> index 9cbe838811..3a7d7bbd33 100644
> --- a/meta/recipes-devtools/qemu/qemu/0012-fix-libcap-header-issue-on-som=
e-distro.patch
> +++ b/meta/recipes-devtools/qemu/qemu/0011-fix-libcap-header-issue-on-som=
e-distro.patch
> @@ -1,4 +1,4 @@
> -From d3e0b8dac7c2eb20d7fcff747bc98b981f4398ef Mon Sep 17 00:00:00 2001
> +From 9125afb733d8c96416bb83c5adad39bb8d0803a1 Mon Sep 17 00:00:00 2001
>  From: Hongxu Jia <hongxu.jia@windriver.com>
>  Date: Tue, 12 Mar 2013 09:54:06 +0800
>  Subject: [PATCH] fix libcap header issue on some distro
> diff --git a/meta/recipes-devtools/qemu/qemu/0013-cpus.c-Add-error-messag=
es-when-qemi_cpu_kick_thread-.patch b/meta/recipes-devtools/qemu/qemu/0012-=
cpus.c-Add-error-messages-when-qemi_cpu_kick_thread-.patch
> similarity index 87%
> rename from meta/recipes-devtools/qemu/qemu/0013-cpus.c-Add-error-message=
s-when-qemi_cpu_kick_thread-.patch
> rename to meta/recipes-devtools/qemu/qemu/0012-cpus.c-Add-error-messages-=
when-qemi_cpu_kick_thread-.patch
> index 27e508c5a3..04664195d1 100644
> --- a/meta/recipes-devtools/qemu/qemu/0013-cpus.c-Add-error-messages-when=
-qemi_cpu_kick_thread-.patch
> +++ b/meta/recipes-devtools/qemu/qemu/0012-cpus.c-Add-error-messages-when=
-qemi_cpu_kick_thread-.patch
> @@ -1,4 +1,4 @@
> -From 861c522df7791d7e93743d5641f3ef2a5a3c4632 Mon Sep 17 00:00:00 2001
> +From 0a53e906510cce1f32bc04a11e81ea40f834dac4 Mon Sep 17 00:00:00 2001
>  From: =3D?UTF-8?q?An=3DC3=3DADbal=3D20Lim=3DC3=3DB3n?=3D <anibal.limon@l=
inux.intel.com>
>  Date: Wed, 12 Aug 2015 15:11:30 -0500
>  Subject: [PATCH] cpus.c: Add error messages when qemi_cpu_kick_thread fa=
ils.
> @@ -20,10 +20,10 @@ Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@l=
inux.intel.com>
>   create mode 100644 custom_debug.h
>
>  diff --git a/cpus.c b/cpus.c
> -index 0ddeeefc..4f3a5624 100644
> +index e83f72b4..e6e2576e 100644
>  --- a/cpus.c
>  +++ b/cpus.c
> -@@ -1768,6 +1768,8 @@ static void *qemu_tcg_cpu_thread_fn(void *arg)
> +@@ -1769,6 +1769,8 @@ static void *qemu_tcg_cpu_thread_fn(void *arg)
>       return NULL;
>   }
>
> @@ -32,9 +32,9 @@ index 0ddeeefc..4f3a5624 100644
>   static void qemu_cpu_kick_thread(CPUState *cpu)
>   {
>   #ifndef _WIN32
> -@@ -1780,6 +1782,9 @@ static void qemu_cpu_kick_thread(CPUState *cpu)
> +@@ -1781,6 +1783,9 @@ static void qemu_cpu_kick_thread(CPUState *cpu)
>       err =3D pthread_kill(cpu->thread->thread, SIG_IPI);
> -     if (err) {
> +     if (err && err !=3D ESRCH) {
>           fprintf(stderr, "qemu:%s: %s", __func__, strerror(err));
>  +        fprintf(stderr, "CPU #%d:\n", cpu->cpu_index);
>  +        cpu_dump_state(cpu, stderr, fprintf, 0);
> diff --git a/meta/recipes-devtools/qemu/qemu/0014-fix-CVE-2018-16872.patc=
h b/meta/recipes-devtools/qemu/qemu/0014-fix-CVE-2018-16872.patch
> deleted file mode 100644
> index 412aa16046..0000000000
> --- a/meta/recipes-devtools/qemu/qemu/0014-fix-CVE-2018-16872.patch
> +++ /dev/null
> @@ -1,85 +0,0 @@
> -CVE: CVE-2018-16872
> -Upstream-Status: Backport [https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit=
;h=3Dbab9df35]
> -
> -Signed-off-by: Kai Kang <kai.kang@windriver.com>
> -
> -From bab9df35ce73d1c8e19a37e2737717ea1c984dc1 Mon Sep 17 00:00:00 2001
> -From: Gerd Hoffmann <kraxel@redhat.com>
> -Date: Thu, 13 Dec 2018 13:25:11 +0100
> -Subject: [PATCH] usb-mtp: use O_NOFOLLOW and O_CLOEXEC.
> -
> -Open files and directories with O_NOFOLLOW to avoid symlinks attacks.
> -While being at it also add O_CLOEXEC.
> -
> -usb-mtp only handles regular files and directories and ignores
> -everything else, so users should not see a difference.
> -
> -Because qemu ignores symlinks, carrying out a successful symlink attack
> -requires swapping an existing file or directory below rootdir for a
> -symlink and winning the race against the inotify notification to qemu.
> -
> -Fixes: CVE-2018-16872
> -Cc: Prasad J Pandit <ppandit@redhat.com>
> -Cc: Bandan Das <bsd@redhat.com>
> -Reported-by: Michael Hanselmann <public@hansmi.ch>
> -Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> -Reviewed-by: Michael Hanselmann <public@hansmi.ch>
> -Message-id: 20181213122511.13853-1-kraxel@redhat.com
> ----
> - hw/usb/dev-mtp.c | 13 +++++++++----
> - 1 file changed, 9 insertions(+), 4 deletions(-)
> -
> -diff --git a/hw/usb/dev-mtp.c b/hw/usb/dev-mtp.c
> -index 100b7171f4..36c43b8c20 100644
> ---- a/hw/usb/dev-mtp.c
> -+++ b/hw/usb/dev-mtp.c
> -@@ -653,13 +653,18 @@ static void usb_mtp_object_readdir(MTPState *s, MT=
PObject *o)
> - {
> -     struct dirent *entry;
> -     DIR *dir;
> -+    int fd;
> -
> -     if (o->have_children) {
> -         return;
> -     }
> -     o->have_children =3D true;
> -
> --    dir =3D opendir(o->path);
> -+    fd =3D open(o->path, O_DIRECTORY | O_CLOEXEC | O_NOFOLLOW);
> -+    if (fd < 0) {
> -+        return;
> -+    }
> -+    dir =3D fdopendir(fd);
> -     if (!dir) {
> -         return;
> -     }
> -@@ -1007,7 +1012,7 @@ static MTPData *usb_mtp_get_object(MTPState *s, MT=
PControl *c,
> -
> -     trace_usb_mtp_op_get_object(s->dev.addr, o->handle, o->path);
> -
> --    d->fd =3D open(o->path, O_RDONLY);
> -+    d->fd =3D open(o->path, O_RDONLY | O_CLOEXEC | O_NOFOLLOW);
> -     if (d->fd =3D=3D -1) {
> -         usb_mtp_data_free(d);
> -         return NULL;
> -@@ -1031,7 +1036,7 @@ static MTPData *usb_mtp_get_partial_object(MTPStat=
e *s, MTPControl *c,
> -                                         c->argv[1], c->argv[2]);
> -
> -     d =3D usb_mtp_data_alloc(c);
> --    d->fd =3D open(o->path, O_RDONLY);
> -+    d->fd =3D open(o->path, O_RDONLY | O_CLOEXEC | O_NOFOLLOW);
> -     if (d->fd =3D=3D -1) {
> -         usb_mtp_data_free(d);
> -         return NULL;
> -@@ -1658,7 +1663,7 @@ static void usb_mtp_write_data(MTPState *s)
> -                                  0, 0, 0, 0);
> -             goto done;
> -         }
> --        d->fd =3D open(path, O_CREAT | O_WRONLY, mask);
> -+        d->fd =3D open(path, O_CREAT | O_WRONLY | O_CLOEXEC | O_NOFOLLO=
W, mask);
> -         if (d->fd =3D=3D -1) {
> -             usb_mtp_queue_result(s, RES_STORE_FULL, d->trans,
> -                                  0, 0, 0, 0);
> ---
> -2.20.1
> -
> diff --git a/meta/recipes-devtools/qemu/qemu/0015-fix-CVE-2018-20124.patc=
h b/meta/recipes-devtools/qemu/qemu/0015-fix-CVE-2018-20124.patch
> deleted file mode 100644
> index 985b819409..0000000000
> --- a/meta/recipes-devtools/qemu/qemu/0015-fix-CVE-2018-20124.patch
> +++ /dev/null
> @@ -1,60 +0,0 @@
> -CVE: CVE-2018-20124
> -Upstream-Status: Backport [https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit=
;h=3D0e68373]
> -
> -Backport patch to fix CVE-2018-20124. Update context and stay with curre=
nt
> -function comp_handler() which has been replaced with complete_work() in =
latest
> -git repo.
> -
> -Signed-off-by: Kai Kang <kai.kang@windriver.com>
> -
> -From 0e68373cc2b3a063ce067bc0cc3edaf370752890 Mon Sep 17 00:00:00 2001
> -From: Prasad J Pandit <pjp@fedoraproject.org>
> -Date: Thu, 13 Dec 2018 01:00:34 +0530
> -Subject: [PATCH] rdma: check num_sge does not exceed MAX_SGE
> -
> -rdma back-end has scatter/gather array ibv_sge[MAX_SGE=3D4] set
> -to have 4 elements. A guest could send a 'PvrdmaSqWqe' ring element
> -with 'num_sge' set to > MAX_SGE, which may lead to OOB access issue.
> -Add check to avoid it.
> -
> -Reported-by: Saar Amar <saaramar5@gmail.com>
> -Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
> -Reviewed-by: Yuval Shaia <yuval.shaia@oracle.com>
> -Signed-off-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> ----
> - hw/rdma/rdma_backend.c | 12 ++++++------
> - 1 file changed, 6 insertions(+), 6 deletions(-)
> -
> -diff --git a/hw/rdma/rdma_backend.c b/hw/rdma/rdma_backend.c
> -index d7a4bbd9..7f8028f8 100644
> ---- a/hw/rdma/rdma_backend.c
> -+++ b/hw/rdma/rdma_backend.c
> -@@ -311,9 +311,9 @@ void rdma_backend_post_send(RdmaBackendDev *backend_=
dev,
> -     }
> -
> -     pr_dbg("num_sge=3D%d\n", num_sge);
> --    if (!num_sge) {
> --        pr_dbg("num_sge=3D0\n");
> --        comp_handler(IBV_WC_GENERAL_ERR, VENDOR_ERR_NO_SGE, ctx);
> -+    if (!num_sge || num_sge > MAX_SGE) {
> -+        pr_dbg("invalid num_sge=3D%d\n", num_sge);
> -+        comp_handler(IBV_WC_GENERAL_ERR, VENDOR_ERR_NO_SGE, ctx);
> -         return;
> -     }
> -
> -@@ -390,9 +390,9 @@ void rdma_backend_post_recv(RdmaBackendDev *backend_=
dev,
> -     }
> -
> -     pr_dbg("num_sge=3D%d\n", num_sge);
> --    if (!num_sge) {
> --        pr_dbg("num_sge=3D0\n");
> --        comp_handler(IBV_WC_GENERAL_ERR, VENDOR_ERR_NO_SGE, ctx);
> -+    if (!num_sge || num_sge > MAX_SGE) {
> -+        pr_dbg("invalid num_sge=3D%d\n", num_sge);
> -+        comp_handler(IBV_WC_GENERAL_ERR, VENDOR_ERR_NO_SGE, ctx);
> -         return;
> -     }
> -
> ---
> -2.20.1
> -
> diff --git a/meta/recipes-devtools/qemu/qemu/0016-fix-CVE-2018-20125.patc=
h b/meta/recipes-devtools/qemu/qemu/0016-fix-CVE-2018-20125.patch
> deleted file mode 100644
> index 56559c8388..0000000000
> --- a/meta/recipes-devtools/qemu/qemu/0016-fix-CVE-2018-20125.patch
> +++ /dev/null
> @@ -1,54 +0,0 @@
> -CVE: CVE-2018-20125
> -Upstream-Status: Backport [https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit=
;h=3D2c858ce]
> -
> -Signed-off-by: Kai Kang <kai.kang@windriver.com>
> -
> -From 2c858ce5da8ae6689c75182b73bc455a291cad41 Mon Sep 17 00:00:00 2001
> -From: Prasad J Pandit <pjp@fedoraproject.org>
> -Date: Thu, 13 Dec 2018 01:00:36 +0530
> -Subject: [PATCH] pvrdma: check number of pages when creating rings
> -
> -When creating CQ/QP rings, an object can have up to
> -PVRDMA_MAX_FAST_REG_PAGES 8 pages. Check 'npages' parameter
> -to avoid excessive memory allocation or a null dereference.
> -
> -Reported-by: Li Qiang <liq3ea@163.com>
> -Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
> -Reviewed-by: Yuval Shaia <yuval.shaia@oracle.com>
> -Signed-off-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> ----
> - hw/rdma/vmw/pvrdma_cmd.c | 11 +++++++++++
> - 1 file changed, 11 insertions(+)
> -
> -diff --git a/hw/rdma/vmw/pvrdma_cmd.c b/hw/rdma/vmw/pvrdma_cmd.c
> -index 3b94545761..f236ac4795 100644
> ---- a/hw/rdma/vmw/pvrdma_cmd.c
> -+++ b/hw/rdma/vmw/pvrdma_cmd.c
> -@@ -259,6 +259,11 @@ static int create_cq_ring(PCIDevice *pci_dev , Pvrd=
maRing **ring,
> -     int rc =3D -EINVAL;
> -     char ring_name[MAX_RING_NAME_SZ];
> -
> -+    if (!nchunks || nchunks > PVRDMA_MAX_FAST_REG_PAGES) {
> -+        pr_dbg("invalid nchunks: %d\n", nchunks);
> -+        return rc;
> -+    }
> -+
> -     pr_dbg("pdir_dma=3D0x%llx\n", (long long unsigned int)pdir_dma);
> -     dir =3D rdma_pci_dma_map(pci_dev, pdir_dma, TARGET_PAGE_SIZE);
> -     if (!dir) {
> -@@ -372,6 +377,12 @@ static int create_qp_rings(PCIDevice *pci_dev, uint=
64_t pdir_dma,
> -     char ring_name[MAX_RING_NAME_SZ];
> -     uint32_t wqe_sz;
> -
> -+    if (!spages || spages > PVRDMA_MAX_FAST_REG_PAGES
> -+        || !rpages || rpages > PVRDMA_MAX_FAST_REG_PAGES) {
> -+        pr_dbg("invalid pages: %d, %d\n", spages, rpages);
> -+        return rc;
> -+    }
> -+
> -     pr_dbg("pdir_dma=3D0x%llx\n", (long long unsigned int)pdir_dma);
> -     dir =3D rdma_pci_dma_map(pci_dev, pdir_dma, TARGET_PAGE_SIZE);
> -     if (!dir) {
> ---
> -2.20.1
> -
> diff --git a/meta/recipes-devtools/qemu/qemu/0017-fix-CVE-2018-20126.patc=
h b/meta/recipes-devtools/qemu/qemu/0017-fix-CVE-2018-20126.patch
> deleted file mode 100644
> index 8329f2cfd0..0000000000
> --- a/meta/recipes-devtools/qemu/qemu/0017-fix-CVE-2018-20126.patch
> +++ /dev/null
> @@ -1,113 +0,0 @@
> -CVE: CVE-2018-20126
> -Upstream-Status: Backport [https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit=
;h=3D509f57c]
> -
> -Backport and rebase patch to fix CVE-2018-20126.
> -
> -Signed-off-by: Kai Kang <kai.kang@windriver.com>
> -
> -From 509f57c98e7536905bb4902363d0cba66ce7e089 Mon Sep 17 00:00:00 2001
> -From: Prasad J Pandit <pjp@fedoraproject.org>
> -Date: Thu, 13 Dec 2018 01:00:37 +0530
> -Subject: [PATCH] pvrdma: release ring object in case of an error
> -
> -create_cq and create_qp routines allocate ring object, but it's
> -not released in case of an error, leading to memory leakage.
> -
> -Reported-by: Li Qiang <liq3ea@163.com>
> -Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
> -Reviewed-by: Yuval Shaia <yuval.shaia@oracle.com>
> -Signed-off-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> ----
> - hw/rdma/vmw/pvrdma_cmd.c | 41 ++++++++++++++++++++++++++++++-----------
> - 1 file changed, 30 insertions(+), 11 deletions(-)
> -
> -diff --git a/hw/rdma/vmw/pvrdma_cmd.c b/hw/rdma/vmw/pvrdma_cmd.c
> -index 4faeb21..9b6796f 100644
> ---- a/hw/rdma/vmw/pvrdma_cmd.c
> -+++ b/hw/rdma/vmw/pvrdma_cmd.c
> -@@ -310,6 +310,14 @@ out:
> -     return rc;
> - }
> -
> -+static void destroy_cq_ring(PvrdmaRing *ring)
> -+{
> -+    pvrdma_ring_free(ring);
> -+    /* ring_state was in slot 1, not 0 so need to jump back */
> -+    rdma_pci_dma_unmap(ring->dev, --ring->ring_state, TARGET_PAGE_SIZE)=
;
> -+    g_free(ring);
> -+}
> -+
> - static int create_cq(PVRDMADev *dev, union pvrdma_cmd_req *req,
> -                      union pvrdma_cmd_resp *rsp)
> - {
> -@@ -333,6 +341,10 @@ static int create_cq(PVRDMADev *dev, union pvrdma_c=
md_req *req,
> -
> -     resp->hdr.err =3D rdma_rm_alloc_cq(&dev->rdma_dev_res, &dev->backen=
d_dev,
> -                                      cmd->cqe, &resp->cq_handle, ring);
> -+    if (resp->hdr.err) {
> -+        destroy_cq_ring(ring);
> -+    }
> -+
> -     resp->cqe =3D cmd->cqe;
> -
> - out:
> -@@ -356,10 +368,7 @@ static int destroy_cq(PVRDMADev *dev, union pvrdma_=
cmd_req *req,
> -     }
> -
> -     ring =3D (PvrdmaRing *)cq->opaque;
> --    pvrdma_ring_free(ring);
> --    /* ring_state was in slot 1, not 0 so need to jump back */
> --    rdma_pci_dma_unmap(PCI_DEVICE(dev), --ring->ring_state, TARGET_PAGE=
_SIZE);
> --    g_free(ring);
> -+    destroy_cq_ring(ring);
> -
> -     rdma_rm_dealloc_cq(&dev->rdma_dev_res, cmd->cq_handle);
> -
> -@@ -451,6 +460,17 @@ out:
> -     return rc;
> - }
> -
> -+static void destroy_qp_rings(PvrdmaRing *ring)
> -+{
> -+    pr_dbg("sring=3D%p\n", &ring[0]);
> -+    pvrdma_ring_free(&ring[0]);
> -+    pr_dbg("rring=3D%p\n", &ring[1]);
> -+    pvrdma_ring_free(&ring[1]);
> -+
> -+    rdma_pci_dma_unmap(ring->dev, ring->ring_state, TARGET_PAGE_SIZE);
> -+    g_free(ring);
> -+}
> -+
> - static int create_qp(PVRDMADev *dev, union pvrdma_cmd_req *req,
> -                      union pvrdma_cmd_resp *rsp)
> - {
> -@@ -482,6 +502,11 @@ static int create_qp(PVRDMADev *dev, union pvrdma_c=
md_req *req,
> -                                      cmd->max_recv_wr, cmd->max_recv_sg=
e,
> -                                      cmd->recv_cq_handle, rings, &resp-=
>qpn);
> -
> -+    if (resp->hdr.err) {
> -+        destroy_qp_rings(rings);
> -+        return resp->hdr.err;
> -+    }
> -+
> -     resp->max_send_wr =3D cmd->max_send_wr;
> -     resp->max_recv_wr =3D cmd->max_recv_wr;
> -     resp->max_send_sge =3D cmd->max_send_sge;
> -@@ -555,13 +580,7 @@ static int destroy_qp(PVRDMADev *dev, union pvrdma_=
cmd_req *req,
> -     rdma_rm_dealloc_qp(&dev->rdma_dev_res, cmd->qp_handle);
> -
> -     ring =3D (PvrdmaRing *)qp->opaque;
> --    pr_dbg("sring=3D%p\n", &ring[0]);
> --    pvrdma_ring_free(&ring[0]);
> --    pr_dbg("rring=3D%p\n", &ring[1]);
> --    pvrdma_ring_free(&ring[1]);
> --
> --    rdma_pci_dma_unmap(PCI_DEVICE(dev), ring->ring_state, TARGET_PAGE_S=
IZE);
> --    g_free(ring);
> -+    destroy_qp_rings(ring);
> -
> -     return 0;
> - }
> ---
> -2.20.1
> -
> diff --git a/meta/recipes-devtools/qemu/qemu/0018-fix-CVE-2018-20191.patc=
h b/meta/recipes-devtools/qemu/qemu/0018-fix-CVE-2018-20191.patch
> deleted file mode 100644
> index 8f8ff0567a..0000000000
> --- a/meta/recipes-devtools/qemu/qemu/0018-fix-CVE-2018-20191.patch
> +++ /dev/null
> @@ -1,47 +0,0 @@
> -CVE: CVE-2018-20191
> -Upstream-Status: Backport [https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit=
;h=3D2aa8645]
> -
> -Signed-off-by: Kai Kang <kai.kang@windriver.com>
> -
> -From 2aa86456fb938a11f2b7bd57c8643c213218681c Mon Sep 17 00:00:00 2001
> -From: Prasad J Pandit <pjp@fedoraproject.org>
> -Date: Thu, 13 Dec 2018 01:00:35 +0530
> -Subject: [PATCH] pvrdma: add uar_read routine
> -
> -Define skeleton 'uar_read' routine. Avoid NULL dereference.
> -
> -Reported-by: Li Qiang <liq3ea@163.com>
> -Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
> -Reviewed-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> -Signed-off-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> ----
> - hw/rdma/vmw/pvrdma_main.c | 6 ++++++
> - 1 file changed, 6 insertions(+)
> -
> -diff --git a/hw/rdma/vmw/pvrdma_main.c b/hw/rdma/vmw/pvrdma_main.c
> -index 64de16fb52..838ad8a949 100644
> ---- a/hw/rdma/vmw/pvrdma_main.c
> -+++ b/hw/rdma/vmw/pvrdma_main.c
> -@@ -448,6 +448,11 @@ static const MemoryRegionOps regs_ops =3D {
> -     },
> - };
> -
> -+static uint64_t uar_read(void *opaque, hwaddr addr, unsigned size)
> -+{
> -+    return 0xffffffff;
> -+}
> -+
> - static void uar_write(void *opaque, hwaddr addr, uint64_t val, unsigned=
 size)
> - {
> -     PVRDMADev *dev =3D opaque;
> -@@ -489,6 +494,7 @@ static void uar_write(void *opaque, hwaddr addr, uin=
t64_t val, unsigned size)
> - }
> -
> - static const MemoryRegionOps uar_ops =3D {
> -+    .read =3D uar_read,
> -     .write =3D uar_write,
> -     .endianness =3D DEVICE_LITTLE_ENDIAN,
> -     .impl =3D {
> ---
> -2.20.1
> -
> diff --git a/meta/recipes-devtools/qemu/qemu/0019-fix-CVE-2018-20216.patc=
h b/meta/recipes-devtools/qemu/qemu/0019-fix-CVE-2018-20216.patch
> deleted file mode 100644
> index c02bad3bb9..0000000000
> --- a/meta/recipes-devtools/qemu/qemu/0019-fix-CVE-2018-20216.patch
> +++ /dev/null
> @@ -1,85 +0,0 @@
> -CVE: CVE-2018-20216
> -Upstream-Status: Backport [https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit=
;h=3Df1e2e38]
> -
> -Signed-off-by: Kai Kang <kai.kang@windriver.com>
> -
> -From f1e2e38ee0136b7710a2caa347049818afd57a1b Mon Sep 17 00:00:00 2001
> -From: Prasad J Pandit <pjp@fedoraproject.org>
> -Date: Thu, 13 Dec 2018 01:00:39 +0530
> -Subject: [PATCH] pvrdma: check return value from pvrdma_idx_ring_has_ ro=
utines
> -
> -pvrdma_idx_ring_has_[data/space] routines also return invalid
> -index PVRDMA_INVALID_IDX[=3D-1], if ring has no data/space. Check
> -return value from these routines to avoid plausible infinite loops.
> -
> -Reported-by: Li Qiang <liq3ea@163.com>
> -Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
> -Reviewed-by: Yuval Shaia <yuval.shaia@oracle.com>
> -Signed-off-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> ----
> - hw/rdma/vmw/pvrdma_dev_ring.c | 29 +++++++++++------------------
> - 1 file changed, 11 insertions(+), 18 deletions(-)
> -
> -diff --git a/hw/rdma/vmw/pvrdma_dev_ring.c b/hw/rdma/vmw/pvrdma_dev_ring=
.c
> -index 01247fc041..e8e5b502f6 100644
> ---- a/hw/rdma/vmw/pvrdma_dev_ring.c
> -+++ b/hw/rdma/vmw/pvrdma_dev_ring.c
> -@@ -73,23 +73,16 @@ out:
> -
> - void *pvrdma_ring_next_elem_read(PvrdmaRing *ring)
> - {
> -+    int e;
> -     unsigned int idx =3D 0, offset;
> -
> --    /*
> --    pr_dbg("%s: t=3D%d, h=3D%d\n", ring->name, ring->ring_state->prod_t=
ail,
> --           ring->ring_state->cons_head);
> --    */
> --
> --    if (!pvrdma_idx_ring_has_data(ring->ring_state, ring->max_elems, &i=
dx)) {
> -+    e =3D pvrdma_idx_ring_has_data(ring->ring_state, ring->max_elems, &=
idx);
> -+    if (e <=3D 0) {
> -         pr_dbg("No more data in ring\n");
> -         return NULL;
> -     }
> -
> -     offset =3D idx * ring->elem_sz;
> --    /*
> --    pr_dbg("idx=3D%d\n", idx);
> --    pr_dbg("offset=3D%d\n", offset);
> --    */
> -     return ring->pages[offset / TARGET_PAGE_SIZE] + (offset % TARGET_PA=
GE_SIZE);
> - }
> -
> -@@ -105,20 +98,20 @@ void pvrdma_ring_read_inc(PvrdmaRing *ring)
> -
> - void *pvrdma_ring_next_elem_write(PvrdmaRing *ring)
> - {
> --    unsigned int idx, offset, tail;
> -+    int idx;
> -+    unsigned int offset, tail;
> -
> --    /*
> --    pr_dbg("%s: t=3D%d, h=3D%d\n", ring->name, ring->ring_state->prod_t=
ail,
> --           ring->ring_state->cons_head);
> --    */
> --
> --    if (!pvrdma_idx_ring_has_space(ring->ring_state, ring->max_elems, &=
tail)) {
> -+    idx =3D pvrdma_idx_ring_has_space(ring->ring_state, ring->max_elems=
, &tail);
> -+    if (idx <=3D 0) {
> -         pr_dbg("CQ is full\n");
> -         return NULL;
> -     }
> -
> -     idx =3D pvrdma_idx(&ring->ring_state->prod_tail, ring->max_elems);
> --    /* TODO: tail =3D=3D idx */
> -+    if (idx < 0 || tail !=3D idx) {
> -+        pr_dbg("invalid idx\n");
> -+        return NULL;
> -+    }
> -
> -     offset =3D idx * ring->elem_sz;
> -     return ring->pages[offset / TARGET_PAGE_SIZE] + (offset % TARGET_PA=
GE_SIZE);
> ---
> -2.20.1
> -
> diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2019-3812.patch b/meta/r=
ecipes-devtools/qemu/qemu/CVE-2019-3812.patch
> deleted file mode 100644
> index 7de5882b3e..0000000000
> --- a/meta/recipes-devtools/qemu/qemu/CVE-2019-3812.patch
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -QEMU, through version 2.10 and through version 3.1.0, is vulnerable to a=
n
> -out-of-bounds read of up to 128 bytes in the hw/i2c/i2c-ddc.c:i2c_ddc()
> -function. A local attacker with permission to execute i2c commands could=
 exploit
> -this to read stack memory of the qemu process on the host.
> -
> -CVE: CVE-2019-3812
> -Upstream-Status: Backport
> -Signed-off-by: Ross Burton <ross.burton@intel.com>
> -
> -From b05b267840515730dbf6753495d5b7bd8b04ad1c Mon Sep 17 00:00:00 2001
> -From: Gerd Hoffmann <kraxel@redhat.com>
> -Date: Tue, 8 Jan 2019 11:23:01 +0100
> -Subject: [PATCH] i2c-ddc: fix oob read
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -Suggested-by: Michael Hanselmann <public@hansmi.ch>
> -Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> -Reviewed-by: Michael Hanselmann <public@hansmi.ch>
> -Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> -Message-id: 20190108102301.1957-1-kraxel@redhat.com
> ----
> - hw/i2c/i2c-ddc.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/hw/i2c/i2c-ddc.c b/hw/i2c/i2c-ddc.c
> -index be34fe072cf..0a0367ff38f 100644
> ---- a/hw/i2c/i2c-ddc.c
> -+++ b/hw/i2c/i2c-ddc.c
> -@@ -56,7 +56,7 @@ static int i2c_ddc_rx(I2CSlave *i2c)
> -     I2CDDCState *s =3D I2CDDC(i2c);
> -
> -     int value;
> --    value =3D s->edid_blob[s->reg];
> -+    value =3D s->edid_blob[s->reg % sizeof(s->edid_blob)];
> -     s->reg++;
> -     return value;
> - }
> diff --git a/meta/recipes-devtools/qemu/qemu_3.1.0.bb b/meta/recipes-devt=
ools/qemu/qemu_4.0.0.bb
> similarity index 100%
> rename from meta/recipes-devtools/qemu/qemu_3.1.0.bb
> rename to meta/recipes-devtools/qemu/qemu_4.0.0.bb
> --
> 2.21.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

