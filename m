Return-Path: <jussi.kukkonen@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id C0E3471D18
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2016 10:22:26 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP; 21 Oct 2016 03:22:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,375,1473145200"; d="scan'208";a="182256741"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga004.fm.intel.com with ESMTP; 21 Oct 2016 03:22:29 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Oct 2016 13:22:08 +0300
Message-Id: <b50ff8f21fe1fd54fe3a1dbe0ac6d717f04940ee.1477032779.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <e5ffe5ce81bc8eed3714e3e8199c0f977088779f.1477032779.git.jussi.kukkonen@intel.com>
References: <e5ffe5ce81bc8eed3714e3e8199c0f977088779f.1477032779.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1477032779.git.jussi.kukkonen@intel.com>
References: <cover.1477032779.git.jussi.kukkonen@intel.com>
Subject: [PATCH 10/15] libxi: Upgrade 1.7.6 -> 1.7.7
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
X-List-Received-Date: Fri, 21 Oct 2016 10:22:26 -0000

Tiny bug fix release.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-graphics/xorg-lib/{libxi_1.7.6.bb => libxi_1.7.7.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxi_1.7.6.bb => libxi_1.7.7.bb} (81%)

diff --git a/meta/recipes-graphics/xorg-lib/libxi_1.7.6.bb b/meta/recipes-graphics/xorg-lib/libxi_1.7.7.bb
similarity index 81%
rename from meta/recipes-graphics/xorg-lib/libxi_1.7.6.bb
rename to meta/recipes-graphics/xorg-lib/libxi_1.7.7.bb
index 7523479..934de08 100644
--- a/meta/recipes-graphics/xorg-lib/libxi_1.7.6.bb
+++ b/meta/recipes-graphics/xorg-lib/libxi_1.7.7.bb
@@ -17,5 +17,6 @@ PE = "1"
 
 XORG_PN = "libXi"
 
-SRC_URI[md5sum] = "510e555ecfffa8d2298a0f42b725e563"
-SRC_URI[sha256sum] = "1f32a552cec0f056c0260bdb32e853cec0673d2f40646ce932ad5a9f0205b7ac"
+SRC_URI[md5sum] = "cc0883a898222d50ff79af3f83595823"
+SRC_URI[sha256sum] = "996f834fa57b9b33ba36690f6f5c6a29320bc8213022943912462d8015b1e030"
+
-- 
2.1.4


