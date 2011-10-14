Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1REaUZ-0002YD-9o
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Oct 2011 07:39:35 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 13 Oct 2011 22:33:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,344,1315206000"; d="scan'208";a="73540460"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.120])
	by fmsmga001.fm.intel.com with ESMTP; 13 Oct 2011 22:33:36 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Oct 2011 22:33:14 -0700
Message-Id: <6165e63c731f29151de3cf256f607be698be0454.1318570250.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.2
In-Reply-To: <cover.1318570250.git.sgw@linux.intel.com>
References: <cover.1318570250.git.sgw@linux.intel.com>
In-Reply-To: <cover.1318570250.git.sgw@linux.intel.com>
References: <cover.1318570250.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 16/28] libaio: Update to 0.3.109
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
X-List-Received-Date: Fri, 14 Oct 2011 05:39:36 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../recipes-extended/libaio/libaio/00_arches.patch |  103 ++++++++++---------
 .../{libaio_0.3.107.bb => libaio_0.3.109.bb}       |    4 +-
 2 files changed, 56 insertions(+), 51 deletions(-)
 rename meta/recipes-extended/libaio/{libaio_0.3.107.bb => libaio_0.3.109.bb} (80%)

diff --git a/meta/recipes-extended/libaio/libaio/00_arches.patch b/meta/recipes-extended/libaio/libaio/00_arches.patch
index 77c2b3c..91f4588 100644
--- a/meta/recipes-extended/libaio/libaio/00_arches.patch
+++ b/meta/recipes-extended/libaio/libaio/00_arches.patch
@@ -2,8 +2,10 @@ Upstream-Status: Inappropriate [embedded specific]
 
 from openembedded, added by Qing He <qing.he@intel.com>
 
---- libaio-0.3.106.orig/src/syscall-m68k.h
-+++ libaio-0.3.106/src/syscall-m68k.h
+Index: libaio-0.3.109/src/syscall-m68k.h
+===================================================================
+--- /dev/null
++++ libaio-0.3.109/src/syscall-m68k.h
 @@ -0,0 +1,78 @@
 +#define __NR_io_setup		241
 +#define __NR_io_destroy		242
@@ -83,8 +85,10 @@ from openembedded, added by Qing He <qing.he@intel.com>
 +return (type) __res; \
 +}
 +
---- libaio-0.3.106.orig/src/syscall-sparc.h
-+++ libaio-0.3.106/src/syscall-sparc.h
+Index: libaio-0.3.109/src/syscall-sparc.h
+===================================================================
+--- /dev/null
++++ libaio-0.3.109/src/syscall-sparc.h
 @@ -0,0 +1,130 @@
 +/* $Id: unistd.h,v 1.74 2002/02/08 03:57:18 davem Exp $ */
 +
@@ -216,14 +220,14 @@ from openembedded, added by Qing He <qing.he@intel.com>
 +return -1; \
 +}
 +
---- libaio-0.3.106.orig/src/syscall.h
-+++ libaio-0.3.106/src/syscall.h
-@@ -22,6 +22,16 @@
- #include "syscall-s390.h"
- #elif defined(__alpha__)
+Index: libaio-0.3.109/src/syscall.h
+===================================================================
+--- libaio-0.3.109.orig/src/syscall.h
++++ libaio-0.3.109/src/syscall.h
+@@ -24,6 +24,14 @@
  #include "syscall-alpha.h"
-+#elif defined(__arm__)
-+#include "syscall-arm.h"
+ #elif defined(__arm__)
+ #include "syscall-arm.h"
 +#elif defined(__m68k__)
 +#include "syscall-m68k.h"
 +#elif defined(__sparc__)
@@ -235,8 +239,10 @@ from openembedded, added by Qing He <qing.he@intel.com>
  #else
  #error "add syscall-arch.h"
  #endif
---- libaio-0.3.106.orig/src/syscall-mips.h
-+++ libaio-0.3.106/src/syscall-mips.h
+Index: libaio-0.3.109/src/syscall-mips.h
+===================================================================
+--- /dev/null
++++ libaio-0.3.109/src/syscall-mips.h
 @@ -0,0 +1,223 @@
 +/*
 + * This file is subject to the terms and conditions of the GNU General Public
@@ -461,51 +467,45 @@ from openembedded, added by Qing He <qing.he@intel.com>
 +
 +#endif /* (_MIPS_SIM == _MIPS_SIM_NABI32) || (_MIPS_SIM == _MIPS_SIM_ABI64) */
 +
