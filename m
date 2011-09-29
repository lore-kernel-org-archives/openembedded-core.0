Received: from tx2ehsobe005.messaging.microsoft.com ([65.55.88.15]
	helo=TX2EHSOBE010.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1R98RO-0000WN-I9
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Sep 2011 06:41:46 +0200
Received: from mail56-tx2-R.bigfish.com (10.9.14.250) by
	TX2EHSOBE010.bigfish.com (10.9.40.30) with Microsoft SMTP Server id
	14.1.225.22; Thu, 29 Sep 2011 04:21:12 +0000
Received: from mail56-tx2 (localhost.localdomain [127.0.0.1])	by
	mail56-tx2-R.bigfish.com (Postfix) with ESMTP id D4F055B8283	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2011 04:21:12 +0000 (UTC)
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bhz2dh2a8h668h839h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 13,
Received: from mail56-tx2 (localhost.localdomain [127.0.0.1]) by mail56-tx2
	(MessageSwitch) id 1317270072801504_26579;
	Thu, 29 Sep 2011 04:21:12 +0000 (UTC)
Received: from TX2EHSMHS025.bigfish.com (unknown [10.9.14.250])	by
	mail56-tx2.bigfish.com (Postfix) with ESMTP id BE9957D004B	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2011 04:21:12 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS025.bigfish.com
	(10.9.99.125) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Thu, 29 Sep 2011 04:21:12 +0000
Received: from az33smr01.freescale.net (10.64.34.199) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server id 14.1.323.7; Wed, 28 Sep 2011 23:21:12 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.193.13])
	by az33smr01.freescale.net (8.13.1/8.13.0) with ESMTP id
	p8T4LAKq024559	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2011 23:21:11 -0500 (CDT)
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 28 Sep 2011 23:20:57 -0500
Message-ID: <1317270070-14250-3-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <1317270070-14250-1-git-send-email-msm@freescale.com>
References: <1317270070-14250-1-git-send-email-msm@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH 03/16] Update gitignore to ignore all meta-* directories
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
X-List-Received-Date: Thu, 29 Sep 2011 04:41:46 -0000
Content-Type: text/plain

meta-XYZ directories have been manually added in the past, instead
always ignore them unless they are explicitly added

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 .gitignore |    6 +-----
 1 files changed, 1 insertions(+), 5 deletions(-)

diff --git a/.gitignore b/.gitignore
index d44e729..679cb11 100644
--- a/.gitignore
+++ b/.gitignore
@@ -9,11 +9,7 @@ build*/pyshtables.py
 pstage/
 scripts/oe-git-proxy-socks
 sources/
-meta-darwin
-meta-maemo
-meta-extras
-meta-m2
-meta-prvt*
+meta-*
 *.swp
 *.orig
 *.rej
-- 
1.7.6.1




