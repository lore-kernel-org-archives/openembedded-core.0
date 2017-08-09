Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id E8D45600EB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Aug 2017 20:59:29 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Aug 2017 13:59:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,349,1498546800"; d="scan'208";a="888339944"
Received: from jalamego-mobl3.zpn.intel.com ([10.219.128.130])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Aug 2017 13:59:30 -0700
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Aug 2017 15:59:25 -0500
Message-Id: <1502312365-9449-1-git-send-email-jose.a.lamego@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] python3-docutils: update to 0.14
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
X-List-Received-Date: Wed, 09 Aug 2017 20:59:30 -0000

python3-docutils recipe must be upgraded to latest stable release.

LIC_FILES_CHKSUM changed due to a typo fix from previous version,
but license type and information remained the same.

This change was tested on qemu with core-image-minimal.

Signed-off-by: Jose Lamego <jose.a.lamego@linux.intel.com>
---
 .../python/{python3-docutils_0.13.1.bb => python3-docutils_0.14.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-docutils_0.13.1.bb => python3-docutils_0.14.bb} (60%)

diff --git a/meta/recipes-devtools/python/python3-docutils_0.13.1.bb b/meta/recipes-devtools/python/python3-docutils_0.14.bb
similarity index 60%
rename from meta/recipes-devtools/python/python3-docutils_0.13.1.bb
rename to meta/recipes-devtools/python/python3-docutils_0.14.bb
index e36388c..81a449d 100644
--- a/meta/recipes-devtools/python/python3-docutils_0.13.1.bb
+++ b/meta/recipes-devtools/python/python3-docutils_0.14.bb
@@ -2,13 +2,13 @@ SUMMARY = "Text processing system for documentation"
 HOMEPAGE = "http://docutils.sourceforge.net"
 SECTION = "devel/python"
 LICENSE = "PSF & BSD-2-Clause & GPLv3"
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=7a4646907ab9083c826280b19e103106"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=35a23d42b615470583563132872c97d6"
 
 DEPENDS = "python3"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/docutils/docutils-${PV}.tar.gz"
-SRC_URI[md5sum] = "ea4a893c633c788be9b8078b6b305d53"
-SRC_URI[sha256sum] = "718c0f5fb677be0f34b781e04241c4067cbd9327b66bdd8e763201130f5175be"
+SRC_URI[md5sum] = "c53768d63db3873b7d452833553469de"
+SRC_URI[sha256sum] = "51e64ef2ebfb29cae1faa133b3710143496eca21c530f3f71424d77687764274"
 
 S = "${WORKDIR}/docutils-${PV}"
 
-- 
2.7.4


