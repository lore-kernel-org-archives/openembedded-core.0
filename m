Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QhiKl-0006g7-De
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jul 2011 15:21:35 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 15 Jul 2011 06:17:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,535,1304319600"; d="scan'208";a="28373905"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.255.17.182])
	by fmsmga002.fm.intel.com with ESMTP; 15 Jul 2011 06:17:30 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Jul 2011 14:17:17 +0100
Message-Id: <5c32df11d0da47373425d9928bf3dad6fe6a21db.1310735644.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1310735644.git.paul.eggleton@linux.intel.com>
References: <cover.1310735644.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1310735644.git.paul.eggleton@linux.intel.com>
References: <cover.1310735644.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/3] kernel.bbclass: minor whitespace fixes
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
X-List-Received-Date: Fri, 15 Jul 2011 13:21:35 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/kernel.bbclass |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index d1f6480..2e36e86 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -19,7 +19,7 @@ python __anonymous () {
 
     image = bb.data.getVar('INITRAMFS_IMAGE', d, True)
     if image:
-    	bb.data.setVar('INITRAMFS_TASK', '${INITRAMFS_IMAGE}:do_rootfs', d)
+        bb.data.setVar('INITRAMFS_TASK', '${INITRAMFS_IMAGE}:do_rootfs', d)
 }
 
 inherit kernel-arch deploy
@@ -184,7 +184,7 @@ kernel_do_configure() {
 	if [ -f "${WORKDIR}/defconfig" ] && [ ! -f "${S}/.config" ]; then
 		cp "${WORKDIR}/defconfig" "${S}/.config"
 	fi
-        yes '' | oe_runmake oldconfig
+	yes '' | oe_runmake oldconfig
 
 	if [ ! -z "${INITRAMFS_IMAGE}" ]; then
 		for img in cpio.gz cpio.lzo cpio.lzma cpio.xz; do
-- 
1.7.4.1



