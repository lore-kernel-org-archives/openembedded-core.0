Received: from co1ehsobe004.messaging.microsoft.com ([216.32.180.187]
	helo=co1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1Spktt-0004MF-Mi
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Jul 2012 20:47:38 +0200
Received: from mail167-co1-R.bigfish.com (10.243.78.236) by
	CO1EHSOBE010.bigfish.com (10.243.66.73) with Microsoft SMTP Server id
	14.1.225.23; Fri, 13 Jul 2012 18:36:21 +0000
Received: from mail167-co1 (localhost [127.0.0.1])	by
	mail167-co1-R.bigfish.com (Postfix) with ESMTP id 867D7D40205	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 13 Jul 2012 18:36:21 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bhz2dh2a8h668h839hd24he5bhf0ah107ah)
Received: from mail167-co1 (localhost.localdomain [127.0.0.1]) by mail167-co1
	(MessageSwitch) id 1342204579705132_26874;
	Fri, 13 Jul 2012 18:36:19 +0000 (UTC)
Received: from CO1EHSMHS008.bigfish.com (unknown [10.243.78.242])	by
	mail167-co1.bigfish.com (Postfix) with ESMTP id A9E29A80044	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 13 Jul 2012 18:36:19 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS008.bigfish.com
	(10.243.66.18) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 13 Jul 2012 18:36:19 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server (TLS) id 14.2.298.5; Fri, 13 Jul 2012 13:36:18 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.176.228])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	q6DIaH8K018883 for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jul 2012 11:36:18 -0700
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 13 Jul 2012 13:36:17 -0500
Message-ID: <1342204577-9605-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.10
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH] gcc-package-runtime.inc: Fix QA warning
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
X-List-Received-Date: Fri, 13 Jul 2012 18:47:38 -0000
Content-Type: text/plain

> ERROR: QA Issue: gcc-runtime: Files/directories were installed but not shipped
>   /usr/lib/libgomp.so.1.0.0
>   /usr/lib/libgomp.so.1

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta/recipes-devtools/gcc/gcc-4.7.inc             |    2 +-
 meta/recipes-devtools/gcc/gcc-package-runtime.inc |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-4.7.inc b/meta/recipes-devtools/gcc/gcc-4.7.inc
index 0e40533..b3012d7 100644
--- a/meta/recipes-devtools/gcc/gcc-4.7.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.7.inc
@@ -1,6 +1,6 @@
 require gcc-common.inc
 
-PR = "r5"
+PR = "r6"
 
 # Third digit in PV should be incremented after a minor release
 # happens from this branch on gcc e.g. currently its 4.7.1
diff --git a/meta/recipes-devtools/gcc/gcc-package-runtime.inc b/meta/recipes-devtools/gcc/gcc-package-runtime.inc
index a81e3b7..6c77fc3 100644
--- a/meta/recipes-devtools/gcc/gcc-package-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-package-runtime.inc
@@ -65,7 +65,7 @@ FILES_libmudflap-dev = "\
   ${libdir}/libmudflap*.la"
 
 FILES_libgomp-dev = "\
-  ${libdir}/libgomp*.so \
+  ${libdir}/libgomp*.so* \
   ${libdir}/libgomp*.la \
   ${libdir}/libgomp.spec \
   ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/omp.h \
-- 
1.7.10




