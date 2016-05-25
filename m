Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 0ED5B731BC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 13:29:53 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 25 May 2016 06:29:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,364,1459839600"; d="scan'208";a="988474093"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga002.fm.intel.com with ESMTP; 25 May 2016 06:29:54 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 May 2016 16:29:40 +0300
Message-Id: <437ddd2e733ea065c04504037c9209438020a695.1464176988.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <ade23f378a1dc2d3153dd71e6a00c65c6c56e8f0.1464176988.git.jussi.kukkonen@intel.com>
References: <ade23f378a1dc2d3153dd71e6a00c65c6c56e8f0.1464176988.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1464176988.git.jussi.kukkonen@intel.com>
References: <cover.1464176988.git.jussi.kukkonen@intel.com>
Subject: [PATCH 7/7] libgpg-error: Upgrade 1.21 -> 1.22
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
X-List-Received-Date: Wed, 25 May 2016 13:29:53 -0000

License checksum changes are not license changes.
Remove a patch that's in upstream now.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../0001-libgpg-error-Add-nios2-support.patch      | 46 ----------------------
 .../{libgpg-error_1.21.bb => libgpg-error_1.22.bb} |  9 ++---
 2 files changed, 4 insertions(+), 51 deletions(-)
 delete mode 100644 meta/recipes-support/libgpg-error/libgpg-error/0001-libgpg-error-Add-nios2-support.patch
 rename meta/recipes-support/libgpg-error/{libgpg-error_1.21.bb => libgpg-error_1.22.bb} (78%)

diff --git a/meta/recipes-support/libgpg-error/libgpg-error/0001-libgpg-error-Add-nios2-support.patch b/meta/recipes-support/libgpg-error/libgpg-error/0001-libgpg-error-Add-nios2-support.patch
deleted file mode 100644
index dab1c13..0000000
--- a/meta/recipes-support/libgpg-error/libgpg-error/0001-libgpg-error-Add-nios2-support.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From b2af652f43991e4ce6297917da542a9eb5135939 Mon Sep 17 00:00:00 2001
-From: Marek Vasut <marex@denx.de>
-Date: Thu, 17 Sep 2015 03:28:06 +0200
-Subject: [PATCH] libgpg-error: Add nios2 support
-
-Add configuration for the NIOS2 processor.
-
-Signed-off-by: Marek Vasut <marex@denx.de>
-Upstream-Status: Submitted
----
- src/syscfg/lock-obj-pub.nios2-unknown-linux-gnu.h | 23 +++++++++++++++++++++++
- 1 file changed, 23 insertions(+)
- create mode 100644 src/syscfg/lock-obj-pub.nios2-unknown-linux-gnu.h
-
-diff --git a/src/syscfg/lock-obj-pub.nios2-unknown-linux-gnu.h b/src/syscfg/lock-obj-pub.nios2-unknown-linux-gnu.h
-new file mode 100644
-index 0000000..3a24571
---- /dev/null
-+++ b/src/syscfg/lock-obj-pub.nios2-unknown-linux-gnu.h
-@@ -0,0 +1,23 @@
-+## lock-obj-pub.nios2-unknown-linux-gnu.h
-+## File created by gen-posix-lock-obj - DO NOT EDIT
-+## To be included by mkheader into gpg-error.h
-+
-+typedef struct
-+{
-+  long _vers;
-+  union {
-+    volatile char _priv[24];
-+    long _x_align;
-+    long *_xp_align;
-+  } u;
-+} gpgrt_lock_t;
-+
-+#define GPGRT_LOCK_INITIALIZER {1,{{0,0,0,0,0,0,0,0, \
-+                                    0,0,0,0,0,0,0,0, \
-+                                    0,0,0,0,0,0,0,0}}}
-+##
-+## Local Variables:
-+## mode: c
-+## buffer-read-only: t
-+## End:
-+##
--- 
-2.5.1
-
diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.21.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.22.bb
similarity index 78%
rename from meta/recipes-support/libgpg-error/libgpg-error_1.21.bb
rename to meta/recipes-support/libgpg-error/libgpg-error_1.22.bb
index 9755b07..c58744f 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.21.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.22.bb
@@ -5,18 +5,17 @@ BUGTRACKER = "https://bugs.g10code.com/gnupg/index"
 LICENSE = "GPLv2+ & LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                     file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
-                    file://src/gpg-error.h.in;endline=23;md5=93d3155af141ae3b369a5d09ca9d6234 \
-                    file://src/init.c;endline=20;md5=8f5a9b59634f4aebcd0ec9d3ebd53bfe"
+                    file://src/gpg-error.h.in;endline=23;md5=cf562f60b9dba7df20d6ee3f97ea1d5a \
+                    file://src/init.c;endline=20;md5=872b2389fe9bae7ffb80d2b91225afbc"
 
 
 SECTION = "libs"
 
 SRC_URI = "${GNUPG_MIRROR}/libgpg-error/libgpg-error-${PV}.tar.bz2 \
            file://pkgconfig.patch \
-	   file://0001-libgpg-error-Add-nios2-support.patch \
 	  "
-SRC_URI[md5sum] = "ab0b5aba6d0a185b41d07bda804fd8b2"
-SRC_URI[sha256sum] = "b7dbdb3cad63a740e9f0c632a1da32d4afdb694ec86c8625c98ea0691713b84d"
+SRC_URI[md5sum] = "83c686abe3fa223ec89f3b51da830770"
+SRC_URI[sha256sum] = "f2a04ee6317bdb41a625bea23fdc7f0b5a63fb677f02447c647ed61fb9e69d7b"
 
 BINCONFIG = "${bindir}/gpg-error-config"
 
-- 
2.1.4


