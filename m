Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DF11C433FE
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 15:21:53 +0000 (UTC)
Received: from mail1.bemta32.sdw.messagelabs.com
 (mail1.bemta32.sdw.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web08.52987.1638804111259176266
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 07:21:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=akRkV7fy;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1638804109; i=@fujitsu.com;
	bh=PRslqenXsCuMDd//iieeD/MY8T9OcsNFngDohm85o3Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=akRkV7fySBmxCai/30P8VEmk5onvUDROdllxXQ8+D7t8YE2uQAT4NY73FP95iPyeJ
	 cVTwjM6AYQg7R1U+ynUVlfbJ2FVKit2dQ5cR7rnHSUlT24olpjAY+Hs7bOJE7yPdUf
	 LaizT9sW0EB4F6lalq1jDAJOYwCxXGRafN4K19ZZtJKE/ZoGs7WJISU+3R6SDCR9Jn
	 TC6Jm1Med97DGeSIpR1J/YHkj9Va3EWTfn+0B08cVmlYerSd4EKoDXLsplkqkZ5/KY
	 aiI9R5+dDGn5UlyR74rf0aUjkwrHzaE0RZNQghdvFH2NzheCocRdhp890ZwIr2PaA7
	 Qi2srIeqfcwxA==
Received: from [100.115.2.64] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-1.aws.ess.symcld.net id 71/48-28795-D8A2EA16;
 Mon, 06 Dec 2021 15:21:49 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsViZ8ORqNurtS7
  RYNJLDos7P9+xOzB6nNu4gjGAMYo1My8pvyKBNaNn9wW2gg8cFdN+/WJtYJzK0cXIxSEk8JhR
  4tf650wQznkmiQMXtjNCOMcZJT7tfMTexcjJwSagJjH91g3WLkYODhEBPYmr/0RBwswCKhIvf
  veAlQgLmEm8/7yRDcRmAYrfPvKeCcTmFXCU2Hf8CQuILSGgIDHl4XtmEJtTwEni+/bzYL1CQD
  W9Zz+yQdQLSpycCVHPLCAhcfDFC2aIXkWJ2ZeboeZUSMya1cYEYatJXD23iXkCo+AsJO2zkLQ
  vYGRaxWiVVJSZnlGSm5iZo2toYKBraGiqa6prZGSql1ilm6iXWqpbnlpcomuol1herJdaXKxX
  XJmbnJOil5dasokRGMQpxawPdzAu7vupd4hRkoNJSZTXQ2xdohBfUn5KZUZicUZ8UWlOavEhR
  hkODiUJ3kYNoJxgUWp6akVaZg4womDSEhw8SiK8BzWB0rzFBYm5xZnpEKlTjLocl6/PW8QsxJ
  KXn5cqJc7bDFIkAFKUUZoHNwIW3ZcYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfPOBpnCk5l
  XArfpFdARTEBHxPSvBjmiJBEhJdXA1D3T7d37ZRdW6OwoDVv91OT0DzH1yPenOhvszbuUZwjc
  Zv/8S7f9Wdee8DzP9bXC90U+KTqvaOQply4tvuviuGvqr9eip5uWlE87IJ2YL3M97VnGNSfHP
  Rfjk2c7zCprUnf/9W7bkSQ5dhMvF72ZIQn2XzuZDSxny2934eHl8Gq5f0+8L2eZzpyFHD67d6
  UarWLb67XX/KXHHqWSQ7Wcp6dXBO57U5Rx5bGFVZ/My7RzPr7rr1pGSDYvafp1rfTbU4GVD8K
  LW5hWbrdgPf406dh0ux0RIpL2d5hs9s3lqhS8cVb3667P4WsmrjP44v1+Us3p0Ans1dHbUk8K
  bat7asv6aeHqRzVlayou2BRnKLEUZyQaajEXFScCAM4EXTNpAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-591.messagelabs.com!1638804108!33698!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26135 invoked from network); 6 Dec 2021 15:21:49 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-8.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 6 Dec 2021 15:21:49 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id AAC5D1009EC
	for <openembedded-core@lists.openembedded.org>;
 Mon,  6 Dec 2021 15:21:48 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 9FFC8100243
	for <openembedded-core@lists.openembedded.org>;
 Mon,  6 Dec 2021 15:21:48 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 6 Dec 2021 15:21:34 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] xauth: upgrade 1.1 -> 1.1.1
Date: Mon, 6 Dec 2021 23:21:18 +0800
Message-ID: <1638804078-8183-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1638804078-8183-1-git-send-email-wangmy@fujitsu.com>
References: <1638804078-8183-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Dec 2021 15:21:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159241

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-graphics/xorg-app/{xauth_1.1.bb => xauth_1.1.1.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xauth_1.1.bb => xauth_1.1.1.bb} (75%)

diff --git a/meta/recipes-graphics/xorg-app/xauth_1.1.bb b/meta/recipes-graphics/xorg-app/xauth_1.1.1.bb
similarity index 75%
rename from meta/recipes-graphics/xorg-app/xauth_1.1.bb
rename to meta/recipes-graphics/xorg-app/xauth_1.1.1.bb
index 24ad9606ec..48259a69ff 100644
--- a/meta/recipes-graphics/xorg-app/xauth_1.1.bb
+++ b/meta/recipes-graphics/xorg-app/xauth_1.1.1.bb
@@ -8,8 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5ec74dd7ea4d10c4715a7c44f159a40b"
 DEPENDS += "libxau libxext libxmu"
 PE = "1"
 
-SRC_URI[md5sum] = "e50587c1bb832aafd1a19d91a0890a0b"
-SRC_URI[sha256sum] = "6d1dd1b79dd185107c5b0fdd22d1d791ad749ad6e288d0cdf80964c4ffa7530c"
+SRC_URI[sha256sum] = "164ea0a29137b284a47b886ef2affcb0a74733bf3aad04f9b106b1a6c82ebd92"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
-- 
2.25.1


