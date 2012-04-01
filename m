Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1SENVg-0008GO-QS
	for openembedded-core@lists.openembedded.org;
	Sun, 01 Apr 2012 18:20:08 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 01 Apr 2012 09:09:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="136280136"
Received: from dcui-desktop.sh.intel.com ([10.239.36.12])
	by fmsmga001.fm.intel.com with ESMTP; 01 Apr 2012 09:09:56 -0700
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Apr 2012 00:10:13 +0800
Message-Id: <8609a33558f477f1684643b300ef6578616fdcbe.1333295123.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1333295122.git.dexuan.cui@intel.com>
References: <cover.1333295122.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1333295122.git.dexuan.cui@intel.com>
References: <cover.1333295122.git.dexuan.cui@intel.com>
Subject: [PATCH 5/5] self-hosted-image: fix indentation: 8 spaces --> Tab
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
X-List-Received-Date: Sun, 01 Apr 2012 16:20:09 -0000

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 meta/recipes-core/images/self-hosted-image.bb |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/images/self-hosted-image.bb b/meta/recipes-core/images/self-hosted-image.bb
index 91942ee..39f0fc4 100644
--- a/meta/recipes-core/images/self-hosted-image.bb
+++ b/meta/recipes-core/images/self-hosted-image.bb
@@ -46,12 +46,12 @@ fakeroot do_populate_poky_src () {
 	echo "/usr/bin" > ${IMAGE_ROOTFS}/home/builder/poky/build/pseudodone
 	echo "BB_NO_NETWORK = \"1\"" > ${IMAGE_ROOTFS}/home/builder/poky/build/conf/auto.conf
 	echo "INHERIT += \"rm_work\"" >> ${IMAGE_ROOTFS}/home/builder/poky/build/conf/auto.conf
-        mkdir -p ${IMAGE_ROOTFS}/home/builder/pseudo
-        echo "export PSEUDO_PREFIX=/usr" >> ${IMAGE_ROOTFS}/home/builder/.bashrc
-        echo "export PSEUDO_LOCALSTATEDIR=/home/builder/pseudo" >> ${IMAGE_ROOTFS}/home/builder/.bashrc
-        echo "export PSEUDO_LIBDIR=/usr/lib/pseudo/lib64" >> ${IMAGE_ROOTFS}/home/builder/.bashrc
+	mkdir -p ${IMAGE_ROOTFS}/home/builder/pseudo
+	echo "export PSEUDO_PREFIX=/usr" >> ${IMAGE_ROOTFS}/home/builder/.bashrc
+	echo "export PSEUDO_LOCALSTATEDIR=/home/builder/pseudo" >> ${IMAGE_ROOTFS}/home/builder/.bashrc
+	echo "export PSEUDO_LIBDIR=/usr/lib/pseudo/lib64" >> ${IMAGE_ROOTFS}/home/builder/.bashrc
 
-        chown builder.builder ${IMAGE_ROOTFS}/home/builder/pseudo
+	chown builder.builder ${IMAGE_ROOTFS}/home/builder/pseudo
 
 	chown -R builder.builder  ${IMAGE_ROOTFS}/home/builder/poky
 }
-- 
1.7.6



