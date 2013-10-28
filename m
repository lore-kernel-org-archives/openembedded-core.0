Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id CCD7E6D45E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 16:45:15 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 28 Oct 2013 09:45:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,587,1378882800"; d="scan'208";a="418598727"
Received: from mmckenna-mobl1.ger.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.120.252])
	by fmsmga001.fm.intel.com with ESMTP; 28 Oct 2013 09:44:51 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Oct 2013 16:44:40 +0000
Message-Id: <5a99dad97a2db8afeb523cb218d4fdde553c175f.1382978401.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1382978401.git.paul.eggleton@linux.intel.com>
References: <cover.1382978401.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1382978401.git.paul.eggleton@linux.intel.com>
References: <cover.1382978401.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/3] cmake: upgrade to 2.8.12
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
X-List-Received-Date: Mon, 28 Oct 2013 16:45:16 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../cmake/{cmake-native_2.8.11.2.bb => cmake-native_2.8.12.bb}     | 4 ++--
 meta/recipes-devtools/cmake/{cmake_2.8.11.2.bb => cmake_2.8.12.bb} | 7 ++-----
 2 files changed, 4 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake-native_2.8.11.2.bb => cmake-native_2.8.12.bb} (58%)
 rename meta/recipes-devtools/cmake/{cmake_2.8.11.2.bb => cmake_2.8.12.bb} (78%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_2.8.11.2.bb b/meta/recipes-devtools/cmake/cmake-native_2.8.12.bb
similarity index 58%
rename from meta/recipes-devtools/cmake/cmake-native_2.8.11.2.bb
rename to meta/recipes-devtools/cmake/cmake-native_2.8.12.bb
index e2a157b..4ee9011 100644
--- a/meta/recipes-devtools/cmake/cmake-native_2.8.11.2.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_2.8.12.bb
@@ -6,5 +6,5 @@ DEPENDS += "bzip2-native zlib-native"
 
 SRC_URI += "file://cmlibarchive-disable-ext2fs.patch"
 
-SRC_URI[md5sum] = "6f5d7b8e7534a5d9e1a7664ba63cf882"
-SRC_URI[sha256sum] = "b32acb483afdd14339941c6e4ec25f633d916a7a472653a0b00838771a6c0562"
+SRC_URI[md5sum] = "105bc6d21cc2e9b6aff901e43c53afea"
+SRC_URI[sha256sum] = "d885ba10b2406ede59aa31a928df33c9d67fc01433202f7dd586999cfd0e0287"
diff --git a/meta/recipes-devtools/cmake/cmake_2.8.11.2.bb b/meta/recipes-devtools/cmake/cmake_2.8.12.bb
similarity index 78%
rename from meta/recipes-devtools/cmake/cmake_2.8.11.2.bb
rename to meta/recipes-devtools/cmake/cmake_2.8.12.bb
index 91e5411..ffd947f 100644
--- a/meta/recipes-devtools/cmake/cmake_2.8.11.2.bb
+++ b/meta/recipes-devtools/cmake/cmake_2.8.12.bb
@@ -6,11 +6,8 @@ DEPENDS += "curl expat zlib libarchive ncurses"
 
 SRC_URI += "file://dont-run-cross-binaries.patch"
 
-SRC_URI[md5sum] = "df5324a3b203373a9e0a04b924281a43"
-SRC_URI[sha256sum] = "b7dbb86824051319b8e082d2f892ebe6d5914b4dac9b9ef1aeac5e7ed054b0bf"
-
-SRC_URI[md5sum] = "6f5d7b8e7534a5d9e1a7664ba63cf882"
-SRC_URI[sha256sum] = "b32acb483afdd14339941c6e4ec25f633d916a7a472653a0b00838771a6c0562"
+SRC_URI[md5sum] = "105bc6d21cc2e9b6aff901e43c53afea"
+SRC_URI[sha256sum] = "d885ba10b2406ede59aa31a928df33c9d67fc01433202f7dd586999cfd0e0287"
 
 # Strip ${prefix} from ${docdir}, set result into docdir_stripped
 python () {
-- 
1.8.1.2


