Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RXsX3-0007Gu-KL
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Dec 2011 11:45:53 +0100
Received: by eeav2 with SMTP id v2so934127eea.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Dec 2011 02:39:06 -0800 (PST)
Received: by 10.14.0.10 with SMTP id 10mr2257683eea.157.1323167946566;
	Tue, 06 Dec 2011 02:39:06 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id z7sm33745048bka.1.2011.12.06.02.39.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Dec 2011 02:39:05 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Dec 2011 11:39:01 +0100
Message-Id: <1323167941-25751-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] omap3-sgx-modules: drop from oe-core, it lives in the meta-ti BSP nowadays
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
X-List-Received-Date: Tue, 06 Dec 2011 10:45:53 -0000

OE-core only support qemu based machines, so BSP type recipe should be moved to their respective BSPs

omap3-sgx-modules can be found in the meta-ti BSP: http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/meta-texasinstruments/

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../omap3-sgx-modules_1.3.13.1397.bb               |   17 -----------------
 1 files changed, 0 insertions(+), 17 deletions(-)
 delete mode 100644 meta/recipes-bsp/powervr-drivers/omap3-sgx-modules_1.3.13.1397.bb

diff --git a/meta/recipes-bsp/powervr-drivers/omap3-sgx-modules_1.3.13.1397.bb b/meta/recipes-bsp/powervr-drivers/omap3-sgx-modules_1.3.13.1397.bb
deleted file mode 100644
index 0e850bc..0000000
--- a/meta/recipes-bsp/powervr-drivers/omap3-sgx-modules_1.3.13.1397.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-DESCRIPTION = "Kernel drivers for the PowerVR SGX chipset found in the omap3 SoCs"
-LICENSE = "GPLv2"
-
-inherit module
-
-SRC_URI = "http://dominion.thruhere.net/koen/OE/omap3-sgx-modules-1.3.13.1397.tar.bz2"
-
-S = ${WORKDIR}/${BPN}-${PV}/eurasiacon/build/linux/omap3430_linux/kbuild/
-
-MAKE_TARGETS = "BUILD=debug"
-
-COMPATIBLE_MACHINE = "(omap-3430ldp|omap-3430sdp|beagleboard|overo)"
-
-do_install() {
-	mkdir -p ${D}/lib/modules/${KERNEL_VERSION}/drivers/gpu
-	cp ${WORKDIR}/${BPN}-${PV}/eurasiacon/binary_omap3430_linux_debug/*.ko ${D}/lib/modules/${KERNEL_VERSION}/drivers/gpu	
-}
-- 
1.7.2.5



