Return-Path: <jussi.kukkonen@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 12F7E70149
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 07:21:04 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 12 May 2016 00:21:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,609,1455004800"; d="scan'208";a="974144651"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga002.jf.intel.com with ESMTP; 12 May 2016 00:20:55 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 May 2016 10:20:32 +0300
Message-Id: <995fa5136bad9672fb8e2b6af572b2ca12272617.1463035854.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <93f1600d7ce782dbafb1ab32da9416dc29d432c2.1463035854.git.jussi.kukkonen@intel.com>
References: <93f1600d7ce782dbafb1ab32da9416dc29d432c2.1463035854.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1463035854.git.jussi.kukkonen@intel.com>
References: <cover.1463035854.git.jussi.kukkonen@intel.com>
Subject: [PATCH 09/13] mesa: Upgrade 11.1.1 -> 11.2.2
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
X-List-Received-Date: Thu, 12 May 2016 07:21:07 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-graphics/mesa/{mesa-gl_11.1.1.bb => mesa-gl_11.2.2.bb} | 0
 meta/recipes-graphics/mesa/{mesa_11.1.1.bb => mesa_11.2.2.bb}       | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_11.1.1.bb => mesa-gl_11.2.2.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_11.1.1.bb => mesa_11.2.2.bb} (80%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_11.1.1.bb b/meta/recipes-graphics/mesa/mesa-gl_11.2.2.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_11.1.1.bb
rename to meta/recipes-graphics/mesa/mesa-gl_11.2.2.bb
diff --git a/meta/recipes-graphics/mesa/mesa_11.1.1.bb b/meta/recipes-graphics/mesa/mesa_11.2.2.bb
similarity index 80%
rename from meta/recipes-graphics/mesa/mesa_11.1.1.bb
rename to meta/recipes-graphics/mesa/mesa_11.2.2.bb
index 502afcf..a864b54 100644
--- a/meta/recipes-graphics/mesa/mesa_11.1.1.bb
+++ b/meta/recipes-graphics/mesa/mesa_11.2.2.bb
@@ -4,8 +4,8 @@ SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/mesa-${PV}.tar.xz \
            file://replace_glibc_check_with_linux.patch \
 "
 
-SRC_URI[md5sum] = "1043dfb907beecb2a761272455960427"
-SRC_URI[sha256sum] = "64db074fc514136b5fb3890111f0d50604db52f0b1e94ba3fcb0fe8668a7fd20"
+SRC_URI[md5sum] = "e0ec73f7273662a74366f0d76dd19ac3"
+SRC_URI[sha256sum] = "40e148812388ec7c6d7b6657d5a16e2e8dabba8b97ddfceea5197947647bdfb4"
 
 #because we cannot rely on the fact that all apps will use pkgconfig,
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
-- 
2.1.4


