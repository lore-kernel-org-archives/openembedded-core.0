Return-Path: <edwin.plauchu.camacho@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id C6A3471D86
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 18:11:44 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 13 Jan 2017 10:11:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,222,1477983600"; d="scan'208";a="1112210496"
Received: from pianodaemon-contraption.zpn.intel.com ([10.219.128.47])
	by fmsmga002.fm.intel.com with ESMTP; 13 Jan 2017 10:11:44 -0800
From: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Jan 2017 12:13:15 -0600
Message-Id: <1484331195-11919-1-git-send-email-edwin.plauchu.camacho@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH V2] python3-docutils: upgrade to 0.13.1
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
X-List-Received-Date: Fri, 13 Jan 2017 18:11:47 -0000

Changed document date field and several notes about folders

Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>
---
 .../python/{python3-docutils_0.12.bb => python3-docutils_0.13.1.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-docutils_0.12.bb => python3-docutils_0.13.1.bb} (60%)

diff --git a/meta/recipes-devtools/python/python3-docutils_0.12.bb b/meta/recipes-devtools/python/python3-docutils_0.13.1.bb
similarity index 60%
rename from meta/recipes-devtools/python/python3-docutils_0.12.bb
rename to meta/recipes-devtools/python/python3-docutils_0.13.1.bb
index e78fa3b..e36388c 100644
--- a/meta/recipes-devtools/python/python3-docutils_0.12.bb
+++ b/meta/recipes-devtools/python/python3-docutils_0.13.1.bb
@@ -2,13 +2,13 @@ SUMMARY = "Text processing system for documentation"
 HOMEPAGE = "http://docutils.sourceforge.net"
 SECTION = "devel/python"
 LICENSE = "PSF & BSD-2-Clause & GPLv3"
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=a722fbdc20347db7b69223594dd54574"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=7a4646907ab9083c826280b19e103106"
 
 DEPENDS = "python3"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/docutils/docutils-${PV}.tar.gz"
-SRC_URI[md5sum] = "4622263b62c5c771c03502afa3157768"
-SRC_URI[sha256sum] = "c7db717810ab6965f66c8cf0398a98c9d8df982da39b4cd7f162911eb89596fa"
+SRC_URI[md5sum] = "ea4a893c633c788be9b8078b6b305d53"
+SRC_URI[sha256sum] = "718c0f5fb677be0f34b781e04241c4067cbd9327b66bdd8e763201130f5175be"
 
 S = "${WORKDIR}/docutils-${PV}"
 
-- 
2.1.4


