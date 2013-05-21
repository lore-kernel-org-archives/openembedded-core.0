Return-Path: <B40527@freescale.com>
Received: from co1outboundpool.messaging.microsoft.com
	(co1ehsobe006.messaging.microsoft.com [216.32.180.189])
	by mail.openembedded.org (Postfix) with ESMTP id 3557E60897
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2013 07:04:46 +0000 (UTC)
Received: from mail97-co1-R.bigfish.com (10.243.78.245) by
	CO1EHSOBE015.bigfish.com (10.243.66.78) with Microsoft SMTP Server id
	14.1.225.23; Tue, 21 May 2013 07:04:41 +0000
Received: from mail97-co1 (localhost [127.0.0.1])	by mail97-co1-R.bigfish.com
	(Postfix) with ESMTP id ACC96480245	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2013 07:04:41 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h1ee6h1de0h1fdah1202h1e76h1d1ah1d2ah1fc6hzz8275bhz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h1354h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1d0ch1d2eh1d3fh1155h)
Received: from mail97-co1 (localhost.localdomain [127.0.0.1]) by mail97-co1
	(MessageSwitch) id 1369119879649359_9847;
	Tue, 21 May 2013 07:04:39 +0000 (UTC)
Received: from CO1EHSMHS011.bigfish.com (unknown [10.243.78.239])	by
	mail97-co1.bigfish.com (Postfix) with ESMTP id 9218C580049	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2013 07:04:39 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS011.bigfish.com
	(10.243.66.21) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 21 May 2013 07:04:39 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-004.039d.mgd.msft.net (10.84.1.14) with Microsoft SMTP
	Server (TLS) id 14.2.328.11; Tue, 21 May 2013 07:05:14 +0000
Received: from localhost.localdomain (rhuath.am.freescale.net [10.82.176.1])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	r4L74ZhB001251; Tue, 21 May 2013 00:04:36 -0700
From: <b40527@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 21 May 2013 02:04:35 -0500
Message-ID: <1369119875-4984-1-git-send-email-b40527@freescale.com>
X-Mailer: git-send-email 1.6.2.5
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: Zongchun Yu <b40527@freescale.com>
Subject: [PATCH] base-files:fix the command line wrap around issue
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
X-List-Received-Date: Tue, 21 May 2013 07:04:46 -0000
Content-Type: text/plain

From: Zongchun Yu <b40527@freescale.com>

when the character number of cmdline is more than 80. the following character should
go to a new line. rather than cover the prompt and the inputting character before.

Signed-off-by: Zongchun Yu <b40527@freescale.com>
---
 meta/recipes-core/base-files/base-files/profile |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-core/base-files/base-files/profile b/meta/recipes-core/base-files/base-files/profile
index 8eeaac3..f58ae3d 100644
--- a/meta/recipes-core/base-files/base-files/profile
+++ b/meta/recipes-core/base-files/base-files/profile
@@ -27,6 +27,7 @@ if [ -d /etc/profile.d ]; then
 fi
 
 export PATH PS1 OPIEDIR QPEDIR QTDIR EDITOR TERM
+export COLUMNS=2000
 
 umask 022
 
-- 
1.6.2.5



