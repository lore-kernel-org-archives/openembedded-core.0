Return-Path: <jussi.kukkonen@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 963A360602
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2016 08:37:49 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga105.jf.intel.com with ESMTP; 26 Oct 2016 01:37:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,549,1473145200"; d="scan'208";a="24160041"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga004.jf.intel.com with ESMTP; 26 Oct 2016 01:37:51 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 731AA6A4006;
	Wed, 26 Oct 2016 01:37:16 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Oct 2016 11:37:29 +0300
Message-Id: <0cadccee4ea9bd3f83b1eabfe1c0f7c4686b24b1.1477469885.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <b4be4ec82b3f01924e2fb87dc868f56284d0a8cf.1477469885.git.jussi.kukkonen@intel.com>
References: <b4be4ec82b3f01924e2fb87dc868f56284d0a8cf.1477469885.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1477469885.git.jussi.kukkonen@intel.com>
References: <cover.1477469885.git.jussi.kukkonen@intel.com>
Subject: [PATCHv2 06/16] libxvmc: Upgrade 1.0.9 -> 1.0.10
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
X-List-Received-Date: Wed, 26 Oct 2016 08:37:50 -0000

Tiny bug fix release.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../recipes-graphics/xorg-lib/{libxvmc_1.0.9.bb => libxvmc_1.0.10.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxvmc_1.0.9.bb => libxvmc_1.0.10.bb} (76%)

diff --git a/meta/recipes-graphics/xorg-lib/libxvmc_1.0.9.bb b/meta/recipes-graphics/xorg-lib/libxvmc_1.0.10.bb
similarity index 76%
rename from meta/recipes-graphics/xorg-lib/libxvmc_1.0.9.bb
rename to meta/recipes-graphics/xorg-lib/libxvmc_1.0.10.bb
index 41e8498..6ed49b1 100644
--- a/meta/recipes-graphics/xorg-lib/libxvmc_1.0.9.bb
+++ b/meta/recipes-graphics/xorg-lib/libxvmc_1.0.10.bb
@@ -15,5 +15,5 @@ PE = "1"
 
 XORG_PN = "libXvMC"
 
-SRC_URI[md5sum] = "eba6b738ed5fdcd8f4203d7c8a470c79"
-SRC_URI[sha256sum] = "0703d7dff6ffc184f1735ca5d4eb9dbb402b522e08e008f2f96aee16c40a5756"
+SRC_URI[md5sum] = "4cbe1c1def7a5e1b0ed5fce8e512f4c6"
+SRC_URI[sha256sum] = "e501a079b5dfaef0897c56152770c77e05e362065cec58910289aa567277ee2e"
-- 
2.1.4


