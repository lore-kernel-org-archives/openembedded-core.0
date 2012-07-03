Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1Sluzs-0002iw-J3
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 06:45:56 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 02 Jul 2012 21:34:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="118340229"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.116])
	by AZSMGA002.ch.intel.com with ESMTP; 02 Jul 2012 21:34:53 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jul 2012 12:36:59 +0800
Message-Id: <13fea45f7f3e11c83966ceee9fe237ea0ae212e4.1341279415.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1341279415.git.lianhao.lu@intel.com>
References: <cover.1341279415.git.lianhao.lu@intel.com>
Subject: [PATCH 1/2] task-core-tools-debug: Added openssh-sftp-server.
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
X-List-Received-Date: Tue, 03 Jul 2012 04:45:56 -0000

[YOCTO #2605].
Added openssh-sftp-server to the tools-debug IMAGE_FEATURE.

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 meta/recipes-core/tasks/task-core-tools-debug.bb |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-core/tasks/task-core-tools-debug.bb b/meta/recipes-core/tasks/task-core-tools-debug.bb
index 1dddbb8..b7eff21 100644
--- a/meta/recipes-core/tasks/task-core-tools-debug.bb
+++ b/meta/recipes-core/tasks/task-core-tools-debug.bb
@@ -13,6 +13,8 @@ PACKAGES = "\
     ${PN}-dev \
     "
 
+PR = "r1"
+
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 ALLOW_EMPTY = "1"
@@ -24,6 +26,7 @@ RDEPENDS_${PN} = "\
     gdb \
     gdbserver \
     tcf-agent \
+    openssh-sftp-server \
     rsync \
     strace \
     ${MTRACE} \
-- 
1.7.0.4



