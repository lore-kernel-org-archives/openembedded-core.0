Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
	[209.85.210.65])
	by mail.openembedded.org (Postfix) with ESMTP id B62FD7C87D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 13:37:30 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id 98so28349048oty.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 05:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=ONNRAyFATE12WIxc52MVABlH9eS0BQypoW7sZGHdqNo=;
	b=GplP26lz3Gpzijdfo4zxTcQEoygho1KGbAbrU07FeGeU9gF3y1nQZQP17IchJOYEmR
	2TYAI+TmtXLBhM77TKmj6qwqXDmlQAcdqhI0Ts+B7YIgyzMoltuM2bcrObLwi2QbJPcB
	hTDjFnAylCst6m2Lso1V6Sj94qz7aFd8pmmSUwxi+xb+aXaffdV+SRETtMkYDd/nv8s0
	tYJJWhHGic7g4owgFuoP6eTfoT0ggoPLs9SZYHmHxD1OKzPytH8BEkyeCD+jOtKQp8bh
	94vmmjHIC/4oGcPxzFye4Gl9TRopQLeqrIWlhH7cD1YBlGQKHc7eka45uF3yVrEzfCyt
	Q1Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=ONNRAyFATE12WIxc52MVABlH9eS0BQypoW7sZGHdqNo=;
	b=DhQfeV6pz6W5jFT9YHWcs5rBpZtNZtd/xhM0+QteS62qcZO7WjvbM66rufBEXvCj+N
	8xsvEv2gNikIUzFvBXuuWYgn/S8hOE46nTRK7J6SjZiTOXOUCqN14aU8oEFJPT2EP/6x
	ZwGxzJvHcnZ6gDBH1FShMr6sxDfU7AXWSbrAoE2XwVylHek+9rCN2CITV7GHvuez9Bij
	hCpZKRowzdf7aNOSpsdf0aoXVjrqbPeBNwTJkkXgcaYdzPvL/MHNdy+4gEFC+LjYl45O
	58ulEGtVDCyObbfiRNT1yrpFd611nZv6cuOfEhhovQh9N/DzF9Nl/WjWg7dqhL8vJ3TQ
	hF8w==
X-Gm-Message-State: AHQUAuYr4Tk+cl1hGheD8tEd3c3z661mtjiuUWkbMHDAjVGFJgIwohJr
	TnGLPSvstv8ABDFrb0ya+jU6PHst9xzeWCYfVo0=
X-Google-Smtp-Source: AHgI3IYuQCyyG1gn0lLOVoN/F5pRDEI9Jc/4f+VjrqmALI9oCbAv2wq1q3xJLrIi3H/b1h6kpBrblaXqXtKKlJEPMi0=
X-Received: by 2002:aca:6206:: with SMTP id w6mr14618942oib.132.1550497051387; 
	Mon, 18 Feb 2019 05:37:31 -0800 (PST)
MIME-Version: 1.0
References: <20190218133231.27989-1-fabio.berton@ossystems.com.br>
In-Reply-To: <20190218133231.27989-1-fabio.berton@ossystems.com.br>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 18 Feb 2019 14:37:19 +0100
Message-ID: <CANNYZj8Ec+uNYjDedY4yZNw6CSNWUcE4wdxYKz4n5yFJx5DtUw@mail.gmail.com>
To: Fabio Berton <fabio.berton@ossystems.com.br>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH] mesa: Convert recipe to use meson build system
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
X-List-Received-Date: Mon, 18 Feb 2019 13:37:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The commits look good, the only comment I have is that in meson
conversion you remove the patches from SRC_URI, but not delete the
actual files.

Alex

