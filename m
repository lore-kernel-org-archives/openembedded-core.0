Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RVJ8I-0005pY-9q
	for openembedded-core@openembedded.org; Tue, 29 Nov 2011 09:33:42 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 29 Nov 2011 00:26:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,590,1315206000"; d="scan'208";a="96419468"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.251])
	by fmsmga002.fm.intel.com with ESMTP; 29 Nov 2011 00:26:58 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Tue, 29 Nov 2011 00:26:45 -0800
Message-Id: <1b0811e1547c7b7e81372248e233867a7df2e2e4.1322554983.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1322554983.git.sgw@linux.intel.com>
References: <cover.1322554983.git.sgw@linux.intel.com>
In-Reply-To: <cover.1322554983.git.sgw@linux.intel.com>
References: <cover.1322554983.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 14/23] mesa: package gl/egl/osmesa to separate packages
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
X-List-Received-Date: Tue, 29 Nov 2011 08:33:42 -0000

From: Martin Jansa <Martin.Jansa@gmail.com>

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/mesa/mesa-common.inc |   13 +++++++++++--
 1 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-common.inc b/meta/recipes-graphics/mesa/mesa-common.inc
index 1d9c894..7d729b4 100644
--- a/meta/recipes-graphics/mesa/mesa-common.inc
+++ b/meta/recipes-graphics/mesa/mesa-common.inc
@@ -38,7 +38,16 @@ EXTRA_OECONF = "--enable-glu \
 # Multiple virtual/gl providers being built breaks staging
 EXCLUDE_FROM_WORLD = "1"
 
-PACKAGES =+ "libglu libglu-dev"
-
+PACKAGES =+ "libegl libegl-dev libegl-dbg libglu libglu-dev libosmesa libosmesa-dev libgl libgl-dev"
+FILES_libegl = "${libdir}/libEGL.so.* ${libdir}/egl/*.so"
+FILES_libgl = "${libdir}/libGL.so.*"
 FILES_libglu = "${libdir}/libGLU.so.*"
+FILES_libosmesa = "${libdir}/libOSMesa.so.*"
+
+FILES_libegl-dev = "${libdir}/libEGL.* ${includedir}/EGL"
+FILES_libgl-dev = "${libdir}/libGL.* ${includedir}/GL"
 FILES_libglu-dev = "${libdir}/libGLU.* ${includedir}/GL/glu*.h"
+FILES_libosmesa-dev = "${libdir}/libOSMesa.* ${includedir}/osmesa.h"
+
+FILES_${PN}-dbg += "${libdir}/dri/.debug/*"
+FILES_libegl-dbg += "${libdir}/egl/.debug/*"
-- 
1.7.6.4



