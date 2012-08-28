Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T6QT6-00042k-Tw
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Aug 2012 20:24:53 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 28 Aug 2012 11:12:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,328,1344236400"; d="scan'208";a="214912886"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.20])
	by fmsmga002.fm.intel.com with ESMTP; 28 Aug 2012 11:12:38 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Aug 2012 11:12:38 -0700
Message-Id: <1346177558-23259-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH] task-self-hosted: remove e2fsprogs-fsck from task list
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 28 Aug 2012 18:24:53 -0000

Matches changes made to the e2fsprogs PACKAGE list

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/tasks/task-self-hosted.bb |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/tasks/task-self-hosted.bb b/meta/recipes-core/tasks/task-self-hosted.bb
index 61d08ed..9111a2b 100644
--- a/meta/recipes-core/tasks/task-self-hosted.bb
+++ b/meta/recipes-core/tasks/task-self-hosted.bb
@@ -33,7 +33,6 @@ RDEPENDS_task-self-hosted-host-tools = "\
     dhcp-client \
     e2fsprogs \
     e2fsprogs-e2fsck \
-    e2fsprogs-fsck \
     e2fsprogs-mke2fs \
     e2fsprogs-tune2fs \
     genext2fs \
-- 
1.7.7.6



