Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QHPJ8-0001ca-EH
	for openembedded-core@lists.openembedded.org;
	Wed, 04 May 2011 01:47:10 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 03 May 2011 16:44:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,312,1301900400"; d="scan'208";a="917581929"
Received: from unknown (HELO localhost) ([10.255.13.11])
	by fmsmga001.fm.intel.com with ESMTP; 03 May 2011 16:44:33 -0700
Message-Id: <2995f590d13e7db946922ac96dd0664d2b60d4a9.1304465724.git.sgw@linux.intel.com>
In-Reply-To: <cover.1304465724.git.sgw@linux.intel.com>
References: <cover.1304465724.git.sgw@linux.intel.com>
Old-Date: Thu, 28 Apr 2011 21:52:50 -0700
Date: Tue, 03 May 2011 16:44:33 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Xiaofeng Yan <xiaofeng.yan@windriver.com>, Ilya Yanok <yanok@emcraft.com>,
	Darren Hart <dvhart@linux.intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Kang Kai <kai.kang@windriver.com>, Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 09/33] logging: delete the oe(note|warn|fatal|debug) functions
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
X-List-Received-Date: Tue, 03 May 2011 23:47:10 -0000

From: Darren Hart <dvhart@linux.intel.com>

The new logging.bbclass replaces the oe* logging functions with bb* equivalents.
There are no longer any users of the oe* API within oe-core. Remove the oe*
functions.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 meta/classes/base.bbclass |   27 +--------------------------
 1 files changed, 1 insertions(+), 26 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 798593e..ca53940 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -37,32 +37,7 @@ python sys_path_eh () {
 addhandler sys_path_eh
 
 die() {
-	oefatal "$*"
-}
-
-oenote() {
-	echo "NOTE:" "$*"
-}
-
-oewarn() {
-	echo "WARNING:" "$*"
-}
-
-oefatal() {
-	echo "FATAL:" "$*"
-	exit 1
-}
-
-oedebug() {
-	if [ $# -lt 2]; then
-		echo "Usage: oedebug level \"message\""
-		exit 1
-	fi
-
-	if [ ${OEDEBUG:-0} -ge $1 ]; then
-		shift
-		echo "DEBUG:" $*
-	fi
+	bbfatal "$*"
 }
 
 oe_runmake() {
-- 
1.7.4.1



