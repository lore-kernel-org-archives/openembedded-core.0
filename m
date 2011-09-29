Received: from ch1ehsobe002.messaging.microsoft.com ([216.32.181.182]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1R9MCn-0003wc-VH
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Sep 2011 21:23:39 +0200
Received: from mail82-ch1-R.bigfish.com (216.32.181.170) by
	CH1EHSOBE013.bigfish.com (10.43.70.63) with Microsoft SMTP Server id
	14.1.225.22; Thu, 29 Sep 2011 19:02:57 +0000
Received: from mail82-ch1 (localhost.localdomain [127.0.0.1])	by
	mail82-ch1-R.bigfish.com (Postfix) with ESMTP id 973CD1310340	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2011 19:02:57 +0000 (UTC)
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bhz2dh2a8h668h839h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 13,
Received: from mail82-ch1 (localhost.localdomain [127.0.0.1]) by mail82-ch1
	(MessageSwitch) id 1317322977526368_12043;
	Thu, 29 Sep 2011 19:02:57 +0000 (UTC)
Received: from CH1EHSMHS035.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.243])	by mail82-ch1.bigfish.com (Postfix) with ESMTP id
	6FAB1167804F	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2011 19:02:57 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS035.bigfish.com
	(10.43.70.35) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Thu, 29 Sep 2011 19:02:56 +0000
Received: from az33smr01.freescale.net (10.64.34.199) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server id 14.1.323.7; Thu, 29 Sep 2011 14:02:55 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.193.13])
	by az33smr01.freescale.net (8.13.1/8.13.0) with ESMTP id
	p8TJ2s5Z008216	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2011 14:02:54 -0500 (CDT)
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 29 Sep 2011 14:02:54 -0500
Message-ID: <1317322974-31473-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.6.1
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH v2 03/16] Update gitignore to ignore all meta-* directories
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
X-List-Received-Date: Thu, 29 Sep 2011 19:23:39 -0000
Content-Type: text/plain

meta-XYZ directories have been manually added in the past, instead
always ignore them unless they are explicitly added

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 .gitignore |    8 +++-----
 1 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/.gitignore b/.gitignore
index d44e729..11b7024 100644
--- a/.gitignore
+++ b/.gitignore
@@ -9,11 +9,9 @@ build*/pyshtables.py
 pstage/
 scripts/oe-git-proxy-socks
 sources/
-meta-darwin
-meta-maemo
-meta-extras
-meta-m2
-meta-prvt*
+meta-*
+!meta-skeleton
+!meta-demoapps
 *.swp
 *.orig
 *.rej
-- 
1.7.6.1




