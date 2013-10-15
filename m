Return-Path: <laurentiu.palcu@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 06E836D19C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2013 12:46:14 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 15 Oct 2013 05:46:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,498,1378882800"; d="scan'208";a="417091200"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.41])
	by fmsmga002.fm.intel.com with ESMTP; 15 Oct 2013 05:46:16 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Oct 2013 15:46:02 +0300
Message-Id: <bcc9931341fc187fc6fef6f4243731747e017a32.1381841061.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1381841061.git.laurentiu.palcu@intel.com>
References: <cover.1381841061.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1381841061.git.laurentiu.palcu@intel.com>
References: <cover.1381841061.git.laurentiu.palcu@intel.com>
Subject: [PATCH 05/10] libdrm: upgrade to 2.4.47
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
X-List-Received-Date: Tue, 15 Oct 2013 12:46:15 -0000

---
 .../drm/{libdrm_2.4.46.bb => libdrm_2.4.47.bb}     |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.46.bb => libdrm_2.4.47.bb} (46%)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.46.bb b/meta/recipes-graphics/drm/libdrm_2.4.47.bb
similarity index 46%
rename from meta/recipes-graphics/drm/libdrm_2.4.46.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.47.bb
index c9900b1..c21d905 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.46.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.47.bb
@@ -3,6 +3,6 @@ require libdrm.inc
 SRC_URI += "file://installtests.patch \
             file://GNU_SOURCE_definition.patch \
            "
-SRC_URI[md5sum] = "9cba217fd3daa10b1d052ec60d3aa7d5"
-SRC_URI[sha256sum] = "33cf320dad4e8060768714792e12643ddf6756a719d262ba7d60b39c2b2650f1"
+SRC_URI[md5sum] = "e043d6d59328887b9e434f4d27aacc09"
+SRC_URI[sha256sum] = "a98809a55ede4dac17416cac41f1f017114a97a7b6c2574f96a225ab1bd06074"
 
-- 
1.7.9.5


