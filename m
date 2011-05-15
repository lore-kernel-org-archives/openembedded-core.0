Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QLQEq-00069p-8e
	for openembedded-core@lists.openembedded.org;
	Sun, 15 May 2011 03:35:20 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 May 2011 18:32:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,368,1301900400"; d="scan'208";a="642792502"
Received: from unknown (HELO localhost) ([10.255.12.119])
	by orsmga002.jf.intel.com with ESMTP; 14 May 2011 18:32:31 -0700
Message-Id: <7ff23718bcda1a8b46a60373eb12463e0b7745d7.1305422996.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305422996.git.sgw@linux.intel.com>
References: <cover.1305422996.git.sgw@linux.intel.com>
Old-Date: Fri, 13 May 2011 10:27:50 -0700
Date: Sat, 14 May 2011 18:32:30 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Kang Kai <kai.kang@windriver.com>
Subject: [PATCH 14/15] task-core-nfs: fix a bitbake error
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
X-List-Received-Date: Sun, 15 May 2011 01:35:22 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

THis fixes following issue:

NOTE: Runtime target 'glibc-utilsglibc-utils' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['glibc-utilsglibc-utils']
NOTE: Runtime target 'task-core-nfs-server' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-core-nfs-server', 'glibc-utilsglibc-utils']

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/recipes-core/tasks/task-core-nfs.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/tasks/task-core-nfs.bb b/meta/recipes-core/tasks/task-core-nfs.bb
index d5d8291..087f4f0 100644
--- a/meta/recipes-core/tasks/task-core-nfs.bb
+++ b/meta/recipes-core/tasks/task-core-nfs.bb
@@ -20,7 +20,7 @@ RDEPENDS_task-core-nfs-server = "\
     nfs-utils"
 
 # rpcinfo can be useful but only with glibc images
-GLIBC_DEPENDENCIES = "glibc-utils"
+GLIBC_DEPENDENCIES = " glibc-utils"
 
 RRECOMMENDS_task-core-nfs-server_append_linux = "${GLIBC_DEPENDENCIES}"
 RRECOMMENDS_task-core-nfs-server_append_linux-gnueabi = "${GLIBC_DEPENDENCIES}"
-- 
1.7.1.1



