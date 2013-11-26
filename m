Return-Path: <cristiana.voicu@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id DD63C6DD54
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2013 12:34:08 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 26 Nov 2013 04:34:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,774,1378882800"; d="scan'208";a="434308311"
Received: from cvoicu-vostro-460.rb.intel.com ([10.237.105.65])
	by fmsmga001.fm.intel.com with ESMTP; 26 Nov 2013 04:34:05 -0800
From: Cristiana Voicu <cristiana.voicu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Nov 2013 14:39:45 +0200
Message-Id: <c7fa6446c62669988711ad9c0bc2ddeb4c34e303.1385469411.git.cristiana.voicu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1385469411.git.cristiana.voicu@intel.com>
References: <cover.1385469411.git.cristiana.voicu@intel.com>
In-Reply-To: <cover.1385469411.git.cristiana.voicu@intel.com>
References: <cover.1385469411.git.cristiana.voicu@intel.com>
Subject: [PATCH 1/3] apr: upgrade to 1.5.0
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
X-List-Received-Date: Tue, 26 Nov 2013 12:34:09 -0000

The following typo was fixed in the license file:
< code for the these subcomponents is subject to the terms and
< conditions of the following licenses.

> code for these subcomponents is subject to the terms and conditions
> of the following licenses.

Signed-off-by: Cristiana Voicu <cristiana.voicu@intel.com>
---
 .../apr/{apr_1.4.8.bb => apr_1.5.0.bb}             |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/apr/{apr_1.4.8.bb => apr_1.5.0.bb} (89%)

diff --git a/meta/recipes-support/apr/apr_1.4.8.bb b/meta/recipes-support/apr/apr_1.5.0.bb
similarity index 89%
rename from meta/recipes-support/apr/apr_1.4.8.bb
rename to meta/recipes-support/apr/apr_1.5.0.bb
index d834170..04f7a22 100644
--- a/meta/recipes-support/apr/apr_1.4.8.bb
+++ b/meta/recipes-support/apr/apr_1.5.0.bb
@@ -4,7 +4,7 @@ SECTION = "libs"
 DEPENDS = "util-linux"
 
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=0c35ff3c4c83b89d2f076e315caac28b \
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4dfd4cd216828c8cae5de5a12f3844c8 \
                     file://include/apr_lib.h;endline=17;md5=ee42fa7575dc40580a9e01c1b75fae96"
 
 BBCLASSEXTEND = "native"
@@ -14,8 +14,8 @@ SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.bz2 \
            file://cleanup.patch \
            file://configfix.patch"
 
-SRC_URI[md5sum] = "ce2ab01a0c3cdb71cf0a6326b8654f41"
-SRC_URI[sha256sum] = "61b8d2f8d321c6365ee3d71d0bb41f3a89c44da6124cc5b407a3b8319d660421"
+SRC_URI[md5sum] = "cc93bd2c12d0d037f68e21cc6385dc31"
+SRC_URI[sha256sum] = "17287d36a5917e27281e60d47e7b147bd5ddcd1ca832702c2318f5e0724f1221"
 
 inherit autotools lib_package binconfig multilib_header
 
-- 
1.7.9.5


