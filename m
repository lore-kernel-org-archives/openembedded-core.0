Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2946461F16
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Apr 2014 13:51:16 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 29 Apr 2014 06:51:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,951,1389772800"; d="scan'208";a="531596718"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by orsmga002.jf.intel.com with ESMTP; 29 Apr 2014 06:51:12 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Apr 2014 16:29:48 +0300
Message-Id: <9e2ad228925cb66403fc747f8e37fd2bf37cdec4.1398775392.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1398775392.git.laurentiu.palcu@intel.com>
References: <cover.1398775392.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1398775392.git.laurentiu.palcu@intel.com>
References: <cover.1398775392.git.laurentiu.palcu@intel.com>
Subject: [PATCH 06/12] xproto: upgrade to 7.0.26
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
X-List-Received-Date: Tue, 29 Apr 2014 13:51:16 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../{xproto_7.0.25.bb => xproto_7.0.26.bb}         |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-proto/{xproto_7.0.25.bb => xproto_7.0.26.bb} (74%)

diff --git a/meta/recipes-graphics/xorg-proto/xproto_7.0.25.bb b/meta/recipes-graphics/xorg-proto/xproto_7.0.26.bb
similarity index 74%
rename from meta/recipes-graphics/xorg-proto/xproto_7.0.25.bb
rename to meta/recipes-graphics/xorg-proto/xproto_7.0.26.bb
index cf24125..0d591dc 100644
--- a/meta/recipes-graphics/xorg-proto/xproto_7.0.25.bb
+++ b/meta/recipes-graphics/xorg-proto/xproto_7.0.26.bb
@@ -15,6 +15,6 @@ SRC_URI += "file://xproto_fix_for_x32.patch"
 EXTRA_OECONF_append = " --enable-specs=no"
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "28311ef4edbbbf89f617a7f8a2e5648f"
-SRC_URI[sha256sum] = "92247485dc4ffc3611384ba84136591923da857212a7dc29f4ad7797e13909fe"
+SRC_URI[md5sum] = "4dc2464bfeade23dab5de38da0f6b1b5"
+SRC_URI[sha256sum] = "636162c1759805a5a0114a369dffdeccb8af8c859ef6e1445f26a4e6e046514f"
 
-- 
1.7.9.5


