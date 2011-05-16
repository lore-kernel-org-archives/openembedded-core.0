Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QM5cy-0003RK-8Q
	for openembedded-core@lists.openembedded.org;
	Mon, 16 May 2011 23:47:01 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 16 May 2011 14:44:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,221,1304319600"; d="scan'208";a="643470467"
Received: from unknown (HELO localhost) ([10.255.12.119])
	by orsmga002.jf.intel.com with ESMTP; 16 May 2011 14:44:00 -0700
Message-Id: <92ed336082db3134051e8a3a4393159e1e48a8b8.1305580484.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305580484.git.sgw@linux.intel.com>
References: <cover.1305580484.git.sgw@linux.intel.com>
Old-Date: Fri, 13 May 2011 10:27:50 -0700
Date: Mon, 16 May 2011 14:44:00 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 01/14] task-core-nfs: fix a bitbake error
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
X-List-Received-Date: Mon, 16 May 2011 21:47:01 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

THis fixes following issue:

NOTE: Runtime target 'glibc-utilsglibc-utils' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['glibc-utilsglibc-utils']
NOTE: Runtime target 'task-core-nfs-server' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-core-nfs-server', 'glibc-utilsglibc-utils']

[sgw: moved space to _append line]
Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/tasks/task-core-nfs.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/tasks/task-core-nfs.bb b/meta/recipes-core/tasks/task-core-nfs.bb
index d5d8291..20e042b 100644
--- a/meta/recipes-core/tasks/task-core-nfs.bb
+++ b/meta/recipes-core/tasks/task-core-nfs.bb
@@ -22,5 +22,5 @@ RDEPENDS_task-core-nfs-server = "\
 # rpcinfo can be useful but only with glibc images
 GLIBC_DEPENDENCIES = "glibc-utils"
 
-RRECOMMENDS_task-core-nfs-server_append_linux = "${GLIBC_DEPENDENCIES}"
-RRECOMMENDS_task-core-nfs-server_append_linux-gnueabi = "${GLIBC_DEPENDENCIES}"
+RRECOMMENDS_task-core-nfs-server_append_linux = " ${GLIBC_DEPENDENCIES}"
+RRECOMMENDS_task-core-nfs-server_append_linux-gnueabi = " ${GLIBC_DEPENDENCIES}"
-- 
1.7.1.1



