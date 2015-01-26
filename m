Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 144186AC95
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Jan 2015 17:49:38 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 26 Jan 2015 09:49:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="445330874"
Received: from klopezde-mobl.amr.corp.intel.com (HELO
	swold-mobl5.amr.corp.intel.com) ([10.252.252.121])
	by FMSMGA003.fm.intel.com with ESMTP; 26 Jan 2015 09:35:59 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Jan 2015 09:49:30 -0800
Message-Id: <1422294570-11014-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH] util-linux: move readprofile to match busybox
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
X-List-Received-Date: Mon, 26 Jan 2015 17:49:48 -0000

This change moves readprofile from /sbin -> /usr/sbin to match busybox,
the change allows update-alternative to correctly setup the links

[YOCTO #7225]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index e6c00e4..125e1e1 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -74,7 +74,7 @@ FILES_util-linux-losetup = "${base_sbindir}/losetup.${BPN}"
 FILES_util-linux-mount = "${base_bindir}/mount.${BPN}"
 FILES_util-linux-mcookie = "${bindir}/mcookie"
 FILES_util-linux-umount = "${base_bindir}/umount.${BPN}"
-FILES_util-linux-readprofile = "${base_sbindir}/readprofile.${BPN}"
+FILES_util-linux-readprofile = "${sbindir}/readprofile.${BPN}"
 FILES_util-linux-uuidgen = "${bindir}/uuidgen"
 FILES_util-linux-uuidd = "${sbindir}/uuidd"
 FILES_util-linux-reset = "${base_bindir}/reset"
@@ -136,8 +136,8 @@ do_install () {
 	mkdir -p ${D}${base_bindir}
 
         sbinprogs="agetty ctrlaltdel cfdisk vipw vigr"
-        sbinprogs_a="pivot_root hwclock mkswap mkfs.minix fsck.minix losetup swapon swapoff fdisk readprofile fsck blkid blockdev fstrim sulogin switch_root"
-        usrbinprogs_a="chfn chsh hexdump last logger mesg newgrp renice utmpdump wall setsid chrt flock getopt"
+        sbinprogs_a="pivot_root hwclock mkswap mkfs.minix fsck.minix losetup swapon swapoff fdisk fsck blkid blockdev fstrim sulogin switch_root"
+        usrbinprogs_a="chfn chsh hexdump last logger mesg newgrp renice utmpdump wall setsid chrt flock getopt readprofile"
         binprogs_a="dmesg kill more umount mount login reset su"
 
         if [ "${base_sbindir}" != "${sbindir}" ]; then
@@ -213,7 +213,7 @@ ALTERNATIVE_util-linux-umount = "umount"
 ALTERNATIVE_LINK_NAME[umount] = "${base_bindir}/umount"
 
 ALTERNATIVE_util-linux-readprofile = "readprofile"
-ALTERNATIVE_LINK_NAME[readprofile] = "${base_sbindir}/readprofile"
+ALTERNATIVE_LINK_NAME[readprofile] = "${sbindir}/readprofile"
 
 ALTERNATIVE_util-linux-losetup = "losetup"
 ALTERNATIVE_LINK_NAME[losetup] = "${base_sbindir}/losetup"
-- 
2.1.0


