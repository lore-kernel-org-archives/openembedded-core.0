Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jluebbe@lasnet.de>) id 1RPFQv-0008QV-6l
	for openembedded-core@lists.openembedded.org;
	Sat, 12 Nov 2011 16:23:53 +0100
Received: from g224239233.adsl.alicedsl.de ([92.224.239.233]
	helo=polaris.fritz.box) by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.69 #1)
	id 1RPFIV-0001lG-SN by authid <polaris@lasnet.de> with
	srv_auth_cram_md5 for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Nov 2011 16:15:13 +0100
From: Jan Luebbe <jluebbe@debian.org>
To: openembedded-core@lists.openembedded.org
Date: Sat, 12 Nov 2011 16:14:58 +0100
Message-Id: <1321110898-29719-1-git-send-email-jluebbe@debian.org>
X-Mailer: git-send-email 1.7.7.2
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Subject: [PATCH] syslinux: fix the SRC_URI by using the 4.xx directory
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
X-List-Received-Date: Sat, 12 Nov 2011 15:23:53 -0000

This path should be valid for a longer time, as only the current
release stays in main directory.

Signed-off-by: Jan Luebbe <jluebbe@debian.org>
---
 meta/recipes-devtools/syslinux/syslinux_4.03.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/syslinux/syslinux_4.03.bb b/meta/recipes-devtools/syslinux/syslinux_4.03.bb
index e76fe1f..2d32f7b 100644
--- a/meta/recipes-devtools/syslinux/syslinux_4.03.bb
+++ b/meta/recipes-devtools/syslinux/syslinux_4.03.bb
@@ -7,9 +7,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
 # If you really want to run syslinux, you need mtools.  We just want the
 # ldlinux.* stuff for now, so skip mtools-native
 DEPENDS = "nasm-native"
-PR = "r2"
+PR = "r3"
 
-SRC_URI = "${KERNELORG_MIRROR}/linux/utils/boot/syslinux/syslinux-${PV}.tar.bz2 \
+SRC_URI = "${KERNELORG_MIRROR}/linux/utils/boot/syslinux/4.xx/syslinux-${PV}.tar.bz2 \
            file://cross-build.patch"
 
 SRC_URI[md5sum] = "a7ca38a0a5786b6efae8fb01a1ae8070"
-- 
1.7.7.2



