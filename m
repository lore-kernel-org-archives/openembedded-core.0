Return-Path: <Lauren.Post@freescale.com>
Received: from co9outboundpool.messaging.microsoft.com
	(co9ehsobe002.messaging.microsoft.com [207.46.163.25])
	by mail.openembedded.org (Postfix) with ESMTP id F1C4E6E8A2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Mar 2014 22:04:17 +0000 (UTC)
Received: from mail178-co9-R.bigfish.com (10.236.132.243) by
	CO9EHSOBE034.bigfish.com (10.236.130.97) with Microsoft SMTP Server id
	14.1.225.22; Fri, 7 Mar 2014 22:04:18 +0000
Received: from mail178-co9 (localhost [127.0.0.1])	by
	mail178-co9-R.bigfish.com (Postfix) with ESMTP id 0160E5E047A	for
	<openembedded-core@lists.openembedded.org>;
	Fri,  7 Mar 2014 22:04:18 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h2148h208ch1ee6h1de0h1fdah2073h2146h1202h1e76h2189h1d1ah1d2ah21bch1fc6hzz1de098h8275bh8275dh1de097hz2dh2a8h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh2222h224fh1fb3h1d0ch1d2eh1d3fh1dfeh1dffh1e23h1fe8h1ff5h2218h2216h226dh22d0h24afh2327h2336h2438h2461h2487h24d7h2516h2545h255eh25cch25f6h2605h1155h)
Received: from mail178-co9 (localhost.localdomain [127.0.0.1]) by mail178-co9
	(MessageSwitch) id 1394229856798445_28459;
	Fri,  7 Mar 2014 22:04:16 +0000 (UTC)
Received: from CO9EHSMHS028.bigfish.com (unknown [10.236.132.240])	by
	mail178-co9.bigfish.com (Postfix) with ESMTP id B465F5C00A5;
	Fri,  7 Mar 2014 22:04:16 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO9EHSMHS028.bigfish.com
	(10.236.130.38) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Fri, 7 Mar 2014 22:04:16 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-005.039d.mgd.msft.net (10.84.1.17) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Fri, 7 Mar 2014 22:04:15 +0000
Received: from neo.am.freescale.net (neo.am.freescale.net [10.81.16.89])	by
	az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id s27M4BJ5017769;
	Fri, 7 Mar 2014 15:04:15 -0700
From: Lauren Post <lauren.post@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 7 Mar 2014 15:52:43 -0600
Message-ID: <1394229163-28529-1-git-send-email-lauren.post@freescale.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <lauren.post@freescale.com>
References: <lauren.post@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
X-FOPE-CONNECTOR: Id%0$Dn%FREESCALE.MAIL.ONMICROSOFT.COM$RO%1$TLS%0$FQDN%$TlsDn%
Subject: [PATCH] mtd-utils: Update version to include fixes after 1.5.0
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
X-List-Received-Date: Fri, 07 Mar 2014 22:04:20 -0000
Content-Type: text/plain

This includes fixes on master branch not in the 1.5.0 release

Signed-off-by: Lauren Post <lauren.post@freescale.com>
---
 .../add-exclusion-to-mkfs-jffs2-git-2.patch        |    0
 ...t-cleanmarker-with-flash_erase--j-command.patch |    0
 .../mtd/{mtd-utils_1.5.0.bb => mtd-utils_git.bb}   |   11 ++++++-----
 3 files changed, 6 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/mtd/{mtd-utils-1.5.0 => mtd-utils}/add-exclusion-to-mkfs-jffs2-git-2.patch (100%)
 rename meta/recipes-devtools/mtd/{mtd-utils-1.5.0 => mtd-utils}/mtd-utils-fix-corrupt-cleanmarker-with-flash_erase--j-command.patch (100%)
 rename meta/recipes-devtools/mtd/{mtd-utils_1.5.0.bb => mtd-utils_git.bb} (83%)

diff --git a/meta/recipes-devtools/mtd/mtd-utils-1.5.0/add-exclusion-to-mkfs-jffs2-git-2.patch b/meta/recipes-devtools/mtd/mtd-utils/add-exclusion-to-mkfs-jffs2-git-2.patch
similarity index 100%
rename from meta/recipes-devtools/mtd/mtd-utils-1.5.0/add-exclusion-to-mkfs-jffs2-git-2.patch
rename to meta/recipes-devtools/mtd/mtd-utils/add-exclusion-to-mkfs-jffs2-git-2.patch
diff --git a/meta/recipes-devtools/mtd/mtd-utils-1.5.0/mtd-utils-fix-corrupt-cleanmarker-with-flash_erase--j-command.patch b/meta/recipes-devtools/mtd/mtd-utils/mtd-utils-fix-corrupt-cleanmarker-with-flash_erase--j-command.patch
similarity index 100%
rename from meta/recipes-devtools/mtd/mtd-utils-1.5.0/mtd-utils-fix-corrupt-cleanmarker-with-flash_erase--j-command.patch
rename to meta/recipes-devtools/mtd/mtd-utils/mtd-utils-fix-corrupt-cleanmarker-with-flash_erase--j-command.patch
diff --git a/meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb b/meta/recipes-devtools/mtd/mtd-utils_git.bb
similarity index 83%
rename from meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb
rename to meta/recipes-devtools/mtd/mtd-utils_git.bb
index 94940f8..f1e2a8e 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
@@ -6,14 +6,15 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
                     file://include/common.h;beginline=1;endline=17;md5=ba05b07912a44ea2bf81ce409380049c"
 
-SRCREV = "ca39eb1d98e736109c64ff9c1aa2a6ecca222d8f"
+# Use the latest version at 26 Oct, 2013
+SRCREV = "dcea43eba91642939c82739387147da26d572758"
 SRC_URI = "git://git.infradead.org/mtd-utils.git \
-           file://add-exclusion-to-mkfs-jffs2-git-2.patch \
-           file://mtd-utils-fix-corrupt-cleanmarker-with-flash_erase--j-command.patch "
+		file://add-exclusion-to-mkfs-jffs2-git-2.patch \
+"
 
-S = "${WORKDIR}/git/"
+PV = "1.5.0+git${SRCPV}"
 
-PR = "r3"
+S = "${WORKDIR}/git/"
 
 EXTRA_OEMAKE = "'CC=${CC}' 'RANLIB=${RANLIB}' 'AR=${AR}' 'CFLAGS=${CFLAGS} -I${S}/include -DWITHOUT_XATTR' 'BUILDDIR=${S}'"
 
-- 
1.7.9.5



