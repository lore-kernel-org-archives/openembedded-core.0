Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QMpG8-0003ul-76
	for openembedded-core@lists.openembedded.org;
	Thu, 19 May 2011 00:30:29 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 18 May 2011 15:27:29 -0700
X-ExtLoop1: 1
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.160])
	by orsmga002.jf.intel.com with ESMTP; 18 May 2011 15:27:28 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 May 2011 15:26:59 -0700
Message-Id: <5b93d7b4ac48d82a8e3e6ea434f4c940602e06e4.1305756950.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <fc7402495a8a30b203d5535e73383bc4412e2a1f.1305756950.git.sgw@linux.intel.com>
References: <fc7402495a8a30b203d5535e73383bc4412e2a1f.1305756950.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305756950.git.sgw@linux.intel.com>
References: <cover.1305756950.git.sgw@linux.intel.com>
Cc: Robert Berger <pokylinux@reliableembeddedsystems.com>,
	Yi Zhao <yi.zhao@windriver.com>
Subject: [PATCH 30/30] u-boot: update SRCREV to 2011.03
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
X-List-Received-Date: Wed, 18 May 2011 22:30:31 -0000

From: Darren Hart <dvhart@linux.intel.com>

Fixes [YOCTO 1029]

u-boot 2010.12 fails to run on the Beagleboard C4 and xM Rev A boards.  Commit
55aacbc30e48f6f8a73fb989a58625e70887bc01 suggests there was a mixup during
development, as the MD5SUM change is from the 2011.03 SRCREV back to the
2010.12. Chances are a patch was never sent to update the SRCREV, leaving the
MD5SUM in a bad state.

Update the SRCREV and COPYING MD5SUM to use the 2011.03 version. Built
and tested on Beagleboard xM Rev A and Beagleboard Rev C4.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Tested-by: Jeff Osier-Mixon <jefro@jefro.net>
Cc: Jeff Osier-Mixon <jefro@jefro.net>
Cc: Yi Zhao <yi.zhao@windriver.com>
Cc: Robert Berger <pokylinux@reliableembeddedsystems.com>
Cc: Gary Thomas <gary@mlbassoc.com>
---
 meta/recipes-bsp/uboot/u-boot_git.bb |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-bsp/uboot/u-boot_git.bb b/meta/recipes-bsp/uboot/u-boot_git.bb
index d8c196a..c5583ff 100644
--- a/meta/recipes-bsp/uboot/u-boot_git.bb
+++ b/meta/recipes-bsp/uboot/u-boot_git.bb
@@ -1,14 +1,14 @@
 require u-boot.inc
 
 LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=4c6cde5df68eff615d36789dc18edd3b \
+LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
                     file://README;beginline=1;endline=22;md5=3a00ef51d3fc96e9d6c1bc4708ccd3b5"
 
 FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/u-boot-git/${MACHINE}"
 
-SRCREV = "v2010.12"
-PV = "v2010.12+${PR}+git${SRCPV}"
-PR="r2"
+SRCREV = "v2011.03"
+PV = "v2011.03+${PR}+git${SRCPV}"
+PR="r3"
 
 SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
 
-- 
1.7.3.4



