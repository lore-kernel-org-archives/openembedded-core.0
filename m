Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1SmO0x-0008OU-NU
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jul 2012 13:44:59 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 04 Jul 2012 04:33:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="166822222"
Received: from sentry (HELO localhost.localdomain) ([10.237.105.53])
	by orsmga002.jf.intel.com with ESMTP; 04 Jul 2012 04:33:55 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Jul 2012 14:34:00 +0300
Message-Id: <1341401643-4395-3-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1341401643-4395-1-git-send-email-cristian.iorga@intel.com>
References: <1341401643-4395-1-git-send-email-cristian.iorga@intel.com>
Subject: [PATCH 2/5] bluez4: update to ver. 4.101
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
X-List-Received-Date: Wed, 04 Jul 2012 11:45:00 -0000

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../{bluez4-4.99 => bluez4-4.101}/bluetooth.conf   |    0
 .../{bluez4-4.99 => bluez4-4.101}/sbc_mmx.patch    |    0
 .../bluez/{bluez4_4.99.bb => bluez4_4.101.bb}      |    9 ++++-----
 3 files changed, 4 insertions(+), 5 deletions(-)
 rename meta/recipes-connectivity/bluez/{bluez4-4.99 => bluez4-4.101}/bluetooth.conf (100%)
 rename meta/recipes-connectivity/bluez/{bluez4-4.99 => bluez4-4.101}/sbc_mmx.patch (100%)
 rename meta/recipes-connectivity/bluez/{bluez4_4.99.bb => bluez4_4.101.bb} (83%)

diff --git a/meta/recipes-connectivity/bluez/bluez4-4.99/bluetooth.conf b/meta/recipes-connectivity/bluez/bluez4-4.101/bluetooth.conf
similarity index 100%
rename from meta/recipes-connectivity/bluez/bluez4-4.99/bluetooth.conf
rename to meta/recipes-connectivity/bluez/bluez4-4.101/bluetooth.conf
diff --git a/meta/recipes-connectivity/bluez/bluez4-4.99/sbc_mmx.patch b/meta/recipes-connectivity/bluez/bluez4-4.101/sbc_mmx.patch
similarity index 100%
rename from meta/recipes-connectivity/bluez/bluez4-4.99/sbc_mmx.patch
rename to meta/recipes-connectivity/bluez/bluez4-4.101/sbc_mmx.patch
diff --git a/meta/recipes-connectivity/bluez/bluez4_4.99.bb b/meta/recipes-connectivity/bluez/bluez4_4.101.bb
similarity index 83%
rename from meta/recipes-connectivity/bluez/bluez4_4.99.bb
rename to meta/recipes-connectivity/bluez/bluez4_4.101.bb
index 32831e7..a2ba66f 100644
--- a/meta/recipes-connectivity/bluez/bluez4_4.99.bb
+++ b/meta/recipes-connectivity/bluez/bluez4_4.101.bb
@@ -1,13 +1,12 @@
 require bluez4.inc
 
-PR = "r2"
+PR = "r0"
 
 SRC_URI += "file://bluetooth.conf \
-            file://sbc_mmx.patch \
-           "
+            file://sbc_mmx.patch"
 
-SRC_URI[md5sum] = "570aa10692ed890aa0a4297b37824912"
-SRC_URI[sha256sum] = "d884b9aa5d3d9653c076b7646ca14a3e43eb84bccfe8193c49690f802bbd827c"
+SRC_URI[md5sum] = "fb42cb7038c380eb0e2fa208987c96ad"
+SRC_URI[sha256sum] = "59738410ade9f0e61a13c0f77d9aaffaafe49ba9418107e4ad75fe52846f7487"
 
 do_install_append() {
 	install -m 0644 ${S}/audio/audio.conf ${D}/${sysconfdir}/bluetooth/
-- 
1.7.9.5



