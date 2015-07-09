Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id EADFB65D00
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jul 2015 07:51:59 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 09 Jul 2015 00:52:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,438,1432623600"; d="scan'208";a="761101007"
Received: from theory.fi.intel.com ([10.237.72.51])
	by orsmga002.jf.intel.com with ESMTP; 09 Jul 2015 00:51:58 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Jul 2015 10:52:42 +0300
Message-Id: <52cb25bbbd0e0fc90193b412850d018828aa33da.1436427694.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1436427694.git.jussi.kukkonen@intel.com>
References: <cover.1436427694.git.jussi.kukkonen@intel.com>
Subject: [PATCH 1/5] xproto: Upgrade 7.0.27 -> 7.0.28
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
X-List-Received-Date: Thu, 09 Jul 2015 07:52:00 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../xorg-proto/{xproto_7.0.27.bb => xproto_7.0.28.bb}                | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-proto/{xproto_7.0.27.bb => xproto_7.0.28.bb} (73%)

diff --git a/meta/recipes-graphics/xorg-proto/xproto_7.0.27.bb b/meta/recipes-graphics/xorg-proto/xproto_7.0.28.bb
similarity index 73%
rename from meta/recipes-graphics/xorg-proto/xproto_7.0.27.bb
rename to meta/recipes-graphics/xorg-proto/xproto_7.0.28.bb
index 796fb41..7427a7d 100644
--- a/meta/recipes-graphics/xorg-proto/xproto_7.0.27.bb
+++ b/meta/recipes-graphics/xorg-proto/xproto_7.0.28.bb
@@ -15,5 +15,6 @@ SRC_URI += "file://xproto_fix_for_x32.patch"
 EXTRA_OECONF_append = " --enable-specs=no"
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "6c3345111a8044f730984988aacfa567"
-SRC_URI[sha256sum] = "246f23a6b235c8008183deeb1dcd76d529a099f93600b648b399811b10ea110c"
+SRC_URI[md5sum] = "3ce2f230c5d8fa929f326ad1f0fa40a8"
+SRC_URI[sha256sum] = "29e85568d1f68ceef8a2c081dad9bc0e5500a53cfffde24b564dc43d46ddf6ca"
+
-- 
2.1.4


