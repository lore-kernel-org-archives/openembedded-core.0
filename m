Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1SeOE2-00064a-7r
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jun 2012 12:21:26 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 12 Jun 2012 03:10:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="111100491"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.123])
	by AZSMGA002.ch.intel.com with ESMTP; 12 Jun 2012 03:10:50 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jun 2012 18:10:05 +0800
Message-Id: <40eb390623c511dadf467d19e146a4dc92b70856.1339495723.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1339495723.git.lianhao.lu@intel.com>
References: <cover.1339495723.git.lianhao.lu@intel.com>
Subject: [PATCH V2 1/3] task-core-ssh-openssh: Added openssh-sftp-server.
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
X-List-Received-Date: Tue, 12 Jun 2012 10:21:26 -0000

Added openssh-sftp-server as the default.

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 meta/recipes-core/tasks/task-core-ssh-openssh.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/tasks/task-core-ssh-openssh.bb b/meta/recipes-core/tasks/task-core-ssh-openssh.bb
index 794399a..2e22d38 100644
--- a/meta/recipes-core/tasks/task-core-ssh-openssh.bb
+++ b/meta/recipes-core/tasks/task-core-ssh-openssh.bb
@@ -12,6 +12,6 @@ PACKAGES = "\
 
 ALLOW_EMPTY = "1"
 
-RDEPENDS_task-core-ssh-openssh = "openssh"
+RDEPENDS_task-core-ssh-openssh = "openssh openssh-sftp-server"
 RDEPENDS_task-core-ssh-openssh-dbg = "openssh-dbg"
 RDEPENDS_task-core-ssh-openssh-dev = "openssh-dev"
-- 
1.7.0.4



