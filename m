Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ionutx.radu@intel.com>) id 1Ua5q7-0001dU-2O
	for openembedded-core@lists.openembedded.org;
	Wed, 08 May 2013 16:59:36 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 08 May 2013 07:40:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,635,1363158000"; d="scan'208";a="330858629"
Received: from work.rb.intel.com ([10.237.105.51])
	by fmsmga001.fm.intel.com with ESMTP; 08 May 2013 07:40:19 -0700
From: Ionut Radu <ionutx.radu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 May 2013 17:41:53 +0300
Message-Id: <1368024119-4149-4-git-send-email-ionutx.radu@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1368024119-4149-1-git-send-email-ionutx.radu@intel.com>
References: <1368024119-4149-1-git-send-email-ionutx.radu@intel.com>
Subject: [PATCH 3/9] js: updated from 1.7.0+1.8.0rc1 to 185-1.0.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 08 May 2013 15:00:46 -0000

Signed-off-by: Ionut Radu <ionutx.radu@intel.com>
---
 .../js/{js_1.7.0+1.8.0rc1.bb => js_185-1.0.0.bb}                |    7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta/recipes-support/js/{js_1.7.0+1.8.0rc1.bb => js_185-1.0.0.bb} (85%)

diff --git a/meta/recipes-support/js/js_1.7.0+1.8.0rc1.bb b/meta/recipes-support/js/js_185-1.0.0.bb
similarity index 85%
rename from meta/recipes-support/js/js_1.7.0+1.8.0rc1.bb
rename to meta/recipes-support/js/js_185-1.0.0.bb
index 45a6fa7..3acb492 100644
--- a/meta/recipes-support/js/js_1.7.0+1.8.0rc1.bb
+++ b/meta/recipes-support/js/js_185-1.0.0.bb
@@ -5,17 +5,16 @@ SECTION = "libs"
 # the package is licensed under either of the following
 LICENSE = "MPL-1 | GPLv2+ | LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://jsapi.c;beginline=4;endline=39;md5=347c6bbf4fb4547de1fa5ad830030063"
-PR = "r4"
 
-SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/js/js-1.8.0-rc1.tar.gz \
+SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/js/js185-1.0.0.tar.gz \
            file://link_with_gcc.patch \
            file://usepic.patch \
            file://buildcc.patch;striplevel=2 \
            file://jsautocfg.h \
            file://configure.ac"
 
-SRC_URI[md5sum] = "eaad8815dcc66a717ddb87e9724d964e"
-SRC_URI[sha256sum] = "374398699ac3fd802d98d642486cf6b0edc082a119c9c9c499945a0bc73e3413"
+SRC_URI[md5sum] = "a4574365938222adca0a6bd33329cb32"
+SRC_URI[sha256sum] = "5d12f7e1f5b4a99436685d97b9b7b75f094d33580227aa998c406bbae6f2a687"
 
 S = "${WORKDIR}/js/src"
 
-- 
1.7.10.4



