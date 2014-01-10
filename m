Return-Path: <milo-software@users.sourceforge.net>
Received: from smtp07.online.nl (smtp07.online.nl [194.134.42.52])
	by mail.openembedded.org (Postfix) with ESMTP id E82CB60CF2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2014 17:56:02 +0000 (UTC)
Received: from smtp07.online.nl (localhost [127.0.0.1])
	by smtp07.online.nl (Postfix) with ESMTP id BC91398504;
	Fri, 10 Jan 2014 18:56:01 +0100 (CET)
Received: from phenom.lan (s55969068.adsl.online.nl [85.150.144.104])
	by smtp07.online.nl (Postfix) with ESMTP;
	Fri, 10 Jan 2014 18:56:01 +0100 (CET)
From: MiLo <milo-software@users.sourceforge.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Jan 2014 18:56:00 +0100
Message-Id: <1389376560-30291-1-git-send-email-milo-software@users.sourceforge.net>
X-Mailer: git-send-email 1.7.9.5
X-Online-Scanned: by Cloudmark authority (on smtp07.online.nl)
Cc: MiLo <milo-software@users.sourceforge.net>
Subject: [PATCH] util-linux: Add fstrim utility
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 10 Jan 2014 17:56:03 -0000

Add "util-linux-fstrim" package, containing /sbin/fstrim, for trimming
unused sectors on SSDs.
---
 meta/recipes-core/util-linux/util-linux.inc |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 8a1e78a..10d9501 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -36,7 +36,7 @@ PACKAGES =+ "util-linux-agetty util-linux-fdisk util-linux-cfdisk util-linux-sfd
              util-linux-libblkid-dev util-linux-libuuid util-linux-libuuid-dev \
              util-linux-uuidgen util-linux-lscpu util-linux-fsck util-linux-blkid \
              util-linux-mkfs util-linux-mcookie util-linux-reset util-linux-uuidd \
-             util-linux-mkfs.cramfs util-linux-fsck.cramfs \
+             util-linux-mkfs.cramfs util-linux-fsck.cramfs util-linux-fstrim \
              util-linux-partx ${PN}-bash-completion"
 
 SHARED_EXTRA_OECONF = "--disable-use-tty-group \
@@ -63,6 +63,7 @@ FILES_${PN}-doc += "${datadir}/getopt/getopt-*.*"
 
 FILES_util-linux-agetty = "${base_sbindir}/agetty"
 FILES_util-linux-fdisk = "${base_sbindir}/fdisk.${BPN}"
+FILES_util-linux-fstrim = "${base_sbindir}/fstrim"
 FILES_util-linux-cfdisk = "${base_sbindir}/cfdisk"
 FILES_util-linux-sfdisk = "${sbindir}/sfdisk"
 FILES_util-linux-swaponoff = "${base_sbindir}/swapon.${BPN} ${base_sbindir}/swapoff.${BPN}"
@@ -130,7 +131,7 @@ do_install () {
 	mkdir -p ${D}${base_bindir}
 
         sbinprogs="agetty ctrlaltdel cfdisk vipw vigr"
-        sbinprogs_a="pivot_root hwclock mkswap mkfs.minix fsck.minix losetup swapon swapoff fdisk readprofile fsck blkid blockdev"
+        sbinprogs_a="pivot_root hwclock mkswap mkfs.minix fsck.minix losetup swapon swapoff fdisk readprofile fsck blkid blockdev fstrim"
         usrbinprogs_a="chfn chsh hexdump last logger mesg newgrp renice utmpdump wall setsid chrt flock getopt"
         binprogs_a="dmesg kill more umount mount login reset su"
 
-- 
1.7.9.5


