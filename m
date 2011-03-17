Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Q0A0M-0005ZL-B9
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Mar 2011 11:00:30 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 17 Mar 2011 02:58:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,198,1299484800"; d="scan'208";a="721126356"
Received: from unknown (HELO localhost) ([10.255.12.145])
	by orsmga001.jf.intel.com with ESMTP; 17 Mar 2011 02:58:44 -0700
Message-Id: <6daf1e090be87839b81c887d6eb7e69985fa3e8f.1300355683.git.sgw@linux.intel.com>
In-Reply-To: <cover.1300355683.git.sgw@linux.intel.com>
References: <cover.1300355683.git.sgw@linux.intel.com>
Old-Date: Thu, 17 Mar 2011 00:47:06 -0700
Date: Thu, 17 Mar 2011  2:58:44 -0700
To: openembedded-core@lists.openembedded.org,poky@yoctoproject.org
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 3/7] poky-image-basic: remove POKY_BASE_INSTALL
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
X-List-Received-Date: Thu, 17 Mar 2011 10:00:30 -0000

From: Saul Wold <sgw@linux.intel.com>

Removing POKY_BASE_INSTALL and replacing it with task-poky-boot,
effectively removes task-poky-extended which was pulling unwanted
recipes.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/images/poky-image-basic.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/images/poky-image-basic.bb b/meta/recipes-extended/images/poky-image-basic.bb
index 7e4596e..76d5dc2 100644
--- a/meta/recipes-extended/images/poky-image-basic.bb
+++ b/meta/recipes-extended/images/poky-image-basic.bb
@@ -1,8 +1,10 @@
 IMAGE_FEATURES += "apps-console-core ssh-server-openssh"
 
 IMAGE_INSTALL = "\
-    ${POKY_BASE_INSTALL} \
+    task-poky-boot \
     task-poky-basic \
     "
 
+#    ${POKY_BASE_INSTALL} 
+
 inherit poky-image
-- 
1.7.1.1



