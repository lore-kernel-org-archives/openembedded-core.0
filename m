Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T9c57-0005pV-C3
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Sep 2012 15:25:17 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 06 Sep 2012 06:12:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,380,1344236400"; d="scan'208";a="189616134"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.173])
	by orsmga001.jf.intel.com with ESMTP; 06 Sep 2012 06:12:51 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Sep 2012 14:12:48 +0100
Message-Id: <1346937168-8200-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] classes/core-image: improve comments listing IMAGE_FEATURES
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Sep 2012 13:25:17 -0000

Ensure this listing is complete. (Comment change only.)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/core-image.bbclass |    9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/classes/core-image.bbclass b/meta/classes/core-image.bbclass
index 2bfadb4..2e67018 100644
--- a/meta/classes/core-image.bbclass
+++ b/meta/classes/core-image.bbclass
@@ -15,14 +15,19 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
 # - x11                 - X server
 # - x11-base            - X server with minimal environment
 # - x11-sato            - OpenedHand Sato environment
-# - tools-sdk           - SDK
 # - tools-debug         - debugging tools
 # - tools-profile       - profiling tools
 # - tools-testapps      - tools usable to make some device tests
+# - tools-sdk           - SDK (C/C++ compiler, autotools, etc.)
 # - nfs-server          - NFS server
 # - ssh-server-dropbear - SSH server (dropbear)
 # - ssh-server-openssh  - SSH server (openssh)
-# - debug-tweaks        - makes an image suitable for development
+# - qt4-pkgs            - Qt4/X11 and demo applications
+# - package-management  - installs package management tools and preserves the package manager database
+# - debug-tweaks        - makes an image suitable for development, e.g. allowing passwordless root logins
+# - dev-pkgs            - development packages (headers, etc.) for all installed packages in the rootfs
+# - dbg-pkgs            - debug symbol packages for all installed packages in the rootfs
+# - doc-pkgs            - documentation packages for all installed packages in the rootfs
 #
 PACKAGE_GROUP_x11 = "packagegroup-core-x11"
 PACKAGE_GROUP_x11-base = "packagegroup-core-x11-base"
-- 
1.7.9.5



