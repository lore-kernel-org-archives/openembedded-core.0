Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 4FD1E6D73D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2013 13:59:21 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 11 Nov 2013 05:55:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="406830935"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.166])
	by orsmga001.jf.intel.com with ESMTP; 11 Nov 2013 05:59:22 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Nov 2013 13:59:09 +0000
Message-Id: <3ddca976b0f1c6acc67855a0f6be3408744d669b.1384176729.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1384176729.git.paul.eggleton@linux.intel.com>
References: <cover.1384176729.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1384176729.git.paul.eggleton@linux.intel.com>
References: <cover.1384176729.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/4] cmake: upgrade to 2.8.12.1
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
X-List-Received-Date: Mon, 11 Nov 2013 13:59:22 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../cmake/{cmake-native_2.8.12.bb => cmake-native_2.8.12.1.bb}        | 4 ++--
 meta/recipes-devtools/cmake/{cmake_2.8.12.bb => cmake_2.8.12.1.bb}    | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake-native_2.8.12.bb => cmake-native_2.8.12.1.bb} (58%)
 rename meta/recipes-devtools/cmake/{cmake_2.8.12.bb => cmake_2.8.12.1.bb} (88%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_2.8.12.bb b/meta/recipes-devtools/cmake/cmake-native_2.8.12.1.bb
similarity index 58%
rename from meta/recipes-devtools/cmake/cmake-native_2.8.12.bb
rename to meta/recipes-devtools/cmake/cmake-native_2.8.12.1.bb
index 4ee9011..c813795 100644
--- a/meta/recipes-devtools/cmake/cmake-native_2.8.12.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_2.8.12.1.bb
@@ -6,5 +6,5 @@ DEPENDS += "bzip2-native zlib-native"
 
 SRC_URI += "file://cmlibarchive-disable-ext2fs.patch"
 
-SRC_URI[md5sum] = "105bc6d21cc2e9b6aff901e43c53afea"
-SRC_URI[sha256sum] = "d885ba10b2406ede59aa31a928df33c9d67fc01433202f7dd586999cfd0e0287"
+SRC_URI[md5sum] = "9d38cd4e2c94c3cea97d0e2924814acc"
+SRC_URI[sha256sum] = "fa28c12791d64c36ba6b6cb062a4b4bd4223053f6b9ea501b1bdbdf4d5df3a67"
diff --git a/meta/recipes-devtools/cmake/cmake_2.8.12.bb b/meta/recipes-devtools/cmake/cmake_2.8.12.1.bb
similarity index 88%
rename from meta/recipes-devtools/cmake/cmake_2.8.12.bb
rename to meta/recipes-devtools/cmake/cmake_2.8.12.1.bb
index ffd947f..c220aba 100644
--- a/meta/recipes-devtools/cmake/cmake_2.8.12.bb
+++ b/meta/recipes-devtools/cmake/cmake_2.8.12.1.bb
@@ -6,8 +6,8 @@ DEPENDS += "curl expat zlib libarchive ncurses"
 
 SRC_URI += "file://dont-run-cross-binaries.patch"
 
-SRC_URI[md5sum] = "105bc6d21cc2e9b6aff901e43c53afea"
-SRC_URI[sha256sum] = "d885ba10b2406ede59aa31a928df33c9d67fc01433202f7dd586999cfd0e0287"
+SRC_URI[md5sum] = "9d38cd4e2c94c3cea97d0e2924814acc"
+SRC_URI[sha256sum] = "fa28c12791d64c36ba6b6cb062a4b4bd4223053f6b9ea501b1bdbdf4d5df3a67"
 
 # Strip ${prefix} from ${docdir}, set result into docdir_stripped
 python () {
-- 
1.8.1.2


