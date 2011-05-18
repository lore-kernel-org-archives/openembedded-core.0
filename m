Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QMc5l-0000wy-HV
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 10:26:55 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 18 May 2011 01:18:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,230,1304319600"; 
   d="scan'208";a="3233882"
Received: from unknown (HELO localhost) ([10.255.12.160])
	by fmsmga002.fm.intel.com with ESMTP; 18 May 2011 01:17:59 -0700
Message-Id: <938894a308659ff4a39f4bcae277949f627cd67b.1305702436.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305702436.git.sgw@linux.intel.com>
References: <cover.1305702436.git.sgw@linux.intel.com>
Old-Date: Tue, 17 May 2011 08:43:56 -0700
Date: Wed, 18 May 2011  1:17:59 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Robert Yang <liezhi.yang@windriver.com>
Subject: [PATCH 13/15] gcc: remove unused patches and move patches in proper dir
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
X-List-Received-Date: Wed, 18 May 2011 08:26:55 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

gcc: update upstream-status for patches

python: update upstream-status for patches

libtool: update upstream-status of patches

m4: update upstream status for patches

eglibc: remove unused patches

eglibc: update upstream status of patches

glibc: update upstream-status of patches & remove unused patches

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../eglibc/eglibc-2.12/IO-acquire-lock-fix.patch   |    2 +
 .../eglibc/eglibc-2.12/armv4t-interworking.patch   |   78 -----
 .../eglibc-svn-arm-lowlevellock-include-tls.patch  |    2 +
 .../eglibc/eglibc-2.12/fix-for-make-3.82.diff      |    2 +
 .../eglibc/eglibc-2.12/ld-search-order.patch       |    2 +
 .../eglibc/eglibc-2.12/mips-rld-map-check.patch    |    2 +
 .../eglibc-2.12/shorten-build-commands.patch       |    2 +
 .../eglibc/eglibc-2.13/armv4t-interworking.patch   |   82 ------
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
 .../files/canadian-build-modules-configure.patch   |   22 --
 .../gcc/files/gcc-4.3.3-fix-EXTRA_BUILD.patch      |   12 -
 .../gcc/files/gcc-4.3.x-fix-EXTRA_BUILD.patch      |   13 -
 .../gcc/files/gcc-posix-open-fix.patch             |   11 -
 .../gcc/files/gcc4-mtune-compat.patch              |   14 -
 .../gcc/files/gfortran-4.3.x.patch                 |   40 ---
 .../gcc/files/pr22133-mingw-path-fixup.patch       |   29 --
 .../gcc/files/pr33281-mingw-host-fragment.patch    |   38 ---
 ...35916-mingw-__USE_MINGW_ACCESS-everywhere.patch |   13 -
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
 meta/recipes-devtools/gcc/gcc-csl-arm/15342.patch  |   22 --
 .../gcc/gcc-csl-arm/arm-nolibfloat.patch           |    1 +
 .../gcc/gcc-csl-arm/arm-softfloat.patch            |    1 +
 .../gcc/gcc-csl-arm/cache-amnesia.patch            |   13 -
 .../gcc/gcc-csl-arm/fortran-static-linking.patch   |   48 ---
 .../gcc/gcc-csl-arm/gcc-3.4.0-arm-lib1asm.patch    |   24 --
 .../gcc/gcc-csl-arm/gcc-3.4.4-eabi-bigendian.patch |    1 +
 .../gcc/gcc-csl-arm/gcc-3.4.4-makefile-fix.patch   |    1 +
 .../gcc/gcc-csl-arm/gcc-configure-no-fortran.patch |    1 +
 .../gcc/gcc-csl-arm/gcc-new-makeinfo.patch         |    1 +
 .../gcc/gcc-csl-arm/gcc34-arm-tune.patch           |    9 -
 .../gcc/gcc-csl-arm/gcc41-configure.in.patch       |    2 +
 .../gcc/gcc-csl-arm/gcc_optab_arm.patch            |    2 +
 .../gcc/{files => gcc-csl-arm}/gfortran.patch      |    2 +
 .../gcc/gcc-csl-arm/no-libfloat.patch              |   11 -
 .../gcc/gcc-csl-arm/pic-without-sl.patch           |  303 --------------------
 .../recipes-devtools/gcc/gcc-csl-arm/pr34130.patch |   16 -
 .../gcc/gcc-csl-arm/zecke-no-host-includes.patch   |    2 +
 .../gcc/gcc-csl-arm/zecke-xgcc-cpp.patch           |    1 +
 .../libtool/libtool/fix-final-rpath.patch          |    2 +-
 .../libtool/libtool/prefix-manpage-fix.patch       |    2 +-
 meta/recipes-devtools/libtool/libtool/prefix.patch |    2 +-
 meta/recipes-devtools/m4/m4/ac_config_links.patch  |    2 +
 .../m4/m4/fix_for_circular_dependency.patch        |    2 +
 meta/recipes-devtools/m4/m4/make.patch             |    1 +
 .../python-native/04-default-is-optimized.patch    |    2 +
 .../10-distutils-fix-swig-parameter.patch          |    2 +
 .../11-distutils-never-modify-shebang-line.patch   |    2 +
 ...2-distutils-prefix-is-inside-staging-area.patch |    2 +
 .../python/python-native/debug.patch               |    2 +
 .../python/python-native/nohostlibs.patch          |    2 +
 76 files changed, 91 insertions(+), 847 deletions(-)
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
 delete mode 100644 meta/recipes-devtools/gcc/gcc-csl-arm/15342.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-csl-arm/cache-amnesia.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-csl-arm/fortran-static-linking.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-csl-arm/gcc-3.4.0-arm-lib1asm.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-csl-arm/gcc34-arm-tune.patch
 rename meta/recipes-devtools/gcc/{files => gcc-csl-arm}/gfortran.patch (98%)
 delete mode 100644 meta/recipes-devtools/gcc/gcc-csl-arm/no-libfloat.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-csl-arm/pic-without-sl.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-csl-arm/pr34130.patch

diff --git a/meta/recipes-core/eglibc/eglibc-2.12/IO-acquire-lock-fix.patch b/meta/recipes-core/eglibc/eglibc-2.12/IO-acquire-lock-fix.patch
index 4d3e061..46b1584 100644
--- a/meta/recipes-core/eglibc/eglibc-2.12/IO-acquire-lock-fix.patch
+++ b/meta/recipes-core/eglibc/eglibc-2.12/IO-acquire-lock-fix.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 import http://sourceware.org/ml/libc-ports/2007-12/msg00000.html
 
 Index: libc/bits/stdio-lock.h
