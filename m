Return-Path: <cristian.iorga@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id EC95A6E44F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Feb 2014 15:58:42 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 04 Feb 2014 07:54:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,780,1384329600"; d="scan'208";a="449602529"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by orsmga001.jf.intel.com with ESMTP; 04 Feb 2014 07:58:43 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Feb 2014 18:01:30 +0200
Message-Id: <22066cbcff41cf1112f365d471d862a9c1237f8b.1391529644.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1391529644.git.cristian.iorga@intel.com>
References: <cover.1391529644.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1391529644.git.cristian.iorga@intel.com>
References: <cover.1391529644.git.cristian.iorga@intel.com>
Subject: [PATCH 1/2] sbc: upgrade to 1.2
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
X-List-Received-Date: Tue, 04 Feb 2014 15:58:43 -0000

- allows high precision encoding;
- setup enc/dec A2DP streams;
- switched to ${BP};
- license was wrong, corrected;
- added Intel Corporation as a copyright owner,
triggering a change in copyright checksum.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-multimedia/sbc/{sbc_1.1.bb => sbc_1.2.bb} | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-multimedia/sbc/{sbc_1.1.bb => sbc_1.2.bb} (45%)

diff --git a/meta/recipes-multimedia/sbc/sbc_1.1.bb b/meta/recipes-multimedia/sbc/sbc_1.2.bb
similarity index 45%
rename from meta/recipes-multimedia/sbc/sbc_1.1.bb
rename to meta/recipes-multimedia/sbc/sbc_1.2.bb
index d97b160..c9811e7 100644
--- a/meta/recipes-multimedia/sbc/sbc_1.1.bb
+++ b/meta/recipes-multimedia/sbc/sbc_1.2.bb
@@ -2,15 +2,15 @@ SUMMARY = "SBC Audio Codec"
 DESCRIPTION = "Bluetooth low-complexity, subband codec (SBC) library."
 HOMEPAGE = "https://www.bluez.org"
 SECTION = "libs"
-LICENSE = "LGPLv2.1+"
+LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
-                    file://sbc/sbc.h;beginline=1;endline=25;md5=0a7e4f502980cc3ee0541341fa2db47e"
+                    file://sbc/sbc.h;beginline=1;endline=26;md5=0f57d0df22b0d40746bdd29805a4361b"
 
 DEPENDS = "libsndfile1"
 
-SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/${BPN}-${PV}.tar.xz"
+SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/${BP}.tar.xz"
 
-SRC_URI[md5sum] = "ecadadbfd4b1dfe7b98f446c69126b23"
-SRC_URI[sha256sum] = "9a30ad2dc20979a0847a7b1a06ea073498810f358a02fcad68ab414f239cfbc6"
+SRC_URI[md5sum] = "ec65c444ad4c32aa85702641045b19e9"
+SRC_URI[sha256sum] = "c2f01ea54f7473704825113a9cdd46a23e67c650eff575f0670c3d9d66c4a5dc"
 
 inherit autotools
-- 
1.8.3.2


