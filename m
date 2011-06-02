Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QS2xL-0006YL-Cp
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Jun 2011 10:08:39 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 02 Jun 2011 01:05:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,308,1304319600"; 
   d="scan'208";a="5775254"
Received: from unknown (HELO swold-MOBL.nomadix.com) ([10.255.12.203])
	by azsmga001.ch.intel.com with ESMTP; 02 Jun 2011 01:05:20 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Jun 2011 01:05:10 -0700
Message-Id: <340e5669782e76624be34d0d580fdd91c65938f3.1307001679.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1307001679.git.sgw@linux.intel.com>
References: <cover.1307001679.git.sgw@linux.intel.com>
In-Reply-To: <cover.1307001679.git.sgw@linux.intel.com>
References: <cover.1307001679.git.sgw@linux.intel.com>
Cc: Kang Kai <kai.kang@windriver.com>
Subject: [CONSOLIDATED PULL 11/12] task-core-lsb: add cups and ghostscript into image
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
X-List-Received-Date: Thu, 02 Jun 2011 08:08:39 -0000

From: Kang Kai <kai.kang@windriver.com>

[Yocto 1030]
Because it is fixed by Qing He, then add cups and ghostscipt into image

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 meta/recipes-extended/tasks/task-core-lsb.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/tasks/task-core-lsb.bb b/meta/recipes-extended/tasks/task-core-lsb.bb
index b6c5ae5..9fbacf9 100644
--- a/meta/recipes-extended/tasks/task-core-lsb.bb
+++ b/meta/recipes-extended/tasks/task-core-lsb.bb
@@ -133,8 +133,9 @@ RDEPENDS_task-core-lsb-command-add = "\
     chkconfig \
     xdg-utils \
     foomatic-filters \
+    cups \
+    ghostscript \
 "
-#    cups
 
 RDEPENDS_task-core-lsb-perl-add = "\
     perl-modules \
-- 
1.7.3.4



