Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 821F66F203
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2014 16:37:29 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 28 Feb 2014 08:37:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,562,1389772800"; d="scan'208";a="490064808"
Received: from davidllo-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.227])
	by fmsmga002.fm.intel.com with ESMTP; 28 Feb 2014 08:37:29 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Feb 2014 16:37:20 +0000
Message-Id: <61fcec9ea51e103e8a86308ca9213abb20a93485.1393605405.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1393605405.git.paul.eggleton@linux.intel.com>
References: <cover.1393605405.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1393605405.git.paul.eggleton@linux.intel.com>
References: <cover.1393605405.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/6] cmake: upgrade to 2.8.12.2
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
X-List-Received-Date: Fri, 28 Feb 2014 16:37:29 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../cmake/{cmake-native_2.8.12.1.bb => cmake-native_2.8.12.2.bb}      | 4 ++--
 meta/recipes-devtools/cmake/{cmake_2.8.12.1.bb => cmake_2.8.12.2.bb}  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake-native_2.8.12.1.bb => cmake-native_2.8.12.2.bb} (58%)
 rename meta/recipes-devtools/cmake/{cmake_2.8.12.1.bb => cmake_2.8.12.2.bb} (88%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_2.8.12.1.bb b/meta/recipes-devtools/cmake/cmake-native_2.8.12.2.bb
similarity index 58%
rename from meta/recipes-devtools/cmake/cmake-native_2.8.12.1.bb
rename to meta/recipes-devtools/cmake/cmake-native_2.8.12.2.bb
index c813795..08b2c02 100644
--- a/meta/recipes-devtools/cmake/cmake-native_2.8.12.1.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_2.8.12.2.bb
@@ -6,5 +6,5 @@ DEPENDS += "bzip2-native zlib-native"
 
 SRC_URI += "file://cmlibarchive-disable-ext2fs.patch"
 
-SRC_URI[md5sum] = "9d38cd4e2c94c3cea97d0e2924814acc"
-SRC_URI[sha256sum] = "fa28c12791d64c36ba6b6cb062a4b4bd4223053f6b9ea501b1bdbdf4d5df3a67"
+SRC_URI[md5sum] = "17c6513483d23590cbce6957ec6d1e66"
+SRC_URI[sha256sum] = "8c6574e9afabcb9fc66f463bb1f2f051958d86c85c37fccf067eb1a44a120e5e"
diff --git a/meta/recipes-devtools/cmake/cmake_2.8.12.1.bb b/meta/recipes-devtools/cmake/cmake_2.8.12.2.bb
similarity index 88%
rename from meta/recipes-devtools/cmake/cmake_2.8.12.1.bb
rename to meta/recipes-devtools/cmake/cmake_2.8.12.2.bb
index c220aba..52c3b32 100644
--- a/meta/recipes-devtools/cmake/cmake_2.8.12.1.bb
+++ b/meta/recipes-devtools/cmake/cmake_2.8.12.2.bb
@@ -6,8 +6,8 @@ DEPENDS += "curl expat zlib libarchive ncurses"
 
 SRC_URI += "file://dont-run-cross-binaries.patch"
 
-SRC_URI[md5sum] = "9d38cd4e2c94c3cea97d0e2924814acc"
-SRC_URI[sha256sum] = "fa28c12791d64c36ba6b6cb062a4b4bd4223053f6b9ea501b1bdbdf4d5df3a67"
+SRC_URI[md5sum] = "17c6513483d23590cbce6957ec6d1e66"
+SRC_URI[sha256sum] = "8c6574e9afabcb9fc66f463bb1f2f051958d86c85c37fccf067eb1a44a120e5e"
 
 # Strip ${prefix} from ${docdir}, set result into docdir_stripped
 python () {
-- 
1.8.5.3


