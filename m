Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1SkhTe-00047e-RS
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jun 2012 22:07:39 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 29 Jun 2012 12:56:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="162369433"
Received: from unknown (HELO localhost) ([10.255.13.25])
	by azsmga001.ch.intel.com with ESMTP; 29 Jun 2012 12:56:09 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: Poky <poky@yoctoproject.org>, openembedded-core@lists.openembedded.org,
	Kishore Bodke <kishore.k.bodke@intel.com>
Date: Fri, 29 Jun 2012 12:54:34 -0700
Message-Id: <53ce203eec118e3d5b0faac4c8e71f69c9857146.1340998763.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.10.2
In-Reply-To: <4263ffefaa6f3b0069bc41c0f7578d36717edcfc.1340998763.git.dvhart@linux.intel.com>
References: <4263ffefaa6f3b0069bc41c0f7578d36717edcfc.1340998763.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1340998763.git.dvhart@linux.intel.com>
References: <cover.1340998763.git.dvhart@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 4/5] tasl-core-sdk: Add kernel-dev to task-core-sdk RDEPENDS
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
X-List-Received-Date: Fri, 29 Jun 2012 20:07:39 -0000

Add kernel-dev to task-core-sdk so it will be included with
core-image-sato-sdk and similar image recipes. This enables
building Linux kernel modules on the target.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
CC: Jessica Zhang <jessica.zhang@intel.com>
---
 meta/recipes-core/tasks/task-core-sdk.bb |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/tasks/task-core-sdk.bb b/meta/recipes-core/tasks/task-core-sdk.bb
index ec6cdcc..d65a53a 100644
--- a/meta/recipes-core/tasks/task-core-sdk.bb
+++ b/meta/recipes-core/tasks/task-core-sdk.bb
@@ -7,7 +7,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 DEPENDS = "task-core-console"
-PR = "r7"
+PR = "r8"
 
 ALLOW_EMPTY = "1"
 #PACKAGEFUNCS =+ 'generate_sdk_pkgs'
@@ -46,7 +46,8 @@ RDEPENDS_task-core-sdk = "\
     distcc \
     ldd \
     file \
-    tcl"
+    tcl \
+    kernel-dev"
 
 #python generate_sdk_pkgs () {
 #    poky_pkgs = read_pkgdata('task-core', d)['PACKAGES']
-- 
1.7.10.2



