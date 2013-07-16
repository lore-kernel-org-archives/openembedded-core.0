Return-Path: <B19537@freescale.com>
Received: from va3outboundpool.messaging.microsoft.com
	(va3ehsobe002.messaging.microsoft.com [216.32.180.12])
	by mail.openembedded.org (Postfix) with ESMTP id 1167E6B173
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2013 03:36:43 +0000 (UTC)
Received: from mail11-va3-R.bigfish.com (10.7.14.240) by
	VA3EHSOBE003.bigfish.com (10.7.40.23) with Microsoft SMTP Server id
	14.1.225.23; Tue, 16 Jul 2013 03:36:42 +0000
Received: from mail11-va3 (localhost [127.0.0.1])	by mail11-va3-R.bigfish.com
	(Postfix) with ESMTP id 900022E00F3	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2013 03:36:42 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h1ee6h1de0h1fdah2073h1202h1e76h1d1ah1d2ah1fc6hzz8275bhz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1155h)
Received: from mail11-va3 (localhost.localdomain [127.0.0.1]) by mail11-va3
	(MessageSwitch) id 1373945799528035_6400;
	Tue, 16 Jul 2013 03:36:39 +0000 (UTC)
Received: from VA3EHSMHS018.bigfish.com (unknown [10.7.14.248])	by
	mail11-va3.bigfish.com (Postfix) with ESMTP id 72AB42400DF	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2013 03:36:39 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS018.bigfish.com
	(10.7.99.28) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 16 Jul 2013 03:36:39 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server (TLS) id 14.3.136.1; Tue, 16 Jul 2013 03:35:41 +0000
Received: from b19537-desktop.ap.freescale.net
	(b19537-desktop.ap.freescale.net [10.192.208.197])	by
	tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id r6G3aZSa019694;
	Mon, 15 Jul 2013 20:36:37 -0700
From: Zhenhua Luo <zhenhua.luo@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 16 Jul 2013 11:45:57 +0800
Message-ID: <1373946357-8447-1-git-send-email-zhenhua.luo@freescale.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: Zhenhua Luo <zhenhua.luo@freescale.com>
Subject: [PATCH] oprofile: add Upstream-Status for several patches
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
X-List-Received-Date: Tue, 16 Jul 2013 03:36:43 -0000
Content-Type: text/plain

Add "Upstream-Status: Accepted" for below patches:
* meta/recipes-kernel/oprofile/oprofile/0001-Allow-ppc64-events-to-be-specified-with-or-without-_.patch
* meta/recipes-kernel/oprofile/oprofile/0001-Fix-PPC64-specific-libpfm-usage-so-it-doesn-t-break-.patch
* meta/recipes-kernel/oprofile/oprofile/0001-ophelp-lists-events-Fix-doc-URL-for-ppc64-arch.patch

Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
---
 ...-events-to-be-specified-with-or-without-_.patch |    2 ++
 ...pecific-libpfm-usage-so-it-doesn-t-break-.patch |    2 ++
 ...p-lists-events-Fix-doc-URL-for-ppc64-arch.patch |    2 ++
 3 files changed, 6 insertions(+)

diff --git a/meta/recipes-kernel/oprofile/oprofile/0001-Allow-ppc64-events-to-be-specified-with-or-without-_.patch b/meta/recipes-kernel/oprofile/oprofile/0001-Allow-ppc64-events-to-be-specified-with-or-without-_.patch
index 5eb8b8f..d19948a 100644
--- a/meta/recipes-kernel/oprofile/oprofile/0001-Allow-ppc64-events-to-be-specified-with-or-without-_.patch
+++ b/meta/recipes-kernel/oprofile/oprofile/0001-Allow-ppc64-events-to-be-specified-with-or-without-_.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Accepted
+
 From 36028035555297695f52e856f21920012fd64f79 Mon Sep 17 00:00:00 2001
 From: Maynard Johnson <maynardj@us.ibm.com>
 Date: Fri, 11 Jan 2013 13:29:57 -0600
diff --git a/meta/recipes-kernel/oprofile/oprofile/0001-Fix-PPC64-specific-libpfm-usage-so-it-doesn-t-break-.patch b/meta/recipes-kernel/oprofile/oprofile/0001-Fix-PPC64-specific-libpfm-usage-so-it-doesn-t-break-.patch
index ead6e25..6f5b1c0 100644
--- a/meta/recipes-kernel/oprofile/oprofile/0001-Fix-PPC64-specific-libpfm-usage-so-it-doesn-t-break-.patch
+++ b/meta/recipes-kernel/oprofile/oprofile/0001-Fix-PPC64-specific-libpfm-usage-so-it-doesn-t-break-.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Accepted
+
 From 8e36ad01ceb1257d05773b684dbe9358aecd3f71 Mon Sep 17 00:00:00 2001
 From: Maynard Johnson <maynardj@us.ibm.com>
 Date: Tue, 26 Feb 2013 13:41:27 -0600
diff --git a/meta/recipes-kernel/oprofile/oprofile/0001-ophelp-lists-events-Fix-doc-URL-for-ppc64-arch.patch b/meta/recipes-kernel/oprofile/oprofile/0001-ophelp-lists-events-Fix-doc-URL-for-ppc64-arch.patch
index 5a50b90..b155cac 100644
--- a/meta/recipes-kernel/oprofile/oprofile/0001-ophelp-lists-events-Fix-doc-URL-for-ppc64-arch.patch
+++ b/meta/recipes-kernel/oprofile/oprofile/0001-ophelp-lists-events-Fix-doc-URL-for-ppc64-arch.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Accepted
+
 From 735d9eb0322b34b3d26302a1dac173100d718d35 Mon Sep 17 00:00:00 2001
 From: Maynard Johnson <maynardj@us.ibm.com>
 Date: Thu, 10 Jan 2013 14:24:26 -0600
-- 
1.7.9.5



