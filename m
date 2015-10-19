Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 8CD797705F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 16:33:24 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 19 Oct 2015 09:33:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,702,1437462000"; d="scan'208";a="830461030"
Received: from ggwalsh-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.6.253])
	by fmsmga002.fm.intel.com with ESMTP; 19 Oct 2015 09:33:24 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Oct 2015 17:33:12 +0100
Message-Id: <94a8fce7ef9ee27d5e9433b6acf10972554ea2ab.1445272352.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1445272352.git.paul.eggleton@linux.intel.com>
References: <cover.1445272352.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1445272352.git.paul.eggleton@linux.intel.com>
References: <cover.1445272352.git.paul.eggleton@linux.intel.com>
Subject: [PATCH v3 5/5] toolchain-shar-extract.sh: print full-length title underline
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
X-List-Received-Date: Mon, 19 Oct 2015 16:33:25 -0000

Print a line that's the full length of the title that it's underneath.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/files/toolchain-shar-extract.sh | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/files/toolchain-shar-extract.sh b/meta/files/toolchain-shar-extract.sh
index 2ffc2d1..568b580 100644
--- a/meta/files/toolchain-shar-extract.sh
+++ b/meta/files/toolchain-shar-extract.sh
@@ -68,8 +68,9 @@ while getopts ":yd:nDRS" OPT; do
 	esac
 done
 
-echo "@SDK_TITLE@ installer version @SDK_VERSION@"
-echo "==========================================================="
+titlestr="@SDK_TITLE@ installer version @SDK_VERSION@"
+printf "%s\n" "$titlestr"
+printf "%${#titlestr}s\n" | tr " " "="
 
 if [ $verbose = 1 ] ; then
 	set -x
-- 
2.1.0