diff --git a/meta/recipes-core/eglibc/eglibc-2.12/armv4t-interworking.patch b/meta/recipes-core/eglibc/eglibc-2.12/armv4t-interworking.patch
deleted file mode 100644
index 6ab3061..0000000
--- a/meta/recipes-core/eglibc/eglibc-2.12/armv4t-interworking.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-Index: libc/ports/sysdeps/arm/memcpy.S
-===================================================================
---- libc.orig/ports/sysdeps/arm/memcpy.S	2009-09-03 16:12:00.000000000 -0700
-+++ libc/ports/sysdeps/arm/memcpy.S	2009-10-28 12:51:22.000000000 -0700
-@@ -130,7 +130,12 @@ ENTRY(memcpy)
- 		strcsb	r4, [r0], #1
- 		strcsb	ip, [r0]
- 
-+#if defined (__ARM_ARCH_4T__) && defined(__THUMB_INTERWORK__)
-+		ldmfd	sp!, {r0, r4, lr}
-+                bx      lr
-+#else
- 		ldmfd	sp!, {r0, r4, pc}
-+#endif
- 
- 9:		rsb	ip, ip, #4
- 		cmp	ip, #2
-Index: libc/ports/sysdeps/arm/memmove.S
-===================================================================
---- libc.orig/ports/sysdeps/arm/memmove.S	2009-09-03 16:12:00.000000000 -0700
-+++ libc/ports/sysdeps/arm/memmove.S	2009-10-28 12:51:22.000000000 -0700
-@@ -144,7 +144,12 @@ ENTRY(memmove)
- 		strneb	r3, [r0, #-1]!
- 		strcsb	r4, [r0, #-1]!
- 		strcsb	ip, [r0, #-1]
-+#if defined (__ARM_ARCH_4T__) && defined (__THUMB_INTERWORK__)
-+		ldmfd	sp!, {r0, r4, lr}
-+                bx      lr
-+#else
- 		ldmfd	sp!, {r0, r4, pc}
-+#endif
- 
- 9:		cmp	ip, #2
- 		ldrgtb	r3, [r1, #-1]!
-Index: libc/ports/sysdeps/unix/sysv/linux/arm/clone.S
-===================================================================
---- libc.orig/ports/sysdeps/unix/sysv/linux/arm/clone.S	2009-09-03 16:12:04.000000000 -0700
-+++ libc/ports/sysdeps/unix/sysv/linux/arm/clone.S	2009-10-28 12:51:22.000000000 -0700
-@@ -96,8 +96,14 @@ ENTRY(__clone)
- #endif
- 	@ pick the function arg and call address off the stack and execute
- 	ldr	r0, [sp, #4]
-+#if defined(__ARM_ARCH_4T__) && defined(__THUMB_INTERWORK__)
-+	ldr 	ip, [sp], #8
-+	mov	lr, pc
-+        bx      ip
-+#else
- 	mov	lr, pc
- 	ldr 	pc, [sp], #8
-+#endif
- 
- 	@ and we are done, passing the return value through r0
- 	b	PLTJMP(HIDDEN_JUMPTARGET(_exit))
-Index: libc/ports/sysdeps/unix/sysv/linux/arm/sysdep.h
-===================================================================
---- libc.orig/ports/sysdeps/unix/sysv/linux/arm/sysdep.h	2009-09-16 13:58:18.000000000 +0100
-+++ libc/ports/sysdeps/unix/sysv/linux/arm/sysdep.h	2009-11-03 19:17:16.000000000 +0000
-@@ -129,6 +129,11 @@
-        DO_RET(lr);						\
- 1:     .word C_SYMBOL_NAME(rtld_errno) - 0b - 8;
- # else
-+#if defined(__ARM_ARCH_4T__) && defined(__THUMB_INTERWORK__)
-+#define POP_PC  ldr     lr, [sp], #4; bx lr
-+#else
-+#define POP_PC  ldr     pc, [sp], #4
-+#endif
- #  define SYSCALL_ERROR_HANDLER					\
- __local_syscall_error:						\
- 	str	lr, [sp, #-4]!;					\
-@@ -138,7 +143,7 @@
- 	rsb	r1, r1, #0;					\
- 	str	r1, [r0];					\
- 	mvn	r0, #0;						\
--	ldr	pc, [sp], #4;
-+        POP_PC;
- # endif
- #else
- # define SYSCALL_ERROR_HANDLER	/* Nothing here; code in sysdep.S is used.  */
diff --git a/meta/recipes-core/eglibc/eglibc-2.12/eglibc-svn-arm-lowlevellock-include-tls.patch b/meta/recipes-core/eglibc/eglibc-2.12/eglibc-svn-arm-lowlevellock-include-tls.patch
index 99c3fef..1e7dfa7 100644
--- a/meta/recipes-core/eglibc/eglibc-2.12/eglibc-svn-arm-lowlevellock-include-tls.patch
+++ b/meta/recipes-core/eglibc/eglibc-2.12/eglibc-svn-arm-lowlevellock-include-tls.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 In file included from ../nptl/sysdeps/unix/sysv/linux/libc-lowlevellock.c:21:
 ../nptl/sysdeps/unix/sysv/linux/lowlevellock.c: In function '__lll_lock_wait_private':
 ../nptl/sysdeps/unix/sysv/linux/lowlevellock.c:34: warning: implicit declaration of function 'THREAD_GETMEM'
diff --git a/meta/recipes-core/eglibc/eglibc-2.12/fix-for-make-3.82.diff b/meta/recipes-core/eglibc/eglibc-2.12/fix-for-make-3.82.diff
index 934d31a..89fff79 100644
--- a/meta/recipes-core/eglibc/eglibc-2.12/fix-for-make-3.82.diff
+++ b/meta/recipes-core/eglibc/eglibc-2.12/fix-for-make-3.82.diff
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 Make 3.82, as shipped with Fedora 14, fixes some holes in the parser which in
 turn breaks behaviour of some Makefiles. Most notably eglibc's.
 
diff --git a/meta/recipes-core/eglibc/eglibc-2.12/ld-search-order.patch b/meta/recipes-core/eglibc/eglibc-2.12/ld-search-order.patch
index f968678..40ae6d3 100644
--- a/meta/recipes-core/eglibc/eglibc-2.12/ld-search-order.patch
+++ b/meta/recipes-core/eglibc/eglibc-2.12/ld-search-order.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [embedded specific]
+
 The default lib search path order is:
 
   1) LD_LIBRARY_PATH
diff --git a/meta/recipes-core/eglibc/eglibc-2.12/mips-rld-map-check.patch b/meta/recipes-core/eglibc/eglibc-2.12/mips-rld-map-check.patch
index ed08d7e..186c705 100644
--- a/meta/recipes-core/eglibc/eglibc-2.12/mips-rld-map-check.patch
+++ b/meta/recipes-core/eglibc/eglibc-2.12/mips-rld-map-check.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 On mips target, binutils currently sets DT_MIPS_RLD_MAP to 0 in dynamic
 section if a --version-script sets _RLD_MAP to local. This is apparently
 a binutils bug, but libc shouldn't segfault in this case.
diff --git a/meta/recipes-core/eglibc/eglibc-2.12/shorten-build-commands.patch b/meta/recipes-core/eglibc/eglibc-2.12/shorten-build-commands.patch
index 57835ad..90e644e 100644
--- a/meta/recipes-core/eglibc/eglibc-2.12/shorten-build-commands.patch
+++ b/meta/recipes-core/eglibc/eglibc-2.12/shorten-build-commands.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Source: http://sourceware.org/ml/libc-alpha/2010-03/msg00064.html
 
 This patch scratches an itch.  Each individual gcc command in the
diff --git a/meta/recipes-core/eglibc/eglibc-2.13/armv4t-interworking.patch b/meta/recipes-core/eglibc/eglibc-2.13/armv4t-interworking.patch
deleted file mode 100644
index 945a8ff..0000000
--- a/meta/recipes-core/eglibc/eglibc-2.13/armv4t-interworking.patch
+++ /dev/null
@@ -1,82 +0,0 @@
-Needed to support ARMv4t machines
-
-Upstream-status: Pending
-
-Index: libc/ports/sysdeps/arm/memcpy.S
-===================================================================
---- libc.orig/ports/sysdeps/arm/memcpy.S	2009-09-03 16:12:00.000000000 -0700
-+++ libc/ports/sysdeps/arm/memcpy.S	2009-10-28 12:51:22.000000000 -0700
-@@ -130,7 +130,12 @@ ENTRY(memcpy)
- 		strcsb	r4, [r0], #1
- 		strcsb	ip, [r0]
- 
-+#if defined (__ARM_ARCH_4T__) && defined(__THUMB_INTERWORK__)
-+		ldmfd	sp!, {r0, r4, lr}
-+                bx      lr
-+#else
- 		ldmfd	sp!, {r0, r4, pc}
-+#endif
- 
- 9:		rsb	ip, ip, #4
- 		cmp	ip, #2
-Index: libc/ports/sysdeps/arm/memmove.S
-===================================================================
---- libc.orig/ports/sysdeps/arm/memmove.S	2009-09-03 16:12:00.000000000 -0700
-+++ libc/ports/sysdeps/arm/memmove.S	2009-10-28 12:51:22.000000000 -0700
-@@ -144,7 +144,12 @@ ENTRY(memmove)
- 		strneb	r3, [r0, #-1]!
- 		strcsb	r4, [r0, #-1]!
- 		strcsb	ip, [r0, #-1]
-+#if defined (__ARM_ARCH_4T__) && defined (__THUMB_INTERWORK__)
-+		ldmfd	sp!, {r0, r4, lr}
-+                bx      lr
-+#else
- 		ldmfd	sp!, {r0, r4, pc}
-+#endif
- 
- 9:		cmp	ip, #2
- 		ldrgtb	r3, [r1, #-1]!
-Index: libc/ports/sysdeps/unix/sysv/linux/arm/clone.S
-===================================================================
---- libc.orig/ports/sysdeps/unix/sysv/linux/arm/clone.S	2009-09-03 16:12:04.000000000 -0700
-+++ libc/ports/sysdeps/unix/sysv/linux/arm/clone.S	2009-10-28 12:51:22.000000000 -0700
-@@ -96,8 +96,14 @@ ENTRY(__clone)
- #endif
- 	@ pick the function arg and call address off the stack and execute
- 	ldr	r0, [sp, #4]
-+#if defined(__ARM_ARCH_4T__) && defined(__THUMB_INTERWORK__)
-+	ldr 	ip, [sp], #8
-+	mov	lr, pc
-+        bx      ip
-+#else
- 	mov	lr, pc
- 	ldr 	pc, [sp], #8
-+#endif
- 
- 	@ and we are done, passing the return value through r0
- 	b	PLTJMP(HIDDEN_JUMPTARGET(_exit))
-Index: libc/ports/sysdeps/unix/sysv/linux/arm/sysdep.h
-===================================================================
---- libc.orig/ports/sysdeps/unix/sysv/linux/arm/sysdep.h	2009-09-16 13:58:18.000000000 +0100
-+++ libc/ports/sysdeps/unix/sysv/linux/arm/sysdep.h	2009-11-03 19:17:16.000000000 +0000
-@@ -129,6 +129,11 @@
-        DO_RET(lr);						\
- 1:     .word C_SYMBOL_NAME(rtld_errno) - 0b - 8;
- # else
-+#if defined(__ARM_ARCH_4T__) && defined(__THUMB_INTERWORK__)
-+#define POP_PC  ldr     lr, [sp], #4; bx lr
-+#else
-+#define POP_PC  ldr     pc, [sp], #4
-+#endif
- #  define SYSCALL_ERROR_HANDLER					\
- __local_syscall_error:						\
- 	str	lr, [sp, #-4]!;					\
-@@ -138,7 +143,7 @@
- 	rsb	r1, r1, #0;					\
- 	str	r1, [r0];					\
- 	mvn	r0, #0;						\
--	ldr	pc, [sp], #4;
-+        POP_PC;
- # endif
- #else
- # define SYSCALL_ERROR_HANDLER	/* Nothing here; code in sysdep.S is used.  */
diff --git a/meta/recipes-core/eglibc/eglibc-2.13/ld-search-order.patch b/meta/recipes-core/eglibc/eglibc-2.13/ld-search-order.patch
index f968678..40ae6d3 100644
--- a/meta/recipes-core/eglibc/eglibc-2.13/ld-search-order.patch
+++ b/meta/recipes-core/eglibc/eglibc-2.13/ld-search-order.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [embedded specific]
+
 The default lib search path order is:
 
   1) LD_LIBRARY_PATH
diff --git a/meta/recipes-core/eglibc/eglibc-2.13/mips-rld-map-check.patch b/meta/recipes-core/eglibc/eglibc-2.13/mips-rld-map-check.patch
index 9424003..9740e17 100644
--- a/meta/recipes-core/eglibc/eglibc-2.13/mips-rld-map-check.patch
+++ b/meta/recipes-core/eglibc/eglibc-2.13/mips-rld-map-check.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 On mips target, binutils currently sets DT_MIPS_RLD_MAP to 0 in dynamic
 section if a --version-script sets _RLD_MAP to local. This is apparently
 a binutils bug, but libc shouldn't segfault in this case.
diff --git a/meta/recipes-core/eglibc/eglibc-2.13/shorten-build-commands.patch b/meta/recipes-core/eglibc/eglibc-2.13/shorten-build-commands.patch
index 7bd6d56..9153258 100644
--- a/meta/recipes-core/eglibc/eglibc-2.13/shorten-build-commands.patch
+++ b/meta/recipes-core/eglibc/eglibc-2.13/shorten-build-commands.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Source: http://sourceware.org/ml/libc-alpha/2010-03/msg00064.html
 
 This patch scratches an itch.  Each individual gcc command in the
diff --git a/meta/recipes-core/eglibc/ldconfig-native-2.12.1/32and64bit.patch b/meta/recipes-core/eglibc/ldconfig-native-2.12.1/32and64bit.patch
index 8069c89..cdfeaea 100644
--- a/meta/recipes-core/eglibc/ldconfig-native-2.12.1/32and64bit.patch
+++ b/meta/recipes-core/eglibc/ldconfig-native-2.12.1/32and64bit.patch
@@ -1,3 +1,11 @@
+Upstream-Status: Inappropriate [embedded specific]
+
+We run the ldconfig in the cross fashion. make the code bitsize aware so that 
+we can cross build ldconfig cache for various architectures.
+
+Richard Purdie <richard.purdie@linuxfoundation.org> 2009/05/19
+Nitin A Kamble <nitin.a.kamble@intel.com> 2009/03/29
+
 Index: ldconfig-native-2.12.1/readelflib.c
 ===================================================================
 --- ldconfig-native-2.12.1.orig/readelflib.c
diff --git a/meta/recipes-core/eglibc/ldconfig-native-2.12.1/endian-ness_handling.patch b/meta/recipes-core/eglibc/ldconfig-native-2.12.1/endian-ness_handling.patch
index 77ba03c..7f8e4db 100644
--- a/meta/recipes-core/eglibc/ldconfig-native-2.12.1/endian-ness_handling.patch
+++ b/meta/recipes-core/eglibc/ldconfig-native-2.12.1/endian-ness_handling.patch
@@ -1,4 +1,7 @@
-Do data input/output handling according to endien-ness of the library file.
+Upstream-Status: Inappropriate [embedded specific]
+
+Do data input/output handling according to endien-ness of the library file. That 
+enables use of ldconfig in the cross fashion for any architecture.
 
 2011/04/04
 Richard Purdie <richard.purdie@linuxfoundation.org>
diff --git a/meta/recipes-core/eglibc/ldconfig-native-2.12.1/flag_fix.patch b/meta/recipes-core/eglibc/ldconfig-native-2.12.1/flag_fix.patch
index b148553..4e9aab9 100644
--- a/meta/recipes-core/eglibc/ldconfig-native-2.12.1/flag_fix.patch
+++ b/meta/recipes-core/eglibc/ldconfig-native-2.12.1/flag_fix.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [embedded specific]
+
 The native version of ldconfig was using native definition of LD_SO (i.e. 
 ld-linux-x86-64.so.2 ) which is not correct for doing the cross ldconfig.
 This was causing libc.so on the target marked as ELF lib rather than 
diff --git a/meta/recipes-core/eglibc/ldconfig-native-2.12.1/ldconfig.patch b/meta/recipes-core/eglibc/ldconfig-native-2.12.1/ldconfig.patch
index 52ab64c..52986e6 100644
--- a/meta/recipes-core/eglibc/ldconfig-native-2.12.1/ldconfig.patch
+++ b/meta/recipes-core/eglibc/ldconfig-native-2.12.1/ldconfig.patch
@@ -1,3 +1,7 @@
+Upstream-Status: Inappropriate [embedded specific]
+
+enable standalone building of ldconfig
+
 ---
  cache.c        |   11 +-
  chroot_canon.c |    7 +
diff --git a/meta/recipes-core/eglibc/ldconfig-native-2.12.1/ldconfig_aux-cache_path_fix.patch b/meta/recipes-core/eglibc/ldconfig-native-2.12.1/ldconfig_aux-cache_path_fix.patch
index 0312ca8..27bc411 100644
--- a/meta/recipes-core/eglibc/ldconfig-native-2.12.1/ldconfig_aux-cache_path_fix.patch
+++ b/meta/recipes-core/eglibc/ldconfig-native-2.12.1/ldconfig_aux-cache_path_fix.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Coming from this bug: http://sourceware.org/bugzilla/show_bug.cgi?id=11149
 
 Nitin A Kamble <nitin.a.kamble@intel.com>2011/03/29
diff --git a/meta/recipes-core/glibc/glibc-2.10.1/arm-check-pf.patch b/meta/recipes-core/glibc/glibc-2.10.1/arm-check-pf.patch
deleted file mode 100644
index b045405..0000000
--- a/meta/recipes-core/glibc/glibc-2.10.1/arm-check-pf.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Upstream-Status: Inappropriate [not used]
-
-Index: glibc-2.9/ports/sysdeps/unix/sysv/linux/arm/check_pf.c
-===================================================================
---- glibc-2.9.orig/ports/sysdeps/unix/sysv/linux/arm/check_pf.c	2009-06-19 20:45:32.451372131 +0400
-+++ glibc-2.9/ports/sysdeps/unix/sysv/linux/arm/check_pf.c	2009-06-19 20:45:51.351313426 +0400
-@@ -207,9 +207,6 @@
- 		      newp->info.flags = (((ifam->ifa_flags & IFA_F_DEPRECATED)
- 					   ? in6ai_deprecated : 0)
- 					  | ((ifam->ifa_flags
--					      & IFA_F_TEMPORARY)
--					     ? in6ai_temporary : 0)
--					  | ((ifam->ifa_flags
- 					      & IFA_F_HOMEADDRESS)
- 					     ? in6ai_homeaddress : 0));
- 		      memcpy (newp->info.addr, address ?: local,
diff --git a/meta/recipes-core/glibc/glibc-2.10.1/arm-lowlevellock-include-tls.patch b/meta/recipes-core/glibc/glibc-2.10.1/arm-lowlevellock-include-tls.patch
deleted file mode 100644
index 3f81295..0000000
--- a/meta/recipes-core/glibc/glibc-2.10.1/arm-lowlevellock-include-tls.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-Upstream-Status: Inappropriate [not used]
-
-Index: glibc-2.9/ports/sysdeps/unix/sysv/linux/arm/nptl/lowlevellock.h
-===================================================================
---- glibc-2.9.orig/ports/sysdeps/unix/sysv/linux/arm/nptl/lowlevellock.h	2009-06-19 20:54:35.446686910 +0400
-+++ glibc-2.9/ports/sysdeps/unix/sysv/linux/arm/nptl/lowlevellock.h	2009-06-19 20:54:43.774683370 +0400
-@@ -25,6 +25,7 @@
- #include <atomic.h>
- #include <sysdep.h>
- #include <kernel-features.h>
-+#include <tls.h>
- 
- #define FUTEX_WAIT		0
- #define FUTEX_WAKE		1
diff --git a/meta/recipes-core/glibc/glibc-2.10.1/glibc-2.9-enable-binutils-2.2.patch b/meta/recipes-core/glibc/glibc-2.10.1/glibc-2.9-enable-binutils-2.2.patch
index 4ac6d8b..07e4758 100644
--- a/meta/recipes-core/glibc/glibc-2.10.1/glibc-2.9-enable-binutils-2.2.patch
+++ b/meta/recipes-core/glibc/glibc-2.10.1/glibc-2.9-enable-binutils-2.2.patch
@@ -1,4 +1,4 @@
-Upstream-Status: Inappropriate [not used]
+Upstream-Status: Inappropriate [configuration]
 
 --- glibc-2.9.orig/configure.in	2009-10-22 15:38:13.000000000 +0200
 +++ glibc-2.9/configure.in	2009-10-22 15:37:33.000000000 +0200
diff --git a/meta/recipes-core/glibc/glibc-2.10.1/glibc-check_pf.patch b/meta/recipes-core/glibc/glibc-2.10.1/glibc-check_pf.patch
index a0e55bf..dec0892 100644
--- a/meta/recipes-core/glibc/glibc-2.10.1/glibc-check_pf.patch
+++ b/meta/recipes-core/glibc/glibc-2.10.1/glibc-check_pf.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 From libc-ports-return-550-listarch-libc-ports=sources dot redhat dot com at sourceware dot org Tue Oct 31 17:37:21 2006
 Return-Path: <libc-ports-return-550-listarch-libc-ports=sources dot redhat dot com at sourceware dot org>
 Delivered-To: listarch-libc-ports at sources dot redhat dot com
diff --git a/meta/recipes-core/glibc/glibc-2.10.1/local-args6.diff b/meta/recipes-core/glibc/glibc-2.10.1/local-args6.diff
deleted file mode 100644
index d6f3e0e..0000000
--- a/meta/recipes-core/glibc/glibc-2.10.1/local-args6.diff
+++ /dev/null
@@ -1,14 +0,0 @@
-Upstream-Status: Inappropriate [not used]
-
---- glibc-2.7/ports/sysdeps/unix/sysv/linux/arm/nptl/sysdep-cancel.h.orig
-+++ glibc-2.7/ports/sysdeps/unix/sysv/linux/arm/nptl/sysdep-cancel.h
-@@ -73,6 +73,9 @@
- # define DOCARGS_5	DOCARGS_4
- # define UNDOCARGS_5	UNDOCARGS_4
- 
-+# define DOCARGS_6	DOCARGS_5
-+# define UNDOCARGS_6	UNDOCARGS_5
-+
- # ifdef IS_IN_libpthread
- #  define CENABLE	bl PLTJMP(__pthread_enable_asynccancel)
- #  define CDISABLE	bl PLTJMP(__pthread_disable_asynccancel)
diff --git a/meta/recipes-devtools/gcc/files/canadian-build-modules-configure.patch b/meta/recipes-devtools/gcc/files/canadian-build-modules-configure.patch
deleted file mode 100644
index 8aede10..0000000
--- a/meta/recipes-devtools/gcc/files/canadian-build-modules-configure.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-diff -urN gcc-4.2.2-orig/gcc/configure gcc-4.2.2/gcc/configure
---- gcc-4.2.2-orig/gcc/configure	2008-08-31 23:10:56.000000000 +0200
-+++ gcc-4.2.2/gcc/configure	2008-08-31 23:03:02.000000000 +0200
-@@ -12716,6 +12716,7 @@
- 	esac
- 	saved_CFLAGS="${CFLAGS}"
- 	CC="${CC_FOR_BUILD}" CFLAGS="${CFLAGS_FOR_BUILD}" \
-+	CPP="${CPP_FOR_BUILD}" CPPFLAGS="${CPPFLAGS_FOR_BUILD}" \
- 	CONFIG_SITE= ${realsrcdir}/configure --cache-file=./other.cache \
- 		--enable-languages=${enable_languages-all} \
- 		--target=$target_alias --host=$build_alias --build=$build_alias
-diff -urN gcc-4.2.2-orig/gcc/configure.ac gcc-4.2.2/gcc/configure.ac
---- gcc-4.2.2-orig/gcc/configure.ac	2008-08-31 23:10:53.000000000 +0200
-+++ gcc-4.2.2/gcc/configure.ac	2008-08-31 23:03:29.000000000 +0200
-@@ -1490,6 +1490,7 @@
- 	esac
- 	saved_CFLAGS="${CFLAGS}"
- 	CC="${CC_FOR_BUILD}" CFLAGS="${CFLAGS_FOR_BUILD}" \
-+	CPP="${CPP_FOR_BUILD}" CPPFLAGS="${CPPFLAGS_FOR_BUILD}" \
- 	${realsrcdir}/configure \
- 		--enable-languages=${enable_languages-all} \
- 		--target=$target_alias --host=$build_alias --build=$build_alias
diff --git a/meta/recipes-devtools/gcc/files/gcc-4.3.3-fix-EXTRA_BUILD.patch b/meta/recipes-devtools/gcc/files/gcc-4.3.3-fix-EXTRA_BUILD.patch
deleted file mode 100644
index 8a2a4c4..0000000
--- a/meta/recipes-devtools/gcc/files/gcc-4.3.3-fix-EXTRA_BUILD.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-Index: gcc-4.3.3/Makefile.in
-===================================================================
---- gcc-4.3.3.orig/Makefile.in	2010-06-16 18:04:38.379008150 +0400
-+++ gcc-4.3.3/Makefile.in	2010-06-16 18:05:29.115006261 +0400
-@@ -148,6 +148,7 @@
- # built for the build system to override those in BASE_FLAGS_TO_PASSS.
- EXTRA_BUILD_FLAGS = \
- 	CFLAGS="$(CFLAGS_FOR_BUILD)" \
-+	LIBCFLAGS="$(CFLAGS_FOR_BUILD)" \
- 	LDFLAGS="$(LDFLAGS_FOR_BUILD)"
- 
- # This is the list of directories to built for the host system.
diff --git a/meta/recipes-devtools/gcc/files/gcc-4.3.x-fix-EXTRA_BUILD.patch b/meta/recipes-devtools/gcc/files/gcc-4.3.x-fix-EXTRA_BUILD.patch
deleted file mode 100644
index b375336..0000000
--- a/meta/recipes-devtools/gcc/files/gcc-4.3.x-fix-EXTRA_BUILD.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: gcc-4.3.1/Makefile.in
-===================================================================
---- gcc-4.3.1.orig/Makefile.in	2010-07-07 13:08:44.000000000 +0200
-+++ gcc-4.3.1/Makefile.in	2010-07-07 13:11:59.246625709 +0200
-@@ -149,7 +149,7 @@
- EXTRA_BUILD_FLAGS = \
- 	CFLAGS="$(CFLAGS_FOR_BUILD)" \
- 	LDFLAGS="$(LDFLAGS_FOR_BUILD)" \
--	LIBCFLAGS=""
-+        LIBCFLAGS="$(CFLAGS_FOR_BUILD)"
- 
- # This is the list of directories to built for the host system.
- SUBDIRS = @configdirs@
diff --git a/meta/recipes-devtools/gcc/files/gcc-posix-open-fix.patch b/meta/recipes-devtools/gcc/files/gcc-posix-open-fix.patch
deleted file mode 100644
index 99f813e..0000000
--- a/meta/recipes-devtools/gcc/files/gcc-posix-open-fix.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- gcc-3.4.6/gcc/collect2.c	2008-10-04 18:17:17.796750393 +0400
-+++ gcc-3.4.6/gcc/collect2.new	2008-10-04 18:24:10.120748711 +0400
-@@ -1534,7 +1534,7 @@ collect_execute (const char *prog, char 
-   if (redir)
-     {
-       /* Open response file.  */
--      redir_handle = open (redir, O_WRONLY | O_TRUNC | O_CREAT);
-+      redir_handle = open (redir, O_WRONLY | O_TRUNC | O_CREAT, S_IWUSR);
- 
-       /* Duplicate the stdout and stderr file handles
- 	 so they can be restored later.  */
diff --git a/meta/recipes-devtools/gcc/files/gcc4-mtune-compat.patch b/meta/recipes-devtools/gcc/files/gcc4-mtune-compat.patch
deleted file mode 100644
index 0da2811..0000000
--- a/meta/recipes-devtools/gcc/files/gcc4-mtune-compat.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-Patch for gcc3 to support gcc4-compatible (and consistent) values for -mtune= option.
-
---- gcc-3.4.4/gcc/config/arm/arm.c.org	2007-12-15 23:58:35.000000000 +0200
-+++ gcc-3.4.4/gcc/config/arm/arm.c	2007-12-16 00:20:39.000000000 +0200
-@@ -432,7 +432,9 @@
-   {"arm10tdmi",	                         FL_MODE32 | FL_FAST_MULT | FL_ARCH4 | FL_THUMB | FL_LDSCHED             | FL_ARCH5 },
-   {"arm1020t",	                         FL_MODE32 | FL_FAST_MULT | FL_ARCH4 | FL_THUMB | FL_LDSCHED             | FL_ARCH5 },
-   {"arm926ejs",                          FL_MODE32 | FL_FAST_MULT | FL_ARCH4 | FL_THUMB                          | FL_ARCH5 | FL_ARCH5E },
-+  {"arm926ej-s",                         FL_MODE32 | FL_FAST_MULT | FL_ARCH4 | FL_THUMB                          | FL_ARCH5 | FL_ARCH5E },
-   {"arm1026ejs",                         FL_MODE32 | FL_FAST_MULT | FL_ARCH4 | FL_THUMB                          | FL_ARCH5 | FL_ARCH5E },
-+  {"arm1026ej-s",                        FL_MODE32 | FL_FAST_MULT | FL_ARCH4 | FL_THUMB                          | FL_ARCH5 | FL_ARCH5E },
-   {"xscale",                             FL_MODE32 | FL_FAST_MULT | FL_ARCH4 | FL_THUMB | FL_LDSCHED | FL_STRONG | FL_ARCH5 | FL_ARCH5E | FL_XSCALE },
-   {"iwmmxt",                             FL_MODE32 | FL_FAST_MULT | FL_ARCH4 | FL_THUMB | FL_LDSCHED | FL_STRONG | FL_ARCH5 | FL_ARCH5E | FL_XSCALE | FL_IWMMXT },
-   /* V6 Architecture Processors */
diff --git a/meta/recipes-devtools/gcc/files/gfortran-4.3.x.patch b/meta/recipes-devtools/gcc/files/gfortran-4.3.x.patch
deleted file mode 100644
index 0c42851..0000000
--- a/meta/recipes-devtools/gcc/files/gfortran-4.3.x.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-The patch below fixes a crash building libgfortran on arm-linux-gnueabi.
-
-This target doesn't really have a 128-bit integer type, however it does use 
-TImode to represent the return value of certain special ABI defined library 
-functions. This results in type_for_size(TImode) being called.
-
-Because TImode deosn't correspond to any gfortran integer kind 
-gfc_type_for_size returns NULL and we segfault shortly after.
-
-The patch below fixes this by making gfc_type_for_size handle TImode in the 
-same way as the C frontend.
-
-Tested on x86_64-linux and arm-linux-gnueabi.
-Applied to trunk.
-
-Paul
-
-2007-05-15  Paul Brook  <paul@codesourcery.com>
-
-	gcc/fortran/
-	* trans-types.c (gfc_type_for_size): Handle signed TImode.
-
-Index: gcc-4.2.1/gcc/fortran/trans-types.c
-===================================================================
---- gcc-4.2.1/gcc/fortran/trans-types.c	(revision 170435)
-+++ gcc-4.2.1/gcc/fortran/trans-types.c	(working copy)
-@@ -1800,6 +1800,13 @@ gfc_type_for_size (unsigned bits, int un
- 	  if (type && bits == TYPE_PRECISION (type))
- 	    return type;
- 	}
-+
-+      /* Handle TImode as a special case because it is used by some backends
-+         (eg. ARM) even though it is not available for normal use.  */
-+#if HOST_BITS_PER_WIDE_INT >= 65
-+      if (bits == TYPE_PRECISION (intTI_type_node))
-+	return intTI_type_node;
-+#endif
-     }
-   else
-     {
diff --git a/meta/recipes-devtools/gcc/files/pr22133-mingw-path-fixup.patch b/meta/recipes-devtools/gcc/files/pr22133-mingw-path-fixup.patch
deleted file mode 100644
index 429e9ff..0000000
--- a/meta/recipes-devtools/gcc/files/pr22133-mingw-path-fixup.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-diff -rupN gcc-4.2.orig/gcc/c-incpath.c gcc-4.2/gcc/c-incpath.c
---- gcc-4.2.orig/gcc/c-incpath.c	2007-09-01 11:28:30.000000000 -0400
-+++ gcc-4.2/gcc/c-incpath.c	2008-08-17 16:56:01.000000000 -0400
-@@ -340,13 +340,18 @@ add_path (char *path, int chain, int cxx
-   cpp_dir *p;
- 
- #if defined (HAVE_DOS_BASED_FILE_SYSTEM)
--  /* Convert all backslashes to slashes.  The native CRT stat()
--     function does not recognize a directory that ends in a backslash
--     (unless it is a drive root dir, such "c:\").  Forward slashes,
--     trailing or otherwise, cause no problems for stat().  */
--  char* c;
--  for (c = path; *c; c++)
--    if (*c == '\\') *c = '/';
-+  /* Remove unnecessary trailing slashes.  On some versions of MS
-+     Windows, trailing  _forward_ slashes cause no problems for stat().
-+     On newer versions, stat() does not recognise a directory that ends
-+     in a '\\' or '/', unless it is a drive root dir, such as "c:/",
-+     where it is obligatory.  */
-+  int pathlen = strlen (path);
-+  char* end = path + pathlen - 1;
-+  /* Preserve the lead '/' or lead "c:/".  */
-+  char* start = path + (pathlen > 2 && path[1] == ':' ? 3 : 1);
-+  
-+  for (; end > start && IS_DIR_SEPARATOR (*end); end--)
-+    *end = 0;
- #endif
- 
-   p = XNEW (cpp_dir);
diff --git a/meta/recipes-devtools/gcc/files/pr33281-mingw-host-fragment.patch b/meta/recipes-devtools/gcc/files/pr33281-mingw-host-fragment.patch
deleted file mode 100644
index e16fb44..0000000
--- a/meta/recipes-devtools/gcc/files/pr33281-mingw-host-fragment.patch
+++ /dev/null
@@ -1,38 +0,0 @@
----
- config/mh-mingw |    3 +++
- configure       |    1 +
- configure.in    |    1 +
- 3 files changed, 5 insertions(+)
-
-Index: gcc-4.2.3/config/mh-mingw
-===================================================================
---- /dev/null
-+++ gcc-4.2.3/config/mh-mingw
-@@ -0,0 +1,3 @@
-+# Add -D__USE_MINGW_ACCESS to enable the built compiler to work on Windows
-+# Vista (see PR33281 for details).
-+BOOT_CFLAGS += -D__USE_MINGW_ACCESS
-Index: gcc-4.2.3/configure.in
-===================================================================
---- gcc-4.2.3.orig/configure.in
-+++ gcc-4.2.3/configure.in
-@@ -929,6 +929,7 @@ case "${host}" in
-     host_makefile_frag="config/mh-cygwin"
-     ;;
-   *-mingw32*)
-+    host_makefile_frag="config/mh-mingw"
-     ;;
-   *-interix*)
-     host_makefile_frag="config/mh-interix"
-Index: gcc-4.2.3/configure
-===================================================================
---- gcc-4.2.3.orig/configure
-+++ gcc-4.2.3/configure
-@@ -1769,6 +1769,7 @@ case "${host}" in
-     host_makefile_frag="config/mh-cygwin"
-     ;;
-   *-mingw32*)
-+    host_makefile_frag="config/mh-mingw"
-     ;;
-   *-interix*)
-     host_makefile_frag="config/mh-interix"
diff --git a/meta/recipes-devtools/gcc/files/pr35916-mingw-__USE_MINGW_ACCESS-everywhere.patch b/meta/recipes-devtools/gcc/files/pr35916-mingw-__USE_MINGW_ACCESS-everywhere.patch
deleted file mode 100644
index faf44c2..0000000
--- a/meta/recipes-devtools/gcc/files/pr35916-mingw-__USE_MINGW_ACCESS-everywhere.patch
+++ /dev/null
@@ -1,13 +0,0 @@
----
- config/mh-mingw |    1 +
- 1 file changed, 1 insertion(+)
-
-Index: gcc-4.2.3/config/mh-mingw
-===================================================================
---- gcc-4.2.3.orig/config/mh-mingw
-+++ gcc-4.2.3/config/mh-mingw
-@@ -1,3 +1,4 @@
- # Add -D__USE_MINGW_ACCESS to enable the built compiler to work on Windows
- # Vista (see PR33281 for details).
- BOOT_CFLAGS += -D__USE_MINGW_ACCESS
-+CFLAGS += -D__USE_MINGW_ACCESS
diff --git a/meta/recipes-devtools/gcc/gcc-4.5.1/fedora/gcc43-c++-builtin-redecl.patch b/meta/recipes-devtools/gcc/gcc-4.5.1/fedora/gcc43-c++-builtin-redecl.patch
index a149eae..a2dcede 100644
--- a/meta/recipes-devtools/gcc/gcc-4.5.1/fedora/gcc43-c++-builtin-redecl.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.5.1/fedora/gcc43-c++-builtin-redecl.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [distribution: fedora]
 2007-10-02  Jakub Jelinek  <jakub@redhat.com>
 
 	* decl.c (duplicate_decls): When redeclaring a builtin function,
diff --git a/meta/recipes-devtools/gcc/gcc-4.5.1/fedora/gcc43-cpp-pragma.patch b/meta/recipes-devtools/gcc/gcc-4.5.1/fedora/gcc43-cpp-pragma.patch
index 00d37bd..6dab5bf 100644
--- a/meta/recipes-devtools/gcc/gcc-4.5.1/fedora/gcc43-cpp-pragma.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.5.1/fedora/gcc43-cpp-pragma.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [distribution: fedora]
 2008-02-26  Jakub Jelinek  <jakub@redhat.com>
 
 	* c-ppoutput.c (scan_translation_unit): Handle CPP_PRAGMA
diff --git a/meta/recipes-devtools/gcc/gcc-4.5.1/fedora/gcc43-i386-libgomp.patch b/meta/recipes-devtools/gcc/gcc-4.5.1/fedora/gcc43-i386-libgomp.patch
index a588db2..bf09f23 100644
--- a/meta/recipes-devtools/gcc/gcc-4.5.1/fedora/gcc43-i386-libgomp.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.5.1/fedora/gcc43-i386-libgomp.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [distribution: fedora]
 Build i386.rpm libgomp and libsupc++.a(guard.o) as i486+, pre-i486
 hardware isn't supported because NPTL doesn't support it anyway.
 
diff --git a/meta/recipes-devtools/gcc/gcc-4.5.1/fedora/gcc43-ia64-libunwind.patch b/meta/recipes-devtools/gcc/gcc-4.5.1/fedora/gcc43-ia64-libunwind.patch
index cad13d1..0d6fa61 100644
--- a/meta/recipes-devtools/gcc/gcc-4.5.1/fedora/gcc43-ia64-libunwind.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.5.1/fedora/gcc43-ia64-libunwind.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [distribution: fedora]
 2004-11-27  Jakub Jelinek  <jakub@redhat.com>
 
 	* config.gcc (ia64*-*-linux*): If native and libelf is installed,
diff --git a/meta/recipes-devtools/gcc/gcc-4.5.1/fedora/gcc43-java-debug-iface-type.patch b/meta/recipes-devtools/gcc/gcc-4.5.1/fedora/gcc43-java-debug-iface-type.patch
index de14a50..bd856e4 100644
--- a/meta/recipes-devtools/gcc/gcc-4.5.1/fedora/gcc43-java-debug-iface-type.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.5.1/fedora/gcc43-java-debug-iface-type.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [distribution: fedora]
 2008-01-25  Jakub Jelinek  <jakub@redhat.com>
 
 	* lang.c (java_classify_record): Revert 2007-12-20 change.
diff --git a/meta/recipes-devtools/gcc/gcc-4.5.1/fedora/gcc43-java-nomulti.patch b/meta/recipes-devtools/gcc/gcc-4.5.1/fedora/gcc43-java-nomulti.patch
index 3cb10f3..2502f04 100644
--- a/meta/recipes-devtools/gcc/gcc-4.5.1/fedora/gcc43-java-nomulti.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.5.1/fedora/gcc43-java-nomulti.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [distribution: fedora]
 Index: libjava/configure.ac
 ===================================================================
 --- libjava/configure.ac.orig	2010-03-21 12:41:37.000000000 -0700
diff --git a/meta/recipes-devtools/gcc/gcc-4.5.1/fedora/gcc43-libgomp-speedup.patch b/meta/recipes-devtools/gcc/gcc-4.5.1/fedora/gcc43-libgomp-speedup.patch
index da85e55..54c855f 100644
--- a/meta/recipes-devtools/gcc/gcc-4.5.1/fedora/gcc43-libgomp-speedup.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.5.1/fedora/gcc43-libgomp-speedup.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [distribution: fedora]
 2008-03-28  Jakub Jelinek  <jakub@redhat.com>
 
 	* config/linux/sparc/futex.h (atomic_write_barrier): Fix membar
diff --git a/meta/recipes-devtools/gcc/gcc-4.5.1/fedora/gcc43-ppc32-retaddr.patch b/meta/recipes-devtools/gcc/gcc-4.5.1/fedora/gcc43-ppc32-retaddr.patch
index 3de4158..cf9f856 100644
--- a/meta/recipes-devtools/gcc/gcc-4.5.1/fedora/gcc43-ppc32-retaddr.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.5.1/fedora/gcc43-ppc32-retaddr.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [distribution: fedora]
 2005-11-28  Jakub Jelinek  <jakub@redhat.com>
 
 	* config/rs6000/rs6000.c (rs6000_return_addr): If COUNT == 0,
diff --git a/meta/recipes-devtools/gcc/gcc-4.5.1/fedora/gcc43-pr27898.patch b/meta/recipes-devtools/gcc/gcc-4.5.1/fedora/gcc43-pr27898.patch
index 172bb81..7ea650f 100644
--- a/meta/recipes-devtools/gcc/gcc-4.5.1/fedora/gcc43-pr27898.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.5.1/fedora/gcc43-pr27898.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [distribution: fedora]
 2006-08-18  Jakub Jelinek  <jakub@redhat.com>
 
 	PR c/27898
diff --git a/meta/recipes-devtools/gcc/gcc-4.5.1/fedora/gcc43-pr32139.patch b/meta/recipes-devtools/gcc/gcc-4.5.1/fedora/gcc43-pr32139.patch
index f356967..b8a2aff 100644
--- a/meta/recipes-devtools/gcc/gcc-4.5.1/fedora/gcc43-pr32139.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.5.1/fedora/gcc43-pr32139.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [distribution: fedora]
 2007-06-01  Jakub Jelinek  <jakub@redhat.com>
 
 	PR tree-optimization/32139
diff --git a/meta/recipes-devtools/gcc/gcc-4.5.1/fedora/gcc43-pr33763.patch b/meta/recipes-devtools/gcc/gcc-4.5.1/fedora/gcc43-pr33763.patch
index 68c3065..6fc0a1f 100644
--- a/meta/recipes-devtools/gcc/gcc-4.5.1/fedora/gcc43-pr33763.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.5.1/fedora/gcc43-pr33763.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [distribution: fedora]
 2007-11-06  Jakub Jelinek  <jakub@redhat.com>
 
 	PR tree-optimization/33763
diff --git a/meta/recipes-devtools/gcc/gcc-4.5.1/fedora/gcc43-rh251682.patch b/meta/recipes-devtools/gcc/gcc-4.5.1/fedora/gcc43-rh251682.patch
index e96ae6f..8415073 100644
--- a/meta/recipes-devtools/gcc/gcc-4.5.1/fedora/gcc43-rh251682.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.5.1/fedora/gcc43-rh251682.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [distribution: fedora]
 2008-04-01  Jakub Jelinek  <jakub@redhat.com>
 
 	PR pch/13675
diff --git a/meta/recipes-devtools/gcc/gcc-4.5.1/fedora/gcc43-rh330771.patch b/meta/recipes-devtools/gcc/gcc-4.5.1/fedora/gcc43-rh330771.patch
index 4888ac4..22ea108 100644
--- a/meta/recipes-devtools/gcc/gcc-4.5.1/fedora/gcc43-rh330771.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.5.1/fedora/gcc43-rh330771.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [distribution: fedora]
 2007-10-16  Jakub Jelinek  <jakub@redhat.com>
 
 	* Makefile.am (libgcj_tools_la_LIBADD): Add.
diff --git a/meta/recipes-devtools/gcc/gcc-4.5.1/fedora/gcc43-rh341221.patch b/meta/recipes-devtools/gcc/gcc-4.5.1/fedora/gcc43-rh341221.patch
index 7e2801b..67edaf1 100644
--- a/meta/recipes-devtools/gcc/gcc-4.5.1/fedora/gcc43-rh341221.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.5.1/fedora/gcc43-rh341221.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [distribution: fedora]
 2007-10-21  Jakub Jelinek  <jakub@redhat.com>
 
 	* doc/Makefile.am (POD2MAN): Set date from cp-tools.texinfo
diff --git a/meta/recipes-devtools/gcc/gcc-4.5.1/fedora/gcc45-no-add-needed.patch b/meta/recipes-devtools/gcc/gcc-4.5.1/fedora/gcc45-no-add-needed.patch
index 23704d3..6da2431 100644
--- a/meta/recipes-devtools/gcc/gcc-4.5.1/fedora/gcc45-no-add-needed.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.5.1/fedora/gcc45-no-add-needed.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [distribution: fedora]
 2010-02-08  Roland McGrath  <roland@redhat.com>
 
 	* config/rs6000/sysv4.h (LINK_EH_SPEC): Pass --no-add-needed to the
diff --git a/meta/recipes-devtools/gcc/gcc-csl-arm/15342.patch b/meta/recipes-devtools/gcc/gcc-csl-arm/15342.patch
deleted file mode 100644
index d0f3e72..0000000
--- a/meta/recipes-devtools/gcc/gcc-csl-arm/15342.patch
+++ /dev/null
@@ -1,22 +0,0 @@
---- gcc/gcc/regrename.c~	2004-01-14 17:55:20.000000000 +0000
-+++ gcc/gcc/regrename.c	2005-02-28 07:24:25.893015200 +0000
-@@ -671,7 +671,8 @@
- 
-     case SET:
-       scan_rtx (insn, &SET_SRC (x), class, action, OP_IN, 0);
--      scan_rtx (insn, &SET_DEST (x), class, action, OP_OUT, 0);
-+      scan_rtx (insn, &SET_DEST (x), class, action,
-+		GET_CODE (PATTERN (insn)) == COND_EXEC ? OP_INOUT : OP_OUT, 0);
-       return;
- 
-     case STRICT_LOW_PART:
-@@ -696,7 +697,8 @@
-       abort ();
- 
-     case CLOBBER:
--      scan_rtx (insn, &SET_DEST (x), class, action, OP_OUT, 1);
-+      scan_rtx (insn, &SET_DEST (x), class, action,
-+		GET_CODE (PATTERN (insn)) == COND_EXEC ? OP_INOUT : OP_OUT, 0);
-       return;
- 
-     case EXPR_LIST:
diff --git a/meta/recipes-devtools/gcc/gcc-csl-arm/arm-nolibfloat.patch b/meta/recipes-devtools/gcc/gcc-csl-arm/arm-nolibfloat.patch
index c4897c0..57d4a00 100644
--- a/meta/recipes-devtools/gcc/gcc-csl-arm/arm-nolibfloat.patch
+++ b/meta/recipes-devtools/gcc/gcc-csl-arm/arm-nolibfloat.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Pending
 # Dimitry Andric <dimitry@andric.com>, 2004-05-01
 #
 # * Removed the extra -lfloat option from LIBGCC_SPEC, since it isn't needed
diff --git a/meta/recipes-devtools/gcc/gcc-csl-arm/arm-softfloat.patch b/meta/recipes-devtools/gcc/gcc-csl-arm/arm-softfloat.patch
index 5e1edd9..9a0a691 100644
--- a/meta/recipes-devtools/gcc/gcc-csl-arm/arm-softfloat.patch
+++ b/meta/recipes-devtools/gcc/gcc-csl-arm/arm-softfloat.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Pending
 Index: gcc-4.0.2/gcc/config/arm/t-linux
 ===================================================================
 --- gcc-4.0.2.orig/gcc/config/arm/t-linux	2004-05-15 12:41:35.000000000 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-csl-arm/cache-amnesia.patch b/meta/recipes-devtools/gcc/gcc-csl-arm/cache-amnesia.patch
deleted file mode 100644
index ef7cd11..0000000
--- a/meta/recipes-devtools/gcc/gcc-csl-arm/cache-amnesia.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-diff --git a/gcc/configure b/gcc/configure
-index 44620ab..6e1830c 100755
---- a/gcc/configure
-+++ b/gcc/configure
-@@ -12272,7 +12272,7 @@ else
- 	esac
- 	saved_CFLAGS="${CFLAGS}"
- 	CC="${CC_FOR_BUILD}" CFLAGS="${CFLAGS_FOR_BUILD}" \
--	${realsrcdir}/configure \
-+	CONFIG_SITE= ${realsrcdir}/configure --cache-file=./other.cache \
- 		--enable-languages=${enable_languages-all} \
- 		--target=$target_alias --host=$build_alias --build=$build_alias
- 	CFLAGS="${saved_CFLAGS}"
diff --git a/meta/recipes-devtools/gcc/gcc-csl-arm/fortran-static-linking.patch b/meta/recipes-devtools/gcc/gcc-csl-arm/fortran-static-linking.patch
deleted file mode 100644
index 3dd6321..0000000
--- a/meta/recipes-devtools/gcc/gcc-csl-arm/fortran-static-linking.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-f951 (fortran) links to MPFR and GMP of our staging area but when executing
-the command the libs can not be found. Use rpath like all the other apps in
-our staging bin/ directory.
-
-Patch the configure to avoid the regeneration...
-
-Index: gcc-4.2.2/configure
-===================================================================
---- gcc-4.2.2.orig/configure	2008-01-15 23:23:41.000000000 +0100
-+++ gcc-4.2.2/configure	2008-01-15 23:25:20.000000000 +0100
-@@ -2278,14 +2278,14 @@
- 
- 
- if test "x$with_mpfr" != x; then
--  gmplibs="-L$with_mpfr/lib $gmplibs"
-+  gmplibs="-static -L$with_mpfr/lib $gmplibs"
-   gmpinc="-I$with_mpfr/include"
- fi
- if test "x$with_mpfr_include" != x; then
-   gmpinc="-I$with_mpfr_include"
- fi
- if test "x$with_mpfr_lib" != x; then
--  gmplibs="-L$with_mpfr_lib $gmplibs"
-+  gmplibs="-static -L$with_mpfr_lib $gmplibs"
- fi
- 
- # Specify a location for gmp
-Index: gcc-4.2.2/configure.in
-===================================================================
---- gcc-4.2.2.orig/configure.in	2008-01-15 23:23:41.000000000 +0100
-+++ gcc-4.2.2/configure.in	2008-01-15 23:24:36.000000000 +0100
-@@ -1066,14 +1066,14 @@
- AC_ARG_WITH(mpfr_lib, [  --with-mpfr-lib=PATH    Specify the directory for the installed MPFR library])
- 
- if test "x$with_mpfr" != x; then
--  gmplibs="-L$with_mpfr/lib $gmplibs"
-+  gmplibs="-static -L$with_mpfr/lib $gmplibs"
-   gmpinc="-I$with_mpfr/include"
- fi
- if test "x$with_mpfr_include" != x; then
-   gmpinc="-I$with_mpfr_include"
- fi
- if test "x$with_mpfr_lib" != x; then
--  gmplibs="-L$with_mpfr_lib $gmplibs"
-+  gmplibs="-static -L$with_mpfr_lib $gmplibs"
- fi
- 
- # Specify a location for gmp
diff --git a/meta/recipes-devtools/gcc/gcc-csl-arm/gcc-3.4.0-arm-lib1asm.patch b/meta/recipes-devtools/gcc/gcc-csl-arm/gcc-3.4.0-arm-lib1asm.patch
deleted file mode 100644
index cf17da6..0000000
--- a/meta/recipes-devtools/gcc/gcc-csl-arm/gcc-3.4.0-arm-lib1asm.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-# Fixes errors like the following when building glibc (or any other executable
-# or shared library) when using gcc 3.4.0 for ARM with softfloat:
-#
-# .../libc_pic.os(.text+0x15834): In function `__modf': undefined reference to `__subdf3'
-# .../libc_pic.os(.text+0x158b8): In function `__modf': undefined reference to `__subdf3'
-# .../libc_pic.os(.text+0x1590c): In function `scalbn': undefined reference to `__muldf3'
-# .../libc_pic.os(.text+0x15e94): In function `__ldexpf': undefined reference to `__eqsf2'
-# .../libc_pic.os(.text+0xcee4c): In function `monstartup': undefined reference to `__fixsfsi'
-
-diff -urNd gcc-3.4.0-orig/gcc/config/arm/t-linux gcc-3.4.0/gcc/config/arm/t-linux
---- gcc-3.4.0-orig/gcc/config/arm/t-linux	2003-09-20 23:09:07.000000000 +0200
-+++ gcc-3.4.0/gcc/config/arm/t-linux	2004-05-01 20:31:59.102846400 +0200
-@@ -4,7 +4,10 @@
- LIBGCC2_DEBUG_CFLAGS = -g0
- 
- LIB1ASMSRC = arm/lib1funcs.asm
--LIB1ASMFUNCS = _udivsi3 _divsi3 _umodsi3 _modsi3 _dvmd_lnx
-+LIB1ASMFUNCS = _udivsi3 _divsi3 _umodsi3 _modsi3 _dvmd_lnx \
-+	_negdf2 _addsubdf3 _muldivdf3 _cmpdf2 _unorddf2 _fixdfsi _fixunsdfsi \
-+	_truncdfsf2 _negsf2 _addsubsf3 _muldivsf3 _cmpsf2 _unordsf2 \
-+	_fixsfsi _fixunssfsi _floatdidf _floatdisf
- 
- # MULTILIB_OPTIONS = mhard-float/msoft-float
- # MULTILIB_DIRNAMES = hard-float soft-float
diff --git a/meta/recipes-devtools/gcc/gcc-csl-arm/gcc-3.4.4-eabi-bigendian.patch b/meta/recipes-devtools/gcc/gcc-csl-arm/gcc-3.4.4-eabi-bigendian.patch
index e6cc42b..7453acd 100644
--- a/meta/recipes-devtools/gcc/gcc-csl-arm/gcc-3.4.4-eabi-bigendian.patch
+++ b/meta/recipes-devtools/gcc/gcc-csl-arm/gcc-3.4.4-eabi-bigendian.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Pending
 --- gcc-2005q3/gcc/config/arm/linux-eabi.h~	2007-07-10 09:19:47.000000000 +0930
 +++ gcc-2005q3/gcc/config/arm/linux-eabi.h	2007-07-10 10:42:37.000000000 +0930
 @@ -48,7 +48,8 @@
diff --git a/meta/recipes-devtools/gcc/gcc-csl-arm/gcc-3.4.4-makefile-fix.patch b/meta/recipes-devtools/gcc/gcc-csl-arm/gcc-3.4.4-makefile-fix.patch
index 74c1f26..9c53173 100644
--- a/meta/recipes-devtools/gcc/gcc-csl-arm/gcc-3.4.4-makefile-fix.patch
+++ b/meta/recipes-devtools/gcc/gcc-csl-arm/gcc-3.4.4-makefile-fix.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Pending
 --- gcc-3.4.4/gcc/Makefile.in.orig	2005-07-25 21:00:37 +0200
 +++ gcc-3.4.4/gcc/Makefile.in	2005-07-25 21:01:19 +0200
 @@ -304,7 +304,7 @@
diff --git a/meta/recipes-devtools/gcc/gcc-csl-arm/gcc-configure-no-fortran.patch b/meta/recipes-devtools/gcc/gcc-csl-arm/gcc-configure-no-fortran.patch
index c845503..d9aed34 100644
--- a/meta/recipes-devtools/gcc/gcc-csl-arm/gcc-configure-no-fortran.patch
+++ b/meta/recipes-devtools/gcc/gcc-csl-arm/gcc-configure-no-fortran.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [embedded specific]
 --- tmp/configure.in.orig	2006-09-05 17:50:48.000000000 +0100
 +++ tmp/configure.in	2006-09-05 17:50:48.000000000 +0100
 @@ -157,7 +157,6 @@
diff --git a/meta/recipes-devtools/gcc/gcc-csl-arm/gcc-new-makeinfo.patch b/meta/recipes-devtools/gcc/gcc-csl-arm/gcc-new-makeinfo.patch
index b984605..bd3197d 100644
--- a/meta/recipes-devtools/gcc/gcc-csl-arm/gcc-new-makeinfo.patch
+++ b/meta/recipes-devtools/gcc/gcc-csl-arm/gcc-new-makeinfo.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [embedded specific]
 ---
  configure    |    2 +-
  configure.in |    2 +-
diff --git a/meta/recipes-devtools/gcc/gcc-csl-arm/gcc34-arm-tune.patch b/meta/recipes-devtools/gcc/gcc-csl-arm/gcc34-arm-tune.patch
deleted file mode 100644
index cdb20be..0000000
--- a/meta/recipes-devtools/gcc/gcc-csl-arm/gcc34-arm-tune.patch
+++ /dev/null
@@ -1,9 +0,0 @@
---- gcc-3.4.0/gcc/config/arm/linux-elf.h.arm-tune	2004-01-31 01:18:11.000000000 -0500
-+++ gcc-3.4.0/gcc/config/arm/linux-elf.h	2004-04-24 18:19:10.000000000 -0400
-@@ -126,3 +126,6 @@
- 
- #define LINK_GCC_C_SEQUENCE_SPEC \
-   "%{static:--start-group} %G %L %{static:--end-group}%{!static:%G}"
-+
-+/* Tune for XScale.  */
-+#define TARGET_TUNE_DEFAULT TARGET_CPU_xscale
diff --git a/meta/recipes-devtools/gcc/gcc-csl-arm/gcc41-configure.in.patch b/meta/recipes-devtools/gcc/gcc-csl-arm/gcc41-configure.in.patch
index 3d33bcb..88b0611 100644
--- a/meta/recipes-devtools/gcc/gcc-csl-arm/gcc41-configure.in.patch
+++ b/meta/recipes-devtools/gcc/gcc-csl-arm/gcc41-configure.in.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [embedded specific]
+
 --- gcc-3.4.4/configure.in.orig	2005-08-09 19:57:51.504323183 -0700
 +++ gcc-3.4.4/configure.in	2005-08-09 20:00:12.073168623 -0700
 @@ -1907,7 +1907,7 @@
diff --git a/meta/recipes-devtools/gcc/gcc-csl-arm/gcc_optab_arm.patch b/meta/recipes-devtools/gcc/gcc-csl-arm/gcc_optab_arm.patch
index fa21b26..5738a47 100644
--- a/meta/recipes-devtools/gcc/gcc-csl-arm/gcc_optab_arm.patch
+++ b/meta/recipes-devtools/gcc/gcc-csl-arm/gcc_optab_arm.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 ARM is the only architecture that has a helper function that returns
 an unbiased result. This fix is trivial enough that we can show it
 doesn't effect any of the other arches. Can we consider this a
diff --git a/meta/recipes-devtools/gcc/files/gfortran.patch b/meta/recipes-devtools/gcc/gcc-csl-arm/gfortran.patch
similarity index 98%
rename from meta/recipes-devtools/gcc/files/gfortran.patch
rename to meta/recipes-devtools/gcc/gcc-csl-arm/gfortran.patch
index 96905e5..c78e831 100644
--- a/meta/recipes-devtools/gcc/files/gfortran.patch
+++ b/meta/recipes-devtools/gcc/gcc-csl-arm/gfortran.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 The patch below fixes a crash building libgfortran on arm-linux-gnueabi.
 
 This target doesn't really have a 128-bit integer type, however it does use 
diff --git a/meta/recipes-devtools/gcc/gcc-csl-arm/no-libfloat.patch b/meta/recipes-devtools/gcc/gcc-csl-arm/no-libfloat.patch
deleted file mode 100644
index e5d12cf..0000000
--- a/meta/recipes-devtools/gcc/gcc-csl-arm/no-libfloat.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- gcc/gcc/config/arm/linux-elf.h.old	2005-04-20 00:46:28.923375320 +0100
-+++ gcc/gcc/config/arm/linux-elf.h	2005-04-20 00:46:34.181575952 +0100
-@@ -56,7 +56,7 @@
-    %{shared:-lc} \
-    %{!shared:%{profile:-lc_p}%{!profile:-lc}}"
- 
--#define LIBGCC_SPEC "%{msoft-float:-lfloat} %{mfloat-abi=soft*:-lfloat} -lgcc"
-+#define LIBGCC_SPEC "-lgcc"
- 
- /* Provide a STARTFILE_SPEC appropriate for GNU/Linux.  Here we add
-    the GNU/Linux magical crtbegin.o file (see crtstuff.c) which
diff --git a/meta/recipes-devtools/gcc/gcc-csl-arm/pic-without-sl.patch b/meta/recipes-devtools/gcc/gcc-csl-arm/pic-without-sl.patch
deleted file mode 100644
index 9a49794..0000000
--- a/meta/recipes-devtools/gcc/gcc-csl-arm/pic-without-sl.patch
+++ /dev/null
@@ -1,303 +0,0 @@
-Index: gcc/config/arm/arm-protos.h
-===================================================================
-RCS file: /cvsroot/gcc/gcc/gcc/config/arm/arm-protos.h,v
-retrieving revision 1.60.4.20
-diff -u -r1.60.4.20 arm-protos.h
---- gcc/config/arm/arm-protos.h	29 Mar 2005 03:00:11 -0000	1.60.4.20
-+++ gcc/config/arm/arm-protos.h	23 Apr 2005 04:41:06 -0000
-@@ -64,6 +64,7 @@
- extern enum reg_class vfp_secondary_reload_class (enum machine_mode, rtx);
- extern int tls_symbolic_operand (rtx, enum machine_mode);
- extern bool arm_tls_operand_p (rtx x);
-+extern bool arm_pc_pic_operand_p (rtx x);
- 
- /* Predicates.  */
- extern int s_register_operand (rtx, enum machine_mode);
-Index: gcc/config/arm/arm.c
-===================================================================
-RCS file: /cvsroot/gcc/gcc/gcc/config/arm/arm.c,v
-retrieving revision 1.303.2.79
-diff -u -r1.303.2.79 arm.c
---- gcc/config/arm/arm.c	12 Apr 2005 06:17:07 -0000	1.303.2.79
-+++ gcc/config/arm/arm.c	23 Apr 2005 04:41:09 -0000
-@@ -1003,7 +1003,7 @@
-   
-   /* If stack checking is disabled, we can use r10 as the PIC register,
-      which keeps r9 available.  */
--  if (flag_pic)
-+  if (0 && flag_pic)
-     arm_pic_register = TARGET_APCS_STACK ? 9 : 10;
-   
-   if (TARGET_APCS_FLOAT)
-@@ -3120,6 +3120,10 @@
- rtx
- legitimize_pic_address (rtx orig, enum machine_mode mode, rtx reg)
- {
-+  if (GET_CODE (orig) == UNSPEC
-+      && XINT (orig, 1) == UNSPEC_GOTSLOTPC)
-+    abort ();
-+
-   if (GET_CODE (orig) == SYMBOL_REF
-       || GET_CODE (orig) == LABEL_REF)
-     {
-@@ -3149,27 +3153,80 @@
-       else
- 	address = reg;
- 
--      if (TARGET_ARM)
--	emit_insn (gen_pic_load_addr_arm (address, orig));
--      else
--	emit_insn (gen_pic_load_addr_thumb (address, orig));
-+      if (arm_pic_register != INVALID_REGNUM)
-+	{
-+	  /* Using GP-based PIC addressing.  */
-+	  if (TARGET_ARM)
-+	    emit_insn (gen_pic_load_addr_arm (address, orig));
-+	  else
-+	    emit_insn (gen_pic_load_addr_thumb (address, orig));
-+
-+	  if ((GET_CODE (orig) == LABEL_REF
-+	       || (GET_CODE (orig) == SYMBOL_REF && 
-+		   SYMBOL_REF_LOCAL_P (orig)))
-+	      && NEED_GOT_RELOC)
-+	    pic_ref = gen_rtx_PLUS (Pmode, pic_offset_table_rtx, address);
-+	  else
-+	    {
-+	      pic_ref = gen_rtx_MEM (Pmode,
-+				     gen_rtx_PLUS (Pmode, pic_offset_table_rtx,
-+						   address));
-+	      RTX_UNCHANGING_P (pic_ref) = 1;
-+	    }
- 
--      if ((GET_CODE (orig) == LABEL_REF
--	   || (GET_CODE (orig) == SYMBOL_REF && 
--	       SYMBOL_REF_LOCAL_P (orig)))
--	  && NEED_GOT_RELOC)
--	pic_ref = gen_rtx_PLUS (Pmode, pic_offset_table_rtx, address);
-+	  current_function_uses_pic_offset_table = 1;
-+	}
-       else
- 	{
--	  pic_ref = gen_rtx_MEM (Pmode,
--				 gen_rtx_PLUS (Pmode, pic_offset_table_rtx,
--					       address));
--	  RTX_UNCHANGING_P (pic_ref) = 1;
-+	  /* Using PC-based PIC addressing.  */
-+	  rtx label, tmp;
-+	  int offset;
-+
-+	  label = gen_label_rtx ();
-+	  offset = TARGET_ARM ? 8 : 4;
-+
-+	  if (GET_CODE (orig) == LABEL_REF 
-+	      || (GET_CODE (orig) == SYMBOL_REF && SYMBOL_REF_LOCAL_P (orig)))
-+	    {
-+	      /* This symbol is defined locally.  We don't need a GOT entry.  */
-+	      tmp = gen_rtx_MINUS (Pmode, gen_rtx_UNSPEC (Pmode, gen_rtvec (1, orig), UNSPEC_PIC_SYM), gen_rtx_PLUS (Pmode, 
-+							      gen_rtx_LABEL_REF (Pmode, label),
-+							      GEN_INT (offset)));
-+
-+	      load_tls_operand (tmp, address);
-+
-+	      if (TARGET_ARM)
-+		emit_insn (gen_pic_add_dot_plus_eight (address, label));
-+	      else
-+		emit_insn (gen_pic_add_dot_plus_four (address, label));
-+	    }
-+	  else
-+	    {
-+	      rtx x = gen_rtx_UNSPEC (Pmode, gen_rtvec (1, orig), UNSPEC_GOTSLOTPC);
-+	      rtx dummy_label;
-+
-+	      dummy_label = gen_label_rtx ();
-+	      LABEL_PRESERVE_P (dummy_label) = 1;
-+	      LABEL_NUSES (dummy_label) = 1;
-+	      
-+	      tmp = gen_rtx_MINUS (Pmode, x, gen_rtx_PLUS (Pmode, 
-+							   gen_rtx_LABEL_REF (Pmode, label),
-+							   GEN_INT (offset)));
-+
-+	      load_tls_operand (tmp, address);
-+
-+	      if (TARGET_ARM)
-+		emit_insn (gen_tls_load_dot_plus_eight (address, address, label, dummy_label));
-+	      else
-+		emit_insn (gen_tls_load_dot_plus_four (address, address, label, dummy_label));
-+	    }
-+
-+	  pic_ref = address;
- 	}
- 
-       insn = emit_move_insn (reg, pic_ref);
- #endif
--      current_function_uses_pic_offset_table = 1;
-+
-       /* Put a REG_EQUAL note on this insn, so that it can be optimized
- 	 by loop.  */
-       REG_NOTES (insn) = gen_rtx_EXPR_LIST (REG_EQUAL, orig,
-@@ -3179,11 +3236,17 @@
-   else if (GET_CODE (orig) == CONST)
-     {
-       rtx base, offset;
-+      bool minus = FALSE;
- 
-       if (GET_CODE (XEXP (orig, 0)) == PLUS
- 	  && XEXP (XEXP (orig, 0), 0) == pic_offset_table_rtx)
- 	return orig;
- 
-+      if (GET_CODE (XEXP (orig, 0)) == MINUS
-+	  && GET_CODE (XEXP (XEXP (orig, 0), 0)) == UNSPEC
-+	  && XINT (XEXP (XEXP (orig, 0), 0), 1) == UNSPEC_GOTSLOTPC)
-+	return orig;
-+
-       if (GET_CODE (XEXP (orig, 0)) == UNSPEC)
- 	return orig;
- 
-@@ -3201,6 +3264,13 @@
- 	  offset = legitimize_pic_address (XEXP (XEXP (orig, 0), 1), Pmode,
- 					   base == reg ? 0 : reg);
- 	}
-+      else if (GET_CODE (XEXP (orig, 0)) == MINUS)
-+	{
-+	  minus = TRUE;
-+	  base = legitimize_pic_address (XEXP (XEXP (orig, 0), 0), Pmode, reg);
-+	  offset = legitimize_pic_address (XEXP (XEXP (orig, 0), 1), Pmode,
-+					   base == reg ? 0 : reg);
-+	}
-       else
- 	abort ();
- 
-@@ -3228,7 +3298,7 @@
- 	  return reg;
- 	}
- 
--      return gen_rtx_PLUS (Pmode, base, offset);
-+      return minus ? gen_rtx_MINUS (Pmode, base, offset) : gen_rtx_PLUS (Pmode, base, offset);
-     }
- 
-   return orig;
-@@ -3267,7 +3337,7 @@
-   rtx l1, pic_tmp, pic_tmp2, pic_rtx;
-   rtx global_offset_table;
- 
--  if (current_function_uses_pic_offset_table == 0 || TARGET_SINGLE_PIC_BASE)
-+  if (current_function_uses_pic_offset_table == 0 || TARGET_SINGLE_PIC_BASE || arm_pic_register == INVALID_REGNUM)
-     return;
- 
-   if (!flag_pic)
-@@ -3341,8 +3411,11 @@
- static int
- pcrel_constant_p (rtx x)
- {
-+  if (GET_CODE (x) == CONST)
-+    return pcrel_constant_p (XEXP (x, 0));
-+
-   if (GET_CODE (x) == MINUS)
--    return symbol_mentioned_p (XEXP (x, 0)) && label_mentioned_p (XEXP (x, 1));
-+    return (((GET_CODE (XEXP (x, 0)) == UNSPEC && XINT (XEXP (x, 0), 1) == UNSPEC_PIC_SYM)) || symbol_mentioned_p (XEXP (x, 0))) && label_mentioned_p (XEXP (x, 1));
- 
-   if (GET_CODE (x) == UNSPEC
-       && XINT (x, 1) == UNSPEC_TLS
-@@ -3946,12 +4019,32 @@
-   return SYMBOL_REF_TLS_MODEL (op);
- }
- 
-+bool
-+arm_pc_pic_operand_p (rtx op)
-+{
-+  if (GET_CODE (op) == CONST
-+      && GET_CODE (XEXP (op, 0)) == MINUS
-+      && GET_CODE (XEXP (XEXP (op, 0), 0)) == UNSPEC
-+      && XINT (XEXP (XEXP (op, 0), 0), 1) == UNSPEC_GOTSLOTPC)
-+    return 1;
-+
-+  if (GET_CODE (op) == CONST
-+      && GET_CODE (XEXP (op, 0)) == MINUS
-+      && GET_CODE (XEXP (XEXP (op, 0), 0)) == UNSPEC
-+      && XINT (XEXP (XEXP (op, 0), 0), 1) == UNSPEC_PIC_SYM)
-+    return 1;
-+
-+  return 0;
-+}
-+
- /* Valid input to a move instruction.  */
- int
- move_input_operand (rtx op, enum machine_mode mode)
- {
-   if (tls_symbolic_operand (op, mode))
-     return 0;
-+  if (pcrel_constant_p (op))
-+    return 1;
-   return general_operand (op, mode);
- }
- 
-@@ -15634,11 +15727,34 @@
-   return TRUE;
- }
- 
-+static bool
-+arm_emit_got_decoration (FILE *fp, rtx x)
-+{
-+  rtx val;
-+
-+  val = XVECEXP (x, 0, 0);
-+
-+  fputs ("_gotslotpc_(", fp);
-+
-+  output_addr_const (fp, val);
-+
-+  fputc (')', fp);
-+
-+  return TRUE;
-+}
-+
- bool
- arm_output_addr_const_extra (FILE *fp, rtx x)
- {
-   if (GET_CODE (x) == UNSPEC && XINT (x, 1) == UNSPEC_TLS)
-     return arm_emit_tls_decoration (fp, x);
-+  else if (GET_CODE (x) == UNSPEC && XINT (x, 1) == UNSPEC_GOTSLOTPC)
-+    return arm_emit_got_decoration (fp, x);
-+  else if (GET_CODE (x) == UNSPEC && XINT (x, 1) == UNSPEC_PIC_SYM)
-+    {
-+      output_addr_const (fp, XVECEXP (x, 0, 0));
-+      return TRUE;
-+    }
-   else if (GET_CODE (x) == CONST_VECTOR)
-     return arm_emit_vector_const (fp, x);
-   
-Index: gcc/config/arm/arm.md
-===================================================================
-RCS file: /cvsroot/gcc/gcc/gcc/config/arm/arm.md,v
-retrieving revision 1.145.2.31
-diff -u -r1.145.2.31 arm.md
---- gcc/config/arm/arm.md	28 Mar 2005 19:04:37 -0000	1.145.2.31
-+++ gcc/config/arm/arm.md	23 Apr 2005 04:41:11 -0000
-@@ -88,6 +88,7 @@
-    (UNSPEC_WMADDS   18) ; Used by the intrinsic form of the iWMMXt WMADDS instruction.
-    (UNSPEC_WMADDU   19) ; Used by the intrinsic form of the iWMMXt WMADDU instruction.
-    (UNSPEC_TLS      20) ; A symbol that has been treated properly for TLS usage.
-+   (UNSPEC_GOTSLOTPC 21)
-   ]
- )
- 
-@@ -4179,7 +4180,8 @@
-         && (CONSTANT_P (operands[1])
- 	   || symbol_mentioned_p (operands[1])
- 	   || label_mentioned_p (operands[1]))
--	&& ! tls_mentioned_p (operands[1]))
-+	&& ! tls_mentioned_p (operands[1])
-+	&& ! arm_pc_pic_operand_p (operands[1]))
-       operands[1] = legitimize_pic_address (operands[1], SImode,
- 					    (no_new_pseudos ? operands[0] : 0));
-   } 
-@@ -4412,7 +4414,8 @@
- 			(mem:SI (unspec:SI [(plus:SI (match_dup 0)
- 			     			     (const (plus:SI (pc) (const_int 8))))]
- 		   		 UNSPEC_PIC_BASE)))	
--   	      (use (label_ref (match_operand 1 "" "")))])]
-+   	      (use (label_ref (match_operand 1 "" "")))
-+	      (use (label_ref (match_operand 1 "" "")))])]
-   ""
- )
- 
diff --git a/meta/recipes-devtools/gcc/gcc-csl-arm/pr34130.patch b/meta/recipes-devtools/gcc/gcc-csl-arm/pr34130.patch
deleted file mode 100644
index 415335f..0000000
--- a/meta/recipes-devtools/gcc/gcc-csl-arm/pr34130.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Index: gcc-4.1.2/gcc/fold-const.c
-===================================================================
---- gcc-4.1.2.orig/gcc/fold-const.c	2007-11-21 18:53:42.000000000 +0100
-+++ gcc-4.1.2/gcc/fold-const.c	2007-11-21 18:56:26.000000000 +0100
-@@ -5339,7 +5339,10 @@
-             }
-           break;
-         }
--      /* FALLTHROUGH */
-+   /* If the constant is negative, we cannot simplify this.  */
-+   if (tree_int_cst_sgn (c) == -1)
-+     break;
-+   /* FALLTHROUGH */
-     case NEGATE_EXPR:
-       if ((t1 = extract_muldiv (op0, c, code, wide_type)) != 0)
- 	return fold_build1 (tcode, ctype, fold_convert (ctype, t1));
diff --git a/meta/recipes-devtools/gcc/gcc-csl-arm/zecke-no-host-includes.patch b/meta/recipes-devtools/gcc/gcc-csl-arm/zecke-no-host-includes.patch
index 8b05cb7..1695582 100644
--- a/meta/recipes-devtools/gcc/gcc-csl-arm/zecke-no-host-includes.patch
+++ b/meta/recipes-devtools/gcc/gcc-csl-arm/zecke-no-host-includes.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Index: gcc-4.0.2/gcc/c-incpath.c
 ===================================================================
 --- gcc-4.0.2.orig/gcc/c-incpath.c	2005-01-23 16:05:27.000000000 +0100