On Mon, 18 Feb 2019 at 14:32, Fabio Berton
<fabio.berton@ossystems.com.br> wrote:
>
>   - Remove all non related meson patches
>
> Based on https://patchwork.openembedded.org/patch/158748/
>
> Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
> ---
>  ...sing-include-stddef.h-in-egldevice.h.patch | 49 +++++++++++++++++
>  ...k-for-all-linux-host_os-combinations.patch | 50 +++++++++++++++++
>  meta/recipes-graphics/mesa/mesa.inc           | 54 +++++++++----------
>  meta/recipes-graphics/mesa/mesa_18.3.3.bb     |  7 +--
>  4 files changed, 126 insertions(+), 34 deletions(-)
>  create mode 100644 meta/recipes-graphics/mesa/files/0001-egl-add-missing=
-include-stddef.h-in-egldevice.h.patch
>  create mode 100644 meta/recipes-graphics/mesa/files/0002-meson.build-che=
ck-for-all-linux-host_os-combinations.patch
>
> diff --git a/meta/recipes-graphics/mesa/files/0001-egl-add-missing-includ=
e-stddef.h-in-egldevice.h.patch b/meta/recipes-graphics/mesa/files/0001-egl=
-add-missing-include-stddef.h-in-egldevice.h.patch
> new file mode 100644
> index 0000000000..08d128e919
> --- /dev/null
> +++ b/meta/recipes-graphics/mesa/files/0001-egl-add-missing-include-stdde=
f.h-in-egldevice.h.patch
> @@ -0,0 +1,49 @@
> +From d2d5acdcb10465c024c8b0931d49e49660210d2c Mon Sep 17 00:00:00 2001
> +From: Gurchetan Singh <gurchetansingh@chromium.org>
> +Date: Wed, 28 Nov 2018 08:39:34 -0800
> +Subject: [PATCH 1/2] egl: add missing #include <stddef.h> in egldevice.h
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +Organization: O.S. Systems Software LTDA.
> +
> +Otherwise, I get this error:
> +
> +main/egldevice.h:54:13: error: =E2=80=98NULL=E2=80=99 undeclared (first =
use in this function)
> +       dev =3D NULL;
> +             ^~~~
> +with this config:
> +
> +./autogen.sh --enable-gles1 --enable-gles2 --with-platforms=3D'surfacele=
ss' --disable-glx
> +             --with-dri-drivers=3D"i965" --with-gallium-drivers=3D"" --e=
nable-gbm
> +
> +v3: Use stddef.h (Matt)
> +v4: Modify commit message (Eric)
> +
> +Reviewed-by: Matt Turner <mattst88@gmail.com>
> +Reviewed-by: Eric Engestrom <eric.engestrom@intel.com>
> +
> +Upstream-Status: Backport [https://cgit.freedesktop.org/mesa/mesa/commit=
/?id=3Deb44c36cf1729e7e200b77cf8ea755dff72d1639]
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +---
> + src/egl/main/egldevice.h | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/egl/main/egldevice.h b/src/egl/main/egldevice.h
> +index ddcdcd17f5a..83a47d5eacc 100644
> +--- a/src/egl/main/egldevice.h
> ++++ b/src/egl/main/egldevice.h
> +@@ -31,9 +31,9 @@
> +
> +
> + #include <stdbool.h>
> ++#include <stddef.h>
> + #include "egltypedefs.h"
> +
> +-
> + #ifdef __cplusplus
> + extern "C" {
> + #endif
> +--
> +2.20.1
> +
> diff --git a/meta/recipes-graphics/mesa/files/0002-meson.build-check-for-=
all-linux-host_os-combinations.patch b/meta/recipes-graphics/mesa/files/000=
2-meson.build-check-for-all-linux-host_os-combinations.patch
> new file mode 100644
> index 0000000000..f4650adf0f
> --- /dev/null
> +++ b/meta/recipes-graphics/mesa/files/0002-meson.build-check-for-all-lin=
ux-host_os-combinations.patch
> @@ -0,0 +1,50 @@
> +From a4f6630f4563c2f3f619003706f541c380b49027 Mon Sep 17 00:00:00 2001
> +From: Anuj Mittal <anuj.mittal@intel.com>
> +Date: Mon, 11 Feb 2019 20:55:27 +0800
> +Subject: [PATCH 2/2] meson.build: check for all linux host_os combinatio=
ns
> +Organization: O.S. Systems Software LTDA.
> +
> +Make sure that we are also looking for our host_os combinations like
> +linux-musl etc. when assuming support for DRM/KMS.
> +
> +Also delete a duplicate line.
> +
> +Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> +---
> + meson.build | 6 ++----
> + 1 file changed, 2 insertions(+), 4 deletions(-)
> +
> +diff --git a/meson.build b/meson.build
> +index f11c556d359..e5f9b8a24be 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -34,7 +34,7 @@ cpp =3D meson.get_compiler('cpp')
> +
> + null_dep =3D dependency('', required : false)
> +
> +-system_has_kms_drm =3D ['openbsd', 'netbsd', 'freebsd', 'dragonfly', 'l=
inux'].contains(host_machine.system())
> ++system_has_kms_drm =3D ['openbsd', 'netbsd', 'freebsd', 'dragonfly'].co=
ntains(host_machine.system()) or host_machine.system().startswith('linux')
> +
> + # Arguments for the preprocessor, put these in a separate array from th=
e C and
> + # C++ (cpp in meson terminology) arguments since they need to be added =
to the
> +@@ -92,8 +92,6 @@ if (with_gles1 or with_gles2) and not with_opengl
> +   error('building OpenGL ES without OpenGL is not supported.')
> + endif
> +
> +-system_has_kms_drm =3D ['openbsd', 'netbsd', 'freebsd', 'dragonfly', 'l=
inux'].contains(host_machine.system())
> +-
> + _drivers =3D get_option('dri-drivers')
> + if _drivers.contains('auto')
> +   if system_has_kms_drm
> +@@ -799,7 +797,7 @@ if cc.compiles('int foo(void) __attribute__((__noret=
urn__));',
> + endif
> +
> + # TODO: this is very incomplete
> +-if ['linux', 'cygwin', 'gnu'].contains(host_machine.system())
> ++if ['cygwin', 'gnu'].contains(host_machine.system()) or host_machine.sy=
stem().startswith('linux')
> +   pre_args +=3D '-D_GNU_SOURCE'
> + endif
> +
> +--
> +2.20.1
> +
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
> index 233de8eb27..128dd80295 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -14,7 +14,7 @@ LIC_FILES_CHKSUM =3D "file://docs/license.html;md5=3D72=
5f991a1cc322aa7a0cd3a2016621c
>
>  PE =3D "2"
>
> -DEPENDS =3D "expat makedepend-native flex-native bison-native libxml2-na=
tive zlib chrpath-replacement-native"
> +DEPENDS =3D "expat makedepend-native flex-native bison-native libxml2-na=
tive zlib chrpath-replacement-native python3-mako-native gettext-native"
>  EXTRANATIVEPATH +=3D "chrpath-native"
>  PROVIDES =3D " \
>      ${@bb.utils.contains('PACKAGECONFIG', 'opengl', 'virtual/libgl', '',=
 d)} \
