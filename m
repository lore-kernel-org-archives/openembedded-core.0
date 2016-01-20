Return-Path: <maxin.john@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 4D5FA60620
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 15:56:36 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 20 Jan 2016 07:56:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,321,1449561600"; d="scan'208";a="897411609"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 20 Jan 2016 07:56:37 -0800
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 6FBDE6A4002
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 08:44:32 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jan 2016 17:58:48 +0200
Message-Id: <1453305530-556-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1453305530-556-1-git-send-email-maxin.john@intel.com>
References: <1453305530-556-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 2/4] libtirpc: remove redundant va_list patch
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
X-List-Received-Date: Wed, 20 Jan 2016 15:56:39 -0000

Avoid duplicated inclusion of stdarg.h for uclibc builds.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-extended/libtirpc/libtirpc/va_list.patch | 18 ------------------
 meta/recipes-extended/libtirpc/libtirpc_1.0.1.bb      |  1 -
 2 files changed, 19 deletions(-)
 delete mode 100644 meta/recipes-extended/libtirpc/libtirpc/va_list.patch

diff --git a/meta/recipes-extended/libtirpc/libtirpc/va_list.patch b/meta/recipes-extended/libtirpc/libtirpc/va_list.patch
deleted file mode 100644
index 855d15b..0000000
--- a/meta/recipes-extended/libtirpc/libtirpc/va_list.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-This patch is fixing build with uclibc where compiler ( gcc5 ) says it cant find va_list
-the patch is right for upstreaming as well
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
-
-Index: libtirpc-0.2.5/src/debug.h
-===================================================================
---- libtirpc-0.2.5.orig/src/debug.h
-+++ libtirpc-0.2.5/src/debug.h
-@@ -22,6 +22,7 @@
- #ifndef _DEBUG_H
- #define _DEBUG_H
- #include <syslog.h>
-+#include <stdarg.h>
- 
- extern int libtirpc_debug_level;
- extern int  log_stderr;
diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.0.1.bb b/meta/recipes-extended/libtirpc/libtirpc_1.0.1.bb
index 302dc50..9513de1 100644
--- a/meta/recipes-extended/libtirpc/libtirpc_1.0.1.bb
+++ b/meta/recipes-extended/libtirpc/libtirpc_1.0.1.bb
@@ -17,7 +17,6 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.bz2;name=libtirpc \
           "
 
 SRC_URI_append_libc-uclibc = " file://remove-des-functionality.patch \
-                               file://va_list.patch \
                              "
 
 SRC_URI_append_libc-musl = " file://remove-des-functionality.patch \
-- 
2.4.0


