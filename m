Return-Path: <jussi.kukkonen@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 02FD1719CE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2016 10:22:17 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP; 21 Oct 2016 03:22:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,375,1473145200"; d="scan'208";a="182256688"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga004.fm.intel.com with ESMTP; 21 Oct 2016 03:22:20 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Oct 2016 13:22:01 +0300
Message-Id: <1b577c9daa97d298a51a9d025abb07447eb23810.1477032779.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <e5ffe5ce81bc8eed3714e3e8199c0f977088779f.1477032779.git.jussi.kukkonen@intel.com>
References: <e5ffe5ce81bc8eed3714e3e8199c0f977088779f.1477032779.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1477032779.git.jussi.kukkonen@intel.com>
References: <cover.1477032779.git.jussi.kukkonen@intel.com>
Subject: [PATCH 03/15] libdrm: Upgrade 2.4.70 -> 2.4.71
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
X-List-Received-Date: Fri, 21 Oct 2016 10:22:18 -0000

Mostly a bug fix release.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-graphics/drm/{libdrm_2.4.70.bb => libdrm_2.4.71.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.70.bb => libdrm_2.4.71.bb} (93%)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.70.bb b/meta/recipes-graphics/drm/libdrm_2.4.71.bb
similarity index 93%
rename from meta/recipes-graphics/drm/libdrm_2.4.70.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.71.bb
index a2b5282..d7ca4a9 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.70.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.71.bb
@@ -16,8 +16,8 @@ SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.bz2 \
            file://0001-configure.ac-Allow-explicit-enabling-of-cunit-tests.patch \
           "
 
-SRC_URI[md5sum] = "920957cfe25a80efb02be9bd90bf3c1e"
-SRC_URI[sha256sum] = "b17d4b39ed97ca0e4cffa0db06ff609e617bac94646ec38e8e0579d530540e7b"
+SRC_URI[md5sum] = "776bccc84618b616fc57a7143836ae7a"
+SRC_URI[sha256sum] = "c66287ddeee5f46ea8f8880b94b80acb3bbc33ba6321d17767eef145046df9b8"
 
 inherit autotools pkgconfig
 
-- 
2.1.4


