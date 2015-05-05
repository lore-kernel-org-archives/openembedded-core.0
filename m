Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 39DEA73D94
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 May 2015 19:33:24 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 05 May 2015 12:33:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,374,1427785200"; d="scan'208";a="690381477"
Received: from theory.fi.intel.com ([10.237.72.51])
	by orsmga001.jf.intel.com with ESMTP; 05 May 2015 12:33:25 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 May 2015 22:33:09 +0300
Message-Id: <24c5746bad8f22cc3d79ae2e3a6ded92ae2653af.1430854134.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1430854134.git.jussi.kukkonen@intel.com>
References: <cover.1430854134.git.jussi.kukkonen@intel.com>
Subject: [PATCH 1/3] xproto: Upgrade 7.0.26 -> 7.0.27
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
X-List-Received-Date: Tue, 05 May 2015 19:33:26 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../xorg-proto/{xproto_7.0.26.bb => xproto_7.0.27.bb}                | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-proto/{xproto_7.0.26.bb => xproto_7.0.27.bb} (73%)

diff --git a/meta/recipes-graphics/xorg-proto/xproto_7.0.26.bb b/meta/recipes-graphics/xorg-proto/xproto_7.0.27.bb
similarity index 73%
rename from meta/recipes-graphics/xorg-proto/xproto_7.0.26.bb
rename to meta/recipes-graphics/xorg-proto/xproto_7.0.27.bb
index 0d591dc..796fb41 100644
--- a/meta/recipes-graphics/xorg-proto/xproto_7.0.26.bb
+++ b/meta/recipes-graphics/xorg-proto/xproto_7.0.27.bb
@@ -15,6 +15,5 @@ SRC_URI += "file://xproto_fix_for_x32.patch"
 EXTRA_OECONF_append = " --enable-specs=no"
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "4dc2464bfeade23dab5de38da0f6b1b5"
-SRC_URI[sha256sum] = "636162c1759805a5a0114a369dffdeccb8af8c859ef6e1445f26a4e6e046514f"
-
+SRC_URI[md5sum] = "6c3345111a8044f730984988aacfa567"
+SRC_URI[sha256sum] = "246f23a6b235c8008183deeb1dcd76d529a099f93600b648b399811b10ea110c"
-- 
2.1.4


