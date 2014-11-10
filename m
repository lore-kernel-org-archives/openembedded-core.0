Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa07-10.prod.phx3.secureserver.net
	(p3plsmtpa07-10.prod.phx3.secureserver.net [173.201.192.239])
	by mail.openembedded.org (Postfix) with ESMTP id 456FC65D4F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Nov 2014 21:13:23 +0000 (UTC)
Received: from llc.pab ([75.72.225.8])
	by p3plsmtpa07-10.prod.phx3.secureserver.net with 
	id DxDM1p00G0BVjqb01xDPvP; Mon, 10 Nov 2014 14:13:24 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Nov 2014 15:12:59 -0600
Message-Id: <e24bdc70e9417e10001fe65529100ccd5bb63c6e.1415647839.git.pab@pabigot.com>
X-Mailer: git-send-email 1.8.5.5
In-Reply-To: <cover.1415647839.git.pab@pabigot.com>
References: <cover.1415647839.git.pab@pabigot.com>
In-Reply-To: <cover.1415647839.git.pab@pabigot.com>
References: <cover.1415647839.git.pab@pabigot.com>
Subject: [RFC 02/14] bluez5: fix QA error from configure option
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
X-List-Received-Date: Mon, 10 Nov 2014 21:13:28 -0000

The systemdunitdir option was split into systemdsystemunitdir and
systemduserunitdir before bluez5 was ever released, so this produced a
QA error and was ignored.  There appears to be no reason to override the
inferred default, so replace it with an explicit --enable-systemd.

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index c3dd946..28c014f 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -26,7 +26,7 @@ EXTRA_OECONF = "\
   --disable-cups \
   --enable-test \
   --enable-datafiles \
-  ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--with-systemdunitdir=${systemd_unitdir}/system/', '--disable-systemd', d)} \
+  ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--enable-systemd', '--disable-systemd', d)} \
   --enable-library \
 "
 
-- 
1.8.5.5


