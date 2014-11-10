Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa07-10.prod.phx3.secureserver.net
	(p3plsmtpa07-10.prod.phx3.secureserver.net [173.201.192.239])
	by mail.openembedded.org (Postfix) with ESMTP id 48FF27205C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Nov 2014 21:13:23 +0000 (UTC)
Received: from llc.pab ([75.72.225.8])
	by p3plsmtpa07-10.prod.phx3.secureserver.net with 
	id DxDM1p00G0BVjqb01xDPvH; Mon, 10 Nov 2014 14:13:23 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Nov 2014 15:12:58 -0600
Message-Id: <f9586d37f154ce1710887bfbb27f852927cfaf8e.1415647839.git.pab@pabigot.com>
X-Mailer: git-send-email 1.8.5.5
In-Reply-To: <cover.1415647839.git.pab@pabigot.com>
References: <cover.1415647839.git.pab@pabigot.com>
In-Reply-To: <cover.1415647839.git.pab@pabigot.com>
References: <cover.1415647839.git.pab@pabigot.com>
Subject: [RFC 01/14] bluez5: upgrade to 5.25
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
X-List-Received-Date: Mon, 10 Nov 2014 21:13:29 -0000

See: http://www.bluez.org/release-of-bluez-5-23/
See: http://www.bluez.org/release-of-bluez-5-24/
See: http://www.bluez.org/release-of-bluez-5-25/
Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---
 meta/recipes-connectivity/bluez5/bluez5_5.22.bb | 3 ---
 meta/recipes-connectivity/bluez5/bluez5_5.25.bb | 3 +++
 2 files changed, 3 insertions(+), 3 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.22.bb
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.25.bb

diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.22.bb b/meta/recipes-connectivity/bluez5/bluez5_5.22.bb
deleted file mode 100644
index 04116ed..0000000
--- a/meta/recipes-connectivity/bluez5/bluez5_5.22.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-require bluez5.inc
-SRC_URI[md5sum] = "fd0783c8bc524bc9b26514aad1f85814"
-SRC_URI[sha256sum] = "e8b866515a18116c7048a55081be9238a51447c9448ed20997b0432b13ba0882"
diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.25.bb b/meta/recipes-connectivity/bluez5/bluez5_5.25.bb
new file mode 100644
index 0000000..8cb32ec
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.25.bb
@@ -0,0 +1,3 @@
+require bluez5.inc
+SRC_URI[md5sum] = "41bd0c915abde255622150ce6dcae67b"
+SRC_URI[sha256sum] = "5ca62f3f45e2638a0f7a81658d6c8813ee01487436ae8e53e9fe395e23d1fd30"
-- 
1.8.5.5


