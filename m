Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1UaQ3C-0003TX-DJ
	for openembedded-core@lists.openembedded.org;
	Thu, 09 May 2013 14:34:26 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 09 May 2013 05:14:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,641,1363158000"; d="scan'208";a="310699795"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by orsmga001.jf.intel.com with ESMTP; 09 May 2013 05:16:16 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 May 2013 15:17:09 +0300
Message-Id: <1368101829-4189-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] sbc: upgrade to 1.1
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
X-List-Received-Date: Thu, 09 May 2013 12:34:31 -0000

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-multimedia/sbc/{sbc_1.0.bb => sbc_1.1.bb} |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta/recipes-multimedia/sbc/{sbc_1.0.bb => sbc_1.1.bb} (75%)

diff --git a/meta/recipes-multimedia/sbc/sbc_1.0.bb b/meta/recipes-multimedia/sbc/sbc_1.1.bb
similarity index 75%
rename from meta/recipes-multimedia/sbc/sbc_1.0.bb
rename to meta/recipes-multimedia/sbc/sbc_1.1.bb
index d16f389..d97b160 100644
--- a/meta/recipes-multimedia/sbc/sbc_1.0.bb
+++ b/meta/recipes-multimedia/sbc/sbc_1.1.bb
@@ -6,13 +6,11 @@ LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
                     file://sbc/sbc.h;beginline=1;endline=25;md5=0a7e4f502980cc3ee0541341fa2db47e"
 
-PR = "r0"
-
 DEPENDS = "libsndfile1"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/${BPN}-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "aa2bc39c4a09aade064efea4bbbc4b2d"
-SRC_URI[sha256sum] = "bf970aa21226c594bb04ba3d949770c8fd91dc8f953556305f20c1016b16b882"
+SRC_URI[md5sum] = "ecadadbfd4b1dfe7b98f446c69126b23"
+SRC_URI[sha256sum] = "9a30ad2dc20979a0847a7b1a06ea073498810f358a02fcad68ab414f239cfbc6"
 
 inherit autotools
-- 
1.7.10.4



