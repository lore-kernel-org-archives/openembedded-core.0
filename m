Return-Path: <jussi.kukkonen@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 6236F71CB4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Feb 2017 09:55:15 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga105.jf.intel.com with ESMTP; 14 Feb 2017 01:55:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,160,1484035200"; d="scan'208";a="1126379777"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 14 Feb 2017 01:55:15 -0800
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 1E8B46A4080;
	Tue, 14 Feb 2017 01:54:12 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Feb 2017 11:55:00 +0200
Message-Id: <a3b835560a3ff798e9b9ca11d9e4618986163546.1487065337.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1487065337.git.jussi.kukkonen@intel.com>
References: <cover.1487065337.git.jussi.kukkonen@intel.com>
Subject: [PATCH 03/11] util-macros: Upgrade 1.19.0 -> 1.19.1
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
X-List-Received-Date: Tue, 14 Feb 2017 09:55:15 -0000

Tiny release to fix build with new xmlto.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../xorg-util/{util-macros_1.19.0.bb => util-macros_1.19.1.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-util/{util-macros_1.19.0.bb => util-macros_1.19.1.bb} (75%)

diff --git a/meta/recipes-graphics/xorg-util/util-macros_1.19.0.bb b/meta/recipes-graphics/xorg-util/util-macros_1.19.1.bb
similarity index 75%
rename from meta/recipes-graphics/xorg-util/util-macros_1.19.0.bb
rename to meta/recipes-graphics/xorg-util/util-macros_1.19.1.bb
index 26cf50f..b39d787 100644
--- a/meta/recipes-graphics/xorg-util/util-macros_1.19.0.bb
+++ b/meta/recipes-graphics/xorg-util/util-macros_1.19.1.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1970511fddd439b07a6ba789d28ff662"
 
 PE = "1"
 
-SRC_URI[md5sum] = "40e1caa49a71a26e0aa68ddd00203717"
-SRC_URI[sha256sum] = "0d4df51b29023daf2f63aebf3ebc638ea88efedfd560ab5866741ab3f92acaa1"
+SRC_URI[md5sum] = "3f8a8e6100556f7f28e469809805dee8"
+SRC_URI[sha256sum] = "472ad0e41d1e0abf5ecafd29460bf1b8d47e53d4b7d3abf1f66d02dc576547b8"
 
 # ${PN} is empty so we need to tweak -dev and -dbg package dependencies
 RDEPENDS_${PN}-dev = ""
-- 
2.1.4


