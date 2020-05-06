Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web12.1268.1588809567713812573
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 May 2020 16:59:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: enedino.org, ip: 13.77.154.182, mailfrom: alejandro@enedino.org)
Received: from ALSAMON-X.corp.microsoft.com (unknown [131.107.159.250])
	by linux.microsoft.com (Postfix) with ESMTPSA id BCB1620B717B
	for <openembedded-core@lists.openembedded.org>; Wed,  6 May 2020 16:59:26 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com BCB1620B717B
From: "Alejandro Hernandez" <alejandro@enedino.org>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] connman: Include vpn-script in FILES
Date: Wed,  6 May 2020 16:59:19 -0700
Message-Id: <20200506235919.6385-1-alejandro@enedino.org>
X-Mailer: git-send-email 2.17.1

When vpnc support is included through PACKAGECONFIG, there
is now an extra vpn-script coming after the atest upgrade,
include that script into FILES so it gets packaged.

Signed-off-by: Alejandro Hernandez Samaniego <alejandro@enedino.org>
---
 meta/recipes-connectivity/connman/connman.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index b60178cefc..7888bc2c1b 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -195,7 +195,8 @@ SUMMARY_${PN}-plugin-vpn-vpnc = "A vpnc plugin for ConnMan VPN"
 DESCRIPTION_${PN}-plugin-vpn-vpnc = "The ConnMan vpnc plugin uses vpnc client \
 to create a VPN connection to Cisco3000 VPN Concentrator."
 FILES_${PN}-plugin-vpn-vpnc += "${libdir}/connman/scripts/openconnect-script \
-                                ${libdir}/connman/plugins-vpn/vpnc.so"
+                                ${libdir}/connman/plugins-vpn/vpnc.so \
+                                ${libdir}/connman/scripts/vpn-script"
 RDEPENDS_${PN}-plugin-vpn-vpnc += "${PN}-vpn"
 RRECOMMENDS_${PN} += "${@bb.utils.contains('PACKAGECONFIG','vpnc','${PN}-plugin-vpn-vpnc', '', d)}"
 
-- 
2.17.1

