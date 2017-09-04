Return-Path: <gizero@gmail.com>
Received: from mail-ua0-f194.google.com (mail-ua0-f194.google.com
	[209.85.217.194])
	by mail.openembedded.org (Postfix) with ESMTP id B246E601F2
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Sep 2017 07:49:34 +0000 (UTC)
Received: by mail-ua0-f194.google.com with SMTP id s15so1953473uag.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Sep 2017 00:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Ec3YtX+TZlSoZ5ptHUUhHFp4kz5P5kP7OYEnmc4NtMw=;
	b=K00ZcYR8pmZ5eGiwEum0+2W2lOvs9SerYb/yaKf1c8ObJRvi3TLedOSqTHV3+VWMTg
	/Vvepd9g7ixgcWU7bz67gOo6zfA4yi35n/9iMIjidmvPdBpbS9b+x7bryt/uyibvpkMb
	hVi2/pdiEp98WSZa6veme58H0I/cOAG/ng0QidRa2W8MUQ0F5FgRFiiglshUhlscyNfK
	D666mTauGDYq4fBhaUinoBHo9iL1r6jznZCbse60NCsG+lK277nDG3HG91L0Ryx6Idhu
	Y9P28Brma+u0kGdHinHFPHOzLUOGPPxyeDpPXiISb9gBZcuKPWEc2y+tvKdLmqU8m+Px
	hxYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Ec3YtX+TZlSoZ5ptHUUhHFp4kz5P5kP7OYEnmc4NtMw=;
	b=HmP+YucyYfxDYIrbuOpjK4vtBgZwGV+7vMWPsRNX0ISyRPUtulw751I6CbjquTVA5Z
	gydh/UD4iWZpbdCnYuO21E4QLUiXLlZFc9TVtUIiS2ku0AB6Oa3qnbxUvE4A22tbYJXK
	ar01vXmumoOULmPDZDQtatcY2+yPiP57tAwuZdq6DJcETjtj3+ZlzvPYmld44SJ9+1Cy
	LN+h6YDCBqZPJ4XikLyIRmHTffRWJy+UIL9cEtKVdYT3gnNViPy7EHIhQREKxcknBpyq
	NvWZ0MafO5idfQH+6560+nElUMuz/UUTPlSeanG9DXIktXMCOTcCf6LJbXANEE1+NceA
	lE6A==
X-Gm-Message-State: AHPjjUgrmxi54oLRPZm558uuCTFA2StjngjyBS2F6+fCx9A3WWSzt5Hq
	rKaHk3gFrPzFX4/clhgP5FxrrjBAaw==
X-Google-Smtp-Source: ADKCNb5E8eMliXrz+e0eH2n/JUJdYEq1xjf3uM9iBqczPbEILNtiK6rdCxievn/3ATDeVxJd2jEVmufgMy3iF0W83Eg=
X-Received: by 10.159.35.119 with SMTP id 110mr3017027uae.168.1504511374382;
	Mon, 04 Sep 2017 00:49:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.93.42 with HTTP; Mon, 4 Sep 2017 00:49:33 -0700 (PDT)
In-Reply-To: <38789a200c02167a293e7b7d51e0f2ac0ce0da21.1503923683.git.jussi.kukkonen@intel.com>
References: <cover.1503923683.git.jussi.kukkonen@intel.com>
	<38789a200c02167a293e7b7d51e0f2ac0ce0da21.1503923683.git.jussi.kukkonen@intel.com>
From: Andrea Galbusera <gizero@gmail.com>
Date: Mon, 4 Sep 2017 09:49:33 +0200
Message-ID: <CAC+thW1+RRE8E6KguaGXhs=Hi+P6mp3X++nNYAs-U4S13TL7yQ@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] mesa: Support building without opengl
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
X-List-Received-Date: Mon, 04 Sep 2017 07:49:35 -0000
Content-Type: multipart/alternative; boundary="001a113e1f5807dc980558585a1d"

--001a113e1f5807dc980558585a1d
Content-Type: text/plain; charset="UTF-8"

Hi,

On Mon, Aug 28, 2017 at 2:46 PM, Jussi Kukkonen <jussi.kukkonen@intel.com>
wrote:

