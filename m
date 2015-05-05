Return-Path: <jussi.kukkonen@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0EB4273EDE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 May 2015 11:13:05 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 05 May 2015 04:13:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,372,1427785200"; d="scan'208";a="723908339"
Received: from theory.fi.intel.com ([10.237.72.51])
	by orsmga002.jf.intel.com with ESMTP; 05 May 2015 04:13:05 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 May 2015 14:12:47 +0300
Message-Id: <641f641f4ec3109a35e7de3b4f0bf42e2ad277e7.1430824114.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <2794ed3bb198b06f681f9492dbeea032a3fd4438.1430824114.git.jussi.kukkonen@intel.com>
References: <2794ed3bb198b06f681f9492dbeea032a3fd4438.1430824114.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1430824114.git.jussi.kukkonen@intel.com>
References: <cover.1430824114.git.jussi.kukkonen@intel.com>
Subject: [PATCH 2/4] xmodmap: Upgrade 1.0.8 -> 1.0.9
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
X-List-Received-Date: Tue, 05 May 2015 11:13:05 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-graphics/xorg-app/{xmodmap_1.0.8.bb => xmodmap_1.0.9.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xmodmap_1.0.8.bb => xmodmap_1.0.9.bb} (78%)

diff --git a/meta/recipes-graphics/xorg-app/xmodmap_1.0.8.bb b/meta/recipes-graphics/xorg-app/xmodmap_1.0.9.bb
similarity index 78%
rename from meta/recipes-graphics/xorg-app/xmodmap_1.0.8.bb
rename to meta/recipes-graphics/xorg-app/xmodmap_1.0.9.bb
index 87efb76..2deac6a 100644
--- a/meta/recipes-graphics/xorg-app/xmodmap_1.0.8.bb
+++ b/meta/recipes-graphics/xorg-app/xmodmap_1.0.9.bb
@@ -13,5 +13,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=272c17e96370e1e74773fa22d9989621"
 
 PE = "1"
 
-SRC_URI[md5sum] = "5511da3361eea4eaa21427652c559e1c"
-SRC_URI[sha256sum] = "efe2e3c89858a2db3bdcf969f55f55d0af4f5007789198344de0595249a99fc3"
+SRC_URI[md5sum] = "723f02d3a5f98450554556205f0a9497"
+SRC_URI[sha256sum] = "b7b0e5cc5f10d0fb6d2d6ea4f00c77e8ac0e847cc5a73be94cd86139ac4ac478"
-- 
2.1.4


