Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1Se0hD-0000dI-O3
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Jun 2012 11:14:00 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 11 Jun 2012 02:03:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="164054767"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.123])
	by fmsmga001.fm.intel.com with ESMTP; 11 Jun 2012 02:03:25 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Jun 2012 17:02:31 +0800
Message-Id: <a2716ce068f4cfb98012f01479048054054c03d9.1339405061.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <ebe46107b8bcc9637bf93b125fa5f9b0a0a045bd.1339405061.git.lianhao.lu@intel.com>
References: <ebe46107b8bcc9637bf93b125fa5f9b0a0a045bd.1339405061.git.lianhao.lu@intel.com>
In-Reply-To: <cover.1339405061.git.lianhao.lu@intel.com>
References: <cover.1339405061.git.lianhao.lu@intel.com>
Subject: [PATCH 2/3] task-core-ssh-openssh: Added openssh-sftp-server.
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
X-List-Received-Date: Mon, 11 Jun 2012 09:14:01 -0000

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



