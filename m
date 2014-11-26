Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa07-04.prod.phx3.secureserver.net
	(p3plsmtpa07-04.prod.phx3.secureserver.net [173.201.192.233])
	by mail.openembedded.org (Postfix) with ESMTP id 8A5B772357
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Nov 2014 19:46:52 +0000 (UTC)
Received: from llc.pab ([75.72.225.8])
	by p3plsmtpa07-04.prod.phx3.secureserver.net with 
	id LKmr1p00Z0BVjqb01KmsSh; Wed, 26 Nov 2014 12:46:53 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Nov 2014 13:46:37 -0600
Message-Id: <ce2094c93a08d619c70f621571c5825fe5e0e5f1.1417030958.git.pab@pabigot.com>
X-Mailer: git-send-email 1.8.5.5
In-Reply-To: <cover.1417030958.git.pab@pabigot.com>
References: <cover.1417030958.git.pab@pabigot.com>
In-Reply-To: <cover.1417030958.git.pab@pabigot.com>
References: <cover.1417030958.git.pab@pabigot.com>
Subject: [RFC v2 2/9] packagegroup-base: select distro preference for bluez provider
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
X-List-Received-Date: Wed, 26 Nov 2014 19:47:02 -0000

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
1.8.5.5


