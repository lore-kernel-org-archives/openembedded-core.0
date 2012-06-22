Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Si5Vb-0005dq-FH
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jun 2012 17:10:52 +0200
Received: by pbbrq2 with SMTP id rq2so3545046pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jun 2012 08:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=6lUaNKoDAAhidgLSnwvLKbEOJiCrJ75620LCop1DIjk=;
	b=u+D49ZCIISIBhirE9HFOjofY8pT/Fvd5qUbe+7XQ0JxVfaRy/YH12xaqt/4DpH87w3
	FtZ2EcNiW9g0V8txhmnWX7nKcUm2bMNlWi8J/Sl/2pdIxXdgGQPdbHRiBhqOudIQcie7
	XQ40Upa1C5KIJ5fcbAXTC6wVvFl2yDYSmiJgmDKsF/4cwxZxEMpQbWBxNzJlSH1LBXPJ
	khTtzbIzxQYCR9wqmFNOBZgxnVpGdBllsqxFQZFX/G9JsZxO/yrlz1m1HxqKyHotHqgs
	r/N1dOH4cy+vvzRZKwpPF53qG09LuEuHZunCFi8eHyWT/HeFrEfWqzvGaFW+eBPp4A05
	a+Sg==
Received: by 10.68.132.166 with SMTP id ov6mr11501788pbb.24.1340377202461;
	Fri, 22 Jun 2012 08:00:02 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id rv5sm39166827pbc.56.2012.06.22.08.00.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 22 Jun 2012 08:00:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jun 2012 07:59:47 -0700
Message-Id: <26faaf861e5468fc1ddc7d5097842043d9dad1fc.1340377032.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <7e632ad285b74dd043764b0830bdc63e2ad4d709.1340377031.git.raj.khem@gmail.com>
References: <7e632ad285b74dd043764b0830bdc63e2ad4d709.1340377031.git.raj.khem@gmail.com>
In-Reply-To: <cover.1340377031.git.raj.khem@gmail.com>
References: <cover.1340377031.git.raj.khem@gmail.com>
Subject: [PATCH 2/3] eglibc-2.13: Retire into toolchain layer
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
X-List-Received-Date: Fri, 22 Jun 2012 15:10:52 -0000

If anyone wants it add toolchain-layer from meta-openembedded
repo to your setup

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../eglibc/cross-localedef-native_2.13.bb          |   43 --
 .../eglibc/eglibc-2.13/IO-acquire-lock-fix.patch   |   17 -
 .../eglibc-2.13/armv4-eabi-compile-fix.patch       |   25 -
 .../eglibc-svn-arm-lowlevellock-include-tls.patch  |   21 -
 .../eglibc/eglibc-2.13/generate-supported.mk       |   11 -
 .../eglibc/eglibc-2.13/ld-search-order.patch       |   56 --
 .../eglibc/eglibc-2.13/mips-rld-map-check.patch    |   26 -
 .../eglibc/eglibc-2.13/multilib_readlib.patch      |   17 -
 .../recipes-core/eglibc/eglibc-2.13/ppc-sqrt.patch |  538 --------------------
 .../eglibc/eglibc-2.13/stack-protector-test.patch  |   35 --
 .../eglibc-2.13/use-sysroot-cxx-headers.patch      |   36 --
 meta/recipes-core/eglibc/eglibc-initial_2.13.bb    |    6 -
 meta/recipes-core/eglibc/eglibc-locale_2.13.bb     |    1 -
 meta/recipes-core/eglibc/eglibc_2.13.bb            |  218 --------
 14 files changed, 1050 deletions(-)
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

