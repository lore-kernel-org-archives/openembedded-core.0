Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 020FF73D6A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 May 2015 11:14:23 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 28 May 2015 04:14:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,512,1427785200"; d="scan'208";a="716899672"
Received: from theory.fi.intel.com ([10.237.72.51])
	by fmsmga001.fm.intel.com with ESMTP; 28 May 2015 04:14:24 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 May 2015 14:14:10 +0300
Message-Id: <1432811650-24083-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] mesa: Upgrade 10.5.4 -> 10.5.6
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
X-List-Received-Date: Thu, 28 May 2015 11:14:25 -0000

Among other things fixes a bug that prevents Weston from starting
on i965.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-graphics/mesa/{mesa-gl_10.5.4.bb => mesa-gl_10.5.6.bb} | 0
 meta/recipes-graphics/mesa/{mesa_10.5.4.bb => mesa_10.5.6.bb}       | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_10.5.4.bb => mesa-gl_10.5.6.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_10.5.4.bb => mesa_10.5.6.bb} (77%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_10.5.4.bb b/meta/recipes-graphics/mesa/mesa-gl_10.5.6.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_10.5.4.bb
rename to meta/recipes-graphics/mesa/mesa-gl_10.5.6.bb
diff --git a/meta/recipes-graphics/mesa/mesa_10.5.4.bb b/meta/recipes-graphics/mesa/mesa_10.5.6.bb
similarity index 77%
rename from meta/recipes-graphics/mesa/mesa_10.5.4.bb
rename to meta/recipes-graphics/mesa/mesa_10.5.6.bb
index 03c9ecf..70cc8aa 100644
--- a/meta/recipes-graphics/mesa/mesa_10.5.4.bb
+++ b/meta/recipes-graphics/mesa/mesa_10.5.6.bb
@@ -2,8 +2,8 @@ require ${BPN}.inc
 
 SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/mesa-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "26644437b6447fb3dbae50714a019797"
-SRC_URI[sha256sum] = "b51e723f3a20d842c88a92d809435b229fc4744ca0dbec0317d9d4a3ac4c6803"
+SRC_URI[md5sum] = "7a845c50fc8aaae4c9373e795c1f491d"
+SRC_URI[sha256sum] = "66017853bde5f7a6647db3eede30512a091a3491daa1708e0ad8027c328ba595"
 
 #because we cannot rely on the fact that all apps will use pkgconfig,
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
-- 
2.1.4


