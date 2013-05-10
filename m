Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jukka.rissanen@linux.intel.com>) id 1Uamop-0004yv-9K
	for openembedded-core@lists.openembedded.org;
	Fri, 10 May 2013 14:53:09 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 10 May 2013 05:33:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,647,1363158000"; d="scan'208";a="331933790"
Received: from sorvi.fi.intel.com ([10.237.72.154])
	by fmsmga001.fm.intel.com with ESMTP; 10 May 2013 05:33:24 -0700
From: Jukka Rissanen <jukka.rissanen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 May 2013 15:33:18 +0300
Message-Id: <1368189198-1294-6-git-send-email-jukka.rissanen@linux.intel.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <1368189198-1294-1-git-send-email-jukka.rissanen@linux.intel.com>
References: <1368189198-1294-1-git-send-email-jukka.rissanen@linux.intel.com>
Subject: [PATCH 5/5] connman: Add PPTP support
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
X-List-Received-Date: Fri, 10 May 2013 12:53:22 -0000

Signed-off-by: Jukka Rissanen <jukka.rissanen@linux.intel.com>
---
 meta/recipes-connectivity/connman/connman.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index 43b363b..d9ab234 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -39,6 +39,7 @@ PACKAGECONFIG ??= "\
                    ${@base_contains('DISTRO_FEATURES', 'vpn','openvpn', '', d)} \
                    ${@base_contains('DISTRO_FEATURES', 'vpn','vpnc', '', d)} \
                    ${@base_contains('DISTRO_FEATURES', 'vpn','l2tp', '', d)} \
+                   ${@base_contains('DISTRO_FEATURES', 'vpn','pptp', '', d)} \
 "
 
 PACKAGECONFIG[wifi] = "--enable-wifi, --disable-wifi, wpa-supplicant"
@@ -48,6 +49,7 @@ PACKAGECONFIG[tist] = "--enable-tist,--disable-tist,"
 PACKAGECONFIG[openvpn] = "--enable-openvpn,--disable-openvpn, openvpn"
 PACKAGECONFIG[vpnc] = "--enable-vpnc,--disable-vpnc, vpnc"
 PACKAGECONFIG[l2tp] = "--enable-l2tp,--disable-l2tp, xl2tpd"
+PACKAGECONFIG[pptp] = "--enable-pptp,--disable-pptp, pptp-linux"
 
 INITSCRIPT_NAME = "connman"
 INITSCRIPT_PARAMS = "start 05 5 2 3 . stop 22 0 1 6 ."
@@ -174,3 +176,5 @@ FILES_${PN}-plugin-vpn-openvpn += "${libdir}/connman/scripts/openvpn-script"
 FILES_${PN}-plugin-vpn-vpnc += "${libdir}/connman/scripts/openconnect-script"
 FILES_${PN}-plugin-vpn-l2tp += "${libdir}/connman/scripts/libppp-plugin.so*"
 INSANE_SKIP_${PN}-plugin-vpn-l2tp += "dev-so"
+FILES_${PN}-plugin-vpn-pptp += "${libdir}/connman/scripts/libppp-plugin.so*"
+INSANE_SKIP_${PN}-plugin-vpn-pptp += "dev-so"
-- 
1.7.11.7



