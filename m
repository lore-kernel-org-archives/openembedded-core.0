Return-Path: <jussi.kukkonen@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id BFD7B71BA0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 13:16:31 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga105.fm.intel.com with ESMTP; 27 Jun 2017 06:16:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,399,1493708400"; d="scan'208";a="119750849"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 27 Jun 2017 06:16:32 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 1BC1858069C;
	Tue, 27 Jun 2017 06:16:31 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Jun 2017 16:16:25 +0300
Message-Id: <7f8b7c06040b1a12d4a85f82a2ec7c44617538a6.1498569089.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1498569089.git.jussi.kukkonen@intel.com>
References: <cover.1498569089.git.jussi.kukkonen@intel.com>
Subject: [PATCH 3/3] libepoxy: Upgrade 1.4.2 -> 1.4.3
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
X-List-Received-Date: Tue, 27 Jun 2017 13:16:31 -0000

Imports the current EGL API registry from Khronos.

Makes EGL support optional: this is reflected in the recipe but
egl is enabled by default as before.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../libepoxy/{libepoxy_1.4.2.bb => libepoxy_1.4.3.bb}            | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/libepoxy/{libepoxy_1.4.2.bb => libepoxy_1.4.3.bb} (70%)

diff --git a/meta/recipes-graphics/libepoxy/libepoxy_1.4.2.bb b/meta/recipes-graphics/libepoxy/libepoxy_1.4.3.bb
similarity index 70%
rename from meta/recipes-graphics/libepoxy/libepoxy_1.4.2.bb
rename to meta/recipes-graphics/libepoxy/libepoxy_1.4.3.bb
index e69e828..c8b398f 100644
--- a/meta/recipes-graphics/libepoxy/libepoxy_1.4.2.bb
+++ b/meta/recipes-graphics/libepoxy/libepoxy_1.4.3.bb
@@ -6,15 +6,16 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=58ef4c80d401e07bd9ee8b6b58cf464b"
 
 SRC_URI = "https://github.com/anholt/${BPN}/releases/download/${PV}/${BP}.tar.xz"
-SRC_URI[md5sum] = "632fcfd7ae9d21f5a634326d753a89c4"
-SRC_URI[sha256sum] = "bea6fdec3d10939954495da898d872ee836b75c35699074cbf02a64fcb80d5b3"
+SRC_URI[md5sum] = "af4c3ce0fb1143bdc4e43f85695a9bed"
+SRC_URI[sha256sum] = "0b808a06c9685a62fca34b680abb8bc7fb2fda074478e329b063c1f872b826f6"
 UPSTREAM_CHECK_URI = "https://github.com/anholt/libepoxy/releases"
 
 inherit autotools pkgconfig distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "opengl"
 
-DEPENDS = "util-macros virtual/egl"
+DEPENDS = "util-macros"
 
+PACKAGECONFIG[egl] = "--enable-egl, --disable-egl, virtual/egl"
 PACKAGECONFIG[x11] = "--enable-glx, --disable-glx, virtual/libx11"
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)} egl"
-- 
2.1.4