diff --git a/meta/recipes-core/eglibc/cross-localedef-native_2.13.bb b/meta/recipes-core/eglibc/cross-localedef-native_2.13.bb
deleted file mode 100644
index 52759af..0000000
--- a/meta/recipes-core/eglibc/cross-localedef-native_2.13.bb
+++ /dev/null
@@ -1,43 +0,0 @@
-DESCRIPTION = "Cross locale generation tool for eglibc"
-HOMEPAGE = "http://www.eglibc.org/home"
-SECTION = "libs"
-LICENSE = "LGPL"
-
-LIC_DIR = "${WORKDIR}/${EGLIBC_BRANCH}/libc"
-LIC_FILES_CHKSUM = "file://${LIC_DIR}/LICENSES;md5=07a394b26e0902b9ffdec03765209770 \
-      file://${LIC_DIR}/COPYING;md5=393a5ca445f6965873eca0259a17f833 \
-      file://${LIC_DIR}/posix/rxspencer/COPYRIGHT;md5=dc5485bb394a13b2332ec1c785f5d83a \
-      file://${LIC_DIR}/COPYING.LIB;md5=bbb461211a33b134d42ed5ee802b37ff "
-
-
-inherit native
-inherit autotools
-
-PR = "r1"
-SRCREV="11982"
-EGLIBC_BRANCH="eglibc-2_12"
-SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};proto=http "
-S = "${WORKDIR}/${EGLIBC_BRANCH}/localedef"
-
-do_unpack_append() {
-	bb.build.exec_func('do_move_ports', d)
-}
-
-do_move_ports() {
-        if test -d ${WORKDIR}/${EGLIBC_BRANCH}/ports ; then
-	    rm -rf ${WORKDIR}/libc/ports
-	    mv ${WORKDIR}/${EGLIBC_BRANCH}/ports ${WORKDIR}/libc/
-	fi
-}
-
-EXTRA_OECONF = "--with-glibc=${WORKDIR}/${EGLIBC_BRANCH}/libc"
-
-do_configure () {
-	./configure ${EXTRA_OECONF}
-}
-
-
-do_install() {
-	install -d ${D}${bindir} 
-	install -m 0755 ${S}/localedef ${D}${bindir}/cross-localedef
-}
diff --git a/meta/recipes-core/eglibc/eglibc-2.13/IO-acquire-lock-fix.patch b/meta/recipes-core/eglibc/eglibc-2.13/IO-acquire-lock-fix.patch
deleted file mode 100644
index cf58035..0000000
--- a/meta/recipes-core/eglibc/eglibc-2.13/IO-acquire-lock-fix.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-import http://sourceware.org/ml/libc-ports/2007-12/msg00000.html
-
-Upstream-Status: Pending
-
-Index: libc/bits/stdio-lock.h
-===================================================================
---- libc.orig/bits/stdio-lock.h	2009-10-28 14:34:19.000000000 -0700
-+++ libc/bits/stdio-lock.h	2009-10-28 14:34:54.000000000 -0700
-@@ -50,6 +50,8 @@ __libc_lock_define_recursive (typedef, _
-   _IO_cleanup_region_start ((void (*) (void *)) _IO_funlockfile, (_fp));      \
-   _IO_flockfile (_fp)
- 
-+# define _IO_acquire_lock_clear_flags2(_fp) _IO_acquire_lock (_fp)
-+
- # define _IO_release_lock(_fp) \
-   _IO_funlockfile (_fp);						      \
-   _IO_cleanup_region_end (0)
diff --git a/meta/recipes-core/eglibc/eglibc-2.13/armv4-eabi-compile-fix.patch b/meta/recipes-core/eglibc/eglibc-2.13/armv4-eabi-compile-fix.patch
deleted file mode 100644
index c2407ee..0000000
--- a/meta/recipes-core/eglibc/eglibc-2.13/armv4-eabi-compile-fix.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-Source: http://sourceware.org/bugzilla/show_bug.cgi?id=12097
-Upstream-Status: Submitted
-
-The patch should be merged into glibc-ports
-
--Khem
-Index: libc/ports/sysdeps/unix/sysv/linux/arm/eabi/libc-do-syscall.S
-===================================================================
---- libc.orig/ports/sysdeps/unix/sysv/linux/arm/eabi/libc-do-syscall.S
-+++ libc/ports/sysdeps/unix/sysv/linux/arm/eabi/libc-do-syscall.S
-@@ -16,6 +16,8 @@
-    Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
-    02111-1307 USA.  */
- 
-+#if defined(__thumb__)
-+
- #include <sysdep.h>
- 
- /* Out-of-line syscall stub.  We expect the system call number in ip
-@@ -41,3 +43,5 @@ ENTRY (__libc_do_syscall)
- 	pop	{r7, pc}
- 	.fnend
- END (__libc_do_syscall)
-+
-+#endif /* __thumb__ */
diff --git a/meta/recipes-core/eglibc/eglibc-2.13/eglibc-svn-arm-lowlevellock-include-tls.patch b/meta/recipes-core/eglibc/eglibc-2.13/eglibc-svn-arm-lowlevellock-include-tls.patch
deleted file mode 100644
index 4313aa5..0000000
--- a/meta/recipes-core/eglibc/eglibc-2.13/eglibc-svn-arm-lowlevellock-include-tls.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-In file included from ../nptl/sysdeps/unix/sysv/linux/libc-lowlevellock.c:21:
-../nptl/sysdeps/unix/sysv/linux/lowlevellock.c: In function '__lll_lock_wait_private':
-../nptl/sysdeps/unix/sysv/linux/lowlevellock.c:34: warning: implicit declaration of function 'THREAD_GETMEM'
-../nptl/sysdeps/unix/sysv/linux/lowlevellock.c:34: error: 'THREAD_SELF' undeclared (first use in this function)
-../nptl/sysdeps/unix/sysv/linux/lowlevellock.c:34: error: (Each undeclared identifier is reported only once
-../nptl/sysdeps/unix/sysv/linux/lowlevellock.c:34: error: for each function it appears in.)
-../nptl/sysdeps/unix/sysv/linux/lowlevellock.c:34: error: 'header' undeclared (first use in this function)
-make[4]: *** [/var/tmp/portage/sys-libs/glibc-2.7-r1/work/build-default-armv4l-unknown-linux-gnu-nptl/nptl/rtld-libc-lowlevellock.os] Error 1
-
-Upstream-Status: Pending
-
---- libc/ports/sysdeps/unix/sysv/linux/arm/nptl/lowlevellock.h.orig
-+++ libc/ports/sysdeps/unix/sysv/linux/arm/nptl/lowlevellock.h
-@@ -25,6 +25,7 @@
- #include <atomic.h>
- #include <sysdep.h>
- #include <kernel-features.h>
-+#include <tls.h>
- 
- #define FUTEX_WAIT		0
- #define FUTEX_WAKE		1
diff --git a/meta/recipes-core/eglibc/eglibc-2.13/etc/ld.so.conf b/meta/recipes-core/eglibc/eglibc-2.13/etc/ld.so.conf
deleted file mode 100644
index e69de29..0000000
diff --git a/meta/recipes-core/eglibc/eglibc-2.13/generate-supported.mk b/meta/recipes-core/eglibc/eglibc-2.13/generate-supported.mk
deleted file mode 100644
index d2a28c2..0000000
--- a/meta/recipes-core/eglibc/eglibc-2.13/generate-supported.mk
+++ /dev/null
@@ -1,11 +0,0 @@
-#!/usr/bin/make
-
-include $(IN)
-
-all:
-	rm -f $(OUT)
-	touch $(OUT)
-	for locale in $(SUPPORTED-LOCALES); do \
-		[ $$locale = true ] && continue; \
-		echo $$locale | sed 's,/, ,' >> $(OUT); \
-	done
diff --git a/meta/recipes-core/eglibc/eglibc-2.13/ld-search-order.patch b/meta/recipes-core/eglibc/eglibc-2.13/ld-search-order.patch
deleted file mode 100644
index 40ae6d3..0000000
--- a/meta/recipes-core/eglibc/eglibc-2.13/ld-search-order.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-Upstream-Status: Inappropriate [embedded specific]
-
-The default lib search path order is:
-
-  1) LD_LIBRARY_PATH
-  2) RPATH from the binary
-  3) ld.so.cache
-  4) default search paths embedded in the linker
-
-For nativesdk binaries which are being used alongside binaries on a host system, we 
-need the search paths to firstly search the shipped nativesdk libs but then also
-cover the host system. For example we want the host system's libGL and this may be
-in a non-standard location like /usr/lib/mesa. The only place the location is know 
-about is in the ld.so.cache of the host system.
-
-Since nativesdk has a simple structure and doesn't need to use a cache itself, we 
-repurpose the cache for use as a last resort in finding host system binaries. This 
-means we need to switch the order of 3 and 4 above to make this work effectively.
-
-RP 14/10/2010
-
-Index: libc/elf/dl-load.c
-===================================================================
---- libc.orig/elf/dl-load.c
-+++ libc/elf/dl-load.c
-@@ -2107,6 +2107,15 @@ _dl_map_object (struct link_map *loader,
- 			&loader->l_runpath_dirs, &realname, &fb, loader,
- 			LA_SER_RUNPATH, &found_other_class);
- 
-+      /* try the default path.  */
-+      if (fd == -1
-+	  && ((l = loader ?: GL(dl_ns)[nsid]._ns_loaded) == NULL
-+	      || __builtin_expect (!(l->l_flags_1 & DF_1_NODEFLIB), 1))
-+	  && rtld_search_dirs.dirs != (void *) -1)
-+	fd = open_path (name, namelen, mode & __RTLD_SECURE, &rtld_search_dirs,
-+			&realname, &fb, l, LA_SER_DEFAULT, &found_other_class);
-+
-+      /* Finally try ld.so.cache */
-       if (fd == -1
- 	  && (__builtin_expect (! (mode & __RTLD_SECURE), 1)
- 	      || ! INTUSE(__libc_enable_secure)))
-@@ -2169,14 +2178,6 @@ _dl_map_object (struct link_map *loader,
- 	    }
- 	}
- 
--      /* Finally, try the default path.  */
--      if (fd == -1
--	  && ((l = loader ?: GL(dl_ns)[nsid]._ns_loaded) == NULL
--	      || __builtin_expect (!(l->l_flags_1 & DF_1_NODEFLIB), 1))
--	  && rtld_search_dirs.dirs != (void *) -1)
--	fd = open_path (name, namelen, mode & __RTLD_SECURE, &rtld_search_dirs,
--			&realname, &fb, l, LA_SER_DEFAULT, &found_other_class);
--
-       /* Add another newline when we are tracing the library loading.  */
-       if (__builtin_expect (GLRO_dl_debug_mask & DL_DEBUG_LIBS, 0))
- 	_dl_debug_printf ("\n");
diff --git a/meta/recipes-core/eglibc/eglibc-2.13/mips-rld-map-check.patch b/meta/recipes-core/eglibc/eglibc-2.13/mips-rld-map-check.patch
deleted file mode 100644
index 9b646fe..0000000
--- a/meta/recipes-core/eglibc/eglibc-2.13/mips-rld-map-check.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-
-On mips target, binutils currently sets DT_MIPS_RLD_MAP to 0 in dynamic
-section if a --version-script sets _RLD_MAP to local. This is apparently
-a binutils bug, but libc shouldn't segfault in this case.
-
-see also: http://sourceware.org/bugilla/show_bug.cgi?id=11615
-
-Upstream-Status: Pending
-
-9/19/2010 - added by Qing He <qing.he@intel.com>
-
-
----
-diff -ru glibc-2.10.1.orig/ports/sysdeps/mips/dl-machine.h glibc-2.10.1/ports/sysdeps/mips/dl-machine.h
---- glibc-2.10.1.orig/ports/sysdeps/mips/dl-machine.h	2009-05-16 16:36:20.000000000 +0800
-+++ glibc-2.10.1/ports/sysdeps/mips/dl-machine.h	2010-09-19 09:11:53.000000000 +0800
-@@ -70,7 +70,8 @@
- /* If there is a DT_MIPS_RLD_MAP entry in the dynamic section, fill it in
-    with the run-time address of the r_debug structure  */
- #define ELF_MACHINE_DEBUG_SETUP(l,r) \
--do { if ((l)->l_info[DT_MIPS (RLD_MAP)]) \
-+do { if ((l)->l_info[DT_MIPS (RLD_MAP)] && \
-+         (l)->l_info[DT_MIPS (RLD_MAP)]->d_un.d_ptr) \
-        *(ElfW(Addr) *)((l)->l_info[DT_MIPS (RLD_MAP)]->d_un.d_ptr) = \
-        (ElfW(Addr)) (r); \
-    } while (0)
diff --git a/meta/recipes-core/eglibc/eglibc-2.13/multilib_readlib.patch b/meta/recipes-core/eglibc/eglibc-2.13/multilib_readlib.patch
deleted file mode 100644
index 1542b1b..0000000
--- a/meta/recipes-core/eglibc/eglibc-2.13/multilib_readlib.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Upstream-Status: Inappropriate [embedded specific]
-
-Replace the OECORE_KNOWN_INTERPRETER_NAMES with the value of 
-variable EGLIBC_KNOWN_INTERPRETER_NAMES.
-
-Lianhao Lu, 08/01/2011
-
---- libc/elf/readlib.c.orig	2011-08-12 17:05:51.864470837 +0800
-+++ libc/elf/readlib.c	2011-08-12 17:06:39.346942074 +0800
-@@ -52,6 +52,7 @@
- #ifdef SYSDEP_KNOWN_INTERPRETER_NAMES
-   SYSDEP_KNOWN_INTERPRETER_NAMES
- #endif
-+  OECORE_KNOWN_INTERPRETER_NAMES
- };
- 
- static struct known_names known_libs[] =
diff --git a/meta/recipes-core/eglibc/eglibc-2.13/ppc-sqrt.patch b/meta/recipes-core/eglibc/eglibc-2.13/ppc-sqrt.patch
deleted file mode 100644
index 203040c..0000000
--- a/meta/recipes-core/eglibc/eglibc-2.13/ppc-sqrt.patch
+++ /dev/null
@@ -1,538 +0,0 @@
-Upstream-Status: Pending
-
-2011-03-22  Joseph Myers  <joseph@codesourcery.com>
-
-        Merge from SG++ 2.11:
-
-        2010-10-05  Nathan Froyd  <froydnj@codesourcery.com>
-
-        Issue #9382
-
-        * sysdeps/powerpc/powerpc32/603e/: New directory.
-        * sysdeps/unix/sysv/linux/powerpc/powerpc32/e500mc/: New directory.
-        * sysdeps/unix/sysv/linux/powerpc/powerpc32/603e/: New directory.
-        * sysdeps/unix/sysv/linux/powerpc/powerpc32/7400/: New directory.
-        * sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c: Update.
-        * sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c: Update.
-        * sysdeps/powerpc/powerpc64/e5500/fpu/Implies: New file.
-
-Index: libc/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c
-===================================================================
---- /dev/null
-+++ libc/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c
-@@ -0,0 +1,134 @@
-+/* Double-precision floating point square root.
-+   Copyright (C) 2010 Free Software Foundation, Inc.
-+   This file is part of the GNU C Library.
-+
-+   The GNU C Library is free software; you can redistribute it and/or
-+   modify it under the terms of the GNU Lesser General Public
-+   License as published by the Free Software Foundation; either
-+   version 2.1 of the License, or (at your option) any later version.
-+
-+   The GNU C Library is distributed in the hope that it will be useful,
-+   but WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   Lesser General Public License for more details.
-+
-+   You should have received a copy of the GNU Lesser General Public
-+   License along with the GNU C Library; if not, write to the Free
-+   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
-+   02111-1307 USA.  */
-+
-+#include <math.h>
-+#include <math_private.h>
-+#include <fenv_libc.h>
-+#include <inttypes.h>
-+
-+#include <sysdep.h>
-+#include <ldsodefs.h>
-+
-+static const ieee_float_shape_type a_nan = {.word = 0x7fc00000 };
-+static const ieee_float_shape_type a_inf = {.word = 0x7f800000 };
-+static const float two108 = 3.245185536584267269e+32;
-+static const float twom54 = 5.551115123125782702e-17;
-+static const float half = 0.5;
-+
-+/* The method is based on the descriptions in:
-+
-+   _The Handbook of Floating-Pointer Arithmetic_ by Muller et al., chapter 5;
-+   _IA-64 and Elementary Functions: Speed and Precision_ by Markstein, chapter 9
-+
-+   We find the actual square root and half of its reciprocal
-+   simultaneously.  */
-+
-+#ifdef __STDC__
-+double
-+__ieee754_sqrt (double b)
-+#else
-+double
-+__ieee754_sqrt (b)
-+     double b;
-+#endif
-+{
-+  if (__builtin_expect (b > 0, 1))
-+    {
-+      double y, g, h, d, r;
-+      ieee_double_shape_type u;
-+
-+      if (__builtin_expect (b != a_inf.value, 1))
-+        {
-+          fenv_t fe;
-+
-+          fe = fegetenv_register ();
-+
-+          u.value = b;
-+
-+          relax_fenv_state ();
-+
-+          __asm__ ("frsqrte %[estimate], %[x]\n"
-+                   : [estimate] "=f" (y) : [x] "f" (b));
-+
-+          /* Following Muller et al, page 168, equation 5.20.
-+
-+             h goes to 1/(2*sqrt(b))
-+             g goes to sqrt(b).
-+
-+             We need three iterations to get within 1ulp.  */
-+
-+          /* Indicate that these can be performed prior to the branch.  GCC
-+             insists on sinking them below the branch, however; it seems like
-+             they'd be better before the branch so that we can cover any latency
-+             from storing the argument and loading its high word.  Oh well.  */
-+
-+          g = b * y;
-+          h = 0.5 * y;
-+  
-+          /* Handle small numbers by scaling.  */
-+          if (__builtin_expect ((u.parts.msw & 0x7ff00000) <= 0x02000000, 0))
-+            return __ieee754_sqrt (b * two108) * twom54;
-+
-+#define FMADD(a_, c_, b_)                                               \
-+          ({ double __r;                                                \
-+          __asm__ ("fmadd %[r], %[a], %[c], %[b]\n"                     \
-+                   : [r] "=f" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "f" (b_)); \
-+          __r;})
-+#define FNMSUB(a_, c_, b_)                                          \
-+          ({ double __r;                                                \
-+          __asm__ ("fnmsub %[r], %[a], %[c], %[b]\n"                     \
-+                   : [r] "=f" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "f" (b_)); \
-+          __r;})
-+
-+          r = FNMSUB (g, h, half);
-+          g = FMADD (g, r, g);
-+          h = FMADD (h, r, h);
-+
-+          r = FNMSUB (g, h, half);
-+          g = FMADD (g, r, g);
-+          h = FMADD (h, r, h);
-+
-+          r = FNMSUB (g, h, half);
-+          g = FMADD (g, r, g);
-+          h = FMADD (h, r, h);
-+
-+          /* g is now +/- 1ulp, or exactly equal to, the square root of b.  */
-+
-+          /* Final refinement.  */
-+          d = FNMSUB (g, g, b);
-+
-+          fesetenv_register (fe);
-+          return FMADD (d, h, g);
-+        }
-+    }
-+  else if (b < 0)
-+    {
-+      /* For some reason, some PowerPC32 processors don't implement
-+         FE_INVALID_SQRT.  */
-+#ifdef FE_INVALID_SQRT
-+      feraiseexcept (FE_INVALID_SQRT);
-+
-+      fenv_union_t u = { .fenv = fegetenv_register () };
-+      if ((u.l[1] & FE_INVALID) == 0)
-+#endif
-+	feraiseexcept (FE_INVALID);
-+      b = a_nan.value;
-+    }
-+  return f_wash (b);
-+}
-Index: libc/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c
-===================================================================
---- /dev/null
-+++ libc/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c
-@@ -0,0 +1,101 @@
-+/* Single-precision floating point square root.
-+   Copyright (C) 2010 Free Software Foundation, Inc.
-+   This file is part of the GNU C Library.
-+
-+   The GNU C Library is free software; you can redistribute it and/or
-+   modify it under the terms of the GNU Lesser General Public
-+   License as published by the Free Software Foundation; either
-+   version 2.1 of the License, or (at your option) any later version.
-+
-+   The GNU C Library is distributed in the hope that it will be useful,
-+   but WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   Lesser General Public License for more details.
-+
-+   You should have received a copy of the GNU Lesser General Public
-+   License along with the GNU C Library; if not, write to the Free
-+   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
-+   02111-1307 USA.  */
-+
-+#include <math.h>
-+#include <math_private.h>
-+#include <fenv_libc.h>
-+#include <inttypes.h>
-+
-+#include <sysdep.h>
-+#include <ldsodefs.h>
-+
-+static const ieee_float_shape_type a_nan = {.word = 0x7fc00000 };
-+static const ieee_float_shape_type a_inf = {.word = 0x7f800000 };
-+static const float threehalf = 1.5;
-+
-+/* The method is based on the descriptions in:
-+
-+   _The Handbook of Floating-Pointer Arithmetic_ by Muller et al., chapter 5;
-+   _IA-64 and Elementary Functions: Speed and Precision_ by Markstein, chapter 9
-+
-+   We find the reciprocal square root and use that to compute the actual
-+   square root.  */
-+
-+#ifdef __STDC__
-+float
-+__ieee754_sqrtf (float b)
-+#else
-+float
-+__ieee754_sqrtf (b)
-+     float b;
-+#endif
-+{
-+  if (__builtin_expect (b > 0, 1))
-+    {
-+#define FMSUB(a_, c_, b_)                                               \
-+      ({ double __r;                                                    \
-+        __asm__ ("fmsub %[r], %[a], %[c], %[b]\n"                       \
-+                 : [r] "=f" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "f" (b_)); \
-+        __r;})
-+#define FNMSUB(a_, c_, b_)                                              \
-+      ({ double __r;                                                    \
-+        __asm__ ("fnmsub %[r], %[a], %[c], %[b]\n"                      \
-+                 : [r] "=f" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "f" (b_)); \
-+        __r;})
-+
-+      if (__builtin_expect (b != a_inf.value, 1))
-+        {
-+          double y, x;
-+          fenv_t fe;
-+
-+          fe = fegetenv_register ();
-+
-+          relax_fenv_state ();
-+
-+          /* Compute y = 1.5 * b - b.  Uses fewer constants than y = 0.5 * b.  */
-+          y = FMSUB (threehalf, b, b);
-+
-+          /* Initial estimate.  */
-+          __asm__ ("frsqrte %[x], %[b]\n" : [x] "=f" (x) : [b] "f" (b));
-+
-+          /* Iterate.  x_{n+1} = x_n * (1.5 - y * (x_n * x_n)).  */
-+          x = x * FNMSUB (y, x * x, threehalf);
-+          x = x * FNMSUB (y, x * x, threehalf);
-+          x = x * FNMSUB (y, x * x, threehalf);
-+
-+          /* All done.  */
-+          fesetenv_register (fe);
-+          return x * b;
-+        }
-+    }
-+  else if (b < 0)
-+    {
-+      /* For some reason, some PowerPC32 processors don't implement
-+         FE_INVALID_SQRT.  */
-+#ifdef FE_INVALID_SQRT
-+      feraiseexcept (FE_INVALID_SQRT);
-+
-+      fenv_union_t u = { .fenv = fegetenv_register () };
-+      if ((u.l[1] & FE_INVALID) == 0)
-+#endif
-+	feraiseexcept (FE_INVALID);
-+      b = a_nan.value;
-+    }
-+  return f_washf (b);
-+}
-Index: libc/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c
-===================================================================
---- /dev/null
-+++ libc/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c
-@@ -0,0 +1,134 @@
-+/* Double-precision floating point square root.
-+   Copyright (C) 2010 Free Software Foundation, Inc.
-+   This file is part of the GNU C Library.
-+
-+   The GNU C Library is free software; you can redistribute it and/or
-+   modify it under the terms of the GNU Lesser General Public
-+   License as published by the Free Software Foundation; either
-+   version 2.1 of the License, or (at your option) any later version.
-+
-+   The GNU C Library is distributed in the hope that it will be useful,
-+   but WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   Lesser General Public License for more details.
-+
-+   You should have received a copy of the GNU Lesser General Public
-+   License along with the GNU C Library; if not, write to the Free
-+   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
-+   02111-1307 USA.  */
-+
-+#include <math.h>
-+#include <math_private.h>
-+#include <fenv_libc.h>
-+#include <inttypes.h>
-+
-+#include <sysdep.h>
-+#include <ldsodefs.h>
-+
-+static const ieee_float_shape_type a_nan = {.word = 0x7fc00000 };
-+static const ieee_float_shape_type a_inf = {.word = 0x7f800000 };
-+static const float two108 = 3.245185536584267269e+32;
-+static const float twom54 = 5.551115123125782702e-17;
-+static const float half = 0.5;
-+
-+/* The method is based on the descriptions in:
-+
-+   _The Handbook of Floating-Pointer Arithmetic_ by Muller et al., chapter 5;
-+   _IA-64 and Elementary Functions: Speed and Precision_ by Markstein, chapter 9
-+
-+   We find the actual square root and half of its reciprocal
-+   simultaneously.  */
-+
-+#ifdef __STDC__
-+double
-+__ieee754_sqrt (double b)
-+#else
-+double
-+__ieee754_sqrt (b)
-+     double b;
-+#endif
-+{
-+  if (__builtin_expect (b > 0, 1))
-+    {
-+      double y, g, h, d, r;
-+      ieee_double_shape_type u;
-+
-+      if (__builtin_expect (b != a_inf.value, 1))
-+        {
-+          fenv_t fe;
-+
-+          fe = fegetenv_register ();
-+
-+          u.value = b;
-+
-+          relax_fenv_state ();
-+
-+          __asm__ ("frsqrte %[estimate], %[x]\n"
-+                   : [estimate] "=f" (y) : [x] "f" (b));
-+
-+          /* Following Muller et al, page 168, equation 5.20.
-+
-+             h goes to 1/(2*sqrt(b))
-+             g goes to sqrt(b).
-+
-+             We need three iterations to get within 1ulp.  */
-+
-+          /* Indicate that these can be performed prior to the branch.  GCC
-+             insists on sinking them below the branch, however; it seems like
-+             they'd be better before the branch so that we can cover any latency
-+             from storing the argument and loading its high word.  Oh well.  */
-+
-+          g = b * y;
-+          h = 0.5 * y;
-+  
-+          /* Handle small numbers by scaling.  */
-+          if (__builtin_expect ((u.parts.msw & 0x7ff00000) <= 0x02000000, 0))
-+            return __ieee754_sqrt (b * two108) * twom54;
-+
-+#define FMADD(a_, c_, b_)                                               \
-+          ({ double __r;                                                \
-+          __asm__ ("fmadd %[r], %[a], %[c], %[b]\n"                     \
-+                   : [r] "=f" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "f" (b_)); \
-+          __r;})
-+#define FNMSUB(a_, c_, b_)                                          \
-+          ({ double __r;                                                \
-+          __asm__ ("fnmsub %[r], %[a], %[c], %[b]\n"                     \
-+                   : [r] "=f" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "f" (b_)); \
-+          __r;})
-+
-+          r = FNMSUB (g, h, half);
-+          g = FMADD (g, r, g);
-+          h = FMADD (h, r, h);
-+
-+          r = FNMSUB (g, h, half);
-+          g = FMADD (g, r, g);
-+          h = FMADD (h, r, h);
-+
-+          r = FNMSUB (g, h, half);
-+          g = FMADD (g, r, g);
-+          h = FMADD (h, r, h);
-+
-+          /* g is now +/- 1ulp, or exactly equal to, the square root of b.  */
-+
-+          /* Final refinement.  */
-+          d = FNMSUB (g, g, b);
-+
-+          fesetenv_register (fe);
-+          return FMADD (d, h, g);
-+        }
-+    }
-+  else if (b < 0)
-+    {
-+      /* For some reason, some PowerPC32 processors don't implement
-+         FE_INVALID_SQRT.  */
-+#ifdef FE_INVALID_SQRT
-+      feraiseexcept (FE_INVALID_SQRT);
-+
-+      fenv_union_t u = { .fenv = fegetenv_register () };
-+      if ((u.l[1] & FE_INVALID) == 0)
-+#endif
-+	feraiseexcept (FE_INVALID);
-+      b = a_nan.value;
-+    }
-+  return f_wash (b);
-+}
-Index: libc/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c
-===================================================================
---- /dev/null
-+++ libc/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c
-@@ -0,0 +1,101 @@
-+/* Single-precision floating point square root.
-+   Copyright (C) 2010 Free Software Foundation, Inc.
-+   This file is part of the GNU C Library.
-+
-+   The GNU C Library is free software; you can redistribute it and/or
-+   modify it under the terms of the GNU Lesser General Public
-+   License as published by the Free Software Foundation; either
-+   version 2.1 of the License, or (at your option) any later version.
-+
-+   The GNU C Library is distributed in the hope that it will be useful,
-+   but WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   Lesser General Public License for more details.
-+
-+   You should have received a copy of the GNU Lesser General Public
-+   License along with the GNU C Library; if not, write to the Free
-+   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
-+   02111-1307 USA.  */
-+
-+#include <math.h>
-+#include <math_private.h>
-+#include <fenv_libc.h>
-+#include <inttypes.h>
-+
-+#include <sysdep.h>
-+#include <ldsodefs.h>
-+
-+static const ieee_float_shape_type a_nan = {.word = 0x7fc00000 };
-+static const ieee_float_shape_type a_inf = {.word = 0x7f800000 };
-+static const float threehalf = 1.5;
-+
-+/* The method is based on the descriptions in:
-+
-+   _The Handbook of Floating-Pointer Arithmetic_ by Muller et al., chapter 5;
-+   _IA-64 and Elementary Functions: Speed and Precision_ by Markstein, chapter 9
-+
-+   We find the reciprocal square root and use that to compute the actual
-+   square root.  */
-+
-+#ifdef __STDC__
-+float
-+__ieee754_sqrtf (float b)
-+#else
-+float
-+__ieee754_sqrtf (b)
-+     float b;
-+#endif
-+{
-+  if (__builtin_expect (b > 0, 1))
-+    {
-+#define FMSUB(a_, c_, b_)                                               \
-+      ({ double __r;                                                    \
-+        __asm__ ("fmsub %[r], %[a], %[c], %[b]\n"                       \
-+                 : [r] "=f" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "f" (b_)); \
-+        __r;})
-+#define FNMSUB(a_, c_, b_)                                              \
-+      ({ double __r;                                                    \
-+        __asm__ ("fnmsub %[r], %[a], %[c], %[b]\n"                      \
-+                 : [r] "=f" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "f" (b_)); \
-+        __r;})
-+
-+      if (__builtin_expect (b != a_inf.value, 1))
-+        {
-+          double y, x;
-+          fenv_t fe;
-+
-+          fe = fegetenv_register ();
-+
-+          relax_fenv_state ();
-+
-+          /* Compute y = 1.5 * b - b.  Uses fewer constants than y = 0.5 * b.  */
-+          y = FMSUB (threehalf, b, b);
-+
-+          /* Initial estimate.  */
-+          __asm__ ("frsqrte %[x], %[b]\n" : [x] "=f" (x) : [b] "f" (b));
-+
-+          /* Iterate.  x_{n+1} = x_n * (1.5 - y * (x_n * x_n)).  */
-+          x = x * FNMSUB (y, x * x, threehalf);
-+          x = x * FNMSUB (y, x * x, threehalf);
-+          x = x * FNMSUB (y, x * x, threehalf);
-+
-+          /* All done.  */
-+          fesetenv_register (fe);
-+          return x * b;
-+        }
-+    }
-+  else if (b < 0)
-+    {
-+      /* For some reason, some PowerPC32 processors don't implement
-+         FE_INVALID_SQRT.  */
-+#ifdef FE_INVALID_SQRT
-+      feraiseexcept (FE_INVALID_SQRT);
-+
-+      fenv_union_t u = { .fenv = fegetenv_register () };
-+      if ((u.l[1] & FE_INVALID) == 0)
-+#endif
-+	feraiseexcept (FE_INVALID);
-+      b = a_nan.value;
-+    }
-+  return f_washf (b);
-+}
-Index: libc/sysdeps/unix/sysv/linux/powerpc/powerpc32/603e/fpu/Implies
-===================================================================
---- /dev/null
-+++ libc/sysdeps/unix/sysv/linux/powerpc/powerpc32/603e/fpu/Implies
-@@ -0,0 +1 @@
-+powerpc/powerpc32/603e/fpu
-Index: libc/sysdeps/unix/sysv/linux/powerpc/powerpc32/7400/fpu/Implies
-===================================================================
---- /dev/null
-+++ libc/sysdeps/unix/sysv/linux/powerpc/powerpc32/7400/fpu/Implies
-@@ -0,0 +1 @@
-+powerpc/powerpc32/603e/fpu
-Index: libc/sysdeps/unix/sysv/linux/powerpc/powerpc32/e500mc/fpu/Implies
-===================================================================
---- /dev/null
-+++ libc/sysdeps/unix/sysv/linux/powerpc/powerpc32/e500mc/fpu/Implies
-@@ -0,0 +1 @@
-+powerpc/powerpc32/603e/fpu
-Index: libc/sysdeps/unix/sysv/linux/powerpc/powerpc64/e5500/fpu/Implies
-===================================================================
---- /dev/null
-+++ libc/sysdeps/unix/sysv/linux/powerpc/powerpc64/e5500/fpu/Implies
-@@ -0,0 +1 @@
-+powerpc/powerpc64/e5500/fpu
-Index: libc/sysdeps/unix/sysv/linux/powerpc/powerpc32/e5500/fpu/Implies
-===================================================================
---- /dev/null
-+++ libc/sysdeps/unix/sysv/linux/powerpc/powerpc32/e5500/fpu/Implies
-@@ -0,0 +1 @@
-+powerpc/powerpc32/603e/fpu
diff --git a/meta/recipes-core/eglibc/eglibc-2.13/stack-protector-test.patch b/meta/recipes-core/eglibc/eglibc-2.13/stack-protector-test.patch
deleted file mode 100644
index dbf70a9..0000000
--- a/meta/recipes-core/eglibc/eglibc-2.13/stack-protector-test.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-Test for -fstack-protector is compile only test. One might have the option but
-might have build the compiler with --disable-ssp which means ssp should not be
-enabled. Therefore we change the test to a link time test. It will fail if
-libssp is not available.
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Index: libc/configure
-===================================================================
---- libc.orig/configure
-+++ libc/configure
-@@ -6937,7 +6937,7 @@ if test "${libc_cv_ssp+set}" = set; then
-   $as_echo_n "(cached) " >&6
- else
-   if { ac_try='${CC-cc} $CFLAGS $CPPFLAGS -Werror -fstack-protector
--			    -o /dev/null -c -x c /dev/null 1>&5'
-+			    -o /dev/null -x c /dev/null 1>&5'
-   { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
-   (eval $ac_try) 2>&5
-   ac_status=$?
-Index: libc/configure.in
-===================================================================
---- libc.orig/configure.in
-+++ libc/configure.in
-@@ -1787,7 +1787,7 @@ AC_SUBST(fno_unit_at_a_time)
- 
- AC_CACHE_CHECK(for -fstack-protector, libc_cv_ssp, [dnl
- if AC_TRY_COMMAND([${CC-cc} $CFLAGS $CPPFLAGS -Werror -fstack-protector
--			    -o /dev/null -c -x c /dev/null 1>&AS_MESSAGE_LOG_FD])
-+			    -o /dev/null -x c /dev/null 1>&AS_MESSAGE_LOG_FD])
- then
-   libc_cv_ssp=yes
- else
diff --git a/meta/recipes-core/eglibc/eglibc-2.13/use-sysroot-cxx-headers.patch b/meta/recipes-core/eglibc/eglibc-2.13/use-sysroot-cxx-headers.patch
deleted file mode 100644
index c06eebf..0000000
--- a/meta/recipes-core/eglibc/eglibc-2.13/use-sysroot-cxx-headers.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-build system of glibc currently adds the cxx headers path by detecting
-it using provided CXX and expects that they are installed w.r.t to standard
-installation location but in OE we install and use cxx headers from target
-sysroot therefore that code needs to be adapted for OE
-
-Upstream-Status: Inappropriate [OE-specific]
-
--Khem
-
-
---- a/configure.in
-+++ b/configure.in
-@@ -1118,9 +1118,8 @@ if test -n "$sysheaders"; then
-   SYSINCLUDES="$SYSINCLUDES \
- -isystem `echo $sysheaders | sed 's/:/ -isystem /g'`"
-   if test -n "$CXX"; then
--    cxxversion=`$CXX -dumpversion 2>&AS_MESSAGE_LOG_FD` &&
-     cxxmachine=`$CXX -dumpmachine 2>&AS_MESSAGE_LOG_FD` &&
--    cxxheaders=`$CXX -print-file-name=../../../../include/c++/`"$cxxversion" &&
-+    cxxheaders=`$CXX -print-sysroot`"$prefix/include/c++" &&
-     CXX_SYSINCLUDES="-isystem $cxxheaders \
- -isystem $cxxheaders/$cxxmachine -isystem $cxxheaders/backward"
-   fi
---- a/configure
-+++ b/configure
-@@ -5544,9 +5544,8 @@ if test -n "$sysheaders"; then
-   SYSINCLUDES="$SYSINCLUDES \
- -isystem `echo $sysheaders | sed 's/:/ -isystem /g'`"
-   if test -n "$CXX"; then
--    cxxversion=`$CXX -dumpversion 2>&5` &&
-     cxxmachine=`$CXX -dumpmachine 2>&5` &&
--    cxxheaders=`$CXX -print-file-name=../../../../include/c++/`"$cxxversion" &&
-+    cxxheaders=`$CXX -print-sysroot`"$prefix/include/c++" &&
-     CXX_SYSINCLUDES="-isystem $cxxheaders \
- -isystem $cxxheaders/$cxxmachine -isystem $cxxheaders/backward"
-   fi
diff --git a/meta/recipes-core/eglibc/eglibc-initial_2.13.bb b/meta/recipes-core/eglibc/eglibc-initial_2.13.bb
deleted file mode 100644
index 787c762..0000000
--- a/meta/recipes-core/eglibc/eglibc-initial_2.13.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require eglibc_${PV}.bb
-require eglibc-initial.inc
-
-do_configure_prepend () {
-        unset CFLAGS
-}
diff --git a/meta/recipes-core/eglibc/eglibc-locale_2.13.bb b/meta/recipes-core/eglibc/eglibc-locale_2.13.bb
deleted file mode 100644
index ce6c1d2..0000000
--- a/meta/recipes-core/eglibc/eglibc-locale_2.13.bb
+++ /dev/null
@@ -1 +0,0 @@
-require eglibc-locale.inc
diff --git a/meta/recipes-core/eglibc/eglibc_2.13.bb b/meta/recipes-core/eglibc/eglibc_2.13.bb
deleted file mode 100644
index 690f99d..0000000
--- a/meta/recipes-core/eglibc/eglibc_2.13.bb
+++ /dev/null
@@ -1,218 +0,0 @@
-require eglibc.inc
-
-SRCREV = "15508"
-
-DEPENDS += "gperf-native"
-PR = "r28"
-PR_append = "+svnr${SRCPV}"
-
-EGLIBC_BRANCH="eglibc-2_13"
-SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};proto=http \
-           file://eglibc-svn-arm-lowlevellock-include-tls.patch \
-           file://IO-acquire-lock-fix.patch \
-           file://mips-rld-map-check.patch \
-           file://stack-protector-test.patch \
-           file://armv4-eabi-compile-fix.patch \
-           file://etc/ld.so.conf \
-           file://generate-supported.mk \
-           file://ppc-sqrt.patch \
-           file://multilib_readlib.patch \
-           file://use-sysroot-cxx-headers.patch \
-	   "
-LIC_FILES_CHKSUM = "file://LICENSES;md5=98a1128c4b58120182cbea3b1752d8b9 \
-      file://COPYING;md5=393a5ca445f6965873eca0259a17f833 \
-      file://posix/rxspencer/COPYRIGHT;md5=dc5485bb394a13b2332ec1c785f5d83a \
-      file://COPYING.LIB;md5=bbb461211a33b134d42ed5ee802b37ff "
-
-SRC_URI_append_virtclass-nativesdk = " file://ld-search-order.patch"
-S = "${WORKDIR}/${EGLIBC_BRANCH}/libc"
-B = "${WORKDIR}/build-${TARGET_SYS}"
-
-PACKAGES_DYNAMIC = "libc6*"
-RPROVIDES_${PN}-dev = "libc6-dev virtual-libc-dev"
-PROVIDES_${PN}-dbg = "glibc-dbg"
-
-# the -isystem in bitbake.conf screws up glibc do_stage
-BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE}"
-TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${layout_includedir}"
-
-GLIBC_BROKEN_LOCALES = " _ER _ET so_ET yn_ER sid_ET tr_TR mn_MN gez_ET gez_ER bn_BD te_IN es_CR.ISO-8859-1"
-
-FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/eglibc-${PV}', '${FILE_DIRNAME}/eglibc', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
-
-#
-# For now, we will skip building of a gcc package if it is a uclibc one
-# and our build is not a uclibc one, and we skip a glibc one if our build
-# is a uclibc build.
-#
-# See the note in gcc/gcc_3.4.0.oe
-#
-
-python __anonymous () {
-    import bb, re
-    uc_os = (re.match('.*uclibc$', d.getVar('TARGET_OS', True)) != None)
-    if uc_os:
-        raise bb.parse.SkipPackage("incompatible with target %s" %
-                                   d.getVar('TARGET_OS', True))
-}
-
-export libc_cv_slibdir = "${base_libdir}"
-
-
-EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
-                --without-cvs --disable-profile --disable-debug --without-gd \
-                --enable-clocale=gnu \
-                --enable-add-ons=${GLIBC_ADDONS},ports \
-                --with-headers=${STAGING_INCDIR} \
-                --without-selinux \
-                ${GLIBC_EXTRA_OECONF}"
-
-EXTRA_OECONF += "${@get_libc_fpu_setting(bb, d)}"
-
-do_unpack_append() {
-	bb.build.exec_func('do_move_ports', d)
-}
-
-do_move_ports() {
-        if test -d ${WORKDIR}/${EGLIBC_BRANCH}/ports ; then
-	    rm -rf ${S}/ports
-	    mv ${WORKDIR}/${EGLIBC_BRANCH}/ports ${S}/
-	fi
-}
-
-do_patch_append() {
-	bb.build.exec_func('do_fix_ia_headers', d)
-	bb.build.exec_func('do_fix_readlib_c', d)
-}
-
-# We need to ensure that all of the i386 and x86_64 headers are identical
-# to support the multilib case.  We do this by copying headers from x86_64
-# to i386 directories.  Normally when hand building eglibc or a combined
-# system you would build 32-bit, and then overwrite any files with the x86_64
-# versions.
-#
-# Each time eglibc is updated, this will need to be re-evaluated.  In order
-# to do this, disable this function.  Build eglibc for a 32-bit and a 64-bit
-# IA32 target.  Compare the contents of the include files -- comments specific
-# to the x86_64 version compared to the 32-bit one.
-#
-# For eglibc 2.13, each conflict noted below:
-#  bits/a.out.h - Add support for __WORDSIZE = 64
-#  bits/byteswap.h - Copyright date mismatch, add support for __WORDSIZE = 64
-#  bits/endian.h - Comment mismatch
-#  bits/environment.h - add support for __WORDSIZE = 64
-#  bits/fcntl.h - Comment/Copyright date mismatch, add support for __WORDSIZE = 64
-#  bits/fenv.h - Copyright date mismatch, add support for __WORDSIZE = 64
-#  bits/huge_vall.h - Comment/Copyright date mismatch, remove support for older gcc
-#  bits/link.h - Function name difference, add x86_64 definitions
-#  bits/mathdef.h - Copyright date mismatch, add support for __WORDSIZE = 64
-#  bits/mathinline.h - Copyright date mismatch, contributed by mismatch, remove support for older gcc/assembly optimization, add support for __WORDSIZE = 64
-#  bits/mman.h - Header/Copyright date mismatch, add MAP_32BIT definition
-#  bits/msq.h - Copyright date mismatch, add __WORDSIZE = 32 definitions
-#  bits/pthread_type.h -- Contributed by added, add support for __WORDSIZE = 64
-#  bits/select.h - Copyright date mismatch, add support for __WORDSIZE = 64
-#  bits/semaphore.h - Copyright date mismatch, add support for __WORDSIZE = 64
-#  bits/sem.h - Copyright date mismatch
-#  bits/setjmp.h - Copyrgiht date mismatch, add support for __WORDSIZE = 64
-#  bits/shm.h - Copyright date mismatch, add support for __WORDSIZE = 32
-#  bits/sigcontext.h - Copyright date mismatch, license wording mismatch, add support for __WORDSIZE = 32
-#  bits/stat.h - Copyright date mismatch, add support for __WORDSIZE = 32 and __WORDSIZE = 64
-#  bits/string.h - Header/Copyright date mismatch, remove assembly optimizations
-#  bits/syscall.h - different order, some different syscalls listed
-#  bits/wchar.h - Change the way the definitions are done
-#  bits/wordsize.h - Different header, remove license notice, add __x86_64__ support
-#  bits/xtitypes.h - Header difference, different typedef format
-#  bits/fpu_control.h - header difference, revised comments, updated assembly macros
-#  sys/debugreg.h - Copyright date mismatch, new definition and added __WORDSIZE=64 support
-#  sys/epoll.h - Copyright date mismatch, slightly different definitions
-#  sys/io.h - Copyright date mismatch, slightly different assembly formats
-#  sys/perm.h - Copyright date mismatch
-#  sys/procfs.h - Copyright date mismatch, support for __WORDSIZE = 32
-#  sys/reg.h - Copyright date mismatch, support for __WORDSIZE = 64
-#  sys/ucontext.h - Copyright date mismatch, support for __WORDSIZE = 64
-#  sys/user.h - Copyright date mismatch, support for __WORDSIZE = 64
-#
-# we rm something to return to the default version
-#
-do_fix_ia_headers() {
-	cp ${S}/sysdeps/unix/sysv/linux/x86_64/bits/a.out.h ${S}/sysdeps/unix/sysv/linux/i386/bits/a.out.h
-	cp ${S}/sysdeps/x86_64/bits/byteswap.h ${S}/sysdeps/i386/bits/byteswap.h
-	cp ${S}/sysdeps/x86_64/bits/endian.h ${S}/sysdeps/i386/bits/endian.h
-	cp ${S}/sysdeps/unix/sysv/linux/x86_64/bits/environments.h ${S}/sysdeps/unix/sysv/linux/i386/bits/environments.h
-	cp ${S}/sysdeps/unix/sysv/linux/x86_64/bits/fcntl.h ${S}/sysdeps/unix/sysv/linux/i386/bits/fcntl.h
-	cp ${S}/sysdeps/x86_64/fpu/bits/fenv.h ${S}/sysdeps/i386/fpu/bits/fenv.h
-	rm -f ${S}/sysdeps/i386/bits/huge_vall.h
-	cp ${S}/sysdeps/x86_64/bits/link.h ${S}/sysdeps/i386/bits/link.h
-	cp ${S}/sysdeps/x86_64/bits/mathdef.h ${S}/sysdeps/i386/bits/mathdef.h
-	cp ${S}/sysdeps/x86_64/fpu/bits/mathinline.h ${S}/sysdeps/i386/fpu/bits/mathinline.h
-	cp ${S}/sysdeps/unix/sysv/linux/x86_64/bits/mman.h ${S}/sysdeps/unix/sysv/linux/i386/bits/mman.h
-	cp ${S}/sysdeps/unix/sysv/linux/x86_64/bits/msq.h ${S}/sysdeps/unix/sysv/linux/i386/bits/msq.h
-	cp ${S}/nptl/sysdeps/unix/sysv/linux/x86_64/bits/pthreadtypes.h ${S}/nptl/sysdeps/unix/sysv/linux/i386/bits/pthreadtypes.h
-	cp ${S}/sysdeps/x86_64/bits/select.h ${S}/sysdeps/i386/bits/select.h
-	cp ${S}/nptl/sysdeps/unix/sysv/linux/x86_64/bits/semaphore.h ${S}/nptl/sysdeps/unix/sysv/linux/i386/bits/semaphore.h
-	rm -f ${S}/sysdeps/unix/sysv/linux/x86_64/bits/sem.h
-	cp ${S}/sysdeps/x86_64/bits/setjmp.h ${S}/sysdeps/i386/bits/setjmp.h
-	cp ${S}/sysdeps/unix/sysv/linux/x86_64/bits/shm.h ${S}/sysdeps/unix/sysv/linux/i386/bits/shm.h
-	cp ${S}/sysdeps/unix/sysv/linux/x86_64/bits/sigcontext.h ${S}/sysdeps/unix/sysv/linux/i386/bits/sigcontext.h
-	cp ${S}/sysdeps/unix/sysv/linux/x86_64/bits/stat.h ${S}/sysdeps/unix/sysv/linux/i386/bits/stat.h
-	rm -f ${S}/sysdeps/i386/i486/bits/string.h ; cp ${S}/sysdeps/x86_64/bits/string.h ${S}/sysdeps/i386/bits/string.h 
-	# Skip syscall.h, see do_install
-	rm -f ${S}/sysdeps/unix/sysv/linux/i386/bits/wchar.h 
-	cp ${S}/sysdeps/x86_64/bits/wordsize.h ${S}/sysdeps/i386/bits/wordsize.h
-	cp ${S}/sysdeps/x86_64/bits/xtitypes.h ${S}/sysdeps/i386/bits/xtitypes.h
-	# i386 version is correct, x86_64 is incorrect for fpu_control.h
-	cp ${S}/sysdeps/i386/fpu_control.h ${S}/sysdeps/x86_64/fpu_control.h
-	cp ${S}/sysdeps/unix/sysv/linux/x86_64/sys/debugreg.h ${S}/sysdeps/unix/sysv/linux/i386/sys/debugreg.h
-	cp ${S}/sysdeps/unix/sysv/linux/x86_64/sys/epoll.h ${S}/sysdeps/unix/sysv/linux/i386/sys/epoll.h
-	cp ${S}/sysdeps/unix/sysv/linux/x86_64/sys/io.h ${S}/sysdeps/unix/sysv/linux/i386/sys/io.h
-	cp ${S}/sysdeps/unix/sysv/linux/x86_64/sys/perm.h ${S}/sysdeps/unix/sysv/linux/i386/sys/perm.h
-	cp ${S}/sysdeps/unix/sysv/linux/x86_64/sys/procfs.h ${S}/sysdeps/unix/sysv/linux/i386/sys/procfs.h
-	cp ${S}/sysdeps/unix/sysv/linux/x86_64/sys/reg.h ${S}/sysdeps/unix/sysv/linux/i386/sys/reg.h
-	cp ${S}/sysdeps/unix/sysv/linux/x86_64/sys/ucontext.h ${S}/sysdeps/unix/sysv/linux/i386/sys/ucontext.h
-	cp ${S}/sysdeps/unix/sysv/linux/x86_64/sys/user.h ${S}/sysdeps/unix/sysv/linux/i386/sys/user.h
-}
-
-do_fix_readlib_c () {
-	sed -i -e 's#OECORE_KNOWN_INTERPRETER_NAMES#${EGLIBC_KNOWN_INTERPRETER_NAMES}#' ${S}/elf/readlib.c
-}
-
-do_configure () {
-# override this function to avoid the autoconf/automake/aclocal/autoheader
-# calls for now
-# don't pass CPPFLAGS into configure, since it upsets the kernel-headers
-# version check and doesn't really help with anything
-        if [ -z "`which rpcgen`" ]; then
-                echo "rpcgen not found.  Install glibc-devel."
-                exit 1
-        fi
-        (cd ${S} && gnu-configize) || die "failure in running gnu-configize"
-        find ${S} -name "configure" | xargs touch
-        CPPFLAGS="" oe_runconf
-}
-
-rpcsvc = "bootparam_prot.x nlm_prot.x rstat.x \
-	  yppasswd.x klm_prot.x rex.x sm_inter.x mount.x \
-	  rusers.x spray.x nfs_prot.x rquota.x key_prot.x"
-
-do_compile () {
-	# -Wl,-rpath-link <staging>/lib in LDFLAGS can cause breakage if another glibc is in staging
-	unset LDFLAGS
-	base_do_compile
-	(
-		cd ${S}/sunrpc/rpcsvc
-		for r in ${rpcsvc}; do
-			h=`echo $r|sed -e's,\.x$,.h,'`
-			rpcgen -h $r -o $h || bbwarn "unable to generate header for $r"
-		done
-	)
-	echo "Adjust ldd script"
-	if [ -n "${RTLDLIST}" ]
-	then
-		sed -i ${B}/elf/ldd -e 's#^\(RTLDLIST=\)"\(.*\)"$#\1\2#'
-		sed -i ${B}/elf/ldd -e 's#^\(RTLDLIST=\)\(.*\)$#\1"${RTLDLIST} \2"#'
-	fi
-}
-
-require eglibc-package.inc
-
-BBCLASSEXTEND = "nativesdk"
-- 
1.7.9.5



