Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42E08C6379F
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 10:19:26 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web10.38672.1676974765238208763
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Feb 2023 02:19:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=VLURLocs;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1676974763; i=@fujitsu.com;
	bh=943c36L3CWUXreEXOh0cN9dn10c23MXnKF51mZDEDpw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=VLURLocsQlAe/25uqGQ0vIka/i5+Yj48sV7iL3v0La3nAyP2r2yZnQ9JM/dJ5toPw
	 2m3YeG+48NdgTnGgfadUMumQcN8cOHxeA4GecL7LmoMhOBglwzvbKxct3zS+/6Tip+
	 vYZt9QUxDn9MEWi7PT493RkrqNAT7xkhtbpaIT0MFW1p0trMZf8KKkTyGw7B/Y5i2e
	 DoDZoqH4r4mpvymMb4dPXpvjkK6+169v7wKfScneb0H8J8flh3Ve5k5NZEH8RhemLB
	 GS47EeYt0S/gQJiVHA0W3ZMLYdIlvFjH0mL5vH+8UnggH9hCwpIa8W0wmb/IVclrKp
	 55NznBaIL0xNQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRWlGSWpSXmKPExsViZ8ORqLtq1pd
  kg/lbzSzu/HzH7sDocW7jCsYAxijWzLyk/IoE1ozXj/axFdznqPjWvpCxgfEfexcjF4eQwGNG
  ibfzOpghnOtMEu1bm6CcvYwSu478BCrj5GATkJK4cf8/WxcjB4eIgJ7E1X+iIGFmARWJF797w
  EqEBewkTh/qZQOxWQRUJb7MnMgEYvMKOEk8+XEezJYQUJCY8vA9M8gYTgFniblNsSBhIaCSV5
  eWskGUC0qcnPmEBWK8hMTBFy+YIVoVJWZfbmaBsCslWj/8grLVJK6e28Q8gVFwFpL2WUjaFzA
  yrWI0K04tKkst0jU00ksqykzPKMlNzMzRS6zSTdRLLdUtTy0u0TXUSywv1kstLtYrrsxNzknR
  y0st2cQIDN2UYuYXOxh/9P3VO8QoycGkJMr77dTnZCG+pPyUyozE4oz4otKc1OJDjDIcHEoSv
  H7TvyQLCRalpqdWpGXmAOMIJi3BwaMkwlvXBZTmLS5IzC3OTIdInWI05ljbcGAvM8eHQ1f2Mg
  ux5OXnpUqJ806aAVQqAFKaUZoHNwgW35cYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfNWgEz
  hycwrgdv3CugUJqBT3H98ADmlJBEhJdXApK4eEOx+7e+EXPe/WY9d7ZZ3HbrwREBHVLo2oiak
  6/0JqQXJv3wCYi9tV+74HcFy+9ATJreMjimaj0u8qm7WHD2m1q363za3Q49P+5TnzVXfZxhbr
  tlgqbLCeO1fzWclIhFqr9UvHdg41f+tWfb99QEZejmJVk08dpudfJNrS5bZXIu6L//vafDOa9
  66X3adSCtoceM97B7Fa/FBQeDFpKdWTsvumr6ozLrrJKjWOaHy440pHMyb3gZV6fyPzp5V8tn
  6ZuLp609OLp0U8DB/vXtSoe3iSd+OCmU9EUu4HrDUa57F+etHgw/plx9vDnuvdagrMiZRf96p
  70+N9yYcUf51mc3lzs24VCWFuLMnlFiKMxINtZiLihMB9X39yWoDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-591.messagelabs.com!1676974762!526111!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18968 invoked from network); 21 Feb 2023 10:19:22 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-6.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 21 Feb 2023 10:19:22 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 7F31D10019D
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 10:19:22 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 72617100182
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 10:19:22 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 21 Feb 2023 10:19:20 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libx11-compose-data: 1.8.3 -> 1.8.4
Date: Tue, 21 Feb 2023 18:18:55 +0800
Message-ID: <1676974737-24910-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1676974737-24910-1-git-send-email-wangmy@fujitsu.com>
References: <1676974737-24910-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 10:19:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177484

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ibx11-compose-data_1.8.3.bb => libx11-compose-data_1.8.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libx11-compose-data_1.8.3.bb => libx11-compose-data_1.8.4.bb} (90%)

diff --git a/meta/recipes-graphics/xorg-lib/libx11-compose-data_1.8.3.bb b/meta/recipes-graphics/xorg-lib/libx11-compose-data_1.8.4.bb
similarity index 90%
rename from meta/recipes-graphics/xorg-lib/libx11-compose-data_1.8.3.bb
rename to meta/recipes-graphics/xorg-lib/libx11-compose-data_1.8.4.bb
index e734a215fd..2131f46213 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-compose-data_1.8.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11-compose-data_1.8.4.bb
@@ -16,7 +16,7 @@ XORG_PN = "libX11"
 SRC_URI += "file://0001-Drop-x11-dependencies.patch \
            "
 
-SRC_URI[sha256sum] = "e31565c84006b6b8e01dc9399c806085739710bc2db2e0930f1511ed9d6585bd"
+SRC_URI[sha256sum] = "c9a287a5aefa9804ce3cfafcf516fe96ed3f7e8e45c0e2ee59e84c86757df518"
 
 REQUIRED_DISTRO_FEATURES = ""
 
-- 
2.34.1


