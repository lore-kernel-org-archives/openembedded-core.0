Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1Sj1mt-0003l3-BM
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jun 2012 07:24:35 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 24 Jun 2012 22:13:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="184442518"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.116])
	by fmsmga002.fm.intel.com with ESMTP; 24 Jun 2012 22:13:41 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Jun 2012 13:15:31 +0800
Message-Id: <1d37342720de8357c5b7954b0264ed8f0cdba5af.1340600710.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <5bfc2cadad3f2b0e2b03c4562aba4efd0a604c95.1340600710.git.lianhao.lu@intel.com>
References: <5bfc2cadad3f2b0e2b03c4562aba4efd0a604c95.1340600710.git.lianhao.lu@intel.com>
In-Reply-To: <cover.1340600710.git.lianhao.lu@intel.com>
References: <cover.1340600710.git.lianhao.lu@intel.com>
Subject: [PATCH V3 3/3] task-core-tools-debug: Added openssh-sftp-server.
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
X-List-Received-Date: Mon, 25 Jun 2012 05:24:35 -0000

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



