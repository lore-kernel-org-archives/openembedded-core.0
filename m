Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RutvG-0004HG-TZ
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Feb 2012 23:54:03 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 07 Feb 2012 14:45:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="122206361"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.116])
	by fmsmga002.fm.intel.com with ESMTP; 07 Feb 2012 14:45:57 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Feb 2012 14:45:21 -0800
Message-Id: <26630a9f37b04e215eff9b8e63414b6b2066d6fa.1328654424.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1328654424.git.sgw@linux.intel.com>
References: <cover.1328654424.git.sgw@linux.intel.com>
In-Reply-To: <cover.1328654424.git.sgw@linux.intel.com>
References: <cover.1328654424.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 01/35] tune-mips32.inc: Add mips32-nf and mips32el-nf
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Feb 2012 22:54:03 -0000

From: Andreas Oberritter <obi@opendreambox.org>

tune-mips32.inc only lists mips32 CPUs with hardware FPU.
Extend it to list CPUs without hardware FPU, too.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/conf/machine/include/tune-mips32.inc |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/meta/conf/machine/include/tune-mips32.inc b/meta/conf/machine/include/tune-mips32.inc
index 4a5f0fa..45d865e 100644
--- a/meta/conf/machine/include/tune-mips32.inc
+++ b/meta/conf/machine/include/tune-mips32.inc
@@ -6,9 +6,13 @@ TUNEVALID[mips32] = "Enable mips32 specific processor optimizations"
 TUNE_CONFLICTS[mips32] = "n64 n32"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "mips32", "-march=mips32", "", d)}"
 
-AVAILTUNES += "mips32 mips32el"
+AVAILTUNES += "mips32 mips32el mips32-nf mips32el-nf"
 TUNE_FEATURES_tune-mips32 = "${TUNE_FEATURES_tune-mips} mips32"
 PACKAGE_EXTRA_ARCHS_tune-mips32 = "mips"
 TUNE_FEATURES_tune-mips32el = "${TUNE_FEATURES_tune-mipsel} mips32"
 PACKAGE_EXTRA_ARCHS_tune-mips32el = "mipsel"
+TUNE_FEATURES_tune-mips32-nf = "${TUNE_FEATURES_tune-mips-nf} mips32"
+PACKAGE_EXTRA_ARCHS_tune-mips32-nf = "mips-nf"
+TUNE_FEATURES_tune-mips32el-nf = "${TUNE_FEATURES_tune-mipsel-nf} mips32"
+PACKAGE_EXTRA_ARCHS_tune-mips32el-nf = "mipsel-nf"
 
-- 
1.7.6.5



