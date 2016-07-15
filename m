Return-Path: <jussi.kukkonen@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1735C6FEFA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 12:20:07 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 15 Jul 2016 05:20:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,368,1464678000"; d="scan'208";a="846866806"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga003.jf.intel.com with ESMTP; 15 Jul 2016 05:20:07 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Jul 2016 15:20:01 +0300
Message-Id: <2ff7f7848e6bb8353b2de9012edbf6aa6eb84394.1468584725.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1468584725.git.jussi.kukkonen@intel.com>
References: <cover.1468584725.git.jussi.kukkonen@intel.com>
Subject: [PATCH 1/5] matchbox-panel-2: Upgrade 2.10 -> 2.11
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
X-List-Received-Date: Fri, 15 Jul 2016 12:20:07 -0000

New release finishes the port from buggy ScalingImage to
ScalingImage2.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../{matchbox-panel-2_2.10.bb => matchbox-panel-2_2.11.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-sato/matchbox-panel-2/{matchbox-panel-2_2.10.bb => matchbox-panel-2_2.11.bb} (95%)

diff --git a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.10.bb b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.11.bb
similarity index 95%
rename from meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.10.bb
rename to meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.11.bb
index 3ccd6a26..a387073 100644
--- a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.10.bb
+++ b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.11.bb
@@ -14,8 +14,8 @@ DEPENDS += " ${@bb.utils.contains("MACHINE_FEATURES", "apm", "apmd", "",d)}"
 # The startup-notification requires x11 in DISTRO_FEATURES
 REQUIRED_DISTRO_FEATURES = "x11"
 
-# SRCREV tagged 2.10
-SRCREV = "145a8075c66952dad9ab5f36d944c78c1ae3f4ab"
+# SRCREV tagged 2.11
+SRCREV = "850d5fffde7dbfb32015916524d88014cc2cfb30"
 
 RPROVIDES_${PN} = "matchbox-panel"
 RREPLACES_${PN} = "matchbox-panel"
-- 
2.1.4


