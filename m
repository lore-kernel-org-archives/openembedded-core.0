Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rt6VQ-0002Yh-RC
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Feb 2012 00:55:57 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 02 Feb 2012 15:47:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="113485978"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.238])
	by fmsmga001.fm.intel.com with ESMTP; 02 Feb 2012 15:47:56 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Feb 2012 15:47:40 -0800
Message-Id: <956d582f95f98690add05dc3f34fd520dedd8df0.1328226197.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1328226197.git.sgw@linux.intel.com>
References: <cover.1328226197.git.sgw@linux.intel.com>
In-Reply-To: <cover.1328226197.git.sgw@linux.intel.com>
References: <cover.1328226197.git.sgw@linux.intel.com>
Subject: [PATCH 01/14] task-self-hosted: add disk partitioning tools
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
X-List-Received-Date: Thu, 02 Feb 2012 23:55:57 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/tasks/task-self-hosted.bb |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-core/tasks/task-self-hosted.bb b/meta/recipes-core/tasks/task-self-hosted.bb
index ebf8a01..253d500 100644
--- a/meta/recipes-core/tasks/task-self-hosted.bb
+++ b/meta/recipes-core/tasks/task-self-hosted.bb
@@ -28,6 +28,12 @@ RDEPENDS_task-self-hosted = "\
     "
 
 RDEPENDS_task-self-hosted-host-tools = "\
+    parted \
+    e2fsprogs \
+    e2fsprogs-mke2fs \
+    e2fsprogs-tune2fs \
+    e2fsprogs-e2fsck \
+    e2fsprogs-fsck \
     dhcp-client \
     e2fsprogs \
     e2fsprogs-e2fsck \
-- 
1.7.6.5