> @@ -24,7 +24,7 @@ PROVIDES =3D " \
>      virtual/mesa \
>      "
>
> -inherit autotools pkgconfig python3native gettext distro_features_check
> +inherit meson pkgconfig python3native gettext distro_features_check
>
>  BBCLASSEXTEND =3D "native nativesdk"
>
> @@ -34,15 +34,14 @@ PLATFORMS ??=3D "${@bb.utils.filter('PACKAGECONFIG', =
'x11 wayland', d)} \
>                 ${@bb.utils.contains('PACKAGECONFIG', 'gbm', 'drm', '', d=
)} \
>                 surfaceless"
>
> -export LLVM_CONFIG =3D "${STAGING_BINDIR_NATIVE}/llvm-config${MESA_LLVM_=
RELEASE}"
>  export YOCTO_ALTERNATE_EXE_PATH =3D "${STAGING_LIBDIR}/llvm${MESA_LLVM_R=
ELEASE}/llvm-config"
>  export YOCTO_ALTERNATE_MULTILIB_NAME =3D "${base_libdir}"
> -EXTRA_OECONF =3D "--enable-shared-glapi \
> -                --disable-opencl \
> -                --enable-glx-read-only-text \
> -                PYTHON2=3Dpython2 \
> -                --with-llvm-prefix=3D${STAGING_LIBDIR}/llvm${MESA_LLVM_R=
ELEASE} \
> -                --with-platforms=3D'${PLATFORMS}'"
> +EXTRA_OEMESON =3D " \
> +    -Dshared-glapi=3Dtrue \
> +    -Dgallium-opencl=3Ddisabled \
> +    -Dglx-read-only-text=3Dtrue \
> +    -Dplatforms=3D'${@",".join("${PLATFORMS}".split())}' \
> +"
>
>  PACKAGECONFIG_class-target ??=3D "${@bb.utils.filter('DISTRO_FEATURES', =
'wayland vulkan', d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'op=
engl egl gles gbm dri gallium', '', d)} \
> @@ -53,12 +52,12 @@ PACKAGECONFIG_class-native ?=3D "gbm dri egl opengl"
>  PACKAGECONFIG_class-nativesdk ?=3D "gbm dri egl opengl"
>
>  # "gbm" requires "dri", "opengl"
> -PACKAGECONFIG[gbm] =3D "--enable-gbm,--disable-gbm"
> +PACKAGECONFIG[gbm] =3D "-Dgbm=3Dtrue,-Dgbm=3Dfalse"
>
>  X11_DEPS =3D "xorgproto virtual/libx11 libxext libxxf86vm libxdamage lib=
xfixes"
>  # "x11" requires "opengl"
> -PACKAGECONFIG[x11] =3D "--enable-glx-tls,--disable-glx,${X11_DEPS}"
> -PACKAGECONFIG[xvmc] =3D "--enable-xvmc,--disable-xvmc,libxvmc"
> +PACKAGECONFIG[x11] =3D ",-Dglx=3Ddisabled,${X11_DEPS}"
> +PACKAGECONFIG[xvmc] =3D "-gallium-xvmc=3Dtrue,-Dgallium-xvmc=3Dfalse,lib=
xvmc"
>  PACKAGECONFIG[wayland] =3D ",,wayland-native wayland libdrm wayland-prot=
ocols"
>
>  DRIDRIVERS_class-native =3D "swrast"
> @@ -66,23 +65,23 @@ DRIDRIVERS_class-nativesdk =3D "swrast"
>  DRIDRIVERS_append_x86_class-target =3D ",r100,r200,nouveau,i965,i915"
>  DRIDRIVERS_append_x86-64_class-target =3D ",r100,r200,nouveau,i965,i915"
>  # "dri" requires "opengl"
> -PACKAGECONFIG[dri] =3D "--enable-dri --with-dri-drivers=3D${DRIDRIVERS},=
 --disable-dri, xorgproto libdrm"
