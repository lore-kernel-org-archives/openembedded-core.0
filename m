Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id 38FE6606E8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Aug 2015 09:35:39 +0000 (UTC)
Received: by igxp17 with SMTP id p17so51539318igx.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Aug 2015 02:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=/GGsJuXy1/oho6ljS3BepD4bN24xZLtq0y8OtkRSM6w=;
	b=wN0eaicCEVDdeAew/r9k8qPhzayLAfueVwTCU35CGXihZ5G59eNNxd+iWLA+Y/luK/
	rHgkuUrVybagzGmCnNFZBomtPiw2GF6OZ0laQN1qIYQmPiUhI492hg2cEUCAu4aX95Bm
	pSHPqq+5s94qVfjOrKtkKvdPw8a5yFZTEGhx0E2+lrKSRjKuJNcf17j5WS+eOZ6neMDV
	eM+DCFupJ9UTs4XfDCeE5B2/JTQ8wE3rvPdOpbjGXRzV+gs2tb6xmP8UZm7dumusNRBs
	HIphfd0Q0aLxnHaWDEOXSv7LfcoMcnr9ItkEpg1wtmruCrHujFusc3Thl9R/q+SPIvmg
	sEKA==
X-Received: by 10.50.108.37 with SMTP id hh5mr16799196igb.10.1439804139176;
	Mon, 17 Aug 2015 02:35:39 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79]) by smtp.gmail.com with ESMTPSA id
	s12sm12292792ioe.14.2015.08.17.02.35.38
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 17 Aug 2015 02:35:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Aug 2015 02:35:33 -0700
Message-Id: <1439804133-27118-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCH V2] uclibc: Upgrade to tip of master
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
X-List-Received-Date: Mon, 17 Aug 2015 09:35:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Drop upstreamed patches convert the rest to git am'able patches

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/uclibc/uclibc-git.inc            |  36 +-
 .../0001-Add-eventfd_read-and-eventfd_write.patch  | 120 ---
 ...IPTOS_CLASS_-macros-according-to-RFC-2474.patch |  75 --
 .../0001-Disable-lrount_tes-function.patch         |  37 +
 ...nt.c-wtent.c-move-functions-from-utxent.c.patch | 319 --------
 ...1-atexit_old-Do-not-add-it-to-shared-libc.patch |  44 -
 ...brt-Use-nodefaultlibs-instead-of-nostdlib.patch |  33 -
 ...-Move-aeabi_read_tp-to-uclibc_nonshared.a.patch |  28 -
 ...rk-Hide-pthread_atfork-in-shared-versions.patch |  74 --
 .../uclibc-git/0001-timex-Sync-with-glibc.patch    |  33 -
 ...Add-implementation-for-copysignl-for-ppc.patch} |  32 +-
 .../uclibc-git/0002-wire-setns-syscall.patch       |  68 --
 ...rt.patch => 0003-Add-argp-implementation.patch} | 911 +++++++++++++++++----
 ...t-localised-optimizations-this-helps-to-h.patch |  30 +
 .../0005-Always-use-O2-for-compiling-fork.c.patch  |  33 +
 ...ldso-limited-support-for-ORIGIN-in-rpath.patch} |  13 +-
 ...rk-Hide-pthread_atfork-in-shared-versions.patch |  35 +
 .../uclibc/uclibc-git/argp-headers.patch           | 583 -------------
 .../uclibc-git/compile-arm-fork-with-O2.patch      |  21 -
 .../ldso-mark-_dl_exit-as-noreturn.patch           |  48 --
 .../uclibc-git/remove_attribute_optimize_Os.patch  |  19 -
 .../uclibc-git/uclibc_enable_log2_test.patch       |  35 -
 meta/recipes-core/uclibc/uclibc.inc                |   2 +-
 23 files changed, 944 insertions(+), 1685 deletions(-)
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/0001-Add-eventfd_read-and-eventfd_write.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/0001-Define-IPTOS_CLASS_-macros-according-to-RFC-2474.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/0001-Disable-lrount_tes-function.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/0001-Revert-utent.c-wtent.c-move-functions-from-utxent.c.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/0001-atexit_old-Do-not-add-it-to-shared-libc.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/0001-librt-Use-nodefaultlibs-instead-of-nostdlib.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/0001-nptl-arm-Move-aeabi_read_tp-to-uclibc_nonshared.a.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/0001-nptl-atfork-Hide-pthread_atfork-in-shared-versions.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/0001-timex-Sync-with-glibc.patch
 rename meta/recipes-core/uclibc/uclibc-git/{powerpc_copysignl.patch => 0002-Add-implementation-for-copysignl-for-ppc.patch} (73%)
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/0002-wire-setns-syscall.patch
 rename meta/recipes-core/uclibc/uclibc-git/{argp-support.patch => 0003-Add-argp-implementation.patch} (84%)
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/0004-Dont-support-localised-optimizations-this-helps-to-h.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/0005-Always-use-O2-for-compiling-fork.c.patch
 rename meta/recipes-core/uclibc/uclibc-git/{0001-ldso-limited-support-for-ORIGIN-in-rpath.patch => 0006-ldso-limited-support-for-ORIGIN-in-rpath.patch} (96%)
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/0007-nptl-atfork-Hide-pthread_atfork-in-shared-versions.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/argp-headers.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/compile-arm-fork-with-O2.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/ldso-mark-_dl_exit-as-noreturn.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/remove_attribute_optimize_Os.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/uclibc_enable_log2_test.patch

