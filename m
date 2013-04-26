Received: from r-finger.com ([178.79.160.5])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tf+lists.yocto@r-finger.com>) id 1UVlLG-0006vP-Qg
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Apr 2013 18:17:52 +0200
Received: from i7-990x.r-finger.com
	(host86-137-87-250.range86-137.btcentralplus.com [86.137.87.250])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by r-finger.com (Postfix) with ESMTPSA id 0C849952A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Apr 2013 16:50:39 +0100 (BST)
From: tf+lists.yocto@r-finger.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Apr 2013 16:50:39 +0100
Message-Id: <1366991439-14728-1-git-send-email-tf+lists.yocto@r-finger.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] ia32-base.inc: remove inapropriate grub dependency
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
X-List-Received-Date: Fri, 26 Apr 2013 16:18:13 -0000

From: Tomas Frydrych <tomas@sleepfive.com>

There is no good reason for ia32 machines to have hard dependency on grub,
as there are other bootloaders available for ia32 platforms.
---
 meta/conf/machine/include/ia32-base.inc |    1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/conf/machine/include/ia32-base.inc b/meta/conf/machine/include/ia32-base.inc
index 921c740..cb542a5 100644
--- a/meta/conf/machine/include/ia32-base.inc
+++ b/meta/conf/machine/include/ia32-base.inc
@@ -9,7 +9,6 @@ MACHINE_FEATURES += "screen keyboard pci usbhost ext2 ext3 x86 \
                      acpi serial usbgadget alsa"
 
 MACHINE_EXTRA_RRECOMMENDS += "kernel-modules eee-acpi-scripts"
-MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "grub"
 
 IMAGE_FSTYPES += "ext3 cpio.gz live"
 
-- 
1.7.10.4



