Received: from tx2ehsobe003.messaging.microsoft.com ([65.55.88.13]
	helo=TX2EHSOBE005.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1S0SQe-0006G6-0w
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 07:45:24 +0100
Received: from mail82-tx2-R.bigfish.com (10.9.14.249) by
	TX2EHSOBE005.bigfish.com (10.9.40.25) with Microsoft SMTP Server id
	14.1.225.23; Thu, 23 Feb 2012 06:21:52 +0000
Received: from mail82-tx2 (localhost [127.0.0.1])	by mail82-tx2-R.bigfish.com
	(Postfix) with ESMTP id 271DD140114	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 06:21:52 +0000 (UTC)
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bhz2dh2a8h668h839h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail82-tx2 (localhost.localdomain [127.0.0.1]) by mail82-tx2
	(MessageSwitch) id 1329978110499086_21885;
	Thu, 23 Feb 2012 06:21:50 +0000 (UTC)
Received: from TX2EHSMHS023.bigfish.com (unknown [10.9.14.245])	by
	mail82-tx2.bigfish.com (Postfix) with ESMTP id 75862240046	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 06:21:50 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS023.bigfish.com
	(10.9.99.123) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 23 Feb 2012 06:21:50 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server (TLS) id 14.1.355.3; Thu, 23 Feb 2012 00:21:52 -0600
Received: from right.am.freescale.net (right.am.freescale.net [10.82.193.13])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	q1N6LnqS006062 for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2012 23:21:52 -0700
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Feb 2012 00:21:48 -0600
Message-ID: <1329978109-642-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.6.1
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH 1/2] arch-powerpc{, 64}.inc: update/add PACKAGE_EXTRA_ARCHS for powerpc/powerpc64
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
X-List-Received-Date: Thu, 23 Feb 2012 06:45:25 -0000
Content-Type: text/plain

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta/conf/machine/include/powerpc/arch-powerpc.inc |    4 +---
 .../machine/include/powerpc/arch-powerpc64.inc     |    1 +
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/conf/machine/include/powerpc/arch-powerpc.inc b/meta/conf/machine/include/powerpc/arch-powerpc.inc
index 8347f86..c9b2829 100644
--- a/meta/conf/machine/include/powerpc/arch-powerpc.inc
+++ b/meta/conf/machine/include/powerpc/arch-powerpc.inc
@@ -30,6 +30,4 @@ BASE_LIB_tune-powerpc-nf = "lib"
 PACKAGE_EXTRA_ARCHS_tune-powerpc-nf = "powerpc-nf"
 TUNE_FEATURES_tune-powerpc ?= "m32 fpu-hard"
 BASE_LIB_tune-powerpc = "lib"
-PACKAGE_EXTRA_ARCHS_tune-powerpc = "${PACKAGE_EXTRA_ARCHS_tune-powerpc-nf} powerpc"
-
-
+PACKAGE_EXTRA_ARCHS_tune-powerpc = "powerpc"
diff --git a/meta/conf/machine/include/powerpc/arch-powerpc64.inc b/meta/conf/machine/include/powerpc/arch-powerpc64.inc
index 7ef8ddc..48cd08e 100644
--- a/meta/conf/machine/include/powerpc/arch-powerpc64.inc
+++ b/meta/conf/machine/include/powerpc/arch-powerpc64.inc
@@ -10,3 +10,4 @@ TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", [ "m64" ], "powerpc64", "",
 AVAILTUNES += "powerpc64"
 TUNE_FEATURES_tune-powerpc64 ?= "m64 fpu-hard"
 BASE_LIB_tune-powerpc64 = "lib64"
+PACKAGE_EXTRA_ARCHS_tune-powerpc64 = "powerpc64"
-- 
1.7.6.1




