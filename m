Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E1C8C47089
	for <webhook@archiver.kernel.org>; Mon,  5 Dec 2022 02:29:32 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web11.5398.1670207362295609299
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Dec 2022 18:29:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=j8N0ZoNn;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670207360; i=@fujitsu.com;
	bh=8eNq2BKULpPqVgNToB2frFsDQT6/UWj9e6SwOz9am80=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=j8N0ZoNnFN9OVU4qV2gPHZ1HsQhLnb1EzSzwWfFGRpOI2LAyWJsqVxGVDKwvlWVcQ
	 eBvmJ+RODIEXCQlgDv+NmacUDSXgcRk7BUdBlVa7s6gVmKQjps3o7f/7NuHZwZgdh0
	 uG9UOa7055Lu2ePnoF7zHap0A3lRrTHYf/Gwvq9b159cRxu9Xey8tIveOD8LkANJDc
	 mH42t3V2eIkH6GtH7rqTGiKmMZKHctUAAg1zARNzo7S9YPJFydKn1+Mc+b9UwlPRYQ
	 5XdqmLl4DNVNldRSl96fFT/KRmvsCPlkNnwuGtkkruldf+evT3YHYvWfJ01LpajEKN
	 /IdxUlK7LmLyg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrAIsWRWlGSWpSXmKPExsViZ8ORpFsf3pt
  ssP+ZisWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmjF//mf2giPsFT/v7WZuYLzP1sXIxSEk8IBR
  4srL74wQzmUmiQfTX7FAOLsZJX7/+MTexcjJwSYgJXHj/n+gFg4OEQE9iav/REHCzAIqEi9+9
  4CVCAtYSrQ+mMcGYrMAxd9s2M0IYvMKOEqs71vMAmJLCChITHn4nhkiLihxcuYTFog5EhIHX7
  xghqhRlJh9uRmqvkJi1qw2JghbTeLquU3MExj5ZyFpn4WkfQEj0ypGs+LUorLUIl1DA72kosz
  0jJLcxMwcvcQq3US91FLd8tTiEl0jvcTyYr3U4mK94src5JwUvbzUkk2MwGBMKVbp28H4dtkf
  vUOMkhxMSqK8So+6k4X4kvJTKjMSizPii0pzUosPMcpwcChJ8EaH9SYLCRalpqdWpGXmACMDJ
  i3BwaMkwivkDZTmLS5IzC3OTIdInWI05ljbcGAvM8fMr20HmIVY8vLzUqXEeVVAJgmAlGaU5s
  ENgkXsJUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvG6+QFN4MvNK4Pa9AjqFCeiUjfxdIKe
  UJCKkpBqYMjvTX0xkXtDNWCN9rnJJ2MfZqooCIRd5n7x/83v194xVwpZ5u2bJCF2vmRV8NJXj
  9K45laq3FTQsokQlba4KdSQ0WepM2s7+9F84v9vhW6lmceuy/lVM+5qxKXtTjs/uyYk3ipRvG
  76pE/Oce/TM/hjN14qeoXXnI5ansh/4uYuTtS2E3zAvY9mkQ0yrTbLOZ5l36FgGnAr2fzf9jf
  ehp4dMGxRiVyxq/sGwVvviquQE/k9MOxUWBN05fnfRklebNJes2Pfz+BQxxoLTU27stAqo3Xk
  naXFte21NWKVBy6Nzc/Pmzi1qubhx102Ge9JcptGm0nunH0/78933q3iCrstUo7uB98x3TRHQ
  vmsoqsRSnJFoqMVcVJwIAOgVht9TAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-571.messagelabs.com!1670207359!126937!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18318 invoked from network); 5 Dec 2022 02:29:19 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-20.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 5 Dec 2022 02:29:19 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 4D3811AF
	for <openembedded-core@lists.openembedded.org>; Mon,  5 Dec 2022 02:29:19 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 416D51AC
	for <openembedded-core@lists.openembedded.org>; Mon,  5 Dec 2022 02:29:19 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 5 Dec 2022 02:29:17 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libxft: upgrade 2.3.6 -> 2.3.7
Date: Mon, 5 Dec 2022 10:28:49 +0800
Message-ID: <1670207333-6986-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Dec 2022 02:29:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174261

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-lib/{libxft_2.3.6.bb => libxft_2.3.7.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxft_2.3.6.bb => libxft_2.3.7.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-lib/libxft_2.3.6.bb b/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-lib/libxft_2.3.6.bb
rename to meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb
index 23c7ece3ab..da25b0a05a 100644
--- a/meta/recipes-graphics/xorg-lib/libxft_2.3.6.bb
+++ b/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb
@@ -21,7 +21,7 @@ PROVIDES = "xft"
 PE = "1"
 
 XORG_EXT = "tar.xz"
-SRC_URI[sha256sum] = "60a6e7319fc938bbb8d098c9bcc86031cc2327b5d086d3335fc5c76323c03022"
+SRC_URI[sha256sum] = "79f0b37c45007381c371a790c2754644ad955166dbf2a48e3625032e9bdd4f71"
 
 XORG_PN = "libXft"
 
-- 
2.25.1


