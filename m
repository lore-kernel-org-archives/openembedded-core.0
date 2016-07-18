Return-Path: <jussi.kukkonen@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 5B119731C3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2016 13:35:18 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP; 18 Jul 2016 06:34:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,384,1464678000"; d="scan'208";a="848345526"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga003.jf.intel.com with ESMTP; 18 Jul 2016 06:34:37 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jul 2016 16:34:25 +0300
Message-Id: <f5075f44fdc9bc1ca976ccb80a99f066b20df9c0.1468848064.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <c67de06959dd87fa6ce214da11cd431c44da056f.1468848064.git.jussi.kukkonen@intel.com>
References: <c67de06959dd87fa6ce214da11cd431c44da056f.1468848064.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1468848064.git.jussi.kukkonen@intel.com>
References: <cover.1468848064.git.jussi.kukkonen@intel.com>
Subject: [PATCHv2 2/9] mesa: Upgrade 11.2.2 -> 12.0.1
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
X-List-Received-Date: Mon, 18 Jul 2016 13:35:18 -0000

Massive mesa upgrade (OpenGL 4.3, GLVND support, vulkan driver
for intel etc), although many new things are disabled by default.

License file change does not change the actual licenses.

piglit results (with piglit update on ML) on an old NUC with Intel
HD5000 for reference:
       pass:   33972
       fail:     306
      crash:       2
       skip:   30857
       warn:       7
      total:   65144

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-graphics/mesa/{mesa-gl_11.2.2.bb => mesa-gl_12.0.1.bb} | 0
 meta/recipes-graphics/mesa/mesa.inc                                 | 2 +-
 meta/recipes-graphics/mesa/{mesa_11.2.2.bb => mesa_12.0.1.bb}       | 4 ++--
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_11.2.2.bb => mesa-gl_12.0.1.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_11.2.2.bb => mesa_12.0.1.bb} (80%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_11.2.2.bb b/meta/recipes-graphics/mesa/mesa-gl_12.0.1.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_11.2.2.bb
rename to meta/recipes-graphics/mesa/mesa-gl_12.0.1.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 1d084c0..e4880ff 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -10,7 +10,7 @@ HOMEPAGE = "http://mesa3d.org"
 BUGTRACKER = "https://bugs.freedesktop.org"
 SECTION = "x11"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://docs/license.html;md5=6a23445982a7a972ac198e93cc1cb3de"
+LIC_FILES_CHKSUM = "file://docs/license.html;md5=899fbe7e42d494c7c8c159c7001693d5"
 
 PE = "2"
 
diff --git a/meta/recipes-graphics/mesa/mesa_11.2.2.bb b/meta/recipes-graphics/mesa/mesa_12.0.1.bb
similarity index 80%
rename from meta/recipes-graphics/mesa/mesa_11.2.2.bb
rename to meta/recipes-graphics/mesa/mesa_12.0.1.bb
index a864b54..ad872b3 100644
--- a/meta/recipes-graphics/mesa/mesa_11.2.2.bb
+++ b/meta/recipes-graphics/mesa/mesa_12.0.1.bb
@@ -4,8 +4,8 @@ SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/mesa-${PV}.tar.xz \
            file://replace_glibc_check_with_linux.patch \
 "
 
-SRC_URI[md5sum] = "e0ec73f7273662a74366f0d76dd19ac3"
-SRC_URI[sha256sum] = "40e148812388ec7c6d7b6657d5a16e2e8dabba8b97ddfceea5197947647bdfb4"
+SRC_URI[md5sum] = "972fd5ad5a63aeabf173fb9adefc6522"
+SRC_URI[sha256sum] = "bab24fb79f78c876073527f515ed871fc9c81d816f66c8a0b051d8d653896389"
 
 #because we cannot rely on the fact that all apps will use pkgconfig,
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
-- 
2.1.4


