Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 501A46B55C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Aug 2013 00:53:45 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 08 Aug 2013 17:53:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,842,1367996400"; d="scan'208";a="343810605"
Received: from unknown (HELO [10.255.14.176]) ([10.255.14.176])
	by azsmga001.ch.intel.com with ESMTP; 08 Aug 2013 17:53:43 -0700
Message-ID: <52043D97.8060806@linux.intel.com>
Date: Thu, 08 Aug 2013 17:53:43 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Ross Burton <ross.burton@intel.com>
References: <1375979385-2063-1-git-send-email-ross.burton@intel.com>
In-Reply-To: <1375979385-2063-1-git-send-email-ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] mesa: fix out-of-tree builds when Gallium is enabled
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
X-List-Received-Date: Fri, 09 Aug 2013 00:53:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/08/2013 09:29 AM, Ross Burton wrote:
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   .../mesa/0005-fix-out-of-tree-builds-gallium.patch |   42 ++++++++++++++++++++
>   meta/recipes-graphics/mesa/mesa_9.1.6.bb           |    1 +
>   meta/recipes-graphics/mesa/mesa_git.bb             |    1 +
>   3 files changed, 44 insertions(+)
>   create mode 100644 meta/recipes-graphics/mesa/mesa/0005-fix-out-of-tree-builds-gallium.patch
>

Ross:

I get the following failure when the out-of-tree build occurs:

> | x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 --sysroot=/home/sgw/yocto/builds/world/tmp/sysroots/qemux86-64 -DPACKAGE_NAME=\"Mesa\" -DPACKAGE_TARNAME=\"mesa\" -DPACKAGE_VERSION=\"9.1.6\" "-DPACKAGE_STRING=\"Mesa 9.1.6\"" "-DPACKAGE_BUGREPORT=\"https://bugs.freedesktop.org/enter_bug.cgi?product=Mesa\"" -DPACKAGE_URL=\"\" -DPACKAGE=\"mesa\" -DVERSION=\"9.1.6\" -DSTDC_HEADERS=1 -DHAVE_SYS_TYPES_H=1 -DHAVE_SYS_STAT_H=1 -DHAVE_STDLIB_H=1 -DHAVE_STRING_H=1 -DHAVE_MEMORY_H=1 -DHAVE_STRINGS_H=1 -DHAVE_INTTYPES_H=1 -DHAVE_STDINT_H=1 -DHAVE_UNISTD_H=1 -DHAVE_DLFCN_H=1 -DLT_OBJDIR=\".libs/\" -DYYTEXT_POINTER=1 -DHAVE_CLOCK_GETTIME=1 -DHAVE_PTHREAD=1 -DHAVE_LIBEXPAT=1 -I. -I/home/sgw/yocto/builds/world/tmp/work/x86_64-poky-linux/mesa/2_9.1.6-r0/Mesa-9.1.6/src/egl/drivers/glx -I/home/sgw/yocto/builds/world/tmp/work/x86_64-poky-linux/mesa/2_9.1.6-r0/Mesa-9.1.6/include -I/home/sgw/yocto/builds/world/tmp/work/x86_64-poky-linux/mesa/2_9.1.6-r0/Mesa-9.1.6/src/egl/main -D_GNU_SOUR
CE -DHAVE_PTHREAD -DHAVE_DLOPEN -DHAVE_POSIX_MEMALIGN -DIN_DRI_DRIVER -DGLX_INDIRECT_RENDERING -DGLX_DIRECT_RENDERING -DGLX_USE_TLS -DHAVE_PTHREAD -DUSE_EXTERNAL_DXTN_LIB=1 -DIN_DRI_DRIVER -DHAVE_ALIAS -DHAVE_MINCORE -DHAVE_LIBUDEV -O2 -pipe -g -feliminate-unused-debug-types -fno-omit-frame-pointer -Wall -std=c99 -Werror=implicit-function-declaration -Werror=missing-prototypes -fno-strict-aliasing -fno-builtin-memcmp -c /home/sgw/yocto/builds/world/tmp/work/x86_64-poky-linux/mesa/2_9.1.6-r0/Mesa-9.1.6/src/egl/drivers/glx/egl_glx.c  -fPIC -DPIC -o .libs/egl_glx.o
> | In file included from /home/sgw/yocto/builds/world/tmp/work/x86_64-poky-linux/mesa/2_9.1.6-r0/Mesa-9.1.6/src/egl/main/egltypedefs.h:36:0,
> |                  from /home/sgw/yocto/builds/world/tmp/work/x86_64-poky-linux/mesa/2_9.1.6-r0/Mesa-9.1.6/src/egl/main/eglconfig.h:37,
> |                  from /home/sgw/yocto/builds/world/tmp/work/x86_64-poky-linux/mesa/2_9.1.6-r0/Mesa-9.1.6/src/egl/drivers/glx/egl_glx.c:44:
> | /home/sgw/yocto/builds/world/tmp/work/x86_64-poky-linux/mesa/2_9.1.6-r0/Mesa-9.1.6/include/EGL/egl.h:36:29: fatal error: EGL/eglplatform.h: No such file or directory
> |  #include <EGL/eglplatform.h>
> |                              ^
> | compilation terminated.
> | make[4]: *** [egl_glx.lo] Error 1
It seems that the include path (-I) does not point into the build dir to 
find this file correctly.

