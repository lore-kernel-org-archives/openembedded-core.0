Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1SwZ6x-0006Ps-B2
	for Openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 15:37:15 +0200
Received: from puchatek.dom (87-206-60-144.dynamic.chello.pl [87.206.60.144])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id D9350D20BC;
	Wed,  1 Aug 2012 15:25:43 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: Openembedded-core@lists.openembedded.org
Date: Wed,  1 Aug 2012 15:25:29 +0200
Message-Id: <1343827529-30803-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] dbus: provide/replace dbus-x11 only for target
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Aug 2012 13:37:15 -0000

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 meta/recipes-core/dbus/dbus.inc |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index 164c4d3..53171e9 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -34,6 +34,10 @@ DEBIANNAME_${PN} = "dbus-1"
 PACKAGES =+ "${PN}-lib ${PN}-systemd"
 
 # for compatibility
+RPROVIDES_${PN}_virtclass-native = ""
+RPROVIDES_${PN}_virtclass-nativesdk = ""
+RREPLACES_${PN}_virtclass-native = ""
+RREPLACES_${PN}_virtclass-nativesdk = ""
 RPROVIDES_${PN} = "dbus-x11"
 RREPLACES_${PN} += "dbus-x11"
 
-- 
1.7.10.4



