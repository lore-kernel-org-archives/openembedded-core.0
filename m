Received: from am1ehsobe003.messaging.microsoft.com ([213.199.154.206]
	helo=AM1EHSOBE003.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RV8li-0000Or-9T
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Nov 2011 22:29:42 +0100
Received: from mail89-am1-R.bigfish.com (10.3.201.254) by
	AM1EHSOBE003.bigfish.com (10.3.204.23) with Microsoft SMTP Server id
	14.1.225.22; Mon, 28 Nov 2011 21:22:15 +0000
Received: from mail89-am1 (localhost [127.0.0.1])	by mail89-am1-R.bigfish.com
	(Postfix) with ESMTP id 1FAC420030B	for
	<openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2011 21:22:14 +0000 (UTC)
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bhz2dh2a8h668h839h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 0,13,
Received: from mail89-am1 (localhost.localdomain [127.0.0.1]) by mail89-am1
	(MessageSwitch) id 1322515327330445_15927;
	Mon, 28 Nov 2011 21:22:07 +0000 (UTC)
Received: from AM1EHSMHS009.bigfish.com (unknown [10.3.201.245])	by
	mail89-am1.bigfish.com (Postfix) with ESMTP id 38B40C0047	for
	<openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2011 21:22:07 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS009.bigfish.com
	(10.3.207.109) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Mon, 28 Nov 2011 21:22:04 +0000
Received: from az33smr02.freescale.net (10.64.34.200) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server id 14.1.339.2; Mon, 28 Nov 2011 15:22:49 -0600
Received: from right.am.freescale.net (right.am.freescale.net [10.82.193.13])
	by az33smr02.freescale.net (8.13.1/8.13.0) with ESMTP id
	pASLMndo022405	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2011 15:22:49 -0600 (CST)
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 28 Nov 2011 15:22:47 -0600
Message-ID: <1322515367-22100-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <1322070364.15626.17.camel@ted>
References: <1322070364.15626.17.camel@ted>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH] rpm_5.4.0.bb: Build rpm without xz
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
X-List-Received-Date: Mon, 28 Nov 2011 21:29:42 -0000
Content-Type: text/plain

This fixes the following issue:

Log data follows:
| NOTE: Creating RPM package for perf-dbg
| NOTE: Creating RPM package for perf
| NOTE: Creating EMPTY RPM Package for kernel
| NOTE: Creating EMPTY RPM Package for kernel-3.0.9-00348-gec4b357
| NOTE: Creating RPM package for kernel-image-3.0.9-00348-gec4b357
| NOTE: Creating RPM package for kernel-dev
| NOTE: Creating RPM package for kernel-vmlinux
| NOTE: Not creating empty RPM package for kernel-misc
| NOTE: Creating RPM package for kernel-devicetree
| NOTE: Creating RPM package for kernel-module-libcrc32c
| NOTE: Creating RPM package for kernel-module-crc-itu-t
| NOTE: Creating RPM package for kernel-module-sctp
| NOTE: Creating RPM package for kernel-module-pcbc
| NOTE: Creating RPM package for kernel-module-crc32c
| NOTE: Creating RPM package for kernel-module-binfmt-misc
| NOTE: Creating RPM package for kernel-module-nfsd
| NOTE: Creating RPM package for kernel-module-exportfs
| NOTE: Creating RPM package for kernel-module-msdos
| NOTE: Creating RPM package for kernel-module-nls-utf8
| NOTE: Creating RPM package for kernel-module-udf
| NOTE: Creating RPM package for kernel-module-isofs
| NOTE: Creating RPM package for kernel-module-usbhid
| NOTE: Creating RPM package for kernel-module-scsi-wait-scan
| NOTE: Creating EMPTY RPM Package for kernel-modules
| /local/home/mattsm/git/fsl-local-sdk/build_p4080ds_release/tmp/sysroots/x86_64-linux/usr/bin/rpmbuild.real: error while loading shared libraries: liblzma.so.5: cannot open shared object file: No such file or directory
| ERROR: Function 'BUILDSPEC' failed (see /local/home/mattsm/git/fsl-local-sdk/build_p4080ds_release/tmp/work/p4080ds-fsl-linux/linux-qoriq-sdk-3.0.6-r2/temp/log.do_package_write_rpm.18943 for further information)

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
v2: changed from having xz in deps to just disabling xz

 meta/recipes-devtools/rpm/rpm_5.4.0.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpm_5.4.0.bb b/meta/recipes-devtools/rpm/rpm_5.4.0.bb
index f8fe836..77f0aba 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.0.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.0.bb
@@ -45,7 +45,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
 DEPENDS = "bzip2 zlib db openssl elfutils expat libpcre attr acl popt ${extrarpmdeps}"
 extrarpmdeps = "python perl"
 extrarpmdeps_virtclass-native = "file-native"
-PR = "r23"
+PR = "r24"
 
 # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It is needed
 # in order to extract the distribution SRPM into a format we can extract...
@@ -156,6 +156,7 @@ EXTRA_OECONF = "--verbose \
 		--with-build-extlibdep \
 		--with-build-maxextlibdep \
 		--without-valgrind \
+		--without-xz \
 		--disable-openmp \
 		--enable-build-pic \
 		--enable-build-versionscript \
-- 
1.7.6.1