Sau!


> diff --git a/meta/recipes-graphics/mesa/mesa/0005-fix-out-of-tree-builds-gallium.patch b/meta/recipes-graphics/mesa/mesa/0005-fix-out-of-tree-builds-gallium.patch
> new file mode 100644
> index 0000000..8c5984f
> --- /dev/null
> +++ b/meta/recipes-graphics/mesa/mesa/0005-fix-out-of-tree-builds-gallium.patch
> @@ -0,0 +1,42 @@
> +Upstream-Status: Submitted
> +Signed-off-by: Ross Burton <ross.burton@intel.com>
> +
> +From 9e31e15ebb0adbf3cc0394c30cbc1ccd2b35a27f Mon Sep 17 00:00:00 2001
> +From: Ross Burton <ross.burton@intel.com>
> +Date: Fri, 28 Jun 2013 11:44:58 +0100
> +Subject: [PATCH] build: fix out-of-tree builds in gallium/auxiliary
> +
> +The rules were writing files to e.g. util/u_indices_gen.py, but in an
> +out-of-tree build this directory doesn't exist in the build directory.  So,
> +create the directories just in case.
> +
> +Signed-off-by: Ross Burton <ross.burton@intel.com>
> +---
> + src/gallium/auxiliary/Makefile.am |    4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/src/gallium/auxiliary/Makefile.am b/src/gallium/auxiliary/Makefile.am
> +index f14279b..0c3e7ba 100644
> +--- a/src/gallium/auxiliary/Makefile.am
> ++++ b/src/gallium/auxiliary/Makefile.am
> +@@ -38,13 +38,17 @@ libgallium_la_SOURCES += \
> + endif
> +
> + indices/u_indices_gen.c: $(srcdir)/indices/u_indices_gen.py
> ++	mkdir --parents indices
> + 	$(AM_V_GEN) $(PYTHON2) $< > $@
> +
> + indices/u_unfilled_gen.c: $(srcdir)/indices/u_unfilled_gen.py
> ++	mkdir --parents indices
> + 	$(AM_V_GEN) $(PYTHON2) $< > $@
> +
> + util/u_format_srgb.c: $(srcdir)/util/u_format_srgb.py
> ++	mkdir --parents util
> + 	$(AM_V_GEN) $(PYTHON2) $< > $@
> +
> + util/u_format_table.c: $(srcdir)/util/u_format_table.py $(srcdir)/util/u_format_pack.py $(srcdir)/util/u_format_parse.py $(srcdir)/util/u_format.csv
> ++	mkdir --parents util
> + 	$(AM_V_GEN) $(PYTHON2) $(srcdir)/util/u_format_table.py $(srcdir)/util/u_format.csv > $@
> +--
> +1.7.10.4
> +
> diff --git a/meta/recipes-graphics/mesa/mesa_9.1.6.bb b/meta/recipes-graphics/mesa/mesa_9.1.6.bb
> index d47822f..7cc0847 100644
> --- a/meta/recipes-graphics/mesa/mesa_9.1.6.bb
> +++ b/meta/recipes-graphics/mesa/mesa_9.1.6.bb
> @@ -6,6 +6,7 @@ SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2 \
>              file://0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch \
>              file://0004-glsl-fix-builtin_compiler-cross-compilation.patch \
>              file://0005-llvmpipe-remove-the-power-of-two-sizeof-struct-cmd_b.patch \
> +           file://0005-fix-out-of-tree-builds-gallium.patch \
>              "
>
>   SRC_URI[md5sum] = "443a2a352667294b53d56cb1a74114e9"
> diff --git a/meta/recipes-graphics/mesa/mesa_git.bb b/meta/recipes-graphics/mesa/mesa_git.bb
> index 52d3d81..1707f03 100644
> --- a/meta/recipes-graphics/mesa/mesa_git.bb
> +++ b/meta/recipes-graphics/mesa/mesa_git.bb
> @@ -13,6 +13,7 @@ SRC_URI = "git://anongit.freedesktop.org/git/mesa/mesa;protocol=git \
>              file://0002-pipe_loader_sw-include-xlib_sw_winsys.h-only-when-HA.patch \
>              file://0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch \
>              file://0004-glsl-fix-builtin_compiler-cross-compilation.patch \
> +           file://0005-fix-out-of-tree-builds-gallium.patch \
>              "
>
>   S = "${WORKDIR}/git"
>