diff --git a/meta/recipes-core/uclibc/uclibc-git.inc b/meta/recipes-core/uclibc/uclibc-git.inc
index 3c48940..14a577f 100644
--- a/meta/recipes-core/uclibc/uclibc-git.inc
+++ b/meta/recipes-core/uclibc/uclibc-git.inc
@@ -1,30 +1,20 @@
-SRCREV = "48a0006012679ff0eda6f256da958d73a924fb57"
+SRCREV = "ca1c74d67dd115d059a875150e10b8560a9c35a8"
 
 PV = "0.9.33+git${SRCPV}"
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/uclibc-git:"
 
 SRC_URI = "git://uclibc.org/uClibc.git;branch=master \
-	file://uClibc.machine \
-	file://uClibc.distro \
-	file://obstack.cfg \
-	file://locale.cfg \
-	file://uclibc_enable_log2_test.patch \
-	file://powerpc_copysignl.patch \
-	file://argp-support.patch \
-	file://argp-headers.patch \
-	file://remove_attribute_optimize_Os.patch \
-	file://compile-arm-fork-with-O2.patch \
-	file://0001-ldso-limited-support-for-ORIGIN-in-rpath.patch \
-	file://0001-atexit_old-Do-not-add-it-to-shared-libc.patch \
-	file://0001-nptl-arm-Move-aeabi_read_tp-to-uclibc_nonshared.a.patch \
-	file://0001-nptl-atfork-Hide-pthread_atfork-in-shared-versions.patch \
-	file://0001-librt-Use-nodefaultlibs-instead-of-nostdlib.patch \
-	file://0001-Revert-utent.c-wtent.c-move-functions-from-utxent.c.patch \
-	file://0001-Add-eventfd_read-and-eventfd_write.patch \
-	file://0002-wire-setns-syscall.patch \
-	file://0001-Define-IPTOS_CLASS_-macros-according-to-RFC-2474.patch \
-	file://0001-timex-Sync-with-glibc.patch \
-	file://ldso-mark-_dl_exit-as-noreturn.patch \
-	"
+        file://uClibc.machine \
+        file://uClibc.distro \
+        file://obstack.cfg \
+        file://locale.cfg \
+        file://0001-Disable-lrount_tes-function.patch \
+        file://0002-Add-implementation-for-copysignl-for-ppc.patch \
+        file://0003-Add-argp-implementation.patch \
+        file://0004-Dont-support-localised-optimizations-this-helps-to-h.patch \
+        file://0005-Always-use-O2-for-compiling-fork.c.patch \
+        file://0006-ldso-limited-support-for-ORIGIN-in-rpath.patch \
+        file://0007-nptl-atfork-Hide-pthread_atfork-in-shared-versions.patch \
+"
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-core/uclibc/uclibc-git/0001-Add-eventfd_read-and-eventfd_write.patch b/meta/recipes-core/uclibc/uclibc-git/0001-Add-eventfd_read-and-eventfd_write.patch
deleted file mode 100644
index dd0efc0..0000000
--- a/meta/recipes-core/uclibc/uclibc-git/0001-Add-eventfd_read-and-eventfd_write.patch
+++ /dev/null
@@ -1,120 +0,0 @@
-From e3aae24ede969e2dede1aa19c2ee520cab71ce11 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 20 Feb 2014 00:30:18 -0800
-Subject: [PATCH 1/3] Add eventfd_read() and eventfd_write()
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
----
- libc/sysdeps/linux/common/Makefile.in     |  2 ++
- libc/sysdeps/linux/common/eventfd_read.c  | 27 +++++++++++++++++++++++++++
- libc/sysdeps/linux/common/eventfd_write.c | 28 ++++++++++++++++++++++++++++
- libc/sysdeps/linux/common/sys/eventfd.h   |  4 ----
- 4 files changed, 57 insertions(+), 4 deletions(-)
- create mode 100644 libc/sysdeps/linux/common/eventfd_read.c
- create mode 100644 libc/sysdeps/linux/common/eventfd_write.c
-
-diff --git a/libc/sysdeps/linux/common/Makefile.in b/libc/sysdeps/linux/common/Makefile.in
-index dbf0b0f..45d2e21 100644
---- a/libc/sysdeps/linux/common/Makefile.in
-+++ b/libc/sysdeps/linux/common/Makefile.in
-@@ -25,6 +25,8 @@ CSRC-$(UCLIBC_LINUX_SPECIFIC) += \
- 	capset.c \
- 	dup3.c \
- 	eventfd.c \
-+	eventfd_read.c \
-+	eventfd_write.c \
- 	inotify.c \
- 	ioperm.c \
- 	iopl.c \
-diff --git a/libc/sysdeps/linux/common/eventfd_read.c b/libc/sysdeps/linux/common/eventfd_read.c
-new file mode 100644
-index 0000000..75f2aaa
---- /dev/null
-+++ b/libc/sysdeps/linux/common/eventfd_read.c
-@@ -0,0 +1,27 @@
-+/* Copyright (C) 2007-2014 Free Software Foundation, Inc.
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
-+   License along with the GNU C Library; if not, see
-+   <http://www.gnu.org/licenses/>.  */
-+
-+#include <errno.h>
-+#include <unistd.h>
-+#include <sys/eventfd.h>
-+
-+
-+int
-+eventfd_read (int fd, eventfd_t *value)
-+{
-+  return read (fd, value, sizeof (eventfd_t)) != sizeof (eventfd_t) ? -1 : 0;
-+}
-diff --git a/libc/sysdeps/linux/common/eventfd_write.c b/libc/sysdeps/linux/common/eventfd_write.c
-new file mode 100644
-index 0000000..e1509cf
---- /dev/null
-+++ b/libc/sysdeps/linux/common/eventfd_write.c
-@@ -0,0 +1,28 @@
-+/* Copyright (C) 2007-2014 Free Software Foundation, Inc.
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
-+   License along with the GNU C Library; if not, see
-+   <http://www.gnu.org/licenses/>.  */
-+
-+#include <errno.h>
-+#include <unistd.h>
-+#include <sys/eventfd.h>
-+
-+
-+int
-+eventfd_write (int fd, eventfd_t value)
-+{
-+  return write (fd, &value,
-+		sizeof (eventfd_t)) != sizeof (eventfd_t) ? -1 : 0;
-+}
-diff --git a/libc/sysdeps/linux/common/sys/eventfd.h b/libc/sysdeps/linux/common/sys/eventfd.h
-index 1bf785f..91b265b 100644
---- a/libc/sysdeps/linux/common/sys/eventfd.h
-+++ b/libc/sysdeps/linux/common/sys/eventfd.h
-@@ -33,16 +33,12 @@ __BEGIN_DECLS
-    value to COUNT.  */
- extern int eventfd (int __count, int __flags) __THROW;
- 
--#if 0 /* not (yet) implemented in uClibc */
--
- /* Read event counter and possibly wait for events.  */
- extern int eventfd_read (int __fd, eventfd_t *__value);
- 
- /* Increment event counter.  */
- extern int eventfd_write (int __fd, eventfd_t __value);
- 
--#endif
--
- __END_DECLS
- 
- #endif /* sys/eventfd.h */
--- 
-1.9.0
-
diff --git a/meta/recipes-core/uclibc/uclibc-git/0001-Define-IPTOS_CLASS_-macros-according-to-RFC-2474.patch b/meta/recipes-core/uclibc/uclibc-git/0001-Define-IPTOS_CLASS_-macros-according-to-RFC-2474.patch
deleted file mode 100644
index d613823..0000000
--- a/meta/recipes-core/uclibc/uclibc-git/0001-Define-IPTOS_CLASS_-macros-according-to-RFC-2474.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-From be8ed13a90c528adfbe3c8543946bb2c5a2ad713 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 25 Aug 2014 15:50:36 -0700
-Subject: [PATCH] Define IPTOS_CLASS_* macros according to RFC 2474
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-status: Pending
----
- include/netinet/ip.h | 42 ++++++++++++++++++++++++++++++------------
- 1 file changed, 30 insertions(+), 12 deletions(-)
-
-diff --git a/include/netinet/ip.h b/include/netinet/ip.h
-index 19e1249..3fe58b9 100644
---- a/include/netinet/ip.h
-+++ b/include/netinet/ip.h
-@@ -188,7 +188,25 @@ struct ip_timestamp
- #define	IPTOS_DSCP_EF		0xb8
- 
- /*
-- * Definitions for IP type of service (ip_tos)
-+ * In RFC 2474, Section 4.2.2.1, the Class Selector Codepoints subsume
-+ * the old ToS Precedence values.
-+ */
-+#define	IPTOS_CLASS_MASK		0xe0
-+#define	IPTOS_CLASS(class)		((class) & IPTOS_CLASS_MASK)
-+#define	IPTOS_CLASS_CS0			0x00
-+#define	IPTOS_CLASS_CS1			0x20
-+#define	IPTOS_CLASS_CS2			0x40
-+#define	IPTOS_CLASS_CS3			0x60
-+#define	IPTOS_CLASS_CS4			0x80
-+#define	IPTOS_CLASS_CS5			0xa0
-+#define	IPTOS_CLASS_CS6			0xc0
-+#define	IPTOS_CLASS_CS7			0xe0
-+
-+#define	IPTOS_CLASS_DEFAULT		IPTOS_CLASS_CS0
-+
-+/*
-+ * Definitions for IP type of service (ip_tos) [deprecated; use DSCP
-+ * and CS definitions above instead.]
-  */
- #define	IPTOS_TOS_MASK		0x1E
- #define	IPTOS_TOS(tos)		((tos) & IPTOS_TOS_MASK)
-@@ -199,18 +217,18 @@ struct ip_timestamp
- #define	IPTOS_MINCOST		IPTOS_LOWCOST
- 
- /*
-- * Definitions for IP precedence (also in ip_tos) (hopefully unused)
-+ * Definitions for IP precedence (also in ip_tos) [also deprecated.]
-  */
--#define	IPTOS_PREC_MASK			0xe0
--#define	IPTOS_PREC(tos)                ((tos) & IPTOS_PREC_MASK)
--#define	IPTOS_PREC_NETCONTROL		0xe0
--#define	IPTOS_PREC_INTERNETCONTROL	0xc0
--#define	IPTOS_PREC_CRITIC_ECP		0xa0
--#define	IPTOS_PREC_FLASHOVERRIDE	0x80
--#define	IPTOS_PREC_FLASH		0x60
--#define	IPTOS_PREC_IMMEDIATE		0x40
--#define	IPTOS_PREC_PRIORITY		0x20
--#define	IPTOS_PREC_ROUTINE		0x00
-+#define	IPTOS_PREC_MASK			IPTOS_CLASS_MASK
-+#define	IPTOS_PREC(tos)			IPTOS_CLASS(tos)
-+#define	IPTOS_PREC_NETCONTROL		IPTOS_CLASS_CS7
-+#define	IPTOS_PREC_INTERNETCONTROL	IPTOS_CLASS_CS6
-+#define	IPTOS_PREC_CRITIC_ECP		IPTOS_CLASS_CS5
-+#define	IPTOS_PREC_FLASHOVERRIDE	IPTOS_CLASS_CS4
-+#define	IPTOS_PREC_FLASH		IPTOS_CLASS_CS3
-+#define	IPTOS_PREC_IMMEDIATE		IPTOS_CLASS_CS2
-+#define	IPTOS_PREC_PRIORITY		IPTOS_CLASS_CS1
-+#define	IPTOS_PREC_ROUTINE		IPTOS_CLASS_CS0
- 
- /*
-  * Definitions for options.
--- 
-2.1.0
-
diff --git a/meta/recipes-core/uclibc/uclibc-git/0001-Disable-lrount_tes-function.patch b/meta/recipes-core/uclibc/uclibc-git/0001-Disable-lrount_tes-function.patch
new file mode 100644
index 0000000..506f146
--- /dev/null
+++ b/meta/recipes-core/uclibc/uclibc-git/0001-Disable-lrount_tes-function.patch
@@ -0,0 +1,37 @@
+From 14b865b3438d0df29b4969148678d8fa8943e1ef Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 16 Aug 2015 20:49:33 -0700
+Subject: [PATCH 1/7] Disable lrount_tes() function
+
+Its not used anyway, avoids some strict compiler warnings
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ test/math/libm-test.inc | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/test/math/libm-test.inc b/test/math/libm-test.inc
+index f50b48b..6d70a95 100644
+--- a/test/math/libm-test.inc
++++ b/test/math/libm-test.inc
+@@ -3470,7 +3470,6 @@ logb_test (void)
+ }
+ 
+ 
+-#if 0
+ static void
+ lround_test (void)
+ {
+@@ -3605,7 +3604,6 @@ llround_test (void)
+ 
+   END (llround);
+ }
+-#endif
+ 
+ static void
+ modf_test (void)
+-- 
+2.1.4
+
diff --git a/meta/recipes-core/uclibc/uclibc-git/0001-Revert-utent.c-wtent.c-move-functions-from-utxent.c.patch b/meta/recipes-core/uclibc/uclibc-git/0001-Revert-utent.c-wtent.c-move-functions-from-utxent.c.patch
deleted file mode 100644
index 4ac765c..0000000
--- a/meta/recipes-core/uclibc/uclibc-git/0001-Revert-utent.c-wtent.c-move-functions-from-utxent.c.patch
+++ /dev/null
@@ -1,319 +0,0 @@
-Upstream-Status: Pending
-
-From 096abf14d2dc978607ccd8a0d7f42da65d8991f3 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 9 Sep 2012 22:00:04 -0700
-Subject: [PATCH] Revert "utent.c, wtent.c: move functions from utxent.c"
-
-This reverts commit 84135275cfeebc0b233c1c96eeada4d4178a0b18.
----
- include/utmp.h          |    8 +++++
- libc/misc/utmp/utent.c  |   80 +++++++++++------------------------------------
- libc/misc/utmp/utxent.c |    4 +--
- libc/misc/utmp/wtent.c  |   14 ++-------
- 4 files changed, 30 insertions(+), 76 deletions(-)
-
-Index: git/include/utmp.h
-===================================================================
---- git.orig/include/utmp.h	2013-01-21 16:37:18.000000000 -0800
-+++ git/include/utmp.h	2013-01-21 16:40:56.987583099 -0800
-@@ -56,30 +56,37 @@
- /* Append entry UTMP to the wtmp-like file WTMP_FILE.  */
- extern void updwtmp (const char *__wtmp_file, const struct utmp *__utmp)
-      __THROW;
-+libc_hidden_proto(updwtmp)
- 
- /* Change name of the utmp file to be examined.  */
- extern int utmpname (const char *__file) __THROW;
-+libc_hidden_proto(utmpname)
- 
- /* Read next entry from a utmp-like file.  */
- extern struct utmp *getutent (void) __THROW;
-+libc_hidden_proto(getutent)
- 
- /* Reset the input stream to the beginning of the file.  */
- extern void setutent (void) __THROW;
-+libc_hidden_proto(setutent)
- 
- /* Close the current open file.  */
- extern void endutent (void) __THROW;
-+libc_hidden_proto(endutent)
- 
- /* Search forward from the current point in the utmp file until the
-    next entry with a ut_type matching ID->ut_type.  */
- extern struct utmp *getutid (const struct utmp *__id) __THROW;
-+libc_hidden_proto(getutid)
- 
- /* Search forward from the current point in the utmp file until the
-    next entry with a ut_line matching LINE->ut_line.  */
- extern struct utmp *getutline (const struct utmp *__line) __THROW;
-+libc_hidden_proto(getutline)
- 
- /* Write out entry pointed to by UTMP_PTR into the utmp file.  */
- extern struct utmp *pututline (const struct utmp *__utmp_ptr) __THROW;
--
-+libc_hidden_proto(pututline)
- 
- #if 0 /* def	__USE_MISC */
- /* Reentrant versions of the file for handling utmp files.  */
-Index: git/libc/misc/utmp/utent.c
-===================================================================
---- git.orig/libc/misc/utmp/utent.c	2013-01-21 16:37:18.000000000 -0800
-+++ git/libc/misc/utmp/utent.c	2013-01-21 16:38:14.035578638 -0800
-@@ -19,9 +19,6 @@
- #include <errno.h>
- #include <string.h>
- #include <utmp.h>
--#ifdef __UCLIBC_HAS_UTMPX__
--# include <utmpx.h>
--#endif
- #include <not-cancel.h>
- 
- #include <bits/uClibc_mutex.h>
-@@ -34,7 +31,7 @@
- static const char *static_ut_name = default_file_name;
- 
- /* This function must be called with the LOCK held */
--static void __setutent_unlocked(void)
-+static void __setutent(void)
- {
-     if (static_fd < 0) {
- 	static_fd = open_not_cancel_2(static_ut_name, O_RDWR | O_CLOEXEC);
-@@ -53,24 +50,19 @@
-     lseek(static_fd, 0, SEEK_SET);
- }
- #if defined __UCLIBC_HAS_THREADS__
--static void __setutent(void)
-+void setutent(void)
- {
-     __UCLIBC_MUTEX_LOCK(utmplock);
--    __setutent_unlocked();
-+    __setutent();
-     __UCLIBC_MUTEX_UNLOCK(utmplock);
- }
- #else
--static void __setutent(void);
--strong_alias(__setutent_unlocked,__setutent)
--#endif
- strong_alias(__setutent,setutent)
--
--#ifdef __UCLIBC_HAS_UTMPX__
--strong_alias(__setutent,setutxent)
- #endif
-+libc_hidden_def(setutent)
- 
- /* This function must be called with the LOCK held */
--static struct utmp *__getutent_unlocked(void)
-+static struct utmp *__getutent(void)
- {
-     if (static_fd < 0) {
- 	__setutent();
-@@ -86,27 +78,19 @@
-     return NULL;
- }
- #if defined __UCLIBC_HAS_THREADS__
--static struct utmp *__getutent(void)
-+struct utmp *getutent(void)
- {
-     struct utmp *ret;
- 
-     __UCLIBC_MUTEX_LOCK(utmplock);
--    ret = __getutent_unlocked();
-+    ret = __getutent();
-     __UCLIBC_MUTEX_UNLOCK(utmplock);
-     return ret;
- }
- #else
--static struct utmp *__getutent(void);
--strong_alias(__getutent_unlocked,__getutent)
--#endif
- strong_alias(__getutent,getutent)
--
--#ifdef __UCLIBC_HAS_UTMPX__
--struct utmpx *getutxent(void)
--{
--	return (struct utmpx *) __getutent ();
--}
- #endif
-+libc_hidden_def(getutent)
- 
- static void __endutent(void)
- {
-@@ -117,13 +101,10 @@
-     __UCLIBC_MUTEX_UNLOCK(utmplock);
- }
- strong_alias(__endutent,endutent)
--
--#ifdef __UCLIBC_HAS_UTMPX__
--strong_alias(__endutent,endutxent)
--#endif
-+libc_hidden_def(endutent)
- 
- /* This function must be called with the LOCK held */
--static struct utmp *__getutid_unlocked(const struct utmp *utmp_entry)
-+static struct utmp *__getutid(const struct utmp *utmp_entry)
- {
-     struct utmp *lutmp;
-     unsigned type;
-@@ -133,7 +114,7 @@
-     type = utmp_entry->ut_type - 1;
-     type /= 4;
- 
--    while ((lutmp = __getutent_unlocked()) != NULL) {
-+    while ((lutmp = __getutent()) != NULL) {
- 	if (type == 0 && lutmp->ut_type == utmp_entry->ut_type)	{
- 	    /* one of RUN_LVL, BOOT_TIME, NEW_TIME, OLD_TIME */
- 	    return lutmp;
-@@ -147,34 +128,26 @@
-     return NULL;
- }
- #if defined __UCLIBC_HAS_THREADS__
--static struct utmp *__getutid(const struct utmp *utmp_entry)
-+struct utmp *getutid(const struct utmp *utmp_entry)
- {
-     struct utmp *ret;
- 
-     __UCLIBC_MUTEX_LOCK(utmplock);
--    ret = __getutid_unlocked(utmp_entry);
-+    ret = __getutid(utmp_entry);
-     __UCLIBC_MUTEX_UNLOCK(utmplock);
-     return ret;
- }
- #else
--static struct utmp *__getutid(const struct utmp *utmp_entry);
--strong_alias(__getutid_unlocked,__getutid)
--#endif
- strong_alias(__getutid,getutid)
--
--#ifdef __UCLIBC_HAS_UTMPX__
--struct utmpx *getutxid(const struct utmpx *utmp_entry)
--{
--	return (struct utmpx *) __getutid ((const struct utmp *) utmp_entry);
--}
- #endif
-+libc_hidden_def(getutid)
- 
- static struct utmp *__getutline(const struct utmp *utmp_entry)
- {
-     struct utmp *lutmp;
- 
-     __UCLIBC_MUTEX_LOCK(utmplock);
--    while ((lutmp = __getutent_unlocked()) != NULL) {
-+    while ((lutmp = __getutent()) != NULL) {
- 	if (lutmp->ut_type == USER_PROCESS || lutmp->ut_type == LOGIN_PROCESS) {
- 	    if (strncmp(lutmp->ut_line, utmp_entry->ut_line, sizeof(lutmp->ut_line)) == 0) {
- 		break;
-@@ -185,13 +158,7 @@
-     return lutmp;
- }
- strong_alias(__getutline,getutline)
--
--#ifdef __UCLIBC_HAS_UTMPX__
--struct utmpx *getutxline(const struct utmpx *utmp_entry)
--{
--	return (struct utmpx *) __getutline ((const struct utmp *) utmp_entry);
--}
--#endif
-+libc_hidden_def(getutline)
- 
- static struct utmp *__pututline(const struct utmp *utmp_entry)
- {
-@@ -200,7 +167,7 @@
-        the file pointer where they want it, everything will work out. */
-     lseek(static_fd, (off_t) - sizeof(struct utmp), SEEK_CUR);
- 
--    if (__getutid_unlocked(utmp_entry) != NULL)
-+    if (__getutid(utmp_entry) != NULL)
- 	lseek(static_fd, (off_t) - sizeof(struct utmp), SEEK_CUR);
-     else
- 	lseek(static_fd, (off_t) 0, SEEK_END);
-@@ -211,13 +178,7 @@
-     return (struct utmp *)utmp_entry;
- }
- strong_alias(__pututline,pututline)
--
--#ifdef __UCLIBC_HAS_UTMPX__
--struct utmpx *pututxline (const struct utmpx *utmp_entry)
--{
--	return (struct utmpx *) __pututline ((const struct utmp *) utmp_entry);
--}
--#endif
-+libc_hidden_def(pututline)
- 
- static int __utmpname(const char *new_ut_name)
- {
-@@ -241,7 +202,4 @@
-     return 0; /* or maybe return -(static_ut_name != new_ut_name)? */
- }
- strong_alias(__utmpname,utmpname)
--
--#ifdef __UCLIBC_HAS_UTMPX__
--strong_alias(__utmpname,utmpxname)
--#endif
-+libc_hidden_def(utmpname)
-Index: git/libc/misc/utmp/utxent.c
-===================================================================
---- git.orig/libc/misc/utmp/utxent.c	2013-01-21 16:37:18.000000000 -0800
-+++ git/libc/misc/utmp/utxent.c	2013-01-21 16:38:14.035578638 -0800
-@@ -13,7 +13,6 @@
- #include <utmpx.h>
- #include <utmp.h>
- 
--#if 0 /* moved to utent.c */
- void setutxent(void)
- {
- 	setutent ();
-@@ -49,12 +48,10 @@
- 	return utmpname (new_ut_name);
- }
- 
--/* moved to wtent.c */
- void updwtmpx (const char *wtmpx_file, const struct utmpx *utmpx)
- {
- 	updwtmp (wtmpx_file, (const struct utmp *) utmpx);
- }
--#endif
- 
- /* Copy the information in UTMPX to UTMP. */
- void getutmp (const struct utmpx *utmpx, struct utmp *utmp)
-@@ -107,3 +104,4 @@
- 	utmpx->ut_time = utmp->ut_time;
- #endif
- }
-+
-Index: git/libc/misc/utmp/wtent.c
-===================================================================
---- git.orig/libc/misc/utmp/wtent.c	2013-01-21 16:37:18.000000000 -0800
-+++ git/libc/misc/utmp/wtent.c	2013-01-21 16:38:14.035578638 -0800
-@@ -11,9 +11,6 @@
- #include <time.h>
- #include <unistd.h>
- #include <utmp.h>
--#ifdef __UCLIBC_HAS_UTMPX__
--# include <utmpx.h>
--#endif
- #include <fcntl.h>
- #include <sys/file.h>
- #include <not-cancel.h>
-@@ -36,7 +33,7 @@
- }
- #endif
- 
--static void __updwtmp(const char *wtmp_file, const struct utmp *lutmp)
-+void updwtmp(const char *wtmp_file, const struct utmp *lutmp)
- {
-     int fd;
- 
-@@ -49,11 +46,4 @@
- 	}
-     }
- }
--strong_alias(__updwtmp,updwtmp)
--
--#ifdef __UCLIBC_HAS_UTMPX__
--void updwtmpx (const char *wtmpx_file, const struct utmpx *utmpx)
--{
--	__updwtmp (wtmpx_file, (const struct utmp *) utmpx);
--}
--#endif
-+libc_hidden_def(updwtmp)
diff --git a/meta/recipes-core/uclibc/uclibc-git/0001-atexit_old-Do-not-add-it-to-shared-libc.patch b/meta/recipes-core/uclibc/uclibc-git/0001-atexit_old-Do-not-add-it-to-shared-libc.patch
deleted file mode 100644
index b6dfce4..0000000
--- a/meta/recipes-core/uclibc/uclibc-git/0001-atexit_old-Do-not-add-it-to-shared-libc.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 74667582526b39a1906228574d73a6528f4587eb Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 23 Jun 2012 13:26:30 -0700
-Subject: [PATCH] atexit_old: Do not add it to shared libc
-
-atexit should only be in either uclibc_nonshared.a
-shared libc case or libc.a in static build case
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
----
- libc/stdlib/Makefile.in |    4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/libc/stdlib/Makefile.in b/libc/stdlib/Makefile.in
-index 3166b8e..3d686d9 100644
---- a/libc/stdlib/Makefile.in
-+++ b/libc/stdlib/Makefile.in
-@@ -60,7 +60,6 @@ CSRC-$(if $(findstring yyy,$(UCLIBC_HAS_FLOATS)$(UCLIBC_HAS_WCHAR)$(UCLIBC_HAS_X
- 
- # multi source _atexit.c
- CSRC-y += __cxa_atexit.c __cxa_finalize.c __exit_handler.c exit.c on_exit.c
--CSRC-$(COMPAT_ATEXIT) += old_atexit.c
- 
- STDLIB_DIR := $(top_srcdir)libc/stdlib
- STDLIB_OUT := $(top_builddir)libc/stdlib
-@@ -70,11 +69,12 @@ STDLIB_OBJ := $(patsubst %.c,$(STDLIB_OUT)/%.o,$(CSRC-y))
- 
- libc-y += $(STDLIB_OBJ)
- libc-static-y += $(STDLIB_OUT)/atexit.o $(STDLIB_OUT)/system.o
-+libc-static-$(COMPAT_ATEXIT) += $(STDLIB_OUT)/old_atexit.o
- libc-shared-y += $(STDLIB_OUT)/system.oS
- 
- # this should always be the PIC version, because it could be used in shared libs
- libc-nonshared-y += $(STDLIB_OUT)/atexit.os
--
-+libc-nonshared-$(COMPAT_ATEXIT) += $(STDLIB_OUT)/old_atexit.os
- libc-nomulti-y += $(STDLIB_OUT)/labs.o $(STDLIB_OUT)/atol.o $(STDLIB_OUT)/_stdlib_strto_l.o $(STDLIB_OUT)/_stdlib_strto_ll.o
- libc-nomulti-$(UCLIBC_HAS_XLOCALE) += $(STDLIB_OUT)/_stdlib_strto_l_l.o $(STDLIB_OUT)/_stdlib_strto_ll_l.o
- 
--- 
-1.7.9.5
-
diff --git a/meta/recipes-core/uclibc/uclibc-git/0001-librt-Use-nodefaultlibs-instead-of-nostdlib.patch b/meta/recipes-core/uclibc/uclibc-git/0001-librt-Use-nodefaultlibs-instead-of-nostdlib.patch
deleted file mode 100644
index ecb9d31..0000000
--- a/meta/recipes-core/uclibc/uclibc-git/0001-librt-Use-nodefaultlibs-instead-of-nostdlib.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 95f9b6f37152b8316735d3c86c0db963ff59e22d Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 23 Jun 2012 16:51:52 -0700
-Subject: [PATCH] librt: Use -nodefaultlibs instead of -nostdlib
-
-nostdlib disables linking in startup files too which is not
-what we want here since it needs to resolve __dso_handle
-which comes from crtbeginS.o, otherwise librt has this
-undefined reference to a weak undefined __dso_handle that
-shows up as error (with gold linker)
-when shared libraries are being built which are
-linking in librt
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
----
- librt/Makefile.in |    1 +
- 1 file changed, 1 insertion(+)
-
-Index: git/librt/Makefile.in
-===================================================================
---- git.orig/librt/Makefile.in	2012-06-24 10:32:59.512653237 -0700
-+++ git/librt/Makefile.in	2012-06-24 11:31:00.660821666 -0700
-@@ -15,6 +15,9 @@
- ifeq ($(UCLIBC_HAS_THREADS_NATIVE),y)
- LIBS-librt.so += $(top_builddir)lib/libdl.so $(top_builddir)lib/libpthread.so
- endif
-+START_FILE-librt.so := $(SHARED_START_FILES)
-+END_FILE-librt.so := $(SHARED_END_FILES)
-+
- 
- librt_FULL_NAME := librt-$(VERSION).so
- 
diff --git a/meta/recipes-core/uclibc/uclibc-git/0001-nptl-arm-Move-aeabi_read_tp-to-uclibc_nonshared.a.patch b/meta/recipes-core/uclibc/uclibc-git/0001-nptl-arm-Move-aeabi_read_tp-to-uclibc_nonshared.a.patch
deleted file mode 100644
index 7e7c579..0000000
--- a/meta/recipes-core/uclibc/uclibc-git/0001-nptl-arm-Move-aeabi_read_tp-to-uclibc_nonshared.a.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 714f543f4fa8fb3911449b6ce1517481359e0cff Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 23 Jun 2012 14:21:17 -0700
-Subject: [PATCH] nptl/arm: Move aeabi_read_tp to uclibc_nonshared.a
-
-Otherwise it creates wrong references from shared libs
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
----
- libc/sysdeps/linux/arm/Makefile.arch |    4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-Index: git/libc/sysdeps/linux/arm/Makefile.arch
-===================================================================
---- git.orig/libc/sysdeps/linux/arm/Makefile.arch	2013-05-23 11:13:32.000000000 -0700
-+++ git/libc/sysdeps/linux/arm/Makefile.arch	2013-05-23 11:16:18.304333131 -0700
-@@ -13,7 +13,9 @@
- 	vfork.S clone.S
- 
- SSRC-$(UCLIBC_HAS_LFS) += mmap64.S
--SSRC-$(UCLIBC_HAS_THREADS_NATIVE) += libc-aeabi_read_tp.S libc-thumb_atomics.S
-+SSRC-$(UCLIBC_HAS_THREADS_NATIVE) += libc-thumb_atomics.S
-+libc-nonshared-$(UCLIBC_HAS_THREADS_NATIVE) += $(ARCH_OUT)/libc-aeabi_read_tp.os
-+libc-static-$(UCLIBC_HAS_THREADS_NATIVE) += $(ARCH_OUT)/libc-aeabi_read_tp.o
- CSRC-$(UCLIBC_HAS_CONTEXT_FUNCS) += makecontext.c
- SSRC-$(UCLIBC_HAS_CONTEXT_FUNCS) += getcontext.S setcontext.S swapcontext.S
- 
diff --git a/meta/recipes-core/uclibc/uclibc-git/0001-nptl-atfork-Hide-pthread_atfork-in-shared-versions.patch b/meta/recipes-core/uclibc/uclibc-git/0001-nptl-atfork-Hide-pthread_atfork-in-shared-versions.patch
deleted file mode 100644
index 297a40b..0000000
--- a/meta/recipes-core/uclibc/uclibc-git/0001-nptl-atfork-Hide-pthread_atfork-in-shared-versions.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-From d021e6252b33e779857846714fb1899a25c9965d Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 23 Jun 2012 15:59:01 -0700
-Subject: [PATCH] nptl/atfork: Hide pthread_atfork in shared versions
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
----
- libpthread/nptl/Makefile.in      |    4 +++-
- libpthread/nptl/pthread_atfork.c |   12 ++++++++++--
- 2 files changed, 13 insertions(+), 3 deletions(-)
-
-diff --git a/libpthread/nptl/Makefile.in b/libpthread/nptl/Makefile.in
-index 158bcae..3ef7175 100644
---- a/libpthread/nptl/Makefile.in
-+++ b/libpthread/nptl/Makefile.in
-@@ -16,6 +16,7 @@ libc-shared-routines-y = forward.c libc-cancellation.c
- libc-static-routines-y = alloca_cutoff.c libc-cancellation.c
- libpthread-shared-only-routines-y = version.c
- libpthread-static-only-routines-y = pthread_atfork.c
-+
- libpthread-routines- += $(notdir $(wildcard $(libpthread_DIR)/gen_*.c)) # dummy generated files
- libpthread-routines- += allocatestack.c # dummy included by pthread_create.c
- libpthread-routines- += pthread_mutex_getprioceiling.c pthread_mutex_setprioceiling.c # XXX: delete those or use them!
-@@ -208,7 +209,7 @@ CFLAGS-msgsnd.c = -fexceptions -fasynchronous-unwind-tables
- CFLAGS-tcdrain.c = -fexceptions -fasynchronous-unwind-tables
- 
- CFLAGS-pt-system.c = -fexceptions -I$(top_srcdir)libc/stdlib
--
-+CFLAGS-pthread_atfork.c = -DNOT_IN_libc
- #
- # The rest of this file is uClibc specific.
- #
-@@ -224,3 +225,4 @@ CFLAGS-OMIT-alloca_cutoff.c = $(CFLAGS-nptl)
- CFLAGS-OMIT-forward.c = $(CFLAGS-nptl)
- CFLAGS-OMIT-libc-lowlevelock.c = $(CFLAGS-nptl)
- CFLAGS-OMIT-libc-cancellation.c = $(CFLAGS-nptl)
-+
-diff --git a/libpthread/nptl/pthread_atfork.c b/libpthread/nptl/pthread_atfork.c
-index e607d49..6224c17 100644
---- a/libpthread/nptl/pthread_atfork.c
-+++ b/libpthread/nptl/pthread_atfork.c
-@@ -38,13 +38,17 @@
- #include <fork.h>
- 
- /* This is defined by newer gcc version unique for each module.  */
--extern void *__dso_handle __attribute__ ((__weak__));
--					  //,__visibility__ ("hidden")));
-+extern void *__dso_handle __attribute__ ((__weak__,
-+					  __visibility__ ("hidden")));
- 
- 
- /* Hide the symbol so that no definition but the one locally in the
-    executable or DSO is used.  */
- int
-+#ifndef __pthread_atfork
-+/* Don't mark the compatibility function as hidden.  */
-+attribute_hidden
-+#endif
- __pthread_atfork (
-      void (*prepare) (void),
-      void (*parent) (void),
-@@ -53,4 +57,8 @@ __pthread_atfork (
-   return __register_atfork (prepare, parent, child,
- 			    &__dso_handle == NULL ? NULL : __dso_handle);
- }
-+#ifndef __pthread_atfork
-+extern int pthread_atfork (void (*prepare) (void), void (*parent) (void),
-+	                           void (*child) (void)) attribute_hidden;
- strong_alias (__pthread_atfork, pthread_atfork)
-+#endif
--- 
-1.7.9.5
-
diff --git a/meta/recipes-core/uclibc/uclibc-git/0001-timex-Sync-with-glibc.patch b/meta/recipes-core/uclibc/uclibc-git/0001-timex-Sync-with-glibc.patch
deleted file mode 100644
index 5d6a0a5..0000000
--- a/meta/recipes-core/uclibc/uclibc-git/0001-timex-Sync-with-glibc.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From f489cc44a209f6c4370e94c9c788fc9cc4820be1 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 25 Aug 2014 16:22:57 -0700
-Subject: [PATCH] timex: Sync with glibc
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-status: Pending
----
- include/sys/timex.h | 8 ++++++--
- 1 file changed, 6 insertions(+), 2 deletions(-)
-
-diff --git a/include/sys/timex.h b/include/sys/timex.h
-index 9082a28..57059bd 100644
---- a/include/sys/timex.h
-+++ b/include/sys/timex.h
-@@ -67,8 +67,12 @@ struct timex
- #define ADJ_ESTERROR		0x0008	/* estimated time error */
- #define ADJ_STATUS		0x0010	/* clock status */
- #define ADJ_TIMECONST		0x0020	/* pll time constant */
--#define ADJ_TICK		0x4000	/* tick value */
--#define ADJ_OFFSET_SINGLESHOT	0x8001	/* old-fashioned adjtime */
-+#define ADJ_TAI			0x0080  /* set TAI offset */
-+#define ADJ_MICRO		0x1000  /* select microsecond resolution */
-+#define ADJ_NANO		0x2000  /* select nanosecond resolution */
-+#define ADJ_TICK		0x4000  /* tick value */
-+#define ADJ_OFFSET_SINGLESHOT	0x8001  /* old-fashioned adjtime */
-+#define ADJ_OFFSET_SS_READ	0xa001  /* read-only adjtime */
- 
- /* xntp 3.4 compatibility names */
- #define MOD_OFFSET	ADJ_OFFSET
--- 
-2.1.0
-
diff --git a/meta/recipes-core/uclibc/uclibc-git/powerpc_copysignl.patch b/meta/recipes-core/uclibc/uclibc-git/0002-Add-implementation-for-copysignl-for-ppc.patch
similarity index 73%
rename from meta/recipes-core/uclibc/uclibc-git/powerpc_copysignl.patch
rename to meta/recipes-core/uclibc/uclibc-git/0002-Add-implementation-for-copysignl-for-ppc.patch
index 2f014cd..d4275c9 100644
--- a/meta/recipes-core/uclibc/uclibc-git/powerpc_copysignl.patch
+++ b/meta/recipes-core/uclibc/uclibc-git/0002-Add-implementation-for-copysignl-for-ppc.patch
@@ -1,13 +1,21 @@
-Add ppc copysignl implementation
+From 5d362074e5975b150a35bcfa77eab1bfa4e30de7 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 16 Aug 2015 20:50:56 -0700
+Subject: [PATCH 2/7] Add implementation for copysignl for ppc
 
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
 Upstream-Status: Pending
 
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
+ libc/sysdeps/linux/powerpc/Makefile.arch |  2 +-
+ libc/sysdeps/linux/powerpc/copysignl.c   | 89 ++++++++++++++++++++++++++++++++
+ 2 files changed, 90 insertions(+), 1 deletion(-)
+ create mode 100644 libc/sysdeps/linux/powerpc/copysignl.c
 
-Index: git/libc/sysdeps/linux/powerpc/Makefile.arch
-===================================================================
---- git.orig/libc/sysdeps/linux/powerpc/Makefile.arch	2013-05-23 11:09:50.000000000 -0700
-+++ git/libc/sysdeps/linux/powerpc/Makefile.arch	2013-05-23 11:12:06.072328399 -0700
+diff --git a/libc/sysdeps/linux/powerpc/Makefile.arch b/libc/sysdeps/linux/powerpc/Makefile.arch
+index 4fbcb11..7c09c87 100644
+--- a/libc/sysdeps/linux/powerpc/Makefile.arch
++++ b/libc/sysdeps/linux/powerpc/Makefile.arch
 @@ -5,7 +5,7 @@
  # Licensed under the LGPL v2.1, see the file COPYING.LIB in this tarball.
  #
@@ -17,10 +25,11 @@ Index: git/libc/sysdeps/linux/powerpc/Makefile.arch
  
  SSRC-y := \
  	__longjmp.S setjmp.S bsd-setjmp.S bsd-_setjmp.S brk.S \
-Index: git/libc/sysdeps/linux/powerpc/copysignl.c
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ git/libc/sysdeps/linux/powerpc/copysignl.c	2013-05-23 11:11:37.600327865 -0700
+diff --git a/libc/sysdeps/linux/powerpc/copysignl.c b/libc/sysdeps/linux/powerpc/copysignl.c
+new file mode 100644
+index 0000000..000f653
+--- /dev/null
++++ b/libc/sysdeps/linux/powerpc/copysignl.c
 @@ -0,0 +1,89 @@
 +/* s_copysignl.c -- long double version of s_copysign.c.
 + * Conversion to long double by Ulrich Drepper,
@@ -111,3 +120,6 @@ Index: git/libc/sysdeps/linux/powerpc/copysignl.c
 +}
 +
 +libc_hidden_def(copysignl);
+-- 
+2.1.4
+
diff --git a/meta/recipes-core/uclibc/uclibc-git/0002-wire-setns-syscall.patch b/meta/recipes-core/uclibc/uclibc-git/0002-wire-setns-syscall.patch
deleted file mode 100644
index 94c6f68..0000000
--- a/meta/recipes-core/uclibc/uclibc-git/0002-wire-setns-syscall.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From db575359d4b8164ad6c2ac5f36c7a50c065a2864 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 20 Feb 2014 00:44:34 -0800
-Subject: [PATCH 2/3] wire setns syscall
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
----
- libc/sysdeps/linux/common/Makefile.in  |  1 +
- libc/sysdeps/linux/common/bits/sched.h |  4 ++++
- libc/sysdeps/linux/common/setns.c      | 18 ++++++++++++++++++
- 3 files changed, 23 insertions(+)
- create mode 100644 libc/sysdeps/linux/common/setns.c
-
-diff --git a/libc/sysdeps/linux/common/Makefile.in b/libc/sysdeps/linux/common/Makefile.in
-index 45d2e21..10d9884 100644
---- a/libc/sysdeps/linux/common/Makefile.in
-+++ b/libc/sysdeps/linux/common/Makefile.in
-@@ -45,6 +45,7 @@ CSRC-$(UCLIBC_LINUX_SPECIFIC) += \
- 	sendfile.c \
- 	setfsgid.c \
- 	setfsuid.c \
-+	setns.c \
- 	setresgid.c \
- 	setresuid.c \
- 	signalfd.c \
-diff --git a/libc/sysdeps/linux/common/bits/sched.h b/libc/sysdeps/linux/common/bits/sched.h
-index a5eb6ee..9436f66 100644
---- a/libc/sysdeps/linux/common/bits/sched.h
-+++ b/libc/sysdeps/linux/common/bits/sched.h
-@@ -85,6 +85,10 @@ extern int unshare (int __flags) __THROW;
- 
- /* Get index of currently used CPU.  */
- extern int sched_getcpu (void) __THROW;
-+
-+/* Switch process to namespace of type NSTYPE indicated by FD.  */
-+extern int setns (int __fd, int __nstype) __THROW;
-+
- #endif
- 
- __END_DECLS
-diff --git a/libc/sysdeps/linux/common/setns.c b/libc/sysdeps/linux/common/setns.c
-new file mode 100644
-index 0000000..376bf26
---- /dev/null
-+++ b/libc/sysdeps/linux/common/setns.c
-@@ -0,0 +1,18 @@
-+/* vi: set sw=4 ts=4: */
-+/*
-+ * setns() for uClibc
-+ *
-+ * Copyright (C) 2014 Khem Raj <raj.khem@gmail.com>
-+ *
-+ * Licensed under the LGPL v2.1, see the file COPYING.LIB in this tarball.
-+ */
-+
-+#include <sys/syscall.h>
-+#include <sched.h>
-+
-+/*
-+ * setns()
-+ */
-+#ifdef __NR_setns
-+_syscall2(int, setns, int, fd, int, nstype)
-+#endif
--- 
-1.9.0
-
diff --git a/meta/recipes-core/uclibc/uclibc-git/argp-support.patch b/meta/recipes-core/uclibc/uclibc-git/0003-Add-argp-implementation.patch
similarity index 84%
rename from meta/recipes-core/uclibc/uclibc-git/argp-support.patch
rename to meta/recipes-core/uclibc/uclibc-git/0003-Add-argp-implementation.patch
index bcec6a5..ee94483 100644
--- a/meta/recipes-core/uclibc/uclibc-git/argp-support.patch
+++ b/meta/recipes-core/uclibc/uclibc-git/0003-Add-argp-implementation.patch
@@ -1,31 +1,37 @@
-From: Salvatore Cro <salvatore.cro at st.com>
+From eaae816fb22929469aa4cc3402b91b512fc69549 Mon Sep 17 00:00:00 2001
+From: Salvatore Cro <salvatore.cro@st.com>
+Date: Sun, 16 Aug 2015 20:53:37 -0700
+Subject: [PATCH 3/7] Add argp implementation
 
 Argp is an advanced support for parsing unix-style argument vectors.
-In addition to the common getopt interface, it provides automatic response
-to `--help' and `--version' options and use of custom parser in conjunction
+In addition to the common getopt interface, it provides automatic
+response
+to `--help' and `--version' options and use of custom parser in
+conjunction
 with argp native option parser, among others.
 Argp support is required by elfutils package and prelink.
 
-In uClibc argp functionalities has been moved from C library to libuargp.so
+In uClibc argp functionalities has been moved from C library to
+libuargp.so
 Further the libc.so linker script contains an AS_NEEDED entry so that
 it doesn't need to link libuargp.so explicitely.
 
-Signed-off-by: Salvatore Cro <salvatore.cro at st.com>
-Signed-off-by: Filippo Arcidiacono <filippo.arcidiacono at st.com>
-Signed-off-by: Carmelo Amoroso <carmelo.amoroso at st.com>
-
+Signed-off-by: Salvatore Cro <salvatore.cro@st.com>
+Signed-off-by: Filippo Arcidiacono <filippo.arcidiacono@st.com>
+Signed-off-by: Carmelo Amoroso <carmelo.amoroso@st.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
 Upstream-Status: Pending
 
----
- Makefile.in                                 |    8 +
- Makerules                                   |    8 +-
- Rules.mak                                   |    7 +
+ Makefile.in                                 |    9 +
+ Makerules                                   |    7 +-
+ Rules.mak                                   |   13 +
  extra/Configs/Config.in                     |   17 +
+ include/argp.h                              |  566 ++++++++
  libc/sysdeps/linux/common/bits/getopt_int.h |  136 ++
- libc/unistd/getopt.c                        |   18 +-
- libc/unistd/getopt_int.h                    |  134 --
+ libc/unistd/getopt.c                        |   19 +-
  libuargp/Makefile                           |   14 +
- libuargp/Makefile.in                        |   76 ++
+ libuargp/Makefile.in                        |   73 ++
  libuargp/argp-ba.c                          |   26 +
  libuargp/argp-eexst.c                       |   32 +
  libuargp/argp-fmtstream.c                   |  439 +++++++
@@ -46,9 +52,9 @@ Upstream-Status: Pending
  test/argp/bug-argp1.c                       |   26 +
  test/argp/tst-argp1.c                       |  118 ++
  test/argp/tst-argp2.c                       |  101 ++
- 29 files changed, 4911 insertions(+), 138 deletions(-)
+ 29 files changed, 5481 insertions(+), 4 deletions(-)
+ create mode 100644 include/argp.h
  create mode 100644 libc/sysdeps/linux/common/bits/getopt_int.h
- delete mode 100644 libc/unistd/getopt_int.h
  create mode 100644 libuargp/Makefile
  create mode 100644 libuargp/Makefile.in
  create mode 100644 libuargp/argp-ba.c
@@ -72,19 +78,19 @@ Upstream-Status: Pending
  create mode 100644 test/argp/tst-argp1.c
  create mode 100644 test/argp/tst-argp2.c
 
-Index: git/Makefile.in
-===================================================================
---- git.orig/Makefile.in	2012-06-18 13:10:12.000000000 -0700
-+++ git/Makefile.in	2012-06-18 13:12:06.448829343 -0700
-@@ -48,6 +48,7 @@
+diff --git a/Makefile.in b/Makefile.in
+index 04671a4..a450af9 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -39,6 +39,7 @@ include $(top_srcdir)libresolv/Makefile.in
  include $(top_srcdir)libutil/Makefile.in
  include $(top_srcdir)libpthread/Makefile.in
  include $(top_srcdir)librt/Makefile.in
 +include $(top_srcdir)libuargp/Makefile.in
  include $(top_srcdir)libubacktrace/Makefile.in
- include $(top_srcdir)extra/locale/Makefile.in
  
-@@ -250,6 +251,7 @@
+ # last included to catch all the objects added by others (locales/threads)
+@@ -262,6 +263,7 @@ HEADERS_RM- += sgtty.h
  endif
  HEADERS_RM-$(HAVE_SHARED)                    += dlfcn.h bits/dlfcn.h
  HEADERS_RM-$(PTHREADS_DEBUG_SUPPORT)         += thread_db.h
@@ -92,24 +98,33 @@ Index: git/Makefile.in
  HEADERS_RM-$(UCLIBC_HAS_BSD_ERR)             += err.h
  HEADERS_RM-$(UCLIBC_HAS_CRYPT)               += crypt.h
  HEADERS_RM-$(UCLIBC_HAS_EPOLL)               += sys/epoll.h
-@@ -368,6 +370,12 @@
+@@ -386,6 +388,13 @@ else
  	-$(INSTALL) -m 755 $(top_builddir)lib/libc.so $(PREFIX)$(DEVEL_PREFIX)$(MULTILIB_DIR)/
  endif
  	echo "$(UBACKTRACE_ASNEEDED)" >> $(PREFIX)$(DEVEL_PREFIX)$(MULTILIB_DIR)/libc.so
 +ifeq ($(UCLIBC_HAS_ARGP),y)
 +# Add the AS_NEEDED entry for libuargp.so
-+	if [ -f $(top_builddir)lib/libc.so -a -f $(PREFIX)$(RUNTIME_PREFIX)lib/$(SHARED_MAJORNAME) ] ; then \
-+		echo "GROUP ( $(UARGP_ASNEEDED) )" >> $(PREFIX)$(DEVEL_PREFIX)lib/libc.so; \
++	if [ -f $(top_builddir)lib/libc.so -a -f $(PREFIX)$(RUNTIME_PREFIX)$(MULTILIB_DIR)/$(SHARED_MAJORNAME) ] ; then \
++		echo "GROUP ( $(UARGP_ASNEEDED) )" >> $(PREFIX)$(DEVEL_PREFIX)$(MULTILIB_DIR)/libc.so; \
 +	fi
 +endif
++
  ifeq ($(UCLIBC_HAS_THREADS),y)
  ifneq ($(LINUXTHREADS_OLD),y)
  ifeq ($(HARDWIRED_ABSPATH),y)
-Index: git/Makerules
-===================================================================
---- git.orig/Makerules	2012-06-18 13:10:12.000000000 -0700
-+++ git/Makerules	2012-06-18 13:10:44.052825547 -0700
-@@ -32,12 +32,12 @@
+diff --git a/Makerules b/Makerules
+index d6f7e24..e70050d 100644
+--- a/Makerules
++++ b/Makerules
+@@ -48,6 +48,7 @@ $(eval $(call add_IS_IN_lib,libresolv,$(libresolv-a-y) $(libresolv-so-y)))
+ $(eval $(call add_IS_IN_lib,librt,$(librt-a-y) $(librt-so-y)))
+ $(eval $(call add_IS_IN_lib,libutil,$(libutil-a-y) $(libutil-so-y)))
+ $(eval $(call add_IS_IN_lib,libubacktrace,$(libubacktrace-a-y) $(libubacktrace-so-y)))
++$(eval $(call add_IS_IN_lib,libuargp,$(libuargp-a-y) $(libuargp-so-y)))
+ 
+ shared_objs = $(libc-y:.o=.os) $(libc-shared-y) $(libc-nonshared-y) \
+ 	$(libcrypt-so-y) $(libdl-so-y) \
+@@ -55,12 +56,12 @@ shared_objs = $(libc-y:.o=.os) $(libc-shared-y) $(libc-nonshared-y) \
  	$(libpthread-so-y) $(libpthread-nonshared-y) $(libthread_db-so-y) \
  	$(libresolv-so-y) $(librt-so-y) \
  	$(ldso-y) \
@@ -124,7 +139,7 @@ Index: git/Makerules
  ifeq ($(DOPIC),y)
  ar_objs := $(ar_objs:.o=.os)
  endif
-@@ -472,7 +472,7 @@
+@@ -498,7 +499,7 @@ files.dep := $(libc-a-y) $(libc-so-y) $(libc-nonshared-y) \
  	$(librt-a-y) $(librt-so-y)  $(libresolv-a-y) $(libresolv-so-y) \
  	$(libcrypt-a-y) $(libcrypt-so-y) $(libutil-a-y) $(libutil-so-y) \
  	$(libnsl-a-y) $(libnsl-so-y) $(ldso-y) $(libdl-a-y) $(libdl-so-y) \
@@ -133,30 +148,36 @@ Index: git/Makerules
  .depends.dep := \
  	$(patsubst %.s,%.s.dep,$(filter %.s,$(files.dep))) \
  	$(patsubst %.o,%.o.dep,$(filter %.o,$(files.dep))) \
-Index: git/Rules.mak
-===================================================================
---- git.orig/Rules.mak	2012-06-18 13:10:12.000000000 -0700
-+++ git/Rules.mak	2012-06-18 13:10:44.056825544 -0700
-@@ -589,6 +589,13 @@
+diff --git a/Rules.mak b/Rules.mak
+index de9ffb3..a2baf58 100644
+--- a/Rules.mak
++++ b/Rules.mak
+@@ -602,6 +602,19 @@ export UBACKTRACE_ASNEEDED:=$(shell $(CC) -Wl,--help 2>/dev/null | grep -q -- --
  else
  export UBACKTRACE_ASNEEDED:=""
  endif
 +ifeq ($(UCLIBC_HAS_ARGP),y)
++ifeq ($(HARDWIRED_ABSPATH),y)
 +# Only used in installed libc.so linker script
-+UARGP_FULL_NAME := $(RUNTIME_PREFIX)lib/libuargp.so.$(MAJOR_VERSION)
-+export UARGP_ASNEEDED:=$(shell $(LD) --help 2>/dev/null | grep -q -- --as-needed && echo "AS_NEEDED ( $(UARGP_FULL_NAME) )" || echo "$(UARGP_FULL_NAME)")
++UARGP_FULL_NAME := $(subst //,/,$(RUNTIME_PREFIX)$(MULTILIB_DIR)/libuargp.so.$(MAJOR_VERSION))
++else
++UARGP_FULL_NAME := libuargp.so.$(MAJOR_VERSION)
++endif
++export UARGP_ASNEEDED:=$(shell $(CC) -Wl,--help 2>/dev/null | grep -q -- --as-needed && \
++	echo "GROUP ( AS_NEEDED ( $(UARGP_FULL_NAME) ) )" || \
++	echo "GROUP ( $(UARGP_FULL_NAME) )")
 +else
 +export UARGP_ASNEEDED:=""
 +endif
  endif
  
  # Add a bunch of extra pedantic annoyingly strict checks
-Index: git/extra/Configs/Config.in
-===================================================================
---- git.orig/extra/Configs/Config.in	2012-06-18 13:10:12.000000000 -0700
-+++ git/extra/Configs/Config.in	2012-06-18 13:10:44.056825544 -0700
-@@ -1853,6 +1853,23 @@
- 	  smaller SUSv3 compatible getsubopt().
+diff --git a/extra/Configs/Config.in b/extra/Configs/Config.in
+index 242e45a..b36d4c9 100644
+--- a/extra/Configs/Config.in
++++ b/extra/Configs/Config.in
+@@ -1943,6 +1943,23 @@ config UCLIBC_HAS_GNU_GETSUBOPT
+ 	  Answer Y if you want to include getsubopt().
  
  	  Most people will answer Y.
 +
@@ -179,10 +200,583 @@ Index: git/extra/Configs/Config.in
  endmenu
  
  
-Index: git/libc/sysdeps/linux/common/bits/getopt_int.h
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ git/libc/sysdeps/linux/common/bits/getopt_int.h	2012-06-18 13:10:44.056825544 -0700
+diff --git a/include/argp.h b/include/argp.h
+new file mode 100644
+index 0000000..9d53728
+--- /dev/null
++++ b/include/argp.h
+@@ -0,0 +1,566 @@
++/* Hierarchial argument parsing, layered over getopt.
++   Copyright (C) 1995-1999, 2003, 2004, 2005, 2006, 2007, 2009
++   Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++   Written by Miles Bader <miles at gnu.ai.mit.edu>.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, write to the Free
++   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
++   02111-1307 USA.
++
++   Modified for uClibc by: Salvatore Cro <salvatore.cro at st.com>
++*/
++
++#ifndef _ARGP_H
++#define _ARGP_H
++
++#include <stdio.h>
++#include <ctype.h>
++#include <limits.h>
++
++#define __need_error_t
++#include <errno.h>
++
++#ifndef __const
++# define __const const
++#endif
++
++#ifndef __THROW
++# define __THROW
++#endif
++#ifndef __NTH
++# define __NTH(fct) fct __THROW
++#endif
++
++#ifndef __attribute__
++/* This feature is available in gcc versions 2.5 and later.  */
++# if __GNUC__ < 2 || (__GNUC__ == 2 && __GNUC_MINOR__ < 5) || defined(__STRICT_ANSI__)
++#  define __attribute__(Spec) /* empty */
++# endif
++/* The __-protected variants of `format' and `printf' attributes
++   are accepted by gcc versions 2.6.4 (effectively 2.7) and later.  */
++# if __GNUC__ < 2 || (__GNUC__ == 2 && __GNUC_MINOR__ < 7) || defined(__STRICT_ANSI__)
++#  define __format__ format
++#  define __printf__ printf
++# endif
++#endif
++
++/* GCC 2.95 and later have "__restrict"; C99 compilers have
++   "restrict", and "configure" may have defined "restrict".  */
++#ifndef __restrict
++# if ! (2 < __GNUC__ || (2 == __GNUC__ && 95 <= __GNUC_MINOR__))
++#  if defined restrict || 199901L <= __STDC_VERSION__
++#   define __restrict restrict
++#  else
++#   define __restrict
++#  endif
++# endif
++#endif
++
++#ifndef __error_t_defined
++typedef int error_t;
++# define __error_t_defined
++#endif
++
++#ifdef  __cplusplus
++extern "C" {
++#endif
++
++/* A description of a particular option.  A pointer to an array of
++   these is passed in the OPTIONS field of an argp structure.  Each option
++   entry can correspond to one long option and/or one short option; more
++   names for the same option can be added by following an entry in an option
++   array with options having the OPTION_ALIAS flag set.  */
++struct argp_option
++{
++  /* The long option name.  For more than one name for the same option, you
++     can use following options with the OPTION_ALIAS flag set.  */
++  __const char *name;
++
++  /* What key is returned for this option.  If > 0 and printable, then it's
++     also accepted as a short option.  */
++  int key;
++
++  /* If non-NULL, this is the name of the argument associated with this
++     option, which is required unless the OPTION_ARG_OPTIONAL flag is set. */
++  __const char *arg;
++
++  /* OPTION_ flags.  */
++  int flags;
++
++  /* The doc string for this option.  If both NAME and KEY are 0, This string
++     will be printed outdented from the normal option column, making it
++     useful as a group header (it will be the first thing printed in its
++     group); in this usage, it's conventional to end the string with a `:'.  */
++  __const char *doc;
++
++  /* The group this option is in.  In a long help message, options are sorted
++     alphabetically within each group, and the groups presented in the order
++     0, 1, 2, ..., n, -m, ..., -2, -1.  Every entry in an options array with
++     if this field 0 will inherit the group number of the previous entry, or
++     zero if it's the first one, unless its a group header (NAME and KEY both
++     0), in which case, the previous entry + 1 is the default.  Automagic
++     options such as --help are put into group -1.  */
++  int group;
++};
++
++/* The argument associated with this option is optional.  */
++#define OPTION_ARG_OPTIONAL	0x1
++
++/* This option isn't displayed in any help messages.  */
++#define OPTION_HIDDEN	       	0x2
++
++/* This option is an alias for the closest previous non-alias option.  This
++   means that it will be displayed in the same help entry, and will inherit
++   fields other than NAME and KEY from the aliased option.  */
++#define OPTION_ALIAS		0x4
++
++/* This option isn't actually an option (and so should be ignored by the
++   actual option parser), but rather an arbitrary piece of documentation that
++   should be displayed in much the same manner as the options.  If this flag
++   is set, then the option NAME field is displayed unmodified (e.g., no `--'
++   prefix is added) at the left-margin (where a *short* option would normally
++   be displayed), and the documentation string in the normal place.  For
++   purposes of sorting, any leading whitespace and punctuation is ignored,
++   except that if the first non-whitespace character is not `-', this entry
++   is displayed after all options (and OPTION_DOC entries with a leading `-')
++   in the same group.  */
++#define OPTION_DOC		0x8
++
++/* This option shouldn't be included in `long' usage messages (but is still
++   included in help messages).  This is mainly intended for options that are
++   completely documented in an argp's ARGS_DOC field, in which case including
++   the option in the generic usage list would be redundant.  For instance,
++   if ARGS_DOC is "FOO BAR\n-x BLAH", and the `-x' option's purpose is to
++   distinguish these two cases, -x should probably be marked
++   OPTION_NO_USAGE.  */
++#define OPTION_NO_USAGE		0x10
++
++struct argp;			/* fwd declare this type */
++struct argp_state;		/* " */
++struct argp_child;		/* " */
++
++/* The type of a pointer to an argp parsing function.  */
++typedef error_t (*argp_parser_t) (int __key, char *__arg,
++				  struct argp_state *__state);
++
++/* What to return for unrecognized keys.  For special ARGP_KEY_ keys, such
++   returns will simply be ignored.  For user keys, this error will be turned
++   into EINVAL (if the call to argp_parse is such that errors are propagated
++   back to the user instead of exiting); returning EINVAL itself would result
++   in an immediate stop to parsing in *all* cases.  */
++#define ARGP_ERR_UNKNOWN	E2BIG /* Hurd should never need E2BIG.  XXX */
++
++/* Special values for the KEY argument to an argument parsing function.
++   ARGP_ERR_UNKNOWN should be returned if they aren't understood.
++
++   The sequence of keys to a parsing function is either (where each
++   uppercased word should be prefixed by `ARGP_KEY_' and opt is a user key):
++
++       INIT opt... NO_ARGS END SUCCESS  -- No non-option arguments at all
++   or  INIT (opt | ARG)... END SUCCESS  -- All non-option args parsed
++   or  INIT (opt | ARG)... SUCCESS      -- Some non-option arg unrecognized
++
++   The third case is where every parser returned ARGP_KEY_UNKNOWN for an
++   argument, in which case parsing stops at that argument (returning the
++   unparsed arguments to the caller of argp_parse if requested, or stopping
++   with an error message if not).
++
++   If an error occurs (either detected by argp, or because the parsing
++   function returned an error value), then the parser is called with
++   ARGP_KEY_ERROR, and no further calls are made.  */
++
++/* This is not an option at all, but rather a command line argument.  If a
++   parser receiving this key returns success, the fact is recorded, and the
++   ARGP_KEY_NO_ARGS case won't be used.  HOWEVER, if while processing the
++   argument, a parser function decrements the NEXT field of the state it's
++   passed, the option won't be considered processed; this is to allow you to
++   actually modify the argument (perhaps into an option), and have it
++   processed again.  */
++#define ARGP_KEY_ARG		0
++/* There are remaining arguments not parsed by any parser, which may be found
++   starting at (STATE->argv + STATE->next).  If success is returned, but
++   STATE->next left untouched, it's assumed that all arguments were consume,
++   otherwise, the parser should adjust STATE->next to reflect any arguments
++   consumed.  */
++#define ARGP_KEY_ARGS		0x1000006
++/* There are no more command line arguments at all.  */
++#define ARGP_KEY_END		0x1000001
++/* Because it's common to want to do some special processing if there aren't
++   any non-option args, user parsers are called with this key if they didn't
++   successfully process any non-option arguments.  Called just before
++   ARGP_KEY_END (where more general validity checks on previously parsed
++   arguments can take place).  */
++#define ARGP_KEY_NO_ARGS	0x1000002
++/* Passed in before any parsing is done.  Afterwards, the values of each
++   element of the CHILD_INPUT field, if any, in the state structure is
++   copied to each child's state to be the initial value of the INPUT field.  */
++#define ARGP_KEY_INIT		0x1000003
++/* Use after all other keys, including SUCCESS & END.  */
++#define ARGP_KEY_FINI		0x1000007
++/* Passed in when parsing has successfully been completed (even if there are
++   still arguments remaining).  */
++#define ARGP_KEY_SUCCESS	0x1000004
++/* Passed in if an error occurs.  */
++#define ARGP_KEY_ERROR		0x1000005
++
++/* An argp structure contains a set of options declarations, a function to
++   deal with parsing one, documentation string, a possible vector of child
++   argp's, and perhaps a function to filter help output.  When actually
++   parsing options, getopt is called with the union of all the argp
++   structures chained together through their CHILD pointers, with conflicts
++   being resolved in favor of the first occurrence in the chain.  */
++struct argp
++{
++  /* An array of argp_option structures, terminated by an entry with both
++     NAME and KEY having a value of 0.  */
++  __const struct argp_option *options;
++
++  /* What to do with an option from this structure.  KEY is the key
++     associated with the option, and ARG is any associated argument (NULL if
++     none was supplied).  If KEY isn't understood, ARGP_ERR_UNKNOWN should be
++     returned.  If a non-zero, non-ARGP_ERR_UNKNOWN value is returned, then
++     parsing is stopped immediately, and that value is returned from
++     argp_parse().  For special (non-user-supplied) values of KEY, see the
++     ARGP_KEY_ definitions below.  */
++  argp_parser_t parser;
++
++  /* A string describing what other arguments are wanted by this program.  It
++     is only used by argp_usage to print the `Usage:' message.  If it
++     contains newlines, the strings separated by them are considered
++     alternative usage patterns, and printed on separate lines (lines after
++     the first are prefix by `  or: ' instead of `Usage:').  */
++  __const char *args_doc;
++
++  /* If non-NULL, a string containing extra text to be printed before and
++     after the options in a long help message (separated by a vertical tab
++     `\v' character).  */
++  __const char *doc;
++
++  /* A vector of argp_children structures, terminated by a member with a 0
++     argp field, pointing to child argps should be parsed with this one.  Any
++     conflicts are resolved in favor of this argp, or early argps in the
++     CHILDREN list.  This field is useful if you use libraries that supply
++     their own argp structure, which you want to use in conjunction with your
++     own.  */
++  __const struct argp_child *children;
++
++  /* If non-zero, this should be a function to filter the output of help
++     messages.  KEY is either a key from an option, in which case TEXT is
++     that option's help text, or a special key from the ARGP_KEY_HELP_
++     defines, below, describing which other help text TEXT is.  The function
++     should return either TEXT, if it should be used as-is, a replacement
++     string, which should be malloced, and will be freed by argp, or NULL,
++     meaning `print nothing'.  The value for TEXT is *after* any translation
++     has been done, so if any of the replacement text also needs translation,
++     that should be done by the filter function.  INPUT is either the input
++     supplied to argp_parse, or NULL, if argp_help was called directly.  */
++  char *(*help_filter) (int __key, __const char *__text, void *__input);
++
++  /* If non-zero the strings used in the argp library are translated using
++     the domain described by this string.  Otherwise the currently installed
++     default domain is used.  */
++  const char *argp_domain;
++};
++
++/* Possible KEY arguments to a help filter function.  */
++#define ARGP_KEY_HELP_PRE_DOC	0x2000001 /* Help text preceeding options. */
++#define ARGP_KEY_HELP_POST_DOC	0x2000002 /* Help text following options. */
++#define ARGP_KEY_HELP_HEADER	0x2000003 /* Option header string. */
++#define ARGP_KEY_HELP_EXTRA	0x2000004 /* After all other documentation;
++					     TEXT is NULL for this key.  */
++/* Explanatory note emitted when duplicate option arguments have been
++   suppressed.  */
++#define ARGP_KEY_HELP_DUP_ARGS_NOTE 0x2000005
++#define ARGP_KEY_HELP_ARGS_DOC	0x2000006 /* Argument doc string.  */
++
++/* When an argp has a non-zero CHILDREN field, it should point to a vector of
++   argp_child structures, each of which describes a subsidiary argp.  */
++struct argp_child
++{
++  /* The child parser.  */
++  __const struct argp *argp;
++
++  /* Flags for this child.  */
++  int flags;
++
++  /* If non-zero, an optional header to be printed in help output before the
++     child options.  As a side-effect, a non-zero value forces the child
++     options to be grouped together; to achieve this effect without actually
++     printing a header string, use a value of "".  */
++  __const char *header;
++
++  /* Where to group the child options relative to the other (`consolidated')
++     options in the parent argp; the values are the same as the GROUP field
++     in argp_option structs, but all child-groupings follow parent options at
++     a particular group level.  If both this field and HEADER are zero, then
++     they aren't grouped at all, but rather merged with the parent options
++     (merging the child's grouping levels with the parents).  */
++  int group;
++};
++
++/* Parsing state.  This is provided to parsing functions called by argp,
++   which may examine and, as noted, modify fields.  */
++struct argp_state
++{
++  /* The top level ARGP being parsed.  */
++  __const struct argp *root_argp;
++
++  /* The argument vector being parsed.  May be modified.  */
++  int argc;
++  char **argv;
++
++  /* The index in ARGV of the next arg that to be parsed.  May be modified. */
++  int next;
++
++  /* The flags supplied to argp_parse.  May be modified.  */
++  unsigned flags;
++
++  /* While calling a parsing function with a key of ARGP_KEY_ARG, this is the
++     number of the current arg, starting at zero, and incremented after each
++     such call returns.  At all other times, this is the number of such
++     arguments that have been processed.  */
++  unsigned arg_num;
++
++  /* If non-zero, the index in ARGV of the first argument following a special
++     `--' argument (which prevents anything following being interpreted as an
++     option).  Only set once argument parsing has proceeded past this point. */
++  int quoted;
++
++  /* An arbitrary pointer passed in from the user.  */
++  void *input;
++  /* Values to pass to child parsers.  This vector will be the same length as
++     the number of children for the current parser.  */
++  void **child_inputs;
++
++  /* For the parser's use.  Initialized to 0.  */
++  void *hook;
++
++  /* The name used when printing messages.  This is initialized to ARGV[0],
++     or PROGRAM_INVOCATION_NAME if that is unavailable.  */
++  char *name;
++
++  /* Streams used when argp prints something.  */
++  FILE *err_stream;		/* For errors; initialized to stderr. */
++  FILE *out_stream;		/* For information; initialized to stdout. */
++
++  void *pstate;			/* Private, for use by argp.  */
++};
++
++/* Flags for argp_parse (note that the defaults are those that are
++   convenient for program command line parsing): */
++
++/* Don't ignore the first element of ARGV.  Normally (and always unless
++   ARGP_NO_ERRS is set) the first element of the argument vector is
++   skipped for option parsing purposes, as it corresponds to the program name
++   in a command line.  */
++#define ARGP_PARSE_ARGV0  0x01
++
++/* Don't print error messages for unknown options to stderr; unless this flag
++   is set, ARGP_PARSE_ARGV0 is ignored, as ARGV[0] is used as the program
++   name in the error messages.  This flag implies ARGP_NO_EXIT (on the
++   assumption that silent exiting upon errors is bad behaviour).  */
++#define ARGP_NO_ERRS	0x02
++
++/* Don't parse any non-option args.  Normally non-option args are parsed by
++   calling the parse functions with a key of ARGP_KEY_ARG, and the actual arg
++   as the value.  Since it's impossible to know which parse function wants to
++   handle it, each one is called in turn, until one returns 0 or an error
++   other than ARGP_ERR_UNKNOWN; if an argument is handled by no one, the
++   argp_parse returns prematurely (but with a return value of 0).  If all
++   args have been parsed without error, all parsing functions are called one
++   last time with a key of ARGP_KEY_END.  This flag needn't normally be set,
++   as the normal behavior is to stop parsing as soon as some argument can't
++   be handled.  */
++#define ARGP_NO_ARGS	0x04
++
++/* Parse options and arguments in the same order they occur on the command
++   line -- normally they're rearranged so that all options come first. */
++#define ARGP_IN_ORDER	0x08
++
++/* Don't provide the standard long option --help, which causes usage and
++      option help information to be output to stdout, and exit (0) called. */
++#define ARGP_NO_HELP	0x10
++
++/* Don't exit on errors (they may still result in error messages).  */
++#define ARGP_NO_EXIT	0x20
++
++/* Use the gnu getopt `long-only' rules for parsing arguments.  */
++#define ARGP_LONG_ONLY	0x40
++
++/* Turns off any message-printing/exiting options.  */
++#define ARGP_SILENT    (ARGP_NO_EXIT | ARGP_NO_ERRS | ARGP_NO_HELP)
++
++/* Parse the options strings in ARGC & ARGV according to the options in ARGP.
++   FLAGS is one of the ARGP_ flags above.  If ARG_INDEX is non-NULL, the
++   index in ARGV of the first unparsed option is returned in it.  If an
++   unknown option is present, ARGP_ERR_UNKNOWN is returned; if some parser
++   routine returned a non-zero value, it is returned; otherwise 0 is
++   returned.  This function may also call exit unless the ARGP_NO_HELP flag
++   is set.  INPUT is a pointer to a value to be passed in to the parser.  */
++extern error_t argp_parse (__const struct argp *__restrict __argp,
++			   int __argc, char **__restrict __argv,
++			   unsigned __flags, int *__restrict __arg_index,
++			   void *__restrict __input);
++
++/* Global variables.  */
++
++/* If defined or set by the user program to a non-zero value, then a default
++   option --version is added (unless the ARGP_NO_HELP flag is used), which
++   will print this string followed by a newline and exit (unless the
++   ARGP_NO_EXIT flag is used).  Overridden by ARGP_PROGRAM_VERSION_HOOK.  */
++extern __const char *argp_program_version;
++
++/* If defined or set by the user program to a non-zero value, then a default
++   option --version is added (unless the ARGP_NO_HELP flag is used), which
++   calls this function with a stream to print the version to and a pointer to
++   the current parsing state, and then exits (unless the ARGP_NO_EXIT flag is
++   used).  This variable takes precedent over ARGP_PROGRAM_VERSION.  */
++extern void (*argp_program_version_hook) (FILE *__restrict __stream,
++					  struct argp_state *__restrict
++					  __state);
++
++/* If defined or set by the user program, it should point to string that is
++   the bug-reporting address for the program.  It will be printed by
++   argp_help if the ARGP_HELP_BUG_ADDR flag is set (as it is by various
++   standard help messages), embedded in a sentence that says something like
++   `Report bugs to ADDR.'.  */
++extern __const char *argp_program_bug_address;
++
++/* The exit status that argp will use when exiting due to a parsing error.
++   If not defined or set by the user program, this defaults to EX_USAGE from
++   <sysexits.h>.  */
++extern error_t argp_err_exit_status;
++
++/* Flags for argp_help.  */
++#define ARGP_HELP_USAGE		0x01 /* a Usage: message. */
++#define ARGP_HELP_SHORT_USAGE	0x02 /*  " but don't actually print options. */
++#define ARGP_HELP_SEE		0x04 /* a `Try ... for more help' message. */
++#define ARGP_HELP_LONG		0x08 /* a long help message. */
++#define ARGP_HELP_PRE_DOC	0x10 /* doc string preceding long help.  */
++#define ARGP_HELP_POST_DOC	0x20 /* doc string following long help.  */
++#define ARGP_HELP_DOC		(ARGP_HELP_PRE_DOC | ARGP_HELP_POST_DOC)
++#define ARGP_HELP_BUG_ADDR	0x40 /* bug report address */
++#define ARGP_HELP_LONG_ONLY	0x80 /* modify output appropriately to
++					reflect ARGP_LONG_ONLY mode.  */
++
++/* These ARGP_HELP flags are only understood by argp_state_help.  */
++#define ARGP_HELP_EXIT_ERR	0x100 /* Call exit(1) instead of returning.  */
++#define ARGP_HELP_EXIT_OK	0x200 /* Call exit(0) instead of returning.  */
++
++/* The standard thing to do after a program command line parsing error, if an
++   error message has already been printed.  */
++#define ARGP_HELP_STD_ERR \
++  (ARGP_HELP_SEE | ARGP_HELP_EXIT_ERR)
++/* The standard thing to do after a program command line parsing error, if no
++   more specific error message has been printed.  */
++#define ARGP_HELP_STD_USAGE \
++  (ARGP_HELP_SHORT_USAGE | ARGP_HELP_SEE | ARGP_HELP_EXIT_ERR)
++/* The standard thing to do in response to a --help option.  */
++#define ARGP_HELP_STD_HELP \
++  (ARGP_HELP_SHORT_USAGE | ARGP_HELP_LONG | ARGP_HELP_EXIT_OK \
++   | ARGP_HELP_DOC | ARGP_HELP_BUG_ADDR)
++
++/* Output a usage message for ARGP to STREAM.  FLAGS are from the set
++   ARGP_HELP_*.  */
++extern void argp_help (__const struct argp *__restrict __argp,
++		       FILE *__restrict __stream,
++		       unsigned __flags, char *__restrict __name);
++
++/* The following routines are intended to be called from within an argp
++   parsing routine (thus taking an argp_state structure as the first
++   argument).  They may or may not print an error message and exit, depending
++   on the flags in STATE -- in any case, the caller should be prepared for
++   them *not* to exit, and should return an appropiate error after calling
++   them.  [argp_usage & argp_error should probably be called argp_state_...,
++   but they're used often enough that they should be short]  */
++
++/* Output, if appropriate, a usage message for STATE to STREAM.  FLAGS are
++   from the set ARGP_HELP_*.  */
++extern void argp_state_help (__const struct argp_state *__restrict __state,
++			     FILE *__restrict __stream,
++			     unsigned int __flags);
++/* Possibly output the standard usage message for ARGP to stderr and exit.  */
++extern void argp_usage (__const struct argp_state *__state);
++
++/* If appropriate, print the printf string FMT and following args, preceded
++   by the program name and `:', to stderr, and followed by a `Try ... --help'
++   message, then exit (1).  */
++extern void argp_error (__const struct argp_state *__restrict __state,
++			__const char *__restrict __fmt, ...)
++     __attribute__ ((__format__ (__printf__, 2, 3)));
++/* Similar to the standard gnu error-reporting function error(), but will
++   respect the ARGP_NO_EXIT and ARGP_NO_ERRS flags in STATE, and will print
++   to STATE->err_stream.  This is useful for argument parsing code that is
++   shared between program startup (when exiting is desired) and runtime
++   option parsing (when typically an error code is returned instead).  The
++   difference between this function and argp_error is that the latter is for
++   *parsing errors*, and the former is for other problems that occur during
++   parsing but don't reflect a (syntactic) problem with the input.  */
++extern void argp_failure (__const struct argp_state *__restrict __state,
++			  int __status, int __errnum,
++			  __const char *__restrict __fmt, ...)
++     __attribute__ ((__format__ (__printf__, 4, 5)));
++/* Returns true if the option OPT is a valid short option.  */
++extern int _option_is_short (__const struct argp_option *__opt) __THROW;
++extern int __option_is_short (__const struct argp_option *__opt) __THROW;
++
++/* Returns true if the option OPT is in fact the last (unused) entry in an
++   options array.  */
++extern int _option_is_end (__const struct argp_option *__opt) __THROW;
++extern int __option_is_end (__const struct argp_option *__opt) __THROW;
++
++/* Return the input field for ARGP in the parser corresponding to STATE; used
++   by the help routines.  */
++/* We think this should not be exported */
++extern void *__argp_input (__const struct argp *__restrict __argp,
++			   __const struct argp_state *__restrict __state)
++     __THROW;
++
++#ifdef __USE_EXTERN_INLINES
++
++# ifndef ARGP_EI
++#  define ARGP_EI __extern_inline
++# endif
++
++ARGP_EI void
++argp_usage (__const struct argp_state *__state)
++{
++  argp_state_help (__state, stderr, ARGP_HELP_STD_USAGE);
++}
++
++ARGP_EI int
++__NTH (__option_is_short (__const struct argp_option *__opt))
++{
++  if (__opt->flags & OPTION_DOC)
++    return 0;
++  else
++    {
++      int __key = __opt->key;
++      return __key > 0 && __key <= UCHAR_MAX && isprint (__key);
++    }
++}
++
++ARGP_EI int
++__NTH (__option_is_end (__const struct argp_option *__opt))
++{
++  return !__opt->key && !__opt->name && !__opt->doc && !__opt->group;
++}
++#endif /* Use extern inlines.  */
++
++#ifdef  __cplusplus
++}
++#endif
++
++#endif /* argp.h */
+diff --git a/libc/sysdeps/linux/common/bits/getopt_int.h b/libc/sysdeps/linux/common/bits/getopt_int.h
+new file mode 100644
+index 0000000..291edfe
+--- /dev/null
++++ b/libc/sysdeps/linux/common/bits/getopt_int.h
 @@ -0,0 +1,136 @@
 +/* Internal declarations for getopt.
 +   Copyright (C) 1989-1994,1996-1999,2001,2003,2004
@@ -320,11 +914,11 @@ Index: git/libc/sysdeps/linux/common/bits/getopt_int.h
 +#endif
 +#endif
 +#endif /* getopt_int.h */
-Index: git/libc/unistd/getopt.c
-===================================================================
---- git.orig/libc/unistd/getopt.c	2012-06-18 13:10:12.000000000 -0700
-+++ git/libc/unistd/getopt.c	2012-06-18 13:10:44.056825544 -0700
-@@ -106,7 +106,7 @@
+diff --git a/libc/unistd/getopt.c b/libc/unistd/getopt.c
+index f63482b..db5e12c 100644
+--- a/libc/unistd/getopt.c
++++ b/libc/unistd/getopt.c
+@@ -105,7 +105,7 @@
     they can distinguish the relative order of options and other arguments.  */
  
  #include <getopt.h>
@@ -333,7 +927,7 @@ Index: git/libc/unistd/getopt.c
  
  
  /* For communication from `getopt' to the caller.
-@@ -1170,6 +1170,15 @@
+@@ -1170,6 +1170,15 @@ getopt_long (int argc, char *const *argv, const char *options,
    return _getopt_internal (argc, argv, options, long_options, opt_index, 0);
  }
  
@@ -349,9 +943,9 @@ Index: git/libc/unistd/getopt.c
  /* Like getopt_long, but '-' as well as '--' can indicate a long option.
     If an option that starts with '-' (not '--') doesn't match a long option,
     but does match a short option, it is parsed as a short option
-@@ -1182,4 +1191,12 @@
-   return _getopt_internal (argc, argv, options, long_options, opt_index, 1);
+@@ -1183,4 +1192,12 @@ getopt_long_only (int argc, char *const *argv, const char *options,
  }
+ #endif /* __UCLIBC_HAS_GETOPT_LONG__ */
  
 +int
 +_getopt_long_only_r (int argc, char *const *argv, const char *options,
@@ -362,10 +956,11 @@ Index: git/libc/unistd/getopt.c
 +}
 +
  #endif	/* Not ELIDE_CODE.  */
-Index: git/libuargp/Makefile
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ git/libuargp/Makefile	2012-06-18 13:10:44.056825544 -0700
+diff --git a/libuargp/Makefile b/libuargp/Makefile
+new file mode 100644
+index 0000000..45acdd9
+--- /dev/null
++++ b/libuargp/Makefile
 @@ -0,0 +1,14 @@
 +# Makefile for uClibc (libuargp)
 +#
@@ -381,10 +976,11 @@ Index: git/libuargp/Makefile
 +all: libs
 +include Makefile.in
 +include $(top_srcdir)Makerules
-Index: git/libuargp/Makefile.in
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ git/libuargp/Makefile.in	2012-06-18 13:10:44.056825544 -0700
+diff --git a/libuargp/Makefile.in b/libuargp/Makefile.in
+new file mode 100644
+index 0000000..1498abb
+--- /dev/null
++++ b/libuargp/Makefile.in
 @@ -0,0 +1,73 @@
 +# Makefile for uClibc (libuargp)
 +#
@@ -459,10 +1055,11 @@ Index: git/libuargp/Makefile.in
 +
 +CLEAN_libuargp:
 +	$(do_rm) $(addprefix $(libuargp_OUT)/*., o os oS a)
-Index: git/libuargp/argp-ba.c
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ git/libuargp/argp-ba.c	2012-06-18 13:10:44.056825544 -0700
+diff --git a/libuargp/argp-ba.c b/libuargp/argp-ba.c
+new file mode 100644
+index 0000000..3522b02
+--- /dev/null
++++ b/libuargp/argp-ba.c
 @@ -0,0 +1,26 @@
 +/* Default definition for ARGP_PROGRAM_BUG_ADDRESS.
 +   Copyright (C) 1996, 1997, 1999 Free Software Foundation, Inc.
@@ -490,10 +1087,11 @@ Index: git/libuargp/argp-ba.c
 +   messages), embedded in a sentence that says something like `Report bugs to
 +   ADDR.'.  */
 +const char *argp_program_bug_address;
-Index: git/libuargp/argp-eexst.c
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ git/libuargp/argp-eexst.c	2012-06-18 13:10:44.056825544 -0700
+diff --git a/libuargp/argp-eexst.c b/libuargp/argp-eexst.c
+new file mode 100644
+index 0000000..445b68d
+--- /dev/null
++++ b/libuargp/argp-eexst.c
 @@ -0,0 +1,32 @@
 +/* Default definition for ARGP_ERR_EXIT_STATUS
 +   Copyright (C) 1997 Free Software Foundation, Inc.
@@ -527,10 +1125,11 @@ Index: git/libuargp/argp-eexst.c
 +   If not defined or set by the user program, this defaults to EX_USAGE from
 +   <sysexits.h>.  */
 +error_t argp_err_exit_status = EX_USAGE;
-Index: git/libuargp/argp-fmtstream.c
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ git/libuargp/argp-fmtstream.c	2012-06-18 13:10:44.056825544 -0700
+diff --git a/libuargp/argp-fmtstream.c b/libuargp/argp-fmtstream.c
+new file mode 100644
+index 0000000..75227f9
+--- /dev/null
++++ b/libuargp/argp-fmtstream.c
 @@ -0,0 +1,439 @@
 +/* Word-wrapping and line-truncating streams
 +   Copyright (C) 1997-1999,2001,2002,2003,2005 Free Software Foundation, Inc.
@@ -971,10 +1570,11 @@ Index: git/libuargp/argp-fmtstream.c
 +#endif
 +
 +#endif /* !ARGP_FMTSTREAM_USE_LINEWRAP */
-Index: git/libuargp/argp-fmtstream.h
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ git/libuargp/argp-fmtstream.h	2012-06-18 13:10:44.056825544 -0700
+diff --git a/libuargp/argp-fmtstream.h b/libuargp/argp-fmtstream.h
+new file mode 100644
+index 0000000..ca7c834
+--- /dev/null
++++ b/libuargp/argp-fmtstream.h
 @@ -0,0 +1,314 @@
 +/* Word-wrapping and line-truncating streams.
 +   Copyright (C) 1997 Free Software Foundation, Inc.
@@ -1290,10 +1890,11 @@ Index: git/libuargp/argp-fmtstream.h
 +#endif /* ARGP_FMTSTREAM_USE_LINEWRAP */
 +
 +#endif /* argp-fmtstream.h */
-Index: git/libuargp/argp-fs-xinl.c
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ git/libuargp/argp-fs-xinl.c	2012-06-18 13:10:44.056825544 -0700
+diff --git a/libuargp/argp-fs-xinl.c b/libuargp/argp-fs-xinl.c
+new file mode 100644
+index 0000000..473cbbd
+--- /dev/null
++++ b/libuargp/argp-fs-xinl.c
 @@ -0,0 +1,44 @@
 +/* Real definitions for extern inline functions in argp-fmtstream.h
 +   Copyright (C) 1997, 2003, 2004 Free Software Foundation, Inc.
@@ -1339,10 +1940,11 @@ Index: git/libuargp/argp-fs-xinl.c
 +
 +#endif
 +#endif
-Index: git/libuargp/argp-help.c
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ git/libuargp/argp-help.c	2012-06-18 13:10:44.060825542 -0700
+diff --git a/libuargp/argp-help.c b/libuargp/argp-help.c
+new file mode 100644
+index 0000000..58a5e6e
+--- /dev/null
++++ b/libuargp/argp-help.c
 @@ -0,0 +1,1882 @@
 +/* Hierarchial argument parsing help output
 +   Copyright (C) 1995-2003, 2004, 2005, 2006, 2007
@@ -3226,10 +3828,11 @@ Index: git/libuargp/argp-help.c
 +       }
 +    }
 +}
-Index: git/libuargp/argp-parse.c
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ git/libuargp/argp-parse.c	2012-06-18 13:10:44.060825542 -0700
+diff --git a/libuargp/argp-parse.c b/libuargp/argp-parse.c
+new file mode 100644
+index 0000000..86b2b24
+--- /dev/null
++++ b/libuargp/argp-parse.c
 @@ -0,0 +1,949 @@
 +/* Hierarchial argument parsing, layered over getopt
 +   Copyright (C) 1995-2000, 2002, 2003, 2004 Free Software Foundation, Inc.
@@ -4180,10 +4783,11 @@ Index: git/libuargp/argp-parse.c
 +
 +  return 0;
 +}
-Index: git/libuargp/argp-pv.c
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ git/libuargp/argp-pv.c	2012-06-18 13:10:44.060825542 -0700
+diff --git a/libuargp/argp-pv.c b/libuargp/argp-pv.c
+new file mode 100644
+index 0000000..f1227b5
+--- /dev/null
++++ b/libuargp/argp-pv.c
 @@ -0,0 +1,25 @@
 +/* Default definition for ARGP_PROGRAM_VERSION.
 +   Copyright (C) 1996, 1997, 1999 Free Software Foundation, Inc.
@@ -4210,10 +4814,11 @@ Index: git/libuargp/argp-pv.c
 +   print this this string followed by a newline and exit (unless the
 +   ARGP_NO_EXIT flag is used).  Overridden by ARGP_PROGRAM_VERSION_HOOK.  */
 +const char *argp_program_version;
-Index: git/libuargp/argp-pvh.c
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ git/libuargp/argp-pvh.c	2012-06-18 13:10:44.060825542 -0700
+diff --git a/libuargp/argp-pvh.c b/libuargp/argp-pvh.c
+new file mode 100644
+index 0000000..1f1d962
+--- /dev/null
++++ b/libuargp/argp-pvh.c
 @@ -0,0 +1,32 @@
 +/* Default definition for ARGP_PROGRAM_VERSION_HOOK.
 +   Copyright (C) 1996, 1997, 1999 Free Software Foundation, Inc.
@@ -4247,10 +4852,11 @@ Index: git/libuargp/argp-pvh.c
 +   current parsing state, and then exits (unless the ARGP_NO_EXIT flag is
 +   used).  This variable takes precedent over ARGP_PROGRAM_VERSION.  */
 +void (*argp_program_version_hook) (FILE *stream, struct argp_state *state);
-Index: git/libuargp/argp-xinl.c
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ git/libuargp/argp-xinl.c	2012-06-18 13:10:44.060825542 -0700
+diff --git a/libuargp/argp-xinl.c b/libuargp/argp-xinl.c
+new file mode 100644
+index 0000000..f1d3000
+--- /dev/null
++++ b/libuargp/argp-xinl.c
 @@ -0,0 +1,35 @@
 +/* Real definitions for extern inline functions in argp.h
 +   Copyright (C) 1997, 1998, 2004 Free Software Foundation, Inc.
@@ -4287,10 +4893,11 @@ Index: git/libuargp/argp-xinl.c
 +#undef __OPTIMIZE__
 +#define __OPTIMIZE__ 1
 +#include <argp.h>
-Index: git/test/argp/Makefile
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ git/test/argp/Makefile	2012-06-18 13:10:44.060825542 -0700
+diff --git a/test/argp/Makefile b/test/argp/Makefile
+new file mode 100644
+index 0000000..616fe71
+--- /dev/null
++++ b/test/argp/Makefile
 @@ -0,0 +1,7 @@
 +# uClibc argp tests
 +# Licensed under the LGPL v2.1, see the file COPYING.LIB in this tarball.
@@ -4299,10 +4906,11 @@ Index: git/test/argp/Makefile
 +include ../Rules.mak
 +-include Makefile.in
 +include ../Test.mak
-Index: git/test/argp/Makefile.in
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ git/test/argp/Makefile.in	2012-06-18 13:10:44.060825542 -0700
+diff --git a/test/argp/Makefile.in b/test/argp/Makefile.in
+new file mode 100644
+index 0000000..d81b359
+--- /dev/null
++++ b/test/argp/Makefile.in
 @@ -0,0 +1,12 @@
 +# uClibc argp tests
 +# Licensed under the LGPL v2.1, see the file COPYING.LIB in this tarball.
@@ -4316,10 +4924,11 @@ Index: git/test/argp/Makefile.in
 +OPTS_argp-ex4 = ARG1 string1 string2 string3
 +OPTS_bug-argp1 = -- --help
 +
-Index: git/test/argp/argp-ex1.c
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ git/test/argp/argp-ex1.c	2012-06-18 13:10:44.060825542 -0700
+diff --git a/test/argp/argp-ex1.c b/test/argp/argp-ex1.c
+new file mode 100644
+index 0000000..7bb5f22
+--- /dev/null
++++ b/test/argp/argp-ex1.c
 @@ -0,0 +1,15 @@
 +/* Argp example #1 -- a minimal program using argp */
 +
@@ -4336,10 +4945,11 @@ Index: git/test/argp/argp-ex1.c
 +  argp_parse (0, argc, argv, 0, 0, 0);
 +  exit (0);
 +}
-Index: git/test/argp/argp-ex2.c
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ git/test/argp/argp-ex2.c	2012-06-18 13:10:44.060825542 -0700
+diff --git a/test/argp/argp-ex2.c b/test/argp/argp-ex2.c
+new file mode 100644
+index 0000000..c49fbac
+--- /dev/null
++++ b/test/argp/argp-ex2.c
 @@ -0,0 +1,45 @@
 +/* Argp example #2 -- a pretty minimal program using argp */
 +
@@ -4386,10 +4996,11 @@ Index: git/test/argp/argp-ex2.c
 +  argp_parse (&argp, argc, argv, 0, 0, 0);
 +  exit (0);
 +}
-Index: git/test/argp/argp-ex3.c
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ git/test/argp/argp-ex3.c	2012-06-18 13:10:44.060825542 -0700
+diff --git a/test/argp/argp-ex3.c b/test/argp/argp-ex3.c
+new file mode 100644
+index 0000000..24d5c50
+--- /dev/null
++++ b/test/argp/argp-ex3.c
 @@ -0,0 +1,153 @@
 +/* Argp example #3 -- a program with options and arguments using argp */
 +
@@ -4544,10 +5155,11 @@ Index: git/test/argp/argp-ex3.c
 +
 +  exit (0);
 +}
-Index: git/test/argp/argp-ex4.c
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ git/test/argp/argp-ex4.c	2012-06-18 13:10:44.060825542 -0700
+diff --git a/test/argp/argp-ex4.c b/test/argp/argp-ex4.c
+new file mode 100644
+index 0000000..c77c7ef
+--- /dev/null
++++ b/test/argp/argp-ex4.c
 @@ -0,0 +1,167 @@
 +/* Argp example #4 -- a program with somewhat more complicated options */
 +
@@ -4716,10 +5328,11 @@ Index: git/test/argp/argp-ex4.c
 +
 +  exit (0);
 +}
-Index: git/test/argp/argp-test.c
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ git/test/argp/argp-test.c	2012-06-18 13:10:44.060825542 -0700
+diff --git a/test/argp/argp-test.c b/test/argp/argp-test.c
+new file mode 100644
+index 0000000..b3d573b
+--- /dev/null
++++ b/test/argp/argp-test.c
 @@ -0,0 +1,209 @@
 +/* Test program for argp argument parser
 +   Copyright (C) 1997 Free Software Foundation, Inc.
@@ -4930,10 +5543,11 @@ Index: git/test/argp/argp-test.c
 +  printf ("After parsing: foonly = %x\n", params.foonly);
 +  return 0;
 +}
-Index: git/test/argp/bug-argp1.c
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ git/test/argp/bug-argp1.c	2012-06-18 13:10:44.060825542 -0700
+diff --git a/test/argp/bug-argp1.c b/test/argp/bug-argp1.c
+new file mode 100644
+index 0000000..a28cf4b
+--- /dev/null
++++ b/test/argp/bug-argp1.c
 @@ -0,0 +1,26 @@
 +#include <argp.h>
 +
@@ -4961,10 +5575,11 @@ Index: git/test/argp/bug-argp1.c
 +
 +#define TEST_FUNCTION do_test (argc, argv)
 +#include "../test-skeleton.c"
-Index: git/test/argp/tst-argp1.c
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ git/test/argp/tst-argp1.c	2012-06-18 13:10:44.060825542 -0700
+diff --git a/test/argp/tst-argp1.c b/test/argp/tst-argp1.c
+new file mode 100644
+index 0000000..827daca
+--- /dev/null
++++ b/test/argp/tst-argp1.c
 @@ -0,0 +1,118 @@
 +/* Copyright (C) 2002, 2003 Free Software Foundation, Inc.
 +   This file is part of the GNU C Library.
@@ -5084,10 +5699,11 @@ Index: git/test/argp/tst-argp1.c
 +
 +#define TEST_FUNCTION do_test ()
 +#include "../test-skeleton.c"
-Index: git/test/argp/tst-argp2.c
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ git/test/argp/tst-argp2.c	2012-06-18 13:10:44.064825538 -0700
+diff --git a/test/argp/tst-argp2.c b/test/argp/tst-argp2.c
+new file mode 100644
+index 0000000..705cdca
+--- /dev/null
++++ b/test/argp/tst-argp2.c
 @@ -0,0 +1,101 @@
 +/* Copyright (C) 2007 Free Software Foundation, Inc.
 +   This file is part of the GNU C Library.
@@ -5190,3 +5806,6 @@ Index: git/test/argp/tst-argp2.c
 +
 +#define TEST_FUNCTION do_test ()
 +#include "../test-skeleton.c"
+-- 
+2.1.4
+
diff --git a/meta/recipes-core/uclibc/uclibc-git/0004-Dont-support-localised-optimizations-this-helps-to-h.patch b/meta/recipes-core/uclibc/uclibc-git/0004-Dont-support-localised-optimizations-this-helps-to-h.patch
new file mode 100644
index 0000000..629e13c
--- /dev/null
+++ b/meta/recipes-core/uclibc/uclibc-git/0004-Dont-support-localised-optimizations-this-helps-to-h.patch
@@ -0,0 +1,30 @@
+From 31785c544abe8b215dbb2264fb11ee7051515797 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 16 Aug 2015 20:58:59 -0700
+Subject: [PATCH 4/7] Dont support localised optimizations this helps to have a
+ global -O level
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ libpthread/nptl/pthread_mutex_timedlock.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/libpthread/nptl/pthread_mutex_timedlock.c b/libpthread/nptl/pthread_mutex_timedlock.c
+index 04187f6..f56f6c5 100644
+--- a/libpthread/nptl/pthread_mutex_timedlock.c
++++ b/libpthread/nptl/pthread_mutex_timedlock.c
+@@ -28,7 +28,9 @@
+  * error: can't find a register in class ‘GENERAL_REGS’ while reloading ‘asm’
+  */
+ int
++#ifndef  __OPTIMIZE__
+ attribute_optimize("Os")
++#endif
+ pthread_mutex_timedlock (
+      pthread_mutex_t *mutex,
+      const struct timespec *abstime)
+-- 
+2.1.4
+
diff --git a/meta/recipes-core/uclibc/uclibc-git/0005-Always-use-O2-for-compiling-fork.c.patch b/meta/recipes-core/uclibc/uclibc-git/0005-Always-use-O2-for-compiling-fork.c.patch
new file mode 100644
index 0000000..ad9b246
--- /dev/null
+++ b/meta/recipes-core/uclibc/uclibc-git/0005-Always-use-O2-for-compiling-fork.c.patch
@@ -0,0 +1,33 @@
+From 883debc22e30a947fe5858cc07ee5aebd3d07a2e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 16 Aug 2015 20:59:56 -0700
+Subject: [PATCH 5/7] Always use -O2 for compiling fork.c
+
+When compiling in thumb mode for arm with -Os gcc gives up since it can
+not find registers to spill. So we use -O2 option for compiling fork.c
+It may be addressable in gcc.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ libpthread/nptl/sysdeps/unix/sysv/linux/arm/Makefile.arch | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/libpthread/nptl/sysdeps/unix/sysv/linux/arm/Makefile.arch b/libpthread/nptl/sysdeps/unix/sysv/linux/arm/Makefile.arch
+index 0ea0b29..0767e9c 100644
+--- a/libpthread/nptl/sysdeps/unix/sysv/linux/arm/Makefile.arch
++++ b/libpthread/nptl/sysdeps/unix/sysv/linux/arm/Makefile.arch
+@@ -21,3 +21,9 @@ ASFLAGS-pt-vfork.S = -marm
+ CFLAGS-OMIT-pt-vfork.S = -mthumb
+ ASFLAGS-vfork.S = -marm
+ CFLAGS-OMIT-vfork.S = -mthumb
++
++# For arm fork.c does not compile with -Os when compiling
++# in thumb1 mode
++ifeq ($(COMPILE_IN_THUMB_MODE),y)
++CFLAGS-fork.c = -O2
++endif
+-- 
+2.1.4
+
diff --git a/meta/recipes-core/uclibc/uclibc-git/0001-ldso-limited-support-for-ORIGIN-in-rpath.patch b/meta/recipes-core/uclibc/uclibc-git/0006-ldso-limited-support-for-ORIGIN-in-rpath.patch
similarity index 96%
rename from meta/recipes-core/uclibc/uclibc-git/0001-ldso-limited-support-for-ORIGIN-in-rpath.patch
rename to meta/recipes-core/uclibc/uclibc-git/0006-ldso-limited-support-for-ORIGIN-in-rpath.patch
index 7479ec3..f0d8737 100644
--- a/meta/recipes-core/uclibc/uclibc-git/0001-ldso-limited-support-for-ORIGIN-in-rpath.patch
+++ b/meta/recipes-core/uclibc/uclibc-git/0006-ldso-limited-support-for-ORIGIN-in-rpath.patch
@@ -1,7 +1,7 @@
-From 32eaf738faafad2b16e1f3f5beb91736b3c27a3b Mon Sep 17 00:00:00 2001
+From b40c129ed2d53b69463883a5422dd4a012a398f9 Mon Sep 17 00:00:00 2001
 From: Junling Zheng <zhengjunling@huawei.com>
 Date: Fri, 3 Apr 2015 05:02:27 +0000
-Subject: [PATCH] ldso: limited support for $ORIGIN in rpath
+Subject: [PATCH 6/7] ldso: limited support for $ORIGIN in rpath
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -26,7 +26,10 @@ Upstream-Status: Submitted
 
 Signed-off-by: Timo Teräs <timo.teras at iki.fi>
 Signed-off-by: Junling Zheng <zhengjunling@huawei.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  ldso/include/dl-string.h |  2 ++
  ldso/ldso/dl-elf.c       | 79 +++++++++++++++++++++++++-----------------------
  ldso/ldso/ldso.c         | 18 +++++++++--
@@ -47,7 +50,7 @@ index aacad10..14ae617 100644
  # define _dl_memcmp memcmp
  # define _dl_memset memset
 diff --git a/ldso/ldso/dl-elf.c b/ldso/ldso/dl-elf.c
-index 1b06bc1..b323c90 100644
+index 5631905..6ab7afe 100644
 --- a/ldso/ldso/dl-elf.c
 +++ b/ldso/ldso/dl-elf.c
 @@ -133,56 +133,60 @@ _dl_protect_relro (struct elf_resolve *l)
@@ -190,7 +193,7 @@ index 1b06bc1..b323c90 100644
  		return tpnt1;
  
 diff --git a/ldso/ldso/ldso.c b/ldso/ldso/ldso.c
-index 5619629..73bcc41 100644
+index f38f9e3..3812908 100644
 --- a/ldso/ldso/ldso.c
 +++ b/ldso/ldso/ldso.c
 @@ -402,6 +402,20 @@ static ptrdiff_t _dl_build_local_scope (struct elf_resolve **list,
@@ -226,5 +229,5 @@ index 5619629..73bcc41 100644
  #ifdef __DSBT__
  	_dl_ldso_dsbt = (void *)tpnt->dynamic_info[DT_DSBT_BASE_IDX];
 -- 
-1.8.3.4
+2.1.4
 
diff --git a/meta/recipes-core/uclibc/uclibc-git/0007-nptl-atfork-Hide-pthread_atfork-in-shared-versions.patch b/meta/recipes-core/uclibc/uclibc-git/0007-nptl-atfork-Hide-pthread_atfork-in-shared-versions.patch
new file mode 100644
index 0000000..ee932c3
--- /dev/null
+++ b/meta/recipes-core/uclibc/uclibc-git/0007-nptl-atfork-Hide-pthread_atfork-in-shared-versions.patch
@@ -0,0 +1,35 @@
+From 90516af9f776f9c2835b47fc52775dcb307a85ac Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 23 Jun 2012 15:59:01 -0700
+Subject: [PATCH 7/7] nptl/atfork: Hide pthread_atfork in shared versions
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+---
+ libpthread/nptl/Makefile.in | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/libpthread/nptl/Makefile.in b/libpthread/nptl/Makefile.in
+index 55eeba2..8cb8fa9 100644
+--- a/libpthread/nptl/Makefile.in
++++ b/libpthread/nptl/Makefile.in
+@@ -16,6 +16,7 @@ libc-shared-routines-y = forward.c libc-cancellation.c
+ libc-static-routines-y = alloca_cutoff.c libc-cancellation.c
+ libpthread-shared-only-routines-y = version.c
+ libpthread-static-only-routines-y = pthread_atfork.c
++
+ libpthread-routines- += $(notdir $(wildcard $(libpthread_DIR)/gen_*.c)) # dummy generated files
+ libpthread-routines- += allocatestack.c # dummy included by pthread_create.c
+ libpthread-routines- += pthread_mutex_getprioceiling.c pthread_mutex_setprioceiling.c # XXX: delete those or use them!
+@@ -201,7 +202,7 @@ CFLAGS-msgsnd.c = -fexceptions -fasynchronous-unwind-tables
+ CFLAGS-tcdrain.c = -fexceptions -fasynchronous-unwind-tables
+ 
+ CFLAGS-pt-system.c = -fexceptions -I$(top_srcdir)libc/stdlib
+-
++CFLAGS-pthread_atfork.c = -DNOT_IN_libc
+ #
+ # The rest of this file is uClibc specific.
+ #
+-- 
+2.1.4
+
diff --git a/meta/recipes-core/uclibc/uclibc-git/argp-headers.patch b/meta/recipes-core/uclibc/uclibc-git/argp-headers.patch
deleted file mode 100644
index b31b991..0000000
--- a/meta/recipes-core/uclibc/uclibc-git/argp-headers.patch
+++ /dev/null
@@ -1,583 +0,0 @@
-Added headers file needed by argp sources.
-
-Signed-off-by: Salvatore Cro <salvatore.cro at st.com>
----
- include/argp.h             |  566 ++++++++++++++++++++++++++++++++++++++++++++
- libc/argp/argp-fmtstream.h |  314 ++++++++++++++++++++++++
- 2 files changed, 880 insertions(+), 0 deletions(-)
- create mode 100644 include/argp.h
- create mode 100644 libc/argp/argp-fmtstream.h
-
-Upstream-Status: Pending
-
-Index: git/include/argp.h
-===================================================================
---- /dev/null
-+++ git/include/argp.h
-@@ -0,0 +1,566 @@
-+/* Hierarchial argument parsing, layered over getopt.
-+   Copyright (C) 1995-1999, 2003, 2004, 2005, 2006, 2007, 2009
-+   Free Software Foundation, Inc.
-+   This file is part of the GNU C Library.
-+   Written by Miles Bader <miles at gnu.ai.mit.edu>.
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
-+   02111-1307 USA.
-+
-+   Modified for uClibc by: Salvatore Cro <salvatore.cro at st.com>
-+*/
-+
-+#ifndef _ARGP_H
-+#define _ARGP_H
-+
-+#include <stdio.h>
-+#include <ctype.h>
-+#include <limits.h>
-+
-+#define __need_error_t
-+#include <errno.h>
-+
-+#ifndef __const
-+# define __const const
-+#endif
-+
-+#ifndef __THROW
-+# define __THROW
-+#endif
-+#ifndef __NTH
-+# define __NTH(fct) fct __THROW
-+#endif
-+
-+#ifndef __attribute__
-+/* This feature is available in gcc versions 2.5 and later.  */
-+# if __GNUC__ < 2 || (__GNUC__ == 2 && __GNUC_MINOR__ < 5) || defined(__STRICT_ANSI__)
-+#  define __attribute__(Spec) /* empty */
-+# endif
-+/* The __-protected variants of `format' and `printf' attributes
-+   are accepted by gcc versions 2.6.4 (effectively 2.7) and later.  */
-+# if __GNUC__ < 2 || (__GNUC__ == 2 && __GNUC_MINOR__ < 7) || defined(__STRICT_ANSI__)
-+#  define __format__ format
-+#  define __printf__ printf
-+# endif
-+#endif
-+
-+/* GCC 2.95 and later have "__restrict"; C99 compilers have
-+   "restrict", and "configure" may have defined "restrict".  */
-+#ifndef __restrict
-+# if ! (2 < __GNUC__ || (2 == __GNUC__ && 95 <= __GNUC_MINOR__))
-+#  if defined restrict || 199901L <= __STDC_VERSION__
-+#   define __restrict restrict
-+#  else
-+#   define __restrict
-+#  endif
-+# endif
-+#endif
-+
-+#ifndef __error_t_defined
-+typedef int error_t;
-+# define __error_t_defined
-+#endif
-+
-+#ifdef  __cplusplus
-+extern "C" {
-+#endif
-+
-+/* A description of a particular option.  A pointer to an array of
-+   these is passed in the OPTIONS field of an argp structure.  Each option
-+   entry can correspond to one long option and/or one short option; more
-+   names for the same option can be added by following an entry in an option
-+   array with options having the OPTION_ALIAS flag set.  */
-+struct argp_option
-+{
-+  /* The long option name.  For more than one name for the same option, you
-+     can use following options with the OPTION_ALIAS flag set.  */
-+  __const char *name;
-+
-+  /* What key is returned for this option.  If > 0 and printable, then it's
-+     also accepted as a short option.  */
-+  int key;
-+
-+  /* If non-NULL, this is the name of the argument associated with this
-+     option, which is required unless the OPTION_ARG_OPTIONAL flag is set. */
-+  __const char *arg;
-+
-+  /* OPTION_ flags.  */
-+  int flags;
-+
-+  /* The doc string for this option.  If both NAME and KEY are 0, This string
-+     will be printed outdented from the normal option column, making it
-+     useful as a group header (it will be the first thing printed in its
-+     group); in this usage, it's conventional to end the string with a `:'.  */
-+  __const char *doc;
-+
-+  /* The group this option is in.  In a long help message, options are sorted
-+     alphabetically within each group, and the groups presented in the order
-+     0, 1, 2, ..., n, -m, ..., -2, -1.  Every entry in an options array with
-+     if this field 0 will inherit the group number of the previous entry, or
-+     zero if it's the first one, unless its a group header (NAME and KEY both
-+     0), in which case, the previous entry + 1 is the default.  Automagic
-+     options such as --help are put into group -1.  */
-+  int group;
-+};
-+
-+/* The argument associated with this option is optional.  */
-+#define OPTION_ARG_OPTIONAL	0x1
-+
-+/* This option isn't displayed in any help messages.  */
-+#define OPTION_HIDDEN	       	0x2
-+
-+/* This option is an alias for the closest previous non-alias option.  This
-+   means that it will be displayed in the same help entry, and will inherit
-+   fields other than NAME and KEY from the aliased option.  */
-+#define OPTION_ALIAS		0x4
-+
-+/* This option isn't actually an option (and so should be ignored by the
-+   actual option parser), but rather an arbitrary piece of documentation that
-+   should be displayed in much the same manner as the options.  If this flag
-+   is set, then the option NAME field is displayed unmodified (e.g., no `--'
-+   prefix is added) at the left-margin (where a *short* option would normally
-+   be displayed), and the documentation string in the normal place.  For
-+   purposes of sorting, any leading whitespace and punctuation is ignored,
-+   except that if the first non-whitespace character is not `-', this entry
-+   is displayed after all options (and OPTION_DOC entries with a leading `-')
-+   in the same group.  */
-+#define OPTION_DOC		0x8
-+
-+/* This option shouldn't be included in `long' usage messages (but is still
-+   included in help messages).  This is mainly intended for options that are
-+   completely documented in an argp's ARGS_DOC field, in which case including
-+   the option in the generic usage list would be redundant.  For instance,
-+   if ARGS_DOC is "FOO BAR\n-x BLAH", and the `-x' option's purpose is to
-+   distinguish these two cases, -x should probably be marked
-+   OPTION_NO_USAGE.  */
-+#define OPTION_NO_USAGE		0x10
-+
-+struct argp;			/* fwd declare this type */
-+struct argp_state;		/* " */
-+struct argp_child;		/* " */
-+
-+/* The type of a pointer to an argp parsing function.  */
-+typedef error_t (*argp_parser_t) (int __key, char *__arg,
-+				  struct argp_state *__state);
-+
-+/* What to return for unrecognized keys.  For special ARGP_KEY_ keys, such
-+   returns will simply be ignored.  For user keys, this error will be turned
-+   into EINVAL (if the call to argp_parse is such that errors are propagated
-+   back to the user instead of exiting); returning EINVAL itself would result
-+   in an immediate stop to parsing in *all* cases.  */
-+#define ARGP_ERR_UNKNOWN	E2BIG /* Hurd should never need E2BIG.  XXX */
-+
-+/* Special values for the KEY argument to an argument parsing function.
-+   ARGP_ERR_UNKNOWN should be returned if they aren't understood.
-+
-+   The sequence of keys to a parsing function is either (where each
-+   uppercased word should be prefixed by `ARGP_KEY_' and opt is a user key):
-+
-+       INIT opt... NO_ARGS END SUCCESS  -- No non-option arguments at all
-+   or  INIT (opt | ARG)... END SUCCESS  -- All non-option args parsed
-+   or  INIT (opt | ARG)... SUCCESS      -- Some non-option arg unrecognized
-+
-+   The third case is where every parser returned ARGP_KEY_UNKNOWN for an
-+   argument, in which case parsing stops at that argument (returning the
-+   unparsed arguments to the caller of argp_parse if requested, or stopping
-+   with an error message if not).
-+
-+   If an error occurs (either detected by argp, or because the parsing
-+   function returned an error value), then the parser is called with
-+   ARGP_KEY_ERROR, and no further calls are made.  */
-+
-+/* This is not an option at all, but rather a command line argument.  If a
-+   parser receiving this key returns success, the fact is recorded, and the
-+   ARGP_KEY_NO_ARGS case won't be used.  HOWEVER, if while processing the
-+   argument, a parser function decrements the NEXT field of the state it's
-+   passed, the option won't be considered processed; this is to allow you to
-+   actually modify the argument (perhaps into an option), and have it
-+   processed again.  */
-+#define ARGP_KEY_ARG		0
-+/* There are remaining arguments not parsed by any parser, which may be found
-+   starting at (STATE->argv + STATE->next).  If success is returned, but
-+   STATE->next left untouched, it's assumed that all arguments were consume,
-+   otherwise, the parser should adjust STATE->next to reflect any arguments
-+   consumed.  */
-+#define ARGP_KEY_ARGS		0x1000006
-+/* There are no more command line arguments at all.  */
-+#define ARGP_KEY_END		0x1000001
-+/* Because it's common to want to do some special processing if there aren't
-+   any non-option args, user parsers are called with this key if they didn't
-+   successfully process any non-option arguments.  Called just before
-+   ARGP_KEY_END (where more general validity checks on previously parsed
-+   arguments can take place).  */
-+#define ARGP_KEY_NO_ARGS	0x1000002
-+/* Passed in before any parsing is done.  Afterwards, the values of each
-+   element of the CHILD_INPUT field, if any, in the state structure is
-+   copied to each child's state to be the initial value of the INPUT field.  */
-+#define ARGP_KEY_INIT		0x1000003
-+/* Use after all other keys, including SUCCESS & END.  */
-+#define ARGP_KEY_FINI		0x1000007
-+/* Passed in when parsing has successfully been completed (even if there are
-+   still arguments remaining).  */
-+#define ARGP_KEY_SUCCESS	0x1000004
-+/* Passed in if an error occurs.  */
-+#define ARGP_KEY_ERROR		0x1000005
-+
-+/* An argp structure contains a set of options declarations, a function to
-+   deal with parsing one, documentation string, a possible vector of child
-+   argp's, and perhaps a function to filter help output.  When actually
-+   parsing options, getopt is called with the union of all the argp
-+   structures chained together through their CHILD pointers, with conflicts
-+   being resolved in favor of the first occurrence in the chain.  */
-+struct argp
-+{
-+  /* An array of argp_option structures, terminated by an entry with both
-+     NAME and KEY having a value of 0.  */
-+  __const struct argp_option *options;
-+
-+  /* What to do with an option from this structure.  KEY is the key
-+     associated with the option, and ARG is any associated argument (NULL if
-+     none was supplied).  If KEY isn't understood, ARGP_ERR_UNKNOWN should be
-+     returned.  If a non-zero, non-ARGP_ERR_UNKNOWN value is returned, then
-+     parsing is stopped immediately, and that value is returned from
-+     argp_parse().  For special (non-user-supplied) values of KEY, see the
-+     ARGP_KEY_ definitions below.  */
-+  argp_parser_t parser;
-+
-+  /* A string describing what other arguments are wanted by this program.  It
-+     is only used by argp_usage to print the `Usage:' message.  If it
-+     contains newlines, the strings separated by them are considered
-+     alternative usage patterns, and printed on separate lines (lines after
-+     the first are prefix by `  or: ' instead of `Usage:').  */
-+  __const char *args_doc;
-+
-+  /* If non-NULL, a string containing extra text to be printed before and
-+     after the options in a long help message (separated by a vertical tab
-+     `\v' character).  */
-+  __const char *doc;
-+
-+  /* A vector of argp_children structures, terminated by a member with a 0
-+     argp field, pointing to child argps should be parsed with this one.  Any
-+     conflicts are resolved in favor of this argp, or early argps in the
-+     CHILDREN list.  This field is useful if you use libraries that supply
-+     their own argp structure, which you want to use in conjunction with your
-+     own.  */
-+  __const struct argp_child *children;
-+
-+  /* If non-zero, this should be a function to filter the output of help
-+     messages.  KEY is either a key from an option, in which case TEXT is
-+     that option's help text, or a special key from the ARGP_KEY_HELP_
-+     defines, below, describing which other help text TEXT is.  The function
-+     should return either TEXT, if it should be used as-is, a replacement
-+     string, which should be malloced, and will be freed by argp, or NULL,
-+     meaning `print nothing'.  The value for TEXT is *after* any translation
-+     has been done, so if any of the replacement text also needs translation,
-+     that should be done by the filter function.  INPUT is either the input
-+     supplied to argp_parse, or NULL, if argp_help was called directly.  */
-+  char *(*help_filter) (int __key, __const char *__text, void *__input);
-+
-+  /* If non-zero the strings used in the argp library are translated using
-+     the domain described by this string.  Otherwise the currently installed
-+     default domain is used.  */
-+  const char *argp_domain;
-+};
-+
-+/* Possible KEY arguments to a help filter function.  */
-+#define ARGP_KEY_HELP_PRE_DOC	0x2000001 /* Help text preceeding options. */
-+#define ARGP_KEY_HELP_POST_DOC	0x2000002 /* Help text following options. */
-+#define ARGP_KEY_HELP_HEADER	0x2000003 /* Option header string. */
-+#define ARGP_KEY_HELP_EXTRA	0x2000004 /* After all other documentation;
-+					     TEXT is NULL for this key.  */
-+/* Explanatory note emitted when duplicate option arguments have been
-+   suppressed.  */
-+#define ARGP_KEY_HELP_DUP_ARGS_NOTE 0x2000005
-+#define ARGP_KEY_HELP_ARGS_DOC	0x2000006 /* Argument doc string.  */
-+
-+/* When an argp has a non-zero CHILDREN field, it should point to a vector of
-+   argp_child structures, each of which describes a subsidiary argp.  */
-+struct argp_child
-+{
-+  /* The child parser.  */
-+  __const struct argp *argp;
-+
-+  /* Flags for this child.  */
-+  int flags;
-+
-+  /* If non-zero, an optional header to be printed in help output before the
-+     child options.  As a side-effect, a non-zero value forces the child
-+     options to be grouped together; to achieve this effect without actually
-+     printing a header string, use a value of "".  */
-+  __const char *header;
-+
-+  /* Where to group the child options relative to the other (`consolidated')
-+     options in the parent argp; the values are the same as the GROUP field
-+     in argp_option structs, but all child-groupings follow parent options at
-+     a particular group level.  If both this field and HEADER are zero, then
-+     they aren't grouped at all, but rather merged with the parent options
-+     (merging the child's grouping levels with the parents).  */
-+  int group;
-+};
-+
-+/* Parsing state.  This is provided to parsing functions called by argp,
-+   which may examine and, as noted, modify fields.  */
-+struct argp_state
-+{
-+  /* The top level ARGP being parsed.  */
-+  __const struct argp *root_argp;
-+
-+  /* The argument vector being parsed.  May be modified.  */
-+  int argc;
-+  char **argv;
-+
-+  /* The index in ARGV of the next arg that to be parsed.  May be modified. */
-+  int next;
-+
-+  /* The flags supplied to argp_parse.  May be modified.  */
-+  unsigned flags;
-+
-+  /* While calling a parsing function with a key of ARGP_KEY_ARG, this is the
-+     number of the current arg, starting at zero, and incremented after each
-+     such call returns.  At all other times, this is the number of such
-+     arguments that have been processed.  */
-+  unsigned arg_num;
-+
-+  /* If non-zero, the index in ARGV of the first argument following a special
-+     `--' argument (which prevents anything following being interpreted as an
-+     option).  Only set once argument parsing has proceeded past this point. */
-+  int quoted;
-+
-+  /* An arbitrary pointer passed in from the user.  */
-+  void *input;
-+  /* Values to pass to child parsers.  This vector will be the same length as
-+     the number of children for the current parser.  */
-+  void **child_inputs;
-+
-+  /* For the parser's use.  Initialized to 0.  */
-+  void *hook;
-+
-+  /* The name used when printing messages.  This is initialized to ARGV[0],
-+     or PROGRAM_INVOCATION_NAME if that is unavailable.  */
-+  char *name;
-+
-+  /* Streams used when argp prints something.  */
-+  FILE *err_stream;		/* For errors; initialized to stderr. */
-+  FILE *out_stream;		/* For information; initialized to stdout. */
-+
-+  void *pstate;			/* Private, for use by argp.  */
-+};
-+
-+/* Flags for argp_parse (note that the defaults are those that are
-+   convenient for program command line parsing): */
-+
-+/* Don't ignore the first element of ARGV.  Normally (and always unless
-+   ARGP_NO_ERRS is set) the first element of the argument vector is
-+   skipped for option parsing purposes, as it corresponds to the program name
-+   in a command line.  */
-+#define ARGP_PARSE_ARGV0  0x01
-+
-+/* Don't print error messages for unknown options to stderr; unless this flag
-+   is set, ARGP_PARSE_ARGV0 is ignored, as ARGV[0] is used as the program
-+   name in the error messages.  This flag implies ARGP_NO_EXIT (on the
-+   assumption that silent exiting upon errors is bad behaviour).  */
-+#define ARGP_NO_ERRS	0x02
-+
-+/* Don't parse any non-option args.  Normally non-option args are parsed by
-+   calling the parse functions with a key of ARGP_KEY_ARG, and the actual arg
-+   as the value.  Since it's impossible to know which parse function wants to
-+   handle it, each one is called in turn, until one returns 0 or an error
-+   other than ARGP_ERR_UNKNOWN; if an argument is handled by no one, the
-+   argp_parse returns prematurely (but with a return value of 0).  If all
-+   args have been parsed without error, all parsing functions are called one
-+   last time with a key of ARGP_KEY_END.  This flag needn't normally be set,
-+   as the normal behavior is to stop parsing as soon as some argument can't
-+   be handled.  */
-+#define ARGP_NO_ARGS	0x04
-+
-+/* Parse options and arguments in the same order they occur on the command
-+   line -- normally they're rearranged so that all options come first. */
-+#define ARGP_IN_ORDER	0x08
-+
-+/* Don't provide the standard long option --help, which causes usage and
-+      option help information to be output to stdout, and exit (0) called. */
-+#define ARGP_NO_HELP	0x10
-+
-+/* Don't exit on errors (they may still result in error messages).  */
-+#define ARGP_NO_EXIT	0x20
-+
-+/* Use the gnu getopt `long-only' rules for parsing arguments.  */
-+#define ARGP_LONG_ONLY	0x40
-+
-+/* Turns off any message-printing/exiting options.  */
-+#define ARGP_SILENT    (ARGP_NO_EXIT | ARGP_NO_ERRS | ARGP_NO_HELP)
-+
-+/* Parse the options strings in ARGC & ARGV according to the options in ARGP.
-+   FLAGS is one of the ARGP_ flags above.  If ARG_INDEX is non-NULL, the
-+   index in ARGV of the first unparsed option is returned in it.  If an
-+   unknown option is present, ARGP_ERR_UNKNOWN is returned; if some parser
-+   routine returned a non-zero value, it is returned; otherwise 0 is
-+   returned.  This function may also call exit unless the ARGP_NO_HELP flag
-+   is set.  INPUT is a pointer to a value to be passed in to the parser.  */
-+extern error_t argp_parse (__const struct argp *__restrict __argp,
-+			   int __argc, char **__restrict __argv,
-+			   unsigned __flags, int *__restrict __arg_index,
-+			   void *__restrict __input);
-+
-+/* Global variables.  */
-+
-+/* If defined or set by the user program to a non-zero value, then a default
-+   option --version is added (unless the ARGP_NO_HELP flag is used), which
-+   will print this string followed by a newline and exit (unless the
-+   ARGP_NO_EXIT flag is used).  Overridden by ARGP_PROGRAM_VERSION_HOOK.  */
-+extern __const char *argp_program_version;
-+
-+/* If defined or set by the user program to a non-zero value, then a default
-+   option --version is added (unless the ARGP_NO_HELP flag is used), which
-+   calls this function with a stream to print the version to and a pointer to
-+   the current parsing state, and then exits (unless the ARGP_NO_EXIT flag is
-+   used).  This variable takes precedent over ARGP_PROGRAM_VERSION.  */
-+extern void (*argp_program_version_hook) (FILE *__restrict __stream,
-+					  struct argp_state *__restrict
-+					  __state);
-+
-+/* If defined or set by the user program, it should point to string that is
-+   the bug-reporting address for the program.  It will be printed by
-+   argp_help if the ARGP_HELP_BUG_ADDR flag is set (as it is by various
-+   standard help messages), embedded in a sentence that says something like
-+   `Report bugs to ADDR.'.  */
-+extern __const char *argp_program_bug_address;
-+
-+/* The exit status that argp will use when exiting due to a parsing error.
-+   If not defined or set by the user program, this defaults to EX_USAGE from
-+   <sysexits.h>.  */
-+extern error_t argp_err_exit_status;
-+
-+/* Flags for argp_help.  */
-+#define ARGP_HELP_USAGE		0x01 /* a Usage: message. */
-+#define ARGP_HELP_SHORT_USAGE	0x02 /*  " but don't actually print options. */
-+#define ARGP_HELP_SEE		0x04 /* a `Try ... for more help' message. */
-+#define ARGP_HELP_LONG		0x08 /* a long help message. */
-+#define ARGP_HELP_PRE_DOC	0x10 /* doc string preceding long help.  */
-+#define ARGP_HELP_POST_DOC	0x20 /* doc string following long help.  */
-+#define ARGP_HELP_DOC		(ARGP_HELP_PRE_DOC | ARGP_HELP_POST_DOC)
-+#define ARGP_HELP_BUG_ADDR	0x40 /* bug report address */
-+#define ARGP_HELP_LONG_ONLY	0x80 /* modify output appropriately to
-+					reflect ARGP_LONG_ONLY mode.  */
-+
-+/* These ARGP_HELP flags are only understood by argp_state_help.  */
-+#define ARGP_HELP_EXIT_ERR	0x100 /* Call exit(1) instead of returning.  */
-+#define ARGP_HELP_EXIT_OK	0x200 /* Call exit(0) instead of returning.  */
-+
-+/* The standard thing to do after a program command line parsing error, if an
-+   error message has already been printed.  */
-+#define ARGP_HELP_STD_ERR \
-+  (ARGP_HELP_SEE | ARGP_HELP_EXIT_ERR)
-+/* The standard thing to do after a program command line parsing error, if no
-+   more specific error message has been printed.  */
-+#define ARGP_HELP_STD_USAGE \
-+  (ARGP_HELP_SHORT_USAGE | ARGP_HELP_SEE | ARGP_HELP_EXIT_ERR)
-+/* The standard thing to do in response to a --help option.  */
-+#define ARGP_HELP_STD_HELP \
-+  (ARGP_HELP_SHORT_USAGE | ARGP_HELP_LONG | ARGP_HELP_EXIT_OK \
-+   | ARGP_HELP_DOC | ARGP_HELP_BUG_ADDR)
-+
-+/* Output a usage message for ARGP to STREAM.  FLAGS are from the set
-+   ARGP_HELP_*.  */
-+extern void argp_help (__const struct argp *__restrict __argp,
-+		       FILE *__restrict __stream,
-+		       unsigned __flags, char *__restrict __name);
-+
-+/* The following routines are intended to be called from within an argp
-+   parsing routine (thus taking an argp_state structure as the first
-+   argument).  They may or may not print an error message and exit, depending
-+   on the flags in STATE -- in any case, the caller should be prepared for
-+   them *not* to exit, and should return an appropiate error after calling
-+   them.  [argp_usage & argp_error should probably be called argp_state_...,
-+   but they're used often enough that they should be short]  */
-+
-+/* Output, if appropriate, a usage message for STATE to STREAM.  FLAGS are
-+   from the set ARGP_HELP_*.  */
-+extern void argp_state_help (__const struct argp_state *__restrict __state,
-+			     FILE *__restrict __stream,
-+			     unsigned int __flags);
-+/* Possibly output the standard usage message for ARGP to stderr and exit.  */
-+extern void argp_usage (__const struct argp_state *__state);
-+
-+/* If appropriate, print the printf string FMT and following args, preceded
-+   by the program name and `:', to stderr, and followed by a `Try ... --help'
-+   message, then exit (1).  */
-+extern void argp_error (__const struct argp_state *__restrict __state,
-+			__const char *__restrict __fmt, ...)
-+     __attribute__ ((__format__ (__printf__, 2, 3)));
-+/* Similar to the standard gnu error-reporting function error(), but will
-+   respect the ARGP_NO_EXIT and ARGP_NO_ERRS flags in STATE, and will print
-+   to STATE->err_stream.  This is useful for argument parsing code that is
-+   shared between program startup (when exiting is desired) and runtime
-+   option parsing (when typically an error code is returned instead).  The
-+   difference between this function and argp_error is that the latter is for
-+   *parsing errors*, and the former is for other problems that occur during
-+   parsing but don't reflect a (syntactic) problem with the input.  */
-+extern void argp_failure (__const struct argp_state *__restrict __state,
-+			  int __status, int __errnum,
-+			  __const char *__restrict __fmt, ...)
-+     __attribute__ ((__format__ (__printf__, 4, 5)));
-+/* Returns true if the option OPT is a valid short option.  */
-+extern int _option_is_short (__const struct argp_option *__opt) __THROW;
-+extern int __option_is_short (__const struct argp_option *__opt) __THROW;
-+
-+/* Returns true if the option OPT is in fact the last (unused) entry in an
-+   options array.  */
-+extern int _option_is_end (__const struct argp_option *__opt) __THROW;
-+extern int __option_is_end (__const struct argp_option *__opt) __THROW;
-+
-+/* Return the input field for ARGP in the parser corresponding to STATE; used
-+   by the help routines.  */
-+/* We think this should not be exported */
-+extern void *__argp_input (__const struct argp *__restrict __argp,
-+			   __const struct argp_state *__restrict __state)
-+     __THROW;
-+
-+#ifdef __USE_EXTERN_INLINES
-+
-+# ifndef ARGP_EI
-+#  define ARGP_EI __extern_inline
-+# endif
-+
-+ARGP_EI void
-+argp_usage (__const struct argp_state *__state)
-+{
-+  argp_state_help (__state, stderr, ARGP_HELP_STD_USAGE);
-+}
-+
-+ARGP_EI int
-+__NTH (__option_is_short (__const struct argp_option *__opt))
-+{
-+  if (__opt->flags & OPTION_DOC)
-+    return 0;
-+  else
-+    {
-+      int __key = __opt->key;
-+      return __key > 0 && __key <= UCHAR_MAX && isprint (__key);
-+    }
-+}
-+
-+ARGP_EI int
-+__NTH (__option_is_end (__const struct argp_option *__opt))
-+{
-+  return !__opt->key && !__opt->name && !__opt->doc && !__opt->group;
-+}
-+#endif /* Use extern inlines.  */
-+
-+#ifdef  __cplusplus
-+}
-+#endif
-+
-+#endif /* argp.h */
diff --git a/meta/recipes-core/uclibc/uclibc-git/compile-arm-fork-with-O2.patch b/meta/recipes-core/uclibc/uclibc-git/compile-arm-fork-with-O2.patch
deleted file mode 100644
index 15ee0ca..0000000
--- a/meta/recipes-core/uclibc/uclibc-git/compile-arm-fork-with-O2.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-When compiling in thumb mode for arm with -Os gcc gives up since it can not find registers
-to spill. So we use -O2 option for compiling fork.c It may be addressable in gcc.
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
-
-diff --git a/libpthread/nptl/sysdeps/unix/sysv/linux/arm/Makefile.arch b/libpthread/nptl/sysdeps/unix/sysv/linux/arm/Makefile.arch
-index 329d8a9..41e3646 100644
---- a/libpthread/nptl/sysdeps/unix/sysv/linux/arm/Makefile.arch
-+++ b/libpthread/nptl/sysdeps/unix/sysv/linux/arm/Makefile.arch
-@@ -30,3 +30,9 @@ CFLAGS-OMIT-libc-lowlevellock.c = -DNOT_IN_libc -DIS_IN_libpthread
- # This macro should be alternatively implemented in THUMB
- # assembly.
- ASFLAGS-vfork.S = -marm
-+
-+# For arm fork.c does not compile with -Os when in compiling
-+# in thumb1 mode
-+ifeq ($(COMPILE_IN_THUMB_MODE),y)
-+CFLAGS-fork.c = -O2
-+endif
diff --git a/meta/recipes-core/uclibc/uclibc-git/ldso-mark-_dl_exit-as-noreturn.patch b/meta/recipes-core/uclibc/uclibc-git/ldso-mark-_dl_exit-as-noreturn.patch
deleted file mode 100644
index 5279f8a..0000000
--- a/meta/recipes-core/uclibc/uclibc-git/ldso-mark-_dl_exit-as-noreturn.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 2c8a7766681b704e710f51c0817534e3f9a952d1 Mon Sep 17 00:00:00 2001
-From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
-Date: Thu, 26 Mar 2015 00:02:58 +0100
-Subject: [PATCH] ldso: mark _dl_exit as noreturn
-
-Otherwise gcc might not understand that oom() ended control-flow and
-might emit an (untaken) reference to abort() in _dl_update_slotinfo()
-on e.g. SH4 which breaks linking ld-uClibc.so.
-Arguably -ffreestanding should prevent GCC from emitting this
-'.global abort' but alas, it does not, which is another bug..
-
-Also mark the function cold to further lower the incoming frequency and
-branch probability.
-
-Upstream-Status: Backport
-
-  http://git.uclibc.org/uClibc/commit/?id=2c8a7766681b704e710f51c0817534e3f9a952d1
-
-Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
-Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
----
- ldso/include/dl-syscall.h | 10 +++++++++-
- 1 file changed, 9 insertions(+), 1 deletion(-)
-
-diff --git a/ldso/include/dl-syscall.h b/ldso/include/dl-syscall.h
-index 675b93a..e556f7b 100644
---- a/ldso/include/dl-syscall.h
-+++ b/ldso/include/dl-syscall.h
-@@ -52,7 +52,15 @@ extern int _dl_errno;
-    dynamic linking at all, so we cannot return any error codes.
-    We just punt if there is an error. */
- #define __NR__dl_exit __NR_exit
--static __always_inline _syscall1(void, _dl_exit, int, status)
-+static __always_inline attribute_noreturn __cold void _dl_exit(int status)
-+{
-+	INLINE_SYSCALL(_dl_exit, 1, status);
-+#if defined __GNUC__
-+	__builtin_unreachable(); /* shut up warning: 'noreturn' function does return*/
-+#else
-+	while (1);
-+#endif
-+}
- 
- #define __NR__dl_close __NR_close
- static __always_inline _syscall1(int, _dl_close, int, fd)
--- 
-1.9.1
-
diff --git a/meta/recipes-core/uclibc/uclibc-git/remove_attribute_optimize_Os.patch b/meta/recipes-core/uclibc/uclibc-git/remove_attribute_optimize_Os.patch
deleted file mode 100644
index fb52faa..0000000
--- a/meta/recipes-core/uclibc/uclibc-git/remove_attribute_optimize_Os.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Dont support localised optimizations this helps to have a global -O level
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
-
-Index: git/libpthread/nptl/pthread_mutex_timedlock.c
-===================================================================
---- git.orig/libpthread/nptl/pthread_mutex_timedlock.c	2014-08-25 10:58:06.000000000 -0700
-+++ git/libpthread/nptl/pthread_mutex_timedlock.c	2014-08-25 11:00:42.078242266 -0700
-@@ -28,7 +28,9 @@
-  * error: can't find a register in class ‘GENERAL_REGS’ while reloading ‘asm’
-  */
- int
-+#ifndef  __OPTIMIZE__
- attribute_optimize("Os")
-+#endif
- pthread_mutex_timedlock (
-      pthread_mutex_t *mutex,
-      const struct timespec *abstime)
diff --git a/meta/recipes-core/uclibc/uclibc-git/uclibc_enable_log2_test.patch b/meta/recipes-core/uclibc/uclibc-git/uclibc_enable_log2_test.patch
deleted file mode 100644
index 37a5988..0000000
--- a/meta/recipes-core/uclibc/uclibc-git/uclibc_enable_log2_test.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-uclibc now has log2 so enable the tests
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
-
-Index: uClibc/test/math/libm-test.inc
-===================================================================
---- uClibc/test/math/libm-test.inc	(revision 23784)
-+++ uClibc/test/math/libm-test.inc	(working copy)
-@@ -3414,7 +3414,6 @@
- }
- 
- 
--#if 0
- static void
- log2_test (void)
- {
-@@ -3444,7 +3443,6 @@
- 
-   END (log2);
- }
--#endif
- 
- 
- static void
-@@ -4967,9 +4965,7 @@
-   log_test ();
-   log10_test ();
-   log1p_test ();
--#if 0
-   log2_test ();
--#endif
-   logb_test ();
-   modf_test ();
-   ilogb_test ();
diff --git a/meta/recipes-core/uclibc/uclibc.inc b/meta/recipes-core/uclibc/uclibc.inc
index c483228..533aa3d 100644
--- a/meta/recipes-core/uclibc/uclibc.inc
+++ b/meta/recipes-core/uclibc/uclibc.inc
@@ -21,7 +21,7 @@ PATH_prepend = "${STAGING_BINDIR_TOOLCHAIN}.${STAGINGCC}:"
 TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_TCBOOTSTRAP}"
 
 # siteconfig.bbclass runs configure which needs a working compiler
-# For the compiler to work we need a working libc yet libc isn't 
+# For the compiler to work we need a working libc yet libc isn't
 # in the sysroots directory at this point. This means the libc.so
 # linker script won't work as the --sysroot setting isn't correct.
 # Here we create a hacked up libc linker script and pass in the right
-- 
2.1.4


