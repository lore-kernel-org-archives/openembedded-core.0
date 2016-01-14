Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 33D39731DE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 13:23:35 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 14 Jan 2016 05:23:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,294,1449561600"; d="scan'208";a="893103237"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga002.fm.intel.com with ESMTP; 14 Jan 2016 05:23:34 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jan 2016 15:27:55 +0200
Message-Id: <69d71c94aa55b1372aafe19669adf1b71bcf0270.1452777133.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <b5b7c6947b4c54966087ad6c21b9fab79da1fa1e.1452777133.git.jussi.kukkonen@intel.com>
References: <b5b7c6947b4c54966087ad6c21b9fab79da1fa1e.1452777133.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1452777133.git.jussi.kukkonen@intel.com>
References: <cover.1452777133.git.jussi.kukkonen@intel.com>
Subject: [PATCH 7/9] libxi: upgrade to 1.7.6
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
X-List-Received-Date: Thu, 14 Jan 2016 13:23:35 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-graphics/xorg-lib/{libxi_1.7.5.bb => libxi_1.7.6.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxi_1.7.5.bb => libxi_1.7.6.bb} (81%)

diff --git a/meta/recipes-graphics/xorg-lib/libxi_1.7.5.bb b/meta/recipes-graphics/xorg-lib/libxi_1.7.6.bb
similarity index 81%
rename from meta/recipes-graphics/xorg-lib/libxi_1.7.5.bb
rename to meta/recipes-graphics/xorg-lib/libxi_1.7.6.bb
index f629d3f..7523479 100644
--- a/meta/recipes-graphics/xorg-lib/libxi_1.7.5.bb
+++ b/meta/recipes-graphics/xorg-lib/libxi_1.7.6.bb
@@ -17,5 +17,5 @@ PE = "1"
 
 XORG_PN = "libXi"
 
-SRC_URI[md5sum] = "9f02462855c598a0cd0ddfd98c6e25f5"
-SRC_URI[sha256sum] = "d964d7deb5d8f7d6b9c358969c625073d7ab273dbda94693130b3540bc0ca229"
+SRC_URI[md5sum] = "510e555ecfffa8d2298a0f42b725e563"
+SRC_URI[sha256sum] = "1f32a552cec0f056c0260bdb32e853cec0673d2f40646ce932ad5a9f0205b7ac"
-- 
2.1.4


