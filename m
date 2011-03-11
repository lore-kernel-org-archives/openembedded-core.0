Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Pxrzq-0006uA-QM
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Mar 2011 03:22:31 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 10 Mar 2011 18:20:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.62,300,1297065600"; d="scan'208";a="400968885"
Received: from unknown (HELO localhost) ([10.255.17.57])
	by azsmga001.ch.intel.com with ESMTP; 10 Mar 2011 18:20:49 -0800
Message-Id: <3c8efb9d7578ecb9292376dcd510fd3e3ce34b15.1299809859.git.sgw@linux.intel.com>
In-Reply-To: <cover.1299809859.git.sgw@linux.intel.com>
References: <cover.1299809859.git.sgw@linux.intel.com>
Old-Date: Sat, 5 Mar 2011 19:30:53 -0800
Date: Thu, 10 Mar 2011 18:20:47 -0800
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH 09/12] poky-image.bbclass: add ssh-server as an IMAGE_FEATURES option
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
X-List-Received-Date: Fri, 11 Mar 2011 02:22:31 -0000

From: Scott Garman <scott.a.garman@intel.com>

Images which want to include an ssh server can then add
ssh-server to their IMAGE_FEATURES.

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 meta/classes/poky-image.bbclass |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/meta/classes/poky-image.bbclass b/meta/classes/poky-image.bbclass
index 225584b..896ef94 100644
--- a/meta/classes/poky-image.bbclass
+++ b/meta/classes/poky-image.bbclass
@@ -24,6 +24,7 @@ LIC_FILES_CHKSUM = "file://${POKYBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
 # - tools-profile       - profiling tools
 # - tools-testapps      - tools usable to make some device tests
 # - nfs-server          - NFS server (exports / over NFS to everybody)
+# - ssh-server          - SSH server (dropbear vs. openssh)
 # - dev-pkgs            - development packages
 # - dbg-pkgs            - debug packages
 #
@@ -79,9 +80,12 @@ POKY_BASE_INSTALL = '\
     \
     ${@base_contains("IMAGE_FEATURES", "nfs-server", "task-poky-nfs-server", "",d)} \
     ${@base_contains("IMAGE_FEATURES", ["nfs-server", "dbg-pkgs"], "task-poky-nfs-server-dbg", "",d)} \
-    \
     ${@base_contains("IMAGE_FEATURES", ["nfs-server", "dev-pkgs"], "task-poky-nfs-server-dev", "",d)} \
     \
+    ${@base_contains("IMAGE_FEATURES", "ssh-server", "task-poky-ssh-server", "",d)} \
+    ${@base_contains("IMAGE_FEATURES", ["ssh-server", "dbg-pkgs"], "task-poky-ssh-server-dbg", "",d)} \
+    ${@base_contains("IMAGE_FEATURES", ["ssh-server", "dev-pkgs"], "task-poky-ssh-server-dev", "",d)} \
+    \
     ${@base_contains("IMAGE_FEATURES", "package-management", "${ROOTFS_PKGMANAGE}", "${ROOTFS_PKGMANAGE_BOOTSTRAP}",d)} \
     ${@base_contains("IMAGE_FEATURES", "qt4-pkgs", "task-poky-qt-demos", "",d)} \
     ${POKY_EXTRA_INSTALL} \
-- 
1.7.1.1



