Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QTVP1-0003ND-1B
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Jun 2011 10:43:15 +0200
Received: by wye20 with SMTP id 20so3020692wye.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Jun 2011 01:39:58 -0700 (PDT)
Received: by 10.216.202.147 with SMTP id d19mr4615332weo.23.1307349588640;
	Mon, 06 Jun 2011 01:39:48 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id z22sm2161885weq.2.2011.06.06.01.39.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 06 Jun 2011 01:39:47 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Jun 2011 10:39:44 +0200
Message-Id: <1307349584-31950-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] util-linux: package agetty seperately
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
X-List-Received-Date: Mon, 06 Jun 2011 08:43:15 -0000

Some packages like systemd only want agetty to spawn a console and not drag in all of util-linux just for that.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-core/util-linux/util-linux.inc       |    3 ++-
 meta/recipes-core/util-linux/util-linux_2.19.1.bb |    2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 71601dc..4b36100 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -25,7 +25,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux-ng/v${MAJOR_VERSION}/util-
            file://make_include \
            "
 
-PACKAGES =+ "util-linux-fdisk util-linux-cfdisk util-linux-sfdisk \
+PACKAGES =+ "util-linux-agetty util-linux-fdisk util-linux-cfdisk util-linux-sfdisk \
              util-linux-swaponoff util-linux-losetup util-linux-umount \
              util-linux-mount util-linux-readprofile util-linux-libblkid \
              util-linux-libblkid-dev util-linux-libuuid util-linux-libuuid-dev \
@@ -37,6 +37,7 @@ EXTRA_OECONF = "--disable-use-tty-group --disable-makeinstall-chown --enable-elv
 
 FILES_${PN}-doc += "${datadir}/getopt/getopt-*.*"
 
+FILES_util-linux-agetty = "${base_sbindir}/agetty"
 FILES_util-linux-fdisk = "${base_sbindir}/fdisk.${PN}"
 FILES_util-linux-cfdisk = "${base_sbindir}/cfdisk"
 FILES_util-linux-sfdisk = "${sbindir}/sfdisk"
diff --git a/meta/recipes-core/util-linux/util-linux_2.19.1.bb b/meta/recipes-core/util-linux/util-linux_2.19.1.bb
index 7fe7497..40183c9 100644
--- a/meta/recipes-core/util-linux/util-linux_2.19.1.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.19.1.bb
@@ -1,5 +1,5 @@
 MAJOR_VERSION = "2.19"
-PR = "r0"
+PR = "r1"
 require util-linux.inc
 
 # note that `lscpu' is under GPLv3+
-- 
1.6.6.1



