Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1Tum0S-0001KR-Gt
	for openembedded-core@lists.openembedded.org;
	Mon, 14 Jan 2013 16:31:26 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 14 Jan 2013 07:16:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,468,1355126400"; d="scan'208";a="246401878"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by orsmga001.jf.intel.com with ESMTP; 14 Jan 2013 07:16:03 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Jan 2013 17:16:40 +0200
Message-Id: <7cfc404704fbb403f376496c280fed9ef19de4d5.1358175955.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <cover.1358175955.git.constantinx.musca@intel.com>
References: <cover.1358175955.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1358175955.git.constantinx.musca@intel.com>
References: <cover.1358175955.git.constantinx.musca@intel.com>
Subject: [PATCH v2 5/6] tune-mips32: add BASE_LIB to mips32 tunes
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
X-List-Received-Date: Mon, 14 Jan 2013 15:31:34 -0000

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 meta/conf/machine/include/tune-mips32.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/conf/machine/include/tune-mips32.inc b/meta/conf/machine/include/tune-mips32.inc
index 03cd411..ffbaecf 100644
--- a/meta/conf/machine/include/tune-mips32.inc
+++ b/meta/conf/machine/include/tune-mips32.inc
@@ -9,17 +9,21 @@ TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "mips32", "-march=mips32",
 AVAILTUNES += "mips32 mips32el mips32-nf mips32el-nf"
 
 TUNE_FEATURES_tune-mips32 = "${TUNE_FEATURES_tune-mips} mips32"
+BASE_LIB_tune-mips32 = "lib"
 MIPSPKGSFX_VARIANT_tune-mips32 = "mips32"
 PACKAGE_EXTRA_ARCHS_tune-mips32 = "mips mips32"
 
 TUNE_FEATURES_tune-mips32el = "${TUNE_FEATURES_tune-mipsel} mips32"
+BASE_LIB_tune-mips32el = "lib"
 MIPSPKGSFX_VARIANT_tune-mips32el = "mips32el"
 PACKAGE_EXTRA_ARCHS_tune-mips32el = "mipsel mips32el"
 
 TUNE_FEATURES_tune-mips32-nf = "${TUNE_FEATURES_tune-mips-nf} mips32"
+BASE_LIB_tune-mips32-nf = "lib"
 MIPSPKGSFX_VARIANT_tune-mips32-nf = "mips32"
 PACKAGE_EXTRA_ARCHS_tune-mips32-nf = "mips-nf mips32-nf"
 
 TUNE_FEATURES_tune-mips32el-nf = "${TUNE_FEATURES_tune-mipsel-nf} mips32"
+BASE_LIB_tune-mips32el-nf = "lib"
 MIPSPKGSFX_VARIANT_tune-mips32el-nf = "mips32el"
 PACKAGE_EXTRA_ARCHS_tune-mips32el-nf = "mipsel-nf mips32el-nf"
-- 
1.7.11.7



