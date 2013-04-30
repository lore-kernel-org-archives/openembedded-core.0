Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jessica.zhang@intel.com>) id 1UXFSv-00029H-H3
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Apr 2013 20:39:51 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 30 Apr 2013 11:18:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,582,1363158000"; d="scan'208";a="329078859"
Received: from jzhang-desktop.jf.intel.com (HELO localhost) ([10.7.201.69])
	by orsmga002.jf.intel.com with ESMTP; 30 Apr 2013 11:20:52 -0700
From: Jessica Zhang <jessica.zhang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Apr 2013 11:32:03 -0700
Message-Id: <edfa2b0331248facb9b0db86e3b3229e32ddbf20.1367346500.git.jessica.zhang@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1367346500.git.jessica.zhang@intel.com>
References: <cover.1367346500.git.jessica.zhang@intel.com>
Subject: [PATCH 1/1] Make toolchain output name using SDK_VERSION instead of DISTRO_VERSION to be consistent [yocto #2342]
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
X-List-Received-Date: Tue, 30 Apr 2013 18:39:51 -0000

Signed-off-by: Jessica Zhang <jessica.zhang@intel.com>
---
 meta/classes/populate_sdk_base.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 49e4469..e5bc0b4 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -14,7 +14,7 @@ TOOLCHAIN_HOST_TASK ?= "nativesdk-packagegroup-sdk-host packagegroup-cross-canad
 TOOLCHAIN_HOST_TASK_ATTEMPTONLY ?= ""
 TOOLCHAIN_TARGET_TASK ?= "packagegroup-core-standalone-sdk-target packagegroup-core-standalone-sdk-target-dbg"
 TOOLCHAIN_TARGET_TASK_ATTEMPTONLY ?= ""
-TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-toolchain-${DISTRO_VERSION}"
+TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-toolchain-${SDK_VERSION}"
 
 SDK_RDEPENDS = "${TOOLCHAIN_TARGET_TASK} ${TOOLCHAIN_HOST_TASK}"
 SDK_DEPENDS = "virtual/fakeroot-native sed-native"
-- 
1.7.9.5



