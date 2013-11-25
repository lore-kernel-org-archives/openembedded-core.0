Return-Path: <laurentiu.palcu@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 8045D6DC10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2013 13:51:21 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 25 Nov 2013 05:51:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,768,1378882800"; d="scan'208";a="439337246"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.41])
	by fmsmga002.fm.intel.com with ESMTP; 25 Nov 2013 05:51:19 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Nov 2013 15:51:03 +0200
Message-Id: <1e57cfd79d97d9bc2145a09bc8083a2344f4f5a8.1385386370.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1385386370.git.laurentiu.palcu@intel.com>
References: <cover.1385386370.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1385386370.git.laurentiu.palcu@intel.com>
References: <cover.1385386370.git.laurentiu.palcu@intel.com>
Subject: [PATCH 8/9] xcb-proto: upgrade to 1.9
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
X-List-Received-Date: Mon, 25 Nov 2013 13:51:21 -0000

Also move xcb-proto recipes from xcb directory to xorg-proto directory.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../{xcb => xorg-proto}/xcb-proto.inc              |    0
 .../xcb-proto_1.9.bb}                              |    4 ++--
 .../{xcb => xorg-proto}/xcb-proto_git.bb           |    0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/{xcb => xorg-proto}/xcb-proto.inc (100%)
 rename meta/recipes-graphics/{xcb/xcb-proto_1.8.bb => xorg-proto/xcb-proto_1.9.bb} (60%)
 rename meta/recipes-graphics/{xcb => xorg-proto}/xcb-proto_git.bb (100%)

diff --git a/meta/recipes-graphics/xcb/xcb-proto.inc b/meta/recipes-graphics/xorg-proto/xcb-proto.inc
similarity index 100%
rename from meta/recipes-graphics/xcb/xcb-proto.inc
rename to meta/recipes-graphics/xorg-proto/xcb-proto.inc
diff --git a/meta/recipes-graphics/xcb/xcb-proto_1.8.bb b/meta/recipes-graphics/xorg-proto/xcb-proto_1.9.bb
similarity index 60%
rename from meta/recipes-graphics/xcb/xcb-proto_1.8.bb
rename to meta/recipes-graphics/xorg-proto/xcb-proto_1.9.bb
index 0425ef4..617501d 100644
--- a/meta/recipes-graphics/xcb/xcb-proto_1.8.bb
+++ b/meta/recipes-graphics/xorg-proto/xcb-proto_1.9.bb
@@ -5,5 +5,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d763b081cb10c223435b01e00dc0aba7 \
                     file://src/dri2.xml;beginline=2;endline=28;md5=f8763b13ff432e8597e0d610cf598e65"
 
 
-SRC_URI[md5sum] = "a5de3432cc6e43cc6a27f241dbb991b1"
-SRC_URI[sha256sum] = "233d16c7a019235b3092111e7c11429119357eb13754a607b75eea04453121b0"
+SRC_URI[md5sum] = "311817f844c45c0c3d76dd72e6560c10"
+SRC_URI[sha256sum] = "895afe21793e6e26c5ce999b1900c02a5984c201d96d55cc42c182d3c3bde43c"
diff --git a/meta/recipes-graphics/xcb/xcb-proto_git.bb b/meta/recipes-graphics/xorg-proto/xcb-proto_git.bb
similarity index 100%
rename from meta/recipes-graphics/xcb/xcb-proto_git.bb
rename to meta/recipes-graphics/xorg-proto/xcb-proto_git.bb
-- 
1.7.9.5


