Received: from ffm.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1S6CE4-00087x-2C
	for openembedded-core@lists.openembedded.org;
	Sat, 10 Mar 2012 03:40:08 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Sat, 10 Mar 2012 03:31:26 +0100
Message-Id: <1331346686-14454-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] linux-firmware: fix permissions of installed files
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
X-List-Received-Date: Sat, 10 Mar 2012 02:40:08 -0000

* The previous copy command preserved the original
  owner and permission bits.
* The new command uses root:root and applies OE's
  umask.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 .../linux-firmware/linux-firmware_git.bb           |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index a99dc7e..52929fa 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -21,7 +21,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.radeon_rlc;md5=4c243f7854d2884b483abda991adef
 
 SRCREV = "15888a2eab052ac3d3f49334e4f6f05f347a516e"
 PV = "0.0+git${SRCPV}"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "git://git.infradead.org/users/dwmw2/linux-firmware.git;protocol=git"
 
@@ -35,7 +35,7 @@ do_compile() {
 
 do_install() {
 	install -d  ${D}/lib/firmware/
-	cp -RpP * ${D}/lib/firmware/
+	cp -r * ${D}/lib/firmware/
 
 	# Libertas sd8686
 	install -m 0644 libertas/sd8686_v9.bin ${D}/lib/firmware/sd8686.bin
-- 
1.7.5.4



