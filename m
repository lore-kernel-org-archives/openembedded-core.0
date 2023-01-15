Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26929C3DA78
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 05:23:17 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.18])
 by mx.groups.io with SMTP id smtpd.web10.134782.1673760193716168080
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Jan 2023 21:23:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=QpavH/dg;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.18, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673760191; i=@fujitsu.com;
	bh=MaXn/nBpfu0O2a3N8CY5x33+Fi9g2DIKvuiYJfrgkYk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=QpavH/dgc941gqpxpQ2yC1fbWzCNnGEuxc9f5gD8RDnW783mSRKJIo6yOkmWE0Hpu
	 rnR50rCEpG7LThyktx5wcCrxMnbxuB2hgECBzRdBlooedNkNvMZRvRQi4uMfDqjMZx
	 ynbVgJLBJdn+DCQz8mSu4H4LgMPCZA+t55HbrpUimUImgo0wme1+usxxIjHaGhyFIO
	 X6OI0UQPJsg1ZZzALweM9h7lYE2Mc/fNouyvkn2oTaThlVp/ZnnBvuUDkM9YCRUh/7
	 1c5yEORtlr/OZY4FpLy9aqApIEhvvxZOprqNDaVyYvF9rTW3+0lNiw9RXYAuEOi4Vk
	 eYL7DK/adriyQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPIsWRWlGSWpSXmKPExsViZ8ORpLuv93C
  ywZU3ChZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8aL1nXMBV0cFdt2v2NuYFzN3sXIySEk8IBR
  4u/y+C5GLiD7MpPElykHWCGcvYwSPQ+2MIFUsQlISdy4/5+ti5GDQ0RAT+LqP1GQMLOAisSL3
  z1gg4QF7CTmXb/LBmKzCKhK7Js8nRGknFfAUeLdtEyQsISAgsSUh++ZQWxOASeJ7vs7WSFucJ
  TYdqQfbAyvgKDEyZlPWCDGS0gcfPGCGaJXUWL25WYWCLtSovXDLyhbTeLquU3MExgFZyFpn4W
  kfQEj0ypG0+LUorLUIl1TvaSizPSMktzEzBy9xCrdRL3UUt3y1OISXUO9xPJivdTiYr3iytzk
  nBS9vNSSTYzAsE0pZizbwdi97I/eIUZJDiYlUd7Ib4eShfiS8lMqMxKLM+KLSnNSiw8xynBwK
  Enwbmg8nCwkWJSanlqRlpkDjCGYtAQHj5IIr3YHUJq3uCAxtzgzHSJ1ilGX4+qVK3uZhVjy8v
  NSpcR5X/QAFQmAFGWU5sGNgMXzJUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvE9BpvBk5pX
  AbXoFdAQT0BEh9QdBjihJREhJNTBVHL3E1HapYZbgFdvft3ISFsyP33whdJqI/4atPjtKdHKL
  pm5dU3lateLD3n6hwK339zbwSvodOb46cHJEkfXGT0mTZHMFni3vrMtWSvPbXaM/T/Wt8FH7z
  wcWaXwIbDjylcuD88DGKomyjdqL9F0Z1C7cPJ2iwbzhhAHHk1h5lsX3/5/3uDZrhbuj8y3xWd
  af+125Jt1NntT7yET3vJ6G1PU6oXKtAt0Ks62hq252Sed5dKd2PXEK+ZvhHz27wn+dfcCc9Sa
  /Vvh49bzPPmi3xT6Mc2p3r8y247MVJfgz/txecd+h1PTv1DhTXh+rysP5D1/9yX1/nc/3yqxr
  ny5OO6iXorynbIHhBJY5po+UWIozEg21mIuKEwElqDAoYgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-23.tower-585.messagelabs.com!1673760190!237941!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8515 invoked from network); 15 Jan 2023 05:23:10 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-23.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 15 Jan 2023 05:23:10 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 2C0331AF
	for <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 05:23:10 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 205847B
	for <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 05:23:10 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sun, 15 Jan 2023 05:23:08 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] gi-docgen: upgrade 2022.2 -> 2023.1
Date: Sun, 15 Jan 2023 13:22:52 +0800
Message-ID: <1673760175-2523-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1673760175-2523-1-git-send-email-wangmy@fujitsu.com>
References: <1673760175-2523-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 05:23:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175868

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../gi-docgen/{gi-docgen_git.bb => gi-docgen_2023.1.bb}        | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-gnome/gi-docgen/{gi-docgen_git.bb => gi-docgen_2023.1.bb} (93%)

diff --git a/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb b/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb
similarity index 93%
rename from meta/recipes-gnome/gi-docgen/gi-docgen_git.bb
rename to meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb
index fa41f2ccd2..7722ebda8f 100644
--- a/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb
+++ b/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb
@@ -10,8 +10,7 @@ LIC_FILES_CHKSUM = "file://gi-docgen.py;beginline=1;endline=5;md5=2dc0f1f0120247
 
 SRC_URI = "git://gitlab.gnome.org/GNOME/gi-docgen.git;protocol=https;branch=main"
 
-PV = "2022.2"
-SRCREV = "bddd024b08650efdd24704c670f586eb12cec9c9"
+SRCREV = "63b4fad4181e793f34b7777a89e5cb58fe8ac7e6"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