diff --git a/meta/recipes-devtools/gcc/gcc-csl-arm/zecke-xgcc-cpp.patch b/meta/recipes-devtools/gcc/gcc-csl-arm/zecke-xgcc-cpp.patch
index 921cab6..b06de54 100644
--- a/meta/recipes-devtools/gcc/gcc-csl-arm/zecke-xgcc-cpp.patch
+++ b/meta/recipes-devtools/gcc/gcc-csl-arm/zecke-xgcc-cpp.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [embedded specific]
 upstream: n/a
 comment: Use the preprocessor we have just compiled instead the one of
 the system. There might be incompabilities between us and them.
diff --git a/meta/recipes-devtools/libtool/libtool/fix-final-rpath.patch b/meta/recipes-devtools/libtool/libtool/fix-final-rpath.patch
index f3fa55d..4c36e4e 100644
--- a/meta/recipes-devtools/libtool/libtool/fix-final-rpath.patch
+++ b/meta/recipes-devtools/libtool/libtool/fix-final-rpath.patch
@@ -1,4 +1,4 @@
-Status: Inappropriate [embedded specific]
+Upstream-Status: Inappropriate [embedded specific]
 
 Enalbing sysroot support exposed a bug where the final library
 had an RPATH encoded into it which still pointed to the sysroot.
