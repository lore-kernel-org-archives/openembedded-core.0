Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa07-10.prod.phx3.secureserver.net
	(p3plsmtpa07-10.prod.phx3.secureserver.net [173.201.192.239])
	by mail.openembedded.org (Postfix) with ESMTP id 00BBF720C1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Nov 2014 21:13:27 +0000 (UTC)
Received: from llc.pab ([75.72.225.8])
	by p3plsmtpa07-10.prod.phx3.secureserver.net with 
	id DxDM1p00G0BVjqb01xDUxV; Mon, 10 Nov 2014 14:13:29 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Nov 2014 15:13:09 -0600
Message-Id: <db8d02d9d83a27500509e0536094012dc6542bb1.1415647839.git.pab@pabigot.com>
X-Mailer: git-send-email 1.8.5.5
In-Reply-To: <cover.1415647839.git.pab@pabigot.com>
References: <cover.1415647839.git.pab@pabigot.com>
In-Reply-To: <cover.1415647839.git.pab@pabigot.com>
References: <cover.1415647839.git.pab@pabigot.com>
Subject: [RFC 12/14] connman: switch to virtual/bluez
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

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---
 meta/recipes-connectivity/connman/connman.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index f121a81..9af7d87 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -41,7 +41,7 @@ PACKAGECONFIG ??= "wispr \
 # PACKAGECONFIG_append_pn-connman = " openvpn vpnc l2tp pptp"
 
 PACKAGECONFIG[wifi] = "--enable-wifi, --disable-wifi, wpa-supplicant"
-PACKAGECONFIG[bluetooth] = "--enable-bluetooth, --disable-bluetooth, bluez4"
+PACKAGECONFIG[bluetooth] = "--enable-bluetooth, --disable-bluetooth, virtual/bluez"
 PACKAGECONFIG[3g] = "--enable-ofono, --disable-ofono, ofono"
 PACKAGECONFIG[tist] = "--enable-tist,--disable-tist,"
 PACKAGECONFIG[openvpn] = "--enable-openvpn --with-openvpn=${sbindir}/openvpn,--disable-openvpn,,openvpn"
@@ -113,7 +113,7 @@ RPROVIDES_${PN} = "\
 
 RDEPENDS_${PN} = "\
 	dbus \
-	${@bb.utils.contains('PACKAGECONFIG', 'bluetooth', 'bluez4', '', d)} \
+	${@bb.utils.contains('PACKAGECONFIG', 'bluetooth', '${VIRTUAL-RUNTIME_bluez}', '', d)} \
 	${@bb.utils.contains('PACKAGECONFIG', 'wifi','wpa-supplicant', '', d)} \
 	${@bb.utils.contains('PACKAGECONFIG', '3g','ofono', '', d)} \
 	xuser-account \
-- 
1.8.5.5


