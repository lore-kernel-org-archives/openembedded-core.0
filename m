Return-Path: <jussi.kukkonen@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 16B3374227
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 13:26:46 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 22 May 2015 06:26:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,475,1427785200"; d="scan'208";a="730223244"
Received: from theory.fi.intel.com ([10.237.72.51])
	by fmsmga002.fm.intel.com with ESMTP; 22 May 2015 06:26:47 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 May 2015 16:26:52 +0300
Message-Id: <aaca1a960fe5eb5a6080256d2e99915a8d0e508f.1432300539.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1432300539.git.jussi.kukkonen@intel.com>
References: <cover.1432300539.git.jussi.kukkonen@intel.com>
Subject: [PATCH 1/2] libpng12: Upgrade 1.2.52 -> 1.2.53
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
X-List-Received-Date: Fri, 22 May 2015 13:26:49 -0000

License file changes are not actual license changes.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../libpng/{libpng12_1.2.52.bb => libpng12_1.2.53.bb}             | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-lsb4/libpng/{libpng12_1.2.52.bb => libpng12_1.2.53.bb} (70%)

diff --git a/meta/recipes-lsb4/libpng/libpng12_1.2.52.bb b/meta/recipes-lsb4/libpng/libpng12_1.2.53.bb
similarity index 70%
rename from meta/recipes-lsb4/libpng/libpng12_1.2.52.bb
rename to meta/recipes-lsb4/libpng/libpng12_1.2.53.bb
index 5b67fe8..bf861a7 100644
--- a/meta/recipes-lsb4/libpng/libpng12_1.2.52.bb
+++ b/meta/recipes-lsb4/libpng/libpng12_1.2.53.bb
@@ -2,8 +2,8 @@ SUMMARY = "PNG image format decoding library"
 HOMEPAGE = "http://www.libpng.org/"
 SECTION = "libs"
 LICENSE = "Libpng"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=4495b57387451782e5f34c2968c35ed0 \
-                    file://png.h;beginline=314;endline=428;md5=0c93e62d39955f2b879c056165cfad43"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=bd2a7a13355fcca92ad83bdf7e296011 \
+                    file://png.h;beginline=322;endline=436;md5=caf9ee541234c663aeecdcfef2f79ae1"
 DEPENDS = "zlib"
 
 PN = "libpng12"
@@ -11,8 +11,8 @@ S = "${WORKDIR}/libpng-${PV}"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/libpng/libpng12/${PV}/libpng-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "49d5c71929bf69a172147c47b9309fbe"
-SRC_URI[sha256sum] = "d4fb0fbf14057ad6d0319034188fc2aecddb493da8e3031b7b072ed28f510ec0"
+SRC_URI[md5sum] = "7d18a74e6fd2029aee76ccd00e00a9e6"
+SRC_URI[sha256sum] = "b45e49f689e7451bd576569e6a344f7e0d11c02ecbb797f4da0e431526765c0a"
 
 BINCONFIG_GLOB = "${PN}-config"
 
-- 
2.1.4