diff --git a/meta/recipes-devtools/libtool/libtool/prefix-manpage-fix.patch b/meta/recipes-devtools/libtool/libtool/prefix-manpage-fix.patch
index a8a4dcd..f9de383 100644
--- a/meta/recipes-devtools/libtool/libtool/prefix-manpage-fix.patch
+++ b/meta/recipes-devtools/libtool/libtool/prefix-manpage-fix.patch
@@ -1,4 +1,4 @@
-Status: Inappropriate [embedded specific]
+Upstream-Status: Inappropriate [embedded specific]
 
 For cross environment, it not possible to run the generated executable.
 nstead use the build version of libtool to generate the man pages. 
diff --git a/meta/recipes-devtools/libtool/libtool/prefix.patch b/meta/recipes-devtools/libtool/libtool/prefix.patch
index 0c98f0d..1b20324 100644
--- a/meta/recipes-devtools/libtool/libtool/prefix.patch
+++ b/meta/recipes-devtools/libtool/libtool/prefix.patch
@@ -1,4 +1,4 @@
-Status: Inappropriate [embedded specific]
+Upstream-Status: Inappropriate [embedded specific]
 
 Renames "libtool" -> "${TARGET_PREFIX}libtool" which makes sure
 it can't be confused with the host libtool.
diff --git a/meta/recipes-devtools/m4/m4/ac_config_links.patch b/meta/recipes-devtools/m4/m4/ac_config_links.patch
index 2210387..275c0b2 100644
--- a/meta/recipes-devtools/m4/m4/ac_config_links.patch
+++ b/meta/recipes-devtools/m4/m4/ac_config_links.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 This patch fixes a build problem for m4-native experienced on Ubuntu 9.10,
 where autoconf/automake (AC_CONFIG_LINKS) ends up making GNUmakefile a
 symlink to itself.
