Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xin.Ouyang@windriver.com>) id 1T06t0-0008IP-SP
	for openembedded-core@lists.openembedded.org;
	Sat, 11 Aug 2012 10:17:31 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q7B85dVV002288
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Aug 2012 01:05:39 -0700 (PDT)
Received: from Xouyang-Ubuntu.corp.ad.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Sat, 11 Aug 2012 01:05:38 -0700
From: <xin.ouyang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 11 Aug 2012 16:05:37 +0800
Message-ID: <1344672337-9025-1-git-send-email-xin.ouyang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] libatomics-ops: update to the latest version 7.2
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
X-List-Received-Date: Sat, 11 Aug 2012 08:17:31 -0000
Content-Type: text/plain

From: Xin Ouyang <Xin.Ouyang@windriver.com>

All old patches are droped because:

Merged into 7.2 by upstream:
* fedora/libatomic_ops-1.2-ppclwzfix.patch
* gentoo/libatomic_ops-1.2-mips.patch
* gentoo/sh4-atomic-ops.patch
* libatomics-ops_fix_for_x32.patch

Obsolete:
* doublefix.patch

Signed-off-by: Xin Ouyang <Xin.Ouyang@windriver.com>
---
 .../pulseaudio/libatomics-ops/doublefix.patch      |   27 ----
 .../fedora/libatomic_ops-1.2-ppclwzfix.patch       |   20 ---
 .../gentoo/libatomic_ops-1.2-mips.patch            |  129 --------------------
 .../libatomics-ops/gentoo/sh4-atomic-ops.patch     |   70 -----------
 .../libatomics-ops_fix_for_x32.patch               |   41 -------
 .../pulseaudio/libatomics-ops_1.2.bb               |   34 ------
 .../pulseaudio/libatomics-ops_7.2.bb               |   29 +++++
 7 files changed, 29 insertions(+), 321 deletions(-)
 delete mode 100644 meta/recipes-multimedia/pulseaudio/libatomics-ops/doublefix.patch
 delete mode 100644 meta/recipes-multimedia/pulseaudio/libatomics-ops/fedora/libatomic_ops-1.2-ppclwzfix.patch
 delete mode 100644 meta/recipes-multimedia/pulseaudio/libatomics-ops/gentoo/libatomic_ops-1.2-mips.patch
 delete mode 100644 meta/recipes-multimedia/pulseaudio/libatomics-ops/gentoo/sh4-atomic-ops.patch
 delete mode 100644 meta/recipes-multimedia/pulseaudio/libatomics-ops/libatomics-ops_fix_for_x32.patch
 delete mode 100644 meta/recipes-multimedia/pulseaudio/libatomics-ops_1.2.bb
 create mode 100644 meta/recipes-multimedia/pulseaudio/libatomics-ops_7.2.bb

