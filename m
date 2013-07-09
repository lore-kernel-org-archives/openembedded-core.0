Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 505356B0A1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2013 00:32:09 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 08 Jul 2013 17:33:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1023,1363158000"; d="scan'208";a="367139947"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.85])
	by fmsmga002.fm.intel.com with ESMTP; 08 Jul 2013 17:32:09 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Jul 2013 17:32:05 -0700
Message-Id: <42c78a6410cfa0281a77d4e9d408275ebc1b2662.1373329833.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <cover.1373329833.git.sgw@linux.intel.com>
References: <cover.1373329833.git.sgw@linux.intel.com>
In-Reply-To: <cover.1373329833.git.sgw@linux.intel.com>
References: <cover.1373329833.git.sgw@linux.intel.com>
Subject: [PATCH 2/4] cmake: Update to 2.8.11.2
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
X-List-Received-Date: Tue, 09 Jul 2013 00:32:09 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/cmake/cmake-native_2.8.11.1.bb                 | 5 -----
 meta/recipes-devtools/cmake/cmake-native_2.8.11.2.bb                 | 5 +++++
 meta/recipes-devtools/cmake/{cmake_2.8.11.1.bb => cmake_2.8.11.2.bb} | 3 +++
 3 files changed, 8 insertions(+), 5 deletions(-)
 delete mode 100644 meta/recipes-devtools/cmake/cmake-native_2.8.11.1.bb
 create mode 100644 meta/recipes-devtools/cmake/cmake-native_2.8.11.2.bb
 rename meta/recipes-devtools/cmake/{cmake_2.8.11.1.bb => cmake_2.8.11.2.bb} (89%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_2.8.11.1.bb b/meta/recipes-devtools/cmake/cmake-native_2.8.11.1.bb
deleted file mode 100644
index 0a84d5b..0000000
--- a/meta/recipes-devtools/cmake/cmake-native_2.8.11.1.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require cmake.inc
-inherit native
-
-SRC_URI[md5sum] = "df5324a3b203373a9e0a04b924281a43"
-SRC_URI[sha256sum] = "b7dbb86824051319b8e082d2f892ebe6d5914b4dac9b9ef1aeac5e7ed054b0bf"
diff --git a/meta/recipes-devtools/cmake/cmake-native_2.8.11.2.bb b/meta/recipes-devtools/cmake/cmake-native_2.8.11.2.bb
new file mode 100644
index 0000000..ab31049
--- /dev/null
+++ b/meta/recipes-devtools/cmake/cmake-native_2.8.11.2.bb
@@ -0,0 +1,5 @@
+require cmake.inc
+inherit native
+
+SRC_URI[md5sum] = "6f5d7b8e7534a5d9e1a7664ba63cf882"
+SRC_URI[sha256sum] = "b32acb483afdd14339941c6e4ec25f633d916a7a472653a0b00838771a6c0562"
diff --git a/meta/recipes-devtools/cmake/cmake_2.8.11.1.bb b/meta/recipes-devtools/cmake/cmake_2.8.11.2.bb
similarity index 89%
rename from meta/recipes-devtools/cmake/cmake_2.8.11.1.bb
rename to meta/recipes-devtools/cmake/cmake_2.8.11.2.bb
index 968ac62..91e5411 100644
--- a/meta/recipes-devtools/cmake/cmake_2.8.11.1.bb
+++ b/meta/recipes-devtools/cmake/cmake_2.8.11.2.bb
@@ -9,6 +9,9 @@ SRC_URI += "file://dont-run-cross-binaries.patch"
 SRC_URI[md5sum] = "df5324a3b203373a9e0a04b924281a43"
 SRC_URI[sha256sum] = "b7dbb86824051319b8e082d2f892ebe6d5914b4dac9b9ef1aeac5e7ed054b0bf"
 
+SRC_URI[md5sum] = "6f5d7b8e7534a5d9e1a7664ba63cf882"
+SRC_URI[sha256sum] = "b32acb483afdd14339941c6e4ec25f633d916a7a472653a0b00838771a6c0562"
+
 # Strip ${prefix} from ${docdir}, set result into docdir_stripped
 python () {
     prefix=d.getVar("prefix", True)
-- 
1.8.1.4


