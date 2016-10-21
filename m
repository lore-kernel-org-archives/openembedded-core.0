Return-Path: <jussi.kukkonen@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4AD1C71D18
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2016 10:22:29 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP; 21 Oct 2016 03:22:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,375,1473145200"; d="scan'208";a="182256749"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga004.fm.intel.com with ESMTP; 21 Oct 2016 03:22:31 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Oct 2016 13:22:10 +0300
Message-Id: <2b80bbdea6fa85ba3c0a42fc80411753b0878504.1477032779.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <e5ffe5ce81bc8eed3714e3e8199c0f977088779f.1477032779.git.jussi.kukkonen@intel.com>
References: <e5ffe5ce81bc8eed3714e3e8199c0f977088779f.1477032779.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1477032779.git.jussi.kukkonen@intel.com>
References: <cover.1477032779.git.jussi.kukkonen@intel.com>
Subject: [PATCH 12/15] libxfixes: Upgrade 5.0.2 -> 5.0.3
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
X-List-Received-Date: Fri, 21 Oct 2016 10:22:29 -0000

Tiny bug fix release.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../xorg-lib/{libxfixes_5.0.2.bb => libxfixes_5.0.3.bb}              | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxfixes_5.0.2.bb => libxfixes_5.0.3.bb} (79%)

diff --git a/meta/recipes-graphics/xorg-lib/libxfixes_5.0.2.bb b/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb
similarity index 79%
rename from meta/recipes-graphics/xorg-lib/libxfixes_5.0.2.bb
rename to meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb
index f078aed..c80042d 100644
--- a/meta/recipes-graphics/xorg-lib/libxfixes_5.0.2.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb
@@ -18,5 +18,6 @@ XORG_PN = "libXfixes"
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "544d73df94e638ba7b64147be416e576"
-SRC_URI[sha256sum] = "9bd20edfec084a1bed481d48dd4815dee88139fffad091418cdda081129a9aea"
+SRC_URI[md5sum] = "07e01e046a0215574f36a3aacb148be0"
+SRC_URI[sha256sum] = "de1cd33aff226e08cefd0e6759341c2c8e8c9faf8ce9ac6ec38d43e287b22ad6"
+
-- 
2.1.4


