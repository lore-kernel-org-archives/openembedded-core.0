Return-Path: <jussi.kukkonen@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 991216AC15
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jun 2015 11:19:50 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 25 Jun 2015 04:19:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,675,1427785200"; d="scan'208";a="514055685"
Received: from theory.fi.intel.com ([10.237.72.51])
	by FMSMGA003.fm.intel.com with ESMTP; 25 Jun 2015 04:19:29 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Jun 2015 14:20:00 +0300
Message-Id: <100fc04eb4b127d562f5d5515a2f2b4b895470de.1435228589.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1435228589.git.jussi.kukkonen@intel.com>
References: <cover.1435228589.git.jussi.kukkonen@intel.com>
Subject: [PATCH 1/4] freetype: Upgrade 2.5.5 -> 2.6
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
X-List-Received-Date: Thu, 25 Jun 2015 11:19:52 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-graphics/freetype/{freetype_2.5.5.bb => freetype_2.6.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/freetype/{freetype_2.5.5.bb => freetype_2.6.bb} (92%)

diff --git a/meta/recipes-graphics/freetype/freetype_2.5.5.bb b/meta/recipes-graphics/freetype/freetype_2.6.bb
similarity index 92%
rename from meta/recipes-graphics/freetype/freetype_2.5.5.bb
rename to meta/recipes-graphics/freetype/freetype_2.6.bb
index dd4c3b0..70599c6 100644
--- a/meta/recipes-graphics/freetype/freetype_2.5.5.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.6.bb
@@ -14,8 +14,8 @@ LIC_FILES_CHKSUM = "file://docs/LICENSE.TXT;md5=c017ff17fc6f0794adf93db5559ccd56
 SECTION = "libs"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/freetype/freetype-${PV}.tar.bz2"
-SRC_URI[md5sum] = "2a7a314927011d5030903179cf183be0"
-SRC_URI[sha256sum] = "387bcc4b780b12484aa2ec9f7db1a55d8286eb5639f45fbc0fbba7a4e5a1afb9"
+SRC_URI[md5sum] = "5682890cb0267f6671dd3de6eabd3e69"
+SRC_URI[sha256sum] = "8469fb8124764f85029cc8247c31e132a2c5e51084ddce2a44ea32ee4ae8347e"
 
 BINCONFIG = "${bindir}/freetype-config"
 
-- 
2.1.4