diff --git a/meta/recipes-multimedia/pulseaudio/libatomics-ops/doublefix.patch b/meta/recipes-multimedia/pulseaudio/libatomics-ops/doublefix.patch
deleted file mode 100644
index 0d3b718..0000000
--- a/meta/recipes-multimedia/pulseaudio/libatomics-ops/doublefix.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-Double path references breaks recent autoconf+automake
-
-RP 2/1/10
-
-Index: libatomic_ops-1.2/src/atomic_ops/sysdeps/Makefile.am
-===================================================================
---- libatomic_ops-1.2.orig/src/atomic_ops/sysdeps/Makefile.am	2005-09-28 00:53:16.000000000 +0100
-+++ libatomic_ops-1.2/src/atomic_ops/sysdeps/Makefile.am	2010-02-01 14:28:46.397820574 +0000
-@@ -25,7 +25,6 @@
- 	  README \
- 	\
- 	  gcc/alpha.h gcc/arm.h gcc/x86.h \
--	  gcc/hppa.h gcc/ia64.h \
- 	  gcc/powerpc.h gcc/sparc.h \
- 	  gcc/hppa.h gcc/m68k.h gcc/s390.h \
- 	  gcc/ia64.h gcc/x86_64.h gcc/cris.h \
-Index: libatomic_ops-1.2/doc/Makefile.am
-===================================================================
---- libatomic_ops-1.2.orig/doc/Makefile.am	2010-02-01 15:20:09.207788884 +0000
-+++ libatomic_ops-1.2/doc/Makefile.am	2010-02-01 15:20:20.909049794 +0000
-@@ -1,3 +1,3 @@
- # installed documentation
- #
--dist_pkgdata_DATA=COPYING LICENSING.txt README.txt COPYING README_stack.txt README_malloc.txt README_win32.txt
-+dist_pkgdata_DATA=LICENSING.txt README.txt COPYING README_stack.txt README_malloc.txt README_win32.txt
diff --git a/meta/recipes-multimedia/pulseaudio/libatomics-ops/fedora/libatomic_ops-1.2-ppclwzfix.patch b/meta/recipes-multimedia/pulseaudio/libatomics-ops/fedora/libatomic_ops-1.2-ppclwzfix.patch
deleted file mode 100644
index 315ae91..0000000
--- a/meta/recipes-multimedia/pulseaudio/libatomics-ops/fedora/libatomic_ops-1.2-ppclwzfix.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Upstream-Status: Inappropriate [others]
-
-The patch is imported from fedora project, and is not appropriate for us
-to upstream it.
-
-http://cvs.fedoraproject.org/viewcvs/devel/libatomic_ops/libatomic_ops-1.2-ppclwzfix.patch
-
-* add fix for bad variable handling on PPC
-
---- libatomic_ops-1.2.orig/src/atomic_ops/sysdeps/gcc/powerpc.h	2007-05-29 19:29:52.000000000 +0200
-+++ libatomic_ops-1.2/src/atomic_ops/sysdeps/gcc/powerpc.h	2007-05-29 19:30:48.000000000 +0200
-@@ -72,7 +72,7 @@
-   /* registers.  I always got "impossible constraint" when I	*/
-   /* tried the "y" constraint.					*/
-   __asm__ __volatile__ (
--    "lwz %0,%1\n"
-+    "lwz%U1%X1 %0,%1\n"
-     "cmpw cr7,%0,%0\n"
-     "bne- cr7,1f\n"
-     "1: isync\n"
diff --git a/meta/recipes-multimedia/pulseaudio/libatomics-ops/gentoo/libatomic_ops-1.2-mips.patch b/meta/recipes-multimedia/pulseaudio/libatomics-ops/gentoo/libatomic_ops-1.2-mips.patch
deleted file mode 100644
index 971379d..0000000
--- a/meta/recipes-multimedia/pulseaudio/libatomics-ops/gentoo/libatomic_ops-1.2-mips.patch
+++ /dev/null
@@ -1,129 +0,0 @@
-Upstream-Status: Inappropriate [others]
-
-Patch from gentoo which is not appropriate for us to upstream.
-
-# Patch copied from the OpenEmbedded libatomics-ops recipe. Original
-# source was from Gentoo.
-#
-# Signed-off-by: Scott Garman <scott.a.garman@intel.com>
-diff --git a/src/atomic_ops.h b/src/atomic_ops.h
-index c23f30b..791b360 100755
---- a/src/atomic_ops.h
-+++ b/src/atomic_ops.h
-@@ -220,6 +220,9 @@
- # if defined(__cris__) || defined(CRIS)
- #   include "atomic_ops/sysdeps/gcc/cris.h"
- # endif
-+# if defined(__mips__) 
-+#   include "atomic_ops/sysdeps/gcc/mips.h"
-+# endif
- #endif /* __GNUC__ && !AO_USE_PTHREAD_DEFS */
- 
- #if defined(__INTEL_COMPILER) && !defined(AO_USE_PTHREAD_DEFS)
-diff --git a/src/atomic_ops/sysdeps/Makefile.am b/src/atomic_ops/sysdeps/Makefile.am
-index 74122b4..d6737c0 100644
---- a/src/atomic_ops/sysdeps/Makefile.am
-+++ b/src/atomic_ops/sysdeps/Makefile.am
-@@ -29,6 +29,7 @@ nobase_sysdep_HEADERS= generic_pthread.h \
- 	  gcc/powerpc.h gcc/sparc.h \
- 	  gcc/hppa.h gcc/m68k.h gcc/s390.h \
- 	  gcc/ia64.h gcc/x86_64.h gcc/cris.h \
-+	  gcc/mips.h \
- 	\
- 	  icc/ia64.h \
- 	\
-diff --git a/src/atomic_ops/sysdeps/gcc/mips.h b/src/atomic_ops/sysdeps/gcc/mips.h
-new file mode 100644
-index 0000000..e7f3a5d
---- /dev/null
-+++ b/src/atomic_ops/sysdeps/gcc/mips.h
-@@ -0,0 +1,89 @@
-+/* 
-+ * Copyright (c) 2005  Thiemo Seufer <ths@networkno.de>
-+ * Copyright (c) 2007  Zhang Le <r0bertz@gentoo.org>
-+ *
-+ * THIS MATERIAL IS PROVIDED AS IS, WITH ABSOLUTELY NO WARRANTY EXPRESSED
-+ * OR IMPLIED.  ANY USE IS AT YOUR OWN RISK.
-+ *
-+ * Permission is hereby granted to use or copy this program
-+ * for any purpose,  provided the above notices are retained on all copies.
-+ * Permission to modify the code and to distribute modified code is granted,
-+ * provided the above notices are retained, and a notice that the code was
-+ * modified is included with the above copyright notice.
-+ */
-+
-+#include "../all_aligned_atomic_load_store.h"
-+#include "../test_and_set_t_is_ao_t.h"
-+
-+/* Data dependence does not imply read ordering.  */
-+#define AO_NO_DD_ORDERING
-+
-+AO_INLINE void
-+AO_nop_full()
-+{
-+  __asm__ __volatile__(
-+      "       .set push           \n"
-+      "       .set mips3          \n"
-+      "       .set noreorder      \n"
-+      "       .set nomacro        \n"
-+      "       sync                \n"
-+      "       .set pop              "
-+      : : : "memory");
-+}
-+
-+#define AO_HAVE_nop_full
-+
-+AO_INLINE int
-+AO_compare_and_swap(volatile AO_t *addr, AO_t old, AO_t new_val)
-+{
-+  register int was_equal = 0;
-+  register int temp;
-+
-+  __asm__ __volatile__(
-+      "       .set push           \n"
-+      "       .set mips3          \n"
-+      "       .set noreorder      \n"
-+      "       .set nomacro        \n"
-+      "1:     ll      %0, %1      \n"
-+      "       bne     %0, %4, 2f  \n"
-+      "       move    %0, %3      \n"
-+      "       sc      %0, %1      \n"
-+      "       .set pop            \n"
-+      "       beqz    %0, 1b      \n"
-+      "       li      %2, 1       \n"
-+      "2:                           "
-+      : "=&r" (temp), "+R" (*addr), "+r" (was_equal)
-+      : "r" (new_val), "r" (old)
-+      : "memory");
-+  return was_equal;
-+}
-+
-+#define AO_HAVE_compare_and_swap
-+
-+AO_INLINE AO_t
-+AO_fetch_and_add_full (volatile AO_t *p, AO_t incr)
-+{
-+  AO_t result, temp;
-+  __asm__ __volatile__(
-+      "       .set push           \n"
-+      "       .set mips3          \n"
-+      "       .set noreorder      \n"
-+      "       .set nomacro        \n"
-+      "1:     ll      %1, %2      \n"
-+      "       addu    %0, %1, %3  \n"
-+      "       sc      %0, %2      \n"
-+      "       beqz    %0, 1b      \n"
-+      "       addu    %0, %1, %3  \n"
-+      "       sync                \n"
-+      "       .set pop            \n"
-+      : "=&r" (result), "=&r" (temp), "=m" (*p)
-+      : "r" (incr), "m" (*p)
-+      : "memory");
-+  return result;
-+}
-+
-+#define AO_HAVE_fetch_and_add_full
-+
-+/*
-+ * FIXME: fetch_and_add_full implemented, any others?
-+ */
diff --git a/meta/recipes-multimedia/pulseaudio/libatomics-ops/gentoo/sh4-atomic-ops.patch b/meta/recipes-multimedia/pulseaudio/libatomics-ops/gentoo/sh4-atomic-ops.patch
deleted file mode 100644
index dfdd29c..0000000
--- a/meta/recipes-multimedia/pulseaudio/libatomics-ops/gentoo/sh4-atomic-ops.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-This patch is taken from Gentoo
-http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/dev-libs/libatomic_ops/files/libatomic_ops-1.2-sh4.patch?revision=1.1&view=markup
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Index: libatomic_ops-1.2/src/atomic_ops.h
-===================================================================
---- libatomic_ops-1.2.orig/src/atomic_ops.h	2012-04-30 13:56:17.000000000 -0700
-+++ libatomic_ops-1.2/src/atomic_ops.h	2012-04-30 13:58:28.747602349 -0700
-@@ -223,6 +223,10 @@
- # if defined(__mips__) 
- #   include "atomic_ops/sysdeps/gcc/mips.h"
- # endif
-+# if defined(__sh__) || defined(SH4)
-+#   include "atomic_ops/sysdeps/gcc/sh.h"
-+#   define AO_CAN_EMUL_CAS
-+# endif /* __sh__ */
- #endif /* __GNUC__ && !AO_USE_PTHREAD_DEFS */
- 
- #if defined(__INTEL_COMPILER) && !defined(AO_USE_PTHREAD_DEFS)
-Index: libatomic_ops-1.2/src/atomic_ops/sysdeps/Makefile.am
-===================================================================
---- libatomic_ops-1.2.orig/src/atomic_ops/sysdeps/Makefile.am	2012-04-30 10:52:18.000000000 -0700
-+++ libatomic_ops-1.2/src/atomic_ops/sysdeps/Makefile.am	2012-04-30 14:00:11.511609965 -0700
-@@ -28,7 +28,7 @@
- 	  gcc/powerpc.h gcc/sparc.h \
- 	  gcc/hppa.h gcc/m68k.h gcc/s390.h \
- 	  gcc/ia64.h gcc/x86_64.h gcc/cris.h \
--	  gcc/mips.h \
-+	  gcc/mips.h gcc/sh.h \
- 	\
- 	  icc/ia64.h \
- 	\
-Index: libatomic_ops-1.2/src/atomic_ops/sysdeps/gcc/sh.h
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ libatomic_ops-1.2/src/atomic_ops/sysdeps/gcc/sh.h	2012-04-30 13:58:28.755602350 -0700
-@@ -0,0 +1,31 @@
-+/*
-+ * Copyright (c) 2009 by Takashi YOSHII. All rights reserved.
-+ *
-+ * THIS MATERIAL IS PROVIDED AS IS, WITH ABSOLUTELY NO WARRANTY EXPRESSED
-+ * OR IMPLIED.  ANY USE IS AT YOUR OWN RISK.
-+ *
-+ * Permission is hereby granted to use or copy this program
-+ * for any purpose,  provided the above notices are retained on all copies.
-+ * Permission to modify the code and to distribute modified code is granted,
-+ * provided the above notices are retained, and a notice that the code was
-+ * modified is included with the above copyright notice.
-+ */
-+
-+#include "../all_atomic_load_store.h"
-+#include "../ordered.h"
-+
-+/* sh has tas.b(byte) only */
-+#include "../test_and_set_t_is_char.h"
-+
-+AO_INLINE AO_TS_VAL_t
-+AO_test_and_set_full(volatile AO_TS_t *addr)
-+{
-+  int oldval;
-+  __asm__ __volatile__(
-+        "tas.b @%1; movt %0"
-+        : "=r" (oldval)
-+        : "r" (addr)
-+        : "t", "memory");
-+  return oldval? AO_TS_CLEAR : AO_TS_SET;
-+}
-+#define AO_HAVE_test_and_set_full
diff --git a/meta/recipes-multimedia/pulseaudio/libatomics-ops/libatomics-ops_fix_for_x32.patch b/meta/recipes-multimedia/pulseaudio/libatomics-ops/libatomics-ops_fix_for_x32.patch
deleted file mode 100644
index 1768606..0000000
--- a/meta/recipes-multimedia/pulseaudio/libatomics-ops/libatomics-ops_fix_for_x32.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-Upstream-Status: Pending
-
-Remove the `q' suffix on x86-64 atomic instructions.
-
-We don't need the `q' suffix on x86_64 atomic instructions for AO_t,
-which is defined as "unsigned long".  "unsigned long" is 32bit for x32
-and 64bit for x86-64. The register operand in x86-64 atomic instructions
-is sufficient to properly determine the register size.
-
-Received this patch from H.J. Lu <hjl.tools@gmail.com>
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com> 2011/12/02
-
---- libatomic_ops-1.2/src/atomic_ops/sysdeps/gcc/x86_64.h.x32	2005-09-28 17:16:38.000000000 -0700
-+++ libatomic_ops-1.2/src/atomic_ops/sysdeps/gcc/x86_64.h	2011-12-02 09:29:54.265251875 -0800
-@@ -60,7 +60,7 @@ AO_fetch_and_add_full (volatile AO_t *p,
- {
-   AO_t result;
- 
--  __asm__ __volatile__ ("lock; xaddq %0, %1" :
-+  __asm__ __volatile__ ("lock; xadd %0, %1" :
- 			"=r" (result), "=m" (*p) : "0" (incr), "m" (*p)
- 			: "memory");
-   return result;
-@@ -111,7 +111,7 @@ AO_int_fetch_and_add_full (volatile unsi
- AO_INLINE void
- AO_or_full (volatile AO_t *p, AO_t incr)
- {
--  __asm__ __volatile__ ("lock; orq %1, %0" :
-+  __asm__ __volatile__ ("lock; or %1, %0" :
- 			"=m" (*p) : "r" (incr), "m" (*p) : "memory");
- }
- 
-@@ -136,7 +136,7 @@ AO_compare_and_swap_full(volatile AO_t *
- 		  	     AO_t old, AO_t new_val) 
- {
-   char result;
--  __asm__ __volatile__("lock; cmpxchgq %3, %0; setz %1"
-+  __asm__ __volatile__("lock; cmpxchg %3, %0; setz %1"
- 	    	       : "=m"(*addr), "=q"(result)
- 		       : "m"(*addr), "r" (new_val), "a"(old) : "memory");
-   return (int) result;
diff --git a/meta/recipes-multimedia/pulseaudio/libatomics-ops_1.2.bb b/meta/recipes-multimedia/pulseaudio/libatomics-ops_1.2.bb
deleted file mode 100644
index eba43cd..0000000
--- a/meta/recipes-multimedia/pulseaudio/libatomics-ops_1.2.bb
+++ /dev/null
@@ -1,34 +0,0 @@
-SUMMARY = "A library for atomic integer operations"
-DESCRIPTION = "A library for atomic integer operations"
-HOMEPAGE = "http://www.hpl.hp.com/research/linux/atomic_ops/"
-SECTION = "optional"
-LICENSE = "GPLv2 & MIT"
-LIC_FILES_CHKSUM = "file://doc/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
-                    file://doc/LICENSING.txt;md5=607073e04548eac7d1f763e480477bab \
-		   "
-PR = "r10"
-
-SRC_URI = "http://www.hpl.hp.com/research/linux/atomic_ops/download/libatomic_ops-${PV}.tar.gz \
-           file://fedora/libatomic_ops-1.2-ppclwzfix.patch \
-           file://gentoo/libatomic_ops-1.2-mips.patch \
-           file://doublefix.patch \
-           file://libatomics-ops_fix_for_x32.patch \
-           file://gentoo/sh4-atomic-ops.patch \
-          "
-
-SRC_URI[md5sum] = "1b65e48271c81e3fa2d7a9a69bab7504"
-SRC_URI[sha256sum] = "a3d8768aa8fd2f6ae79be2d756b3a6b48816b3889ae906be3d5ffb2de5a5c781"
-
-S = "${WORKDIR}/libatomic_ops-${PV}"
-
-ALLOW_EMPTY_${PN} = "1"
-
-ARM_INSTRUCTION_SET = "arm"
-
-inherit autotools pkgconfig
-
-do_install_append() {
-	# those contain only docs, not necessary for now.
-	install -m 0755 -d ${D}${docdir}
-	mv ${D}${datadir}/libatomic_ops ${D}${docdir}/${PN}
-}
diff --git a/meta/recipes-multimedia/pulseaudio/libatomics-ops_7.2.bb b/meta/recipes-multimedia/pulseaudio/libatomics-ops_7.2.bb
new file mode 100644
index 0000000..3706656
--- /dev/null
+++ b/meta/recipes-multimedia/pulseaudio/libatomics-ops_7.2.bb
@@ -0,0 +1,29 @@
+SUMMARY = "A library for atomic integer operations"
+DESCRIPTION = "A library for atomic integer operations"
+HOMEPAGE = "http://www.hpl.hp.com/research/linux/atomic_ops/"
+SECTION = "optional"
+LICENSE = "GPLv2 & MIT"
+LIC_FILES_CHKSUM = "file://doc/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
+                    file://doc/LICENSING.txt;md5=607073e04548eac7d1f763e480477bab \
+		   "
+PR = "r0"
+
+SRC_URI = "http://www.hpl.hp.com/research/linux/atomic_ops/download/libatomic_ops-${PV}.tar.gz \
+          "
+
+SRC_URI[md5sum] = "890acdc83a7cd10e2e9536062d3741c8"
+SRC_URI[sha256sum] = "c4ee6e0c304c6f13bcc32968453cdb54b2ec233d8bf4cfcf266ee09dc33b4eb5"
+
+S = "${WORKDIR}/libatomic_ops-${PV}"
+
+ALLOW_EMPTY_${PN} = "1"
+
+ARM_INSTRUCTION_SET = "arm"
+
+inherit autotools pkgconfig
+
+do_install_append() {
+	# those contain only docs, not necessary for now.
+	install -m 0755 -d ${D}${docdir}
+	mv ${D}${datadir}/libatomic_ops ${D}${docdir}/${PN}
+}
-- 
1.7.9.5



