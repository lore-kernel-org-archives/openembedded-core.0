Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <steve@sakoman.com>) id 1RjONO-0004sE-3e
	for openembedded-core@lists.openembedded.org;
	Sat, 07 Jan 2012 05:59:30 +0100
Received: by iakh37 with SMTP id h37so3665967iak.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Jan 2012 20:52:05 -0800 (PST)
Received: by 10.43.43.130 with SMTP id uc2mr8076444icb.35.1325911924919;
	Fri, 06 Jan 2012 20:52:04 -0800 (PST)
Received: from quadra.sakoman.net
	(static-74-41-60-154.dsl1.pco.ca.frontiernet.net. [74.41.60.154])
	by mx.google.com with ESMTPS id gh7sm109453857igb.1.2012.01.06.20.52.02
	(version=SSLv3 cipher=OTHER); Fri, 06 Jan 2012 20:52:03 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Jan 2012 20:51:51 -0800
Message-Id: <1325911915-16001-1-git-send-email-steve@sakoman.com>
X-Mailer: git-send-email 1.7.1
Cc: Steve Sakoman <steve@sakoman.com>
Subject: [PATCH v2] Remove last remnants of kernel26 MACHINE_FEATURES
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
X-List-Received-Date: Sat, 07 Jan 2012 04:59:30 -0000

There is no reason to continue to carry this feature

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/bitbake.conf                             |    1 -
 meta/conf/machine/include/qemu.inc                 |    2 +-
 .../update-modules/update-modules_1.0.bb           |    4 ++--
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index b858364..336b1d7 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -685,7 +685,6 @@ OES_BITBAKE_CONF = "1"
 # Machine properties and task-base stuff
 ##################################################################
 
-MACHINE_FEATURES ?= "kernel26"
 DISTRO_FEATURES ?= ""
 
 # This is used to limit what packages goes into images built, so set big by default
diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include/qemu.inc
index 3cebfab..10ab76e 100644
--- a/meta/conf/machine/include/qemu.inc
+++ b/meta/conf/machine/include/qemu.inc
@@ -1,7 +1,7 @@
 PCMCIA_MANAGER = "pcmciautils"
 PREFERRED_PROVIDER_virtual/xserver ?= "xserver-kdrive"
 
-MACHINE_FEATURES = "kernel26 apm alsa pcmcia bluetooth irda usbgadget screen"
+MACHINE_FEATURES = "apm alsa pcmcia bluetooth irda usbgadget screen"
 
 IMAGE_FSTYPES ?= "tar.bz2 ext3"
 
diff --git a/meta/recipes-kernel/update-modules/update-modules_1.0.bb b/meta/recipes-kernel/update-modules/update-modules_1.0.bb
index 1ea97a8..dc44965 100644
--- a/meta/recipes-kernel/update-modules/update-modules_1.0.bb
+++ b/meta/recipes-kernel/update-modules/update-modules_1.0.bb
@@ -3,8 +3,8 @@ SECTION = "base"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/COPYING.GPL;md5=751419260aa954499f7abaabaa882bbe"
 
-RDEPENDS_${PN} = "${@base_contains("MACHINE_FEATURES", "kernel26",  "module-init-tools-depmod","modutils-depmod",d)} "
-PR = "r10"
+RDEPENDS_${PN} = "module-init-tools-depmod"
+PR = "r11"
 
 SRC_URI = "file://update-modules \
            file://COPYING.GPL"
-- 
1.7.1



