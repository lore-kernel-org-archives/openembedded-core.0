Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id AB6FD71B25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2016 15:09:15 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga101.jf.intel.com with ESMTP; 19 Oct 2016 08:09:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,514,1473145200"; d="scan'208";a="21266935"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 19 Oct 2016 08:09:16 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Oct 2016 18:06:42 +0300
Message-Id: <2c06776294ea9ce193a0916ea35be3ec78c9d57f.1476888929.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1476888929.git.alexander.kanavin@linux.intel.com>
References: <cover.1476888929.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1476888929.git.alexander.kanavin@linux.intel.com>
References: <cover.1476888929.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 07/19] cmake: update to 3.6.2
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
X-List-Received-Date: Wed, 19 Oct 2016 15:09:15 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../cmake/{cmake-native_3.6.1.bb => cmake-native_3.6.2.bb}            | 0
 meta/recipes-devtools/cmake/cmake.inc                                 | 4 ++--
 meta/recipes-devtools/cmake/{cmake_3.6.1.bb => cmake_3.6.2.bb}        | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.6.1.bb => cmake-native_3.6.2.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.6.1.bb => cmake_3.6.2.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.6.1.bb b/meta/recipes-devtools/cmake/cmake-native_3.6.2.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_3.6.1.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.6.2.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 4fcb0b1..961d33c 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -16,8 +16,8 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://qt4-fail-silent.patch \
            "
 
-SRC_URI[md5sum] = "d6dd661380adacdb12f41b926ec99545"
-SRC_URI[sha256sum] = "28ee98ec40427d41a45673847db7a905b59ce9243bb866eaf59dce0f58aaef11"
+SRC_URI[md5sum] = "139d7affdd4e8ab1edfc9f4322d69e43"
+SRC_URI[sha256sum] = "189ae32a6ac398bb2f523ae77f70d463a6549926cde1544cd9cc7c6609f8b346"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake_3.6.1.bb b/meta/recipes-devtools/cmake/cmake_3.6.2.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.6.1.bb
rename to meta/recipes-devtools/cmake/cmake_3.6.2.bb
-- 
2.9.3


