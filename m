Received: from ch1ehsobe004.messaging.microsoft.com ([216.32.181.184]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RRAXi-0000k3-Hq
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Nov 2011 23:34:50 +0100
Received: from mail130-ch1-R.bigfish.com (10.43.68.240) by
	CH1EHSOBE014.bigfish.com (10.43.70.64) with Microsoft SMTP Server id
	14.1.225.22; Thu, 17 Nov 2011 22:27:50 +0000
Received: from mail130-ch1 (localhost [127.0.0.1])	by
	mail130-ch1-R.bigfish.com (Postfix) with ESMTP id 1ACA3400EA	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2011 22:28:21 +0000 (UTC)
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bhz2dh2a8h668h839h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail130-ch1 (localhost.localdomain [127.0.0.1]) by mail130-ch1
	(MessageSwitch) id 132156889928063_25889;
	Thu, 17 Nov 2011 22:28:19 +0000 (UTC)
Received: from CH1EHSMHS010.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.254])	by mail130-ch1.bigfish.com (Postfix) with ESMTP id
	ED1A7200043	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2011 22:28:18 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS010.bigfish.com
	(10.43.70.10) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Thu, 17 Nov 2011 22:27:48 +0000
Received: from az33smr02.freescale.net (10.64.34.200) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server id 14.1.339.2; Thu, 17 Nov 2011 16:28:21 -0600
Received: from right.am.freescale.net (right.am.freescale.net [10.82.193.13])
	by az33smr02.freescale.net (8.13.1/8.13.0) with ESMTP id
	pAHMSKE9025772	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2011 16:28:20 -0600 (CST)
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 17 Nov 2011 16:28:20 -0600
Message-ID: <1321568900-19406-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.6.1
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH] Remove EGLIBPARALLELISM from deps for EXTRA_OEMAKE
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
X-List-Received-Date: Thu, 17 Nov 2011 22:34:50 -0000
Content-Type: text/plain

Without this simply changing the number of threads via
PARALLEL_MAKE can invalidate sstate-cache

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta/recipes-core/eglibc/eglibc.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-core/eglibc/eglibc.inc b/meta/recipes-core/eglibc/eglibc.inc
index fe9f8ba..272fcb6 100644
--- a/meta/recipes-core/eglibc/eglibc.inc
+++ b/meta/recipes-core/eglibc/eglibc.inc
@@ -40,6 +40,7 @@ ARM_INSTRUCTION_SET = "arm"
 # eglibc uses PARALLELMFLAGS variable to pass parallel build info so transfer
 # PARALLEL_MAKE into PARALLELMFLAGS and empty out PARALLEL_MAKE
 EGLIBCPARALLELISM := "PARALLELMFLAGS="${PARALLEL_MAKE}""
+EXTRA_OEMAKE[vardepsexclude] += "EGLIBCPARALLELISM"
 EXTRA_OEMAKE += ${EGLIBCPARALLELISM}
 PARALLEL_MAKE = ""
 
-- 
1.7.6.1




