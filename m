Return-Path: <pascal.bach@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id A418779D13
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 12:16:58 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x31CGwWd007683
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 1 Apr 2019 14:16:58 +0200
Received: from dev.vm6.ccp.siemens.com (MD1FZU9C.ad001.siemens.net
	[139.16.117.164])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id x31CGw3g032037;
	Mon, 1 Apr 2019 14:16:58 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id EE17510D47A8;
	Mon,  1 Apr 2019 14:16:58 +0200 (CEST)
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Apr 2019 14:16:54 +0200
Message-Id: <20190401121654.27469-1-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] cmake: 3.14.0 -> 3.14.1
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
X-List-Received-Date: Mon, 01 Apr 2019 12:16:59 -0000

The FindFontconfig module added by 3.14.0 accidentally used uppercase
FONTCONFIG_* variable names that do not match our conventions.
3.14.1 revises the module to use Fontconfig_* variable names.
This is incompatible with 3.14.0 but since the module is new in the
3.14 series usage should not yet be widespread.

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 .../cmake/{cmake-native_3.14.0.bb => cmake-native_3.14.1.bb}          | 0
 meta/recipes-devtools/cmake/cmake.inc                                 | 4 ++--
 meta/recipes-devtools/cmake/{cmake_3.14.0.bb => cmake_3.14.1.bb}      | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.14.0.bb => cmake-native_3.14.1.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.14.0.bb => cmake_3.14.1.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.14.0.bb b/meta/recipes-devtools/cmake/cmake-native_3.14.1.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_3.14.0.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.14.1.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index f787851e2d..5b0bce6808 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -18,7 +18,7 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://0004-Fail-silently-if-system-Qt-installation-is-broken.patch \
 "
 
-SRC_URI[md5sum] = "7504e4f3e05b59e083f2127e07059d5d"
-SRC_URI[sha256sum] = "aa76ba67b3c2af1946701f847073f4652af5cbd9f141f221c97af99127e75502"
+SRC_URI[md5sum] = "7efe5394e85c3292ad020b8b70e55669"
+SRC_URI[sha256sum] = "7321be640406338fc12590609c42b0fae7ea12980855c1be363d25dcd76bb25f"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
diff --git a/meta/recipes-devtools/cmake/cmake_3.14.0.bb b/meta/recipes-devtools/cmake/cmake_3.14.1.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.14.0.bb
rename to meta/recipes-devtools/cmake/cmake_3.14.1.bb
-- 
2.11.0


