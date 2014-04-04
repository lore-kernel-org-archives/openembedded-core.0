Return-Path: <alexandru.sardan@freescale.com>
Received: from tx2outboundpool.messaging.microsoft.com
	(tx2ehsobe002.messaging.microsoft.com [65.55.88.12])
	by mail.openembedded.org (Postfix) with ESMTP id F16546B8D0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Apr 2014 11:07:32 +0000 (UTC)
Received: from mail101-tx2-R.bigfish.com (10.9.14.227) by
	TX2EHSOBE003.bigfish.com (10.9.40.23) with Microsoft SMTP Server id
	14.1.225.22; Fri, 4 Apr 2014 11:07:29 +0000
Received: from mail101-tx2 (localhost [127.0.0.1])	by
	mail101-tx2-R.bigfish.com (Postfix) with ESMTP id D322E4A0291;
	Fri,  4 Apr 2014 11:07:28 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h2148h1ee6h1de0h1fdah2073h2146h1202h1e76h2189h1d1ah1d2ah21bch1fc6h208chzz1de098h8275bh1de097hz2dh2a8h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh2222h224fh1fb3h1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1fe8h1ff5h2218h2216h226dh22d0h24afh2327h2336h2438h2461h2487h24d7h2516h2545h255eh25cch25f6h2605h268bh26d3h1155h)
Received: from mail101-tx2 (localhost.localdomain [127.0.0.1]) by mail101-tx2
	(MessageSwitch) id 1396609647545438_6981;
	Fri,  4 Apr 2014 11:07:27 +0000 (UTC)
Received: from TX2EHSMHS044.bigfish.com (unknown [10.9.14.225])	by
	mail101-tx2.bigfish.com (Postfix) with ESMTP id 80CEF8012E;
	Fri,  4 Apr 2014 11:07:27 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS044.bigfish.com
	(10.9.99.144) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Fri, 4 Apr 2014 11:07:27 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Fri, 4 Apr 2014 11:07:29 +0000
Received: from fsr-ub1264-102.ea.freescale.net
	(fsr-ub1264-102.ea.freescale.net [10.171.74.5])	by
	az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id s34B7O2E031352;
	Fri, 4 Apr 2014 04:07:24 -0700
From: Alexandru-Cezar Sardan <alexandru.sardan@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 4 Apr 2014 14:06:54 +0300
Message-ID: <1396609614-25653-1-git-send-email-alexandru.sardan@freescale.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
X-FOPE-CONNECTOR: Id%0$Dn%FREESCALE.MAIL.ONMICROSOFT.COM$RO%1$TLS%0$FQDN%$TlsDn%
Subject: [PATCH] gcc: enable multilib setup for powerpc64 arch
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
X-List-Received-Date: Fri, 04 Apr 2014 11:07:33 -0000
Content-Type: text/plain

Signed-off-by: Alexandru-Cezar Sardan <alexandru.sardan@freescale.com>
---
 meta/recipes-devtools/gcc/gcc-multilib-config.inc |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-multilib-config.inc b/meta/recipes-devtools/gcc/gcc-multilib-config.inc
index 30745a6..1eafeb4 100644
--- a/meta/recipes-devtools/gcc/gcc-multilib-config.inc
+++ b/meta/recipes-devtools/gcc/gcc-multilib-config.inc
@@ -109,6 +109,7 @@ python gcc_multilib_setup() {
         'i586'      : ['gcc/config/i386/t-linux64'],
         'mips'      : ['gcc/config/mips/t-linux64'],
         'powerpc'   : ['gcc/config/rs6000/t-linux64'],
+        'powerpc64' : ['gcc/config/rs6000/t-linux64'],
     }
 
     gcc_header_config_files = {
@@ -116,6 +117,7 @@ python gcc_multilib_setup() {
         'i586'      : ['gcc/config/i386/linux64.h'],
         'mips'      : ['gcc/config/mips/linux64.h'],
         'powerpc'   : ['gcc/config/rs6000/linux64.h'],
+        'powerpc64' : ['gcc/config/rs6000/linux64.h'],
     }
 
     target_arch = (d.getVar('TARGET_ARCH_MULTILIB_ORIGINAL', True) if mlprefix
-- 
1.7.9.5



