Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1UFSsJ-0002YS-JF
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Mar 2013 18:20:34 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 12 Mar 2013 10:03:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,832,1355126400"; d="scan'208";a="213474574"
Received: from sentry (HELO sentry.rb.intel.com) ([10.237.105.54])
	by AZSMGA002.ch.intel.com with ESMTP; 12 Mar 2013 10:02:47 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Mar 2013 19:03:14 +0200
Message-Id: <1363107795-2140-4-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1363107795-2140-1-git-send-email-cristian.iorga@intel.com>
References: <1363107795-2140-1-git-send-email-cristian.iorga@intel.com>
Subject: [PATCH V2 3/4] bluez5: conflicts with bluez4
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
X-List-Received-Date: Tue, 12 Mar 2013 17:20:38 -0000

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-connectivity/bluez5/bluez5_5.3.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.3.bb b/meta/recipes-connectivity/bluez5/bluez5_5.3.bb
index 311562f..5963483 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.3.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.3.bb
@@ -6,6 +6,8 @@ SRC_URI += "file://bluetooth.conf \
 SRC_URI[md5sum] = "44de20f6422bf90a01b8df48e7dfe4ed"
 SRC_URI[sha256sum] = "828e2cd1109835c2fc1d731fb7fd7b46951044e451cc8556a37e1312d8c8c9a6"
 
+RCONFLICTS_${PN} = "bluez4"
+
 do_install_append() {
 	install -d ${D}${sysconfdir}/bluetooth/
 	install -m 0644 ${S}/profiles/audio/audio.conf ${D}/${sysconfdir}/bluetooth/
-- 
1.7.10.4



