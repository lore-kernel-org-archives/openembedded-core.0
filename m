Return-Path: <jukka.rissanen@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id A47CB6ABBB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jul 2013 10:53:58 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 01 Jul 2013 03:53:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,973,1363158000"; d="scan'208";a="324973085"
Received: from sorvi.fi.intel.com ([10.237.72.154])
	by azsmga001.ch.intel.com with ESMTP; 01 Jul 2013 03:48:58 -0700
From: Jukka Rissanen <jukka.rissanen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Jul 2013 13:48:57 +0300
Message-Id: <1372675737-32451-1-git-send-email-jukka.rissanen@linux.intel.com>
X-Mailer: git-send-email 1.7.11.7
Subject: [PATCH] connman: Set the VPN client program paths
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
X-List-Received-Date: Mon, 01 Jul 2013 10:53:58 -0000

Automatically finding out the paths to VPN client programs does
not work when configure script is run so set the paths manually.

Signed-off-by: Jukka Rissanen <jukka.rissanen@linux.intel.com>
---
 meta/recipes-connectivity/connman/connman.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index f250d78..e6584ff 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -46,10 +46,10 @@ PACKAGECONFIG[wifi] = "--enable-wifi, --disable-wifi, wpa-supplicant"
 PACKAGECONFIG[bluetooth] = "--enable-bluetooth, --disable-bluetooth, bluez4"
 PACKAGECONFIG[3g] = "--enable-ofono, --disable-ofono, ofono"
 PACKAGECONFIG[tist] = "--enable-tist,--disable-tist,"
-PACKAGECONFIG[openvpn] = "--enable-openvpn,--disable-openvpn,,openvpn"
-PACKAGECONFIG[vpnc] = "--enable-vpnc,--disable-vpnc,,vpnc"
-PACKAGECONFIG[l2tp] = "--enable-l2tp,--disable-l2tp,,xl2tpd"
-PACKAGECONFIG[pptp] = "--enable-pptp,--disable-pptp,,pptp-linux"
+PACKAGECONFIG[openvpn] = "--enable-openvpn --with-openvpn=${sbindir}/openvpn,--disable-openvpn,,openvpn"
+PACKAGECONFIG[vpnc] = "--enable-vpnc --with-vpnc=${sbindir}/vpnc,--disable-vpnc,,vpnc"
+PACKAGECONFIG[l2tp] = "--enable-l2tp --with-l2tp=${sbindir}/xl2tpd,--disable-l2tp,,xl2tpd"
+PACKAGECONFIG[pptp] = "--enable-pptp --with-pptp=${sbindir}/pptp,--disable-pptp,,pptp-linux"
 # WISPr support for logging into hotspots, requires TLS
 PACKAGECONFIG[wispr] = "--enable-wispr,--disable-wispr,gnutls,"
 
-- 
1.7.11.7


