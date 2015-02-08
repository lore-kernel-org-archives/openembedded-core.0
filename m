Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa07-07.prod.phx3.secureserver.net
	(p3plsmtpa07-07.prod.phx3.secureserver.net [173.201.192.236])
	by mail.openembedded.org (Postfix) with ESMTP id 6D77573291
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Feb 2015 18:42:54 +0000 (UTC)
Received: from llc.pab ([75.72.225.8])
	by p3plsmtpa07-07.prod.phx3.secureserver.net with 
	id puin1p00C0BVjqb01uivW7; Sun, 08 Feb 2015 11:42:56 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  8 Feb 2015 12:42:20 -0600
Message-Id: <7119289feff8b3d1101aaf264060594c20dbfbd4.1423420390.git.pab@pabigot.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1423420390.git.pab@pabigot.com>
References: <cover.1423420390.git.pab@pabigot.com>
In-Reply-To: <cover.1423420390.git.pab@pabigot.com>
References: <cover.1423420390.git.pab@pabigot.com>
Subject: [PATCHv3 08/10] neard: select distro preference for bluez provider
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
X-List-Received-Date: Sun, 08 Feb 2015 18:42:58 -0000

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---
 meta/recipes-connectivity/neard/neard.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/neard/neard.inc b/meta/recipes-connectivity/neard/neard.inc
index 31bc6dd..6b6b1da 100644
--- a/meta/recipes-connectivity/neard/neard.inc
+++ b/meta/recipes-connectivity/neard/neard.inc
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
  file://src/near.h;beginline=1;endline=20;md5=358e4deefef251a4761e1ffacc965d13 \
  "
 
-inherit autotools pkgconfig systemd update-rc.d
+inherit autotools pkgconfig systemd update-rc.d bluetooth
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
 
@@ -45,7 +45,7 @@ RDEPENDS_${PN} = "dbus python python-dbus python-pygobject"
 
 # Bluez & Wifi are not mandatory except for handover
 RRECOMMENDS_${PN} = "\
-                     ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez4', '', d)} \
+                     ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', '${BLUEZ}', '', d)} \
                      ${@bb.utils.contains('DISTRO_FEATURES', 'wifi','wpa-supplicant', '', d)} \
                     "
 
-- 
1.9.1


