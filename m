Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Si5VJ-0005bC-KH
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jun 2012 17:10:34 +0200
Received: by dalh21 with SMTP id h21so2335255dal.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jun 2012 07:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=gCC1VeNxCz4f/1ROrCANElxrOzT9SGEewYyXUDhXv0o=;
	b=zx+cOJ0Nn3bKZRmK6FBl9qZuZn6RZxiOrT23C4/Be0lMz/v1Oll/AnhFNzHbtbFo5d
	sT/Wl2UQHZQeygIzlm+oS9qJyLlJt49vMSusAHq4RhCxC8FBrzMSr+5EbrzUgZg76d8v
	H+1B+DcQsRUCQGyJI3+YqfSsNxgU9VZse4omwA5oEPsLolmGOwefl+exTwTkHOINj9WR
	AEUWQ5vbrzkH4cIWJSpxLJSjIgssc5p4JZ8xuzNyuz/YSQl7y5qni3/YgwMmlTJk/WxU
	AoNEoXAK0Ay/PtVqOrxJUAyxtlU3ISjVsFjYIVgzXT4pK2Px360riVJpf7eUZ3KZ9Nex
	xYjw==
Received: by 10.68.222.40 with SMTP id qj8mr10363231pbc.139.1340377185682;
	Fri, 22 Jun 2012 07:59:45 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id ua6sm39178975pbc.20.2012.06.22.07.59.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 22 Jun 2012 07:59:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jun 2012 07:59:26 -0700
Message-Id: <cover.1340377031.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/3] Remove old eglibc and gcc recipes
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
X-List-Received-Date: Fri, 22 Jun 2012 15:10:34 -0000

Delete unused old gcc and eglibc recipes
gcc 4.6 can be moved to toolchain-layer
if there is interest.

