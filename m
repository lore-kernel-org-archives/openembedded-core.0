Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0CEAB7312A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 14:52:23 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Feb 2017 06:52:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,194,1484035200"; d="scan'208";a="51302180"
Received: from kanavin-desktop.fi.intel.com (HELO
	kanavin-desktop.fi.intel.comfi.intel.com) ([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 22 Feb 2017 06:52:23 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Feb 2017 16:51:06 +0200
Message-Id: <332a0ca4ef8ca0aef8f7235b80f27cb298172279.1487774787.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1487774787.git.alexander.kanavin@linux.intel.com>
References: <cover.1487774787.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 11/24] cmake: update to 3.7.2
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
X-List-Received-Date: Wed, 22 Feb 2017 14:52:23 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../cmake/{cmake-native_3.7.1.bb => cmake-native_3.7.2.bb}            | 0
 meta/recipes-devtools/cmake/cmake.inc                                 | 4 ++--
 meta/recipes-devtools/cmake/{cmake_3.7.1.bb => cmake_3.7.2.bb}        | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.7.1.bb => cmake-native_3.7.2.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.7.1.bb => cmake_3.7.2.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.7.1.bb b/meta/recipes-devtools/cmake/cmake-native_3.7.2.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_3.7.1.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.7.2.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 18e547de0cc..131ff70e584 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -17,8 +17,8 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://avoid-gcc-warnings-with-Wstrict-prototypes.patch \
            "
 
-SRC_URI[md5sum] = "d031d5a06e9f1c5367cdfc56fbd2a1c8"
-SRC_URI[sha256sum] = "449a5bce64dbd4d5b9517ebd1a1248ed197add6ad27934478976fd5f1f9330e1"
+SRC_URI[md5sum] = "79bd7e65cd81ea3aa2619484ad6ff25a"
+SRC_URI[sha256sum] = "dc1246c4e6d168ea4d6e042cfba577c1acd65feea27e56f5ff37df920c30cae0"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake_3.7.1.bb b/meta/recipes-devtools/cmake/cmake_3.7.2.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.7.1.bb
rename to meta/recipes-devtools/cmake/cmake_3.7.2.bb
-- 
2.11.0


