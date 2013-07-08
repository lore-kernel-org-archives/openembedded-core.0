Return-Path: <radu.moisan@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id E08BA6B004
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jul 2013 10:20:16 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 08 Jul 2013 03:20:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1019,1363158000"; d="scan'208";a="328132594"
Received: from ubuntu.rb.intel.com ([10.237.105.59])
	by azsmga001.ch.intel.com with ESMTP; 08 Jul 2013 03:20:17 -0700
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Jul 2013 13:22:02 +0300
Message-Id: <176bb2d7fd936651932ec8e6d02f13ee0e966516.1373278823.git.radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1373278823.git.radu.moisan@intel.com>
References: <cover.1373278823.git.radu.moisan@intel.com>
In-Reply-To: <cover.1373278823.git.radu.moisan@intel.com>
References: <cover.1373278823.git.radu.moisan@intel.com>
Subject: [PATCH 7/9] apr-util: Upgrade to v1.5.2
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
X-List-Received-Date: Mon, 08 Jul 2013 10:20:17 -0000

Signed-off-by: Radu Moisan <radu.moisan@intel.com>
---
 .../apr/{apr-util_1.5.1.bb => apr-util_1.5.2.bb}   |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta/recipes-support/apr/{apr-util_1.5.1.bb => apr-util_1.5.2.bb} (91%)

diff --git a/meta/recipes-support/apr/apr-util_1.5.1.bb b/meta/recipes-support/apr/apr-util_1.5.2.bb
similarity index 91%
rename from meta/recipes-support/apr/apr-util_1.5.1.bb
rename to meta/recipes-support/apr/apr-util_1.5.2.bb
index e547fe0..ea0f7fb 100644
--- a/meta/recipes-support/apr/apr-util_1.5.1.bb
+++ b/meta/recipes-support/apr/apr-util_1.5.2.bb
@@ -9,14 +9,12 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=519e0a18e03f7c023070568c14b077bb \
                     file://include/apu_version.h;endline=17;md5=806685a84e71f10c80144c48eb35df42"
 
-PR = "r0"
-
 SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.gz \
            file://configfix.patch \
            file://configure_fixes.patch"
 
-SRC_URI[md5sum] = "490c2e26e2dc95fd0983ad71112ddac6"
-SRC_URI[sha256sum] = "0cf4e48d93ceb9a5e314f48fe127211b71d30234665587e2eaffbb4fc13d931d"
+SRC_URI[md5sum] = "eb682cfb8642babba427a4fb391b15e8"
+SRC_URI[sha256sum] = "a1ec5025373815795d2fa5bfac40c0984675feffc88e049be9a162c408c2f613"
 
 EXTRA_OECONF = "--with-apr=${STAGING_BINDIR_CROSS}/apr-1-config \ 
 		--without-odbc \
-- 
1.7.9.5


