Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QLP9w-000573-2r
	for openembedded-core@lists.openembedded.org;
	Sun, 15 May 2011 02:26:12 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 May 2011 17:23:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,368,1301900400"; d="scan'208";a="642780256"
Received: from unknown (HELO localhost) ([10.255.12.119])
	by orsmga002.jf.intel.com with ESMTP; 14 May 2011 17:23:01 -0700
Message-Id: <cover.1305418871.git.sgw@linux.intel.com>
Old-Date: Sat, 14 May 2011 17:21:11 -0700
Date: Sat, 14 May 2011 17:23:01 -0700
To: openembedded-core@lists.openembedded.org
CC: 
From: Saul Wold <sgw@linux.intel.com>
Subject: [RFC 0/3] Move Old Recipes to meta-extras
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
X-List-Received-Date: Sun, 15 May 2011 00:26:12 -0000

From: Saul Wold <sgw@linux.intel.com>

This proposes to move the YAFFS2-utils, older clutter-1.4
and older GCC version (4.3.3 and 3.4.4) as they are unused
and currently unbuildable.

Pull URL: git://git.openembedded.org/openembedded-core-contrib
  Branch: sgw/rfc
  Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/rfc

Thanks,
    Saul Wold <sgw@linux.intel.com>
---


Saul Wold (3):
  yaffs2: Remove yaffs2 from oe-core
  clutter: Clean up old recipes
  gcc: Move 4.3.3 and Special kernel gcc-3.4.4 to meta-extras

 meta/classes/image_types.bbclass                   |    3 -
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
 .../gcc/gcc-cross-canadian_4.3.3.bb                |   24 -
 .../gcc/gcc-cross-initial_4.3.3.bb                 |    5 -
 .../gcc/gcc-cross-intermediate_4.3.3.bb            |    4 -
 .../gcc/gcc-cross-kernel-3.4.4_csl-arm-2005q3.bb   |   15 -
 meta/recipes-devtools/gcc/gcc-cross_4.3.3.bb       |   10 -
 .../gcc/gcc-crosssdk-initial_4.3.3.bb              |    3 -
 .../gcc/gcc-crosssdk-intermediate_4.3.3.bb         |    3 -
 meta/recipes-devtools/gcc/gcc-crosssdk_4.3.3.bb    |    3 -
 meta/recipes-devtools/gcc/gcc-runtime_4.3.3.bb     |   11 -
 meta/recipes-devtools/gcc/gcc_4.3.3.bb             |   10 -
 .../yaffs2/files/mkyaffs2image.patch               |  351 -
 .../yaffs2/files/yaffs2-unioob.patch               |  218 -
 meta/recipes-devtools/yaffs2/yaffs2-utils.inc      |   28 -
 meta/recipes-devtools/yaffs2/yaffs2-utils_cvs.bb   |    4 -
 meta/recipes-graphics/clutter/clutter-1.4_1.4.2.bb |   25 -
 meta/recipes-graphics/clutter/clutter-box2d_git.bb |    4 +-
 .../clutter/clutter-gst-1.4/enable_tests.patch     |   15 -
 .../clutter/clutter-gst-1.4_git.bb                 |   19 -
 .../clutter/clutter-gtk-1.4_git.bb                 |   18 -
 94 files changed, 2 insertions(+), 18490 deletions(-)
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



