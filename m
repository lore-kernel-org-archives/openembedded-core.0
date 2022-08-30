Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D26EFECAAD1
	for <webhook@archiver.kernel.org>; Tue, 30 Aug 2022 04:12:31 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web08.7708.1661832746752610412
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Aug 2022 21:12:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=fSq2OXr7;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1661832750; i=@fujitsu.com;
	bh=FkjnZy7ER4RdAajMqhOjarH5xIGP91oQVDtXzDmkw84=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=fSq2OXr7PRfOzEAFDrdsjiX15Lu0a3OrpA1xSozuXtkPADlEVHrHMagBWp5qbYO3K
	 CAmZFSBE5/IU6Y8ZCjHi7URA2KCGjFxFsZv4Yv5A+q0yFKkJTQn3xt74fhoMO/0J5E
	 0vWuS0s396ftiW/ltQIivDa97oPxCIR/1DRKoVCkGzRsygRKm1cvLp7HU2Lw5aAfxu
	 dDeCtQ8H3AL8gv385GF4X9YmrxqAqC5Fs7RZ4IxEuW2hbduERjeTumRWQUx536VrLK
	 RNnma92IIJV/J9r10FJDitig9jVRLFBj4o9NCFQcTBUH0jyQrWqfdr0j35MZLqEqwt
	 FvWiUvY25LCyA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrBIsWRWlGSWpSXmKPExsViZ8ORpKvbx5t
  ssKHf2uLOz3fsDowe5zauYAxgjGLNzEvKr0hgzdgx6RJzwR2Jiq/3rrM2ML4X6WLk4hASeMAo
  cfXfPGYI5wqTxO3N19ggnL2MEs//PwPKcHKwCahJTL91g7WLkYNDREAPqEMUJMwsoCLx4ncPO
  4gtLGAmMfFfMwuIzSKgKrH02ARWEJtXwEli1oqtbCC2hICCxJSH78FGcgo4S0w+/A2sVwio5u
  OXP2wQ9YISJ2c+YYGYLyFx8MULZoheRYnZlyHmSwhUSuyZ1c8EYatJXD23iXkCo+AsJO2zkLQ
  vYGRaxWiVVJSZnlGSm5iZo2toYKBraGiqCyRNTfQSq3QT9VJLdctTi0t0DfUSy4v1UouL9Yor
  c5NzUvTyUks2MQKDOKWYYdYOxll9P/UOMUpyMCmJ8i5s5U0W4kvKT6nMSCzOiC8qzUktPsQow
  8GhJMF7uRsoJ1iUmp5akZaZA4womLQEB4+SCK93F1Cat7ggMbc4Mx0idYrRnmPq7H/7mTmWg8
  mZX9sOMHNs2td1gFmIJS8/L1VKnHdqL1CbAEhbRmke3FBYArjEKCslzMvIwMAgxFOQWpSbWYI
  q/4pRnINRSZh3Qw/QFJ7MvBK43a+AzmICOuvhEm6Qs0oSEVJSDUzOdg1aPXx/69YKduWdmea5
  7Y7YTs+ZIUIzD2906VU1vbD4s9u2VwkSu9U9a+WrH3159f3sub81ezfqclz/5jZFdWHmt23yd
  QIadflr2VzW3/Gf9TLSv+yoxDPh2Cm21271LF3N+v7qi0Q+7pV77Nvn7Uibd1Jwj4PQvxPBFw
  8e90wUeKHScUdCNE7pWvaui7dmqz86d87L+v0BNXPz57/MksXYGJn1irNclW16t94SmM708Cz
  TKdcybulSP8GDSc9c7nk+OaLFOZvZ4PE0236RT2/9Ddgfux8qEmTlyQzM1W///fp7vdRitnKm
  fxNXseWbMj8+1ZOygDf1YuL3tHXS9/YdfrMs4+nJiws0svSVWIozEg21mIuKEwHuEkeqewMAA
  A==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-585.messagelabs.com!1661832749!346292!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14646 invoked from network); 30 Aug 2022 04:12:29 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-7.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 30 Aug 2022 04:12:29 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 92B361AC
	for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Aug 2022 05:12:29 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223
 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 876AD1AB
	for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Aug 2022 05:12:29 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 30 Aug 2022 05:12:27 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] lz4: upgrade 1.9.3 -> 1.9.4
