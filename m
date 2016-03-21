Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 27E676FFD4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2016 19:43:21 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 21 Mar 2016 12:43:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,373,1455004800"; d="scan'208";a="673362629"
Received: from theory.fi.intel.com ([10.237.72.196])
	by FMSMGA003.fm.intel.com with ESMTP; 21 Mar 2016 12:43:21 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Mar 2016 21:43:18 +0200
Message-Id: <bb5be82eba2b4195cf99e3767a8554f517b6d6a1.1458587440.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <8ee737433c7c8a18d3ee295aa66ea379ad309989.1458587440.git.jussi.kukkonen@intel.com>
References: <8ee737433c7c8a18d3ee295aa66ea379ad309989.1458587440.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1458587440.git.jussi.kukkonen@intel.com>
References: <cover.1458587440.git.jussi.kukkonen@intel.com>
Subject: [PATCH 2/2] matchbox-wm: Update to fix XChangeProperty datatype issue
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
X-List-Received-Date: Mon, 21 Mar 2016 19:43:22 -0000

This brings us to master HEAD and adds a single commit
compared to the previous version:
  8178e70 ewmh: Fix data type of a few XChangeProperty calls

This fixes broken Home-button in matchbox panel on mips64 (and
probably other platforms).

[YOCTO #9284]

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-graphics/matchbox-wm/matchbox-wm_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/matchbox-wm/matchbox-wm_git.bb b/meta/recipes-graphics/matchbox-wm/matchbox-wm_git.bb
index 422d255..aa76828 100644
--- a/meta/recipes-graphics/matchbox-wm/matchbox-wm_git.bb
+++ b/meta/recipes-graphics/matchbox-wm/matchbox-wm_git.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://src/wm.h;endline=21;md5=a7e844465edbcf79c282369f93caa
 SECTION = "x11/wm"
 DEPENDS = "libmatchbox virtual/libx11 libxext libxrender startup-notification expat gconf libxcursor libxfixes"
 
-SRCREV = "29544f0e61cc281fc60061443a537271e1081b78"
+SRCREV = "8178e70d5c742c4cd63b51df228cc8aa3594d518"
 PV = "1.2+git${SRCPV}"
 
 SRC_URI = "git://git.yoctoproject.org/matchbox-window-manager \
-- 
2.1.4


