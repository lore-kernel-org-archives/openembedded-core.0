Return-Path: <B40290@freescale.com>
Received: from tx2outboundpool.messaging.microsoft.com
	(tx2ehsobe004.messaging.microsoft.com [65.55.88.14])
	by mail.openembedded.org (Postfix) with ESMTP id 873936BA1D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 08:47:16 +0000 (UTC)
Received: from mail46-tx2-R.bigfish.com (10.9.14.227) by
	TX2EHSOBE009.bigfish.com (10.9.40.29) with Microsoft SMTP Server id
	14.1.225.22; Fri, 28 Mar 2014 08:47:16 +0000
Received: from mail46-tx2 (localhost [127.0.0.1])	by mail46-tx2-R.bigfish.com
	(Postfix) with ESMTP id F343616029E	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 08:47:15 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zze0eahzz1f42h2148h208ch1ee6h1de0h1fdah2073h2146h1202h1e76h2189h1d1ah1d2ah21bch1fc6hzz1de098h8275bh1de097hz2dh2a8h839he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh2222h224fh1fb3h1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1fe8h1ff5h2218h2216h226dh22d0h24afh2327h2336h2438h2461h2487h24d7h2516h2545h255eh25cch25f6h2605h268bh1155h)
Received: from mail46-tx2 (localhost.localdomain [127.0.0.1]) by mail46-tx2
	(MessageSwitch) id 1395996433717429_409; Fri, 28 Mar 2014 08:47:13 +0000
	(UTC)
Received: from TX2EHSMHS027.bigfish.com (unknown [10.9.14.243])	by
	mail46-tx2.bigfish.com (Postfix) with ESMTP id A137F220031;
	Fri, 28 Mar 2014 08:47:13 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS027.bigfish.com
	(10.9.99.127) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Fri, 28 Mar 2014 08:47:13 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Fri, 28 Mar 2014 08:47:12 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.136])	by
	tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	s2S8l9JF019199; Fri, 28 Mar 2014 01:47:11 -0700
From: Chunrong Guo <B40290@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 28 Mar 2014 16:47:05 +0800
Message-ID: <1395996425-29821-1-git-send-email-B40290@freescale.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
X-FOPE-CONNECTOR: Id%0$Dn%FREESCALE.MAIL.ONMICROSOFT.COM$RO%1$TLS%0$FQDN%$TlsDn%
Subject: [PATCH v2] coreutils: fix search paths for libstdbuf.so
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
X-List-Received-Date: Fri, 28 Mar 2014 08:47:16 -0000
Content-Type: text/plain

       *fix the following error:
        |stdbuf: failed to find 'libstdbuf.so'
        *PKGLIBEXECDIR is the search paths for libstdbuf.so
        |PKGLIBEXECDIR='$(pkglibexecdir)'
        |pkglibexecdir='${libexecdir}/${PACKAGE}'

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 meta/recipes-core/coreutils/coreutils_8.22.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-core/coreutils/coreutils_8.22.bb b/meta/recipes-core/coreutils/coreutils_8.22.bb
index a26aa02..ba3a0a0 100644
--- a/meta/recipes-core/coreutils/coreutils_8.22.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.22.bb
@@ -22,7 +22,7 @@ SRC_URI[md5sum] = "8fb0ae2267aa6e728958adc38f8163a2"
 SRC_URI[sha256sum] = "5b3e94998152c017e6c75d56b9b994188eb71bf46d4038a642cb9141f6ff1212"
 
 EXTRA_OECONF_class-native = "--without-gmp"
-EXTRA_OECONF_class-target = "--enable-install-program=arch"
+EXTRA_OECONF_class-target = "--enable-install-program=arch --libexecdir=${libdir}"
 
 # acl is not a default feature
 #
@@ -71,8 +71,6 @@ do_install_append() {
 	# in update-alternatives to fail, therefore use lbracket - the name used
 	# for the actual source file.
 	mv ${D}${bindir}/[ ${D}${bindir}/lbracket.${BPN}
-	install -d ${D}${libdir}/coreutils
-	mv ${D}${libexecdir}/coreutils/libstdbuf.so ${D}${libdir}/coreutils
 }
 
 inherit update-alternatives
-- 
1.8.3.2



