Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1Q0cV1-00005q-Iz
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Mar 2011 17:26:04 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 18 Mar 2011 09:24:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,205,1299484800"; d="scan'208";a="404761678"
Received: from nbuild2.sc.intel.com (HELO localhost) ([172.25.110.37])
	by azsmga001.ch.intel.com with ESMTP; 18 Mar 2011 09:24:16 -0700
Message-Id: <af43d8b8c40bfcf3dd1dd6592242afab33aec37d.1300465259.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1300465259.git.nitin.a.kamble@intel.com>
References: <cover.1300465259.git.nitin.a.kamble@intel.com>
Old-Date: Wed, 16 Mar 2011 15:10:47 -0700
Date: Fri, 18 Mar 2011  9:24:15 -0700
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Nitin A Kamble <nitin.a.kamble@intel.com>
Subject: [PATCH 1/7] extended tasks: move binutils from basic to lsb
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
X-List-Received-Date: Fri, 18 Mar 2011 16:26:05 -0000

From: Saul Wold <sgw@linux.intel.com>

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/tasks/task-poky-basic.bb |    2 --
 meta/recipes-extended/tasks/task-poky-lsb.bb   |    3 +--
 2 files changed, 1 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-extended/tasks/task-poky-basic.bb b/meta/recipes-extended/tasks/task-poky-basic.bb
index d7beafe..93aeeef 100644
--- a/meta/recipes-extended/tasks/task-poky-basic.bb
+++ b/meta/recipes-extended/tasks/task-poky-basic.bb
@@ -100,7 +100,6 @@ RDEPENDS_task-poky-basic-extended = "\
     module-init-tools \
     openssl \
     "
-#    openssh
 
 RDEPENDS_task-poky-dev-utils = "\
     byacc \
@@ -108,7 +107,6 @@ RDEPENDS_task-poky-dev-utils = "\
     m4 \
     make \
     patch \
-    binutils \
     "
 
 RDEPENDS_task-poky-initscripts = "\
diff --git a/meta/recipes-extended/tasks/task-poky-lsb.bb b/meta/recipes-extended/tasks/task-poky-lsb.bb
index 42fd8e0..16cb9a6 100644
--- a/meta/recipes-extended/tasks/task-poky-lsb.bb
+++ b/meta/recipes-extended/tasks/task-poky-lsb.bb
@@ -52,9 +52,8 @@ RDEPENDS_task-poky-lsb = "\
     task-poky-lsb-command-add \
     "
 
-#
-# GPLv2 Should List
 RDEPENDS_task-poky-sys-extended = "\
+    binutils \
     chkconfig \
     curl \
     dhcp-client \
-- 
1.7.3.4



