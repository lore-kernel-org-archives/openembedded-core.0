Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E87E17829F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 17:09:36 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Aug 2017 10:09:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,417,1498546800"; d="scan'208";a="1187402138"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 23 Aug 2017 10:09:36 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Aug 2017 20:06:23 +0300
Message-Id: <afdc2f9e99ed740f2c18df345b89c3ed54c50dee.1503507784.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1503507784.git.alexander.kanavin@linux.intel.com>
References: <cover.1503507784.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 5/7] libepoxy: convert to meson build
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
X-List-Received-Date: Wed, 23 Aug 2017 17:09:37 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-graphics/libepoxy/libepoxy_1.4.3.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/libepoxy/libepoxy_1.4.3.bb b/meta/recipes-graphics/libepoxy/libepoxy_1.4.3.bb
index c8b398f1766..5ec96b1c663 100644
--- a/meta/recipes-graphics/libepoxy/libepoxy_1.4.3.bb
+++ b/meta/recipes-graphics/libepoxy/libepoxy_1.4.3.bb
@@ -10,12 +10,12 @@ SRC_URI[md5sum] = "af4c3ce0fb1143bdc4e43f85695a9bed"
 SRC_URI[sha256sum] = "0b808a06c9685a62fca34b680abb8bc7fb2fda074478e329b063c1f872b826f6"
 UPSTREAM_CHECK_URI = "https://github.com/anholt/libepoxy/releases"
 
-inherit autotools pkgconfig distro_features_check
+inherit meson pkgconfig distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "opengl"
 
 DEPENDS = "util-macros"
 
-PACKAGECONFIG[egl] = "--enable-egl, --disable-egl, virtual/egl"
-PACKAGECONFIG[x11] = "--enable-glx, --disable-glx, virtual/libx11"
+PACKAGECONFIG[egl] = "-Denable-egl=yes, -Denable-egl=no, virtual/egl"
+PACKAGECONFIG[x11] = "-Denable-glx=yes, -Denable-glx=no, virtual/libx11"
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)} egl"
-- 
2.14.1


