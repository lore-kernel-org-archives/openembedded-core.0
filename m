Return-Path: <ben.shelton@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id CA4EE707A8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 14:32:41 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod3.natinst.com (8.14.5/8.14.5) with ESMTP id
	s6OEWha3025300 for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 09:32:43 -0500
Received: from bshelton-desktop.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014072409324344-189228 ;
	Thu, 24 Jul 2014 09:32:43 -0500 
From: Ben Shelton <ben.shelton@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Jul 2014 09:32:26 -0500
Message-Id: <1406212346-25553-2-git-send-email-ben.shelton@ni.com>
X-Mailer: git-send-email 2.0.2
In-Reply-To: <1406212346-25553-1-git-send-email-ben.shelton@ni.com>
References: <1406212346-25553-1-git-send-email-ben.shelton@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/24/2014 09:32:43 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/24/2014 09:32:43 AM,
	Serialize complete at 07/24/2014 09:32:43 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.12.52, 1.0.14,
	0.0.0000
	definitions=2014-07-24_03:2014-07-24, 2014-07-24,
	1970-01-01 signatures=0
Subject: [PATCH v2 2/2] util-linux: break out new package util-linux-findfs
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
X-List-Received-Date: Thu, 24 Jul 2014 14:32:44 -0000

From: Richard Tollerton <rich.tollerton@ni.com>

We'd like to include the util-linux version of findfs in images without
having to include all of util-linux. To make this possible, break out
findfs into its own package.

Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
Signed-off-by: Ben Shelton <ben.shelton@ni.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index d640a5f..ffb84c4 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -36,7 +36,8 @@ PACKAGES =+ "util-linux-agetty util-linux-fdisk util-linux-cfdisk util-linux-sfd
              util-linux-uuidgen util-linux-lscpu util-linux-fsck util-linux-blkid \
              util-linux-mkfs util-linux-mcookie util-linux-reset \
              util-linux-mkfs.cramfs util-linux-fsck.cramfs util-linux-fstrim \
-             util-linux-partx ${PN}-bash-completion util-linux-hwclock"
+             util-linux-partx ${PN}-bash-completion util-linux-hwclock \
+             util-linux-findfs"
 
 SHARED_EXTRA_OECONF = "--disable-use-tty-group \
                        --disable-makeinstall-chown \
@@ -79,6 +80,7 @@ FILES_util-linux-uuidd = "${sbindir}/uuidd"
 FILES_util-linux-reset = "${base_bindir}/reset"
 FILES_util-linux-partx = "${sbindir}/partx"
 FILES_util-linux-hwclock = "${base_sbindir}/hwclock.${BPN}"
+FILES_util-linux-findfs = "${sbindir}/findfs"
 
 FILES_util-linux-libblkid = "${base_libdir}/libblkid.so.*"
 FILES_util-linux-libmount = "${base_libdir}/libmount.so.*"
-- 
2.0.2


