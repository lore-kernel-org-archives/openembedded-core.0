Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1C8FC6E940
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2014 15:29:58 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 06 Feb 2014 07:29:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,793,1384329600"; d="scan'208";a="450785153"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by orsmga001.jf.intel.com with ESMTP; 06 Feb 2014 07:29:41 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Feb 2014 17:29:23 +0200
Message-Id: <a8816b364c453206df42282014c328210d166af4.1391699953.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1391699953.git.laurentiu.palcu@intel.com>
References: <cover.1391699953.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1391699953.git.laurentiu.palcu@intel.com>
References: <cover.1391699953.git.laurentiu.palcu@intel.com>
Subject: [PATCH 04/13] xcb-util-wm: upgrade to 0.4.0
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
 .../{xcb-util-wm_0.3.9.bb => xcb-util-wm_0.4.0.bb} |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{xcb-util-wm_0.3.9.bb => xcb-util-wm_0.4.0.bb} (73%)

diff --git a/meta/recipes-graphics/xorg-lib/xcb-util-wm_0.3.9.bb b/meta/recipes-graphics/xorg-lib/xcb-util-wm_0.4.0.bb
similarity index 73%
rename from meta/recipes-graphics/xorg-lib/xcb-util-wm_0.3.9.bb
rename to meta/recipes-graphics/xorg-lib/xcb-util-wm_0.4.0.bb
index 944e0d8..2b4ee70 100644
--- a/meta/recipes-graphics/xorg-lib/xcb-util-wm_0.3.9.bb
+++ b/meta/recipes-graphics/xorg-lib/xcb-util-wm_0.4.0.bb
@@ -7,5 +7,5 @@ LIC_FILES_CHKSUM = "file://ewmh/ewmh.c;endline=27;md5=63fd80552d7dc886f4eb267610
 					file://icccm/xcb_icccm.h;beginline=4;endline=31;md5=393772b7b07b9868d479d538238c1d8a \
 					"
 
-SRC_URI[md5sum] = "c612aae7ffe2e70fe743efab9c5548e9"
-SRC_URI[sha256sum] = "038f9bdb917b1f6d98a164f57dfb32212a102d771ab6f03de49fef3786746030"
+SRC_URI[md5sum] = "1b5182b894753de63c9fad1ce6124534"
+SRC_URI[sha256sum] = "66f97c18f7d98d3c873fe5db5842d2fca34519274c31ee668551ab8995a2f51f"
-- 
1.7.9.5


