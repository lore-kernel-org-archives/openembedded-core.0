Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QgoKu-0002At-EZ
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 03:34:00 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 12 Jul 2011 18:29:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,523,1304319600"; d="scan'208";a="26983690"
Received: from nbuild1.sc.intel.com ([172.25.110.36])
	by orsmga001.jf.intel.com with ESMTP; 12 Jul 2011 18:29:59 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jul 2011 12:02:40 -0700
Message-Id: <caf22bdc8f5c3c1505e3d1dca3478d2da514886d.1310497097.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <af851424130d145cef560c4bfaf2ba88ea4c3da6.1310497097.git.nitin.a.kamble@intel.com>
References: <af851424130d145cef560c4bfaf2ba88ea4c3da6.1310497097.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1310497097.git.nitin.a.kamble@intel.com>
References: <cover.1310497097.git.nitin.a.kamble@intel.com>
Subject: [PATCH 4/5] kernel.bbclass: fix the broken lines
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
X-List-Received-Date: Wed, 13 Jul 2011 01:34:00 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta/classes/kernel.bbclass |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index e441748..b71a650 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -188,8 +188,8 @@ kernel_do_configure() {
 
 	if [ ! -z "${INITRAMFS_IMAGE}" ]; then
 		for img in cpio.gz cpio.lzo cpio.lzma cpio.xz; do
-		if [ -e "${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE}-${MACHINE}.$img"
-			cp "${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE}-${MACHINE}.$i
+		if [ -e "${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE}-${MACHINE}.$img" ]; then
+			cp "${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE}-${MACHINE}.$img" initramfs.$img
 		fi
 		done
 	fi
-- 
1.7.5.4



