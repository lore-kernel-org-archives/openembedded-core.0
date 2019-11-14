Return-Path: <naveen.kumar.saini@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 2DBF97F6CF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2019 05:48:02 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Nov 2019 21:48:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,302,1569308400"; d="scan'208";a="379466808"
Received: from saininav-desk1.png.intel.com ([172.30.199.21])
	by orsmga005.jf.intel.com with ESMTP; 13 Nov 2019 21:48:02 -0800
From: Naveen Saini <naveen.kumar.saini@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Nov 2019 13:51:40 +0800
Message-Id: <20191114055140.35965-1-naveen.kumar.saini@intel.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/2] libva: upgrade 2.5.0 -> 2.6.0.pre1
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
X-List-Received-Date: Thu, 14 Nov 2019 05:48:03 -0000

Details can be found here:
https://github.com/intel/libva/releases/tag/2.6.0.pre1

Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
---
 .../libva/{libva_2.5.0.bb => libva_2.6.0.pre1.bb}          | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/libva/{libva_2.5.0.bb => libva_2.6.0.pre1.bb} (88%)

diff --git a/meta/recipes-graphics/libva/libva_2.5.0.bb b/meta/recipes-graphics/libva/libva_2.6.0.pre1.bb
similarity index 88%
rename from meta/recipes-graphics/libva/libva_2.5.0.bb
rename to meta/recipes-graphics/libva/libva_2.6.0.pre1.bb
index e75648b2be..73ea280053 100644
--- a/meta/recipes-graphics/libva/libva_2.5.0.bb
+++ b/meta/recipes-graphics/libva/libva_2.6.0.pre1.bb
@@ -17,10 +17,9 @@ SECTION = "x11"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2e48940f94acb0af582e5ef03537800f"
 
-SRC_URI = "https://github.com/intel/${BPN}/releases/download/${PV}/${BP}.tar.bz2"
-
-SRC_URI[md5sum] = "3688212fb7a87947070f3729e91ff7cf"
-SRC_URI[sha256sum] = "3aa89cd369a506ac4dbe5de7c0ef5da4f3d220bf986403f02fa1f6f702af6878"
+SRC_URI = "git://github.com/intel/libva.git;protocol=https"
+SRCREV = "d49b99d5d88f66e2e1ca451cf19251c7950c870d"
+S = "${WORKDIR}/git"
 
 UPSTREAM_CHECK_URI = "https://github.com/intel/libva/releases"
 
-- 
2.17.1


