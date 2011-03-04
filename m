Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1PvawA-0006K0-Rx
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Mar 2011 20:45:19 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 04 Mar 2011 11:43:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.62,265,1297065600"; d="scan'208";a="716309897"
Received: from unknown (HELO localhost) ([10.255.12.102])
	by orsmga001.jf.intel.com with ESMTP; 04 Mar 2011 11:42:13 -0800
Message-Id: <266562710b86a2373d8fffa5153557e4660f9596.1299267630.git.sgw@linux.intel.com>
In-Reply-To: <cover.1299267630.git.sgw@linux.intel.com>
References: <cover.1299267630.git.sgw@linux.intel.com>
Old-Date: Fri, 4 Mar 2011 10:00:40 +0800
Date: Fri, 04 Mar 2011 11:42:13 -0800
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 06/13] task-poky-lsb: add python-misc
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
X-List-Received-Date: Fri, 04 Mar 2011 19:45:19 -0000

From: Jingdong Lu <jingdong.lu@windriver.com>

python-misc also needed by python-runtime test of LSB.

Signed-off-by: Jingdong Lu <jingdong.lu@windriver.com>
---
 meta/recipes-extended/tasks/task-poky-lsb.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-extended/tasks/task-poky-lsb.bb b/meta/recipes-extended/tasks/task-poky-lsb.bb
index a78e5ae..ee3ca2c 100644
--- a/meta/recipes-extended/tasks/task-poky-lsb.bb
+++ b/meta/recipes-extended/tasks/task-poky-lsb.bb
@@ -141,6 +141,7 @@ RDEPENDS_task-poky-lsb-perl-add = "\
 
 RDEPENDS_task-poky-lsb-python-add = "\
     python-modules \
+    python-misc \
 "
 
 RDEPENDS_task-poky-lsb-graphic-add = "\
-- 
1.7.1.1



