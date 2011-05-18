Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QMbzs-0000d0-DQ
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 10:20:49 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 18 May 2011 01:17:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,230,1304319600"; 
   d="scan'208";a="3834312"
Received: from unknown (HELO localhost) ([10.255.12.160])
	by fmsmga001.fm.intel.com with ESMTP; 18 May 2011 01:17:55 -0700
Message-Id: <88fb271e618a101c599c6b472afe1f0477ee6ba7.1305702436.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305702436.git.sgw@linux.intel.com>
References: <cover.1305702436.git.sgw@linux.intel.com>
Old-Date: Tue, 17 May 2011 09:29:25 +0800
Date: Wed, 18 May 2011  1:17:55 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Robert Yang <liezhi.yang@windriver.com>
Subject: [PATCH 07/15] Cleanup the whitespace in functions
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
X-List-Received-Date: Wed, 18 May 2011 08:20:49 -0000

From: Robert Yang <liezhi.yang@windriver.com>

Cleanup the whitespace in functions, replace the 4 whitespaces
indent with tab.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../initscripts/initscripts-1.0/functions          |   11 ++++++-----
 1 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/functions b/meta/recipes-core/initscripts/initscripts-1.0/functions
index 689fd32..ac99e11 100644
--- a/meta/recipes-core/initscripts/initscripts-1.0/functions
+++ b/meta/recipes-core/initscripts/initscripts-1.0/functions
@@ -4,11 +4,12 @@
 #               shell scripts in the /etc/init.d directory.
 #
 
-machine_id() {		# return the machine ID
-    awk 'BEGIN { FS=": " } /Hardware/ { gsub(" ", "_", $2); print tolower($2) } ' </proc/cpuinfo
+machine_id() { # return the machine ID
+	awk 'BEGIN { FS=": " } /Hardware/ \
+		{ gsub(" ", "_", $2); print tolower($2) } ' </proc/cpuinfo
 }
 
-killproc() {		# kill the named process(es)
-    pid=`/bin/pidof $1`
-    [ "$pid" != "" ] && kill $pid
+killproc() { # kill the named process(es)
+	pid=`/bin/pidof $1`
+	[ "$pid" != "" ] && kill $pid
 }
-- 
1.7.3.4