---- libaio-0.3.106.orig/src/libaio.h
-+++ libaio-0.3.106/src/libaio.h
-@@ -72,6 +72,40 @@
- #define PADDED(x, y)	unsigned y; x
- #define PADDEDptr(x, y) unsigned y; x
- #define PADDEDul(x, y)	unsigned y; unsigned long x
-+#elif defined(__arm__)
-+#  if defined (__ARMEB__) /* big endian, 32 bits */
-+#define PADDED(x, y)	unsigned y; x
-+#define PADDEDptr(x, y)	unsigned y; x
-+#define PADDEDul(x, y)	unsigned y; unsigned long x
-+#  else                   /* little endian, 32 bits */
-+#define PADDED(x, y)	x; unsigned y
-+#define PADDEDptr(x, y)	x; unsigned y
-+#define PADDEDul(x, y)	unsigned long x; unsigned y
-+#  endif
+Index: libaio-0.3.109/src/libaio.h
+===================================================================
+--- libaio-0.3.109.orig/src/libaio.h
++++ libaio-0.3.109/src/libaio.h
+@@ -83,6 +83,30 @@ typedef enum io_iocb_cmd {
+ #define PADDEDptr(x, y)	x; unsigned y
+ #define PADDEDul(x, y)	unsigned long x; unsigned y
+ #  endif
 +#elif defined(__m68k__) /* big endian, 32 bits */
-+#define PADDED(x, y)	unsigned y; x
-+#define PADDEDptr(x, y)	unsigned y; x
-+#define PADDEDul(x, y)	unsigned y; unsigned long x
++#define PADDED(x, y)   unsigned y; x
++#define PADDEDptr(x, y)        unsigned y; x
++#define PADDEDul(x, y) unsigned y; unsigned long x
 +#elif defined(__sparc__) /* big endian, 32 bits */
-+#define PADDED(x, y)	unsigned y; x
-+#define PADDEDptr(x, y)	unsigned y; x
-+#define PADDEDul(x, y)	unsigned y; unsigned long x
++#define PADDED(x, y)   unsigned y; x
++#define PADDEDptr(x, y)        unsigned y; x
++#define PADDEDul(x, y) unsigned y; unsigned long x
 +#elif defined(__hppa__) /* big endian, 32 bits */
-+#define PADDED(x, y)	unsigned y; x
-+#define PADDEDptr(x, y)	unsigned y; x
-+#define PADDEDul(x, y)	unsigned y; unsigned long x
++#define PADDED(x, y)   unsigned y; x
++#define PADDEDptr(x, y)        unsigned y; x
++#define PADDEDul(x, y) unsigned y; unsigned long x
 +#elif defined(__mips__)
 +#  if defined (__MIPSEB__) /* big endian, 32 bits */
-+#define PADDED(x, y)	unsigned y; x
-+#define PADDEDptr(x, y)	unsigned y; x
-+#define PADDEDul(x, y)	unsigned y; unsigned long x
++#define PADDED(x, y)   unsigned y; x
++#define PADDEDptr(x, y)        unsigned y; x
++#define PADDEDul(x, y) unsigned y; unsigned long x
 +#  elif defined(__MIPSEL__) /* little endian, 32 bits */
-+#define PADDED(x, y)	x; unsigned y
-+#define PADDEDptr(x, y)	x; unsigned y
-+#define PADDEDul(x, y)	unsigned long x; unsigned y
++#define PADDED(x, y)   x; unsigned y
++#define PADDEDptr(x, y)        x; unsigned y
++#define PADDEDul(x, y) unsigned long x; unsigned y
 +#  else
 +#    error "neither mipseb nor mipsel?"
 +#  endif
  #else
  #error	endian?
  #endif
---- libaio-0.3.106.orig/src/syscall-parisc.h
-+++ libaio-0.3.106/src/syscall-parisc.h
+Index: libaio-0.3.109/src/syscall-parisc.h
+===================================================================
+--- /dev/null
++++ libaio-0.3.109/src/syscall-parisc.h
 @@ -0,0 +1,146 @@
 +/*
 + * Linux system call numbers.
@@ -653,9 +653,14 @@ from openembedded, added by Qing He <qing.he@intel.com>
 +    return K_INLINE_SYSCALL(sname, 5, arg1, arg2, arg3, arg4, arg5);	\
 +}
 +
---- libaio-0.3.106.orig/src/syscall-arm.h
-+++ libaio-0.3.106/src/syscall-arm.h
-@@ -0,0 +1,116 @@
+Index: libaio-0.3.109/src/syscall-arm.h
+===================================================================
+--- libaio-0.3.109.orig/src/syscall-arm.h
++++ libaio-0.3.109/src/syscall-arm.h
+@@ -114,3 +114,119 @@ type fname(type1 arg1, type2 arg2, type3
+   return (type) __res_r0;						\
+ }
+ 
 +/*
 + *  linux/include/asm-arm/unistd.h
 + *
diff --git a/meta/recipes-extended/libaio/libaio_0.3.107.bb b/meta/recipes-extended/libaio/libaio_0.3.109.bb
similarity index 80%
rename from meta/recipes-extended/libaio/libaio_0.3.107.bb
rename to meta/recipes-extended/libaio/libaio_0.3.109.bb
index 16c7b6b..869b2da 100644
--- a/meta/recipes-extended/libaio/libaio_0.3.107.bb
+++ b/meta/recipes-extended/libaio/libaio_0.3.109.bb
@@ -12,8 +12,8 @@ SRC_URI = "${DEBIAN_MIRROR}/main/liba/libaio/libaio_${PV}.orig.tar.gz \
            file://toolchain.patch \
            file://destdir.patch"
 
-SRC_URI[md5sum] = "db32c19c61ca937bcb1ba48da9180682"
-SRC_URI[sha256sum] = "e6ad9246d7cd615d90fb3d231eec94111a36a85e9ffc759ac6bdab1a03995f27"
+SRC_URI[md5sum] = "435a5b16ca6198eaf01155263d855756"
+SRC_URI[sha256sum] = "bf4a457253cbaab215aea75cb6e18dc8d95bbd507e9920661ff9bdd288c8778d"
 
 EXTRA_OEMAKE =+ "prefix=${prefix} includedir=${includedir} libdir=${libdir}"
 
-- 
1.7.6.2



