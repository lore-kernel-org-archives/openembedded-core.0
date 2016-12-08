Return-Path: <jussi.kukkonen@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id AFA7265CBF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Dec 2016 11:05:32 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga105.jf.intel.com with ESMTP; 08 Dec 2016 03:05:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,319,1477983600"; d="scan'208";a="38202987"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga004.jf.intel.com with ESMTP; 08 Dec 2016 03:05:32 -0800
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 043066A4006;
	Thu,  8 Dec 2016 03:04:46 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Dec 2016 13:05:25 +0200
Message-Id: <1481195125-28366-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] matchbox-wm: Upgrade 1.2.1 -> 1.2.2
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
X-List-Received-Date: Thu, 08 Dec 2016 11:05:32 -0000

Fixes [YOCTO #10635]: _NET_CURRENT_DESKTOP returns empty value.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../matchbox-wm/{matchbox-wm_1.2.1.bb => matchbox-wm_1.2.2.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/matchbox-wm/{matchbox-wm_1.2.1.bb => matchbox-wm_1.2.2.bb} (94%)

diff --git a/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.1.bb b/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.2.bb
similarity index 94%
rename from meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.1.bb
rename to meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.2.bb
index c3d2d23..815a75f 100644
--- a/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.1.bb
+++ b/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.2.bb
@@ -10,8 +10,8 @@ LIC_FILES_CHKSUM = "file://src/wm.h;endline=21;md5=a7e844465edbcf79c282369f93caa
 SECTION = "x11/wm"
 DEPENDS = "libmatchbox virtual/libx11 libxext libxrender startup-notification expat gconf libxcursor libxfixes"
 
-# SRCREV tagged 1.2.1
-SRCREV = "9fd1806dfa7c8f2202db18b7bc880857a3019f8c"
+# SRCREV tagged 1.2.2
+SRCREV = "27da947e7fbdf9659f7e5bd1e92af92af6c03970"
 SRC_URI = "git://git.yoctoproject.org/matchbox-window-manager \
            file://kbdconfig"
 
-- 
2.1.4


