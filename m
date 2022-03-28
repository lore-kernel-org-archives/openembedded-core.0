Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1FB7C4332F
	for <webhook@archiver.kernel.org>; Mon, 28 Mar 2022 09:55:55 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web08.9127.1648461355106905812
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 02:55:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=razlD/TY;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1648461353; i=@fujitsu.com;
	bh=+Ry/5yExM131SVJaWlFF3lN6joAKAmTaXObtY6c1Cq4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=razlD/TYcABge3z0+stEaMVsteIZrH8ph4isdqFbbl2jXi10bQdV459733qM790B2
	 Bt/1XPJRAHh5d/9WCKBodrztUoxvadcS7Fmc6hw+CvRInYeUBDEiZRkFtGJ+V1FmGQ
	 eAQ0cu/uknGa5EwzAlxQx83S1BYdJgB591Vn1baiZ8yiKOq/+Kh6B5CW2s5nrb+xTA
	 EO5iO1Yb8kqPJTpF0gedEOW+jTJXpnBhSHzlTerU8pW4ydqBmqzmB0QduWEdyNXI7q
	 BW9cklwF072gPRkH3bLMOPnWSSyQ2+SVaKn07iNeWi9v8NbwM0m6fBnFQov6ISRjsY
	 vPcFQ75J8ws3A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRWlGSWpSXmKPExsViZ8MxSVejzTH
  JYEmHpcWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmvHsa3XBX/aKRVdvszcw9rF3MXJxCAk8ZpRY
  NvkVI4RznkniyLd9rBDOHkaJ+X3NQGWcHGwCahLTb90ASnBwiAjoSVz9JwoSZhZQkXjxu4cdJ
  CwsYCdx9YozSJhFQFViy9sjbCBhXgEnic1btEDCEgIKElMevmcGsXkFBCVOznzCAjFFQuLgix
  fMEDWKErMvN7NA2BUSs2a1MUHYahJXz21insDIPwtJ+ywk7QsYmVYxWiQVZaZnlOQmZuboGho
  Y6Boamuoa6hrpJVbpJuqlluqWpxaX6BrqJZYX66UWF+sVV+Ym56To5aWWbGIEhmJKMSPTDsZl
  fT/1DjFKcjApifIaZTomCfEl5adUZiQWZ8QXleakFh9ilOHgUJLgvdUMlBMsSk1PrUjLzAHGB
  UxagoNHSYTXtAkozVtckJhbnJkOkTrFqCglztvQCpQQAElklObBtcFi8RKjrJQwLyMDA4MQT0
  FqUW5mCar8K0ZxDkYlYV6XFqApPJl5JXDTXwEtZgJavPadLcjikkSElFQDE5c717xf2k/eXdm
  rk2sqGCRXJ5lTvuDgQcvnO7ceS/ngqve2NODp2eNz0sNs06tbZ14Sjg3pfBx9XDflueGp2Vu0
  rI89kbvleSjnlRrvwylK7y6v/35j1fqYHRO2XPrqmjB/5dR17x1dTKo7Qh0Ei561Zkl5/Fdu1
  vXlXBrTeuWGi9m6AkvjLoaLL774Z107t/xhX41wcNky4dueN/1+7w9lyqlXyZGty3DNrjo6cb
  fTj2k/Vuom6XGoCbWcDffLfsztOCE+uWHCjynaPz4XC38R2vbt4YYlSyeq3Ju6axYvX4woywX
  h2Gzt8uRCtn3MR5vuf5wUl5OfcKLn2paCx36fsiYX7cx9Vi253mYWhxJLcUaioRZzUXEiAFRY
  42BAAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-591.messagelabs.com!1648461352!166005!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.10; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8404 invoked from network); 28 Mar 2022 09:55:52 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-5.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 28 Mar 2022 09:55:52 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 6CB8410044D
	for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 10:55:52 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 5D85610033B
	for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 10:55:52 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 28 Mar 2022 10:55:38 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] lttng-ust: upgrade 2.13.1 -> 2.13.2
Date: Mon, 28 Mar 2022 17:55:26 +0800
Message-ID: <1648461328-15808-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Mon, 28 Mar 2022 09:55:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163701

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../lttng/{lttng-ust_2.13.1.bb => lttng-ust_2.13.2.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/lttng/{lttng-ust_2.13.1.bb => lttng-ust_2.13.2.bb} (95%)

diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.13.1.bb b/meta/recipes-kernel/lttng/lttng-ust_2.13.2.bb
similarity index 95%
rename from meta/recipes-kernel/lttng/lttng-ust_2.13.1.bb
rename to meta/recipes-kernel/lttng/lttng-ust_2.13.2.bb
index 7bd6b6910d..516d90a196 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.13.1.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.13.2.bb
@@ -34,7 +34,7 @@ SRC_URI = "https://lttng.org/files/lttng-ust/lttng-ust-${PV}.tar.bz2 \
            file://0001-Makefile.am-update-rpath-link.patch \
            "
 
-SRC_URI[sha256sum] = "5667bf0269e1e62e2d9cb974c456ff86e0401bd7aa3bfc8d5fdb97233249eddc"
+SRC_URI[sha256sum] = "08679a1dfc2c9428885273861628aa5d828972f389a38bb08fdce39adee589b7"
 
 CVE_PRODUCT = "ust"
 
-- 
2.25.1


