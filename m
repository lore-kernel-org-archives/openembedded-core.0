Return-Path: <muhammad_shakeel@mentor.com>
Received: from gemini.alm.mentorg.com (nat-lmt.mentorg.com [139.181.28.34])
	by mail.openembedded.org (Postfix) with ESMTP id A20F060EE1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2013 13:50:53 +0000 (UTC)
Received: from pkl-mshakeel-ubuntu.mgc.mentorg.com ([137.202.157.119])
	by gemini.alm.mentorg.com (8.14.4/8.14.4) with ESMTP id r8KDooX4008688; 
	Fri, 20 Sep 2013 08:50:53 -0500
From: "Shakeel, Muhammad" <muhammad_shakeel@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Sep 2013 18:52:12 +0500
Message-Id: <1379685133-3155-1-git-send-email-muhammad_shakeel@mentor.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 1/2] [v2] connman: Upgrade to v1.18
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
X-List-Received-Date: Fri, 20 Sep 2013 13:50:54 -0000

From: Muhammad Shakeel <muhammad_shakeel@mentor.com>

This release contains a few important bugfixes in addition
to a few new features.

Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
---
 meta/recipes-connectivity/connman/connman_1.17.bb |   14 --------------
 meta/recipes-connectivity/connman/connman_1.18.bb |   14 ++++++++++++++
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman_1.17.bb b/meta/recipes-connectivity/connman/connman_1.17.bb
deleted file mode 100644
index 461157f..0000000
--- a/meta/recipes-connectivity/connman/connman_1.17.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-require connman.inc
-
-SRC_URI  = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
-            file://0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch \
-            file://add_xuser_dbus_permission.patch \
-            file://connman \
-            "
-
-SRC_URI[md5sum] = "dd4a13f789de1b69fcddf0cf613f2d5b"
-SRC_URI[sha256sum] = "d31aa2e7dc9fa817c93aba973995b63506a8c83f55afe507028f09b580ef0b00"
-
-PR = "${INC_PR}.0"
-
-RRECOMMENDS_${PN} = "connman-conf"
diff --git a/meta/recipes-connectivity/connman/connman_1.18.bb b/meta/recipes-connectivity/connman/connman_1.18.bb
new file mode 100644
index 0000000..44a4a07
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman_1.18.bb
@@ -0,0 +1,14 @@
+require connman.inc
+
+SRC_URI  = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
+            file://0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch \
+            file://add_xuser_dbus_permission.patch \
+            file://connman \
+            "
+
+SRC_URI[md5sum] = "7578ec8f0422d34f5a4ba51b605fe576"
+SRC_URI[sha256sum] = "56c2ca7842be2100b6b59367845d5beec125f231af6ea505604992e0c5a69992"
+
+PR = "${INC_PR}.0"
+
+RRECOMMENDS_${PN} = "connman-conf"
-- 
1.7.9.5


