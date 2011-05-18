Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QMbzn-0000cx-Gh
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 10:20:46 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 18 May 2011 01:17:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,230,1304319600"; 
   d="scan'208";a="3834278"
Received: from unknown (HELO localhost) ([10.255.12.160])
	by fmsmga001.fm.intel.com with ESMTP; 18 May 2011 01:17:47 -0700
Message-Id: <cover.1305702436.git.sgw@linux.intel.com>
Old-Date: Wed, 18 May 2011 00:07:16 -0700
Date: Wed, 18 May 2011  1:17:47 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Robert Yang <liezhi.yang@windriver.com>
Subject: [PATCH 00/15] 18-May-2011 Consolidated Pull
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 May 2011 08:20:46 -0000

From: Saul Wold <sgw@linux.intel.com>

Richard,

This requests includes the removal of clutter, yaffs and older
gcc version, along with the GCC 4.6 Update for x86 and arm.

There is the start of the meta-skeleton layer, which I believe
we want to be part of oe-core for solid examples to developers.

As of this writing there is a problem with perl which I think a
change to the utils.bbclass might fix (adding readlink -fn $0), but
I am still testing this.


Pull URL: git://git.openembedded.org/openembedded-core-contrib
  Branch: sgw/stage
  Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Thanks,
    Saul Wold <sgw@linux.intel.com>
---


Jessica Zhang (1):
  Couple minor fixes for the OECORE rename

Nitin A Kamble (2):
  tcmode-default: switch to gcc 4.6.0 for x86, x86-64 & arm
  gcc: remove unused patches and move patches in proper dir

Robert Yang (4):
  Add the layer meta-skeleton
  Cleanup the whitespace in functions
  Add pidofproc to ${sysconfdir}/init.d/functions
  Add a skeleton for init scripts

Saul Wold (7):
  yaffs2: Remove yaffs2 from oe-core
  gcc: Move 4.3.3 and Special kernel 3.4.4 to meta-extras
  clutter: Clean up old recipes
  task-core-clutter: Update to 1.6
  world-broken: remove non-existent items
  qemu: Fix Dependency and compatible machines
  gst-openmax: Add patch for GCC 4.6.0

