Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id A72F86012C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Nov 2015 12:07:19 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 27 Nov 2015 04:07:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,351,1444719600"; d="scan'208";a="860460962"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga002.jf.intel.com with ESMTP; 27 Nov 2015 04:07:21 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Nov 2015 14:10:42 +0200
Message-Id: <6bd920bf75b4e9b1e9ce175f8e056db593fa2bda.1448625307.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <338e77cbca9b7de1c5638e59b440f0da85087835.1448625307.git.jussi.kukkonen@intel.com>
References: <338e77cbca9b7de1c5638e59b440f0da85087835.1448625307.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1448625307.git.jussi.kukkonen@intel.com>
References: <cover.1448625307.git.jussi.kukkonen@intel.com>
Subject: [PATCH 09/10] libcroco: Upgrade 0.6.8 -> 0.6.9
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
X-List-Received-Date: Fri, 27 Nov 2015 12:07:19 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../recipes-support/libcroco/{libcroco_0.6.8.bb => libcroco_0.6.9.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libcroco/{libcroco_0.6.8.bb => libcroco_0.6.9.bb} (81%)

diff --git a/meta/recipes-support/libcroco/libcroco_0.6.8.bb b/meta/recipes-support/libcroco/libcroco_0.6.9.bb
similarity index 81%
rename from meta/recipes-support/libcroco/libcroco_0.6.8.bb
rename to meta/recipes-support/libcroco/libcroco_0.6.9.bb
index 2b1b910..05bd931 100644
--- a/meta/recipes-support/libcroco/libcroco_0.6.8.bb
+++ b/meta/recipes-support/libcroco/libcroco_0.6.9.bb
@@ -17,5 +17,5 @@ BINCONFIG = "${bindir}/croco-0.6-config"
 
 inherit autotools pkgconfig gnomebase gtk-doc binconfig-disabled
 
-SRC_URI[archive.md5sum] = "767e73c4174f75b99695d4530fd9bb80"
-SRC_URI[archive.sha256sum] = "ea6e1b858c55219cefd7109756bff5bc1a774ba7a55f7d3ccd734d6b871b8570"
+SRC_URI[archive.md5sum] = "f1863da805c9206563da06f56da1ea55"
+SRC_URI[archive.sha256sum] = "38b9a6aed1813e55b3ca07a68d1af845ad4d1f984602e9272fe692930c0be0ae"
-- 
2.1.4


