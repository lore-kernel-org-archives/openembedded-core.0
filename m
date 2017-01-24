Return-Path: <jussi.kukkonen@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 2AD78772E4
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 10:42:29 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga104.fm.intel.com with ESMTP; 24 Jan 2017 02:42:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,278,1477983600"; d="scan'208";a="1098164772"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 24 Jan 2017 02:42:30 -0800
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id E3C8A6A4006;
	Tue, 24 Jan 2017 02:41:32 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: Openembedded-core@lists.openembedded.org
Date: Tue, 24 Jan 2017 12:42:18 +0200
Message-Id: <2a3309103e8692ff7fddb03545a428a6c365f4a5.1485249527.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1485249527.git.jussi.kukkonen@intel.com>
References: <cover.1485249527.git.jussi.kukkonen@intel.com>
Subject: [PATCH 5/9] libxi: Upgrade 1.7.8 -> 1.7.9
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
X-List-Received-Date: Tue, 24 Jan 2017 10:42:30 -0000

Tiny bug fix release.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-graphics/xorg-lib/{libxi_1.7.8.bb => libxi_1.7.9.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxi_1.7.8.bb => libxi_1.7.9.bb} (81%)

diff --git a/meta/recipes-graphics/xorg-lib/libxi_1.7.8.bb b/meta/recipes-graphics/xorg-lib/libxi_1.7.9.bb
similarity index 81%
rename from meta/recipes-graphics/xorg-lib/libxi_1.7.8.bb
rename to meta/recipes-graphics/xorg-lib/libxi_1.7.9.bb
index cc3e09e..74f0527 100644
--- a/meta/recipes-graphics/xorg-lib/libxi_1.7.8.bb
+++ b/meta/recipes-graphics/xorg-lib/libxi_1.7.9.bb
@@ -17,6 +17,6 @@ PE = "1"
 
 XORG_PN = "libXi"
 
-SRC_URI[md5sum] = "94afc83e553d3c38a153f8f60301fd62"
-SRC_URI[sha256sum] = "d8f2fa8d53141c41ff521627df9b2fa9c05f6f142fd9881152bab36549ac27bb"
+SRC_URI[md5sum] = "1f0f2719c020655a60aee334ddd26d67"
+SRC_URI[sha256sum] = "c2e6b8ff84f9448386c1b5510a5cf5a16d788f76db018194dacdc200180faf45"
 
-- 
2.1.4


