Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 129F865CD0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Apr 2015 07:39:58 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 30 Apr 2015 00:40:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,675,1422950400"; d="scan'208";a="487558980"
Received: from theory.fi.intel.com ([10.237.72.51])
	by FMSMGA003.fm.intel.com with ESMTP; 30 Apr 2015 00:39:54 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Apr 2015 10:39:15 +0300
Message-Id: <3e8f4ce58a75a12e3515e66500e0c9c25e2f7ee7.1430379176.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1430379176.git.jussi.kukkonen@intel.com>
References: <cover.1430379176.git.jussi.kukkonen@intel.com>
Subject: [PATCH 1/2] freetype: Upgrade 2.5.4 -> 2.5.5
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
X-List-Received-Date: Thu, 30 Apr 2015 07:39:59 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../freetype/{freetype_2.5.4.bb => freetype_2.5.5.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/freetype/{freetype_2.5.4.bb => freetype_2.5.5.bb} (92%)

diff --git a/meta/recipes-graphics/freetype/freetype_2.5.4.bb b/meta/recipes-graphics/freetype/freetype_2.5.5.bb
similarity index 92%
rename from meta/recipes-graphics/freetype/freetype_2.5.4.bb
rename to meta/recipes-graphics/freetype/freetype_2.5.5.bb
index b5f0362..dd4c3b0 100644
--- a/meta/recipes-graphics/freetype/freetype_2.5.4.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.5.5.bb
@@ -14,8 +14,8 @@ LIC_FILES_CHKSUM = "file://docs/LICENSE.TXT;md5=c017ff17fc6f0794adf93db5559ccd56
 SECTION = "libs"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/freetype/freetype-${PV}.tar.bz2"
-SRC_URI[md5sum] = "438585445a2f1f71c77590155fd96616"
-SRC_URI[sha256sum] = "3b4e2c666b33b32ad29ff0fe5c6538e757d3c73368e5dfa88bd59b4bc95cbabb"
+SRC_URI[md5sum] = "2a7a314927011d5030903179cf183be0"
+SRC_URI[sha256sum] = "387bcc4b780b12484aa2ec9f7db1a55d8286eb5639f45fbc0fbba7a4e5a1afb9"
 
 BINCONFIG = "${bindir}/freetype-config"
 
-- 
2.1.4


