Return-Path: <ben.shelton@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id E931A704E6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jul 2014 22:29:59 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod3.natinst.com (8.14.5/8.14.5) with ESMTP id
	s6NMTxqX021061 for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jul 2014 17:30:00 -0500
Received: from bshelton-desktop.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014072317295947-160287 ;
	Wed, 23 Jul 2014 17:29:59 -0500 
From: Ben Shelton <ben.shelton@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Jul 2014 17:29:46 -0500
Message-Id: <1406154587-30052-1-git-send-email-ben.shelton@ni.com>
X-Mailer: git-send-email 2.0.2
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/23/2014 05:29:59 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/23/2014 05:30:00 PM,
	Serialize complete at 07/23/2014 05:30:00 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.12.52, 1.0.14,
	0.0.0000
	definitions=2014-07-23_07:2014-07-23, 2014-07-23,
	1970-01-01 signatures=0
Cc: Alejandro del Castillo <alejandro.delcastillo@ni.com>
Subject: [PATCH 1/2] util-linux: break out new package util-linux-hwclock
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
X-List-Received-Date: Wed, 23 Jul 2014 22:30:00 -0000

From: Alejandro del Castillo <alejandro.delcastillo@ni.com>

Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
Signed-off-by: Ben Shelton <ben.shelton@ni.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 83bb4a6..d640a5f 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -36,7 +36,7 @@ PACKAGES =+ "util-linux-agetty util-linux-fdisk util-linux-cfdisk util-linux-sfd
              util-linux-uuidgen util-linux-lscpu util-linux-fsck util-linux-blkid \
              util-linux-mkfs util-linux-mcookie util-linux-reset \
              util-linux-mkfs.cramfs util-linux-fsck.cramfs util-linux-fstrim \
-             util-linux-partx ${PN}-bash-completion"
+             util-linux-partx ${PN}-bash-completion util-linux-hwclock"
 
 SHARED_EXTRA_OECONF = "--disable-use-tty-group \
                        --disable-makeinstall-chown \
@@ -78,6 +78,7 @@ FILES_util-linux-uuidgen = "${bindir}/uuidgen"
 FILES_util-linux-uuidd = "${sbindir}/uuidd"
 FILES_util-linux-reset = "${base_bindir}/reset"
 FILES_util-linux-partx = "${sbindir}/partx"
+FILES_util-linux-hwclock = "${base_sbindir}/hwclock.${BPN}"
 
 FILES_util-linux-libblkid = "${base_libdir}/libblkid.so.*"
 FILES_util-linux-libmount = "${base_libdir}/libmount.so.*"
@@ -166,7 +167,7 @@ ALTERNATIVE_PRIORITY = "100"
 
 ALTERNATIVE_${PN}  = "dmesg kill more mkswap blockdev pivot_root"
 ALTERNATIVE_${PN} += "mkfs.minix hexdump last logger mesg renice wall"
-ALTERNATIVE_${PN} += "setsid chrt flock hwclock utmpdump eject getopt sulogin"
+ALTERNATIVE_${PN} += "setsid chrt flock utmpdump eject getopt sulogin"
 
 ALTERNATIVE_LINK_NAME[dmesg] = "${base_bindir}/dmesg"
 ALTERNATIVE_LINK_NAME[kill] = "${base_bindir}/kill"
@@ -190,6 +191,7 @@ ALTERNATIVE_LINK_NAME[sulogin.8] = "${mandir}/man8/sulogin.8"
 ALTERNATIVE_LINK_NAME[utmpdump.1] = "${mandir}/man1/utmpdump.1"
 ALTERNATIVE_LINK_NAME[wall.1] = "${mandir}/man1/wall.1"
 
+ALTERNATIVE_util-linux-hwclock = "hwclock"
 # There seems to be problem, atleast on nslu2, with these, untill they are
 # fixed the busybox ones have higher priority
 ALTERNATIVE_PRIORITY[hwclock] = "10"
-- 
2.0.2


