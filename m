Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jukka.rissanen@linux.intel.com>) id 1UcAbr-0003Zj-Uj
	for openembedded-core@lists.openembedded.org;
	Tue, 14 May 2013 10:29:42 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 14 May 2013 01:10:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,667,1363158000"; d="scan'208";a="302127718"
Received: from sorvi.fi.intel.com ([10.237.72.154])
	by azsmga001.ch.intel.com with ESMTP; 14 May 2013 01:10:50 -0700
From: Jukka Rissanen <jukka.rissanen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 May 2013 11:10:43 +0300
Message-Id: <1368519045-8266-4-git-send-email-jukka.rissanen@linux.intel.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <1368519045-8266-1-git-send-email-jukka.rissanen@linux.intel.com>
References: <1368519045-8266-1-git-send-email-jukka.rissanen@linux.intel.com>
Subject: [PATCH v3 3/5] connman: Add vpnc support
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
X-List-Received-Date: Tue, 14 May 2013 08:30:01 -0000


Signed-off-by: Jukka Rissanen <jukka.rissanen@linux.intel.com>
---
 meta/recipes-connectivity/connman/connman.inc | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index b7466f5..8fd38ee 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -47,6 +47,7 @@ PACKAGECONFIG[bluetooth] = "--enable-bluetooth, --disable-bluetooth, bluez4"
 PACKAGECONFIG[3g] = "--enable-ofono, --disable-ofono, ofono"
 PACKAGECONFIG[tist] = "--enable-tist,--disable-tist,"
 PACKAGECONFIG[openvpn] = "--enable-openvpn,--disable-openvpn,,openvpn"
+PACKAGECONFIG[vpnc] = "--enable-vpnc,--disable-vpnc,,vpnc"
 
 INITSCRIPT_NAME = "connman"
 INITSCRIPT_PARAMS = "start 05 5 2 3 . stop 22 0 1 6 ."
@@ -181,3 +182,11 @@ FILES_${PN}-plugin-vpn-openvpn += "${libdir}/connman/scripts/openvpn-script \
                                    ${libdir}/connman/plugins-vpn/openvpn.so"
 RDEPENDS_${PN}-plugin-vpn-openvpn += "${PN}-vpn"
 RRECOMMENDS_${PN} += "${@base_contains('PACKAGECONFIG','openvpn','${PN}-plugin-vpn-openvpn', '', d)}"
+
+SUMMARY_${PN}-plugin-vpn-vpnc = "A vpnc plugin for ConnMan VPN"
+DESCRIPTION_${PN}-plugin-vpn-vpnc = "The ConnMan vpnc plugin uses vpnc client \
+to create a VPN connection to Cisco3000 VPN Concentrator."
+FILES_${PN}-plugin-vpn-vpnc += "${libdir}/connman/scripts/openconnect-script \
+                                ${libdir}/connman/plugins-vpn/vpnc.so"
+RDEPENDS_${PN}-plugin-vpn-vpnc += "${PN}-vpn"
+RRECOMMENDS_${PN} += "${@base_contains('PACKAGECONFIG','vpnc','${PN}-plugin-vpn-vpnc', '', d)}"
-- 
1.7.11.7



