Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 427217485B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 11:20:08 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Apr 2018 04:20:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,405,1517904000"; d="scan'208";a="40599837"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 04 Apr 2018 04:20:08 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Apr 2018 14:13:12 +0300
Message-Id: <20180404111321.10824-13-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180404111321.10824-1-alexander.kanavin@linux.intel.com>
References: <20180404111321.10824-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 13/22] gtk-doc: update to 1.28
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
X-List-Received-Date: Wed, 04 Apr 2018 11:20:08 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch     | 12 ++++++------
 .../gtk-doc/{gtk-doc_1.27.bb => gtk-doc_1.28.bb}             |  4 ++--
 2 files changed, 8 insertions(+), 8 deletions(-)
 rename meta/recipes-gnome/gtk-doc/{gtk-doc_1.27.bb => gtk-doc_1.28.bb} (93%)

diff --git a/meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch b/meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch
index bfbc777ff87..b77b5a5bcd8 100644
--- a/meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch
+++ b/meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch
@@ -1,7 +1,7 @@
-From 5f145621b4780cfd6a5632fcc97c45f572938efc Mon Sep 17 00:00:00 2001
+From ae29d175016accd8a05ab1e52fc6435ac6291cfc Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Mon, 5 Sep 2016 22:25:44 +0100
-Subject: [PATCH 5/5] Use native pkg-config when looking for gtk-doc.
+Subject: [PATCH] Use native pkg-config when looking for gtk-doc.
 
 Upstream-Status: Inappropriate
 Signed-off-by: Ross Burton <ross.burton@intel.com>
@@ -10,10 +10,10 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
  gtk-doc.m4 | 7 ++++++-
  1 file changed, 6 insertions(+), 1 deletion(-)
 
-Index: gtk-doc-1.27/gtk-doc.m4
-===================================================================
---- gtk-doc-1.27.orig/gtk-doc.m4
-+++ gtk-doc-1.27/gtk-doc.m4
+diff --git a/gtk-doc.m4 b/gtk-doc.m4
+index 2d12f01..e5afc3f 100644
+--- a/gtk-doc.m4
++++ b/gtk-doc.m4
 @@ -25,7 +25,7 @@
  # Macro appear in them. The GNU General Public License (GPL) does govern
  # all other use of the material that constitutes the Autoconf Macro.
diff --git a/meta/recipes-gnome/gtk-doc/gtk-doc_1.27.bb b/meta/recipes-gnome/gtk-doc/gtk-doc_1.28.bb
similarity index 93%
rename from meta/recipes-gnome/gtk-doc/gtk-doc_1.27.bb
rename to meta/recipes-gnome/gtk-doc/gtk-doc_1.28.bb
index 45528111c13..a2ec6ac78f5 100644
--- a/meta/recipes-gnome/gtk-doc/gtk-doc_1.27.bb
+++ b/meta/recipes-gnome/gtk-doc/gtk-doc_1.28.bb
@@ -18,8 +18,8 @@ PACKAGECONFIG ??= "${@bb.utils.contains("DISTRO_FEATURES", "api-documentation",
 PACKAGECONFIG[working-scripts] = "--with-highlight=source-highlight,--with-highlight=no,libxslt-native xmlto-native source-highlight-native python3-six"
 PACKAGECONFIG[tests] = "--enable-tests,--disable-tests,glib-2.0"
 
-SRC_URI[archive.md5sum] = "b29949e0964762e474b706ce22171602"
-SRC_URI[archive.sha256sum] = "e26bd3f7080c749b1cb66c46c6bf8239e2f320a949964fb9c6d56e1b0c6d9a6f"
+SRC_URI[archive.md5sum] = "48550c33f9b9b530f9e5f397979b613a"
+SRC_URI[archive.sha256sum] = "911e29e302252c96128965ee1f4067d5431a88e00ad1023a8bc1d6b922af5715"
 SRC_URI += "file://0001-Do-not-hardocode-paths-to-perl-python-in-scripts.patch \
            file://0001-Do-not-error-out-if-xsltproc-is-not-found.patch \
            file://conditionaltests.patch \
-- 
2.16.1


