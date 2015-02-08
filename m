Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa07-07.prod.phx3.secureserver.net
	(p3plsmtpa07-07.prod.phx3.secureserver.net [173.201.192.236])
	by mail.openembedded.org (Postfix) with ESMTP id 9A42760556
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Feb 2015 18:42:52 +0000 (UTC)
Received: from llc.pab ([75.72.225.8])
	by p3plsmtpa07-07.prod.phx3.secureserver.net with 
	id puin1p00C0BVjqb01uitVt; Sun, 08 Feb 2015 11:42:53 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  8 Feb 2015 12:42:15 -0600
Message-Id: <c33a54901d036bc62bcf70bad8d7ed74d30a530b.1423420390.git.pab@pabigot.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1423420390.git.pab@pabigot.com>
References: <cover.1423420390.git.pab@pabigot.com>
In-Reply-To: <cover.1423420390.git.pab@pabigot.com>
References: <cover.1423420390.git.pab@pabigot.com>
Subject: [PATCHv3 03/10] packagegroup-base: select distro preference for bluez provider
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

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---
 meta/recipes-core/packagegroups/packagegroup-base.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/recipes-core/packagegroups/packagegroup-base.bb
index f4b2cd5..369b63e 100644
--- a/meta/recipes-core/packagegroups/packagegroup-base.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
@@ -8,6 +8,7 @@ PR = "r83"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit packagegroup
+inherit bluetooth
 
 PROVIDES = "${PACKAGES}"
 PACKAGES = ' \
@@ -203,7 +204,7 @@ RRECOMMENDS_packagegroup-base-pcmcia = "\
 
 SUMMARY_packagegroup-base-bluetooth = "Bluetooth support"
 RDEPENDS_packagegroup-base-bluetooth = "\
-    bluez4 \
+    ${BLUEZ} \
     ${@bb.utils.contains('COMBINED_FEATURES', 'alsa', 'libasound-module-bluez', '',d)} \
     "
 
-- 
1.9.1


