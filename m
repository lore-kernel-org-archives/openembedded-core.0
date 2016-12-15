Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 0CC51772CF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2016 12:48:35 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga104.jf.intel.com with ESMTP; 15 Dec 2016 04:48:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,351,1477983600"; d="scan'208";a="18480808"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 15 Dec 2016 04:48:35 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Dec 2016 14:48:00 +0200
Message-Id: <7bc13921712abc869941b337078f9d2eb451c9a9.1481805889.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1481805889.git.alexander.kanavin@linux.intel.com>
References: <cover.1481805889.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 07/16] cmake: update to 3.7.1
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
X-List-Received-Date: Thu, 15 Dec 2016 12:48:35 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../cmake/{cmake-native_3.7.0.bb => cmake-native_3.7.1.bb}            | 0
 meta/recipes-devtools/cmake/cmake.inc                                 | 4 ++--
 meta/recipes-devtools/cmake/{cmake_3.7.0.bb => cmake_3.7.1.bb}        | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.7.0.bb => cmake-native_3.7.1.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.7.0.bb => cmake_3.7.1.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.7.0.bb b/meta/recipes-devtools/cmake/cmake-native_3.7.1.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_3.7.0.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.7.1.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 9ae2890..0253f3e 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -17,8 +17,8 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://avoid-gcc-warnings-with-Wstrict-prototypes.patch \
            "
 
-SRC_URI[md5sum] = "3801dc4e54c1c957a7378d8b0d4254ba"
-SRC_URI[sha256sum] = "ed63e05c41aeb6c036e503114ab15847f29c312f9f21f5f1a7060a4b4ec2fb31"
+SRC_URI[md5sum] = "d031d5a06e9f1c5367cdfc56fbd2a1c8"
+SRC_URI[sha256sum] = "449a5bce64dbd4d5b9517ebd1a1248ed197add6ad27934478976fd5f1f9330e1"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake_3.7.0.bb b/meta/recipes-devtools/cmake/cmake_3.7.1.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.7.0.bb
rename to meta/recipes-devtools/cmake/cmake_3.7.1.bb
-- 
2.10.2


