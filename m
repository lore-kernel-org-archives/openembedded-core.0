Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1SkpMv-0003Pt-Tf
	for openembedded-core@lists.openembedded.org;
	Sat, 30 Jun 2012 06:33:14 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 29 Jun 2012 21:22:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="159946910"
Received: from unknown (HELO localhost) ([10.255.13.25])
	by orsmga001.jf.intel.com with ESMTP; 29 Jun 2012 21:22:15 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: Poky <poky@yoctoproject.org>, Saul Wold <sgw@linux.intel.com>,
	openembedded-core@lists.openembedded.org,
	Kishore Bodke <kishore.k.bodke@intel.com>
Date: Fri, 29 Jun 2012 21:20:42 -0700
Message-Id: <d9a86274e0c39bc6e2a1757f061b62c554620ef2.1341000751.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.10.2
In-Reply-To: <a18f7d70be0fd3581d0a696ff9886f5572a37867.1341000751.git.dvhart@linux.intel.com>
References: <a18f7d70be0fd3581d0a696ff9886f5572a37867.1341000751.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1341000751.git.dvhart@linux.intel.com>
References: <cover.1341000751.git.dvhart@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 2/3] task-core-sdk: Add kernel-dev to task-core-sdk RDEPENDS
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
X-List-Received-Date: Sat, 30 Jun 2012 04:33:16 -0000

Add kernel-dev to task-core-sdk so it will be included with
core-image-sato-sdk and similar image recipes. This enables
building Linux kernel modules on the target.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>
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



