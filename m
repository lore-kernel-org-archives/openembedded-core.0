Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1SFxEn-0004sc-M1
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Apr 2012 02:41:13 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 05 Apr 2012 17:32:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="138271600"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.12.114])
	by fmsmga001.fm.intel.com with ESMTP; 05 Apr 2012 17:32:00 -0700
From: josh@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Apr 2012 17:31:55 -0700
Message-Id: <1333672315-13193-1-git-send-email-josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH] mesa-common: package gl.pc in libgl-dev
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
X-List-Received-Date: Fri, 06 Apr 2012 00:41:13 -0000

From: Joshua Lock <josh@linux.intel.com>

gl.pc should be packaged in libgl-dev not the mesa-dev package

Fixes [YOCTO #2059]

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/recipes-graphics/mesa/mesa-common.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-common.inc b/meta/recipes-graphics/mesa/mesa-common.inc
index 59e8e64..2b90aed 100644
--- a/meta/recipes-graphics/mesa/mesa-common.inc
+++ b/meta/recipes-graphics/mesa/mesa-common.inc
@@ -46,7 +46,7 @@ FILES_libglu = "${libdir}/libGLU.so.*"
 FILES_libosmesa = "${libdir}/libOSMesa.so.*"
 
 FILES_libegl-dev = "${libdir}/libEGL.* ${includedir}/EGL"
-FILES_libgl-dev = "${libdir}/libGL.* ${includedir}/GL"
+FILES_libgl-dev = "${libdir}/libGL.* ${includedir}/GL ${libdir}/pkgconfig/gl.pc"
 FILES_libglu-dev = "${libdir}/libGLU.* ${includedir}/GL/glu*.h"
 FILES_libosmesa-dev = "${libdir}/libOSMesa.* ${includedir}/osmesa.h"
 
-- 
1.7.7.6



