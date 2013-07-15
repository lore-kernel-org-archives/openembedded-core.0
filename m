Return-Path: <cristian.iorga@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 7CD7D619DD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2013 15:16:16 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 15 Jul 2013 06:48:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,668,1367996400"; d="scan'208";a="268467673"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by AZSMGA002.ch.intel.com with ESMTP; 15 Jul 2013 06:48:48 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Jul 2013 16:50:25 +0300
Message-Id: <809bd57326a24570dfd583e33821f42c4e7b930a.1373896070.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1373896070.git.cristian.iorga@intel.com>
References: <cover.1373896070.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1373896070.git.cristian.iorga@intel.com>
References: <cover.1373896070.git.cristian.iorga@intel.com>
Subject: [PATCH 2/2] bluez4: conflicts with/replaces bluez5
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
X-List-Received-Date: Mon, 15 Jul 2013 15:16:22 -0000

- RCONFLICTS/RREPLACES bluez5

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-connectivity/bluez/bluez4_4.101.bb |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-connectivity/bluez/bluez4_4.101.bb b/meta/recipes-connectivity/bluez/bluez4_4.101.bb
index f48adfd..b91c9c3 100644
--- a/meta/recipes-connectivity/bluez/bluez4_4.101.bb
+++ b/meta/recipes-connectivity/bluez/bluez4_4.101.bb
@@ -11,6 +11,9 @@ SRC_URI += "file://bluetooth.conf \
 SRC_URI[md5sum] = "fb42cb7038c380eb0e2fa208987c96ad"
 SRC_URI[sha256sum] = "59738410ade9f0e61a13c0f77d9aaffaafe49ba9418107e4ad75fe52846f7487"
 
+RCONFLICTS_${PN} = "bluez5"
+RREPLACES_${PN} = "bluez5"
+
 do_install_append() {
 	install -m 0644 ${S}/audio/audio.conf ${D}/${sysconfdir}/bluetooth/
 	install -m 0644 ${S}/network/network.conf ${D}/${sysconfdir}/bluetooth/
-- 
1.7.10.4


