Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SKGNa-0001IB-9f
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Apr 2012 23:56:06 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 17 Apr 2012 14:46:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="133663356"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.25])
	by orsmga002.jf.intel.com with ESMTP; 17 Apr 2012 14:46:36 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Apr 2012 14:46:34 -0700
Message-Id: <9a90470c28e09f1a8b4ae0c627d335b7f0907b6d.1334699033.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1334699033.git.sgw@linux.intel.com>
References: <cover.1334699033.git.sgw@linux.intel.com>
In-Reply-To: <cover.1334699033.git.sgw@linux.intel.com>
References: <cover.1334699033.git.sgw@linux.intel.com>
Subject: [PATCH 3/3] self-hosted-image: remove BB_NO_NETWORK and update Poky SRCREV
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
X-List-Received-Date: Tue, 17 Apr 2012 21:56:07 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/images/self-hosted-image.bb |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/images/self-hosted-image.bb b/meta/recipes-core/images/self-hosted-image.bb
index 46e7209..fbcdf4c 100644
--- a/meta/recipes-core/images/self-hosted-image.bb
+++ b/meta/recipes-core/images/self-hosted-image.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
-PR = "r11"
+PR = "r12"
 
 IMAGE_FEATURES += "x11-mini package-management"
 
@@ -19,7 +19,7 @@ IMAGE_FSTYPES = "vmdk"
 
 inherit core-image
 
-SRCREV = "8691a588267472eb5a32b978a0eb9ddfd0c91733"
+SRCREV = "20ff9db92165e6d16897671d2b1d370661962712"
 SRC_URI = "git://git.yoctoproject.org/poky;protocol=git"
 
 IMAGE_CMD_ext3_append () {
@@ -43,7 +43,6 @@ fakeroot do_populate_poky_src () {
 	rm -rf ${IMAGE_ROOTFS}/home/builder/poky/build/downloads/git2_*
 
 	echo "/usr/bin" > ${IMAGE_ROOTFS}/home/builder/poky/build/pseudodone
-	echo "BB_NO_NETWORK = \"1\"" > ${IMAGE_ROOTFS}/home/builder/poky/build/conf/auto.conf
 	echo "INHERIT += \"rm_work\"" >> ${IMAGE_ROOTFS}/home/builder/poky/build/conf/auto.conf
 	mkdir -p ${IMAGE_ROOTFS}/home/builder/pseudo
 	echo "export PSEUDO_PREFIX=/usr" >> ${IMAGE_ROOTFS}/home/builder/.bashrc
-- 
1.7.7.6



