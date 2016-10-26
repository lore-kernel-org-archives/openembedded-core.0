Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 7DDE9601F2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2016 08:37:57 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP; 26 Oct 2016 01:38:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,549,1473145200"; d="scan'208";a="183964771"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 26 Oct 2016 01:38:00 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id A84136A4006;
	Wed, 26 Oct 2016 01:37:24 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Oct 2016 11:37:35 +0300
Message-Id: <5616d1b4c863b6ddcf09e6c524f499b820c7c746.1477469885.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <b4be4ec82b3f01924e2fb87dc868f56284d0a8cf.1477469885.git.jussi.kukkonen@intel.com>
References: <b4be4ec82b3f01924e2fb87dc868f56284d0a8cf.1477469885.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1477469885.git.jussi.kukkonen@intel.com>
References: <cover.1477469885.git.jussi.kukkonen@intel.com>
Subject: [PATCHv2 12/16] libxfixes: Upgrade 5.0.2 -> 5.0.3
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
X-List-Received-Date: Wed, 26 Oct 2016 08:37:57 -0000

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


