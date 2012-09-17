Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TDYoS-0008LM-PC
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Sep 2012 12:44:24 +0200
Received: by wibhq4 with SMTP id hq4so1894453wib.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2012 03:31:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=GFeoHAyZ10SLMgpNzL3ZUEjQ7N3aJ84OcCgCnyMqJlY=;
	b=D8JSll7LNEHNLPKGNHGntls4c7ML5X9RKvbsZE+qJCZsLs0jn5ZOuuKQDVUqMOjb//
	2ed3/vzJXC0OpxXRzy9hWq7kpg6Bz1ztw6/rmsS7lT9Tk+SCqMLBKsp1VXyJw0UssKK5
	VlOW9QFP/4BKVDu/iPICG3zMzyNKFJ4IlaVClB3HB5kx4d86MwMNPbFog3wB+B211Ije
	fTGf+CpOkbr8g+8GHW+zUALeoS1sSaFM4Cai7qI4rts+JpOLusoER87oO8c1Jimljxb9
	rjk5I2DZRPH6Cfiqu3dNYuIbbrYTfZEvA4zFEVFvA5GTzuBct99/B8g9cPrXbboRsGGF
	u5AA==
Received: by 10.216.193.77 with SMTP id j55mr5681297wen.187.1347877906329;
	Mon, 17 Sep 2012 03:31:46 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id t7sm24968727wix.6.2012.09.17.03.31.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Sep 2012 03:31:45 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Sep 2012 12:30:51 +0200
Message-Id: <1347877853-30738-3-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1347877853-30738-1-git-send-email-koen@dominion.thruhere.net>
References: <1347877853-30738-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQl1DC5w2jFOb/maZNv5lgdXh7T24z3dbTQrcvJvMCrkgMK4qqAiKsnGhE/Yvngo6e8vvqGV
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: [for-denzil][bluez-updates 3/5] gst-plugin-bluetooth: update to ver. 4.101
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
X-List-Received-Date: Mon, 17 Sep 2012 10:44:24 -0000

From: Cristian Iorga <cristian.iorga@intel.com>

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../bluez/gst-plugin-bluetooth_4.101.bb            |   38 +++++++++++++++++++
 .../bluez/gst-plugin-bluetooth_4.99.bb             |   39 --------------------
 2 files changed, 38 insertions(+), 39 deletions(-)
 create mode 100644 meta/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb
 delete mode 100644 meta/recipes-connectivity/bluez/gst-plugin-bluetooth_4.99.bb

diff --git a/meta/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb b/meta/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb
new file mode 100644
index 0000000..49135ab
--- /dev/null
+++ b/meta/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb
@@ -0,0 +1,38 @@
+require bluez4.inc
+require recipes-multimedia/gstreamer/gst-plugins-package.inc
+
+PR = "r0"
+
+SRC_URI[md5sum] = "fb42cb7038c380eb0e2fa208987c96ad"
+SRC_URI[sha256sum] = "59738410ade9f0e61a13c0f77d9aaffaafe49ba9418107e4ad75fe52846f7487"
+
+DEPENDS = "bluez4 gst-plugins-base"
+
+EXTRA_OECONF = "\
+  --enable-gstreamer \
+"
+
+# clean unwanted files
+do_install_append() {
+	rm -rf ${D}${bindir}
+	rm -rf ${D}${sbindir}
+	rm -f  ${D}${libdir}/lib*
+	rm -rf ${D}${libdir}/pkgconfig
+	rm -rf ${D}${sysconfdir}
+	rm -rf ${D}${base_libdir}
+	rm -rf ${D}${libdir}/bluetooth
+	rm -rf ${D}${localstatedir}
+  	rm -rf ${D}${libdir}/alsa-lib
+  	rm -rf ${D}${datadir}
+	rm -rf ${D}${includedir}
+}
+
+FILES_${PN} = "${libdir}/gstreamer-0.10/lib*.so"
+FILES_${PN}-dev += "\
+  ${libdir}/gstreamer-0.10/*.la \
+"
+
+FILES_${PN}-dbg += "\
+  ${libdir}/*/.debug \
+"
+
diff --git a/meta/recipes-connectivity/bluez/gst-plugin-bluetooth_4.99.bb b/meta/recipes-connectivity/bluez/gst-plugin-bluetooth_4.99.bb
deleted file mode 100644
index f8dab52..0000000
--- a/meta/recipes-connectivity/bluez/gst-plugin-bluetooth_4.99.bb
+++ /dev/null
@@ -1,39 +0,0 @@
-require bluez4.inc
-require recipes-multimedia/gstreamer/gst-plugins-package.inc
-
-PR = "r2"
-
-SRC_URI[md5sum] = "570aa10692ed890aa0a4297b37824912"
-SRC_URI[sha256sum] = "d884b9aa5d3d9653c076b7646ca14a3e43eb84bccfe8193c49690f802bbd827c"
-
-DEPENDS = "bluez4 gst-plugins-base"
-
-EXTRA_OECONF = "\
-  --enable-gstreamer \
-"
-
-# clean unwanted files
-do_install_append() {
-	rm -rf ${D}${bindir}
-	rm -rf ${D}${sbindir}
-	rm -f  ${D}${libdir}/lib*
-	rm -rf ${D}${libdir}/pkgconfig
-	rm -rf ${D}${sysconfdir}
-	rm -rf ${D}${base_libdir}
-	rm -rf ${D}${libdir}/bluetooth
-	rm -rf ${D}${localstatedir}
-  	rm -rf ${D}${libdir}/alsa-lib
-  	rm -rf ${D}${datadir}
-	rm -rf ${D}${includedir}
-}
-
-FILES_${PN} = "${libdir}/gstreamer-0.10/lib*.so"
-FILES_${PN}-dev += "\
-  ${libdir}/gstreamer-0.10/*.la \
-"
-
-FILES_${PN}-dbg += "\
-  ${libdir}/*/.debug \
-"
-
-
-- 
1.7.7.6



