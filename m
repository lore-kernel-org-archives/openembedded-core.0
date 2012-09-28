Received: from mail-tx2.bigfish.com ([65.55.88.10]
	helo=tx2outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1THPej-0004sK-3F
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Sep 2012 03:46:17 +0200
Received: from mail268-tx2-R.bigfish.com (10.9.14.248) by
	TX2EHSOBE001.bigfish.com (10.9.40.21) with Microsoft SMTP Server id
	14.1.225.23; Fri, 28 Sep 2012 01:33:24 +0000
Received: from mail268-tx2 (localhost [127.0.0.1])	by
	mail268-tx2-R.bigfish.com (Postfix) with ESMTP id EEE4A1F000D6	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 28 Sep 2012 01:33:23 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 14
X-BigFish: VS14(z52aeszzz1202h1d1ah1d2ah1082kzz8275bhz2dh2a8h668h839hd24he5bhf0ah107ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1155h)
Received: from mail268-tx2 (localhost.localdomain [127.0.0.1]) by mail268-tx2
	(MessageSwitch) id 1348796001959839_25632;
	Fri, 28 Sep 2012 01:33:21 +0000 (UTC)
Received: from TX2EHSMHS001.bigfish.com (unknown [10.9.14.239])	by
	mail268-tx2.bigfish.com (Postfix) with ESMTP id E8982600044	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 28 Sep 2012 01:33:21 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS001.bigfish.com
	(10.9.99.101) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 28 Sep 2012 01:33:21 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server (TLS) id 14.2.309.3; Thu, 27 Sep 2012 20:33:21 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.176.228])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	q8S1XJaM007331 for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2012 18:33:20 -0700
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 27 Sep 2012 20:33:09 -0500
Message-ID: <1348795994-21695-5-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.9.7
In-Reply-To: <1348795994-21695-1-git-send-email-msm@freescale.com>
References: <1348795994-21695-1-git-send-email-msm@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH v2 05/10] arch-powerpc.inc: add altivec as a valid tune feature
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
X-List-Received-Date: Fri, 28 Sep 2012 01:46:17 -0000
Content-Type: text/plain

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
v2: no changes

This patch and the others should fix Yocto bug #3072

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




