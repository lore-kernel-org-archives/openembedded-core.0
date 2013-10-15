Return-Path: <laurentiu.palcu@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 7A49D6D1B9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2013 12:46:18 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 15 Oct 2013 05:46:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,498,1378882800"; d="scan'208";a="417091216"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.41])
	by fmsmga002.fm.intel.com with ESMTP; 15 Oct 2013 05:46:19 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Oct 2013 15:46:05 +0300
Message-Id: <ff88c319a68c33bccd79e5289e99a0ba106a2399.1381841061.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1381841061.git.laurentiu.palcu@intel.com>
References: <cover.1381841061.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1381841061.git.laurentiu.palcu@intel.com>
References: <cover.1381841061.git.laurentiu.palcu@intel.com>
Subject: [PATCH 08/10] xinput: upgrade to 1.6.1
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
X-List-Received-Date: Tue, 15 Oct 2013 12:46:18 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../xorg-app/{xinput_1.6.0.bb => xinput_1.6.1.bb}  |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xinput_1.6.0.bb => xinput_1.6.1.bb} (64%)

diff --git a/meta/recipes-graphics/xorg-app/xinput_1.6.0.bb b/meta/recipes-graphics/xorg-app/xinput_1.6.1.bb
similarity index 64%
rename from meta/recipes-graphics/xorg-app/xinput_1.6.0.bb
rename to meta/recipes-graphics/xorg-app/xinput_1.6.1.bb
index 974b11e..5befcc8 100644
--- a/meta/recipes-graphics/xorg-app/xinput_1.6.0.bb
+++ b/meta/recipes-graphics/xorg-app/xinput_1.6.1.bb
@@ -8,8 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=881525f89f99cad39c9832bcb72e6fa5"
 
 DEPENDS += " libxi libxrandr libxinerama"
 
-PR = "${INC_PR}.0"
 
-SRC_URI[md5sum] = "d2459d35b4e0b41ded26a1d1159b7ac6"
-SRC_URI[sha256sum] = "4ab007d952c76665603bcb82ceb15fd3929d10faf0580fc4873ac16f5f63847e"
+SRC_URI[md5sum] = "305980ac78a6954e306a14d80a54c441"
+SRC_URI[sha256sum] = "b7632d0f228a8a6be93b09857ea413940fcf44091e60f4a0fe9f5fd82efd871f"
 
-- 
1.7.9.5


