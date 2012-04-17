Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SKGNZ-0001IB-IL
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Apr 2012 23:56:05 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 17 Apr 2012 14:46:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="133663354"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.25])
	by orsmga002.jf.intel.com with ESMTP; 17 Apr 2012 14:46:36 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Apr 2012 14:46:33 -0700
Message-Id: <e460168fadf49a885a9451239c3d0b50cf6f468d.1334699033.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1334699033.git.sgw@linux.intel.com>
References: <cover.1334699033.git.sgw@linux.intel.com>
In-Reply-To: <cover.1334699033.git.sgw@linux.intel.com>
References: <cover.1334699033.git.sgw@linux.intel.com>
Subject: [PATCH 2/3] task-self-hosted: Add LSB for distro info
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
X-List-Received-Date: Tue, 17 Apr 2012 21:56:05 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/tasks/task-self-hosted.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-core/tasks/task-self-hosted.bb b/meta/recipes-core/tasks/task-self-hosted.bb
index 5588cd3..5d4e153 100644
--- a/meta/recipes-core/tasks/task-self-hosted.bb
+++ b/meta/recipes-core/tasks/task-self-hosted.bb
@@ -44,6 +44,7 @@ RDEPENDS_task-self-hosted-host-tools = "\
     kernel-module-iptable-nat \
     kernel-module-iptable-mangle \
     kernel-module-iptable-filter \
+    lsb \
     mc \
     parted \
     pseudo \
-- 
1.7.7.6