diff --git a/meta/recipes-devtools/m4/m4/fix_for_circular_dependency.patch b/meta/recipes-devtools/m4/m4/fix_for_circular_dependency.patch
index ba51d87..9877453 100644
--- a/meta/recipes-devtools/m4/m4/fix_for_circular_dependency.patch
+++ b/meta/recipes-devtools/m4/m4/fix_for_circular_dependency.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [licensing]
+
 The older GPLv2 m4 does not work well with newer autoconf. It causes the 
 circular dependency as seen bellow.
   Removing this m4 file which was needed only forl older autoconf
diff --git a/meta/recipes-devtools/m4/m4/make.patch b/meta/recipes-devtools/m4/m4/make.patch
index 3577b0b..79fb415 100644
--- a/meta/recipes-devtools/m4/m4/make.patch
+++ b/meta/recipes-devtools/m4/m4/make.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [embedded specific]
 
 #
 # Patch managed by http://www.holgerschurig.de/patcher.html
diff --git a/meta/recipes-devtools/python/python-native/04-default-is-optimized.patch b/meta/recipes-devtools/python/python-native/04-default-is-optimized.patch
index 5131e0b..8fe147e 100644
--- a/meta/recipes-devtools/python/python-native/04-default-is-optimized.patch
+++ b/meta/recipes-devtools/python/python-native/04-default-is-optimized.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [embedded specific]
+
 # When compiling for an embedded system, we need every bit of
 # performance we can get. default to optimized with the option
 # of opt-out.
