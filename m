Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC355C433EF
	for <webhook@archiver.kernel.org>; Tue, 29 Mar 2022 00:40:04 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web10.1152.1648514402974372022
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 17:40:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=s5BbK0rk;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1648514393; i=@fujitsu.com;
	bh=3tKwyBOtJyB0rtUnCp89w/mj44c72VqQXuxppbHH4Og=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=s5BbK0rkcOMkEY75bO5DDhlltKrGv0V/xfiVyYVOLJHjrfYr1DW6LIRrKk3L7kjP7
	 InlExyDjJxQOpfidihYq45VrZ9hZhvkTwYkfUR9XVAHWKcbzPmfdFzOPzjJlmxmoGn
	 18c2DE8eMkN9nqmcttbIyIY/kRPES/PR239okkMey8I4Wk2IzGfA1b7EJ2zXGePRxK
	 gDN1RIfRN/pSjoo9phhtoFGqC0tCQyutQNt27Nzd3O9UTmj+sJq/BT9m1EjoIawk7l
	 CQc6OuYdzUkSnRksCI2uUSQdumT4UVj+I2JL3ddLos4bsWuyuExcvFJo6SK6SFLalS
	 eOJIRsgLG2DCg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGIsWRWlGSWpSXmKPExsViZ8MRohsR6pR
  ksHe+rsWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmnHi+1bmgsvcFbOPGzQwruPqYuTiEBKYxSTR
  +G0HI4Szh1Hi/dzjTF2MnBxsAmoS02/dYO1i5OAQEdCTuPpPFCTMLKAi8eJ3DztIWFjAXeLXL
  l0Qk0VAVWJegzpIBa+Ak8TXrsvsILaEgILElIfvmSHighInZz5hgZgiIXHwxQtmiBpFidmXm1
  kg7AqJWbPamCYw8s5C0jILScsCRqZVjFZJRZnpGSW5iZk5uoYGBrqGhqa6JrpGxpZ6iVW6iXq
  ppbrlqcUluoZ6ieXFeqnFxXrFlbnJOSl6eaklmxiBwZVSzPJ+B2NT30+9Q4ySHExKorwXNJ2S
  hPiS8lMqMxKLM+KLSnNSiw8xynBwKEnw7g4EygkWpaanVqRl5gADHSYtwcGjJMKb4w2U5i0uS
  MwtzkyHSJ1iVJQS590QDJQQAElklObBtcGi6xKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYd
  5DIFN4MvNK4Ka/AlrMBLS47rEjyOKSRISUVANTVM/M5UyN86cL7bhy62fbZzEVKwGuZe1F9Y/
  ObvhzJIvr0gcn91Km7pkzn8/kOlrzs+I+6xq2/a7Mq7Srkr6enGs5axFPrraF0N6U+SJCCVPe
  lIWwufjnrfq2ht/5zdbKm+kr+IOlmjc5vNosF9x0wSjkNYM2Y1y4tYNPdhibUeCr/G8H/B2a7
  zx7naJ7IZH/xONDHA12TSGPDaZH7zz1aWJ/4nODqs+JF4yeBuwx4Ph0KMLH6lDb5WUOm7ete/
  Gb0+d32LRDQfL1YiZLLSK9s6q9LqXNPXDi7tNo0+fPuwRP+d2o0flWZevT3r/9aXX5o+Ip7M+
  WXLuQ7G7+8uESXcb/NuJKyw3ZWtLSj/krsRRnJBpqMRcVJwIA2tNHqykDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-587.messagelabs.com!1648514392!9230!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6260 invoked from network); 29 Mar 2022 00:39:52 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-11.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 29 Mar 2022 00:39:52 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 22T0dqm9021200
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Mar 2022 01:39:52 +0100
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 29 Mar 2022 01:39:50 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-hypothesis: upgrade 6.39.2 -> 6.39.5
Date: Tue, 29 Mar 2022 08:39:40 +0800
Message-ID: <1648514380-20706-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Mar 2022 00:40:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163724

Changelog:
=========
Improve error detection and message when Hypothesis is
run on a Python implementation without support for "-0.0", which is
required for the "floats()" strategy but can be disabled by unsafe
compiler options (issue #3265).

If the "shrink" phase is disabled, stop the "generate" phase as
soon as an error is found regardless of the value of the
"report_multiple_examples" setting, since that's probably what you
wanted (issue #3244).

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-hypothesis_6.39.2.bb => python3-hypothesis_6.39.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.39.2.bb => python3-hypothesis_6.39.5.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.39.2.bb b/meta/recipes-devtools/python/python3-hypothesis_6.39.5.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.39.2.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.39.5.bb
index 01732d0087..03ec94c1c1 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.39.2.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.39.5.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "7a16ba804baeebdcc5dc4638c32c5fc3fc552c1be30ae21a84c5d9c802b06e31"
+SRC_URI[sha256sum] = "2972edc54c90c70049facfc31db19f1997f9c5e89d2a05f6eeea1107600350f0"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.25.1


