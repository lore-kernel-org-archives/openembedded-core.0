Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A1C1260291
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Dec 2015 19:26:51 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 16 Dec 2015 11:26:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,437,1444719600"; d="scan'208";a="619130991"
Received: from mlmcgint-mobl.amr.corp.intel.com (HELO swold-mobl.jf.intel.com)
	([10.252.195.82])
	by FMSMGA003.fm.intel.com with ESMTP; 16 Dec 2015 11:26:42 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Wed, 16 Dec 2015 11:26:41 -0800
Message-Id: <1450294001-6610-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH] libdrm: Upgrade to 2.4.64
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
X-List-Received-Date: Wed, 16 Dec 2015 19:26:52 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-graphics/drm/{libdrm_2.4.62.bb => libdrm_2.4.64.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.62.bb => libdrm_2.4.64.bb} (92%)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.62.bb b/meta/recipes-graphics/drm/libdrm_2.4.64.bb
similarity index 92%
rename from meta/recipes-graphics/drm/libdrm_2.4.62.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.64.bb
index ea6305e..cb0efe1 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.62.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.64.bb
@@ -12,8 +12,9 @@ DEPENDS = "libpthread-stubs udev libpciaccess"
 
 SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.bz2 \
            file://installtests.patch "
-SRC_URI[md5sum] = "c9291bae0e5ca65d1483821d3698d3ab"
-SRC_URI[sha256sum] = "906c294bdbe1c94c3ca084305d61a6e5a8367f3b4986e6cc13b1e9b3f75931dc"
+
+SRC_URI[md5sum] = "543b2d28359cf33974fa0e772dd61732"
+SRC_URI[sha256sum] = "b60786fe7d6e42adb3966ce1a658f63fec528d537396381cbda93bcc99a934b6"
 
 inherit autotools pkgconfig
 
-- 
2.5.0


