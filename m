Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1RSjnR-00062Y-02
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Nov 2011 07:25:33 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 21 Nov 2011 22:17:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,551,1315206000"; d="scan'208";a="77837153"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by azsmga001.ch.intel.com with ESMTP; 21 Nov 2011 22:17:55 -0800
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Nov 2011 14:15:08 +0800
Message-Id: <d9894a49df3ecfddba6961615f5e8a98d0c2c9c7.1321942325.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1321942325.git.edwin.zhai@intel.com>
References: <cover.1321942325.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1321942325.git.edwin.zhai@intel.com>
References: <cover.1321942325.git.edwin.zhai@intel.com>
Subject: [PATCH 1/1] matchbox-wm: Fix variable type in _NET_WORKAREA setting
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 22 Nov 2011 06:25:34 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

According to XChangeProperty doc, array of "long" should be used when format is
32. Wrong _NET_WORKAREA parameter caused blank screen in matchbox-desktop on 64
bit platform.

[YOCTO #1689] got fixed.

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../matchbox-wm/matchbox-wm_git.bb                 |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-graphics/matchbox-wm/matchbox-wm_git.bb b/meta/recipes-graphics/matchbox-wm/matchbox-wm_git.bb
index f58529d..5550dc2 100644
--- a/meta/recipes-graphics/matchbox-wm/matchbox-wm_git.bb
+++ b/meta/recipes-graphics/matchbox-wm/matchbox-wm_git.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://src/wm.h;endline=21;md5=a7e844465edbcf79c282369f93caa
 SECTION = "x11/wm"
 DEPENDS = "libmatchbox virtual/libx11 libxext libxrender startup-notification expat gconf"
 
-SRCREV = "e8236c9ab44a8af8137cac2a35fb87f9146a9656"
+SRCREV = "f4394eaed475de6e627d373c5b35ee2cf87072e3"
 PV = "1.2+git${SRCPV}"
 PR = "r0"
 
-- 
1.7.1



