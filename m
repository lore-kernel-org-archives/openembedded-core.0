Return-Path: <Zongchun.Yu@freescale.com>
Received: from ch1outboundpool.messaging.microsoft.com
	(ch1ehsobe005.messaging.microsoft.com [216.32.181.185])
	by mail.openembedded.org (Postfix) with ESMTP id C90FE605F4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Apr 2014 06:06:49 +0000 (UTC)
Received: from mail86-ch1-R.bigfish.com (10.43.68.230) by
	CH1EHSOBE005.bigfish.com (10.43.70.55) with Microsoft SMTP Server id
	14.1.225.22; Tue, 1 Apr 2014 06:06:47 +0000
Received: from mail86-ch1 (localhost [127.0.0.1])	by mail86-ch1-R.bigfish.com
	(Postfix) with ESMTP id 31599320560	for
	<openembedded-core@lists.openembedded.org>;
	Tue,  1 Apr 2014 06:06:47 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h208ch1ee6h1de0h1fdah2073h2146h1202h1e76h2189h1d1ah1d2ah21a7h1fc6hzz1de098h8275bh1de097hz2dh2a8h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h1354h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh2222h224fh1fb3h1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1fe8h1ff5h2218h2216h226dh22d0h24afh2327h2336h2438h2461h2487h24d7h2516h2545h255eh25cch25f6h2605h268bh1155h)
Received: from mail86-ch1 (localhost.localdomain [127.0.0.1]) by mail86-ch1
	(MessageSwitch) id 1396332405592998_18459;
	Tue,  1 Apr 2014 06:06:45 +0000 (UTC)
Received: from CH1EHSMHS014.bigfish.com (snatpool3.int.messaging.microsoft.com
	[10.43.68.227])	by mail86-ch1.bigfish.com (Postfix) with ESMTP id
	8B40B420095;	Tue,  1 Apr 2014 06:06:45 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS014.bigfish.com
	(10.43.70.14) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Tue, 1 Apr 2014 06:06:45 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-005.039d.mgd.msft.net (10.84.1.17) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Tue, 1 Apr 2014 06:06:42 +0000
Received: from localhost.localdomain (b40527-01.ap.freescale.net
	[10.193.20.90])	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with
	ESMTP id s3166Z3S004074;	Mon, 31 Mar 2014 23:06:40 -0700
From: <b40527@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 1 Apr 2014 14:12:54 +0800
Message-ID: <1396332774-31033-1-git-send-email-b40527@freescale.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
X-FOPE-CONNECTOR: Id%0$Dn%FREESCALE.MAIL.ONMICROSOFT.COM$RO%1$TLS%0$FQDN%$TlsDn%
Cc: Zongchun Yu <Zongchun.Yu@freescale.com>
Subject: [PATCH] libtool: Add depends on binutils-cross
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
X-List-Received-Date: Tue, 01 Apr 2014 06:06:51 -0000
Content-Type: text/plain

From: Zongchun Yu <Zongchun.Yu@freescale.com>

When use command bitbake -c populate_sdk <target-rootfs> to
generate toolchain. a race issue may occur. in this case need
to add binutils-cross to depends.

Signed-off-by: Zongchun Yu <Zongchun.Yu@freescale.com>
---
 meta/recipes-devtools/libtool/libtool-2.4.2.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/libtool/libtool-2.4.2.inc b/meta/recipes-devtools/libtool/libtool-2.4.2.inc
index d26982d..0868dd7 100644
--- a/meta/recipes-devtools/libtool/libtool-2.4.2.inc
+++ b/meta/recipes-devtools/libtool/libtool-2.4.2.inc
@@ -36,7 +36,7 @@ do_compile_prepend () {
 inherit autotools
 EXTRA_AUTORECONF = "--exclude=libtoolize"
 
-DEPENDS = "libtool-native"
+DEPENDS = "libtool-native binutils-cross"
 
 PACKAGES =+ "libltdl libltdl-dev libltdl-dbg libltdl-staticdev"
 FILES_${PN} += "${datadir}/aclocal"
-- 
1.7.0.4



