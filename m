Return-Path: <jussi.kukkonen@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 7C187606CA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2016 08:56:18 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 17 Nov 2016 00:56:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,504,1473145200"; d="scan'208";a="1086475330"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 17 Nov 2016 00:56:17 -0800
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 6CDDD6A4006;
	Thu, 17 Nov 2016 00:55:37 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Nov 2016 10:56:04 +0200
Message-Id: <1479372964-21409-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1479301275.git.jussi.kukkonen@intel.com>
References: <cover.1479301275.git.jussi.kukkonen@intel.com>
Subject: [PATCH] libdrm: Upgrade 2.4.71 -> 2.4.73
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
X-List-Received-Date: Thu, 17 Nov 2016 08:56:21 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---

I've pushed this into the mesa-piglit update branch:

  git://git.yoctoproject.org/poky-contrib jku/mesa-piglit
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/mesa-piglit

Thanks,
 Jussi


 meta/recipes-graphics/drm/{libdrm_2.4.71.bb => libdrm_2.4.73.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.71.bb => libdrm_2.4.73.bb} (93%)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.71.bb b/meta/recipes-graphics/drm/libdrm_2.4.73.bb
similarity index 93%
rename from meta/recipes-graphics/drm/libdrm_2.4.71.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.73.bb
index 152cf55..3315014 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.71.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.73.bb
@@ -16,8 +16,8 @@ SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.bz2 \
            file://0001-configure.ac-Allow-explicit-enabling-of-cunit-tests.patch \
           "
 
-SRC_URI[md5sum] = "776bccc84618b616fc57a7143836ae7a"
-SRC_URI[sha256sum] = "c66287ddeee5f46ea8f8880b94b80acb3bbc33ba6321d17767eef145046df9b8"
+SRC_URI[md5sum] = "bc1cee09cde72ffe3b952e8f50ccdaa8"
+SRC_URI[sha256sum] = "96bfd39242fe168017d95f22e141645a35591f5902a7d98c2fa4ca8c31df5e4d"
 
 inherit autotools pkgconfig manpages
 
-- 
2.1.4