The following changes since commit e2cc4a44d510e0d473d15f207c1c886db6a5ccf7:

  [PATCH] guile: fix compilation on MIPS/PPC (2012-06-21 13:41:12 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/delete-old-toolchain
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/delete-old-toolchain

Khem Raj (3):
  gcc-4.6: Retire into toochain-layer
  eglibc-2.13: Retire into toolchain layer
  gcc: Remove csl gcc recipes

 .../eglibc/cross-localedef-native_2.13.bb          |   43 -
 .../eglibc/eglibc-2.13/IO-acquire-lock-fix.patch   |   17 -
 .../eglibc-2.13/armv4-eabi-compile-fix.patch       |   25 -
 .../eglibc-svn-arm-lowlevellock-include-tls.patch  |   21 -
 .../eglibc/eglibc-2.13/generate-supported.mk       |   11 -
 .../eglibc/eglibc-2.13/ld-search-order.patch       |   56 -
 .../eglibc/eglibc-2.13/mips-rld-map-check.patch    |   26 -
 .../eglibc/eglibc-2.13/multilib_readlib.patch      |   17 -
 .../recipes-core/eglibc/eglibc-2.13/ppc-sqrt.patch |  538 ----
 .../eglibc/eglibc-2.13/stack-protector-test.patch  |   35 -
 .../eglibc-2.13/use-sysroot-cxx-headers.patch      |   36 -
 meta/recipes-core/eglibc/eglibc-initial_2.13.bb    |    6 -
 meta/recipes-core/eglibc/eglibc-locale_2.13.bb     |    1 -
 meta/recipes-core/eglibc/eglibc_2.13.bb            |  218 --
 meta/recipes-devtools/gcc/gcc-4.6.inc              |  119 -
 .../gcc/gcc-4.6/100-uclibc-conf.patch              |   39 -
 .../gcc/gcc-4.6/103-uclibc-conf-noupstream.patch   |   17 -
 .../gcc/gcc-4.6/200-uclibc-locale.patch            | 2842 --------------------
 .../gcc/gcc-4.6/203-uclibc-locale-no__x.patch      |  235 --
 .../gcc/gcc-4.6/204-uclibc-locale-wchar_fix.patch  |   54 -
 .../gcc/gcc-4.6/205-uclibc-locale-update.patch     |  521 ----
 .../gcc/gcc-4.6/301-missing-execinfo_h.patch       |   15 -
 .../gcc/gcc-4.6/302-c99-snprintf.patch             |   15 -
 .../gcc/gcc-4.6/303-c99-complex-ugly-hack.patch    |   16 -
 .../gcc/gcc-4.6/304-index_macro.patch              |   30 -
 .../gcc/gcc-4.6/305-libmudflap-susv3-legacy.patch  |   51 -
 .../gcc/gcc-4.6/306-libstdc++-namespace.patch      |   40 -
 meta/recipes-devtools/gcc/gcc-4.6/64bithack.patch  |   68 -
 .../gcc/gcc-4.6/740-sh-pr24836.patch               |   31 -
 .../gcc/gcc-4.6/800-arm-bigendian.patch            |   36 -
 .../gcc/gcc-4.6/904-flatten-switch-stmt-00.patch   |   76 -
 .../gcc/gcc-4.6/COLLECT_GCC_OPTIONS.patch          |   25 -
 .../GPLUSPLUS_INCLUDE_DIR_with_sysroot.patch       |  186 --
 .../gcc/gcc-4.6/arm-nolibfloat.patch               |   26 -
 .../gcc/gcc-4.6/arm-softfloat.patch                |   18 -
 .../gcc/gcc-4.6/cache-amnesia.patch                |   33 -
 .../gcc/gcc-4.6/cpp-honour-sysroot.patch           |   40 -
 .../gcc/gcc-4.6/disable_relax_pic_calls_flag.patch |   48 -
 .../gcc/gcc-4.6/fix-for-ice-50099.patch            |   49 -
 .../gcc/gcc-4.6/fortran-cross-compile-hack.patch   |   32 -
 .../gcc-4.6/gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch  |   33 -
 .../gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch      |  116 -
 .../gcc/gcc-4.6/gcc-argument-list-too-long.patch   |   33 -
 .../gcc/gcc-4.6/gcc-arm-set-cost.patch             |   35 -
 .../gcc/gcc-4.6/gcc-flags-for-build.patch          |  189 --
 .../gcc/gcc-4.6/gcc-poison-dir-extend.patch        |   27 -
 .../gcc-4.6/gcc-poison-system-directories.patch    |  223 --
 .../gcc-uclibc-locale-ctype_touplow_t.patch        |   72 -
 .../gcc/gcc-4.6/gcc-with-linker-hash-style.patch   |  196 --
 .../gcc/gcc-4.6/mips64-default-n64.patch           |   32 -
 .../gcc/gcc-4.6/optional_libstdc.patch             |   86 -
 .../gcc/gcc-4.6/powerpc-e5500.patch                |  465 ----
 meta/recipes-devtools/gcc/gcc-4.6/pr32219.patch    |   72 -
 meta/recipes-devtools/gcc/gcc-4.6/pr46934.patch    |  393 ---
 meta/recipes-devtools/gcc/gcc-4.6/pr47551.patch    |   64 -
 .../gcc/gcc-4.6/use-defaults.h-and-t-oe-in-B.patch |   80 -
 .../gcc/gcc-4.6/zecke-xgcc-cpp.patch               |   30 -
 .../recipes-devtools/gcc/gcc-cross-canadian_4.6.bb |   23 -
 meta/recipes-devtools/gcc/gcc-cross-initial_4.6.bb |    2 -
 .../gcc/gcc-cross-initial_csl-arm-2008q1.bb        |   10 -
 .../gcc/gcc-cross-intermediate_4.6.bb              |    3 -
 .../gcc/gcc-cross-intermediate_csl-arm-2008q1.bb   |   10 -
 meta/recipes-devtools/gcc/gcc-cross-kernel.inc     |   19 -
 meta/recipes-devtools/gcc/gcc-cross_4.6.bb         |    8 -
 .../gcc/gcc-cross_csl-arm-2008q1.bb                |   24 -
 .../gcc/gcc-crosssdk-initial_4.6.bb                |    2 -
 .../gcc/gcc-crosssdk-intermediate_4.6.bb           |    3 -
 meta/recipes-devtools/gcc/gcc-crosssdk_4.6.bb      |    2 -
 meta/recipes-devtools/gcc/gcc-csl-arm-2005q3.inc   |   22 -
 meta/recipes-devtools/gcc/gcc-csl-arm-2008q1.inc   |   53 -
 .../gcc/gcc-csl-arm/arm-nolibfloat.patch           |   25 -
 .../gcc/gcc-csl-arm/arm-softfloat.patch            |   17 -
 .../gcc/gcc-csl-arm/gcc-3.4.4-eabi-bigendian.patch |   13 -
 .../gcc/gcc-csl-arm/gcc-3.4.4-makefile-fix.patch   |   30 -
 .../gcc/gcc-csl-arm/gcc-configure-no-fortran.patch | 1076 --------
 .../gcc/gcc-csl-arm/gcc-new-makeinfo.patch         |   36 -
 .../gcc/gcc-csl-arm/gcc41-configure.in.patch       |   24 -
 .../gcc/gcc-csl-arm/gcc_optab_arm.patch            |   97 -
 .../gcc/gcc-csl-arm/gfortran.patch                 |   42 -
 .../gcc/gcc-csl-arm/zecke-no-host-includes.patch   |   33 -
 .../gcc/gcc-csl-arm/zecke-xgcc-cpp.patch           |   17 -
 meta/recipes-devtools/gcc/gcc-runtime_4.6.bb       |    8 -
 meta/recipes-devtools/gcc/gcc_4.6.bb               |    5 -
 meta/recipes-devtools/gcc/gcc_csl-arm-2008q1.bb    |    3 -
 meta/recipes-devtools/gcc/libgcc_4.6.bb            |   71 -
 85 files changed, 9536 deletions(-)
 delete mode 100644 meta/recipes-core/eglibc/cross-localedef-native_2.13.bb
 delete mode 100644 meta/recipes-core/eglibc/eglibc-2.13/IO-acquire-lock-fix.patch
 delete mode 100644 meta/recipes-core/eglibc/eglibc-2.13/armv4-eabi-compile-fix.patch
 delete mode 100644 meta/recipes-core/eglibc/eglibc-2.13/eglibc-svn-arm-lowlevellock-include-tls.patch
 delete mode 100644 meta/recipes-core/eglibc/eglibc-2.13/etc/ld.so.conf
 delete mode 100644 meta/recipes-core/eglibc/eglibc-2.13/generate-supported.mk
 delete mode 100644 meta/recipes-core/eglibc/eglibc-2.13/ld-search-order.patch
 delete mode 100644 meta/recipes-core/eglibc/eglibc-2.13/mips-rld-map-check.patch
 delete mode 100644 meta/recipes-core/eglibc/eglibc-2.13/multilib_readlib.patch
 delete mode 100644 meta/recipes-core/eglibc/eglibc-2.13/ppc-sqrt.patch
 delete mode 100644 meta/recipes-core/eglibc/eglibc-2.13/stack-protector-test.patch
 delete mode 100644 meta/recipes-core/eglibc/eglibc-2.13/use-sysroot-cxx-headers.patch
 delete mode 100644 meta/recipes-core/eglibc/eglibc-initial_2.13.bb
 delete mode 100644 meta/recipes-core/eglibc/eglibc-locale_2.13.bb
 delete mode 100644 meta/recipes-core/eglibc/eglibc_2.13.bb
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.inc
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/100-uclibc-conf.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/103-uclibc-conf-noupstream.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/200-uclibc-locale.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/203-uclibc-locale-no__x.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/204-uclibc-locale-wchar_fix.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/205-uclibc-locale-update.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/301-missing-execinfo_h.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/302-c99-snprintf.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/303-c99-complex-ugly-hack.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/304-index_macro.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/305-libmudflap-susv3-legacy.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/306-libstdc++-namespace.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/64bithack.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/740-sh-pr24836.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/800-arm-bigendian.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/904-flatten-switch-stmt-00.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/COLLECT_GCC_OPTIONS.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/GPLUSPLUS_INCLUDE_DIR_with_sysroot.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/arm-nolibfloat.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/arm-softfloat.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/cache-amnesia.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/cpp-honour-sysroot.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/disable_relax_pic_calls_flag.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/fix-for-ice-50099.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/fortran-cross-compile-hack.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/gcc-argument-list-too-long.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/gcc-arm-set-cost.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/gcc-flags-for-build.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/gcc-poison-dir-extend.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/gcc-poison-system-directories.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/gcc-uclibc-locale-ctype_touplow_t.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/gcc-with-linker-hash-style.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/mips64-default-n64.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/optional_libstdc.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/powerpc-e5500.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/pr32219.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/pr46934.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/pr47551.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/use-defaults.h-and-t-oe-in-B.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/zecke-xgcc-cpp.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-cross-canadian_4.6.bb
 delete mode 100644 meta/recipes-devtools/gcc/gcc-cross-initial_4.6.bb
 delete mode 100644 meta/recipes-devtools/gcc/gcc-cross-initial_csl-arm-2008q1.bb
 delete mode 100644 meta/recipes-devtools/gcc/gcc-cross-intermediate_4.6.bb
 delete mode 100644 meta/recipes-devtools/gcc/gcc-cross-intermediate_csl-arm-2008q1.bb
 delete mode 100644 meta/recipes-devtools/gcc/gcc-cross-kernel.inc
 delete mode 100644 meta/recipes-devtools/gcc/gcc-cross_4.6.bb
 delete mode 100644 meta/recipes-devtools/gcc/gcc-cross_csl-arm-2008q1.bb
 delete mode 100644 meta/recipes-devtools/gcc/gcc-crosssdk-initial_4.6.bb
 delete mode 100644 meta/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.6.bb
 delete mode 100644 meta/recipes-devtools/gcc/gcc-crosssdk_4.6.bb
 delete mode 100644 meta/recipes-devtools/gcc/gcc-csl-arm-2005q3.inc
 delete mode 100644 meta/recipes-devtools/gcc/gcc-csl-arm-2008q1.inc
 delete mode 100644 meta/recipes-devtools/gcc/gcc-csl-arm/arm-nolibfloat.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-csl-arm/arm-softfloat.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-csl-arm/gcc-3.4.4-eabi-bigendian.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-csl-arm/gcc-3.4.4-makefile-fix.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-csl-arm/gcc-configure-no-fortran.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-csl-arm/gcc-new-makeinfo.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-csl-arm/gcc41-configure.in.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-csl-arm/gcc_optab_arm.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-csl-arm/gfortran.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-csl-arm/zecke-no-host-includes.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-csl-arm/zecke-xgcc-cpp.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-runtime_4.6.bb
 delete mode 100644 meta/recipes-devtools/gcc/gcc_4.6.bb
 delete mode 100644 meta/recipes-devtools/gcc/gcc_csl-arm-2008q1.bb
 delete mode 100644 meta/recipes-devtools/gcc/libgcc_4.6.bb

-- 
1.7.9.5



