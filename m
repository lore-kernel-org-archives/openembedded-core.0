Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9635C77B70
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 06:38:00 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web10.48253.1681713480236517650
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Apr 2023 23:38:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ETgiA9Fd;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681713478; i=@fujitsu.com;
	bh=Bb0q6uy1oaEo9a6WlMMUoe7uvmvVX17/FXGI+Z4LQh8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ETgiA9FdxY6MsXvB002bAJJxj6Q0b17cnCtg/AfdeI7JLwGNZlsJmByC0OOKURbcc
	 XohnzjFwkKwkBA2pKAznhi2rZFlu8d98NMSgObQI04ZSbNzVhnti9F9tn1kgvV8Qys
	 kHwfnpazK3z1Yxu9aaf02UXbOicVVNO81M5XV/rlUuyjWeqFj4cQini4eR/wCYA5Wl
	 qOPefgHRpvG5ccLGqlRwapCxBkBS5se4DEVpEzJ33ePCRFWWUhhvvYOr5mO8ya7PxK
	 e9Jq2Th589/0VHd+rVtxjvl2TL9iWOZW8U1CZjs9W1xdnrc4b29PpAuWOXY/89CzFU
	 Y7pK94/tNaa8A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIIsWRWlGSWpSXmKPExsViZ8ORpOv60ib
  F4NVdBYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNaNz52qmgmscFZOvH2RrYPzL3sXIxSEk8IBR
  Ys2TxWwQzmUmifZ5y5kgnL2MEj1LJ7J0MXJysAlISdy4/x+oioNDREBP4uo/UZAws4CKxIvfP
  ewgtrCAv8SluQfYQGwWAVWJCZfOg7XyCjhJLDzewQpiSwgoSEx5+J4ZxOYUcJZYsWcxWI0QUM
  2xtodsEPWCEidnPmGBmC8hcfDFC2aIXkWJ2ZebWSDsSonWD7+gbDWJq+c2MU9gFJyFpH0WkvY
  FjEyrGE2LU4vKUot0LfWSijLTM0pyEzNz9BKrdBP1Ukt1y1OLS3QN9RLLi/VSi4v1iitzk3NS
  9PJSSzYxAkM3pZjVaQfj8b6/eocYJTmYlER5X6RapwjxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4
  A14bpMiJFiUmp5akZaZA4wjmLQEB4+SCK/xM6A0b3FBYm5xZjpE6hSjLsfVK1f2Mgux5OXnpU
  qJ8wqBFAmAFGWU5sGNgMX0JUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvLmPgabwZOaVwG1
  6BXQEE9ARckpgR5QkIqSkGpiqV2QZWC5qWfU1eGuzb5H+0ep7jxxXn+l6Le1yNDR397IjTV/l
  T3zIuD7xg/rW8v2Ky0o/81x1snrldZf14OHy8vw1zIuLFH/2VjhMn3po5xet1Ua3+fMlNV+4H
  39uUPdmVW3VxpLKd3Kb76R4xNVs3eQjWmGSs/Hja61JlfcvmMYaF3jKfr3u7/dO3+dejfGNmO
  3TjA1ZCicx39RfbWTy8ezGnY+4DPxLfsxq2am7U7nKLLTnpujZkokL7tnfPn9f3rHt9IrL7y/
  9338yeFnG/8V6x++82sF8wWBPcumK3+++LDi/SsDpav4EjXmPrjcnX491vNF6aqfi4x2Wfh/l
  U3K2TOq9F8ueUc9+y6DtkRJLcUaioRZzUXEiAPK7UCpkAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-591.messagelabs.com!1681713477!443465!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12067 invoked from network); 17 Apr 2023 06:37:57 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-7.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Apr 2023 06:37:57 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 24DBF1B5
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 07:37:57 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 192867B
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 07:37:57 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 17 Apr 2023 07:37:55 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] ctags: upgrade 6.0.20230402.0 -> 6.0.20230416.0
Date: Mon, 17 Apr 2023 14:37:36 +0800
Message-ID: <1681713459-18443-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681713459-18443-1-git-send-email-wangmy@fujitsu.com>
References: <1681713459-18443-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 06:38:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180122

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_6.0.20230402.0.bb => ctags_6.0.20230416.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.0.20230402.0.bb => ctags_6.0.20230416.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.0.20230402.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.0.20230416.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_6.0.20230402.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.0.20230416.0.bb
index b7cf45950..cc82d9953 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.0.20230402.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.0.20230416.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "1231ebe5b4ac1cc095b4480a0bb2b016c135d6fb"
+SRCREV = "5ba7dfcc55471e599375281f52ad2bebdc527c62"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


