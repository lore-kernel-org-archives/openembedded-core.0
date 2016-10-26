Return-Path: <jussi.kukkonen@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id A6A1C71B7C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2016 08:37:45 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga105.fm.intel.com with ESMTP; 26 Oct 2016 01:37:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,549,1473145200"; d="scan'208";a="23758386"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 26 Oct 2016 01:37:46 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 548DA6A4006;
	Wed, 26 Oct 2016 01:37:12 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Oct 2016 11:37:26 +0300
Message-Id: <36527969cc55209885ef4837c0fae3acd8fc2259.1477469885.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <b4be4ec82b3f01924e2fb87dc868f56284d0a8cf.1477469885.git.jussi.kukkonen@intel.com>
References: <b4be4ec82b3f01924e2fb87dc868f56284d0a8cf.1477469885.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1477469885.git.jussi.kukkonen@intel.com>
References: <cover.1477469885.git.jussi.kukkonen@intel.com>
Subject: [PATCHv2 03/16] libdrm: Upgrade 2.4.70 -> 2.4.71
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
X-List-Received-Date: Wed, 26 Oct 2016 08:37:45 -0000

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


