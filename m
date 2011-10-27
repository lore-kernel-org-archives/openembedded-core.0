Received: from am1ehsobe002.messaging.microsoft.com ([213.199.154.205]
	helo=AM1EHSOBE002.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RJIO2-0001JT-LJ
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Oct 2011 07:20:18 +0200
Received: from mail115-am1-R.bigfish.com (10.3.201.241) by
	AM1EHSOBE002.bigfish.com (10.3.204.22) with Microsoft SMTP Server id
	14.1.225.22; Thu, 27 Oct 2011 05:14:11 +0000
Received: from mail115-am1 (localhost.localdomain [127.0.0.1])	by
	mail115-am1-R.bigfish.com (Postfix) with ESMTP id 55E86F880A3	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 27 Oct 2011 05:14:15 +0000 (UTC)
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bhz2dh2a8h668h839h62h)
X-Spam-TCS-SCL: 1:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail115-am1 (localhost.localdomain [127.0.0.1]) by mail115-am1
	(MessageSwitch) id 1319692454951527_11164;
	Thu, 27 Oct 2011 05:14:14 +0000 (UTC)
Received: from AM1EHSMHS008.bigfish.com (unknown [10.3.201.249])	by
	mail115-am1.bigfish.com (Postfix) with ESMTP id DA256480052	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 27 Oct 2011 05:14:14 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS008.bigfish.com
	(10.3.207.108) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Thu, 27 Oct 2011 05:14:11 +0000
Received: from az33smr02.freescale.net (10.64.34.200) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server id 14.1.339.2; Thu, 27 Oct 2011 00:14:16 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.193.13])
	by az33smr02.freescale.net (8.13.1/8.13.0) with ESMTP id
	p9R5EFqY005995	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Oct 2011 00:14:15 -0500 (CDT)
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 27 Oct 2011 00:14:14 -0500
Message-ID: <1319692454-20226-2-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <1319692454-20226-1-git-send-email-msm@freescale.com>
References: <1319692454-20226-1-git-send-email-msm@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH 2/2] Add new util-linux-chkdupexe package to avoid making perl a dependecy for all of util-linux
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
X-List-Received-Date: Thu, 27 Oct 2011 05:20:18 -0000
Content-Type: text/plain

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta/recipes-core/util-linux/util-linux.inc       |    7 +++++--
 meta/recipes-core/util-linux/util-linux_2.19.1.bb |    2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 67d81b9..eeba67c 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -29,7 +29,8 @@ PACKAGES =+ "util-linux-agetty util-linux-fdisk util-linux-cfdisk util-linux-sfd
              util-linux-swaponoff util-linux-losetup util-linux-umount \
              util-linux-mount util-linux-readprofile util-linux-libblkid \
              util-linux-libblkid-dev util-linux-libuuid util-linux-libuuid-dev \
-             util-linux-uuidgen util-linux-lscpu util-linux-fsck util-linux-blkid"
+             util-linux-uuidgen util-linux-lscpu util-linux-fsck util-linux-blkid \
+	     util-linux-chkdupexe"
 
 EXTRA_OECONF = "--disable-use-tty-group --disable-makeinstall-chown --enable-elvtune --enable-init --enable-kill --enable-last \
  --enable-mesg --enable-partx --enable-raw --enable-rdev --enable-reset \
@@ -55,6 +56,7 @@ FILES_util-linux-libuuid-dev = "${libdir}/libuuid.so ${libdir}/libuuid.a ${libdi
 FILES_util-linux-lscpu = "${bindir}/lscpu"
 
 FILES_util-linux-fsck = "${base_sbindir}/fsck*"
+FILES_util-linux-chkdupexe = "${bindir}/chkdupexe"
 
 # Util-linux' blkid replaces the e2fsprogs one
 FILES_util-linux-blkid = "${base_sbindir}/blkid*"
@@ -62,7 +64,8 @@ RCONFLICTS_util-linux-blkid = "e2fsprogs-blkid"
 RREPLACES_util-linux-blkid = "e2fsprogs-blkid"
 
 RRECOMMENDS_${PN} = "util-linux-fdisk util-linux-cfdisk util-linux-sfdisk util-linux-mount util-linux-readprofile "
-RDEPENDS_${PN} = "util-linux-umount util-linux-swaponoff util-linux-losetup perl"
+RDEPENDS_${PN} = "util-linux-umount util-linux-swaponoff util-linux-losetup"
+RDEPENDS_${PN}-chkdupexe = "perl"
 
 RRECOMMENDS_${PN}_virtclass-native = ""
 RDEPENDS_${PN}_virtclass-native = ""
diff --git a/meta/recipes-core/util-linux/util-linux_2.19.1.bb b/meta/recipes-core/util-linux/util-linux_2.19.1.bb
index 04f4457..fb5637e 100644
--- a/meta/recipes-core/util-linux/util-linux_2.19.1.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.19.1.bb
@@ -1,5 +1,5 @@
 MAJOR_VERSION = "2.19"
-PR = "r8"
+PR = "r9"
 require util-linux.inc
 
 # note that `lscpu' is under GPLv3+
-- 
1.7.6.1




