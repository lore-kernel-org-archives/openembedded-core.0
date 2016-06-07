Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 3ED5A771D2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jun 2016 08:48:47 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 07 Jun 2016 01:48:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,432,1459839600"; d="scan'208";a="823174742"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga003.jf.intel.com with ESMTP; 07 Jun 2016 01:48:43 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Jun 2016 11:47:51 +0300
Message-Id: <8a877e57a8b8613493c463a1ba6296490d3d04f0.1465288175.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <7e2909e70b87ffcf2c752bd6ac326ef256bdc1b2.1465288175.git.jussi.kukkonen@intel.com>
References: <7e2909e70b87ffcf2c752bd6ac326ef256bdc1b2.1465288175.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1465288174.git.jussi.kukkonen@intel.com>
References: <cover.1465288174.git.jussi.kukkonen@intel.com>
Subject: [PATCH 33/37] matchbox-desktop-sato: Upgrade to remove Utilities folder
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
X-List-Received-Date: Tue, 07 Jun 2016 08:48:48 -0000

This version merges Utilities into Applications to make the common
case a little more useful: Now e.g. Terminal icon should be visible
on startup.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-sato/matchbox-desktop-sato/matchbox-desktop-sato_git.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-sato/matchbox-desktop-sato/matchbox-desktop-sato_git.bb b/meta/recipes-sato/matchbox-desktop-sato/matchbox-desktop-sato_git.bb
index 1979cbb..7d31551 100644
--- a/meta/recipes-sato/matchbox-desktop-sato/matchbox-desktop-sato_git.bb
+++ b/meta/recipes-sato/matchbox-desktop-sato/matchbox-desktop-sato_git.bb
@@ -9,9 +9,8 @@ SECTION = "x11"
 DEPENDS = ""
 RCONFLICTS_${PN} = "matchbox-common"
 
-SRCREV = "810b0b08eb79e4685202da2ec347b990bb467e07"
+SRCREV = "4a02b6408565f083802592f152e05dee9b40e05b"
 PV = "0.1+git${SRCPV}"
-PR = "r1"
 
 SRC_URI = "git://git.yoctoproject.org/${BPN}"
 
-- 
2.1.4


