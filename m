Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 4804B71D76
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Oct 2016 15:15:09 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga105.jf.intel.com with ESMTP; 28 Oct 2016 08:15:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,410,1473145200"; d="scan'208";a="24878714"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 28 Oct 2016 08:15:10 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Oct 2016 18:12:15 +0300
Message-Id: <f00114f7ced70e6f0235f0e1aa0418820356de87.1477667287.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1477667287.git.alexander.kanavin@linux.intel.com>
References: <cover.1477667287.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1477667287.git.alexander.kanavin@linux.intel.com>
References: <cover.1477667287.git.alexander.kanavin@linux.intel.com>
Subject: [PATCHv2 12/26] libdrm: enable optional building of manpages
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
X-List-Received-Date: Fri, 28 Oct 2016 15:15:09 -0000

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


