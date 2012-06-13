Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Seqe0-0005dx-Bz
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jun 2012 18:42:08 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 13 Jun 2012 09:31:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="152668159"
Received: from unknown (HELO shamshir.jf.intel.com) ([10.7.198.155])
	by orsmga001.jf.intel.com with ESMTP; 13 Jun 2012 09:31:30 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Jun 2012 09:31:27 -0700
Message-Id: <de0cb20b5c3712f2039bd7b54ea25fabedb8a62f.1339604980.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.10.2
In-Reply-To: <cover.1339604980.git.josh@linux.intel.com>
References: <cover.1339604980.git.josh@linux.intel.com>
In-Reply-To: <cover.1339604980.git.josh@linux.intel.com>
References: <cover.1339604980.git.josh@linux.intel.com>
Subject: [2011-1 PATCH 2/2] scripts/qemuimage-testlib: fix typos
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
X-List-Received-Date: Wed, 13 Jun 2012 16:42:08 -0000

From: Yi Zhao <yi.zhao@windriver.com>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 scripts/qemuimage-testlib |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/qemuimage-testlib b/scripts/qemuimage-testlib
index 6a1b900..f52ac7b 100644
--- a/scripts/qemuimage-testlib
+++ b/scripts/qemuimage-testlib
@@ -83,7 +83,7 @@ Test_SCP()
 	local src=$2
 	local des=$3
 	local tmpfile=`mktemp`
-	local timeout=60
+	local time_out=60
 	local ret=0
 
 	# We use expect to interactive with target by ssh
@@ -109,7 +109,7 @@ Test_SSH()
 	shift
 	local command=$@
 	local tmpfile=`mktemp`
-	local timeout=60
+	local time_out=60
 	local ret=0
 	local exp_cmd=`cat << EOF
 eval spawn ssh -o UserKnownHostsFile=$tmpfile root@$ip_addr "$command"
-- 
1.7.10.2



