Return-Path: <laurentiu.palcu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id B43396BB4A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 15:10:54 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 10 Sep 2013 08:07:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,878,1371106800"; d="scan'208";a="401243758"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by orsmga002.jf.intel.com with ESMTP; 10 Sep 2013 08:10:55 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Sep 2013 18:10:48 +0300
Message-Id: <8e2b71e8ffabe73ccfceb04c734f0fa8c54a94fe.1378824959.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1378824959.git.laurentiu.palcu@intel.com>
References: <cover.1378824959.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1378824959.git.laurentiu.palcu@intel.com>
References: <cover.1378824959.git.laurentiu.palcu@intel.com>
Subject: [PATCH 3/5] populate_sdk_base.bbclass: select the proper cross-canadian package
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
X-List-Received-Date: Tue, 10 Sep 2013 15:10:54 -0000

Since packagegroup-cross-canadian package name has MACHINE in it, make
the necessary changes here.

[YOCTO #4783]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/classes/populate_sdk_base.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 998280e..bddcf62 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -10,7 +10,7 @@ SDK_DEPLOY = "${TMPDIR}/deploy/sdk"
 
 SDKTARGETSYSROOT = "${SDKPATH}/sysroots/${REAL_MULTIMACH_TARGET_SYS}"
 
-TOOLCHAIN_HOST_TASK ?= "nativesdk-packagegroup-sdk-host packagegroup-cross-canadian-${@' packagegroup-cross-canadian-'.join(all_multilib_tune_values(d, 'TRANSLATED_TARGET_ARCH').split())}"
+TOOLCHAIN_HOST_TASK ?= "nativesdk-packagegroup-sdk-host packagegroup-cross-canadian-${MACHINE}"
 TOOLCHAIN_HOST_TASK_ATTEMPTONLY ?= ""
 TOOLCHAIN_TARGET_TASK ?= "packagegroup-core-standalone-sdk-target packagegroup-core-standalone-sdk-target-dbg"
 TOOLCHAIN_TARGET_TASK_ATTEMPTONLY ?= ""
-- 
1.7.9.5


