Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A4F7C433FE
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 10:27:15 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web12.9437.1644316033259742826
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Feb 2022 02:27:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Ym/gKMh3;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1644316031; i=@fujitsu.com;
	bh=GmpwwUFxz5DMN+/a7UzhjzF8+cxBOoRpuWcyh5PIaqo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Ym/gKMh3ptPf+O67QpMgdArNGocVCDaKkwmsS02bWc5ox55GKz2zH2mVkTfR4f92P
	 tDdHrxjvfWGiYUdQ2kCifqdWZB5Relfgo+/fnDh/6gTHeQ6MdVmB3Q5V4IagAYtbxp
	 D0diB/nSnPDtaSnkGz0X5CvRfJXdlLdqWhIAH+2FOvoj26FeSNScwrLIRInKwCE7/9
	 c01XW9Hb/CS8p3xgfQeuVVCyHXZ99Xw2WJk7jG4Fg+IZ0z+5tH++YUVbWkjmFfb0qZ
	 i2R/UQDRzAUX3uY0x3aagrSjjmAq12yTiVnb8hABi9G/I3521D1aS3gTBZuJNv/l1+
	 AhitYPSyTE71Q==
Received: from [100.115.34.36] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-2.aws.ess.symcld.net id 6C/B4-14616-F7542026;
 Tue, 08 Feb 2022 10:27:11 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRWlGSWpSXmKPExsViZ8MxSbfOlSn
  JYOkBA4s7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPh20VsBfe5Kh4vnMjWwPiEs4uRi0NI4DGj
  xPcba5khnPNMEu+vvGKDcI4zSvS/2MbaxcjJwSagJjH91g0gm4NDREBP4uo/UZAws4CKxIvfP
  ewgtrCAo8TxljcsIDYLUHzJ602MIDYvUHzjnEfMILaEgILElIfvwWxOASeJ+zuegdULAdV83L
  WSFaJeUOLkzCcsEPMlJA6+eAHVqygx+3IzC4RdITFrVhsThK0mcfXcJuYJjIKzkLTPQtK+gJF
  pFaN1UlFmekZJbmJmjq6hgYGuoaGprrGlrpGBgV5ilW6iXmqpbnlqcYmukV5iebFeanGxXnFl
  bnJOil5easkmRmAYpxSrn9jB+HTlT71DjJIcTEqivEmqTElCfEn5KZUZicUZ8UWlOanFhxhlO
  DiUJHitXYBygkWp6akVaZk5wJiCSUtw8CiJ8K4GSfMWFyTmFmemQ6ROMSpKifPKgCQEQBIZpX
  lwbbA4vsQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmNcFZApPZl4J3PRXQIuZgBZ/XfQvEWh
  xSSJCSqqBaZNZeNOOg2VTV3/XuVffzx0TLtZWln+y75NkyUlx1iX2dWLRpe/C992+Hzbj5Q4H
  Se0tU1M/vly3xf/Gi6o3H+6neRx8ZPTaouVn7PHnUW0eGQu/hN0JXR5jZyTeFZu//K7c7Jfbr
  S4E8PF4i1RLb0tY8W9LmIwP663rHjofAw8EpjFqvWgJenm2fpHLwg9fJPXrIpcve1isq7f1hu
  LkW+u/OYuExfR3eolKTnYxM9jPvHGfrl/Vya6KlPYrmu9UCvLf75AtW77I/kvEnKWLXj/aaH/
  R/KOCZnph8eXzqTMm5mvHKjXPzmJSd00/o9kfv1nr8lqLcwGiJ3av/Sq+OERK7c/sK4vLe7X2
  5jqYKLEUZyQaajEXFScCACGCW4xeAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-548.messagelabs.com!1644316030!8255!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19722 invoked from network); 8 Feb 2022 10:27:10 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-15.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 8 Feb 2022 10:27:10 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 6F86D100453
	for <openembedded-core@lists.openembedded.org>;
 Tue,  8 Feb 2022 10:27:10 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 535CC100451
	for <openembedded-core@lists.openembedded.org>;
 Tue,  8 Feb 2022 10:27:10 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Tue, 8 Feb 2022 10:26:57 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-pytest: upgrade 6.2.5 -> 7.0.0
Date: Tue, 8 Feb 2022 18:26:40 +0800
Message-ID: <1644316000-5853-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1644316000-5853-1-git-send-email-wangmy@fujitsu.com>
References: <1644316000-5853-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Feb 2022 10:27:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161492

License-Update: year from "2004-2020" changed to "2004".

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pytest_6.2.5.bb => python3-pytest_7.0.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pytest_6.2.5.bb => python3-pytest_7.0.0.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-pytest_6.2.5.bb b/meta/recipes-devtools/python/python3-pytest_7.0.0.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-pytest_6.2.5.bb
rename to meta/recipes-devtools/python/python3-pytest_7.0.0.bb
index 0d8fdf6373..a68b452a0a 100644
--- a/meta/recipes-devtools/python/python3-pytest_6.2.5.bb
+++ b/meta/recipes-devtools/python/python3-pytest_7.0.0.bb
@@ -3,9 +3,9 @@ HOMEPAGE = "https://pypi.org/project/pytest/"
 DESCRIPTION = "The pytest framework makes it easy to write small tests, yet scales to support complex functional testing for applications and libraries."
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=81eb9f71d006c6b268cf4388e3c98f7b"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=bd27e41b6550fe0fc45356d1d81ee37c"
 
-SRC_URI[sha256sum] = "131b36680866a76e6781d13f101efb86cf674ebb9762eb70d3082b6f29889e89"
+SRC_URI[sha256sum] = "dad48ffda394e5ad9aa3b7d7ddf339ed502e5e365b1350e0af65f4a602344b11"
 
 DEPENDS = "python3-setuptools-scm-native"
 
-- 
2.25.1


