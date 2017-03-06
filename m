Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id A8EF671CB3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Mar 2017 10:08:19 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Mar 2017 02:08:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,253,1484035200"; d="scan'208";a="1138442148"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 06 Mar 2017 02:08:20 -0800
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 5A3466A4080;
	Mon,  6 Mar 2017 02:08:17 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Mar 2017 12:08:14 +0200
Message-Id: <1488794894-5116-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] mesa: Upgrade 17.0.0 -> 17.0.1
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
X-List-Received-Date: Mon, 06 Mar 2017 10:08:20 -0000

This is a bug fix release and first non-development release in 17.0
branch. There are ~50 bug fix commits (plus a few release script
commits).

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-graphics/mesa/{mesa-gl_17.0.0.bb => mesa-gl_17.0.1.bb} | 0
 meta/recipes-graphics/mesa/{mesa_17.0.0.bb => mesa_17.0.1.bb}       | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_17.0.0.bb => mesa-gl_17.0.1.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_17.0.0.bb => mesa_17.0.1.bb} (83%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_17.0.0.bb b/meta/recipes-graphics/mesa/mesa-gl_17.0.1.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_17.0.0.bb
rename to meta/recipes-graphics/mesa/mesa-gl_17.0.1.bb
diff --git a/meta/recipes-graphics/mesa/mesa_17.0.0.bb b/meta/recipes-graphics/mesa/mesa_17.0.1.bb
similarity index 83%
rename from meta/recipes-graphics/mesa/mesa_17.0.0.bb
rename to meta/recipes-graphics/mesa/mesa_17.0.1.bb
index 6576e3c..9e491c2 100644
--- a/meta/recipes-graphics/mesa/mesa_17.0.0.bb
+++ b/meta/recipes-graphics/mesa/mesa_17.0.1.bb
@@ -5,8 +5,8 @@ SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/mesa-${PV}.tar.xz \
            file://disable-asm-on-non-gcc.patch \
            file://0001-Use-wayland-scanner-in-the-path.patch \
 "
-SRC_URI[md5sum] = "932e4171a86b14940c06812356486155"
-SRC_URI[sha256sum] = "39db3d59700159add7f977307d12a7dfe016363e760ad82280ac4168ea668481"
+SRC_URI[md5sum] = "6a7e768241846c8c69bbadbf904dcc58"
+SRC_URI[sha256sum] = "96fd70ef5f31d276a17e424e7e1bb79447ccbbe822b56844213ef932e7ad1b0c"
 
 #because we cannot rely on the fact that all apps will use pkgconfig,
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
-- 
2.1.4


