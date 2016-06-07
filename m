Return-Path: <jussi.kukkonen@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id EC66777153
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jun 2016 08:48:30 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 07 Jun 2016 01:48:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,432,1459839600"; d="scan'208";a="823174405"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga003.jf.intel.com with ESMTP; 07 Jun 2016 01:48:06 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Jun 2016 11:47:25 +0300
Message-Id: <41e8b8883228de6547ffa6f3790ef6e06a6b8a85.1465288175.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <7e2909e70b87ffcf2c752bd6ac326ef256bdc1b2.1465288175.git.jussi.kukkonen@intel.com>
References: <7e2909e70b87ffcf2c752bd6ac326ef256bdc1b2.1465288175.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1465288174.git.jussi.kukkonen@intel.com>
References: <cover.1465288174.git.jussi.kukkonen@intel.com>
Subject: [PATCH 07/37] matchbox-wm: Upgrade to 1.2.1
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
X-List-Received-Date: Tue, 07 Jun 2016 08:48:32 -0000

New version does not change MBWM theme when the Gtk+ theme
is changed using Net/ThemeName X property.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../matchbox-wm/{matchbox-wm_git.bb => matchbox-wm_1.2.1.bb}         | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/matchbox-wm/{matchbox-wm_git.bb => matchbox-wm_1.2.1.bb} (94%)

diff --git a/meta/recipes-graphics/matchbox-wm/matchbox-wm_git.bb b/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.1.bb
similarity index 94%
rename from meta/recipes-graphics/matchbox-wm/matchbox-wm_git.bb
rename to meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.1.bb
index aa76828..c3d2d23 100644
--- a/meta/recipes-graphics/matchbox-wm/matchbox-wm_git.bb
+++ b/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.1.bb
@@ -10,9 +10,8 @@ LIC_FILES_CHKSUM = "file://src/wm.h;endline=21;md5=a7e844465edbcf79c282369f93caa
 SECTION = "x11/wm"
 DEPENDS = "libmatchbox virtual/libx11 libxext libxrender startup-notification expat gconf libxcursor libxfixes"
 
-SRCREV = "8178e70d5c742c4cd63b51df228cc8aa3594d518"
-PV = "1.2+git${SRCPV}"
-
+# SRCREV tagged 1.2.1
+SRCREV = "9fd1806dfa7c8f2202db18b7bc880857a3019f8c"
 SRC_URI = "git://git.yoctoproject.org/matchbox-window-manager \
            file://kbdconfig"
 
-- 
2.1.4


