Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QwFnZ-0008Ki-Ns
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Aug 2011 17:55:26 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 24 Aug 2011 08:50:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,275,1312182000"; d="scan'208";a="41953298"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.203])
	by azsmga001.ch.intel.com with ESMTP; 24 Aug 2011 08:50:34 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Aug 2011 08:50:28 -0700
Message-Id: <cd5b601bb2149cbc866dc32b46f4058d3284fb00.1314200868.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1314200868.git.sgw@linux.intel.com>
References: <cover.1314200868.git.sgw@linux.intel.com>
In-Reply-To: <cover.1314200868.git.sgw@linux.intel.com>
References: <cover.1314200868.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 3/6] mips32: add mips32el tuning
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
X-List-Received-Date: Wed, 24 Aug 2011 15:55:26 -0000

From: Phil Blundell <philb@gnu.org>

This makes building for little-endian mips32 slightly more convenient.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/conf/machine/include/tune-mips32.inc |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta/conf/machine/include/tune-mips32.inc b/meta/conf/machine/include/tune-mips32.inc
index 45792d8..4a5f0fa 100644
--- a/meta/conf/machine/include/tune-mips32.inc
+++ b/meta/conf/machine/include/tune-mips32.inc
@@ -6,6 +6,9 @@ TUNEVALID[mips32] = "Enable mips32 specific processor optimizations"
 TUNE_CONFLICTS[mips32] = "n64 n32"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "mips32", "-march=mips32", "", d)}"
 
-AVAILTUNES += "mips32"
+AVAILTUNES += "mips32 mips32el"
 TUNE_FEATURES_tune-mips32 = "${TUNE_FEATURES_tune-mips} mips32"
 PACKAGE_EXTRA_ARCHS_tune-mips32 = "mips"
+TUNE_FEATURES_tune-mips32el = "${TUNE_FEATURES_tune-mipsel} mips32"
+PACKAGE_EXTRA_ARCHS_tune-mips32el = "mipsel"
+
-- 
1.7.6



