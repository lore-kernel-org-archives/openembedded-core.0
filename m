Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1SsBWT-0002UU-13
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Jul 2012 13:37:29 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 20 Jul 2012 04:26:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="124735710"
Received: from dell-desktop (HELO localhost.localdomain) ([10.237.105.32])
	by AZSMGA002.ch.intel.com with ESMTP; 20 Jul 2012 04:26:03 -0700
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jul 2012 14:33:38 +0300
Message-Id: <1342784018-4081-1-git-send-email-radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] grub-efi-native: remove help2man dependency
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
X-List-Received-Date: Fri, 20 Jul 2012 11:37:29 -0000

As suggested in 70067f082af279b58247467ec29283b310a1575e we do not
need this dependency.

[YOCTO #2527]

Signed-off-by: Radu Moisan <radu.moisan@intel.com>
---
 meta/recipes-bsp/grub/grub-efi-native_1.99.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/grub/grub-efi-native_1.99.bb b/meta/recipes-bsp/grub/grub-efi-native_1.99.bb
index 86a6d44..9e923bd 100644
--- a/meta/recipes-bsp/grub/grub-efi-native_1.99.bb
+++ b/meta/recipes-bsp/grub/grub-efi-native_1.99.bb
@@ -14,7 +14,7 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 # FIXME: We should be able to optionally drop freetype as a dependency
-DEPENDS = "help2man-native autogen-native"
+DEPENDS = "autogen-native"
 RDEPENDS_${PN} = "diffutils freetype"
 PR = "r10"
 
-- 
1.7.9.5



