Received: from db3ehsobe001.messaging.microsoft.com ([213.199.154.139]
	helo=DB3EHSOBE001.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1R98Cw-0000GA-U0
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Sep 2011 06:26:50 +0200
Received: from mail25-db3-R.bigfish.com (10.3.81.246) by
	DB3EHSOBE001.bigfish.com (10.3.84.21) with Microsoft SMTP Server id
	14.1.225.22; Thu, 29 Sep 2011 04:21:20 +0000
Received: from mail25-db3 (localhost.localdomain [127.0.0.1])	by
	mail25-db3-R.bigfish.com (Postfix) with ESMTP id 1D606190314	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2011 04:21:20 +0000 (UTC)
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bhz2dh2a8h668h839h64h)
X-Spam-TCS-SCL: 3:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail25-db3 (localhost.localdomain [127.0.0.1]) by mail25-db3
	(MessageSwitch) id 131727007931542_11766;
	Thu, 29 Sep 2011 04:21:19 +0000 (UTC)
Received: from DB3EHSMHS014.bigfish.com (unknown [10.3.81.245])	by
	mail25-db3.bigfish.com (Postfix) with ESMTP id E5D82748058	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2011 04:21:18 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS014.bigfish.com
	(10.3.87.114) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Thu, 29 Sep 2011 04:21:15 +0000
Received: from az33smr01.freescale.net (10.64.34.199) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server id 14.1.323.7; Wed, 28 Sep 2011 23:21:13 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.193.13])
	by az33smr01.freescale.net (8.13.1/8.13.0) with ESMTP id
	p8T4LAKv024559	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2011 23:21:13 -0500 (CDT)
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 28 Sep 2011 23:21:02 -0500
Message-ID: <1317270070-14250-8-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <1317270070-14250-1-git-send-email-msm@freescale.com>
References: <1317270070-14250-1-git-send-email-msm@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH 08/16] Fixup kexec-tools compatible host for powerpc
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
X-List-Received-Date: Thu, 29 Sep 2011 04:26:51 -0000
Content-Type: text/plain

kexec does infact work and build on powerpc, enable the compatible
host for these machines

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta/recipes-kernel/kexec/kexec-tools.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-kernel/kexec/kexec-tools.inc b/meta/recipes-kernel/kexec/kexec-tools.inc
index 7541ddc..bbfb20f 100644
--- a/meta/recipes-kernel/kexec/kexec-tools.inc
+++ b/meta/recipes-kernel/kexec/kexec-tools.inc
@@ -12,4 +12,4 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz
 
 inherit autotools
 
-COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*)-(linux|freebsd.*)'
+COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|powerpc.*)-(linux|freebsd.*)'
-- 
1.7.6.1




