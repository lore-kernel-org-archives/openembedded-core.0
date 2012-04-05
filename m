Received: from smarthost.techfak.uni-bielefeld.de ([129.70.137.17])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@herbrechtsmeier.net>) id 1SFlKD-00028h-77
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Apr 2012 13:58:01 +0200
Received: from localhost.localdomain (hanuta.TechFak.Uni-Bielefeld.DE
	[129.70.129.229])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested) (Authenticated sender: sherbrec)
	by smarthost.TechFak.Uni-Bielefeld.DE (Postfix) with ESMTPSA id 91021B5;
	Thu,  5 Apr 2012 13:48:49 +0200 (CEST)
From: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Apr 2012 13:48:27 +0200
Message-Id: <1333626507-32182-1-git-send-email-stefan@herbrechtsmeier.net>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH] u-boot: add machine name to spl image name
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
X-List-Received-Date: Thu, 05 Apr 2012 11:58:01 -0000

Signed-off-by: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
---
 meta/recipes-bsp/u-boot/u-boot.inc        |    2 +-
 meta/recipes-bsp/u-boot/u-boot_2011.03.bb |    2 +-
 meta/recipes-bsp/u-boot/u-boot_2011.06.bb |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 700d5d3..0445c34 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -32,7 +32,7 @@ UBOOT_MAKE_TARGET ?= "all"
 # deploy directory.  For those versions they can set the following variables
 # to allow packaging the SPL.
 SPL_BINARY ?= ""
-SPL_IMAGE ?= "${SPL_BINARY}-${PV}-${PR}"
+SPL_IMAGE ?= "${SPL_BINARY}-${MACHINE}-${PV}-${PR}"
 SPL_SYMLINK ?= "${SPL_BINARY}-${MACHINE}"
 
 do_compile () {
diff --git a/meta/recipes-bsp/u-boot/u-boot_2011.03.bb b/meta/recipes-bsp/u-boot/u-boot_2011.03.bb
index 1ebdbea..e99bc2c 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2011.03.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2011.03.bb
@@ -17,7 +17,7 @@ FILESDIR = "${@os.path.dirname(d.getVar('FILE',1))}/u-boot-git/${MACHINE}"
 SRCREV = "19b54a701811220221fc4d5089a2bb18892018ca"
 
 PV = "v2011.03+git${SRCPV}"
-PR = "r5"
+PR = "r6"
 
 SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
 
diff --git a/meta/recipes-bsp/u-boot/u-boot_2011.06.bb b/meta/recipes-bsp/u-boot/u-boot_2011.06.bb
index 8ebdbff..680401f 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2011.06.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2011.06.bb
@@ -17,7 +17,7 @@ FILESDIR = "${@os.path.dirname(d.getVar('FILE',1))}/u-boot-git/${MACHINE}"
 SRCREV = "b1af6f532e0d348b153d5c148369229d24af361a"
 
 PV = "v2011.06+git${SRCPV}"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
 
-- 
1.7.0.4



