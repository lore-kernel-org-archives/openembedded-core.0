Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A67CDC3527B
	for <webhook@archiver.kernel.org>; Tue, 19 Apr 2022 02:46:34 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web09.4485.1650332718405153445
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Apr 2022 18:45:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ZjWvXHxl;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1650332716; i=@fujitsu.com;
	bh=pkvc5hW27wieCS9hOkhlsQENcd/25XgtW3MLA7Zw+Wo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ZjWvXHxli9Tpo6B8OWbDWpNa4wH4Z1x33KY3/mfCkGcZsvfsaShU/vNOHiiHBPn0E
	 fOf5jpB708TTH1Tehgf87as8mtI5oTRkEXIvNY+xORwnWhz6kZE1Mlu5Gps70cyYzw
	 nIy9Zcx44TBmCVKJPNx7ORPLvXGsOVsQoZL8Wc0iAHVHvUHmilWgm7EKM9TQbOpL/f
	 hyDyhKSu/f7322cWfYEFBj3QpEtkEkSuuUrIi+bWq01WusdPWUNWgSj7bBFmhd2eW5
	 tXiQxelwTnrWx0qShqnZTVp/tCR/CVxk8TXUYlQyDSNNVRdkuppuk2hkvT4ABergno
	 jSo0qaIr8ZXaA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBIsWRWlGSWpSXmKPExsViZ8MxSVdbJC7
  J4PskG4s7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePB1FbmggccFQcu9TM2MH5j72Lk4hASeMwo
  cbpnKlMXIyeQc55J4tBFTYjEHkaJLQvfgCXYBNQkpt+6wdrFyMEhIqAncfWfKEiYWUBF4sXvH
  nYQW1jAXeLZ/mtg5SwCqhKzJt8Cs3kFnCR61h8Dq5EQUJCY8vA9M8gYTgFniUULtCDWOkn8/9
  zKClEuKHFy5hMWiPESEgdfvGCGaFWUmH25mQXCrpCYNauNCcJWk7h6bhPzBEbBWUjaZyFpX8D
  ItIrRKqkoMz2jJDcxM0fX0MBA19DQVNfYUtfUSC+xSjdRL7VUtzy1uEQXyC0v1kstLtYrrsxN
  zknRy0st2cQIDOCUYnWTHYzdK3/qHWKU5GBSEuV9dDA2SYgvKT+lMiOxOCO+qDQntfgQowwHh
  5IEr7RAXJKQYFFqempFWmYOMJpg0hIcPEoivGsFgdK8xQWJucWZ6RCpU4yKUuK8K4SAEgIgiY
  zSPLg2WARfYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTM+w5kPE9mXgnc9FdAi5mAFldPiQV
  ZXJKIkJJqYEo04/qfw6rylVejVkVa9mBd2dMzhXpTgvRled0/X5I88qR8Zy7fNbYCg7oTNU6b
  rc79KXjmL1P4MNpflyfWqr/kzCzO+n+OJTU7v70QNAvQ+7A63+zKb8a0TUlP9XW3rRO6ePRvQ
  pHekr0W1y2kn7r1HY85vXC9/6QDSzdnPppWZr6a4/s8zQNzz105PcsmbsE0lWtlW7kb2iP7OX
  nWdM7eyZ/EdWnL2bwZT3lUo0QupIX6BKbkcx3e5Xuykmu78tQp0+zmGQn0L9eMuJ2i0FSeoty
  ze3pkxIwPLZai+tWH7IQ/f91qLVK9R+KJ5+FPT6bf6a8UXqrFuPvt63NlM36Xai273ntpsWbg
  7yif70osxRmJhlrMRcWJABbr8DFbAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-571.messagelabs.com!1650332715!232830!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3208 invoked from network); 19 Apr 2022 01:45:15 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-20.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 19 Apr 2022 01:45:15 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id A0C22100441
	for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Apr 2022 02:45:15 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 8D495100353
	for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Apr 2022 02:45:15 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 19 Apr 2022 02:45:11 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-hypothesis: upgrade 6.39.5 -> 6.43.2
Date: Tue, 19 Apr 2022 09:44:43 +0800
Message-ID: <1650332686-20457-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1650332686-20457-1-git-send-email-wangmy@fujitsu.com>
References: <1650332686-20457-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Apr 2022 02:46:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164609

Changelog:
=========
Fixed a type annotation for "pyright --strict" (issue #3287).

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-hypothesis_6.39.5.bb => python3-hypothesis_6.43.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.39.5.bb => python3-hypothesis_6.43.2.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.39.5.bb b/meta/recipes-devtools/python/python3-hypothesis_6.43.2.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.39.5.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.43.2.bb
index 03ec94c1c1..ef0512fa08 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.39.5.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.43.2.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "2972edc54c90c70049facfc31db19f1997f9c5e89d2a05f6eeea1107600350f0"
+SRC_URI[sha256sum] = "8b840cd77cd314cac7d17d8fcea1c2a53e0afdc961450857344fe02aeba091e2"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.25.1


