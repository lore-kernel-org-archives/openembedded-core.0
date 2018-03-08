Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id F2F2C78A56
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Mar 2018 18:25:45 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Mar 2018 10:25:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,441,1515484800"; d="scan'208";a="24054131"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga006.jf.intel.com with ESMTP; 08 Mar 2018 10:25:46 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Mar 2018 20:18:04 +0200
Message-Id: <20180308181804.31261-42-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180308181804.31261-1-alexander.kanavin@linux.intel.com>
References: <20180308181804.31261-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 42/42] perl: remove perl-enable-gdbm.patch
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
X-List-Received-Date: Thu, 08 Mar 2018 18:25:46 -0000

The change was already present in upstream, so we just applied it
again (see bug 10450 for why).

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../recipes-devtools/perl/perl/perl-enable-gdbm.patch | 19 -------------------
 meta/recipes-devtools/perl/perl_5.24.1.bb             |  1 -
 2 files changed, 20 deletions(-)
 delete mode 100644 meta/recipes-devtools/perl/perl/perl-enable-gdbm.patch

diff --git a/meta/recipes-devtools/perl/perl/perl-enable-gdbm.patch b/meta/recipes-devtools/perl/perl/perl-enable-gdbm.patch
deleted file mode 100644
index bad3373fd40..00000000000
--- a/meta/recipes-devtools/perl/perl/perl-enable-gdbm.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Upstream-Status:Inappropriate [embedded specific]
-
-Index: perl-5.24.1/config_h.SH
-===================================================================
---- perl-5.24.1.orig/config_h.SH
-+++ perl-5.24.1/config_h.SH
-@@ -726,6 +726,12 @@ sed <<!GROK!THIS! >$CONFIG_H -e 's!^#und
-  */
- #$i_gdbm I_GDBM	/**/
- 
-+/* I_GDBM:
-+ *      This symbol, if defined, indicates that <gdbm.h> exists and should
-+ *      be included.
-+ */
-+#$i_gdbm I_GDBM /**/
-+
- /* I_LIMITS:
-  *	This symbol, if defined, indicates to the C program that it should
-  *	include <limits.h> to get definition of symbols like WORD_BIT or
diff --git a/meta/recipes-devtools/perl/perl_5.24.1.bb b/meta/recipes-devtools/perl/perl_5.24.1.bb
index f13a63a80a3..e5b4886a95d 100644
--- a/meta/recipes-devtools/perl/perl_5.24.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.24.1.bb
@@ -45,7 +45,6 @@ SRC_URI += " \
         file://letgcc-find-errno.patch \
         file://generate-sh.patch \
         file://native-perlinc.patch \
-        file://perl-enable-gdbm.patch \
         file://cross-generate_uudmap.patch \
         file://fix_bad_rpath.patch \
         file://dynaloaderhack.patch \
-- 
2.16.1


