Return-Path: <anujx.mittal@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id C2CB277029
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Mar 2016 09:55:44 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 02 Mar 2016 01:55:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,528,1449561600"; d="scan'208";a="662401931"
Received: from amitta2x-ilbpg1.png.intel.com ([10.88.227.34])
	by FMSMGA003.fm.intel.com with ESMTP; 02 Mar 2016 01:55:44 -0800
From: Anuj Mittal <anujx.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Mar 2016 17:55:41 +0800
Message-Id: <1456912541-16297-2-git-send-email-anujx.mittal@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1456912541-16297-1-git-send-email-anujx.mittal@intel.com>
References: <1456912541-16297-1-git-send-email-anujx.mittal@intel.com>
Cc: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
Subject: [meta-intel][master][jethro][PATCH 1/1] tune-corei7.inc: Fix PACKAGE_EXTRA_ARCHS for corei7-32
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
X-List-Received-Date: Wed, 02 Mar 2016 09:55:44 -0000

From: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>

Change the name to core2-32 from core2.

There's no AVAILTUNES with the name core2. Make sure that we specify
the correct TUNE name so PACKAGE_EXTRA_ARCHS is expanded correctly.

[ YOCTO #9197 ]

Signed-off-by: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
Signed-off-by: Anuj Mittal <anujx.mittal@intel.com>
---
 meta/conf/machine/include/tune-corei7.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/tune-corei7.inc b/meta/conf/machine/include/tune-corei7.inc
index 153a21b..6edfb68 100644
--- a/meta/conf/machine/include/tune-corei7.inc
+++ b/meta/conf/machine/include/tune-corei7.inc
@@ -21,7 +21,7 @@ AVAILTUNES += "corei7-32"
 TUNE_FEATURES_tune-corei7-32 = "${TUNE_FEATURES_tune-x86} corei7"
 BASE_LIB_tune-corei7-32 = "lib"
 TUNE_PKGARCH_tune-corei7-32 = "corei7-32"
-PACKAGE_EXTRA_ARCHS_tune-corei7-32 = "${PACKAGE_EXTRA_ARCHS_tune-core2} corei7-32"
+PACKAGE_EXTRA_ARCHS_tune-corei7-32 = "${PACKAGE_EXTRA_ARCHS_tune-core2-32} corei7-32"
 QEMU_EXTRAOPTIONS_corei7-32 = " -cpu Nehalem,check=false"
 
 AVAILTUNES += "corei7-64"
-- 
1.9.1


