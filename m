Return-Path: <jussi.kukkonen@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id B7A58731C3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2016 13:35:18 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP; 18 Jul 2016 06:34:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,384,1464678000"; d="scan'208";a="848345541"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga003.jf.intel.com with ESMTP; 18 Jul 2016 06:34:41 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jul 2016 16:34:29 +0300
Message-Id: <9c2928be8c1f617ae8554f18667939306c997b8d.1468848064.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <c67de06959dd87fa6ce214da11cd431c44da056f.1468848064.git.jussi.kukkonen@intel.com>
References: <c67de06959dd87fa6ce214da11cd431c44da056f.1468848064.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1468848064.git.jussi.kukkonen@intel.com>
References: <cover.1468848064.git.jussi.kukkonen@intel.com>
Subject: [PATCHv2 6/9] libxfixes: Upgrade 5.0.1 -> 5.0.2
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
X-List-Received-Date: Mon, 18 Jul 2016 13:35:18 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../xorg-lib/{libxfixes_5.0.1.bb => libxfixes_5.0.2.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxfixes_5.0.1.bb => libxfixes_5.0.2.bb} (79%)

diff --git a/meta/recipes-graphics/xorg-lib/libxfixes_5.0.1.bb b/meta/recipes-graphics/xorg-lib/libxfixes_5.0.2.bb
similarity index 79%
rename from meta/recipes-graphics/xorg-lib/libxfixes_5.0.1.bb
rename to meta/recipes-graphics/xorg-lib/libxfixes_5.0.2.bb
index 6e2740c..f078aed 100644
--- a/meta/recipes-graphics/xorg-lib/libxfixes_5.0.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfixes_5.0.2.bb
@@ -18,5 +18,5 @@ XORG_PN = "libXfixes"
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "b985b85f8b9386c85ddcfe1073906b4d"
-SRC_URI[sha256sum] = "63bec085084fa3caaee5180490dd871f1eb2020ba9e9b39a30f93693ffc34767"
+SRC_URI[md5sum] = "544d73df94e638ba7b64147be416e576"
+SRC_URI[sha256sum] = "9bd20edfec084a1bed481d48dd4815dee88139fffad091418cdda081129a9aea"
-- 
2.1.4


