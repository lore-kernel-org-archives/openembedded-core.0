Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 1E3EC6B5BA
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Dec 2013 22:30:18 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 28 Dec 2013 14:30:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,567,1384329600"; d="scan'208";a="457010088"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.113])
	by fmsmga002.fm.intel.com with ESMTP; 28 Dec 2013 14:30:17 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 28 Dec 2013 22:29:20 +0000
Message-Id: <46631ab366d71bebfe9fd0708758277fcfb8ce4d.1388269205.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1388269205.git.paul.eggleton@linux.intel.com>
References: <cover.1388269205.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1388269205.git.paul.eggleton@linux.intel.com>
References: <cover.1388269205.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 24/38] xf86-video-modesetting: set SUMMARY and DESCRIPTION
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
X-List-Received-Date: Sat, 28 Dec 2013 22:30:18 -0000

Set these consistent with other X.org video driver recipes.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-graphics/xorg-driver/xf86-video-modesetting_0.8.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-modesetting_0.8.0.bb b/meta/recipes-graphics/xorg-driver/xf86-video-modesetting_0.8.0.bb
index 035f47d..b13db41 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-modesetting_0.8.0.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-modesetting_0.8.0.bb
@@ -1,7 +1,8 @@
 require xorg-driver-video.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=5e53d3fcadb1c23d122ad63cb099a918"
 
-DESCRIPTION = "X.Org X server -- modesetting display driver"
+SUMMARY = "X.Org X server -- modesetting display driver"
+DESCRIPTION = "Provides a generic kernel modesetting display driver for the X.Org X server."
 
 SRC_URI[md5sum] = "1a25d6210257d4e493daf048f8b705a9"
 SRC_URI[sha256sum] = "13dc349e9aa50987ab2479d27d6879cda2c1f9ad8c8d3a1422a2f53c36f047f8"
-- 
1.8.1.2


