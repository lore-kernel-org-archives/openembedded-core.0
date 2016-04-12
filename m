Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 70C68605BB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 11:05:00 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 12 Apr 2016 04:04:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,473,1455004800"; d="scan'208";a="943406431"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 12 Apr 2016 04:04:49 -0700
Received: from mbabyjoh-desk.ger.corp.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 0345C6A4002
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 04:52:27 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Apr 2016 14:05:12 +0300
Message-Id: <1460459112-11988-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH] kbd: remove uclibc-stdarg.patch
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
X-List-Received-Date: Tue, 12 Apr 2016 11:05:03 -0000

Remove uclibc-stdarg.patch as it is already available in kbd 2.0.3
release.

commit id: b8ef7897867cb1ba1b9f87d004674133c291b1b0
Author: Mike Frysinger <vapier@gentoo.org>
Date:   Mon Jan 6 10:27:56 2014 -0500
  libkeymap: include stdarg.h where used

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-core/kbd/kbd/uclibc-stdarg.patch | 36 ---------------------------
 meta/recipes-core/kbd/kbd_2.0.3.bb            |  1 -
 2 files changed, 37 deletions(-)
 delete mode 100644 meta/recipes-core/kbd/kbd/uclibc-stdarg.patch

diff --git a/meta/recipes-core/kbd/kbd/uclibc-stdarg.patch b/meta/recipes-core/kbd/kbd/uclibc-stdarg.patch
deleted file mode 100644
index be7f324..0000000
--- a/meta/recipes-core/kbd/kbd/uclibc-stdarg.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-In file included from keymap.h:5:0,
-                 from ksyms.c:6:
-./keymap/common.h:65:38: error: unknown type name 'va_list'
-                  const char *format, va_list args),
-                                      ^
-./keymap/common.h:66:3: error: expected ';', ',' or ')' before 'const'
-   const void *data);
-   ^
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Index: kbd-2.0.0/src/libkeymap/contextP.h
-===================================================================
---- kbd-2.0.0.orig/src/libkeymap/contextP.h	2013-08-13 06:46:23.000000000 -0700
-+++ kbd-2.0.0/src/libkeymap/contextP.h	2013-11-05 22:33:49.200528226 -0800
-@@ -2,7 +2,7 @@
- #define LK_CONTEXTP_H
- 
- #include "keymap.h"
--
-+#include <stdarg.h>
- /**
-  * @brief Copy of struct kbdiacruc.
-  */
-Index: kbd-2.0.0/src/libkeymap/keymap/common.h
-===================================================================
---- kbd-2.0.0.orig/src/libkeymap/keymap/common.h	2013-08-13 06:46:23.000000000 -0700
-+++ kbd-2.0.0/src/libkeymap/keymap/common.h	2013-11-05 22:33:59.964528438 -0800
-@@ -6,6 +6,7 @@
-  */
- 
- #include <keymap/context.h>
-+#include <stdarg.h>
- 
- /** Initializes the structures necessary to read and/or parse keymap.
-  *
diff --git a/meta/recipes-core/kbd/kbd_2.0.3.bb b/meta/recipes-core/kbd/kbd_2.0.3.bb
index 746b68a..858dc05 100644
--- a/meta/recipes-core/kbd/kbd_2.0.3.bb
+++ b/meta/recipes-core/kbd/kbd_2.0.3.bb
@@ -11,7 +11,6 @@ RPROVIDES_${PN} = "console-tools"
 RCONFLICTS_${PN} = "console-tools"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/${BP}.tar.xz \
-           file://uclibc-stdarg.patch \
           "
 
 SRC_URI[md5sum] = "231b46e7142eb41ea3ae06d2ded3c208"
-- 
2.4.0


