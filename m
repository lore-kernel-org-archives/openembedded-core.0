Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 7E2B271BCE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 15:15:37 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP; 17 Oct 2016 08:15:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,357,1473145200"; d="scan'208";a="180649361"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 17 Oct 2016 08:15:40 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Oct 2016 18:12:52 +0300
Message-Id: <0093626b17c30ef1e7d9f2492f3cb1d41a954f32.1476716907.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1476716907.git.alexander.kanavin@linux.intel.com>
References: <cover.1476716907.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1476716907.git.alexander.kanavin@linux.intel.com>
References: <cover.1476716907.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 12/23] libdrm: enable optional building of manpages
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
X-List-Received-Date: Mon, 17 Oct 2016 15:15:37 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-graphics/drm/libdrm_2.4.70.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.70.bb b/meta/recipes-graphics/drm/libdrm_2.4.70.bb
index a2b5282..1811927 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.70.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.70.bb
@@ -19,15 +19,15 @@ SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.bz2 \
 SRC_URI[md5sum] = "920957cfe25a80efb02be9bd90bf3c1e"
 SRC_URI[sha256sum] = "b17d4b39ed97ca0e4cffa0db06ff609e617bac94646ec38e8e0579d530540e7b"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig manpages
 
 EXTRA_OECONF += "--disable-cairo-tests \
                  --without-cunit \
                  --enable-omap-experimental-api \
                  --enable-install-test-programs \
-                 --disable-manpages \
                  --disable-valgrind \
                 "
+PACKAGECONFIG[manpages] = "--enable-manpages, --disable-manpages, libxslt-native xmlto-native"
 
 ALLOW_EMPTY_${PN}-drivers = "1"
 PACKAGES =+ "${PN}-tests ${PN}-drivers ${PN}-radeon ${PN}-nouveau ${PN}-omap \
-- 
2.9.3


