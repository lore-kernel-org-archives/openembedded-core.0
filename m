Return-Path: <morphis@gravedo.de>
Received: from gravedo.de (gravedo.de [85.214.79.159])
	by mail.openembedded.org (Postfix) with ESMTP id E49546028B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 22:29:37 +0000 (UTC)
Received: by gravedo.de (Postfix, from userid 5001)
	id 4DA923B3465B; Thu, 25 Jul 2013 00:29:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h1108419.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00,
	URIBL_BLOCKED autolearn=unavailable version=3.3.1
Received: from localhost (dslb-088-070-147-061.pools.arcor-ip.net
	[88.70.147.61]) by gravedo.de (Postfix) with ESMTPSA id 1BC9C3B3465A;
	Thu, 25 Jul 2013 00:29:32 +0200 (CEST)
From: Simon Busch <morphis@gravedo.de>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Jul 2013 22:29:25 +0000
Message-Id: <1374704965-23479-1-git-send-email-morphis@gravedo.de>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH] wpa-supplicant: enable required configuration options for connman
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
X-List-Received-Date: Wed, 24 Jul 2013 22:29:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Details can be found in the connman documentation:
https://git.kernel.org/cgit/network/connman/connman.git/tree/README#n280

Signed-off-by: Simon Busch <morphis@gravedo.de>
---
 .../wpa-supplicant/wpa-supplicant/defconfig-gnutls  | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig-gnutls b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig-gnutls
index e041b4d..8be4107 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig-gnutls
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig-gnutls
@@ -190,7 +190,7 @@ CONFIG_EAP_LEAP=y
 #CONFIG_EAP_TNC=y
 
 # Wi-Fi Protected Setup (WPS)
-#CONFIG_WPS=y
+CONFIG_WPS=y
 
 # EAP-IKEv2
 #CONFIG_EAP_IKEV2=y
@@ -407,3 +407,22 @@ CONFIG_TLS = gnutls
 #CONFIG_GNUTLS_EXTRA=y
 CONFIG_CTRL_IFACE_DBUS=y
 CONFIG_CTRL_IFACE_DBUS_NEW=y
+
+# AP mode operations with wpa_supplicant
+# This can be used for controlling AP mode operations with wpa_supplicant. It
+# should be noted that this is mainly aimed at simple cases like
+# WPA2-Personal while more complex configurations like WPA2-Enterprise with an
+# external RADIUS server can be supported with hostapd.
+CONFIG_AP=y
+
+CONFIG_BGSCAN_SIMPLE=y
+
+# Autoscan
+# This can be used to enable automatic scan support in wpa_supplicant.
+# See wpa_supplicant.conf for more information on autoscan usage.
+#
+# Enabling directly a module will enable autoscan support.
+# For exponential module:
+CONFIG_AUTOSCAN_EXPONENTIAL=y
+# For periodic module:
+#CONFIG_AUTOSCAN_PERIODIC=y
-- 
1.8.1.2


