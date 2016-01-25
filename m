Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 8B6467706E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 16:11:43 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 25 Jan 2016 08:10:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,345,1449561600"; d="scan'208";a="641143881"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 25 Jan 2016 08:10:47 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Jan 2016 18:07:11 +0200
Message-Id: <f51d5278e7a2939fafbbd15ce4779e21f9b0f06c.1453737141.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0.rc3
In-Reply-To: <cover.1453737141.git.alexander.kanavin@linux.intel.com>
References: <cover.1453737141.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1453737141.git.alexander.kanavin@linux.intel.com>
References: <cover.1453737141.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 01/16] cmake: update to 3.4.2
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
X-List-Received-Date: Mon, 25 Jan 2016 16:11:43 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../cmake/{cmake-native_3.3.2.bb => cmake-native_3.4.2.bb}            | 0
 meta/recipes-devtools/cmake/cmake.inc                                 | 4 ++--
 meta/recipes-devtools/cmake/{cmake_3.3.2.bb => cmake_3.4.2.bb}        | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.3.2.bb => cmake-native_3.4.2.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.3.2.bb => cmake_3.4.2.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.3.2.bb b/meta/recipes-devtools/cmake/cmake-native_3.4.2.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_3.3.2.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.4.2.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 41be256..befac7c 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -17,8 +17,8 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://0001-Add-NIOS2-CPU-support.patch \
            "
 
-SRC_URI[md5sum] = "5febbd11bcaac854a27eebaf4a124be2"
-SRC_URI[sha256sum] = "e75a178d6ebf182b048ebfe6e0657c49f0dc109779170bad7ffcb17463f2fc22"
+SRC_URI[md5sum] = "04545d3cc3801fe84223b864c4f7a53c"
+SRC_URI[sha256sum] = "da7cc34e1ce1d82e67a32ab081c02c2845534cd8bf2e09d88077a1b282e97392"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake_3.3.2.bb b/meta/recipes-devtools/cmake/cmake_3.4.2.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.3.2.bb
rename to meta/recipes-devtools/cmake/cmake_3.4.2.bb
-- 
2.7.0.rc3


