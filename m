Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa06-04.prod.phx3.secureserver.net
	(p3plsmtpa06-04.prod.phx3.secureserver.net [173.201.192.105])
	by mail.openembedded.org (Postfix) with ESMTP id 3A5EE72730
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jan 2015 12:51:58 +0000 (UTC)
Received: from llc.pab ([75.72.225.8])
	by p3plsmtpa06-04.prod.phx3.secureserver.net with 
	id dorx1p00J0BVjqb01oryP9; Fri, 09 Jan 2015 05:51:58 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Jan 2015 06:51:37 -0600
Message-Id: <1420807897-8407-1-git-send-email-pab@pabigot.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] bluez5: upgrade to 5.27
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
X-List-Received-Date: Fri, 09 Jan 2015 12:52:06 -0000

- Bug fixes in A2DP, OBEX, GATT, and mgmt
- Low Energy Secure Connections with 3.19+ kernels

See: http://www.bluez.org/release-of-bluez-5-27/
See: http://www.bluez.org/release-of-bluez-5-26/
Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---
 meta/recipes-connectivity/bluez5/{bluez5_5.25.bb => bluez5_5.27.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/bluez5/{bluez5_5.25.bb => bluez5_5.27.bb} (86%)

diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.25.bb b/meta/recipes-connectivity/bluez5/bluez5_5.27.bb
similarity index 86%
rename from meta/recipes-connectivity/bluez5/bluez5_5.25.bb
rename to meta/recipes-connectivity/bluez5/bluez5_5.27.bb
index 7d06b16..9497ee5 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.25.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.27.bb
@@ -1,6 +1,6 @@
 require bluez5.inc
-SRC_URI[md5sum] = "41bd0c915abde255622150ce6dcae67b"
-SRC_URI[sha256sum] = "5ca62f3f45e2638a0f7a81658d6c8813ee01487436ae8e53e9fe395e23d1fd30"
+SRC_URI[md5sum] = "a8fc508690e497e88c2c0b373cd653a8"
+SRC_URI[sha256sum] = "fbf33cebc76f8c81f28f0d67c71a8a1ec4b04b087460ec7353f7e0c207a1f981"
 
 # noinst programs in Makefile.tools that are conditional on READLINE
 # support
@@ -45,6 +45,7 @@ NOINST_TOOLS_EXPERIMENTAL ?= " \
     tools/hex2hcd \
     tools/ibeacon \
     tools/btgatt-client \
+    tools/btgatt-server \
     tools/gatt-service \
     profiles/iap/iapd \
 "
-- 
1.9.1


