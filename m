Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rv3jj-0007E0-GT
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Feb 2012 10:22:47 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 08 Feb 2012 01:14:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="115371623"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.241])
	by fmsmga001.fm.intel.com with ESMTP; 08 Feb 2012 01:14:43 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Feb 2012 01:14:43 -0800
Message-Id: <1328692483-4398-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
Subject: [PATCH] task-core-tools-profile: fix valgrind for arm and systemtap for mips
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
X-List-Received-Date: Wed, 08 Feb 2012 09:22:48 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/tasks/task-core-tools-profile.bb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-core/tasks/task-core-tools-profile.bb b/meta/recipes-core/tasks/task-core-tools-profile.bb
index 254d3f5..30776ef 100644
--- a/meta/recipes-core/tasks/task-core-tools-profile.bb
+++ b/meta/recipes-core/tasks/task-core-tools-profile.bb
@@ -37,6 +37,7 @@ PROFILETOOLS = "\
 # hence we exclude it from uclibc based builds
 SYSTEMTAP = "systemtap"
 SYSTEMTAP_libc-uclibc = ""
+SYSTEMTAP_mips = ""
 
 # lttng-ust uses sched_getcpu() which is not there on uclibc
 # for some of the architectures it can be patched to call the
@@ -53,6 +54,7 @@ LTTNGUST_mips = ""
 VALGRIND = "valgrind"
 VALGRIND_libc-uclibc = ""
 VALGRIND_mips = ""
+VALGRIND_arm = ""
 
 #    exmap-console
 #    exmap-server
-- 
1.7.6.5



