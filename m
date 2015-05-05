Return-Path: <jussi.kukkonen@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 79E6473EC7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 May 2015 11:13:07 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 05 May 2015 04:13:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,372,1427785200"; d="scan'208";a="723908363"
Received: from theory.fi.intel.com ([10.237.72.51])
	by orsmga002.jf.intel.com with ESMTP; 05 May 2015 04:13:06 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 May 2015 14:12:48 +0300
Message-Id: <7b9f1dafc9eb43448886c4f8e5e772f20362569b.1430824114.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <2794ed3bb198b06f681f9492dbeea032a3fd4438.1430824114.git.jussi.kukkonen@intel.com>
References: <2794ed3bb198b06f681f9492dbeea032a3fd4438.1430824114.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1430824114.git.jussi.kukkonen@intel.com>
References: <cover.1430824114.git.jussi.kukkonen@intel.com>
Subject: [PATCH 3/4] xhost: Upgrade 1.0.6 -> 1.0.7
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
X-List-Received-Date: Tue, 05 May 2015 11:13:07 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-graphics/xorg-app/{xhost_1.0.6.bb => xhost_1.0.7.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xhost_1.0.6.bb => xhost_1.0.7.bb} (81%)

diff --git a/meta/recipes-graphics/xorg-app/xhost_1.0.6.bb b/meta/recipes-graphics/xorg-app/xhost_1.0.7.bb
similarity index 81%
rename from meta/recipes-graphics/xorg-app/xhost_1.0.6.bb
rename to meta/recipes-graphics/xorg-app/xhost_1.0.7.bb
index aba33f0..825737f 100644
--- a/meta/recipes-graphics/xorg-app/xhost_1.0.6.bb
+++ b/meta/recipes-graphics/xorg-app/xhost_1.0.7.bb
@@ -13,5 +13,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8fbed71dddf48541818cef8079124199"
 DEPENDS += "libxmu libxau"
 PE = "1"
 
-SRC_URI[md5sum] = "f1669af1fe0554e876f03319c678e79d"
-SRC_URI[sha256sum] = "a6f5b922df0a7be5d3ba43f525fa8e69c539c738418f013a0b7adaa423a89dc2"
+SRC_URI[md5sum] = "f5d490738b148cb7f2fe760f40f92516"
+SRC_URI[sha256sum] = "93e619ee15471f576cfb30c663e18f5bc70aca577a63d2c2c03f006a7837c29a"
-- 
2.1.4


