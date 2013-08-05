Return-Path: <cristian.iorga@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 85539605A0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Aug 2013 14:58:54 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 05 Aug 2013 07:58:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,819,1367996400"; d="scan'208";a="277922093"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by AZSMGA002.ch.intel.com with ESMTP; 05 Aug 2013 07:58:54 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Aug 2013 17:59:51 +0300
Message-Id: <30ace777e346b76a491ff641df00a87c304de667.1375714695.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1375714695.git.cristian.iorga@intel.com>
References: <cover.1375714695.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1375714695.git.cristian.iorga@intel.com>
References: <cover.1375714695.git.cristian.iorga@intel.com>
Subject: [PATCH 1/4] neon: upgrade to v0.30.0
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
X-List-Received-Date: Mon, 05 Aug 2013 14:58:54 -0000

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../neon/{neon-0.29.6 => neon-0.30.0}/pkgconfig.patch              | 0
 meta/recipes-support/neon/{neon_0.29.6.bb => neon_0.30.0.bb}       | 7 ++-----
 2 files changed, 2 insertions(+), 5 deletions(-)
 rename meta/recipes-support/neon/{neon-0.29.6 => neon-0.30.0}/pkgconfig.patch (100%)
 rename meta/recipes-support/neon/{neon_0.29.6.bb => neon_0.30.0.bb} (83%)

diff --git a/meta/recipes-support/neon/neon-0.29.6/pkgconfig.patch b/meta/recipes-support/neon/neon-0.30.0/pkgconfig.patch
similarity index 100%
rename from meta/recipes-support/neon/neon-0.29.6/pkgconfig.patch
rename to meta/recipes-support/neon/neon-0.30.0/pkgconfig.patch
diff --git a/meta/recipes-support/neon/neon_0.29.6.bb b/meta/recipes-support/neon/neon_0.30.0.bb
similarity index 83%
rename from meta/recipes-support/neon/neon_0.29.6.bb
rename to meta/recipes-support/neon/neon_0.30.0.bb
index 157f711..dbc43bb 100644
--- a/meta/recipes-support/neon/neon_0.29.6.bb
+++ b/meta/recipes-support/neon/neon_0.30.0.bb
@@ -7,15 +7,12 @@ LIC_FILES_CHKSUM = "file://src/COPYING.LIB;md5=f30a9716ef3762e3467a2f62bf790f0a
 DEPENDS = "zlib libxml2 expat time gnutls libproxy"
 DEPENDS_class-native = "zlib-native libxml2-native expat-native gnutls-native"
 
-PR = "r3"
-
 BBCLASSEXTEND = "native"
 
 SRC_URI = "http://www.webdav.org/${BPN}/${BPN}-${PV}.tar.gz \
            file://pkgconfig.patch"
-
-SRC_URI[md5sum] = "591e0c82e6979e7e615211b386b8f6bc"
-SRC_URI[sha256sum] = "9c640b728d6dc80ef1e48f83181166ab6bc95309cece5537e01ffdd01b96eb43"
+SRC_URI[md5sum] = "fb60b3a124eeec441937a812c456fd94"
+SRC_URI[sha256sum] = "2962cfcb5d30f3272e3d2fa0e473434419770a3801afe3d46e5d1650787990c2"
 
 inherit autotools binconfig lib_package pkgconfig
 
-- 
1.8.1.2