Scott Garman (1):
  recipes: add Upstream-Status to various recipe patches

 meta-skeleton/conf/layer.conf                      |   10 +
 .../recipes-skeleton/service/service/COPYRIGHT     |   15 +
 .../recipes-skeleton/service/service/skeleton      |  193 +
 .../service/service/skeleton_test.c                |   12 +
 .../recipes-skeleton/service/service_0.1.bb        |   32 +
 meta/classes/image_types.bbclass                   |    3 -
 meta/classes/toolchain-scripts.bbclass             |    6 +-
 meta/conf/bitbake.conf                             |    2 +-
 meta/conf/distro/include/tcmode-default.inc        |    8 +-
 meta/conf/distro/include/world-broken.inc          |    5 -
 meta/recipes-bsp/apmd/apmd-3.2.2-14/libtool.patch  |   28 +-
 meta/recipes-bsp/apmd/apmd-3.2.2-14/unlinux.patch  |   20 +-
 .../eglibc/eglibc-2.12/IO-acquire-lock-fix.patch   |    2 +
 .../eglibc/eglibc-2.12/armv4t-interworking.patch   |   78 -
 .../eglibc-svn-arm-lowlevellock-include-tls.patch  |    2 +
 .../eglibc/eglibc-2.12/fix-for-make-3.82.diff      |    2 +
 .../eglibc/eglibc-2.12/ld-search-order.patch       |    2 +
 .../eglibc/eglibc-2.12/mips-rld-map-check.patch    |    2 +
 .../eglibc-2.12/shorten-build-commands.patch       |    2 +
 .../eglibc/eglibc-2.13/armv4t-interworking.patch   |   82 -
 .../eglibc/eglibc-2.13/ld-search-order.patch       |    2 +
 .../eglibc/eglibc-2.13/mips-rld-map-check.patch    |    2 +
 .../eglibc-2.13/shorten-build-commands.patch       |    2 +
 .../eglibc/ldconfig-native-2.12.1/32and64bit.patch |    8 +
 .../endian-ness_handling.patch                     |    5 +-
 .../eglibc/ldconfig-native-2.12.1/flag_fix.patch   |    2 +
 .../eglibc/ldconfig-native-2.12.1/ldconfig.patch   |    4 +
 .../ldconfig_aux-cache_path_fix.patch              |    2 +
 .../glibc/glibc-2.10.1/arm-check-pf.patch          |   16 -
 .../arm-lowlevellock-include-tls.patch             |   14 -
 .../glibc-2.9-enable-binutils-2.2.patch            |    2 +-
 .../glibc/glibc-2.10.1/glibc-check_pf.patch        |    2 +
 .../glibc/glibc-2.10.1/local-args6.diff            |   14 -
 .../initscripts/initscripts-1.0/functions          |   39 +-
 .../files/canadian-build-modules-configure.patch   |   22 -
 .../gcc/files/gcc-4.3.3-fix-EXTRA_BUILD.patch      |   12 -
 .../gcc/files/gcc-4.3.x-fix-EXTRA_BUILD.patch      |   13 -
 .../gcc/files/gcc-posix-open-fix.patch             |   11 -
 .../gcc/files/gcc4-mtune-compat.patch              |   14 -
 .../gcc/files/gfortran-4.3.x.patch                 |   40 -
 .../gcc/files/pr22133-mingw-path-fixup.patch       |   29 -
 .../gcc/files/pr33281-mingw-host-fragment.patch    |   38 -
 ...35916-mingw-__USE_MINGW_ACCESS-everywhere.patch |   13 -
 meta/recipes-devtools/gcc/gcc-4.3.3.inc            |   71 -
 .../gcc/gcc-4.3.3/100-uclibc-conf.patch            |   37 -
 .../gcc/gcc-4.3.3/103-uclibc-conf-noupstream.patch |   11 -
 .../gcc/gcc-4.3.3/110-arm-eabi.patch               |   27 -
 .../gcc/gcc-4.3.3/200-uclibc-locale.patch          | 2833 ---------
 .../gcc/gcc-4.3.3/203-uclibc-locale-no__x.patch    |  233 -
 .../gcc-4.3.3/204-uclibc-locale-wchar_fix.patch    |   48 -
 .../gcc/gcc-4.3.3/205-uclibc-locale-update.patch   |  519 --
 .../gcc/gcc-4.3.3/300-libstdc++-pic.patch          |   46 -
 .../gcc/gcc-4.3.3/301-missing-execinfo_h.patch     |   11 -
 .../gcc/gcc-4.3.3/302-c99-snprintf.patch           |   13 -
 .../gcc/gcc-4.3.3/303-c99-complex-ugly-hack.patch  |   12 -
 .../gcc/gcc-4.3.3/304-index_macro.patch            |   24 -
 .../gcc-4.3.3/305-libmudflap-susv3-legacy.patch    |   49 -
 .../gcc/gcc-4.3.3/306-libstdc++-namespace.patch    |   36 -
 .../gcc/gcc-4.3.3/307-locale_facets.patch          |   19 -
 .../gcc-4.3.3/402-libbackend_dep_gcov-iov.h.patch  |   13 -
 .../gcc/gcc-4.3.3/602-sdk-libstdc++-includes.patch |   20 -
 .../recipes-devtools/gcc/gcc-4.3.3/64bithack.patch |   33 -
 .../gcc/gcc-4.3.3/740-sh-pr24836.patch             |   25 -
 .../gcc/gcc-4.3.3/800-arm-bigendian.patch          |   34 -
 .../gcc/gcc-4.3.3/801-arm-bigendian-eabi.patch     |   14 -
 .../gcc/gcc-4.3.3/904-flatten-switch-stmt-00.patch |  153 -
 .../gcc/gcc-4.3.3/arm-nolibfloat.patch             |   24 -
 .../gcc/gcc-4.3.3/arm-softfloat.patch              |   16 -
 .../gcc/gcc-4.3.3/arm-thumb-cache.patch            |   29 -
 .../recipes-devtools/gcc/gcc-4.3.3/arm-thumb.patch |   43 -
 .../gcc/gcc-4.3.3/cache-amnesia.patch              |   31 -
 .../debian/arm-unbreak-eabi-armv4t.dpatch          |   36 -
 .../gcc/gcc-4.3.3/debian/gcc-ice-hack.dpatch       |  331 -
 .../gcc/gcc-4.3.3/debian/libstdc++-pic.dpatch      |   71 -
 .../gcc/gcc-4.3.3/debian/pr30961.dpatch            |  179 -
 .../fedora/gcc43-c++-builtin-redecl.patch          |  102 -
 .../gcc/gcc-4.3.3/fedora/gcc43-cpp-pragma.patch    |  284 -
 .../gcc/gcc-4.3.3/fedora/gcc43-i386-libgomp.patch  |   61 -
 .../gcc-4.3.3/fedora/gcc43-ia64-libunwind.patch    |  538 --
 .../fedora/gcc43-java-debug-iface-type.patch       |   17 -
 .../gcc/gcc-4.3.3/fedora/gcc43-java-nomulti.patch  |   44 -
 .../gcc-4.3.3/fedora/gcc43-libgomp-speedup.patch   | 2797 --------
 .../gcc/gcc-4.3.3/fedora/gcc43-ppc32-retaddr.patch |   86 -
 .../gcc/gcc-4.3.3/fedora/gcc43-pr27898.patch       |   16 -
 .../gcc/gcc-4.3.3/fedora/gcc43-pr32139.patch       |   19 -
 .../gcc/gcc-4.3.3/fedora/gcc43-pr33763.patch       |  153 -
 .../gcc/gcc-4.3.3/fedora/gcc43-pr35440.patch       |   56 -
 .../gcc/gcc-4.3.3/fedora/gcc43-pr35751.patch       |  114 -
 .../gcc/gcc-4.3.3/fedora/gcc43-rh251682.patch      |   89 -
 .../gcc/gcc-4.3.3/fedora/gcc43-rh330771.patch      |   34 -
 .../gcc/gcc-4.3.3/fedora/gcc43-rh341221.patch      |   28 -
 .../gcc/gcc-4.3.3/fortran-cross-compile-hack.patch |   30 -
 .../gcc/gcc-4.3.3/fortran-static-linking.patch     |   48 -
 .../gcc/gcc-4.3.3/gcc-4.0.2-e300c2c3.patch         |  319 -
 .../gcc-4.3.3/gcc-4.2.3-linux-multilib-fix.patch   |   23 -
 .../gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch          |   31 -
 .../gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch      | 6691 --------------------
 .../gcc/gcc-4.3.3/gcc-arm-frename-registers.patch  |   25 -
 .../gcc/gcc-4.3.3/gcc-flags-for-build.patch        |  279 -
 .../gcc-release-branch/PR-36500-fix-neon.patch     |  265 -
 .../gcc/gcc-4.3.3/gcc41-configure.in.patch         |   22 -
 .../gcc/gcc-4.3.3/gcc43-build-id.patch             |   74 -
 .../gcc/gcc-4.3.3/gcc43-ppc64-ia64-GNU-stack.patch |   86 -
 meta/recipes-devtools/gcc/gcc-4.3.3/gfortran.patch |   40 -
 .../gcc/gcc-4.3.3/headerpath.patch                 |   42 -
 .../gcc/gcc-4.3.3/intermask-bigendian.patch        |   24 -
 meta/recipes-devtools/gcc/gcc-4.3.3/ldflags.patch  |   22 -
 .../gcc/gcc-4.3.3/optional_libstdc.patch           |   23 -
 meta/recipes-devtools/gcc/gcc-4.3.3/pr34130.patch  |   16 -
 meta/recipes-devtools/gcc/gcc-4.3.3/pr35942.patch  |   38 -
 .../gcc/gcc-4.3.3/sdk-libstdc++-includes.patch     |   22 -
 .../gcc/gcc-4.3.3/sh3-installfix-fixheaders.patch  |   11 -
 .../recipes-devtools/gcc/gcc-4.3.3/sh_unwind.patch |   18 -
 .../gcc/gcc-4.3.3/sparseset_rule.patch             |   20 -
 .../gcc/gcc-4.3.3/unbreak-armv4t.patch             |   12 -
 .../gcc/gcc-4.3.3/zecke-no-host-includes.patch     |   31 -
 .../gcc/gcc-4.3.3/zecke-xgcc-cpp.patch             |   28 -
 .../fedora/gcc43-c++-builtin-redecl.patch          |    1 +
 .../gcc/gcc-4.5.1/fedora/gcc43-cpp-pragma.patch    |    1 +
 .../gcc/gcc-4.5.1/fedora/gcc43-i386-libgomp.patch  |    1 +
 .../gcc-4.5.1/fedora/gcc43-ia64-libunwind.patch    |    1 +
 .../fedora/gcc43-java-debug-iface-type.patch       |    1 +
 .../gcc/gcc-4.5.1/fedora/gcc43-java-nomulti.patch  |    1 +
 .../gcc-4.5.1/fedora/gcc43-libgomp-speedup.patch   |    1 +
 .../gcc/gcc-4.5.1/fedora/gcc43-ppc32-retaddr.patch |    1 +
 .../gcc/gcc-4.5.1/fedora/gcc43-pr27898.patch       |    1 +
 .../gcc/gcc-4.5.1/fedora/gcc43-pr32139.patch       |    1 +
 .../gcc/gcc-4.5.1/fedora/gcc43-pr33763.patch       |    1 +
 .../gcc/gcc-4.5.1/fedora/gcc43-rh251682.patch      |    1 +
 .../gcc/gcc-4.5.1/fedora/gcc43-rh330771.patch      |    1 +
 .../gcc/gcc-4.5.1/fedora/gcc43-rh341221.patch      |    1 +
 .../gcc/gcc-4.5.1/fedora/gcc45-no-add-needed.patch |    1 +
 .../gcc/gcc-cross-canadian_4.3.3.bb                |   24 -
 .../gcc/gcc-cross-initial_4.3.3.bb                 |    5 -
 .../gcc/gcc-cross-intermediate_4.3.3.bb            |    4 -
 .../gcc/gcc-cross-kernel-3.4.4_csl-arm-2005q3.bb   |   15 -
 meta/recipes-devtools/gcc/gcc-cross_4.3.3.bb       |   10 -
 .../gcc/gcc-crosssdk-initial_4.3.3.bb              |    3 -
 .../gcc/gcc-crosssdk-intermediate_4.3.3.bb         |    3 -
 meta/recipes-devtools/gcc/gcc-crosssdk_4.3.3.bb    |    3 -
 meta/recipes-devtools/gcc/gcc-csl-arm/15342.patch  |   22 -
 .../gcc/gcc-csl-arm/arm-nolibfloat.patch           |    1 +
 .../gcc/gcc-csl-arm/arm-softfloat.patch            |    1 +
 .../gcc/gcc-csl-arm/cache-amnesia.patch            |   13 -
 .../gcc/gcc-csl-arm/fortran-static-linking.patch   |   48 -
 .../gcc/gcc-csl-arm/gcc-3.4.0-arm-lib1asm.patch    |   24 -
 .../gcc/gcc-csl-arm/gcc-3.4.4-eabi-bigendian.patch |    1 +
 .../gcc/gcc-csl-arm/gcc-3.4.4-makefile-fix.patch   |    1 +
 .../gcc/gcc-csl-arm/gcc-configure-no-fortran.patch |    1 +
 .../gcc/gcc-csl-arm/gcc-new-makeinfo.patch         |    1 +
 .../gcc/gcc-csl-arm/gcc34-arm-tune.patch           |    9 -
 .../gcc/gcc-csl-arm/gcc41-configure.in.patch       |    2 +
 .../gcc/gcc-csl-arm/gcc_optab_arm.patch            |    2 +
 .../gcc/{files => gcc-csl-arm}/gfortran.patch      |    2 +
 .../gcc/gcc-csl-arm/no-libfloat.patch              |   11 -
 .../gcc/gcc-csl-arm/pic-without-sl.patch           |  303 -
 .../recipes-devtools/gcc/gcc-csl-arm/pr34130.patch |   16 -
 .../gcc/gcc-csl-arm/zecke-no-host-includes.patch   |    2 +
 .../gcc/gcc-csl-arm/zecke-xgcc-cpp.patch           |    1 +
 meta/recipes-devtools/gcc/gcc-runtime_4.3.3.bb     |   11 -
 meta/recipes-devtools/gcc/gcc_4.3.3.bb             |   10 -
 .../insserv/files/disable_runtests.patch           |   11 +-
 meta/recipes-devtools/insserv/files/makefile.patch |   11 +-
 .../libtool/libtool/fix-final-rpath.patch          |    2 +-
 .../libtool/libtool/prefix-manpage-fix.patch       |    2 +-
 meta/recipes-devtools/libtool/libtool/prefix.patch |    2 +-
 .../linuxdoc-tools-native/disable_dvips_doc.patch  |    4 +
 .../linuxdoc-tools-native/disable_sgml2rtf.patch   |    4 +
 .../linuxdoc-tools-native/disable_tex_doc.patch    |    4 +
 .../linuxdoc-tools-native/disable_txt_doc.patch    |    4 +
 meta/recipes-devtools/m4/m4/ac_config_links.patch  |    2 +
 .../m4/m4/fix_for_circular_dependency.patch        |    2 +
 meta/recipes-devtools/m4/m4/make.patch             |    1 +
 .../openjade/openjade-1.3.2/makefile.patch         |    4 +
 .../user-declared-default-constructor.patch        |    4 +
 .../python-native/04-default-is-optimized.patch    |    2 +
 .../10-distutils-fix-swig-parameter.patch          |    2 +
 .../11-distutils-never-modify-shebang-line.patch   |    2 +
 ...2-distutils-prefix-is-inside-staging-area.patch |    2 +
 .../python/python-native/debug.patch               |    2 +
 .../python/python-native/nohostlibs.patch          |    2 +
 meta/recipes-devtools/qemu/qemu.inc                |   10 +-
 meta/recipes-devtools/qemu/qemu_0.14.0.bb          |    2 +-
 meta/recipes-devtools/qemu/qemu_git.bb             |    7 +-
 meta/recipes-devtools/sgmlspl/files/combined.patch |    3 +
 .../yaffs2/files/mkyaffs2image.patch               |  351 -
 .../yaffs2/files/yaffs2-unioob.patch               |  218 -
 meta/recipes-devtools/yaffs2/yaffs2-utils.inc      |   28 -
 meta/recipes-devtools/yaffs2/yaffs2-utils_cvs.bb   |    4 -
 meta/recipes-extended/sudo/files/libtool.patch     |    2 +-
 meta/recipes-graphics/clutter/clutter-1.4_1.4.2.bb |   25 -
 meta/recipes-graphics/clutter/clutter-box2d_git.bb |    4 +-
 .../clutter/clutter-gst-1.4/enable_tests.patch     |   15 -
 .../clutter/clutter-gst-1.4_git.bb                 |   19 -
 .../clutter/clutter-gtk-1.4_git.bb                 |   18 -
 meta/recipes-graphics/tasks/task-core-clutter.bb   |   12 +-
 .../gstreamer/gst-openmax/gcc_4.6.patch            |   18 +
 .../gstreamer/gst-openmax_0.10.1.bb                |    6 +-
 198 files changed, 510 insertions(+), 19396 deletions(-)
 create mode 100644 meta-skeleton/conf/layer.conf
 create mode 100644 meta-skeleton/recipes-skeleton/service/service/COPYRIGHT
 create mode 100644 meta-skeleton/recipes-skeleton/service/service/skeleton
 create mode 100644 meta-skeleton/recipes-skeleton/service/service/skeleton_test.c
 create mode 100644 meta-skeleton/recipes-skeleton/service/service_0.1.bb
 delete mode 100644 meta/recipes-core/eglibc/eglibc-2.12/armv4t-interworking.patch
 delete mode 100644 meta/recipes-core/eglibc/eglibc-2.13/armv4t-interworking.patch
 delete mode 100644 meta/recipes-core/glibc/glibc-2.10.1/arm-check-pf.patch
 delete mode 100644 meta/recipes-core/glibc/glibc-2.10.1/arm-lowlevellock-include-tls.patch
 delete mode 100644 meta/recipes-core/glibc/glibc-2.10.1/local-args6.diff
 delete mode 100644 meta/recipes-devtools/gcc/files/canadian-build-modules-configure.patch
 delete mode 100644 meta/recipes-devtools/gcc/files/gcc-4.3.3-fix-EXTRA_BUILD.patch
 delete mode 100644 meta/recipes-devtools/gcc/files/gcc-4.3.x-fix-EXTRA_BUILD.patch
 delete mode 100644 meta/recipes-devtools/gcc/files/gcc-posix-open-fix.patch
 delete mode 100644 meta/recipes-devtools/gcc/files/gcc4-mtune-compat.patch
 delete mode 100644 meta/recipes-devtools/gcc/files/gfortran-4.3.x.patch
 delete mode 100644 meta/recipes-devtools/gcc/files/pr22133-mingw-path-fixup.patch
 delete mode 100644 meta/recipes-devtools/gcc/files/pr33281-mingw-host-fragment.patch
 delete mode 100644 meta/recipes-devtools/gcc/files/pr35916-mingw-__USE_MINGW_ACCESS-everywhere.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3.inc
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3/100-uclibc-conf.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3/103-uclibc-conf-noupstream.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3/110-arm-eabi.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3/200-uclibc-locale.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3/203-uclibc-locale-no__x.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3/204-uclibc-locale-wchar_fix.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3/205-uclibc-locale-update.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3/300-libstdc++-pic.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3/301-missing-execinfo_h.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3/302-c99-snprintf.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3/303-c99-complex-ugly-hack.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3/304-index_macro.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3/305-libmudflap-susv3-legacy.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3/306-libstdc++-namespace.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3/307-locale_facets.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3/402-libbackend_dep_gcov-iov.h.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3/602-sdk-libstdc++-includes.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3/64bithack.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3/740-sh-pr24836.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3/800-arm-bigendian.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3/801-arm-bigendian-eabi.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3/904-flatten-switch-stmt-00.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3/arm-nolibfloat.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3/arm-softfloat.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3/arm-thumb-cache.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3/arm-thumb.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3/cache-amnesia.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3/debian/arm-unbreak-eabi-armv4t.dpatch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3/debian/gcc-ice-hack.dpatch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3/debian/libstdc++-pic.dpatch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3/debian/pr30961.dpatch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3/fedora/gcc43-c++-builtin-redecl.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3/fedora/gcc43-cpp-pragma.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3/fedora/gcc43-i386-libgomp.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3/fedora/gcc43-ia64-libunwind.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3/fedora/gcc43-java-debug-iface-type.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3/fedora/gcc43-java-nomulti.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3/fedora/gcc43-libgomp-speedup.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3/fedora/gcc43-ppc32-retaddr.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3/fedora/gcc43-pr27898.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3/fedora/gcc43-pr32139.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3/fedora/gcc43-pr33763.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3/fedora/gcc43-pr35440.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3/fedora/gcc43-pr35751.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3/fedora/gcc43-rh251682.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3/fedora/gcc43-rh330771.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3/fedora/gcc43-rh341221.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3/fortran-cross-compile-hack.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3/fortran-static-linking.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3/gcc-4.0.2-e300c2c3.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3/gcc-4.2.3-linux-multilib-fix.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3/gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3/gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3/gcc-arm-frename-registers.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3/gcc-flags-for-build.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3/gcc-release-branch/PR-36500-fix-neon.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3/gcc41-configure.in.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3/gcc43-build-id.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3/gcc43-ppc64-ia64-GNU-stack.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3/gfortran.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3/headerpath.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3/intermask-bigendian.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3/ldflags.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3/optional_libstdc.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3/pr34130.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3/pr35942.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3/sdk-libstdc++-includes.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3/sh3-installfix-fixheaders.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3/sh_unwind.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3/sparseset_rule.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3/unbreak-armv4t.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3/zecke-no-host-includes.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3/zecke-xgcc-cpp.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-cross-canadian_4.3.3.bb
 delete mode 100644 meta/recipes-devtools/gcc/gcc-cross-initial_4.3.3.bb
 delete mode 100644 meta/recipes-devtools/gcc/gcc-cross-intermediate_4.3.3.bb
 delete mode 100644 meta/recipes-devtools/gcc/gcc-cross-kernel-3.4.4_csl-arm-2005q3.bb
 delete mode 100644 meta/recipes-devtools/gcc/gcc-cross_4.3.3.bb
 delete mode 100644 meta/recipes-devtools/gcc/gcc-crosssdk-initial_4.3.3.bb
 delete mode 100644 meta/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.3.3.bb
 delete mode 100644 meta/recipes-devtools/gcc/gcc-crosssdk_4.3.3.bb
 delete mode 100644 meta/recipes-devtools/gcc/gcc-csl-arm/15342.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-csl-arm/cache-amnesia.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-csl-arm/fortran-static-linking.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-csl-arm/gcc-3.4.0-arm-lib1asm.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-csl-arm/gcc34-arm-tune.patch
 rename meta/recipes-devtools/gcc/{files => gcc-csl-arm}/gfortran.patch (98%)
 delete mode 100644 meta/recipes-devtools/gcc/gcc-csl-arm/no-libfloat.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-csl-arm/pic-without-sl.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-csl-arm/pr34130.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-runtime_4.3.3.bb
 delete mode 100644 meta/recipes-devtools/gcc/gcc_4.3.3.bb
 delete mode 100644 meta/recipes-devtools/yaffs2/files/mkyaffs2image.patch
 delete mode 100644 meta/recipes-devtools/yaffs2/files/yaffs2-unioob.patch
 delete mode 100644 meta/recipes-devtools/yaffs2/yaffs2-utils.inc
 delete mode 100644 meta/recipes-devtools/yaffs2/yaffs2-utils_cvs.bb
 delete mode 100644 meta/recipes-graphics/clutter/clutter-1.4_1.4.2.bb
 delete mode 100644 meta/recipes-graphics/clutter/clutter-gst-1.4/enable_tests.patch
 delete mode 100644 meta/recipes-graphics/clutter/clutter-gst-1.4_git.bb
 delete mode 100644 meta/recipes-graphics/clutter/clutter-gtk-1.4_git.bb
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-openmax/gcc_4.6.patch

-- 
1.7.3.4



