Return-Path: <anuj.mittal@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 488DD7BF4F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Dec 2018 07:29:31 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Dec 2018 23:29:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,371,1539673200"; d="scan'208";a="119597354"
Received: from anmitta2-mobl1.png.intel.com (HELO
	anmitta2-MOBL1.gar.corp.intel.com) ([10.221.21.206])
	by FMSMGA003.fm.intel.com with ESMTP; 18 Dec 2018 23:29:31 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Dec 2018 15:29:21 +0800
Message-Id: <20181219072929.5870-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/9] eudev: upgrade 3.2.5 -> 3.2.7
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
X-List-Received-Date: Wed, 19 Dec 2018 07:29:31 -0000

For changes, see:

https://github.com/gentoo/eudev/compare/v3.2.5...v3.2.7

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-core/udev/{eudev_3.2.5.bb => eudev_3.2.7.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/udev/{eudev_3.2.5.bb => eudev_3.2.7.bb} (95%)

diff --git a/meta/recipes-core/udev/eudev_3.2.5.bb b/meta/recipes-core/udev/eudev_3.2.7.bb
similarity index 95%
rename from meta/recipes-core/udev/eudev_3.2.5.bb
rename to meta/recipes-core/udev/eudev_3.2.7.bb
index 592dd8f22a..1bea4ebd9f 100644
--- a/meta/recipes-core/udev/eudev_3.2.5.bb
+++ b/meta/recipes-core/udev/eudev_3.2.7.bb
@@ -20,8 +20,8 @@ SRC_URI = "http://dev.gentoo.org/~blueness/${BPN}/${BP}.tar.gz \
            file://udev.rules \
 "
 
-SRC_URI[md5sum] = "6ca08c0e14380f87df8e8aceac123671"
-SRC_URI[sha256sum] = "49c2d04105cad2526302627e040fa24b1916a9a3e059539bc8bb919b973890af"
+SRC_URI[md5sum] = "c75d99910c1791dd9430d26ab76059c0"
+SRC_URI[sha256sum] = "3004614bd253c1f98558460215027aaf60d7592c70be27fd384ec01db87bf062"
 
 inherit autotools update-rc.d qemu pkgconfig distro_features_check
 
-- 
2.17.1


