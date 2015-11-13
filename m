Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 09DFF772D9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 09:44:00 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 13 Nov 2015 01:44:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,286,1444719600"; d="scan'208";a="599686707"
Received: from theory.fi.intel.com ([10.237.72.196])
	by FMSMGA003.fm.intel.com with ESMTP; 13 Nov 2015 01:43:59 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Nov 2015 11:46:53 +0200
Message-Id: <fa9b812a30900ce07263444fe7c390211b8b0141.1447405312.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <b4fe5f127cf4ee60ee730ca6467acb20132f890a.1447405312.git.jussi.kukkonen@intel.com>
References: <b4fe5f127cf4ee60ee730ca6467acb20132f890a.1447405312.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1447405312.git.jussi.kukkonen@intel.com>
References: <cover.1447405312.git.jussi.kukkonen@intel.com>
Subject: [PATCH 08/19] libxi: Upgrade 1.7.4 -> 1.7.5
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
X-List-Received-Date: Fri, 13 Nov 2015 09:44:00 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-graphics/xorg-lib/{libxi_1.7.4.bb => libxi_1.7.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxi_1.7.4.bb => libxi_1.7.5.bb} (81%)

diff --git a/meta/recipes-graphics/xorg-lib/libxi_1.7.4.bb b/meta/recipes-graphics/xorg-lib/libxi_1.7.5.bb
similarity index 81%
rename from meta/recipes-graphics/xorg-lib/libxi_1.7.4.bb
rename to meta/recipes-graphics/xorg-lib/libxi_1.7.5.bb
index 07033a3..f629d3f 100644
--- a/meta/recipes-graphics/xorg-lib/libxi_1.7.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libxi_1.7.5.bb
@@ -17,5 +17,5 @@ PE = "1"
 
 XORG_PN = "libXi"
 
-SRC_URI[md5sum] = "9c4a69c34b19ec1e4212e849549544cb"
-SRC_URI[sha256sum] = "2cffc2686618dc1803725636cd92b36342c512dc60a7a35cba34bf7192a42244"
+SRC_URI[md5sum] = "9f02462855c598a0cd0ddfd98c6e25f5"
+SRC_URI[sha256sum] = "d964d7deb5d8f7d6b9c358969c625073d7ab273dbda94693130b3540bc0ca229"
-- 
2.1.4