diff --git a/meta/recipes-devtools/python/python-native/10-distutils-fix-swig-parameter.patch b/meta/recipes-devtools/python/python-native/10-distutils-fix-swig-parameter.patch
index f5e852a..a39247c 100644
--- a/meta/recipes-devtools/python/python-native/10-distutils-fix-swig-parameter.patch
+++ b/meta/recipes-devtools/python/python-native/10-distutils-fix-swig-parameter.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 # Some versions of SWIG do not use the extension parameter.
 # Make it optional.
 # Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
diff --git a/meta/recipes-devtools/python/python-native/11-distutils-never-modify-shebang-line.patch b/meta/recipes-devtools/python/python-native/11-distutils-never-modify-shebang-line.patch
index 8354e26..c92469b 100644
--- a/meta/recipes-devtools/python/python-native/11-distutils-never-modify-shebang-line.patch
+++ b/meta/recipes-devtools/python/python-native/11-distutils-never-modify-shebang-line.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 # Don't modify the she-bang line for a cross-build.
 # Otherwise it points to our hostpython (which we do not want)
 #
diff --git a/meta/recipes-devtools/python/python-native/12-distutils-prefix-is-inside-staging-area.patch b/meta/recipes-devtools/python/python-native/12-distutils-prefix-is-inside-staging-area.patch
index bf4366f..9532eb3 100644
--- a/meta/recipes-devtools/python/python-native/12-distutils-prefix-is-inside-staging-area.patch
+++ b/meta/recipes-devtools/python/python-native/12-distutils-prefix-is-inside-staging-area.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [embedded specific]
+
 # The proper prefix is inside our staging area.
 # Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
 
diff --git a/meta/recipes-devtools/python/python-native/debug.patch b/meta/recipes-devtools/python/python-native/debug.patch
index beb3adc..5ec10d6 100644
--- a/meta/recipes-devtools/python/python-native/debug.patch
+++ b/meta/recipes-devtools/python/python-native/debug.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Index: Python-2.6.1/Lib/distutils/unixccompiler.py
 ===================================================================
 --- Python-2.6.1.orig/Lib/distutils/unixccompiler.py	2009-11-13 16:04:54.000000000 +0000
diff --git a/meta/recipes-devtools/python/python-native/nohostlibs.patch b/meta/recipes-devtools/python/python-native/nohostlibs.patch
index da2bd8f..aed45c9 100644
--- a/meta/recipes-devtools/python/python-native/nohostlibs.patch
+++ b/meta/recipes-devtools/python/python-native/nohostlibs.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [embedded specific]
+
 Index: Python-2.6.6/setup.py
 ===================================================================
 --- Python-2.6.6.orig/setup.py
-- 
1.7.3.4



