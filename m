Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id CEC576DDA8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2014 15:29:57 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 06 Feb 2014 07:29:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,793,1384329600"; d="scan'208";a="450785139"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by orsmga001.jf.intel.com with ESMTP; 06 Feb 2014 07:29:39 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Feb 2014 17:29:21 +0200
Message-Id: <bd614e2df3c77da2eb8538e60ab90172b9febec4.1391699953.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1391699953.git.laurentiu.palcu@intel.com>
References: <cover.1391699953.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1391699953.git.laurentiu.palcu@intel.com>
References: <cover.1391699953.git.laurentiu.palcu@intel.com>
Subject: [PATCH 02/13] xextproto: upgrade to 7.3.0
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
X-List-Received-Date: Thu, 06 Feb 2014 15:29:58 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../{xextproto_7.2.1.bb => xextproto_7.3.0.bb}     |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-proto/{xextproto_7.2.1.bb => xextproto_7.3.0.bb} (81%)

diff --git a/meta/recipes-graphics/xorg-proto/xextproto_7.2.1.bb b/meta/recipes-graphics/xorg-proto/xextproto_7.3.0.bb
similarity index 81%
rename from meta/recipes-graphics/xorg-proto/xextproto_7.2.1.bb
rename to meta/recipes-graphics/xorg-proto/xextproto_7.3.0.bb
index cbb8c4a..dd0bd95 100644
--- a/meta/recipes-graphics/xorg-proto/xextproto_7.2.1.bb
+++ b/meta/recipes-graphics/xorg-proto/xextproto_7.3.0.bb
@@ -20,5 +20,5 @@ EXTRA_OECONF_append = " --enable-specs=no"
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "eaac343af094e6b608cf15cfba0f77c5"
-SRC_URI[sha256sum] = "7c53b105407ef3b2eb180a361bd672c1814524a600166a0a7dbbe76b97556d1a"
+SRC_URI[md5sum] = "70c90f313b4b0851758ef77b95019584"
+SRC_URI[sha256sum] = "f3f4b23ac8db9c3a9e0d8edb591713f3d70ef9c3b175970dd8823dfc92aa5bb0"
-- 
1.7.9.5