Date: Tue, 30 Aug 2022 12:11:52 +0800
Message-ID: <1661832712-12546-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1661832712-12546-1-git-send-email-wangmy@fujitsu.com>
References: <1661832712-12546-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Aug 2022 04:12:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170056

CVE-2021-3520.patch
removed since it's included in 1.9.4

License-Update:
  Copyright year updated to 2020
  description of 3rd party applications changed

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../lz4/files/CVE-2021-3520.patch             | 27 -------------------
 .../lz4/{lz4_1.9.3.bb => lz4_1.9.4.bb}        | 10 +++----
 2 files changed, 4 insertions(+), 33 deletions(-)
 delete mode 100644 meta/recipes-support/lz4/files/CVE-2021-3520.patch
 rename meta/recipes-support/lz4/{lz4_1.9.3.bb => lz4_1.9.4.bb} (78%)

diff --git a/meta/recipes-support/lz4/files/CVE-2021-3520.patch b/meta/recipes-support/lz4/files/CVE-2021-3520.patch
deleted file mode 100644
index 5ac8f6691f..0000000000
--- a/meta/recipes-support/lz4/files/CVE-2021-3520.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 8301a21773ef61656225e264f4f06ae14462bca7 Mon Sep 17 00:00:00 2001
-From: Jasper Lievisse Adriaanse <j@jasper.la>
-Date: Fri, 26 Feb 2021 15:21:20 +0100
-Subject: [PATCH] Fix potential memory corruption with negative memmove() size
-
-Upstream-Status: Backport
-https://github.com/lz4/lz4/commit/8301a21773ef61656225e264f4f06ae14462bca7#diff-7055e9cf14c488aea9837aaf9f528b58ee3c22988d7d0d81d172ec62d94a88a7
-CVE: CVE-2021-3520
-Signed-off-by: Armin Kuster <akuster@mvista.com>
-
----
- lib/lz4.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: git/lib/lz4.c
-===================================================================
---- git.orig/lib/lz4.c
-+++ git/lib/lz4.c
-@@ -1665,7 +1665,7 @@ LZ4_decompress_generic(
-                  const size_t dictSize         /* note : = 0 if noDict */
-                  )
- {
--    if (src == NULL) { return -1; }
-+    if ((src == NULL) || (outputSize < 0)) { return -1; }
- 
-     {   const BYTE* ip = (const BYTE*) src;
-         const BYTE* const iend = ip + srcSize;
diff --git a/meta/recipes-support/lz4/lz4_1.9.3.bb b/meta/recipes-support/lz4/lz4_1.9.4.bb
similarity index 78%
rename from meta/recipes-support/lz4/lz4_1.9.3.bb
rename to meta/recipes-support/lz4/lz4_1.9.4.bb
index 129a86b681..a2a178bab5 100644
--- a/meta/recipes-support/lz4/lz4_1.9.3.bb
+++ b/meta/recipes-support/lz4/lz4_1.9.4.bb
@@ -3,18 +3,16 @@ DESCRIPTION = "LZ4 is a very fast lossless compression algorithm, providing comp
 HOMEPAGE = "https://github.com/lz4/lz4"
 
 LICENSE = "BSD-2-Clause | GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://lib/LICENSE;md5=ebc2ea4814a64de7708f1571904b32cc \
+LIC_FILES_CHKSUM = "file://lib/LICENSE;md5=5cd5f851b52ec832b10eedb3f01f885a \
                     file://programs/COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://LICENSE;md5=d57c0d21cb917fb4e0af2454aa48b956 \
+                    file://LICENSE;md5=c5cc3cd6f9274b4d32988096df9c3ec3 \
                     "
 
 PE = "1"
 
-SRCREV = "d44371841a2f1728a3f36839fd4b7e872d0927d3"
+SRCREV = "5ff839680134437dbf4678f3d0c7b371d84f4964"
 
-SRC_URI = "git://github.com/lz4/lz4.git;branch=release;protocol=https \
-           file://CVE-2021-3520.patch \
-           "
+SRC_URI = "git://github.com/lz4/lz4.git;branch=release;protocol=https"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


