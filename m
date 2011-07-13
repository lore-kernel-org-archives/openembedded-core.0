Received: from smtp208.alice.it ([82.57.200.104])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1Qh8Q0-0003Nj-IN
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Jul 2011 01:00:36 +0200
Received: from mizar.localdomain (87.14.251.219) by smtp208.alice.it
	(8.5.124.08) id 4DE64DF1044861F5; Thu, 14 Jul 2011 00:51:01 +0200
From: Andrea Adami <andrea.adami@gmail.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 14 Jul 2011 00:50:26 +0200
Message-Id: <1310597426-25339-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH] kernel.bbclass: remove unintended change of INITRAMFS_TASK
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
X-List-Received-Date: Wed, 13 Jul 2011 23:00:36 -0000

* during an unfortunate round of tests right before commiting the patch
* do_configure[depends] became  kernel_do_configure[depends]
* Nonsense!
* As documented in commit 4dfef62dfe54a3b2c557a6df81d155adc1e03ccb
* of OpenEmbedded git server, this must be in do_configure[depends]
* to do the magic.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta/classes/kernel.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index b71a650..d1f6480 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -195,7 +195,7 @@ kernel_do_configure() {
 	fi
 }
 
-kernel_do_configure[depends] += "${INITRAMFS_TASK}"
+do_configure[depends] += "${INITRAMFS_TASK}"
 
 do_menuconfig() {
         export DISPLAY='${DISPLAY}'
-- 
1.7.3.4



