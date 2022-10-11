Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 087FBC4332F
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 08:22:19 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web09.4931.1665476529647810251
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 01:22:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Sq2H7Bd1;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1665476527; i=@fujitsu.com;
	bh=urQ/cIbExjiCXwbjkX+016JtruK33eR0qynXdLgYRyw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Sq2H7Bd1W1Ubu9Ty3zsfi42A5lh7PxOvq0FH+kK0dxUvDm14V00vfcWCxvwQi+nrA
	 +mbsgbRWOP9/DFfN37toBwdJIEZW9+uo4LmyCe+WKjcVTHetj5DS9YZ3sAMy0lHI0c
	 TFtVEp+l1gC1WSUQzGtAaG7vqHZx+PfJoYPWN9WNNoNGaSmK/Zi2TCN7Df8gx9IuwB
	 i1Pztydrw8vrkQLOnYbpftuuva/zrjBdcxxzRpkTVSg8sUQV1RfPAZ/txmAsii4uvb
	 3Lhg5ITgFa/R6KxfijJsNU04btvQwAlGIP8XMcUFuW18KClbexi4uqFiHnJa4z2V1L
	 ijR1f95E2ZnoQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMIsWRWlGSWpSXmKPExsViZ8ORpLte3TX
  Z4GKrmMWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmrFt/XLWgq0cFauXbmFqYLzP3sXIxSEk8IBR
  YlbPbxYI5zKTxOa2XUAOJ5Czh1Hi88kyEJtNQE1i+q0brF2MHBwiAnoSV/+JgoSZBVQkXvzuY
  QexhQWcJX5c6GMHKWERUJU4tEgTJMwr4CRxaft9VhBbQkBBYsrD98wgJZxA5Q1LAyEWOUmsO7
  uBDaJcUOLkzCcsENMlJA6+eMEM0aooMftyMwuEXSExa1YbE4StJnH13CbmCYyCs5C0z0LSvoC
  RaRWjVVJRZnpGSW5iZo6uoYGBrqGhqa6prpGxsV5ilW6iXmqpbnlqcYmuoV5iebFeanGxXnFl
  bnJOil5easkmRmD4phSzvtzBOL3vp94hRkkOJiVR3qvPXZKF+JLyUyozEosz4otKc1KLDzHKc
  HAoSfC+UHVNFhIsSk1PrUjLzAHGEkxagoNHSYR3qQpQmre4IDG3ODMdInWKUZdj5te2A8xCLH
  n5ealS4rxtakBFAiBFGaV5cCNgcX2JUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjDvCpApPJl
  5JXCbXgEdwQR0xMmrTiBHlCQipKQamEKYJzbcO/lYNsL43OcEh+9Hb3oU+LZJecUqfl/yftkE
  6bCo1pcHhVIFbZxKkuf5L7KS9dOS2x1Tz29tsmjlqZNhr+IOHpEv2SL7V/531Eqh03k+1mKzX
  +ibeKXbe5+++TPh0yIJMaNcYa1pjb479p4yMG3Z17Zn+ie7su8RPIbH5qvLmKz9qnD66FPtt0
  Zvaxnsotq2mmxrmyfefyKIO/JUwr/HD99fne/ztWxBUc/+PlFnti1h2w75qrolrv7T5/fLjI2
  hQm+e+mqNY0qHdBad+ym7OLC2pvrh/7QS8Qt3Gw6/rD++91n3kqipjkusYmXyJ+b73TcO39N8
  6MWnq58dq6K7d7LU9Du2qqTVKbEUZyQaajEXFScCAGIdyPhmAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-591.messagelabs.com!1665476527!447767!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26215 invoked from network); 11 Oct 2022 08:22:07 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-4.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 11 Oct 2022 08:22:07 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 05A9A1AC
	for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 09:22:07 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id EEF581AB
	for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 09:22:06 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 11 Oct 2022 09:22:05 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-pytz: upgrade 2022.2.1 -> 2022.4
Date: Tue, 11 Oct 2022 16:21:45 +0800
Message-ID: <1665476508-16543-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1665476508-16543-1-git-send-email-wangmy@fujitsu.com>
References: <1665476508-16543-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Oct 2022 08:22:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171607

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pytz_2022.2.1.bb => python3-pytz_2022.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytz_2022.2.1.bb => python3-pytz_2022.4.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb b/meta/recipes-devtools/python/python3-pytz_2022.4.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-pytz_2022.2.1.bb
rename to meta/recipes-devtools/python/python3-pytz_2022.4.bb
index bb7aeeec35..330314f1bd 100644
--- a/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb
+++ b/meta/recipes-devtools/python/python3-pytz_2022.4.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1a67fc46c1b596cce5d21209bbe75999"
 
 inherit pypi setuptools3 ptest
 
-SRC_URI[sha256sum] = "cea221417204f2d1a2aa03ddae3e867921971d0d76f14d87abb4414415bbdcf5"
+SRC_URI[sha256sum] = "48ce799d83b6f8aab2020e369b627446696619e79645419610b9facd909b3174"
 
 RDEPENDS:${PN}:class-target += "\
     ${PYTHON_PN}-datetime \
-- 
2.25.1