> -PACKAGECONFIG[dri3] =3D "--enable-dri3, --disable-dri3, xorgproto libxsh=
mfence"
> +PACKAGECONFIG[dri] =3D "-Ddri-drivers=3D${DRIDRIVERS}, -Ddri-drivers=3D'=
', xorgproto libdrm"
> +PACKAGECONFIG[dri3] =3D "-Ddri3=3Dtrue, -Ddri3=3Dfalse, xorgproto libxsh=
mfence"
>
>  # Vulkan drivers need dri3 enabled
>  # radeon could be enabled as well but requires gallium-llvm with llvm >=
=3D 3.9
>  VULKAN_DRIVERS =3D ""
>  VULKAN_DRIVERS_append_x86_class-target =3D ",intel"
>  VULKAN_DRIVERS_append_x86-64_class-target =3D ",intel"
> -PACKAGECONFIG[vulkan] =3D "--with-vulkan-drivers=3D${VULKAN_DRIVERS}, --=
without-vulkan-drivers, python3-mako-native"
> +PACKAGECONFIG[vulkan] =3D "-Dvulkan-drivers=3D${VULKAN_DRIVERS}, -Dvulka=
n-drivers=3D'',"
>
> -PACKAGECONFIG[opengl] =3D "--enable-opengl, --disable-opengl"
> +PACKAGECONFIG[opengl] =3D "-Dopengl=3Dtrue, -Dopengl=3Dfalse"
>
>  # "gles" requires "opengl"
> -PACKAGECONFIG[gles] =3D "--enable-gles1 --enable-gles2, --disable-gles1 =
--disable-gles2"
> +PACKAGECONFIG[gles] =3D "-Dgles1=3Dtrue -Dgles2=3Dtrue, -Dgles1=3Dfalse =
-Dgles2=3Dfalse"
>
>  # "egl" requires "dri", "opengl"
> -PACKAGECONFIG[egl] =3D "--enable-egl, --disable-egl"
> +PACKAGECONFIG[egl] =3D "-Degl=3Dtrue, -Degl=3Dfalse"
>
>  PACKAGECONFIG[etnaviv] =3D ""
>  PACKAGECONFIG[imx] =3D ""
> @@ -103,27 +102,25 @@ GALLIUMDRIVERS_append =3D "${@bb.utils.contains('PA=
CKAGECONFIG', 'r600', ',r600',
>  GALLIUMDRIVERS_append =3D ",virgl"
>
>  # keep --with-gallium-drivers separate, because when only one of gallium=
 versions is enabled, other 2 were adding --without-gallium-drivers
