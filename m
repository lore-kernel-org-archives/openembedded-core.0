Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 8552876FF2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Sep 2015 14:41:18 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3nH12j5W6Dz3hj6s;
	Thu, 17 Sep 2015 16:31:57 +0200 (CEST)
X-Auth-Info: wIlSk8l0Lz1B19eCvSlVWA3pw2Tz8A+zrV1fqIJXS+g=
Received: from chi.lan (host-82-135-33-74.customer.m-online.net [82.135.33.74])
	by smtp-auth.mnet-online.de (Postfix) with ESMTPA id 3nH12j3B0qzvhTk;
	Thu, 17 Sep 2015 16:31:57 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Sep 2015 16:31:57 +0200
Message-Id: <1442500317-9064-9-git-send-email-marex@denx.de>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1442500317-9064-1-git-send-email-marex@denx.de>
References: <1442500317-9064-1-git-send-email-marex@denx.de>
Cc: Marek Vasut <marex@denx.de>, lftan@altera.com, waltergoossens@home.nl
Subject: [PATCH 8/8] libgpg-error: Add support for nios2
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
X-List-Received-Date: Thu, 17 Sep 2015 14:41:18 -0000

Add a patch which adds a configuration for the nios2 processor.

Signed-off-by: Marek Vasut <marex@denx.de>
---
 .../0001-libgpg-error-Add-nios2-support.patch      | 45 ++++++++++++++++++++++
 .../libgpg-error/libgpg-error_1.19.bb              |  4 +-
 2 files changed, 48 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libgpg-error/libgpg-error/0001-libgpg-error-Add-nios2-support.patch

diff --git a/meta/recipes-support/libgpg-error/libgpg-error/0001-libgpg-error-Add-nios2-support.patch b/meta/recipes-support/libgpg-error/libgpg-error/0001-libgpg-error-Add-nios2-support.patch
new file mode 100644
index 0000000..8362c69
--- /dev/null
+++ b/meta/recipes-support/libgpg-error/libgpg-error/0001-libgpg-error-Add-nios2-support.patch
@@ -0,0 +1,45 @@
+From b2af652f43991e4ce6297917da542a9eb5135939 Mon Sep 17 00:00:00 2001
+From: Marek Vasut <marex@denx.de>
+Date: Thu, 17 Sep 2015 03:28:06 +0200
+Subject: [PATCH] libgpg-error: Add nios2 support
+
+Add configuration for the NIOS2 processor.
+
+Signed-off-by: Marek Vasut <marex@denx.de>
+---
+ src/syscfg/lock-obj-pub.nios2-unknown-linux-gnu.h | 23 +++++++++++++++++++++++
+ 1 file changed, 23 insertions(+)
+ create mode 100644 src/syscfg/lock-obj-pub.nios2-unknown-linux-gnu.h
+
+diff --git a/src/syscfg/lock-obj-pub.nios2-unknown-linux-gnu.h b/src/syscfg/lock-obj-pub.nios2-unknown-linux-gnu.h
+new file mode 100644
+index 0000000..3a24571
+--- /dev/null
++++ b/src/syscfg/lock-obj-pub.nios2-unknown-linux-gnu.h
+@@ -0,0 +1,23 @@
++## lock-obj-pub.nios2-unknown-linux-gnu.h
++## File created by gen-posix-lock-obj - DO NOT EDIT
++## To be included by mkheader into gpg-error.h
++
++typedef struct
++{
++  long _vers;
++  union {
++    volatile char _priv[24];
++    long _x_align;
++    long *_xp_align;
++  } u;
++} gpgrt_lock_t;
++
++#define GPGRT_LOCK_INITIALIZER {1,{{0,0,0,0,0,0,0,0, \
++                                    0,0,0,0,0,0,0,0, \
++                                    0,0,0,0,0,0,0,0}}}
++##
++## Local Variables:
++## mode: c
++## buffer-read-only: t
++## End:
++##
+-- 
+2.5.1
+
diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.19.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.19.bb
index 39dbbcf..c69930a 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.19.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.19.bb
@@ -12,7 +12,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 SECTION = "libs"
 
 SRC_URI = "ftp://ftp.gnupg.org/gcrypt/libgpg-error/libgpg-error-${PV}.tar.bz2 \
-           file://pkgconfig.patch"
+           file://pkgconfig.patch \
+	   file://0001-libgpg-error-Add-nios2-support.patch \
+	  "
 SRC_URI[md5sum] = "c04c16245b92829281f43b5bef7d16da"
 SRC_URI[sha256sum] = "53120e1333d5c5d28d87ff2854e9e98719c8e214152f17ad5291704d25c4978b"
 
-- 
2.1.4


