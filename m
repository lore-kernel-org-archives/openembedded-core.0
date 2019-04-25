Return-Path: <naveen.kumar.saini@intel.com>
X-Greylist: delayed 567 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 25 Apr 2019 09:04:49 UTC
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id BAB257D39C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Apr 2019 09:04:49 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Apr 2019 01:55:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,393,1549958400"; d="scan'208";a="294412084"
Received: from optimus-prime.png.intel.com ([172.30.199.130])
	by orsmga004.jf.intel.com with ESMTP; 25 Apr 2019 01:55:22 -0700
From: Naveen Saini <naveen.kumar.saini@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Apr 2019 16:56:02 +0800
Message-Id: <20190425085602.5496-1-naveen.kumar.saini@intel.com>
X-Mailer: git-send-email 2.17.0
Subject: [PATCH 2/2] core-image-rt-sdk: make sure that we append to DEPENDS
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
X-List-Received-Date: Thu, 25 Apr 2019 09:04:49 -0000

This also fix postinst intercept hook 'update_gio_module_cache' failed warnings
that are now flagged as errors after the recent chagnes at lib/oe/package_manager.py

Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
---
 meta/recipes-rt/images/core-image-rt-sdk.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-rt/images/core-image-rt-sdk.bb b/meta/recipes-rt/images/core-image-rt-sdk.bb
index 0f7f091687..624b7d9430 100644
--- a/meta/recipes-rt/images/core-image-rt-sdk.bb
+++ b/meta/recipes-rt/images/core-image-rt-sdk.bb
@@ -11,7 +11,7 @@ python () {
 DESCRIPTION = "Small image capable of booting a device with a test suite and \
 tools for real-time use. It includes the full meta-toolchain, development \
 headers and libraries to form a standalone SDK."
-DEPENDS = "linux-yocto-rt"
+DEPENDS += "linux-yocto-rt"
 
 IMAGE_FEATURES += "dev-pkgs tools-sdk tools-debug eclipse-debug tools-profile tools-testapps debug-tweaks"
 
-- 
2.17.0


