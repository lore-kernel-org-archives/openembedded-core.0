Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id F262C74242
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 16:53:25 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 13 Oct 2015 09:53:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,678,1437462000"; d="scan'208";a="810083431"
Received: from porlows1-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.4.182])
	by fmsmga001.fm.intel.com with ESMTP; 13 Oct 2015 09:53:26 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Oct 2015 17:53:06 +0100
Message-Id: <efd9e41b88e466c3ee12c55818d0bfa91521eafa.1444755142.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1444755142.git.paul.eggleton@linux.intel.com>
References: <cover.1444755142.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1444755142.git.paul.eggleton@linux.intel.com>
References: <cover.1444755142.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 4/4] toolchain-shar-extract.sh: print full-length title underline
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
X-List-Received-Date: Tue, 13 Oct 2015 16:53:26 -0000

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