> mesa can build certain things without opengl: most importantly vulkan
> drivers.
>
> Add comments on the dependencies between the packageconfigs. Also add
> a few dependencies to packageconfigs. Modify default packageconfig to
> do the reasonable thing based on distro features.
>
> Add a backported patch to fix the build with --disable-opengl. Fix
> do_install_append() so it works even if dri drivers are not built.
>
> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> ---
>  .../0001-configure.ac-Always-check-for-expat.patch | 51
> ++++++++++++++++++++++
>  meta/recipes-graphics/mesa/mesa.inc                | 23 +++++++---
>  meta/recipes-graphics/mesa/mesa_17.1.7.bb          |  1 +
>  3 files changed, 68 insertions(+), 7 deletions(-)
>  create mode 100644 meta/recipes-graphics/mesa/files/0001-configure.ac-
> Always-check-for-expat.patch
>
> diff --git a/meta/recipes-graphics/mesa/files/0001-configure.ac-Always-check-for-expat.patch
> b/meta/recipes-graphics/mesa/files/0001-configure.ac-
> Always-check-for-expat.patch
> new file mode 100644
> index 0000000..4753c49
> --- /dev/null
> +++ b/meta/recipes-graphics/mesa/files/0001-configure.ac-
> Always-check-for-expat.patch
> @@ -0,0 +1,51 @@
> +From 1f7d752193f02d15d5923cee992e8f46d4c6df1b Mon Sep 17 00:00:00 2001
> +From: Jussi Kukkonen <jussi.kukkonen@intel.com>
> +Date: Mon, 28 Aug 2017 13:51:49 +0300
> +Subject: [PATCH] configure.ac: Always check for expat
> +
> +expat was not checked if dri was not built leading to build failure
> +in vulkan driver: backport a fix (a combination of multiple commits
> +that should end up in 17.3).
> +
> +Upstream-Status: Backport
> +Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> +---
> + configure.ac | 15 ++++++---------
> + 1 file changed, 6 insertions(+), 9 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index fd346c8aa2..662faecefa 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -1777,6 +1777,12 @@ if test "x$with_dri_drivers" = xno; then
> +     with_dri_drivers=''
> + fi
> +
> ++# Check for expat
> ++PKG_CHECK_MODULES([EXPAT], [expat])
> ++PKG_CHECK_MODULES([EXPAT], [expat],,
> ++    [PKG_CHECK_MODULES([EXPAT], [expat21])]
> ++)
> ++
> + dnl If $with_dri_drivers is yes, drivers will be added through
> + dnl platform checks. Set DEFINES and LIB_DEPS
> + if test "x$enable_dri" = xyes; then
> +@@ -1810,15 +1816,6 @@ if test "x$enable_dri" = xyes; then
> +         with_dri_drivers="i915 i965 nouveau r200 radeon swrast"
> +     fi
> +
> +-    # Check for expat
> +-    PKG_CHECK_MODULES([EXPAT], [expat], [],
> +-        # expat version 2.0 and earlier do not provide expat.pc
> +-        [AC_CHECK_HEADER([expat.h],[],
> +-                         [AC_MSG_ERROR([Expat headers required for DRI
> not found])])
> +-         AC_CHECK_LIB([expat],[XML_ParserCreate],[],
> +-                     [AC_MSG_ERROR([Expat library required for DRI not
> found])])
> +-         EXPAT_LIBS="-lexpat"])
> +-
> +     # put all the necessary libs together
> +     DRI_LIB_DEPS="$DRI_LIB_DEPS $SELINUX_LIBS $LIBDRM_LIBS $EXPAT_LIBS
> -lm $PTHREAD_LIBS $DLOPEN_LIBS"
> + fi
> +--
> +2.14.1
> +
> diff --git a/meta/recipes-graphics/mesa/mesa.inc
> b/meta/recipes-graphics/mesa/mesa.inc
> index 3bb3cf4..4f31ed2 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -20,7 +20,7 @@ PROVIDES = "virtual/libgl virtual/libgles1
> virtual/libgles2 virtual/egl virtual/
>
>  inherit autotools pkgconfig gettext distro_features_check
>
> -REQUIRED_DISTRO_FEATURES = "opengl"
> +ANY_OF_DISTRO_FEATURES = "opengl vulkan"
>
>  PLATFORMS ??= "${@bb.utils.filter('PACKAGECONFIG', 'x11 wayland', d)} \
>                 ${@bb.utils.contains('PACKAGECONFIG', 'gbm', 'drm', '',
> d)}"
> @@ -32,20 +32,25 @@ EXTRA_OECONF = "--enable-shared-glapi \
>                  --with-llvm-prefix=${STAGING_LIBDIR}/llvm${MESA_LLVM_RELEASE}
> \
>                  --with-platforms='${PLATFORMS}'"
>
> -PACKAGECONFIG ??= "gbm egl gles dri \
> -               ${@bb.utils.filter('DISTRO_FEATURES', 'wayland x11
> vulkan', d)} \
> -               ${@bb.utils.contains('DISTRO_FEATURES', 'x11 vulkan',
> 'dri3', '', d)} \
> -               "
> +PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland
> vulkan', d)} \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'opengl',
> 'opengl egl gles gbm dri', '', d)} \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl',
> 'x11', '', d)} \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11 vulkan',
> 'dri3', '', d)} \
> +                  "
> +
> +# "gbm" requires "dri", "opengl"
>  PACKAGECONFIG[gbm] = "--enable-gbm,--disable-gbm"
>
>  X11_DEPS = "xf86driproto glproto virtual/libx11 libxext libxxf86vm
> libxdamage libxfixes"
> +# "x11" requires "opengl"
>  PACKAGECONFIG[x11] = "--enable-glx-tls,--disable-glx,${X11_DEPS}"
>  PACKAGECONFIG[xvmc] = "--enable-xvmc,--disable-xvmc,libxvmc"
> -PACKAGECONFIG[wayland] = ",,wayland-native wayland"
> +PACKAGECONFIG[wayland] = ",,wayland-native wayland libdrm"
>
>  DRIDRIVERS = "swrast"
>  DRIDRIVERS_append_x86 = ",radeon,r200,nouveau,i965,i915"
>  DRIDRIVERS_append_x86-64 = ",radeon,r200,nouveau,i965,i915"
> +# "dri" requires "opengl"
>  PACKAGECONFIG[dri] = "--enable-dri --with-dri-drivers=${DRIDRIVERS},
> --disable-dri, dri2proto libdrm"
>  PACKAGECONFIG[dri3] = "--enable-dri3, --disable-dri3, dri3proto
> presentproto libxshmfence"
>
> @@ -56,8 +61,12 @@ VULKAN_DRIVERS_append_x86 = ",intel"
>  VULKAN_DRIVERS_append_x86-64 = ",intel"
>  PACKAGECONFIG[vulkan] = "--with-vulkan-drivers=${VULKAN_DRIVERS},
> --without-vulkan-drivers"
>
> +PACKAGECONFIG[opengl] = "--enable-opengl, --disable-opengl"
> +
> +# "gles" requires "opengl"
>  PACKAGECONFIG[gles] = "--enable-gles1 --enable-gles2, --disable-gles1
> --disable-gles2"
>
> +# "egl" requires "dri", "opengl"
>  PACKAGECONFIG[egl] = "--enable-egl, --disable-egl"
>
>  PACKAGECONFIG[etnaviv] = ""
> @@ -121,7 +130,7 @@ do_install_append () {
>
>      # it was packaged in libdricore9.1.3-1 and preventing upgrades when
> debian.bbclass was used
>      rm -f ${D}${sysconfdir}/drirc
> -    chrpath --delete ${D}${libdir}/dri/*_dri.so
> +    chrpath --delete ${D}${libdir}/dri/*_dri.so || true
>  }
>
>  # For the packages that make up the OpenGL interfaces, inject variables
> so that
> diff --git a/meta/recipes-graphics/mesa/mesa_17.1.7.bb
> b/meta/recipes-graphics/mesa/mesa_17.1.7.bb
> index 494cdc6..a50f32c 100644
> --- a/meta/recipes-graphics/mesa/mesa_17.1.7.bb
> +++ b/meta/recipes-graphics/mesa/mesa_17.1.7.bb
> @@ -10,6 +10,7 @@ SRC_URI = "https://mesa.freedesktop.org/
> archive/mesa-${PV}.tar.xz \
>             file://0001-ac-fix-build-after-LLVM-5.0-SVN-r300718.patch \
>             file://0002-gallivm-Fix-build-against-LLVM-SVN-r302589.patch \
>             file://0001-winsys-svga-drm-Include-sys-types.h.patch \
> +           file://0001-configure.ac-Always-check-for-expat.patch \
>             "
>  SRC_URI[md5sum] = "e40bb428a263bd28cbf6478dae45b207"
>  SRC_URI[sha256sum] = "69f472a874b1122404fa0bd13e2d6b
> f87eb3b9ad9c21d2f39872a96d83d9e5f5"
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

It appear that this patch has broken the build for mesa-gl on
MACHINE=raspberrypi3 with the following error on do_configure:

ERROR: mesa-gl-2_17.1.7-r0 do_configure: configure failed
ERROR: mesa-gl-2_17.1.7-r0 do_configure: Function failed: do_configure (log
file is located at
/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/mesa-gl
/2_17.1.7-r0/temp/log.do_configure.1391)
ERROR: Logfile of failure stored in:
/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/temp/log.do_configure.1391
Log data follows:
| DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common', 'arm-32',
'common-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi', 'common']
| DEBUG: Executing shell function autotools_preconfigure
| DEBUG: Shell function autotools_preconfigure finished
| DEBUG: Executing python function autotools_aclocals
| DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common', 'arm-32',
'common-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi', 'common']
| DEBUG: Python function autotools_aclocals finished
| DEBUG: Executing shell function do_configure
| automake (GNU automake) 1.15.1
| Copyright (C) 2017 Free Software Foundation, Inc.
| License GPLv2+: GNU GPL version 2 or later <
http://gnu.org/licenses/gpl-2.0.html>
| This is free software: you are free to change and redistribute it.
| There is NO WARRANTY, to the extent permitted by law.
|
| Written by Tom Tromey <tromey@redhat.com>
|        and Alexandre Duret-Lutz <adl@gnu.org>.
| AUTOV is 1.15
| NOTE: Executing ACLOCAL="aclocal
--system-acdir=/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot/usr/share/aclocal
/
--automake-acdir=/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot-native/usr/share/aclocal-1.15"
autoreconf --verb
ose --install --force --exclude=autopoint -I
/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/mesa-17.1.7/m4/
-I /home/gizero/work/
smartliving/distro/repo-master/build-poky/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot-native/usr/share/aclocal/
| autoreconf: Entering directory `.'
| autoreconf: configure.ac: not using Gettext
| autoreconf: running: aclocal
--system-acdir=/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot/usr/share/aclocal/
--
automake-acdir=/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot-native/usr/share/aclocal-1.15
-I /home/gizero/work/s
martliving/distro/repo-master/build-poky/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/mesa-17.1.7/m4/
-I
/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/work/cortexa7hf-ne
on-vfpv4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot-native/usr/share/aclocal/
--force -I m4
| autoreconf: configure.ac: tracing
| autoreconf: running: libtoolize --copy --force
| libtoolize: putting auxiliary files in AC_CONFIG_AUX_DIR, 'bin'.
| libtoolize: copying file 'bin/ltmain.sh'
| libtoolize: putting macros in AC_CONFIG_MACRO_DIRS, 'm4'.
| libtoolize: copying file 'm4/libtool.m4'
| libtoolize: copying file 'm4/ltoptions.m4'
| libtoolize: copying file 'm4/ltsugar.m4'
| libtoolize: copying file 'm4/ltversion.m4'
| libtoolize: copying file 'm4/lt~obsolete.m4'
| autoreconf: running:
/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot-native/usr/bin/autoconf
--include=[237/7834]
ro/work/smartliving/distro/repo-master/build-poky/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/mesa-17.1.7/m4/
--include=/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/wo
rk/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot-native/usr/share/aclocal/
--force
| autoreconf: configure.ac: not using Autoheader
| autoreconf: running: automake --add-missing --copy --force-missing
| configure.ac:61: installing 'bin/compile'
| configure.ac:46: installing 'bin/missing'
| src/Makefile.am: installing 'bin/depcomp'
| autoreconf: running: gnu-configize
| autoreconf: Leaving directory `.'
| NOTE: Running ../mesa-17.1.7/configure  --build=x86_64-linux
--host=arm-poky-linux-gnueabi
--target=arm-poky-linux-gnueabi
--prefix=/usr                   --exec_prefix=/usr      -
-bindir=/usr/bin                --sbindir=/usr/sbin
--libexecdir=/usr/libexec               --datadir=/usr/share
--sysconfdir=/etc               --sharedstatedir=/com                   --l
ocalstatedir=/var             --libdir=/usr/lib
--includedir=/usr/include
--oldincludedir=/usr/include
--infodir=/usr/share/info               --mandir=/usr/share/man
            --disable-silent-rules
--disable-dependency-tracking
--with-libtool-sysroot=/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/work/cortexa7hf-neon-vfpv
4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot
--enable-shared-glapi                 --disable-opencl
--with-llvm-prefix=/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/wo
rk/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot/usr/lib/llvm5.0
--with-platforms='x11                drm' --disable-static  --enable-dri
--with-dri-drivers=swrast  -
-disable-dri3  --disable-egl  --without-gallium-drivers  --disable-llvm
--enable-gbm  --disable-gles1 --disable-gles2  --disable-opengl
--disable-osmesa --disable-libunwind  --without-vulkan-drivers --enable-glx-
tls  --disable-xa --disable-xvmc --enable-nls
| configure: WARNING: unrecognized options: --enable-nls
| configure: loading site script
/home/gizero/work/smartliving/distro/repo-master/build-poky/conf/../../layers/poky/meta/site/endian-little
| configure: loading site script
/home/gizero/work/smartliving/distro/repo-master/build-poky/conf/../../layers/poky/meta/site/arm-common
| configure: loading site script
/home/gizero/work/smartliving/distro/repo-master/build-poky/conf/../../layers/poky/meta/site/arm-32
| configure: loading site script
/home/gizero/work/smartliving/distro/repo-master/build-poky/conf/../../layers/poky/meta/site/common-linux
| configure: loading site script
/home/gizero/work/smartliving/distro/repo-master/build-poky/conf/../../layers/poky/meta/site/common-glibc
| configure: loading site script
/home/gizero/work/smartliving/distro/repo-master/build-poky/conf/../../layers/poky/meta/site/arm-linux
| configure: loading site script
/home/gizero/work/smartliving/distro/repo-master/build-poky/conf/../../layers/poky/meta/site/common
| configure: loading site script
/home/gizero/work/smartliving/distro/repo-master/build-poky/conf/../../layers/meta-openembedded/meta-oe/site/endian-little
| configure: loading site script
/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot/usr/share/arm-poky-linux-gnueabi_c
onfig_site.d/glibc_config
| checking build system type... x86_64-pc-linux-gnu
| checking host system type... arm-poky-linux-gnueabi
| checking target system type... arm-poky-linux-gnueabi
| checking for a BSD-compatible install...
/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/hosttools/install
-c
| checking whether build environment is sane... yes
| checking for arm-poky-linux-gnueabi-strip... arm-poky-linux-gnueabi-strip
| checking for a thread-safe mkdir -p...
/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/hosttools/mkdir
-p
| checking for gawk... gawk
| checking whether make sets $(MAKE)... yes
| checking whether make supports nested variables... yes
| checking whether UID '1000' is supported by ustar format... yes
| checking whether GID '1000' is supported by ustar format... yes
| checking how to create a ustar tar archive... gnutar
| checking whether make supports nested variables... (cached) yes
| checking for style of include used by make... GNU
| checking for arm-poky-linux-gnueabi-gcc... arm-poky-linux-gnueabi-gcc
-march=armv7ve -marm -mfpu=neon-vfpv4  -mfloat-abi=hard -mcpu=cortex-a7
--sysroot=/home/gizero/work/smartliving/distro/repo-master/build-po
ky/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot
| checking whether the C compiler works... yes
| checking for C compiler default output file name... a.out
| checking for suffix of executables...
| checking whether we are cross compiling... yes
| checking for suffix of object files... o
| checking whether we are using the GNU C compiler... yes
| checking whether arm-poky-linux-gnueabi-gcc  -march=armv7ve -marm
-mfpu=neon-vfpv4  -mfloat-abi=hard -mcpu=cortex-a7
--sysroot=/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/work/cortexa7hf-neo
n-vfpv4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot accepts -g...
yes
[184/7834]
| checking for arm-poky-linux-gnueabi-gcc  -march=armv7ve -marm
-mfpu=neon-vfpv4  -mfloat-abi=hard -mcpu=cortex-a7
--sysroot=/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/work/cortexa7hf-neon-vf
pv4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot option to accept
ISO C89... none needed
| checking whether arm-poky-linux-gnueabi-gcc  -march=armv7ve -marm
-mfpu=neon-vfpv4  -mfloat-abi=hard -mcpu=cortex-a7
--sysroot=/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/work/cortexa7hf-neo
n-vfpv4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot understands
-c and -o together... yes
| checking dependency style of arm-poky-linux-gnueabi-gcc  -march=armv7ve
-marm -mfpu=neon-vfpv4  -mfloat-abi=hard -mcpu=cortex-a7
--sysroot=/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/work/co
rtexa7hf-neon-vfpv4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot...
none
| checking for arm-poky-linux-gnueabi-ar... arm-poky-linux-gnueabi-ar
| checking the archiver (arm-poky-linux-gnueabi-ar) interface... ar
| checking how to run the C preprocessor... arm-poky-linux-gnueabi-gcc -E
--sysroot=/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r
0/recipe-sysroot  -march=armv7ve -marm -mfpu=neon-vfpv4  -mfloat-abi=hard
-mcpu=cortex-a7
| checking for arm-poky-linux-gnueabi-gcc... (cached)
arm-poky-linux-gnueabi-gcc  -march=armv7ve -marm -mfpu=neon-vfpv4
-mfloat-abi=hard -mcpu=cortex-a7
--sysroot=/home/gizero/work/smartliving/distro/repo-master
/build-poky/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot
| checking whether we are using the GNU C compiler... (cached) yes
| checking whether arm-poky-linux-gnueabi-gcc  -march=armv7ve -marm
-mfpu=neon-vfpv4  -mfloat-abi=hard -mcpu=cortex-a7
--sysroot=/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/work/cortexa7hf-neo
n-vfpv4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot accepts -g...
(cached) yes
| checking for arm-poky-linux-gnueabi-gcc  -march=armv7ve -marm
-mfpu=neon-vfpv4  -mfloat-abi=hard -mcpu=cortex-a7
--sysroot=/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/work/cortexa7hf-neon-vf
pv4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot option to accept
ISO C89... (cached) none needed
| checking whether arm-poky-linux-gnueabi-gcc  -march=armv7ve -marm
-mfpu=neon-vfpv4  -mfloat-abi=hard -mcpu=cortex-a7
--sysroot=/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/work/cortexa7hf-neo
n-vfpv4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot understands
-c and -o together... (cached) yes
| checking dependency style of arm-poky-linux-gnueabi-gcc  -march=armv7ve
-marm -mfpu=neon-vfpv4  -mfloat-abi=hard -mcpu=cortex-a7
--sysroot=/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/work/co
rtexa7hf-neon-vfpv4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot...
(cached) none
| checking whether we are using the GNU C++ compiler... yes
| checking whether arm-poky-linux-gnueabi-g++  -march=armv7ve -marm
-mfpu=neon-vfpv4  -mfloat-abi=hard -mcpu=cortex-a7
--sysroot=/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/work/cortexa7hf-neo
n-vfpv4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot accepts -g...
yes
| checking dependency style of arm-poky-linux-gnueabi-g++  -march=armv7ve
-marm -mfpu=neon-vfpv4  -mfloat-abi=hard -mcpu=cortex-a7
--sysroot=/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/work/co
rtexa7hf-neon-vfpv4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot...
none
| checking dependency style of arm-poky-linux-gnueabi-gcc  -march=armv7ve
-marm -mfpu=neon-vfpv4  -mfloat-abi=hard -mcpu=cortex-a7
--sysroot=/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/work/co
rtexa7hf-neon-vfpv4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot...
none
| checking for GNU make... make
| checking for python2.7... python2.7
| checking for a sed that does not truncate output... (cached) sed
| checking for special C compiler options needed for large files... no
| checking for _FILE_OFFSET_BITS value needed for large files... 64
| checking how to print strings... printf
| checking for a sed that does not truncate output... (cached) sed
| checking for grep that handles long lines and -e...
/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/hosttools/grep
| checking for egrep...
/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/hosttools/grep
-E
| checking for fgrep...
/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/hosttools/grep
-F
| checking for ld used by arm-poky-linux-gnueabi-gcc  -march=armv7ve -marm
-mfpu=neon-vfpv4  -mfloat-abi=hard -mcpu=cortex-a7
--sysroot=/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/work/cortexa
7hf-neon-vfpv4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot...
arm-poky-linux-gnueabi-ld
--sysroot=/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gn
ueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot
| checking if the linker (arm-poky-linux-gnueabi-ld
--sysroot=/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot
) is
GNU ld... yes
| checking for BSD- or MS-compatible name lister (nm)...
arm-poky-linux-gnueabi-nm
| checking the name lister (arm-poky-linux-gnueabi-nm) interface... BSD nm
| checking whether ln -s works... yes
| checking the maximum length of command line arguments... 1572864
| checking how to convert x86_64-pc-linux-gnu file names to
arm-poky-linux-gnueabi format... func_convert_file_noop
| checking how to convert x86_64-pc-linux-gnu file names to toolchain
format... func_convert_file_noop
| checking for arm-poky-linux-gnueabi-ld
--sysroot=/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot
option to reloa
d object files... -r
| checking for arm-poky-linux-gnueabi-objdump...
arm-poky-linux-gnueabi-objdump
| checking how to recognize dependent libraries...
pass_all
[131/7834]
| checking for arm-poky-linux-gnueabi-dlltool... no
| checking for dlltool... no
| checking how to associate runtime and link libraries... printf %s\n
| checking for arm-poky-linux-gnueabi-ar... (cached)
arm-poky-linux-gnueabi-ar
| checking for archiver @FILE support... @
| checking for arm-poky-linux-gnueabi-strip... (cached)
arm-poky-linux-gnueabi-strip
| checking for arm-poky-linux-gnueabi-ranlib...
arm-poky-linux-gnueabi-ranlib
| checking command to parse arm-poky-linux-gnueabi-nm output from
arm-poky-linux-gnueabi-gcc  -march=armv7ve -marm -mfpu=neon-vfpv4
-mfloat-abi=hard -mcpu=cortex-a7
--sysroot=/home/gizero/work/smartliving/distro
/repo-master/build-poky/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot
object... ok
| checking for sysroot...
/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot
| checking for a working dd...
/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/hosttools/dd
| checking how to truncate binary pipes...
/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/hosttools/dd
bs=4096 count=1
| checking for arm-poky-linux-gnueabi-mt... no
| checking for mt... no
| checking if : is a manifest tool... no
| checking for ANSI C header files... (cached) yes
| checking for sys/types.h... (cached) yes
| checking for sys/stat.h... (cached) yes
| checking for stdlib.h... (cached) yes
| checking for string.h... (cached) yes
| checking for memory.h... (cached) yes
| checking for strings.h... (cached) yes
| checking for inttypes.h... (cached) yes
| checking for stdint.h... (cached) yes
| checking for unistd.h... (cached) yes
| checking for dlfcn.h... (cached) yes
| checking for objdir... .libs
| checking if arm-poky-linux-gnueabi-gcc  -march=armv7ve -marm
-mfpu=neon-vfpv4  -mfloat-abi=hard -mcpu=cortex-a7
--sysroot=/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/work/cortexa7hf-neon-vfp
v4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot supports -fno-rtti
-fno-exceptions... no
| checking for arm-poky-linux-gnueabi-gcc  -march=armv7ve -marm
-mfpu=neon-vfpv4  -mfloat-abi=hard -mcpu=cortex-a7
--sysroot=/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/work/cortexa7hf-neon-vf
pv4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot option to produce
PIC... -fPIC -DPIC
| checking if arm-poky-linux-gnueabi-gcc  -march=armv7ve -marm
-mfpu=neon-vfpv4  -mfloat-abi=hard -mcpu=cortex-a7
--sysroot=/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/work/cortexa7hf-neon-vfp
v4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot PIC flag -fPIC
-DPIC works... yes
| checking if arm-poky-linux-gnueabi-gcc  -march=armv7ve -marm
-mfpu=neon-vfpv4  -mfloat-abi=hard -mcpu=cortex-a7
--sysroot=/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/work/cortexa7hf-neon-vfp
v4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot static flag
-static works... yes
| checking if arm-poky-linux-gnueabi-gcc  -march=armv7ve -marm
-mfpu=neon-vfpv4  -mfloat-abi=hard -mcpu=cortex-a7
--sysroot=/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/work/cortexa7hf-neon-vfp
v4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot supports -c -o
file.o... yes
| checking if arm-poky-linux-gnueabi-gcc  -march=armv7ve -marm
-mfpu=neon-vfpv4  -mfloat-abi=hard -mcpu=cortex-a7
--sysroot=/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/work/cortexa7hf-neon-vfp
v4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot supports -c -o
file.o... (cached) yes
| checking whether the arm-poky-linux-gnueabi-gcc  -march=armv7ve -marm
-mfpu=neon-vfpv4  -mfloat-abi=hard -mcpu=cortex-a7
--sysroot=/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/work/cortexa7hf
-neon-vfpv4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot linker
(arm-poky-linux-gnueabi-ld
--sysroot=/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-
gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot ) supports shared libraries...
yes
| checking whether -lc should be explicitly linked in... no
| checking dynamic linker characteristics... GNU/Linux ld.so
| checking how to hardcode library paths into programs... immediate
| checking whether stripping libraries is possible... yes
| checking if libtool supports shared libraries... yes
| checking whether to build shared libraries... yes
| checking whether to build static libraries... no
| checking how to run the C++ preprocessor... arm-poky-linux-gnueabi-g++
-march=armv7ve -marm -mfpu=neon-vfpv4  -mfloat-abi=hard -mcpu=cortex-a7
--sysroot=/home/gizero/work/smartliving/distro/repo-master/build-p
oky/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot
-E
| checking for ld used by arm-poky-linux-gnueabi-g++  -march=armv7ve -marm
-mfpu=neon-vfpv4  -mfloat-abi=hard -mcpu=cortex-a7
--sysroot=/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/work/cortexa
7hf-neon-vfpv4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot...
arm-poky-linux-gnueabi-ld
--sysroot=/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/work/cortexa7hf-neon-vfpv4-poky[78/7834]
ueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot
| checking if the linker (arm-poky-linux-gnueabi-ld
--sysroot=/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot
) is
GNU ld... yes
| checking whether the arm-poky-linux-gnueabi-g++  -march=armv7ve -marm
-mfpu=neon-vfpv4  -mfloat-abi=hard -mcpu=cortex-a7
--sysroot=/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/work/cortexa7hf
-neon-vfpv4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot linker
(arm-poky-linux-gnueabi-ld
--sysroot=/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-
gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot ) supports shared libraries...
yes
| checking for arm-poky-linux-gnueabi-g++  -march=armv7ve -marm
-mfpu=neon-vfpv4  -mfloat-abi=hard -mcpu=cortex-a7
--sysroot=/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/work/cortexa7hf-neon-vf
pv4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot option to produce
PIC... -fPIC -DPIC
| checking if arm-poky-linux-gnueabi-g++  -march=armv7ve -marm
-mfpu=neon-vfpv4  -mfloat-abi=hard -mcpu=cortex-a7
--sysroot=/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/work/cortexa7hf-neon-vfp
v4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot PIC flag -fPIC
-DPIC works... yes
| checking if arm-poky-linux-gnueabi-g++  -march=armv7ve -marm
-mfpu=neon-vfpv4  -mfloat-abi=hard -mcpu=cortex-a7
--sysroot=/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/work/cortexa7hf-neon-vfp
v4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot static flag
-static works... yes
| checking if arm-poky-linux-gnueabi-g++  -march=armv7ve -marm
-mfpu=neon-vfpv4  -mfloat-abi=hard -mcpu=cortex-a7
--sysroot=/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/work/cortexa7hf-neon-vfp
v4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot supports -c -o
file.o... yes
| checking if arm-poky-linux-gnueabi-g++  -march=armv7ve -marm
-mfpu=neon-vfpv4  -mfloat-abi=hard -mcpu=cortex-a7
--sysroot=/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/work/cortexa7hf-neon-vfp
v4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot supports -c -o
file.o... (cached) yes
| checking whether the arm-poky-linux-gnueabi-g++  -march=armv7ve -marm
-mfpu=neon-vfpv4  -mfloat-abi=hard -mcpu=cortex-a7
--sysroot=/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/work/cortexa7hf
-neon-vfpv4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot linker
(arm-poky-linux-gnueabi-ld
--sysroot=/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-
gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot ) supports shared libraries...
yes
| checking dynamic linker characteristics... (cached) GNU/Linux ld.so
| checking how to hardcode library paths into programs... immediate
| checking for rm... rm -f
| checking for bison... bison -y
| checking if bison is the parser generator... yes
| checking for flex... flex
| checking lex output file root... lex.yy
| checking lex library... none needed
| checking whether yytext is a pointer... no
| checking if flex is the lexer generator... yes
| checking for indent... cat
| checking if module mako in python is installed... No module named mako
| no
| checking if compiling with clang... no
| checking whether gcc version is sufficient... yes
| checking whether __SUNPRO_C is declared... no
| checking for __builtin_bswap32... yes
| checking for __builtin_bswap64... yes
| checking for __builtin_clz... yes
| checking for __builtin_clzll... yes
| checking for __builtin_ctz... yes
| checking for __builtin_expect... yes
| checking for __builtin_ffs... yes
| checking for __builtin_ffsll... yes
| checking for __builtin_popcount... yes
| checking for __builtin_popcountll... yes
| checking for __builtin_unreachable... yes
| checking for __attribute__((const))... yes
| checking for __attribute__((flatten))... yes
| checking for __attribute__((format))... yes
| checking for __attribute__((malloc))... yes
| checking for __attribute__((packed))... yes
| checking for __attribute__((pure))... yes
| checking for __attribute__((returns_nonnull))...
yes
[25/7834]
| checking for __attribute__((unused))... yes
| checking for __attribute__((visibility))... yes
| checking for __attribute__((warn_unused_result))... yes
| checking for __attribute__((weak))... yes
| checking for __attribute__((alias))... yes
| checking for arm-poky-linux-gnueabi-pkg-config... no
| checking for pkg-config...
/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot-native/usr/bin/pkg-config
| configure: WARNING: using cross tools not prefixed with host triplet
| checking pkg-config is at least version 0.9.0... yes
| checking whether arm-poky-linux-gnueabi-gcc  -march=armv7ve -marm
-mfpu=neon-vfpv4  -mfloat-abi=hard -mcpu=cortex-a7
--sysroot=/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/work/cortexa7hf-neo
n-vfpv4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot supports
-Werror=missing-prototypes... yes
| checking whether arm-poky-linux-gnueabi-gcc  -march=armv7ve -marm
-mfpu=neon-vfpv4  -mfloat-abi=hard -mcpu=cortex-a7
--sysroot=/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/work/cortexa7hf-neo
n-vfpv4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot supports
-fvisibility=hidden... yes
| checking whether arm-poky-linux-gnueabi-gcc  -march=armv7ve -marm
-mfpu=neon-vfpv4  -mfloat-abi=hard -mcpu=cortex-a7
--sysroot=/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/work/cortexa7hf-neo
n-vfpv4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot supports
-Werror=vla... yes
| checking whether arm-poky-linux-gnueabi-g++  -march=armv7ve -marm
-mfpu=neon-vfpv4  -mfloat-abi=hard -mcpu=cortex-a7
--sysroot=/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/work/cortexa7hf-neo
n-vfpv4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot supports
-fvisibility=hidden... yes
| checking whether __sync_add_and_fetch_8 is supported... yes
| checking whether byte ordering is bigendian... (cached) no
| checking whether gcc supports -mpower8-vector... no
| checking if ld supports -Bsymbolic... yes
| checking whether ld supports --gc-sections... yes
| checking if the linker supports version-scripts... yes
| checking if the linker supports --dynamic-list... yes
| checking whether to enable assembly... no, platform not supported
| checking for sys/types.h... (cached) yes
| checking sys/mkdev.h usability... no
| checking sys/mkdev.h presence... no
| checking for sys/mkdev.h... no
| checking for sys/sysmacros.h... (cached) yes
| checking xlocale.h usability... no
| checking xlocale.h presence... no
| checking for xlocale.h... no
| checking for sys/sysctl.h... (cached) yes
| checking for strtof... yes
| checking for mkostemp... yes
| checking for dlopen... no
| checking for dlopen in -ldl... yes
| checking for dladdr... yes
| checking for dl_iterate_phdr... yes
| checking for clock_gettime... yes
| checking for posix_memalign... (cached) yes
| checking for zlib >= 1.2.3... yes
| checking for the pthreads library -lpthreads... no
| checking whether pthreads work without any flags... no
| checking whether pthreads work with -Kthread... no
| checking whether pthreads work with -kthread... no
| checking for the pthreads library -llthread... no
| checking whether pthreads work with -pthread... yes
| checking for joinable pthread attribute... PTHREAD_CREATE_JOINABLE
| checking if more special flags are required for pthreads... no
| checking for PTHREAD_PRIO_INHERIT... yes
| checking for libelf... no
| checking for elf_memory in -lelf... no
| ../mesa-17.1.7/configure: line 22300:
/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot-native/usr/bin/llvm-config5
.0: No such file or directory
| ../mesa-17.1.7/configure: line 22283:
/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot-native/usr/bin/llvm-config5
.0: No such file or directory
| ../mesa-17.1.7/configure: line 22302:
/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot-native/usr/bin/llvm-config5
.0: No such file or directory
| ../mesa-17.1.7/configure: line 22303:
/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot-native/usr/bin/llvm-config5
.0: No such file or directory
| configure: error: GLX cannot be built without OpenGL
| NOTE: The following config.log files may provide further information.
| NOTE:
/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/build/config.log
| ERROR: configure failed
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_configure (log file is located at
/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/temp/log.do_configu
re.1391)
ERROR: Task
(/home/gizero/work/smartliving/distro/repo-master/build-poky/conf/../../layers/poky/meta/recipes-graphics/mesa/mesa-gl_17.1.7.bb:do_configure)
failed with exit code '1'

This doesn't seem to be related to the bbappend for mesa-gl that is present
in meta-raspberrypi, which merely appends "gbm" to PACKAGECONFIG for rpi
machines (bitbake still complains with this removed). Instead, reverting
this commit takes the build back to green light.

--001a113e1f5807dc980558585a1d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br><div><div class=3D"gmail_extra"><br><div class=3D"g=
mail_quote">On Mon, Aug 28, 2017 at 2:46 PM, Jussi Kukkonen <span dir=3D"lt=
r">&lt;<a href=3D"mailto:jussi.kukkonen@intel.com" target=3D"_blank">jussi.=
kukkonen@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">mesa can build certain things without opengl: most impor=
tantly vulkan<br>
drivers.<br>
<br>
Add comments on the dependencies between the packageconfigs. Also add<br>
a few dependencies to packageconfigs. Modify default packageconfig to<br>
do the reasonable thing based on distro features.<br>
<br>
Add a backported patch to fix the build with --disable-opengl. Fix<br>
do_install_append() so it works even if dri drivers are not built.<br>
<br>
Signed-off-by: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@intel.co=
m">jussi.kukkonen@intel.com</a>&gt;<br>
---<br>
=C2=A0.../0001-configure.ac-Always-<wbr>check-for-expat.patch | 51 ++++++++=
++++++++++++++<br>
=C2=A0meta/recipes-graphics/mesa/<wbr>mesa.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 23 +++++++---<br>
=C2=A0meta/recipes-graphics/mesa/<a href=3D"http://mesa_17.1.7.bb" rel=3D"n=
oreferrer" target=3D"_blank">mes<wbr>a_17.1.7.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A03 files changed, 68 insertions(+), 7 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-graphics/mesa/<wbr>files/0001-configu=
re.ac-<wbr>Always-check-for-expat.patch<br>
<br>
diff --git a/meta/recipes-graphics/mesa/<wbr>files/0001-configure.ac-<wbr>A=
lways-check-for-expat.patch b/meta/recipes-graphics/mesa/<wbr>files/0001-co=
nfigure.ac-<wbr>Always-check-for-expat.patch<br>
new file mode 100644<br>
index 0000000..4753c49<br>
--- /dev/null<br>
+++ b/meta/recipes-graphics/mesa/<wbr>files/0001-configure.ac-<wbr>Always-c=
heck-for-expat.patch<br>
@@ -0,0 +1,51 @@<br>
+From 1f7d752193f02d15d5923cee992e8f<wbr>46d4c6df1b Mon Sep 17 00:00:00 200=
1<br>
+From: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@intel.com">jussi=
.kukkonen@intel.com</a>&gt;<br>
+Date: Mon, 28 Aug 2017 13:51:49 +0300<br>
+Subject: [PATCH] <a href=3D"http://configure.ac" rel=3D"noreferrer" target=
=3D"_blank">configure.ac</a>: Always check for expat<br>
+<br>
+expat was not checked if dri was not built leading to build failure<br>
+in vulkan driver: backport a fix (a combination of multiple commits<br>
+that should end up in 17.3).<br>
+<br>
+Upstream-Status: Backport<br>
+Signed-off-by: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@intel.c=
om">jussi.kukkonen@intel.com</a>&gt;<br>
+---<br>
+ <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">conf=
igure.ac</a> | 15 ++++++---------<br>
+ 1 file changed, 6 insertions(+), 9 deletions(-)<br>
+<br>
+diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"=
_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"noreferre=
r" target=3D"_blank">configure.ac</a><br>
+index fd346c8aa2..662faecefa 100644<br>
+--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
++++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
+@@ -1777,6 +1777,12 @@ if test &quot;x$with_dri_drivers&quot; =3D xno; the=
n<br>
+=C2=A0 =C2=A0 =C2=A0with_dri_drivers=3D&#39;&#39;<br>
+ fi<br>
+<br>
++# Check for expat<br>
++PKG_CHECK_MODULES([EXPAT], [expat])<br>
++PKG_CHECK_MODULES([EXPAT], [expat],,<br>
++=C2=A0 =C2=A0 [PKG_CHECK_MODULES([EXPAT], [expat21])]<br>
++)<br>
++<br>
+ dnl If $with_dri_drivers is yes, drivers will be added through<br>
+ dnl platform checks. Set DEFINES and LIB_DEPS<br>
+ if test &quot;x$enable_dri&quot; =3D xyes; then<br>
+@@ -1810,15 +1816,6 @@ if test &quot;x$enable_dri&quot; =3D xyes; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with_dri_drivers=3D&quot;i915 i965 nouve=
au r200 radeon swrast&quot;<br>
+=C2=A0 =C2=A0 =C2=A0fi<br>
+<br>
+-=C2=A0 =C2=A0 # Check for expat<br>
+-=C2=A0 =C2=A0 PKG_CHECK_MODULES([EXPAT], [expat], [],<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # expat version 2.0 and earlier do not provid=
e expat.pc<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 [AC_CHECK_HEADER([expat.h],[],<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0[AC_MSG_ERROR([Expat headers required for DRI not found])]=
)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AC_CHECK_LIB([expat],[XML_<wbr>ParserCr=
eate],[],<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0[AC_MSG_ERROR([Expat library required for DRI not found])])<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0EXPAT_LIBS=3D&quot;-lexpat&quot;])<br>
+-<br>
+=C2=A0 =C2=A0 =C2=A0# put all the necessary libs together<br>
+=C2=A0 =C2=A0 =C2=A0DRI_LIB_DEPS=3D&quot;$DRI_LIB_DEPS $SELINUX_LIBS $LIBD=
RM_LIBS $EXPAT_LIBS -lm $PTHREAD_LIBS $DLOPEN_LIBS&quot;<br>
+ fi<br>
+--<br>
+2.14.1<br>
+<br>
diff --git a/meta/recipes-graphics/mesa/<wbr>mesa.inc b/meta/recipes-graphi=
cs/mesa/<wbr>mesa.inc<br>
index 3bb3cf4..4f31ed2 100644<br>
--- a/meta/recipes-graphics/mesa/<wbr>mesa.inc<br>
+++ b/meta/recipes-graphics/mesa/<wbr>mesa.inc<br>
@@ -20,7 +20,7 @@ PROVIDES =3D &quot;virtual/libgl virtual/libgles1 virtual=
/libgles2 virtual/egl virtual/<br>
<br>
=C2=A0inherit autotools pkgconfig gettext distro_features_check<br>
<br>
-REQUIRED_DISTRO_FEATURES =3D &quot;opengl&quot;<br>
+ANY_OF_DISTRO_FEATURES =3D &quot;opengl vulkan&quot;<br>
<br>
=C2=A0PLATFORMS ??=3D &quot;${@bb.utils.filter(&#39;<wbr>PACKAGECONFIG&#39;=
, &#39;x11 wayland&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.utils.contain=
s(&#39;<wbr>PACKAGECONFIG&#39;, &#39;gbm&#39;, &#39;drm&#39;, &#39;&#39;, d=
)}&quot;<br>
@@ -32,20 +32,25 @@ EXTRA_OECONF =3D &quot;--enable-shared-glapi \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--with-llvm-p=
refix=3D${STAGING_<wbr>LIBDIR}/llvm${MESA_LLVM_<wbr>RELEASE} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--with-platfo=
rms=3D&#39;${PLATFORMS}<wbr>&#39;&quot;<br>
<br>
-PACKAGECONFIG ??=3D &quot;gbm egl gles dri \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb.utils.filter(=
&#39;DISTRO_<wbr>FEATURES&#39;, &#39;wayland x11 vulkan&#39;, d)} \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb.utils.contain=
s(&#39;DISTRO_<wbr>FEATURES&#39;, &#39;x11 vulkan&#39;, &#39;dri3&#39;, &#3=
9;&#39;, d)} \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
+PACKAGECONFIG ??=3D &quot;${@bb.utils.filter(&#39;DISTRO_<wbr>FEATURES&#39=
;, &#39;wayland vulkan&#39;, d)} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb=
.utils.contains(&#39;DISTRO_<wbr>FEATURES&#39;, &#39;opengl&#39;, &#39;open=
gl egl gles gbm dri&#39;, &#39;&#39;, d)} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb=
.utils.contains(&#39;DISTRO_<wbr>FEATURES&#39;, &#39;x11 opengl&#39;, &#39;=
x11&#39;, &#39;&#39;, d)} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb=
.utils.contains(&#39;DISTRO_<wbr>FEATURES&#39;, &#39;x11 vulkan&#39;, &#39;=
dri3&#39;, &#39;&#39;, d)} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
+<br>
+# &quot;gbm&quot; requires &quot;dri&quot;, &quot;opengl&quot;<br>
=C2=A0PACKAGECONFIG[gbm] =3D &quot;--enable-gbm,--disable-gbm&quot;<br>
<br>
=C2=A0X11_DEPS =3D &quot;xf86driproto glproto virtual/libx11 libxext libxxf=
86vm libxdamage libxfixes&quot;<br>
+# &quot;x11&quot; requires &quot;opengl&quot;<br>
=C2=A0PACKAGECONFIG[x11] =3D &quot;--enable-glx-tls,--disable-<wbr>glx,${X1=
1_DEPS}&quot;<br>
=C2=A0PACKAGECONFIG[xvmc] =3D &quot;--enable-xvmc,--disable-xvmc,<wbr>libxv=
mc&quot;<br>
-PACKAGECONFIG[wayland] =3D &quot;,,wayland-native wayland&quot;<br>
+PACKAGECONFIG[wayland] =3D &quot;,,wayland-native wayland libdrm&quot;<br>
<br>
=C2=A0DRIDRIVERS =3D &quot;swrast&quot;<br>
=C2=A0DRIDRIVERS_append_x86 =3D &quot;,radeon,r200,nouveau,i965,<wbr>i915&q=
uot;<br>
=C2=A0DRIDRIVERS_append_x86-64 =3D &quot;,radeon,r200,nouveau,i965,<wbr>i91=
5&quot;<br>
+# &quot;dri&quot; requires &quot;opengl&quot;<br>
=C2=A0PACKAGECONFIG[dri] =3D &quot;--enable-dri --with-dri-drivers=3D${<wbr=
>DRIDRIVERS}, --disable-dri, dri2proto libdrm&quot;<br>
=C2=A0PACKAGECONFIG[dri3] =3D &quot;--enable-dri3, --disable-dri3, dri3prot=
o presentproto libxshmfence&quot;<br>
<br>
@@ -56,8 +61,12 @@ VULKAN_DRIVERS_append_x86 =3D &quot;,intel&quot;<br>
=C2=A0VULKAN_DRIVERS_append_x86-64 =3D &quot;,intel&quot;<br>
=C2=A0PACKAGECONFIG[vulkan] =3D &quot;--with-vulkan-drivers=3D${<wbr>VULKAN=
_DRIVERS}, --without-vulkan-drivers&quot;<br>
<br>
+PACKAGECONFIG[opengl] =3D &quot;--enable-opengl, --disable-opengl&quot;<br=
>
+<br>
+# &quot;gles&quot; requires &quot;opengl&quot;<br>
=C2=A0PACKAGECONFIG[gles] =3D &quot;--enable-gles1 --enable-gles2, --disabl=
e-gles1 --disable-gles2&quot;<br>
<br>
+# &quot;egl&quot; requires &quot;dri&quot;, &quot;opengl&quot;<br>
=C2=A0PACKAGECONFIG[egl] =3D &quot;--enable-egl, --disable-egl&quot;<br>
<br>
=C2=A0PACKAGECONFIG[etnaviv] =3D &quot;&quot;<br>
@@ -121,7 +130,7 @@ do_install_append () {<br>
<br>
=C2=A0 =C2=A0 =C2=A0# it was packaged in libdricore9.1.3-1 and preventing u=
pgrades when debian.bbclass was used<br>
=C2=A0 =C2=A0 =C2=A0rm -f ${D}${sysconfdir}/drirc<br>
-=C2=A0 =C2=A0 chrpath --delete ${D}${libdir}/dri/*_dri.so<br>
+=C2=A0 =C2=A0 chrpath --delete ${D}${libdir}/dri/*_dri.so || true<br>
=C2=A0}<br>
<br>
=C2=A0# For the packages that make up the OpenGL interfaces, inject variabl=
es so that<br>
diff --git a/meta/recipes-graphics/mesa/<a href=3D"http://mesa_17.1.7.bb" r=
el=3D"noreferrer" target=3D"_blank">m<wbr>esa_17.1.7.bb</a> b/meta/recipes-=
graphics/mesa/<a href=3D"http://mesa_17.1.7.bb" rel=3D"noreferrer" target=
=3D"_blank">m<wbr>esa_17.1.7.bb</a><br>
index 494cdc6..a50f32c 100644<br>
--- a/meta/recipes-graphics/mesa/<a href=3D"http://mesa_17.1.7.bb" rel=3D"n=
oreferrer" target=3D"_blank">m<wbr>esa_17.1.7.bb</a><br>
+++ b/meta/recipes-graphics/mesa/<a href=3D"http://mesa_17.1.7.bb" rel=3D"n=
oreferrer" target=3D"_blank">m<wbr>esa_17.1.7.bb</a><br>
@@ -10,6 +10,7 @@ SRC_URI =3D &quot;<a href=3D"https://mesa.freedesktop.org=
/archive/mesa-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">https:=
//mesa.freedesktop.org/<wbr>archive/mesa-${PV}.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-ac-fix-build-<wbr>aft=
er-LLVM-5.0-SVN-r300718.<wbr>patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-gallivm-Fix-build-<wb=
r>against-LLVM-SVN-r302589.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-winsys-svga-drm-<wbr>=
Include-sys-types.h.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-configure.ac-<wbr>Alw=
ays-check-for-expat.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0SRC_URI[md5sum] =3D &quot;<wbr>e40bb428a263bd28cbf6478dae45b2<wbr>07&=
quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;<wbr>69f472a874b1122404fa0bd13e2d6b<wbr>=
f87eb3b9ad9c21d2f39872a96d83d9<wbr>e5f5&quot;<br>
<span class=3D"gmail-HOEnZb"><font color=3D"#888888">--<br>
2.1.4<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br></font></span></blockquote><d=
iv><br></div><div>It appear that this patch has broken the build for mesa-g=
l on MACHINE=3Draspberrypi3 with the following error on do_configure:</div>=
<div><br></div><div> ERROR: mesa-gl-2_17.1.7-r0 do_configure: configure fai=
led<br>ERROR: mesa-gl-2_17.1.7-r0 do_configure: Function failed: do_configu=
re (log file is located at /home/gizero/work/smartliving/distro/repo-master=
/build-poky/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/mesa-gl<br>/2=
_17.1.7-r0/temp/log.do_configure.1391)<br>ERROR: Logfile of failure stored =
in: /home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/work/co=
rtexa7hf-neon-vfpv4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/temp/log.do_conf=
igure.1391<br>Log data follows:<br>| DEBUG: SITE files [&#39;endian-little&=
#39;, &#39;bit-32&#39;, &#39;arm-common&#39;, &#39;arm-32&#39;, &#39;common=
-linux&#39;, &#39;common-glibc&#39;, &#39;arm-linux&#39;, &#39;arm-linux-gn=
ueabi&#39;, &#39;common&#39;]<br>| DEBUG: Executing shell function autotool=
s_preconfigure<br>| DEBUG: Shell function autotools_preconfigure finished<b=
r>| DEBUG: Executing python function autotools_aclocals<br>| DEBUG: SITE fi=
les [&#39;endian-little&#39;, &#39;bit-32&#39;, &#39;arm-common&#39;, &#39;=
arm-32&#39;, &#39;common-linux&#39;, &#39;common-glibc&#39;, &#39;arm-linux=
&#39;, &#39;arm-linux-gnueabi&#39;, &#39;common&#39;]<br>| DEBUG: Python fu=
nction autotools_aclocals finished<br>| DEBUG: Executing shell function do_=
configure<br>| automake (GNU automake) 1.15.1<br>| Copyright (C) 2017 Free =
Software Foundation, Inc.<br>| License GPLv2+: GNU GPL version 2 or later &=
lt;<a href=3D"http://gnu.org/licenses/gpl-2.0.html">http://gnu.org/licenses=
/gpl-2.0.html</a>&gt;<br>| This is free software: you are free to change an=
d redistribute it.<br>| There is NO WARRANTY, to the extent permitted by la=
w.<br>| <br>| Written by Tom Tromey &lt;<a href=3D"mailto:tromey@redhat.com=
">tromey@redhat.com</a>&gt;<br>|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
and Alexandre Duret-Lutz &lt;<a href=3D"mailto:adl@gnu.org">adl@gnu.org</a>=
&gt;.<br>| AUTOV is 1.15<br>| NOTE: Executing ACLOCAL=3D&quot;aclocal --sys=
tem-acdir=3D/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp=
/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-s=
ysroot/usr/share/aclocal<br>/ --automake-acdir=3D/home/gizero/work/smartliv=
ing/distro/repo-master/build-poky/tmp/work/cortexa7hf-neon-vfpv4-poky-linux=
-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot-native/usr/share/aclocal-1.15&q=
uot; autoreconf --verb<br>ose --install --force --exclude=3Dautopoint -I /h=
ome/gizero/work/smartliving/distro/repo-master/build-poky/tmp/work/cortexa7=
hf-neon-vfpv4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/mesa-17.1.7/m4/ -I /ho=
me/gizero/work/<br>smartliving/distro/repo-master/build-poky/tmp/work/corte=
xa7hf-neon-vfpv4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot-nati=
ve/usr/share/aclocal/<br>| autoreconf: Entering directory `.&#39;<br>| auto=
reconf: <a href=3D"http://configure.ac">configure.ac</a>: not using Gettext=
<br>| autoreconf: running: aclocal --system-acdir=3D/home/gizero/work/smart=
living/distro/repo-master/build-poky/tmp/work/cortexa7hf-neon-vfpv4-poky-li=
nux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot/usr/share/aclocal/ --<br>aut=
omake-acdir=3D/home/gizero/work/smartliving/distro/repo-master/build-poky/t=
mp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe=
-sysroot-native/usr/share/aclocal-1.15 -I /home/gizero/work/s<br>martliving=
/distro/repo-master/build-poky/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gn=
ueabi/mesa-gl/2_17.1.7-r0/mesa-17.1.7/m4/ -I /home/gizero/work/smartliving/=
distro/repo-master/build-poky/tmp/work/cortexa7hf-ne<br>on-vfpv4-poky-linux=
-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot-native/usr/share/aclocal/ --for=
ce -I m4<br>| autoreconf: <a href=3D"http://configure.ac">configure.ac</a>:=
 tracing<br>| autoreconf: running: libtoolize --copy --force<br>| libtooliz=
e: putting auxiliary files in AC_CONFIG_AUX_DIR, &#39;bin&#39;.<br>| libtoo=
lize: copying file &#39;bin/ltmain.sh&#39;<br>| libtoolize: putting macros =
in AC_CONFIG_MACRO_DIRS, &#39;m4&#39;.<br>| libtoolize: copying file &#39;m=
4/libtool.m4&#39;<br>| libtoolize: copying file &#39;m4/ltoptions.m4&#39;<b=
r>| libtoolize: copying file &#39;m4/ltsugar.m4&#39;<br>| libtoolize: copyi=
ng file &#39;m4/ltversion.m4&#39;<br>| libtoolize: copying file &#39;m4/lt~=
obsolete.m4&#39;<br>| autoreconf: running: /home/gizero/work/smartliving/di=
stro/repo-master/build-poky/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnuea=
bi/mesa-gl/2_17.1.7-r0/recipe-sysroot-native/usr/bin/autoconf --include=3D[=
237/7834]<br>ro/work/smartliving/distro/repo-master/build-poky/tmp/work/cor=
texa7hf-neon-vfpv4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/mesa-17.1.7/m4/ -=
-include=3D/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/=
wo<br>rk/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/recip=
e-sysroot-native/usr/share/aclocal/ --force<br>| autoreconf: <a href=3D"htt=
p://configure.ac">configure.ac</a>: not using Autoheader<br>| autoreconf: r=
unning: automake --add-missing --copy --force-missing<br>| <a href=3D"http:=
//configure.ac:61">configure.ac:61</a>: installing &#39;bin/compile&#39;<br=
>| <a href=3D"http://configure.ac:46">configure.ac:46</a>: installing &#39;=
bin/missing&#39;<br>| src/Makefile.am: installing &#39;bin/depcomp&#39;<br>=
| autoreconf: running: gnu-configize<br>| autoreconf: Leaving directory `.&=
#39;<br>| NOTE: Running ../mesa-17.1.7/configure=C2=A0 --build=3Dx86_64-lin=
ux=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 --host=
=3Darm-poky-linux-gnueabi=C2=A0=C2=A0 --target=3Darm-poky-linux-gnueabi=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 --prefix=3D/usr=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 --exec_prefix=3D/usr=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -<br>-bindir=3D/usr/bin=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 --sbindir=3D/usr/sbin=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 --libexecdir=3D/usr/libexec=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 --datadir=3D/usr/share=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 --sysconfdir=3D/etc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 --sharedstatedir=3D/com=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 --l<br>ocalstatedir=3D/var=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 --libdir=3D/usr/l=
ib=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 --includedir=3D/usr/include=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 --oldincludedir=3D/usr/=
include=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 --infodir=3D/usr/share/info=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 --mandir=3D/usr/share/man=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 <br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 --disable-silent-rules=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 --disable-dependency-tracking=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 --with-libt=
ool-sysroot=3D/home/gizero/work/smartliving/distro/repo-master/build-poky/t=
mp/work/cortexa7hf-neon-vfpv<br>4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/re=
cipe-sysroot --enable-shared-glapi=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 --disable-opencl=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 --with-llvm-prefix=3D/home/gizero/work/smartliving/di=
stro/repo-master/build-poky/tmp/wo<br>rk/cortexa7hf-neon-vfpv4-poky-linux-g=
nueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot/usr/lib/llvm5.0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 --with-platforms=3D&#39;x11=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm&#39; --disable-static=
=C2=A0 --enable-dri --with-dri-drivers=3Dswrast=C2=A0 -<br>-disable-dri3=C2=
=A0 --disable-egl=C2=A0 --without-gallium-drivers=C2=A0 --disable-llvm --en=
able-gbm=C2=A0 --disable-gles1 --disable-gles2=C2=A0 --disable-opengl --dis=
able-osmesa --disable-libunwind=C2=A0 --without-vulkan-drivers --enable-glx=
-<br>tls=C2=A0 --disable-xa --disable-xvmc --enable-nls<br>| configure: WAR=
NING: unrecognized options: --enable-nls<br>| configure: loading site scrip=
t /home/gizero/work/smartliving/distro/repo-master/build-poky/conf/../../la=
yers/poky/meta/site/endian-little<br>| configure: loading site script /home=
/gizero/work/smartliving/distro/repo-master/build-poky/conf/../../layers/po=
ky/meta/site/arm-common<br>| configure: loading site script /home/gizero/wo=
rk/smartliving/distro/repo-master/build-poky/conf/../../layers/poky/meta/si=
te/arm-32<br>| configure: loading site script /home/gizero/work/smartliving=
/distro/repo-master/build-poky/conf/../../layers/poky/meta/site/common-linu=
x<br>| configure: loading site script /home/gizero/work/smartliving/distro/=
repo-master/build-poky/conf/../../layers/poky/meta/site/common-glibc<br>| c=
onfigure: loading site script /home/gizero/work/smartliving/distro/repo-mas=
ter/build-poky/conf/../../layers/poky/meta/site/arm-linux<br>| configure: l=
oading site script /home/gizero/work/smartliving/distro/repo-master/build-p=
oky/conf/../../layers/poky/meta/site/common<br>| configure: loading site sc=
ript /home/gizero/work/smartliving/distro/repo-master/build-poky/conf/../..=
/layers/meta-openembedded/meta-oe/site/endian-little<br>| configure: loadin=
g site script /home/gizero/work/smartliving/distro/repo-master/build-poky/t=
mp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe=
-sysroot/usr/share/arm-poky-linux-gnueabi_c<br>onfig_site.d/glibc_config<br=
>| checking build system type... x86_64-pc-linux-gnu<br>| checking host sys=
tem type... arm-poky-linux-gnueabi<br>| checking target system type... arm-=
poky-linux-gnueabi<br>| checking for a BSD-compatible install... /home/gize=
ro/work/smartliving/distro/repo-master/build-poky/tmp/hosttools/install -c<=
br>| checking whether build environment is sane... yes<br>| checking for ar=
m-poky-linux-gnueabi-strip... arm-poky-linux-gnueabi-strip<br>| checking fo=
r a thread-safe mkdir -p... /home/gizero/work/smartliving/distro/repo-maste=
r/build-poky/tmp/hosttools/mkdir -p<br>| checking for gawk... gawk<br>| che=
cking whether make sets $(MAKE)... yes<br>| checking whether make supports =
nested variables... yes<br>| checking whether UID &#39;1000&#39; is support=
ed by ustar format... yes<br>| checking whether GID &#39;1000&#39; is suppo=
rted by ustar format... yes<br>| checking how to create a ustar tar archive=
... gnutar<br>| checking whether make supports nested variables... (cached)=
 yes<br>| checking for style of include used by make... GNU<br>| checking f=
or arm-poky-linux-gnueabi-gcc... arm-poky-linux-gnueabi-gcc=C2=A0 -march=3D=
armv7ve -marm -mfpu=3Dneon-vfpv4=C2=A0 -mfloat-abi=3Dhard -mcpu=3Dcortex-a7=
 --sysroot=3D/home/gizero/work/smartliving/distro/repo-master/build-po<br>k=
y/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/rec=
ipe-sysroot<br>| checking whether the C compiler works... yes<br>| checking=
 for C compiler default output file name... a.out<br>| checking for suffix =
of executables...<br>| checking whether we are cross compiling... yes<br>| =
checking for suffix of object files... o<br>| checking whether we are using=
 the GNU C compiler... yes<br>| checking whether arm-poky-linux-gnueabi-gcc=
=C2=A0 -march=3Darmv7ve -marm -mfpu=3Dneon-vfpv4=C2=A0 -mfloat-abi=3Dhard -=
mcpu=3Dcortex-a7 --sysroot=3D/home/gizero/work/smartliving/distro/repo-mast=
er/build-poky/tmp/work/cortexa7hf-neo<br></div></div>n-vfpv4-poky-linux-gnu=
eabi/mesa-gl/2_17.1.7-r0/recipe-sysroot accepts -g... yes=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [184/7834]<br>| checking for arm-po=
ky-linux-gnueabi-gcc=C2=A0 -march=3Darmv7ve -marm -mfpu=3Dneon-vfpv4=C2=A0 =
-mfloat-abi=3Dhard -mcpu=3Dcortex-a7 --sysroot=3D/home/gizero/work/smartliv=
ing/distro/repo-master/build-poky/tmp/work/cortexa7hf-neon-vf<br>pv4-poky-l=
inux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot option to accept ISO C89...=
 none needed<br>| checking whether arm-poky-linux-gnueabi-gcc=C2=A0 -march=
=3Darmv7ve -marm -mfpu=3Dneon-vfpv4=C2=A0 -mfloat-abi=3Dhard -mcpu=3Dcortex=
-a7 --sysroot=3D/home/gizero/work/smartliving/distro/repo-master/build-poky=
/tmp/work/cortexa7hf-neo<br>n-vfpv4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/=
recipe-sysroot understands -c and -o together... yes<br>| checking dependen=
cy style of arm-poky-linux-gnueabi-gcc=C2=A0 -march=3Darmv7ve -marm -mfpu=
=3Dneon-vfpv4=C2=A0 -mfloat-abi=3Dhard -mcpu=3Dcortex-a7 --sysroot=3D/home/=
gizero/work/smartliving/distro/repo-master/build-poky/tmp/work/co<br>rtexa7=
hf-neon-vfpv4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot... none=
<br>| checking for arm-poky-linux-gnueabi-ar... arm-poky-linux-gnueabi-ar<b=
r>| checking the archiver (arm-poky-linux-gnueabi-ar) interface... ar<br>| =
checking how to run the C preprocessor... arm-poky-linux-gnueabi-gcc -E --s=
ysroot=3D/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/wo=
rk/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r<br>0/recipe-=
sysroot=C2=A0 -march=3Darmv7ve -marm -mfpu=3Dneon-vfpv4=C2=A0 -mfloat-abi=
=3Dhard -mcpu=3Dcortex-a7<br>| checking for arm-poky-linux-gnueabi-gcc... (=
cached) arm-poky-linux-gnueabi-gcc=C2=A0 -march=3Darmv7ve -marm -mfpu=3Dneo=
n-vfpv4=C2=A0 -mfloat-abi=3Dhard -mcpu=3Dcortex-a7 --sysroot=3D/home/gizero=
/work/smartliving/distro/repo-master<br>/build-poky/tmp/work/cortexa7hf-neo=
n-vfpv4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot<br>| checking=
 whether we are using the GNU C compiler... (cached) yes<br>| checking whet=
her arm-poky-linux-gnueabi-gcc=C2=A0 -march=3Darmv7ve -marm -mfpu=3Dneon-vf=
pv4=C2=A0 -mfloat-abi=3Dhard -mcpu=3Dcortex-a7 --sysroot=3D/home/gizero/wor=
k/smartliving/distro/repo-master/build-poky/tmp/work/cortexa7hf-neo<br>n-vf=
pv4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot accepts -g... (ca=
ched) yes<br>| checking for arm-poky-linux-gnueabi-gcc=C2=A0 -march=3Darmv7=
ve -marm -mfpu=3Dneon-vfpv4=C2=A0 -mfloat-abi=3Dhard -mcpu=3Dcortex-a7 --sy=
sroot=3D/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/wor=
k/cortexa7hf-neon-vf<br>pv4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-s=
ysroot option to accept ISO C89... (cached) none needed<br>| checking wheth=
er arm-poky-linux-gnueabi-gcc=C2=A0 -march=3Darmv7ve -marm -mfpu=3Dneon-vfp=
v4=C2=A0 -mfloat-abi=3Dhard -mcpu=3Dcortex-a7 --sysroot=3D/home/gizero/work=
/smartliving/distro/repo-master/build-poky/tmp/work/cortexa7hf-neo<br>n-vfp=
v4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot understands -c and=
 -o together... (cached) yes<br>| checking dependency style of arm-poky-lin=
ux-gnueabi-gcc=C2=A0 -march=3Darmv7ve -marm -mfpu=3Dneon-vfpv4=C2=A0 -mfloa=
t-abi=3Dhard -mcpu=3Dcortex-a7 --sysroot=3D/home/gizero/work/smartliving/di=
stro/repo-master/build-poky/tmp/work/co<br>rtexa7hf-neon-vfpv4-poky-linux-g=
nueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot... (cached) none<br>| checking wh=
ether we are using the GNU C++ compiler... yes<br>| checking whether arm-po=
ky-linux-gnueabi-g++=C2=A0 -march=3Darmv7ve -marm -mfpu=3Dneon-vfpv4=C2=A0 =
-mfloat-abi=3Dhard -mcpu=3Dcortex-a7 --sysroot=3D/home/gizero/work/smartliv=
ing/distro/repo-master/build-poky/tmp/work/cortexa7hf-neo<br>n-vfpv4-poky-l=
inux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot accepts -g... yes<br>| chec=
king dependency style of arm-poky-linux-gnueabi-g++=C2=A0 -march=3Darmv7ve =
-marm -mfpu=3Dneon-vfpv4=C2=A0 -mfloat-abi=3Dhard -mcpu=3Dcortex-a7 --sysro=
ot=3D/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/work/c=
o<br>rtexa7hf-neon-vfpv4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysr=
oot... none<br>| checking dependency style of arm-poky-linux-gnueabi-gcc=C2=
=A0 -march=3Darmv7ve -marm -mfpu=3Dneon-vfpv4=C2=A0 -mfloat-abi=3Dhard -mcp=
u=3Dcortex-a7 --sysroot=3D/home/gizero/work/smartliving/distro/repo-master/=
build-poky/tmp/work/co<br>rtexa7hf-neon-vfpv4-poky-linux-gnueabi/mesa-gl/2_=
17.1.7-r0/recipe-sysroot... none<br>| checking for GNU make... make<br>| ch=
ecking for python2.7... python2.7<br>| checking for a sed that does not tru=
ncate output... (cached) sed<br>| checking for special C compiler options n=
eeded for large files... no<br>| checking for _FILE_OFFSET_BITS value neede=
d for large files... 64<br>| checking how to print strings... printf<br>| c=
hecking for a sed that does not truncate output... (cached) sed<br>| checki=
ng for grep that handles long lines and -e... /home/gizero/work/smartliving=
/distro/repo-master/build-poky/tmp/hosttools/grep<br>| checking for egrep..=
. /home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/hosttools=
/grep -E<br>| checking for fgrep... /home/gizero/work/smartliving/distro/re=
po-master/build-poky/tmp/hosttools/grep -F<br>| checking for ld used by arm=
-poky-linux-gnueabi-gcc=C2=A0 -march=3Darmv7ve -marm -mfpu=3Dneon-vfpv4=C2=
=A0 -mfloat-abi=3Dhard -mcpu=3Dcortex-a7 --sysroot=3D/home/gizero/work/smar=
tliving/distro/repo-master/build-poky/tmp/work/cortexa<br>7hf-neon-vfpv4-po=
ky-linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot... arm-poky-linux-gnuea=
bi-ld --sysroot=3D/home/gizero/work/smartliving/distro/repo-master/build-po=
ky/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gn<br>ueabi/mesa-gl/2_17.1.7-r=
0/recipe-sysroot<br>| checking if the linker (arm-poky-linux-gnueabi-ld --s=
ysroot=3D/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/wo=
rk/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysr=
oot ) is <br>GNU ld... yes<br>| checking for BSD- or MS-compatible name lis=
ter (nm)... arm-poky-linux-gnueabi-nm<br>| checking the name lister (arm-po=
ky-linux-gnueabi-nm) interface... BSD nm<br>| checking whether ln -s works.=
.. yes<br>| checking the maximum length of command line arguments... 157286=
4<br>| checking how to convert x86_64-pc-linux-gnu file names to arm-poky-l=
inux-gnueabi format... func_convert_file_noop<br>| checking how to convert =
x86_64-pc-linux-gnu file names to toolchain format... func_convert_file_noo=
p<br>| checking for arm-poky-linux-gnueabi-ld --sysroot=3D/home/gizero/work=
/smartliving/distro/repo-master/build-poky/tmp/work/cortexa7hf-neon-vfpv4-p=
oky-linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot=C2=A0 option to reloa<=
br>d object files... -r<br>| checking for arm-poky-linux-gnueabi-objdump...=
 arm-poky-linux-gnueabi-objdump<br>| checking how to recognize dependent li=
braries... pass_all=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [131/7834]<br>| checking f=
or arm-poky-linux-gnueabi-dlltool... no<br>| checking for dlltool... no<br>=
| checking how to associate runtime and link libraries... printf %s\n<br>| =
checking for arm-poky-linux-gnueabi-ar... (cached) arm-poky-linux-gnueabi-a=
r<br>| checking for archiver @FILE support... @<br>| checking for arm-poky-=
linux-gnueabi-strip... (cached) arm-poky-linux-gnueabi-strip<br>| checking =
for arm-poky-linux-gnueabi-ranlib... arm-poky-linux-gnueabi-ranlib<br>| che=
cking command to parse arm-poky-linux-gnueabi-nm output from arm-poky-linux=
-gnueabi-gcc=C2=A0 -march=3Darmv7ve -marm -mfpu=3Dneon-vfpv4=C2=A0 -mfloat-=
abi=3Dhard -mcpu=3Dcortex-a7 --sysroot=3D/home/gizero/work/smartliving/dist=
ro<br>/repo-master/build-poky/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnu=
eabi/mesa-gl/2_17.1.7-r0/recipe-sysroot object... ok<br>| checking for sysr=
oot... /home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/work=
/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroo=
t<br>| checking for a working dd... /home/gizero/work/smartliving/distro/re=
po-master/build-poky/tmp/hosttools/dd<br>| checking how to truncate binary =
pipes... /home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/ho=
sttools/dd bs=3D4096 count=3D1<br>| checking for arm-poky-linux-gnueabi-mt.=
.. no<br>| checking for mt... no<br>| checking if : is a manifest tool... n=
o<br>| checking for ANSI C header files... (cached) yes<br>| checking for s=
ys/types.h... (cached) yes<br>| checking for sys/stat.h... (cached) yes<br>=
| checking for stdlib.h... (cached) yes<br>| checking for string.h... (cach=
ed) yes<br>| checking for memory.h... (cached) yes<br>| checking for string=
s.h... (cached) yes<br>| checking for inttypes.h... (cached) yes<br>| check=
ing for stdint.h... (cached) yes<br>| checking for unistd.h... (cached) yes=
<br>| checking for dlfcn.h... (cached) yes<br>| checking for objdir... .lib=
s<br>| checking if arm-poky-linux-gnueabi-gcc=C2=A0 -march=3Darmv7ve -marm =
-mfpu=3Dneon-vfpv4=C2=A0 -mfloat-abi=3Dhard -mcpu=3Dcortex-a7 --sysroot=3D/=
home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/work/cortexa=
7hf-neon-vfp<br>v4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot su=
pports -fno-rtti -fno-exceptions... no<br>| checking for arm-poky-linux-gnu=
eabi-gcc=C2=A0 -march=3Darmv7ve -marm -mfpu=3Dneon-vfpv4=C2=A0 -mfloat-abi=
=3Dhard -mcpu=3Dcortex-a7 --sysroot=3D/home/gizero/work/smartliving/distro/=
repo-master/build-poky/tmp/work/cortexa7hf-neon-vf<br>pv4-poky-linux-gnueab=
i/mesa-gl/2_17.1.7-r0/recipe-sysroot option to produce PIC... -fPIC -DPIC<b=
r>| checking if arm-poky-linux-gnueabi-gcc=C2=A0 -march=3Darmv7ve -marm -mf=
pu=3Dneon-vfpv4=C2=A0 -mfloat-abi=3Dhard -mcpu=3Dcortex-a7 --sysroot=3D/hom=
e/gizero/work/smartliving/distro/repo-master/build-poky/tmp/work/cortexa7hf=
-neon-vfp<br>v4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot PIC f=
lag -fPIC -DPIC works... yes<br>| checking if arm-poky-linux-gnueabi-gcc=C2=
=A0 -march=3Darmv7ve -marm -mfpu=3Dneon-vfpv4=C2=A0 -mfloat-abi=3Dhard -mcp=
u=3Dcortex-a7 --sysroot=3D/home/gizero/work/smartliving/distro/repo-master/=
build-poky/tmp/work/cortexa7hf-neon-vfp<br>v4-poky-linux-gnueabi/mesa-gl/2_=
17.1.7-r0/recipe-sysroot static flag -static works... yes<br>| checking if =
arm-poky-linux-gnueabi-gcc=C2=A0 -march=3Darmv7ve -marm -mfpu=3Dneon-vfpv4=
=C2=A0 -mfloat-abi=3Dhard -mcpu=3Dcortex-a7 --sysroot=3D/home/gizero/work/s=
martliving/distro/repo-master/build-poky/tmp/work/cortexa7hf-neon-vfp<br>v4=
-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot supports -c -o file.=
o... yes<br>| checking if arm-poky-linux-gnueabi-gcc=C2=A0 -march=3Darmv7ve=
 -marm -mfpu=3Dneon-vfpv4=C2=A0 -mfloat-abi=3Dhard -mcpu=3Dcortex-a7 --sysr=
oot=3D/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/work/=
cortexa7hf-neon-vfp<br>v4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sys=
root supports -c -o file.o... (cached) yes<br>| checking whether the arm-po=
ky-linux-gnueabi-gcc=C2=A0 -march=3Darmv7ve -marm -mfpu=3Dneon-vfpv4=C2=A0 =
-mfloat-abi=3Dhard -mcpu=3Dcortex-a7 --sysroot=3D/home/gizero/work/smartliv=
ing/distro/repo-master/build-poky/tmp/work/cortexa7hf<br>-neon-vfpv4-poky-l=
inux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot linker (arm-poky-linux-gnue=
abi-ld --sysroot=3D/home/gizero/work/smartliving/distro/repo-master/build-p=
oky/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-<br>gnueabi/mesa-gl/2_17.1.7-=
r0/recipe-sysroot ) supports shared libraries... yes<br>| checking whether =
-lc should be explicitly linked in... no<br>| checking dynamic linker chara=
cteristics... GNU/Linux ld.so<br>| checking how to hardcode library paths i=
nto programs... immediate<br>| checking whether stripping libraries is poss=
ible... yes<br>| checking if libtool supports shared libraries... yes<br>| =
checking whether to build shared libraries... yes<br>| checking whether to =
build static libraries... no<br>| checking how to run the C++ preprocessor.=
.. arm-poky-linux-gnueabi-g++=C2=A0 -march=3Darmv7ve -marm -mfpu=3Dneon-vfp=
v4=C2=A0 -mfloat-abi=3Dhard -mcpu=3Dcortex-a7 --sysroot=3D/home/gizero/work=
/smartliving/distro/repo-master/build-p<br>oky/tmp/work/cortexa7hf-neon-vfp=
v4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot -E<br>| checking f=
or ld used by arm-poky-linux-gnueabi-g++=C2=A0 -march=3Darmv7ve -marm -mfpu=
=3Dneon-vfpv4=C2=A0 -mfloat-abi=3Dhard -mcpu=3Dcortex-a7 --sysroot=3D/home/=
gizero/work/smartliving/distro/repo-master/build-poky/tmp/work/cortexa</div=
><div class=3D"gmail_extra">7hf-neon-vfpv4-poky-linux-gnueabi/mesa-gl/2_17.=
1.7-r0/recipe-sysroot... arm-poky-linux-gnueabi-ld --sysroot=3D/home/gizero=
/work/smartliving/distro/repo-master/build-poky/tmp/work/cortexa7hf-neon-vf=
pv4-poky[78/7834]<br>ueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot<br>| checking=
 if the linker (arm-poky-linux-gnueabi-ld --sysroot=3D/home/gizero/work/sma=
rtliving/distro/repo-master/build-poky/tmp/work/cortexa7hf-neon-vfpv4-poky-=
linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot ) is <br>GNU ld... yes<br>=
| checking whether the arm-poky-linux-gnueabi-g++=C2=A0 -march=3Darmv7ve -m=
arm -mfpu=3Dneon-vfpv4=C2=A0 -mfloat-abi=3Dhard -mcpu=3Dcortex-a7 --sysroot=
=3D/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/work/cor=
texa7hf<br>-neon-vfpv4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroo=
t linker (arm-poky-linux-gnueabi-ld --sysroot=3D/home/gizero/work/smartlivi=
ng/distro/repo-master/build-poky/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-=
<br>gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot ) supports shared libraries.=
.. yes<br>| checking for arm-poky-linux-gnueabi-g++=C2=A0 -march=3Darmv7ve =
-marm -mfpu=3Dneon-vfpv4=C2=A0 -mfloat-abi=3Dhard -mcpu=3Dcortex-a7 --sysro=
ot=3D/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/work/c=
ortexa7hf-neon-vf<br>pv4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysr=
oot option to produce PIC... -fPIC -DPIC<br>| checking if arm-poky-linux-gn=
ueabi-g++=C2=A0 -march=3Darmv7ve -marm -mfpu=3Dneon-vfpv4=C2=A0 -mfloat-abi=
=3Dhard -mcpu=3Dcortex-a7 --sysroot=3D/home/gizero/work/smartliving/distro/=
repo-master/build-poky/tmp/work/cortexa7hf-neon-vfp<br>v4-poky-linux-gnueab=
i/mesa-gl/2_17.1.7-r0/recipe-sysroot PIC flag -fPIC -DPIC works... yes<br>|=
 checking if arm-poky-linux-gnueabi-g++=C2=A0 -march=3Darmv7ve -marm -mfpu=
=3Dneon-vfpv4=C2=A0 -mfloat-abi=3Dhard -mcpu=3Dcortex-a7 --sysroot=3D/home/=
gizero/work/smartliving/distro/repo-master/build-poky/tmp/work/cortexa7hf-n=
eon-vfp<br>v4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot static =
flag -static works... yes<br>| checking if arm-poky-linux-gnueabi-g++=C2=A0=
 -march=3Darmv7ve -marm -mfpu=3Dneon-vfpv4=C2=A0 -mfloat-abi=3Dhard -mcpu=
=3Dcortex-a7 --sysroot=3D/home/gizero/work/smartliving/distro/repo-master/b=
uild-poky/tmp/work/cortexa7hf-neon-vfp<br>v4-poky-linux-gnueabi/mesa-gl/2_1=
7.1.7-r0/recipe-sysroot supports -c -o file.o... yes<br>| checking if arm-p=
oky-linux-gnueabi-g++=C2=A0 -march=3Darmv7ve -marm -mfpu=3Dneon-vfpv4=C2=A0=
 -mfloat-abi=3Dhard -mcpu=3Dcortex-a7 --sysroot=3D/home/gizero/work/smartli=
ving/distro/repo-master/build-poky/tmp/work/cortexa7hf-neon-vfp<br>v4-poky-=
linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot supports -c -o file.o... (=
cached) yes<br>| checking whether the arm-poky-linux-gnueabi-g++=C2=A0 -mar=
ch=3Darmv7ve -marm -mfpu=3Dneon-vfpv4=C2=A0 -mfloat-abi=3Dhard -mcpu=3Dcort=
ex-a7 --sysroot=3D/home/gizero/work/smartliving/distro/repo-master/build-po=
ky/tmp/work/cortexa7hf<br>-neon-vfpv4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r=
0/recipe-sysroot linker (arm-poky-linux-gnueabi-ld --sysroot=3D/home/gizero=
/work/smartliving/distro/repo-master/build-poky/tmp/work/cortexa7hf-neon-vf=
pv4-poky-linux-<br>gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot ) supports sh=
ared libraries... yes<br>| checking dynamic linker characteristics... (cach=
ed) GNU/Linux ld.so<br>| checking how to hardcode library paths into progra=
ms... immediate<br>| checking for rm... rm -f<br>| checking for bison... bi=
son -y<br>| checking if bison is the parser generator... yes<br>| checking =
for flex... flex<br>| checking lex output file root... lex.yy<br>| checking=
 lex library... none needed<br>| checking whether yytext is a pointer... no=
<br>| checking if flex is the lexer generator... yes<br>| checking for inde=
nt... cat<br>| checking if module mako in python is installed... No module =
named mako<br>| no<br>| checking if compiling with clang... no<br>| checkin=
g whether gcc version is sufficient... yes<br>| checking whether __SUNPRO_C=
 is declared... no<br>| checking for __builtin_bswap32... yes<br>| checking=
 for __builtin_bswap64... yes<br>| checking for __builtin_clz... yes<br>| c=
hecking for __builtin_clzll... yes<br>| checking for __builtin_ctz... yes<b=
r>| checking for __builtin_expect... yes<br>| checking for __builtin_ffs...=
 yes<br>| checking for __builtin_ffsll... yes<br>| checking for __builtin_p=
opcount... yes<br>| checking for __builtin_popcountll... yes<br>| checking =
for __builtin_unreachable... yes<br>| checking for __attribute__((const))..=
. yes<br>| checking for __attribute__((flatten))... yes<br>| checking for _=
_attribute__((format))... yes<br>| checking for __attribute__((malloc))... =
yes<br>| checking for __attribute__((packed))... yes<br>| checking for __at=
tribute__((pure))... yes<br>| checking for __attribute__((returns_nonnull))=
... yes=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [2=
5/7834]<br>| checking for __attribute__((unused))... yes<br>| checking for =
__attribute__((visibility))... yes<br>| checking for __attribute__((warn_un=
used_result))... yes<br>| checking for __attribute__((weak))... yes<br>| ch=
ecking for __attribute__((alias))... yes<br>| checking for arm-poky-linux-g=
nueabi-pkg-config... no<br>| checking for pkg-config... /home/gizero/work/s=
martliving/distro/repo-master/build-poky/tmp/work/cortexa7hf-neon-vfpv4-pok=
y-linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot-native/usr/bin/pkg-confi=
g<br>| configure: WARNING: using cross tools not prefixed with host triplet=
<br>| checking pkg-config is at least version 0.9.0... yes<br>| checking wh=
ether arm-poky-linux-gnueabi-gcc=C2=A0 -march=3Darmv7ve -marm -mfpu=3Dneon-=
vfpv4=C2=A0 -mfloat-abi=3Dhard -mcpu=3Dcortex-a7 --sysroot=3D/home/gizero/w=
ork/smartliving/distro/repo-master/build-poky/tmp/work/cortexa7hf-neo<br>n-=
vfpv4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot supports -Werro=
r=3Dmissing-prototypes... yes<br>| checking whether arm-poky-linux-gnueabi-=
gcc=C2=A0 -march=3Darmv7ve -marm -mfpu=3Dneon-vfpv4=C2=A0 -mfloat-abi=3Dhar=
d -mcpu=3Dcortex-a7 --sysroot=3D/home/gizero/work/smartliving/distro/repo-m=
aster/build-poky/tmp/work/cortexa7hf-neo<br>n-vfpv4-poky-linux-gnueabi/mesa=
-gl/2_17.1.7-r0/recipe-sysroot supports -fvisibility=3Dhidden... yes<br>| c=
hecking whether arm-poky-linux-gnueabi-gcc=C2=A0 -march=3Darmv7ve -marm -mf=
pu=3Dneon-vfpv4=C2=A0 -mfloat-abi=3Dhard -mcpu=3Dcortex-a7 --sysroot=3D/hom=
e/gizero/work/smartliving/distro/repo-master/build-poky/tmp/work/cortexa7hf=
-neo<br>n-vfpv4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot suppo=
rts -Werror=3Dvla... yes<br>| checking whether arm-poky-linux-gnueabi-g++=
=C2=A0 -march=3Darmv7ve -marm -mfpu=3Dneon-vfpv4=C2=A0 -mfloat-abi=3Dhard -=
mcpu=3Dcortex-a7 --sysroot=3D/home/gizero/work/smartliving/distro/repo-mast=
er/build-poky/tmp/work/cortexa7hf-neo<br>n-vfpv4-poky-linux-gnueabi/mesa-gl=
/2_17.1.7-r0/recipe-sysroot supports -fvisibility=3Dhidden... yes<br>| chec=
king whether __sync_add_and_fetch_8 is supported... yes<br>| checking wheth=
er byte ordering is bigendian... (cached) no<br>| checking whether gcc supp=
orts -mpower8-vector... no<br>| checking if ld supports -Bsymbolic... yes<b=
r>| checking whether ld supports --gc-sections... yes<br>| checking if the =
linker supports version-scripts... yes<br>| checking if the linker supports=
 --dynamic-list... yes<br>| checking whether to enable assembly... no, plat=
form not supported<br>| checking for sys/types.h... (cached) yes<br>| check=
ing sys/mkdev.h usability... no<br>| checking sys/mkdev.h presence... no<br=
>| checking for sys/mkdev.h... no<br>| checking for sys/sysmacros.h... (cac=
hed) yes<br>| checking xlocale.h usability... no<br>| checking xlocale.h pr=
esence... no<br>| checking for xlocale.h... no<br>| checking for sys/sysctl=
.h... (cached) yes<br>| checking for strtof... yes<br>| checking for mkoste=
mp... yes<br>| checking for dlopen... no<br>| checking for dlopen in -ldl..=
. yes<br>| checking for dladdr... yes<br>| checking for dl_iterate_phdr... =
yes<br>| checking for clock_gettime... yes<br>| checking for posix_memalign=
... (cached) yes<br>| checking for zlib &gt;=3D 1.2.3... yes<br>| checking =
for the pthreads library -lpthreads... no<br>| checking whether pthreads wo=
rk without any flags... no<br>| checking whether pthreads work with -Kthrea=
d... no<br>| checking whether pthreads work with -kthread... no<br>| checki=
ng for the pthreads library -llthread... no<br>| checking whether pthreads =
work with -pthread... yes<br>| checking for joinable pthread attribute... P=
THREAD_CREATE_JOINABLE<br>| checking if more special flags are required for=
 pthreads... no<br>| checking for PTHREAD_PRIO_INHERIT... yes<br>| checking=
 for libelf... no<br>| checking for elf_memory in -lelf... no<br>| ../mesa-=
17.1.7/configure: line 22300: /home/gizero/work/smartliving/distro/repo-mas=
ter/build-poky/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/mesa-gl/2_=
17.1.7-r0/recipe-sysroot-native/usr/bin/llvm-config5<br>.0: No such file or=
 directory<br>| ../mesa-17.1.7/configure: line 22283: /home/gizero/work/sma=
rtliving/distro/repo-master/build-poky/tmp/work/cortexa7hf-neon-vfpv4-poky-=
linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot-native/usr/bin/llvm-config=
5<br>.0: No such file or directory<br>| ../mesa-17.1.7/configure: line 2230=
2: /home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/work/cor=
texa7hf-neon-vfpv4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/recipe-sysroot-na=
tive/usr/bin/llvm-config5<br>.0: No such file or directory<br>| ../mesa-17.=
1.7/configure: line 22303: /home/gizero/work/smartliving/distro/repo-master=
/build-poky/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/mesa-gl/2_17.=
1.7-r0/recipe-sysroot-native/usr/bin/llvm-config5<br>.0: No such file or di=
rectory<br>| configure: error: GLX cannot be built without OpenGL<br>| NOTE=
: The following config.log files may provide further information.<br>| NOTE=
: /home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/work/cort=
exa7hf-neon-vfpv4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/build/config.log<b=
r>| ERROR: configure failed<br>| WARNING: exit code 1 from a shell command.=
<br>| ERROR: Function failed: do_configure (log file is located at /home/gi=
zero/work/smartliving/distro/repo-master/build-poky/tmp/work/cortexa7hf-neo=
n-vfpv4-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/temp/log.do_configu<br>re.13=
91)<br>ERROR: Task (/home/gizero/work/smartliving/distro/repo-master/build-=
poky/conf/../../layers/poky/meta/recipes-graphics/mesa/mesa-gl_17.1.7.bb:do=
_configure) failed with exit code &#39;1&#39;<br></div><div class=3D"gmail_=
extra"><br></div><div class=3D"gmail_extra">This doesn&#39;t seem to be rel=
ated to the bbappend for mesa-gl that is present in meta-raspberrypi, which=
 merely appends &quot;gbm&quot; to PACKAGECONFIG for rpi machines (bitbake =
still complains with this removed). Instead, reverting this commit takes th=
e build back to green light.<br></div><div class=3D"gmail_extra"><br></div>=
</div></div>

--001a113e1f5807dc980558585a1d--
