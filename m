Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66882C433EF
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 06:41:24 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.17])
 by mx.groups.io with SMTP id smtpd.web08.3818.1653460873482000096
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 May 2022 23:41:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=PIm6xUJD;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.17,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1653460871; i=@fujitsu.com;
	bh=8a8AZSXjJNit1aLPCtnYO1kiqsjzSUalC5ORqf6mgUI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=PIm6xUJD+RRnxhXI7Gk4S9oclqhRV6ivt24gqJReA8RTUBxBjlXoTZirngM0zziWq
	 8oUUebT1ks4gAP6gbqUEECR+uVGRd7UQ6j2D5N2jDNTS4WmmT6q0lh9oRC6aQl2IUr
	 xy3M+tRPxgcV/97GRlSCA3QU8jRu8vWbtMHjiw9C7QMYhw+9hjlZWe0Pw4yM0a/tCZ
	 925+GGh9o3M9kgffiMOIf1wCmQLugpGKoQwC5dcSroYE4ahQMVBHapfcgoNqsKNqQS
	 +J/TfDy3oKWx3V1+rBzMkaoALX+HGwrjR1yUs1ulZlDHcWzCvxEsMxJdPLdCizoeG7
	 9sjoumGICnhIQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsViZ8ORqNt2vjf
  JYEaLhcWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmnFo/Sfmgh6OisfndrI1MK5j72Lk4hASeMwo
  selGBzOEc55J4v2N41DOHkaJjknTgBxODjYBNYnpt26wdjFycIgI6Elc/ScKEmYWUJF48buHH
  cQWFnCX+PvuMROIzSKgKvHo3hGwVl4BJ4nbdz8wgtgSAgoSUx6+B4tzCjhLbP1xlAXEFgKq+X
  JuMyNEvaDEyZlPWCDmS0gcfPGCGaJXUWL25WYWCLtCYsaMbWwQtprE1XObmCcwCs5C0j4LSfs
  CRqZVjFZJRZnpGSW5iZk5uoYGBrqGhqa6hrpGhuZ6iVW6iXqppbrlqcUluoZ6ieXFeqnFxXrF
  lbnJOSl6eaklmxiBQZxSzHhzB2Nr30+9Q4ySHExKorwnNvQmCfEl5adUZiQWZ8QXleakFh9il
  OHgUJLgXX0aKCdYlJqeWpGWmQOMKJi0BAePkgiv0xmgNG9xQWJucWY6ROoUoy7Hsa/f9zMLse
  Tl56VKifOePwtUJABSlFGaBzcCFt2XGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnzqp4DmsK
  TmVcCt+kV0BFMQEfk84IdUZKIkJJqYJJx13yafWxX6ARh87caufvaf9yfyFYwg21/4/VVix+2
  PS+tWWZfWTL1Z6RUbusna1N+g212X8JtHMTWRUawFAb6Nbts3PAnOGi2w7ZY/V1tGulbUz3Yp
  q/m/lfseen0xR7WtooPuQH19+/81zhUnlTMccyeR1Oi4c2K9yyVDtMmFn/Z8rExp7Zite+evl
  VVH+YECOWcidslvv8975kVtYrCPheW1HIXF7ktFy+Y7FD4qX7OdW/Fmd/FDvxUf5oa9uGg6dF
  HBTt3bTymzjzRZvr9A8dPvG03Fb3yf1K11FPp6lQDobszTrs2bru44FbojFuLpXyli2eULzQz
  fLw9Y9viJt0Nl2fWbpi3wPZ98BslluKMREMt5qLiRABqbGSuaQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-585.messagelabs.com!1653460870!88206!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22808 invoked from network); 25 May 2022 06:41:10 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-3.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 25 May 2022 06:41:10 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 517FB1001A1
	for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 07:41:10 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 3434510019A
	for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 07:41:10 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 25 May 2022 07:41:00 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-hypothesis: upgrade 6.46.4 -> 6.46.7
Date: Wed, 25 May 2022 14:40:36 +0800
Message-ID: <1653460837-12404-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1653460837-12404-1-git-send-email-wangmy@fujitsu.com>
References: <1653460837-12404-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 May 2022 06:41:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166098

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-hypothesis_6.46.4.bb => python3-hypothesis_6.46.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.46.4.bb => python3-hypothesis_6.46.7.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.46.4.bb b/meta/recipes-devtools/python/python3-hypothesis_6.46.7.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.46.4.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.46.7.bb
index 86d6793670..06bbe02f47 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.46.4.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.46.7.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "f5c24a3d3f8a0d8de2dd33079bf1580a3cfbfe74763187d47570fc9beea84c9b"
+SRC_URI[sha256sum] = "967009fa561b3a3f8363a73d71923357271c37dc7fa27b30c2d21a1b6092b240"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.25.1


