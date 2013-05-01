Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1UXe9j-0008K8-L0
	for openembedded-core@lists.openembedded.org;
	Wed, 01 May 2013 23:01:54 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 01 May 2013 13:43:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,591,1363158000"; d="scan'208";a="306398753"
Received: from envy2.jf.intel.com (HELO localhost) ([10.7.199.54])
	by orsmga001.jf.intel.com with ESMTP; 01 May 2013 13:43:46 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 May 2013 13:43:33 -0700
Message-Id: <9abc1921f7db226aa6cf627e9ba1dffdd2dbe713.1367441013.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH] grub-efi-native: Cleanup whitespace
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
X-List-Received-Date: Wed, 01 May 2013 21:01:55 -0000

A few of the recent commits have used inconsistent whitespace with
respect to tabs and spaces for indentation and alignment. Correct it.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 meta/recipes-bsp/grub/grub-efi-native_2.00.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-bsp/grub/grub-efi-native_2.00.bb b/meta/recipes-bsp/grub/grub-efi-native_2.00.bb
index 2a5dad7..11dcfdf 100644
--- a/meta/recipes-bsp/grub/grub-efi-native_2.00.bb
+++ b/meta/recipes-bsp/grub/grub-efi-native_2.00.bb
@@ -24,11 +24,11 @@ PN := "grub-efi-${TRANSLATED_TARGET_ARCH}-native"
 
 SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
            file://grub-2.00-fpmath-sse-387-fix.patch \
-	   file://grub-2.00-fix-enable_execute_stack-check.patch \
+           file://grub-2.00-fix-enable_execute_stack-check.patch \
            file://grub-2.00-disable-help2man.patch \
            file://check-if-liblzma-is-disabled.patch \
-	   file://grub-no-unused-result.patch \
-	   file://grub-2.00-ignore-gnulib-gets-stupidity.patch \
+           file://grub-no-unused-result.patch \
+           file://grub-2.00-ignore-gnulib-gets-stupidity.patch \
           "
 SRC_URI[md5sum] = "e927540b6eda8b024fb0391eeaa4091c"
 SRC_URI[sha256sum] = "65b39a0558f8c802209c574f4d02ca263a804e8a564bc6caf1cd0fd3b3cc11e3"
@@ -66,7 +66,7 @@ EXTRA_OECONF = "--with-platform=efi --disable-grub-mkfont \
 
 do_mkimage() {
 	./grub-mkimage -p /EFI/BOOT -d ./grub-core/ \
-		       -O ${GRUB_TARGET}-efi -o ./${GRUB_IMAGE} \
+	               -O ${GRUB_TARGET}-efi -o ./${GRUB_IMAGE} \
 	               boot linux ext2 fat serial part_msdos part_gpt normal efi_gop
 }
 addtask mkimage after do_compile before do_install
-- 
1.8.1.2



