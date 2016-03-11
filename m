Return-Path: <jussi.kukkonen@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 29A38760A5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 13:07:06 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP; 11 Mar 2016 05:07:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,320,1455004800"; d="scan'208";a="907975436"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga001.jf.intel.com with ESMTP; 11 Mar 2016 05:07:06 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Mar 2016 15:12:29 +0200
Message-Id: <1bc6a59fee9856eb779b31973aee048d5d5df0a3.1457698804.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cdfe332fa18ab7007527661a7cb458f899f04336.1457698804.git.jussi.kukkonen@intel.com>
References: <cdfe332fa18ab7007527661a7cb458f899f04336.1457698804.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1457698804.git.jussi.kukkonen@intel.com>
References: <cover.1457698804.git.jussi.kukkonen@intel.com>
Subject: [RFC PATCH 10/12] matchbox-wm: Upgrade to JKU
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
X-List-Received-Date: Fri, 11 Mar 2016 13:07:06 -0000

This version does not change MBWM theme when the Gtk+ theme
is changed using Net/ThemeName X property.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-graphics/matchbox-wm/matchbox-wm_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/matchbox-wm/matchbox-wm_git.bb b/meta/recipes-graphics/matchbox-wm/matchbox-wm_git.bb
index 422d255..a7e15a6 100644
--- a/meta/recipes-graphics/matchbox-wm/matchbox-wm_git.bb
+++ b/meta/recipes-graphics/matchbox-wm/matchbox-wm_git.bb
@@ -10,10 +10,10 @@ LIC_FILES_CHKSUM = "file://src/wm.h;endline=21;md5=a7e844465edbcf79c282369f93caa
 SECTION = "x11/wm"
 DEPENDS = "libmatchbox virtual/libx11 libxext libxrender startup-notification expat gconf libxcursor libxfixes"
 
-SRCREV = "29544f0e61cc281fc60061443a537271e1081b78"
+SRCREV = "d261f6ff6e9f66da4012d2f9e9d56232b40c68a1"
 PV = "1.2+git${SRCPV}"
 
-SRC_URI = "git://git.yoctoproject.org/matchbox-window-manager \
+SRC_URI = "git://github.com/jku/matchbox-window-manager.git;branch=gtk3 \
            file://kbdconfig"
 
 S = "${WORKDIR}/git"
-- 
2.1.4


