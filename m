Return-Path: <rebecca.swee.fun.chang@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9D98360750
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Feb 2018 08:56:34 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Feb 2018 00:56:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,477,1511856000"; d="scan'208";a="16237177"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by fmsmga007.fm.intel.com with ESMTP; 08 Feb 2018 00:56:34 -0800
From: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Feb 2018 16:51:14 +0800
Message-Id: <1518079875-44198-1-git-send-email-rebecca.swee.fun.chang@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/2] eudev: bump up to version 3.2.5
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
X-List-Received-Date: Thu, 08 Feb 2018 08:56:35 -0000

This upgraded version of eudev includes:
- Headers to build under glibc-2.25 and above
- Bug fix on ata_id
- Misc: rules and hardware database update

Signed-off-by: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
---
 meta/recipes-core/udev/{eudev_3.2.2.bb => eudev_3.2.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/udev/{eudev_3.2.2.bb => eudev_3.2.5.bb} (95%)

diff --git a/meta/recipes-core/udev/eudev_3.2.2.bb b/meta/recipes-core/udev/eudev_3.2.5.bb
similarity index 95%
rename from meta/recipes-core/udev/eudev_3.2.2.bb
rename to meta/recipes-core/udev/eudev_3.2.5.bb
index d011047..88ad8f1 100644
--- a/meta/recipes-core/udev/eudev_3.2.2.bb
+++ b/meta/recipes-core/udev/eudev_3.2.5.bb
@@ -20,8 +20,8 @@ SRC_URI = "http://dev.gentoo.org/~blueness/${BPN}/${BP}.tar.gz \
            file://udev.rules \
 "
 
-SRC_URI[md5sum] = "41e19b70462692fefd072a3f38818b6e"
-SRC_URI[sha256sum] = "3e4c56ec2fc1854afd0a31f3affa48f922c62d40ee12a0c1a4b4f152ef5b0f63"
+SRC_URI[md5sum] = "6ca08c0e14380f87df8e8aceac123671"
+SRC_URI[sha256sum] = "49c2d04105cad2526302627e040fa24b1916a9a3e059539bc8bb919b973890af"
 
 inherit autotools update-rc.d qemu pkgconfig distro_features_check
 
-- 
2.7.4


