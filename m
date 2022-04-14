X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Alexandre Belloni" <alexandre.belloni@bootlin.com>
Subject: [PATCH] cmake: update license hashes
Date: Thu, 14 Apr 2022 12:05:55 +0200
Message-Id: <20220414100555.101894-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

The cmjsoncpp license changes are only whitespaces while the cmlibuv
license dropped:
"""
  - android-ifaddrs.h, android-ifaddrs.c, copyright Berkeley Software Design
    Inc, Kenneth MacKay and Emergya (Cloud4all, FP7/2007-2013, grant agreement
    n° 289016). Three clause BSD license.
"""

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 meta/recipes-devtools/cmake/cmake-native_3.23.0.bb | 4 ++--
 meta/recipes-devtools/cmake/cmake_3.23.0.bb        | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.23.0.bb b/meta/recipes-devtools/cmake/cmake-native_3.23.0.bb
index ee1f7761c4f6..722a486f20b3 100644
--- a/meta/recipes-devtools/cmake/cmake-native_3.23.0.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_3.23.0.bb
@@ -11,11 +11,11 @@ SRC_URI += "file://OEToolchainConfig.cmake \
 
 LICENSE:append = " & BSD-1-Clause & MIT & BSD-2-Clause"
 LIC_FILES_CHKSUM:append = " \
-    file://Utilities/cmjsoncpp/LICENSE;md5=fa2a23dd1dc6c139f35105379d76df2b \
+    file://Utilities/cmjsoncpp/LICENSE;md5=5d73c165a0f9e86a1342f32d19ec5926 \
     file://Utilities/cmlibarchive/COPYING;md5=d499814247adaee08d88080841cb5665 \
     file://Utilities/cmexpat/COPYING;md5=9e2ce3b3c4c0f2670883a23bbd7c37a9 \
     file://Utilities/cmlibrhash/COPYING;md5=a8c2a557a5c53b1c12cddbee98c099af \
-    file://Utilities/cmlibuv/LICENSE;md5=a68902a430e32200263d182d44924d47 \
+    file://Utilities/cmlibuv/LICENSE;md5=ad93ca1fffe931537fcf64f6fcce084d \
 "
 
 B = "${WORKDIR}/build"
diff --git a/meta/recipes-devtools/cmake/cmake_3.23.0.bb b/meta/recipes-devtools/cmake/cmake_3.23.0.bb
index 752c37ba7d5d..bb7ed83e308b 100644
--- a/meta/recipes-devtools/cmake/cmake_3.23.0.bb
+++ b/meta/recipes-devtools/cmake/cmake_3.23.0.bb
@@ -14,9 +14,9 @@ SRC_URI:append:class-nativesdk = " \
 
 LICENSE:append = " & BSD-1-Clause & MIT"
 LIC_FILES_CHKSUM:append = " \
-    file://Utilities/cmjsoncpp/LICENSE;md5=fa2a23dd1dc6c139f35105379d76df2b \
+    file://Utilities/cmjsoncpp/LICENSE;md5=5d73c165a0f9e86a1342f32d19ec5926 \
     file://Utilities/cmlibrhash/COPYING;md5=a8c2a557a5c53b1c12cddbee98c099af \
-    file://Utilities/cmlibuv/LICENSE;md5=a68902a430e32200263d182d44924d47 \
+    file://Utilities/cmlibuv/LICENSE;md5=ad93ca1fffe931537fcf64f6fcce084d \
 "
 
 # Strip ${prefix} from ${docdir}, set result into docdir_stripped
-- 
2.35.1

