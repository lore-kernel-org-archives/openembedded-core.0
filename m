Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id BA41773D87
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Apr 2015 16:48:02 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 20 Apr 2015 09:47:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,610,1422950400"; d="scan'208";a="716384601"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com) ([10.252.5.75])
	by orsmga002.jf.intel.com with ESMTP; 20 Apr 2015 09:47:39 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Apr 2015 17:47:09 +0100
Message-Id: <12b0092cd90cc776c82a313eebda74e6a34d2e88.1429548323.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1429548323.git.paul.eggleton@linux.intel.com>
References: <cover.1429548323.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1429548323.git.paul.eggleton@linux.intel.com>
References: <cover.1429548323.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 5/5] toolchain-shar-extract.sh: mention how to set up the SDK environment
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
X-List-Received-Date: Mon, 20 Apr 2015 16:48:02 -0000

Tell the user how to set up the SDK environment each time they want to
use it.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/files/toolchain-shar-extract.sh | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/files/toolchain-shar-extract.sh b/meta/files/toolchain-shar-extract.sh
index 13b5951..8cb8783 100644
--- a/meta/files/toolchain-shar-extract.sh
+++ b/meta/files/toolchain-shar-extract.sh
@@ -151,6 +151,8 @@ if [ $savescripts = 0 ] ; then
 fi
 
 echo "SDK has been successfully set up and is ready to be used."
+echo "Each time you wish to use the SDK in a new shell session, you need to source the environment setup script e.g."
+echo " \$ . $target_sdk_dir/environment-setup-@REAL_MULTIMACH_TARGET_SYS@"
 
 exit 0
 
-- 
2.1.0


