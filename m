Return-Path: <jussi.kukkonen@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 83F6973EDE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 May 2015 11:13:03 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 05 May 2015 04:13:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,372,1427785200"; d="scan'208";a="723908327"
Received: from theory.fi.intel.com ([10.237.72.51])
	by orsmga002.jf.intel.com with ESMTP; 05 May 2015 04:13:03 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 May 2015 14:12:46 +0300
Message-Id: <2794ed3bb198b06f681f9492dbeea032a3fd4438.1430824114.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1430824114.git.jussi.kukkonen@intel.com>
References: <cover.1430824114.git.jussi.kukkonen@intel.com>
Subject: [PATCH 1/4] xev: Upgrade 1.2.1 -> 1.2.2
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
X-List-Received-Date: Tue, 05 May 2015 11:13:04 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-graphics/xorg-app/{xev_1.2.1.bb => xev_1.2.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xev_1.2.1.bb => xev_1.2.2.bb} (77%)

diff --git a/meta/recipes-graphics/xorg-app/xev_1.2.1.bb b/meta/recipes-graphics/xorg-app/xev_1.2.2.bb
similarity index 77%
rename from meta/recipes-graphics/xorg-app/xev_1.2.1.bb
rename to meta/recipes-graphics/xorg-app/xev_1.2.2.bb
index 8dcb1ec..f151b57 100644
--- a/meta/recipes-graphics/xorg-app/xev_1.2.1.bb
+++ b/meta/recipes-graphics/xorg-app/xev_1.2.2.bb
@@ -14,5 +14,5 @@ DEPENDS += "libxrandr xproto"
 
 SRC_URI += "file://diet-x11.patch"
 
-SRC_URI[md5sum] = "5b0a0b6f589441d546da21739fa75634"
-SRC_URI[sha256sum] = "11f17fab097f17d9efc51ea9d0e3140bea3904eb3c486afa7c8c3eedab496243"
+SRC_URI[md5sum] = "249bdde90f01c0d861af52dc8fec379e"
+SRC_URI[sha256sum] = "d94ae62a6c1af56c2961d71f5782076ac4116f0fa4e401420ac7e0db33dc314f"
-- 
2.1.4


