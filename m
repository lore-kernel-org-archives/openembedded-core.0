Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1SkSqm-0002IT-Os
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jun 2012 06:30:32 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 28 Jun 2012 21:19:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="186443172"
Received: from unknown (HELO localhost) ([10.255.12.71])
	by fmsmga002.fm.intel.com with ESMTP; 28 Jun 2012 21:19:38 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: Poky <poky@yoctoproject.org>,
	openembedded-core@lists.openembedded.org
Date: Thu, 28 Jun 2012 21:18:02 -0700
Message-Id: <7198e03309c8f72c2691bae7593d489e6b3074de.1340942930.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.10.2
In-Reply-To: <4263ffefaa6f3b0069bc41c0f7578d36717edcfc.1340942930.git.dvhart@linux.intel.com>
References: <4263ffefaa6f3b0069bc41c0f7578d36717edcfc.1340942930.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1340942930.git.dvhart@linux.intel.com>
References: <cover.1340942930.git.dvhart@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 4/4] tasl-core-sdk: Add kernel-headers to task-core-sdk RDEPENDS
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
X-List-Received-Date: Fri, 29 Jun 2012 04:30:33 -0000

Add kernel-headers to task-core-sdk so it will be included with
core-image-sato-sdk and similar image recipes.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
CC: Jessica Zhang <jessica.zhang@intel.com>
---
 meta/recipes-core/tasks/task-core-sdk.bb |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/tasks/task-core-sdk.bb b/meta/recipes-core/tasks/task-core-sdk.bb
index ec6cdcc..2853db7 100644
--- a/meta/recipes-core/tasks/task-core-sdk.bb
+++ b/meta/recipes-core/tasks/task-core-sdk.bb
@@ -46,7 +46,8 @@ RDEPENDS_task-core-sdk = "\
     distcc \
     ldd \
     file \
-    tcl"
+    tcl \
+    kernel-headers"
 
 #python generate_sdk_pkgs () {
 #    poky_pkgs = read_pkgdata('task-core', d)['PACKAGES']
-- 
1.7.10.2



