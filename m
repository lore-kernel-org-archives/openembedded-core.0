Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jukka.rissanen@linux.intel.com>) id 1UbsTm-0002DL-HR
	for openembedded-core@lists.openembedded.org;
	Mon, 13 May 2013 15:08:01 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 13 May 2013 05:47:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,662,1363158000"; d="scan'208";a="312667993"
Received: from sorvi.fi.intel.com ([10.237.72.154])
	by orsmga001.jf.intel.com with ESMTP; 13 May 2013 05:49:24 -0700
From: Jukka Rissanen <jukka.rissanen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 May 2013 15:49:17 +0300
Message-Id: <1368449357-3191-6-git-send-email-jukka.rissanen@linux.intel.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <1368449357-3191-1-git-send-email-jukka.rissanen@linux.intel.com>
References: <1368449357-3191-1-git-send-email-jukka.rissanen@linux.intel.com>
Subject: [PATCH v2 5/5] connman: Add PPTP support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 13 May 2013 13:08:23 -0000


Signed-off-by: Jukka Rissanen <jukka.rissanen@linux.intel.com>
---
 meta/recipes-connectivity/connman/connman.inc | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index e17e0e7..638e0e2 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -49,6 +49,7 @@ PACKAGECONFIG[tist] = "--enable-tist,--disable-tist,"
 PACKAGECONFIG[openvpn] = "--enable-openvpn,--disable-openvpn,,openvpn"
 PACKAGECONFIG[vpnc] = "--enable-vpnc,--disable-vpnc,,vpnc"
 PACKAGECONFIG[l2tp] = "--enable-l2tp,--disable-l2tp,,xl2tpd"
+PACKAGECONFIG[pptp] = "--enable-pptp,--disable-pptp,,pptp-linux"
 
 INITSCRIPT_NAME = "connman"
 INITSCRIPT_PARAMS = "start 05 5 2 3 . stop 22 0 1 6 ."
@@ -208,3 +209,12 @@ FILES_${PN}-plugin-vpn-l2tp += "${libdir}/connman/scripts/libppp-plugin.so* \
 INSANE_SKIP_${PN}-plugin-vpn-l2tp += "dev-so"
 RDEPENDS_${PN}-plugin-vpn-l2tp += "${PN}-vpn"
 RRECOMMENDS_${PN} += "${@base_contains('PACKAGECONFIG','l2tp','${PN}-plugin-vpn-l2tp', '', d)}"
+
+SUMMARY_${PN}-plugin-vpn-pptp = "A PPTP plugin for ConnMan VPN"
+DESCRIPTION_${PN}-plugin-vpn-pptp = "The ConnMan PPTP plugin uses pptp-linux client \
+to create a VPN connection to PPTP server."
+FILES_${PN}-plugin-vpn-pptp += "${libdir}/connman/scripts/libppp-plugin.so* \
+                                ${libdir}/connman/plugins-vpn/pptp.so"
+INSANE_SKIP_${PN}-plugin-vpn-pptp += "dev-so"
+RDEPENDS_${PN}-plugin-vpn-pptp += "${PN}-vpn"
+RRECOMMENDS_${PN} += "${@base_contains('PACKAGECONFIG','pptp','${PN}-plugin-vpn-pptp', '', d)}"
-- 
1.7.11.7



