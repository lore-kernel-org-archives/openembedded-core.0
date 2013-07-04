Return-Path: <radu.moisan@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 480796B030
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2013 14:56:14 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 04 Jul 2013 07:56:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,995,1363158000"; d="scan'208";a="360532325"
Received: from ubuntu.rb.intel.com ([10.237.105.59])
	by fmsmga001.fm.intel.com with ESMTP; 04 Jul 2013 07:57:10 -0700
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Jul 2013 17:57:51 +0300
Message-Id: <e1e8028fd78fb1eacbe1e16385cbfb77d0db262e.1372947733.git.radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1372947733.git.radu.moisan@intel.com>
References: <cover.1372947733.git.radu.moisan@intel.com>
In-Reply-To: <cover.1372947733.git.radu.moisan@intel.com>
References: <cover.1372947733.git.radu.moisan@intel.com>
Subject: [PATCH 08/11] apr: Upgrade to v1.4.8
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
X-List-Received-Date: Thu, 04 Jul 2013 14:56:14 -0000

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


