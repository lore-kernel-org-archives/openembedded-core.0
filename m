Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa09-09.prod.phx3.secureserver.net
	(p3plsmtpa09-09.prod.phx3.secureserver.net [173.201.193.238])
	by mail.openembedded.org (Postfix) with ESMTP id 994FD72334
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Nov 2014 19:45:14 +0000 (UTC)
Received: from llc.pab ([75.72.225.8])
	by p3plsmtpa09-09.prod.phx3.secureserver.net with 
	id LKlD1p0030BVjqb01KlE1o; Wed, 26 Nov 2014 12:45:15 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Nov 2014 13:44:59 -0600
Message-Id: <d4405ac3dccd9b2194db68f2962f7510474a8417.1417029596.git.pab@pabigot.com>
X-Mailer: git-send-email 1.8.5.5
In-Reply-To: <cover.1417029596.git.pab@pabigot.com>
References: <cover.1417029596.git.pab@pabigot.com>
In-Reply-To: <cover.1417029596.git.pab@pabigot.com>
References: <cover.1417029596.git.pab@pabigot.com>
Subject: [PATCH 3/3] bluez5: support experimental through PACKAGECONFIG
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
X-List-Received-Date: Wed, 26 Nov 2014 19:45:25 -0000

Make it simple to enable the experimental plugins and tools.

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index d9b6492..67aafbb 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -14,6 +14,7 @@ RCONFLICTS_${PN} = "bluez4"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)} obex-profiles"
 PACKAGECONFIG[obex-profiles] = "--enable-obex,--disable-obex,libical"
+PACKAGECONFIG[experimental] = "--enable-experimental,--disable-experimental,"
 
 SRC_URI = "\
     ${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
-- 
1.8.5.5


