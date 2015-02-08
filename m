Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa07-07.prod.phx3.secureserver.net
	(p3plsmtpa07-07.prod.phx3.secureserver.net [173.201.192.236])
	by mail.openembedded.org (Postfix) with ESMTP id D1F8360089
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Feb 2015 18:42:51 +0000 (UTC)
Received: from llc.pab ([75.72.225.8])
	by p3plsmtpa07-07.prod.phx3.secureserver.net with 
	id puin1p00C0BVjqb01uisVn; Sun, 08 Feb 2015 11:42:52 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  8 Feb 2015 12:42:13 -0600
Message-Id: <43cd8500a5b71c4962d545d4145cf80687baf41e.1423420390.git.pab@pabigot.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1423420390.git.pab@pabigot.com>
References: <cover.1423420390.git.pab@pabigot.com>
In-Reply-To: <cover.1423420390.git.pab@pabigot.com>
References: <cover.1423420390.git.pab@pabigot.com>
Subject: [PATCHv3 01/10] bluez5: upgrade to 5.28
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
X-List-Received-Date: Sun, 08 Feb 2015 18:42:57 -0000

- Fixes to GATT service discovery & probing
- Fix for bearer selection with dual-mode devices
- Fix potential crash when removing devices
- Fix issue with incomplete names in EIR data
- Fix parsing GATT name characteristics
- Fix AVCTP long press & key repetition handling
- Fixes for GATT notification handling

hex2hcd graduated to installed tool; two new noinst tools

See: http://www.bluez.org/release-of-bluez-5-28/
Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---
 .../recipes-connectivity/bluez5/{bluez5_5.27.bb => bluez5_5.28.bb} | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta/recipes-connectivity/bluez5/{bluez5_5.27.bb => bluez5_5.28.bb} (85%)

diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.27.bb b/meta/recipes-connectivity/bluez5/bluez5_5.28.bb
similarity index 85%
rename from meta/recipes-connectivity/bluez5/bluez5_5.27.bb
rename to meta/recipes-connectivity/bluez5/bluez5_5.28.bb
index 9497ee5..e816998 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.27.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.28.bb
@@ -1,6 +1,6 @@
 require bluez5.inc
-SRC_URI[md5sum] = "a8fc508690e497e88c2c0b373cd653a8"
-SRC_URI[sha256sum] = "fbf33cebc76f8c81f28f0d67c71a8a1ec4b04b087460ec7353f7e0c207a1f981"
+SRC_URI[md5sum] = "bc20a8285530758c68f6a60e4ca62a15"
+SRC_URI[sha256sum] = "85bab48f4b47a158739028682c1e09cf30099c8ea9dfe63360055f8e06fc18a9"
 
 # noinst programs in Makefile.tools that are conditional on READLINE
 # support
@@ -40,9 +40,10 @@ NOINST_TOOLS_EXPERIMENTAL ?= " \
     tools/btsnoop \
     tools/btproxy \
     tools/btiotest \
+    tools/mcaptest \
     tools/cltest \
+    tools/oobtest \
     tools/seq2bseq \
-    tools/hex2hcd \
     tools/ibeacon \
     tools/btgatt-client \
     tools/btgatt-server \
-- 
1.9.1