> -PACKAGECONFIG[gallium] =3D "--with-gallium-drivers=3D${GALLIUMDRIVERS}, =
--without-gallium-drivers"
> +PACKAGECONFIG[gallium] =3D "-Dgallium-drivers=3D${GALLIUMDRIVERS}, -Dgal=
lium-drivers=3D''"
>  MESA_LLVM_RELEASE ?=3D "8.0"
> -PACKAGECONFIG[gallium-llvm] =3D "--enable-llvm --enable-llvm-shared-libs=
, --disable-llvm, llvm${MESA_LLVM_RELEASE} llvm-native \
> +PACKAGECONFIG[gallium-llvm] =3D "-Dllvm=3Dtrue -Dshared-llvm=3Dtrue, -Dl=
lvm=3Dfalse, llvm${MESA_LLVM_RELEASE} llvm-native \
>                                 ${@'elfutils' if ${GALLIUMDRIVERS_LLVM33_=
ENABLED} else ''}"
>  export WANT_LLVM_RELEASE =3D "${MESA_LLVM_RELEASE}"
> -PACKAGECONFIG[xa]  =3D "--enable-xa, --disable-xa"
> +PACKAGECONFIG[xa]  =3D "-Dgallium-xa=3Dtrue, -Dgallium-xa=3Dfalse"
>
> -OSMESA =3D "${@bb.utils.contains('PACKAGECONFIG', 'gallium', 'gallium-os=
mesa', 'osmesa', d)}"
> -PACKAGECONFIG[osmesa] =3D "--enable-${OSMESA},--disable-${OSMESA}"
> +OSMESA =3D "${@bb.utils.contains('PACKAGECONFIG', 'gallium', 'gallium', =
'classic', d)}"
> +PACKAGECONFIG[osmesa] =3D "-Dosmesa=3D${OSMESA},-Dosmesa=3Dnone"
>
> -PACKAGECONFIG[unwind] =3D "--enable-libunwind,--disable-libunwind,libunw=
ind"
> +PACKAGECONFIG[unwind] =3D "-Dlibunwind=3Dtrue,-Dlibunwind=3Dfalse,libunw=
ind"
>
> -EXTRA_OECONF_remove_libc-musl =3D "--enable-glx-tls"
> -EXTRA_OECONF_append_libc-musl =3D " --disable-glx-tls"
> -EXTRA_OECONF_append_libc-musl_x86 =3D " --disable-asm"
> +# mesa tries to run cross-built gen_matypes on build machine to get stru=
ct size information
> +EXTRA_OEMESON_append =3D " -Dasm=3Dfalse"
>
>  # llvmpipe is slow if compiled with -fomit-frame-pointer (e.g. -O2)
>  FULL_OPTIMIZATION_append =3D " -fno-omit-frame-pointer"
>
>  CFLAGS_append_armv5 =3D " -DMISSING_64BIT_ATOMICS"
> -EXTRA_OEMAKE +=3D "WAYLAND_PROTOCOLS_DATADIR=3D${STAGING_DATADIR}/waylan=
d-protocols"
>
>  # Remove the mesa dependency on mesa-dev, as mesa is empty
>  RDEPENDS_${PN}-dev =3D ""
> @@ -157,7 +154,6 @@ do_install_append () {
>      # libwayland-egl has been moved to wayland 1.15+
>      rm -f ${D}${libdir}/libwayland-egl*
>      rm -f ${D}${libdir}/pkgconfig/wayland-egl.pc
> -    rmdir --ignore-fail-on-non-empty ${D}${libdir}/pkgconfig
>  }
>
>  # For the packages that make up the OpenGL interfaces, inject variables =
so that
> diff --git a/meta/recipes-graphics/mesa/mesa_18.3.3.bb b/meta/recipes-gra=
phics/mesa/mesa_18.3.3.bb
> index fac175aaed..f58aa2a55f 100644
> --- a/meta/recipes-graphics/mesa/mesa_18.3.3.bb
> +++ b/meta/recipes-graphics/mesa/mesa_18.3.3.bb
> @@ -1,11 +1,8 @@
>  require ${BPN}.inc
>
>  SRC_URI =3D "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
> -           file://0001-Simplify-wayland-scanner-lookup.patch \
> -           file://0002-winsys-svga-drm-Include-sys-types.h.patch \
> -           file://0003-Properly-get-LLVM-version-when-using-LLVM-Git-rel=
eas.patch \
> -           file://0004-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_=
DAT.patch \
> -           file://0005-egl-add-missing-include-stddef.h-in-egldevice.h.p=
atch \
> +           file://0001-egl-add-missing-include-stddef.h-in-egldevice.h.p=
atch \
> +           file://0002-meson.build-check-for-all-linux-host_os-combinati=
ons.patch \
>  "
>
>  SRC_URI[md5sum] =3D "e9d1a24dbd5ca20efa75b9a29eb4566f"
> --
> 2.20.1
>

