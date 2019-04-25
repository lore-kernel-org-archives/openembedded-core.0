Return-Path: <naveen.kumar.saini@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 491CA6B8BC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Apr 2019 08:55:03 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Apr 2019 01:55:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,393,1549958400"; d="scan'208";a="340663257"
Received: from optimus-prime.png.intel.com ([172.30.199.130])
	by fmsmga006.fm.intel.com with ESMTP; 25 Apr 2019 01:55:02 -0700
From: Naveen Saini <naveen.kumar.saini@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Apr 2019 16:55:43 +0800
Message-Id: <20190425085543.5448-1-naveen.kumar.saini@intel.com>
X-Mailer: git-send-email 2.17.0
Subject: [PATCH 1/2] core-image-rt: make sure that we append to DEPENDS
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
X-List-Received-Date: Thu, 25 Apr 2019 08:55:03 -0000

This also fix postinst intercept hook 'update_gio_module_cache' failed warnings
that are now flagged as errors after the recent chagnes at lib/oe/package_manager.py

Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
---
 meta/recipes-rt/images/core-image-rt.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-rt/images/core-image-rt.bb b/meta/recipes-rt/images/core-image-rt.bb
index 9cb93b3de5..053d23219d 100644
--- a/meta/recipes-rt/images/core-image-rt.bb
+++ b/meta/recipes-rt/images/core-image-rt.bb
@@ -10,7 +10,7 @@ python () {
 
 DESCRIPTION = "A small image just capable of allowing a device to boot plus a \
 real-time test suite and tools appropriate for real-time use."
-DEPENDS = "linux-yocto-rt"
+DEPENDS += "linux-yocto-rt"
 
 IMAGE_INSTALL += "rt-tests hwlatdetect"
 
-- 
2.17.0


