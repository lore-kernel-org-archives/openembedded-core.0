Received: from ch1ehsobe006.messaging.microsoft.com ([216.32.181.186]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1TE6Oj-00009g-Oz
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 00:36:05 +0200
Received: from mail164-ch1-R.bigfish.com (10.43.68.235) by
	CH1EHSOBE011.bigfish.com (10.43.70.61) with Microsoft SMTP Server id
	14.1.225.23; Tue, 18 Sep 2012 22:08:17 +0000
Received: from mail164-ch1 (localhost [127.0.0.1])	by
	mail164-ch1-R.bigfish.com (Postfix) with ESMTP id DF4C420175	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2012 22:08:17 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 14
X-BigFish: VS14(z52aeszzz1202h1d1ah1d2ah1082kzz8275bhz2dh2a8h668h839hd24he5bhf0ah107ah1288h12a5h12a9h12bdh12e5h1155h)
Received: from mail164-ch1 (localhost.localdomain [127.0.0.1]) by mail164-ch1
	(MessageSwitch) id 1348006094935116_18484;
	Tue, 18 Sep 2012 22:08:14 +0000 (UTC)
Received: from CH1EHSMHS003.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.253])	by mail164-ch1.bigfish.com (Postfix) with ESMTP id
	E15B84E0047	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2012 22:08:14 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS003.bigfish.com
	(10.43.70.3) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 18 Sep 2012 22:08:14 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server (TLS) id 14.2.309.3; Tue, 18 Sep 2012 17:08:14 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.176.228])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	q8IM8BJL013889 for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2012 15:08:12 -0700
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 18 Sep 2012 17:08:07 -0500
Message-ID: <1348006091-14992-3-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.9.7
In-Reply-To: <1348006091-14992-1-git-send-email-msm@freescale.com>
References: <1348006091-14992-1-git-send-email-msm@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH] arch-powerpc.inc: add altivec as a valid tune feature
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Sep 2012 22:36:06 -0000
Content-Type: text/plain

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta/conf/machine/include/powerpc/arch-powerpc.inc |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/machine/include/powerpc/arch-powerpc.inc b/meta/conf/machine/include/powerpc/arch-powerpc.inc
index 12909d9..ae81cde 100644
--- a/meta/conf/machine/include/powerpc/arch-powerpc.inc
+++ b/meta/conf/machine/include/powerpc/arch-powerpc.inc
@@ -19,6 +19,8 @@ TUNEVALID[fpu-soft] = "Use software FPU."
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "fpu-soft", "-msoft-float", "", d)}"
 TARGET_FPU .= "${@bb.utils.contains("TUNE_FEATURES", "fpu-soft", "soft", "", d)}"
 
+TUNEVALID[altivec] = "Altivec"
+
 # Basic tune definitions
 AVAILTUNES += "powerpc powerpc-nf" 
 TUNE_FEATURES_tune-powerpc-nf = "m32 fpu-soft"
-- 
1.7.9.7




