Return-Path: <cristian.iorga@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 94DCC65C85
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Feb 2015 13:08:35 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 17 Feb 2015 05:00:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,594,1418112000"; d="scan'208";a="686780884"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by orsmga002.jf.intel.com with ESMTP; 17 Feb 2015 05:08:10 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Feb 2015 15:07:55 +0200
Message-Id: <1e5392149959a6ba11556b7595013e62106c68f5.1424178303.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1424178303.git.cristian.iorga@intel.com>
References: <cover.1424178303.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1424178303.git.cristian.iorga@intel.com>
References: <cover.1424178303.git.cristian.iorga@intel.com>
Subject: [PATCH v2 02/11] packagegroup-base: select distro preference for bluez provider
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
X-List-Received-Date: Tue, 17 Feb 2015 13:08:39 -0000

From: "Peter A. Bigot" <pab@pabigot.com>

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---
 meta/recipes-core/packagegroups/packagegroup-base.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/recipes-core/packagegroups/packagegroup-base.bb
index f4b2cd5..369b63e 100644
--- a/meta/recipes-core/packagegroups/packagegroup-base.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
@@ -8,6 +8,7 @@ PR = "r83"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit packagegroup
+inherit bluetooth
 
 PROVIDES = "${PACKAGES}"
 PACKAGES = ' \
@@ -203,7 +204,7 @@ RRECOMMENDS_packagegroup-base-pcmcia = "\
 
 SUMMARY_packagegroup-base-bluetooth = "Bluetooth support"
 RDEPENDS_packagegroup-base-bluetooth = "\
-    bluez4 \
+    ${BLUEZ} \
     ${@bb.utils.contains('COMBINED_FEATURES', 'alsa', 'libasound-module-bluez', '',d)} \
     "
 
-- 
2.1.0


