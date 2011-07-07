Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1Qer5i-0001gr-Kg for openembedded-core@lists.openembedded.org;
	Thu, 07 Jul 2011 18:06:14 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>) id 1Qer21-0005mT-8Z
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Jul 2011 18:02:25 +0200
From: Phil Blundell <pb@pbcl.net>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Thu, 07 Jul 2011 17:02:24 +0100
Organization: Phil Blundell Consulting Ltd
X-Mailer: Evolution 3.0.2- 
Message-ID: <1310054545.6337.92.camel@phil-desktop>
Mime-Version: 1.0
Subject: [PATCH 1/2] kernel.bbclass, task-base: remove references to obsolete bluez-dtl1-workaround
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
X-List-Received-Date: Thu, 07 Jul 2011 16:06:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit


Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/classes/kernel.bbclass          |    5 -----
 meta/recipes-core/tasks/task-base.bb |    5 -----
 2 files changed, 0 insertions(+), 10 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 943252a..7770b8b 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -227,11 +227,6 @@ ALLOW_EMPTY_kernel = "1"
 ALLOW_EMPTY_kernel-base = "1"
 ALLOW_EMPTY_kernel-image = "1"
 
-# Userspace workarounds for kernel modules issues
-# This is shame, fix the kernel instead!
-DEPENDS_kernel-module-dtl1-cs = "bluez-dtl1-workaround"
-RDEPENDS_kernel-module-dtl1-cs = "bluez-dtl1-workaround"
-
 pkg_postinst_kernel-image () {
 if [ ! -e "$D/lib/modules/${KERNEL_VERSION}" ]; then
 	mkdir -p $D/lib/modules/${KERNEL_VERSION}
diff --git a/meta/recipes-core/tasks/task-base.bb b/meta/recipes-core/tasks/task-base.bb
index 97a854c..99b7e17 100644
--- a/meta/recipes-core/tasks/task-base.bb
+++ b/meta/recipes-core/tasks/task-base.bb
@@ -80,7 +80,6 @@ RDEPENDS_task-base = "\
     ${@base_contains('COMBINED_FEATURES', 'irda', 'task-base-irda', '',d)} \
     ${@base_contains('COMBINED_FEATURES', 'pci', 'task-base-pci', '',d)} \
     ${@base_contains('COMBINED_FEATURES', 'pcmcia', 'task-base-pcmcia', '',d)} \
-    ${@base_contains('COMBINED_FEATURES', 'pcmcia', 'bluez-dtl1-workaround', '',d)} \
     ${@base_contains('COMBINED_FEATURES', 'usbgadget', 'task-base-usbgadget', '',d)} \
     ${@base_contains('COMBINED_FEATURES', 'usbhost', 'task-base-usbhost', '',d)} \
     ${@base_contains('COMBINED_FEATURES', 'bluetooth', 'task-base-bluetooth', '',d)} \
@@ -99,7 +98,6 @@ RDEPENDS_task-base = "\
     ${@base_contains('DISTRO_FEATURES', 'raid', 'task-base-raid', '',d)} \
     ${@base_contains('DISTRO_FEATURES', 'zeroconf', 'task-base-zeroconf', '',d)} \
     "
-# bluez-dtl1-workaround above is workaround for bitbake not handling DEPENDS on it in
 
 
 RRECOMMENDS_task-base = "\
@@ -229,10 +227,7 @@ RRECOMMENDS_task-base-bluetooth = "\
     ${@base_contains('COMBINED_FEATURES', 'pcmcia', 'kernel-module-bluecard-cs', '',d)} \
     ${@base_contains('COMBINED_FEATURES', 'pcmcia', 'kernel-module-bluetoothuart-cs', '',d)} \
     ${@base_contains('COMBINED_FEATURES', 'pcmcia', 'kernel-module-dtl1-cs', '',d)} \
-    ${@base_contains('COMBINED_FEATURES', 'pcmcia', 'bluez-dtl1-workaround', '',d)} \
     "
-# bluez-dtl1-workaround above is workaround for bitbake not handling DEPENDS on it in
-# kernel.bbclass. It should be there as long as kernel-module-dtl1-cs is, but not longer.
 
 RDEPENDS_task-base-irda = "\
     irda-utils"
-- 
1.7.2.5





