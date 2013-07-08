Return-Path: <radu.moisan@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id C56D46B052
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jul 2013 10:20:15 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 08 Jul 2013 03:20:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1019,1363158000"; d="scan'208";a="328132584"
Received: from ubuntu.rb.intel.com ([10.237.105.59])
	by azsmga001.ch.intel.com with ESMTP; 08 Jul 2013 03:20:16 -0700
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Jul 2013 13:22:01 +0300
Message-Id: <9518d1c826287a43486771efd92ef44a7e30e361.1373278823.git.radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1373278823.git.radu.moisan@intel.com>
References: <cover.1373278823.git.radu.moisan@intel.com>
In-Reply-To: <cover.1373278823.git.radu.moisan@intel.com>
References: <cover.1373278823.git.radu.moisan@intel.com>
Subject: [PATCH 6/9] apr: Upgrade to v1.4.8
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
X-List-Received-Date: Mon, 08 Jul 2013 10:20:16 -0000

Signed-off-by: Radu Moisan <radu.moisan@intel.com>
---
 .../apr/{apr_1.4.6.bb => apr_1.4.8.bb}             |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta/recipes-support/apr/{apr_1.4.6.bb => apr_1.4.8.bb} (92%)

diff --git a/meta/recipes-support/apr/apr_1.4.6.bb b/meta/recipes-support/apr/apr_1.4.8.bb
similarity index 92%
rename from meta/recipes-support/apr/apr_1.4.6.bb
rename to meta/recipes-support/apr/apr_1.4.8.bb
index 77dffee..38a0673 100644
--- a/meta/recipes-support/apr/apr_1.4.6.bb
+++ b/meta/recipes-support/apr/apr_1.4.8.bb
@@ -9,15 +9,13 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0c35ff3c4c83b89d2f076e315caac28b \
 
 BBCLASSEXTEND = "native"
 
-PR = "r2"
-
 SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.bz2 \
            file://configure_fixes.patch \
            file://cleanup.patch \
            file://configfix.patch"
 
-SRC_URI[md5sum] = "ffee70a111fd07372982b0550bbb14b7"
-SRC_URI[sha256sum] = "9b635e60feb163e6fc6c375721f71f44d7e26d6b9cd52f6b86b04e65d2481cbc"
+SRC_URI[md5sum] = "ce2ab01a0c3cdb71cf0a6326b8654f41"
+SRC_URI[sha256sum] = "61b8d2f8d321c6365ee3d71d0bb41f3a89c44da6124cc5b407a3b8319d660421"
 
 inherit autotools lib_package binconfig multilib_header
 
-- 
1.7.9.5


