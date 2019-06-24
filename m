Return-Path: <pascal.bach@siemens.com>
X-Greylist: delayed 474 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 24 Jun 2019 08:05:15 UTC
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id 7115E7D27B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 08:05:15 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x5O7vL4Y021238
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 09:57:22 +0200
Received: from dev.vm6.ccp.siemens.com (MD1FZU9C.ad001.siemens.net
	[139.16.117.248])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id x5O7vI9O029864;
	Mon, 24 Jun 2019 09:57:18 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 0DAC810D47A7;
	Mon, 24 Jun 2019 09:57:18 +0200 (CEST)
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Jun 2019 09:57:13 +0200
Message-Id: <20190624075713.32568-1-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] cmake: 3.14.1 -> 3.14.5
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
X-List-Received-Date: Mon, 24 Jun 2019 08:05:15 -0000

Fixes:

- A bug with Visual Studio 2019
- An issue with target_link_libraries and PRIVATE
- An issue with include_directories

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 .../cmake/{cmake-native_3.14.1.bb => cmake-native_3.14.5.bb}          | 0
 meta/recipes-devtools/cmake/cmake.inc                                 | 4 ++--
 meta/recipes-devtools/cmake/{cmake_3.14.1.bb => cmake_3.14.5.bb}      | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.14.1.bb => cmake-native_3.14.5.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.14.1.bb => cmake_3.14.5.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.14.1.bb b/meta/recipes-devtools/cmake/cmake-native_3.14.5.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_3.14.1.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.14.5.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 5b0bce6808..da3aadcc0a 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -18,7 +18,7 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://0004-Fail-silently-if-system-Qt-installation-is-broken.patch \
 "
 
-SRC_URI[md5sum] = "7efe5394e85c3292ad020b8b70e55669"
-SRC_URI[sha256sum] = "7321be640406338fc12590609c42b0fae7ea12980855c1be363d25dcd76bb25f"
+SRC_URI[md5sum] = "a8cbfc3510b95ea686b4059d8b1f765c"
+SRC_URI[sha256sum] = "505ae49ebe3c63c595fa5f814975d8b72848447ee13b6613b0f8b96ebda18c06"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
diff --git a/meta/recipes-devtools/cmake/cmake_3.14.1.bb b/meta/recipes-devtools/cmake/cmake_3.14.5.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.14.1.bb
rename to meta/recipes-devtools/cmake/cmake_3.14.5.bb
-- 
2.11.0


