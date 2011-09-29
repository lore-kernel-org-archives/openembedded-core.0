Received: from db3ehsobe004.messaging.microsoft.com ([213.199.154.142]
	helo=DB3EHSOBE004.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1R98SY-0000j3-ET
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Sep 2011 06:42:58 +0200
Received: from mail82-db3-R.bigfish.com (10.3.81.244) by
	DB3EHSOBE004.bigfish.com (10.3.84.24) with Microsoft SMTP Server id
	14.1.225.22; Thu, 29 Sep 2011 04:21:39 +0000
Received: from mail82-db3 (localhost.localdomain [127.0.0.1])	by
	mail82-db3-R.bigfish.com (Postfix) with ESMTP id 5288FE505BA	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2011 04:21:39 +0000 (UTC)
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bhz2dh2a8h668h839h64h)
X-Spam-TCS-SCL: 3:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 0,
Received: from mail82-db3 (localhost.localdomain [127.0.0.1]) by mail82-db3
	(MessageSwitch) id 1317270080179974_24095;
	Thu, 29 Sep 2011 04:21:20 +0000 (UTC)
Received: from DB3EHSMHS014.bigfish.com (unknown [10.3.81.247])	by
	mail82-db3.bigfish.com (Postfix) with ESMTP id 1B34FDC8052	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2011 04:21:20 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS014.bigfish.com
	(10.3.87.114) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Thu, 29 Sep 2011 04:21:17 +0000
Received: from az33smr01.freescale.net (10.64.34.199) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server id 14.1.323.7; Wed, 28 Sep 2011 23:21:16 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.193.13])
	by az33smr01.freescale.net (8.13.1/8.13.0) with ESMTP id
	p8T4LAL5024559	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2011 23:21:15 -0500 (CDT)
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 28 Sep 2011 23:21:10 -0500
Message-ID: <1317270070-14250-16-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <1317270070-14250-1-git-send-email-msm@freescale.com>
References: <1317270070-14250-1-git-send-email-msm@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH 16/16] Add proper deps for nfs-utils, util-linux, and strace
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
X-List-Received-Date: Thu, 29 Sep 2011 04:42:58 -0000
Content-Type: text/plain

These packages need these deps for the RPM generation stage:

 error: Failed dependencies:
| 	/usr/bin/python is needed by nfs-utils-1.2.3-r2.ppce5500
| 	/usr/bin/perl is needed by util-linux-2.19.1-r4.ppce5500
| 	/usr/bin/perl is needed by strace-4.5.20-r2.ppce5500

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 .../nfs-utils/nfs-utils_1.2.3.bb                   |    2 +-
 meta/recipes-core/util-linux/util-linux.inc        |    2 +-
 meta/recipes-devtools/strace/strace_4.5.20.bb      |    2 ++
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb
index 08468fe..e8b0490 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 # util-linux for libblkid
 DEPENDS = "libcap libnfsidmap libevent util-linux tcp-wrappers"
-RDEPENDS_${PN} = "portmap"
+RDEPENDS_${PN} = "portmap python"
 RRECOMMENDS_${PN} = "kernel-module-nfsd"
 
 PR = "r2"
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 1f242b7..afce673 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -55,7 +55,7 @@ FILES_util-linux-libuuid-dev = "${libdir}/libuuid.so ${libdir}/libuuid.a ${libdi
 FILES_util-linux-lscpu = "${bindir}/lscpu"
 
 RRECOMMENDS_${PN} = "util-linux-fdisk util-linux-cfdisk util-linux-sfdisk util-linux-mount util-linux-readprofile "
-RDEPENDS_${PN} = "util-linux-umount util-linux-swaponoff util-linux-losetup"
+RDEPENDS_${PN} = "util-linux-umount util-linux-swaponoff util-linux-losetup perl"
 
 RRECOMMENDS_${PN}_virtclass-native = ""
 RDEPENDS_${PN}_virtclass-native = ""
diff --git a/meta/recipes-devtools/strace/strace_4.5.20.bb b/meta/recipes-devtools/strace/strace_4.5.20.bb
index 391669f..b3d2aa5 100644
--- a/meta/recipes-devtools/strace/strace_4.5.20.bb
+++ b/meta/recipes-devtools/strace/strace_4.5.20.bb
@@ -5,6 +5,8 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=4535377ede62550fdeaf39f595fd550a"
 PR = "r2"
 
+RDEPENDS = "perl"
+
 SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.bz2 \
            file://sigmask.patch \
           "
-- 
1.7.6.1




