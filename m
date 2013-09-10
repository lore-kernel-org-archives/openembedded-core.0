Return-Path: <laurentiu.palcu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 91D60616F5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 15:10:55 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 10 Sep 2013 08:07:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,878,1371106800"; d="scan'208";a="401243767"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by orsmga002.jf.intel.com with ESMTP; 10 Sep 2013 08:10:56 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Sep 2013 18:10:49 +0300
Message-Id: <23d2fd59ec051b055506da2223a5ea77b1974851.1378824959.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1378824959.git.laurentiu.palcu@intel.com>
References: <cover.1378824959.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1378824959.git.laurentiu.palcu@intel.com>
References: <cover.1378824959.git.laurentiu.palcu@intel.com>
Subject: [PATCH 4/5] meta-toolchain-qt: include the proper cross-canadian package
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
X-List-Received-Date: Tue, 10 Sep 2013 15:10:55 -0000

packagegroup-cross-canadian package name was changed to contain MACHINE.
Make the necessary changes here too.

[YOCTO #4783]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/recipes-qt/meta/meta-toolchain-qt.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-qt/meta/meta-toolchain-qt.inc b/meta/recipes-qt/meta/meta-toolchain-qt.inc
index abf12fb..14591a8 100644
--- a/meta/recipes-qt/meta/meta-toolchain-qt.inc
+++ b/meta/recipes-qt/meta/meta-toolchain-qt.inc
@@ -1,4 +1,4 @@
-TOOLCHAIN_HOST_TASK = "nativesdk-packagegroup-${QTNAME}-toolchain-host packagegroup-cross-canadian-${TRANSLATED_TARGET_ARCH}"
+TOOLCHAIN_HOST_TASK = "nativesdk-packagegroup-${QTNAME}-toolchain-host packagegroup-cross-canadian-${MACHINE}"
 TOOLCHAIN_TARGET_TASK = "packagegroup-${QTNAME}-toolchain-target"
 TOOLCHAIN_OUTPUTNAME = "${SDK_NAME}-toolchain-${QTNAME}-${DISTRO_VERSION}"
 
-- 
1.7.9.5


