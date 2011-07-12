Received: from smtp206.alice.it ([82.57.200.102])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1QglTK-0007X5-F4
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 00:30:30 +0200
Received: from mizar.localdomain (87.14.251.219) by smtp206.alice.it
	(8.5.124.08) id 4DE63E3204324481; Wed, 13 Jul 2011 00:21:06 +0200
From: Andrea Adami <andrea.adami@gmail.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Jul 2011 00:15:31 +0200
Message-Id: <1310508931-1640-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH] kernel.bbclass: fix malformed patch
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
X-List-Received-Date: Tue, 12 Jul 2011 22:30:30 -0000

* commit 19bda7f2c2dac6363468a49295c38f2095c67c98
* was unfortunately based on a truncated patch.
* Fix the broken line and repair kernel.bbclass.
* Sorry for the noise...

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta/classes/kernel.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index e441748..9be55d0 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -189,7 +189,7 @@ kernel_do_configure() {
 	if [ ! -z "${INITRAMFS_IMAGE}" ]; then
 		for img in cpio.gz cpio.lzo cpio.lzma cpio.xz; do
 		if [ -e "${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE}-${MACHINE}.$img"
-			cp "${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE}-${MACHINE}.$i
+			cp "${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE}-${MACHINE}.$img" initramfs.$img
 		fi
 		done
 	fi
-- 
1.7.3.4



