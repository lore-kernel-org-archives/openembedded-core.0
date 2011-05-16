Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QM5jE-0003mb-3R
	for openembedded-core@lists.openembedded.org;
	Mon, 16 May 2011 23:53:28 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 16 May 2011 14:50:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,221,1304319600"; 
   d="scan'208";a="3002107"
Received: from nbuild2.sc.intel.com (HELO localhost) ([172.25.110.37])
	by fmsmga001.fm.intel.com with ESMTP; 16 May 2011 14:50:34 -0700
Message-Id: <f66be43ad9cccce4d8c910e10b39125a9551c5e2.1305582528.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1305582528.git.nitin.a.kamble@intel.com>
References: <cover.1305582528.git.nitin.a.kamble@intel.com>
Old-Date: Fri, 13 May 2011 10:24:20 -0700
Date: Mon, 16 May 2011 14:50:34 -0700
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Nitin A Kamble <nitin.a.kamble@intel.com>
Subject: [PATCH 1/1] task-core-nfs: fix a bitbake error
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
X-List-Received-Date: Mon, 16 May 2011 21:53:28 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

THis fixes following issue:

NOTE: Runtime target 'glibc-utilsglibc-utils' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['glibc-utilsglibc-utils']
NOTE: Runtime target 'task-core-nfs-server' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-core-nfs-server', 'glibc-utilsglibc-utils']

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
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
1.7.3.4



