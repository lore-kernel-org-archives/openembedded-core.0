Return-Path: <laurentiu.palcu@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 6BBA56D0A4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 10:34:30 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 17 Oct 2013 03:34:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,513,1378882800"; d="scan'208";a="376040040"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.41])
	by azsmga001.ch.intel.com with ESMTP; 17 Oct 2013 03:34:31 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Oct 2013 13:34:18 +0300
Message-Id: <4e86279b938dff975ab6ab36f737cbf74a4437cd.1382005791.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1382005791.git.laurentiu.palcu@intel.com>
References: <cover.1382005791.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1382005791.git.laurentiu.palcu@intel.com>
References: <cover.1382005791.git.laurentiu.palcu@intel.com>
Subject: [PATCH 8/8] gdb: upgrade to 7.6.1
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
X-List-Received-Date: Thu, 17 Oct 2013 10:34:30 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../gdb/{gdb-7.6.inc => gdb-7.6.1.inc}             |    4 ++--
 ...canadian_7.6.bb => gdb-cross-canadian_7.6.1.bb} |    2 +-
 .../gdb/{gdb-cross_7.6.bb => gdb-cross_7.6.1.bb}   |    2 +-
 .../gdb/{gdb_7.6.bb => gdb_7.6.1.bb}               |    2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/gdb/{gdb-7.6.inc => gdb-7.6.1.inc} (70%)
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_7.6.bb => gdb-cross-canadian_7.6.1.bb} (71%)
 rename meta/recipes-devtools/gdb/{gdb-cross_7.6.bb => gdb-cross_7.6.1.bb} (74%)
 rename meta/recipes-devtools/gdb/{gdb_7.6.bb => gdb_7.6.1.bb} (96%)

diff --git a/meta/recipes-devtools/gdb/gdb-7.6.inc b/meta/recipes-devtools/gdb/gdb-7.6.1.inc
similarity index 70%
rename from meta/recipes-devtools/gdb/gdb-7.6.inc
rename to meta/recipes-devtools/gdb/gdb-7.6.1.inc
index 00cb6ee..d1270f9 100644
--- a/meta/recipes-devtools/gdb/gdb-7.6.inc
+++ b/meta/recipes-devtools/gdb/gdb-7.6.1.inc
@@ -6,5 +6,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 
 S = "${WORKDIR}/${BPN}-${PV}"
 
-SRC_URI[md5sum] = "a9836707337e5f7bf76a009a8904f470"
-SRC_URI[sha256sum] = "8070389a5dcc104eb0be483d582729f98ed4d761ad19cedd3f17b5d2502faa36"
+SRC_URI[md5sum] = "d42841167fd061d90fddf9a7212a1f9f"
+SRC_URI[sha256sum] = "3ccf7f618536f89648ba89e322fc3c0946bc15c03ca09c32fd9e71bbca68104b"
diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_7.6.bb b/meta/recipes-devtools/gdb/gdb-cross-canadian_7.6.1.bb
similarity index 71%
rename from meta/recipes-devtools/gdb/gdb-cross-canadian_7.6.bb
rename to meta/recipes-devtools/gdb/gdb-cross-canadian_7.6.1.bb
index 3864435..3010359 100644
--- a/meta/recipes-devtools/gdb/gdb-cross-canadian_7.6.bb
+++ b/meta/recipes-devtools/gdb/gdb-cross-canadian_7.6.1.bb
@@ -1,3 +1,3 @@
 require gdb-common.inc
 require gdb-cross-canadian.inc
-require gdb-7.6.inc
+require gdb-${PV}.inc
diff --git a/meta/recipes-devtools/gdb/gdb-cross_7.6.bb b/meta/recipes-devtools/gdb/gdb-cross_7.6.1.bb
similarity index 74%
rename from meta/recipes-devtools/gdb/gdb-cross_7.6.bb
rename to meta/recipes-devtools/gdb/gdb-cross_7.6.1.bb
index 62f6937..f9da486 100644
--- a/meta/recipes-devtools/gdb/gdb-cross_7.6.bb
+++ b/meta/recipes-devtools/gdb/gdb-cross_7.6.1.bb
@@ -1,4 +1,4 @@
 require gdb-cross.inc
-require gdb-7.6.inc
+require gdb-${PV}.inc
 
 SRC_URI += "file://sim-install-6.6.patch"
diff --git a/meta/recipes-devtools/gdb/gdb_7.6.bb b/meta/recipes-devtools/gdb/gdb_7.6.1.bb
similarity index 96%
rename from meta/recipes-devtools/gdb/gdb_7.6.bb
rename to meta/recipes-devtools/gdb/gdb_7.6.1.bb
index 54082b8..e864471 100644
--- a/meta/recipes-devtools/gdb/gdb_7.6.bb
+++ b/meta/recipes-devtools/gdb/gdb_7.6.1.bb
@@ -1,5 +1,5 @@
 require gdb.inc
-require gdb-7.6.inc
+require gdb-${PV}.inc
 
 inherit python-dir
 
-- 
1.7.9.5


