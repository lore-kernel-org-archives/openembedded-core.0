Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 7680F606D0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 10:41:57 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 15 Jul 2016 03:41:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,367,1464678000"; d="scan'208";a="1017432550"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga002.jf.intel.com with ESMTP; 15 Jul 2016 03:41:55 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Jul 2016 13:41:43 +0300
Message-Id: <acf4eab5d9160f33088e4e3537dd48103f5363eb.1468578590.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <8673f0535cc7b0698e4d900b79f06975dd8670c1.1468578590.git.jussi.kukkonen@intel.com>
References: <8673f0535cc7b0698e4d900b79f06975dd8670c1.1468578590.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1468578590.git.jussi.kukkonen@intel.com>
References: <cover.1468578590.git.jussi.kukkonen@intel.com>
Subject: [PATCH 5/8] libxfixes: Upgrade 5.0.1 -> 5.0.2
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
X-List-Received-Date: Fri, 15 Jul 2016 10:41:57 -0000

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


