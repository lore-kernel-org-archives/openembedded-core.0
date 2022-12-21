Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 436DEC4332F
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 03:01:50 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web11.10053.1671591701372984968
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Dec 2022 19:01:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=a7tvpJne;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1671591704; i=@fujitsu.com;
	bh=mJ9iaVQ0lC/Hdx+8uez9pGD5bbI8Rq68oCivRK9Qkeo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=a7tvpJneca8gcjI7i8i81NvdEiPyj/4GAEaBzsjefGOfX9y2qMFjjwK1eFl42bffy
	 55W1bZI+wVjV3cZ6qNA63nKvO7HH2/Gbo9o8kW0pRkA53c6l1b85Cz5boIAQlpj703
	 bA6zBtOcoffteBaDaWhPDudbGanGZWZtznF7hnVPqPGacE3RACh8P2SIbat6YhG57w
	 txfyOmduM0xdgnnHZcdM6HC758vMIl++fjCXXpN5g7zgdNSHYhx4pCWHjIvFPhryHJ
	 slo7A702zd/tuYKJCsA53egaXyThbH+G79fT3qS5vQh4LqUCog6B5WUgm8Px+Bh5Dd
	 bfQy+nmebxP9Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsViZ8ORqCtevij
  ZYO4HCYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePE+fiCVVwVr+8INjBO5+xi5OIQEnjMKLH2
  yStGCOcak8TxVbtZIJw9jBInLj5l7WLk5GATkJK4cf8/WxcjB4eIgJ7E1X+iIGFmARWJF7972
  EFsYQFziZ2LTzKB2CwCqhJfdrWA2bwCThK7Nv4EGyMhoCAx5eF7ZhCbU8BZYlVXA1hcCKhm28
  /ZrBD1ghInZz5hgZgvIXHwxQtmiF5FidmXm1kg7AqJWbPamCBsNYmr5zYxT2AUnIWkfRaS9gW
  MTKsYzYpTi8pSi3QNDfSSijLTM0pyEzNz9BKrdBP1Ukt1y1OLS3SN9BLLi/VSi4v1iitzk3NS
  9PJSSzYxAgM3pVilbwfj22V/9A4xSnIwKYny+jAsShbiS8pPqcxILM6ILyrNSS0+xCjDwaEkw
  WtaCpQTLEpNT61Iy8wBRhFMWoKDR0mE164EKM1bXJCYW5yZDpE6xWjMcfXKlb3MHDO/th1gFm
  LJy89LlRLn3Q0ySQCkNKM0D24QLLovMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmjQFZyJO
  ZVwK37xXQKUxAp0y7uRDklJJEhJRUA5Nj+c7WdZ+O/6tLbzGZGyMjnOta1vRk6/mdK5axNb6f
  m2W9lnVf3kulPc2n/FezXTnLsXFlikiTEq+jTeo51663OYELlrOsyjQ9fIa1XOW0RjKvX7aG1
  UJ1nYeRUj8Pb7JnnM5zIe/ltIA5j98eUdBPUuz5yR2Yd3rqw4zTyiymWute/tphliRTH3uowT
  jwoVna+d+azGuaNuXwn9u/k9Urq56pqajqyaWJ3W/5byau3MTovCdYpzaIq2uGkNmpmdvPSK5
  /YXBVMt9zrdUqn+WHilav+uV99Gr9kdAt57OuvHi0lVu++HoBg8505sO1/Lse1+2zu3N4A8OG
  NWu3nf2SUzVjS+Eci1VPvfsr99QqsRRnJBpqMRcVJwIAYNsdAWkDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-571.messagelabs.com!1671591703!20136!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15808 invoked from network); 21 Dec 2022 03:01:43 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-11.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 21 Dec 2022 03:01:43 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 1B7DA100188
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 03:01:43 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 0EF7D100043
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 03:01:43 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 21 Dec 2022 03:01:41 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] psmisc: upgrade 23.5 -> 23.6
Date: Wed, 21 Dec 2022 11:01:01 +0800
Message-ID: <1671591662-12509-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1671591662-12509-1-git-send-email-wangmy@fujitsu.com>
References: <1671591662-12509-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 03:01:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174897

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
* buildsys: Fix DEJAGNU work-around Debian #1015089
* killall: Use kill if pidfd_send_signal fails Debian #1015228
* fuser: Do not mention nonexistent - reset option #42
* fuser: Use modern statn where possible
* pstree: Better AppArmor support !30

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-extended/psmisc/{psmisc_23.5.bb => psmisc_23.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/psmisc/{psmisc_23.5.bb => psmisc_23.6.bb} (85%)

diff --git a/meta/recipes-extended/psmisc/psmisc_23.5.bb b/meta/recipes-extended/psmisc/psmisc_23.6.bb
similarity index 85%
rename from meta/recipes-extended/psmisc/psmisc_23.5.bb
rename to meta/recipes-extended/psmisc/psmisc_23.6.bb
index 1c390f3615..2e55ad00bd 100644
--- a/meta/recipes-extended/psmisc/psmisc_23.5.bb
+++ b/meta/recipes-extended/psmisc/psmisc_23.6.bb
@@ -5,5 +5,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 SRC_URI = "git://gitlab.com/psmisc/psmisc.git;protocol=https;branch=master \
            file://0001-Use-UINTPTR_MAX-instead-of-__WORDSIZE.patch \
            "
-SRCREV = "17353f3fddef6b360bc47f7834f2cd011bea2b87"
+SRCREV = "3098e641dc1ddb210186f53464255670b480377b"
 S = "${WORKDIR}/git"
-- 
2.25.1


