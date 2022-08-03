Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F89EC19F28
	for <webhook@archiver.kernel.org>; Wed,  3 Aug 2022 08:41:02 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web12.6278.1659516053971063203
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Aug 2022 01:40:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=e+SWSyKT;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1659516052; i=@fujitsu.com;
	bh=BU7WxYokX5DRy5bd8plwSGXc0l5jshm3glu+405TouA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=e+SWSyKTYtTexCYHwZAYJL7FkcfQp2vY/O9mvMf3EXna3OTwJFgwKg5GUxwGUW4Ee
	 zdLWRFzGjpURZt1g1lE+2ziquFBy3p02h/i/VE8e2a93Pgl2c+S1iYKN1K5n8UZ+zV
	 ZLQbH5duE5xVAFq+T4v6HdwDGTprifDUma+mHUpCephhlv9ZjWuRLi2y/ThuRENfYK
	 JTJiHlaNWbx8iCyH7rGPSvgX4gGVsQGZIWE+CwpcSX5uaYpCQNzTFd1en4el8fAY54
	 wZrsCF4Kj5cxN1ei9dvzuZRKm2QRo3JVrig21xmDxrENF3+2WFIvJXWi3ayYuE90Cs
	 zy0mZZKcE7qgw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKIsWRWlGSWpSXmKPExsViZ8ORqDvZ5FW
  SweSDhhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8a+npWsBWs4K06u3cXcwHiRo4uRi0NI4DGj
  xP9rS5ghnGtMEu+3fWPpYuQEcnYzShz5owtiswmoSUy/dYO1i5GDQ0RAT+LqP1GQMLOAisSL3
  z3sILawgIvEkXufwGwWoPiv9mdgNq+Ak8TufVtYQWwJAQWJKQ/fM4PYnALOEn2nGlhARgoB1b
  S8NIUoF5Q4OfMJC8R4CYmDL14wQ7QqSsy+3MwCYVdIzJixjQ3CVpO4em4T8wRGwVlI2mchaV/
  AyLSK0TqpKDM9oyQ3MTNH19DAQNfQ0FTX2FTX0MJEL7FKN1EvtVS3PLW4RNdIL7G8WC+1uFiv
  uDI3OSdFLy+1ZBMjMIRTipV37GBsW/VT7xCjJAeTkigvk+KrJCG+pPyUyozE4oz4otKc1OJDj
  DIcHEoSvBlaQDnBotT01Iq0zBxgPMGkJTh4lER4hZWA0rzFBYm5xZnpEKlTjLocM7+2HWAWYs
  nLz0uVEufVMwYqEgApyijNgxsBi+1LjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5VY2ApvB
  k5pXAbXoFdAQT0BE6XC9AjihJREhJNTBNyHcXuGbUtkhzx+2Q3fHfXittWvDwUMKZ+KbqAzdF
  TsQZTLO8ftlKlf990e0A5u7szL7c+Z0mGyqO1X06EHls57L71qZHVFJWRE7+dnm90FLb7UpvT
  ORSvlgd6F8odmBzZ5bMsUcl51bksNz8LsxpsXTq8ruWx+W2vfjI/+Ok6K3ovXabalMYDkz2jD
  3ceERNMXyD2H8G+8R35/ZMPf2lvHSL+C3WUj4dlrCnQhy8GZ5C8yS9N//bcnGm8yThvFN5M9J
  8jtz3zq9y2pxZwK4UYn/A/e6d4/M71goFThVd7l589vOuiNOZ33/WtQf1bg9UzMsX8+J7vnlP
  8n/tN60NFne0F74+xrzotQaPtu4nJZbijERDLeai4kQAp0xZ8mgDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-571.messagelabs.com!1659516051!104743!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29000 invoked from network); 3 Aug 2022 08:40:51 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-17.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 3 Aug 2022 08:40:51 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 7E6A6100190
	for <openembedded-core@lists.openembedded.org>;
 Wed,  3 Aug 2022 09:40:51 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 71CE1100043
	for <openembedded-core@lists.openembedded.org>;
 Wed,  3 Aug 2022 09:40:51 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 3 Aug 2022 09:40:50 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-hatchling: upgrade 1.5.0 -> 1.6.0
Date: Wed, 3 Aug 2022 16:40:30 +0800
Message-ID: <1659516030-31123-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1659516030-31123-1-git-send-email-wangmy@fujitsu.com>
References: <1659516030-31123-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Aug 2022 08:41:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168806

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-hatchling_1.5.0.bb => python3-hatchling_1.6.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hatchling_1.5.0.bb => python3-hatchling_1.6.0.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-hatchling_1.5.0.bb b/meta/recipes-devtools/python/python3-hatchling_1.6.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-hatchling_1.5.0.bb
rename to meta/recipes-devtools/python/python3-hatchling_1.6.0.bb
index 61b3e87b92..e06bdf02ec 100644
--- a/meta/recipes-devtools/python/python3-hatchling_1.5.0.bb
+++ b/meta/recipes-devtools/python/python3-hatchling_1.6.0.bb
@@ -8,7 +8,7 @@ inherit pypi python_hatchling
 DEPENDS += "python3-pluggy-native python3-tomli-native python3-pathspec-native python3-packaging-native python3-editables-native"
 DEPENDS:remove:class-native = "python3-hatchling-native"
 
-SRC_URI[sha256sum] = "9ca409a41140cc662164680b78adcd3ba77b23a945984bd9970d11fe38e86a38"
+SRC_URI[sha256sum] = "bd6e8505de511ac4217ff50927f6d1845494608e401e63a62b830c31fb613544"
 
 do_compile:prepend() {
     export PYTHONPATH=src
-- 
2.25.1


