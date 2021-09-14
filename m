Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.534.1631662572363947006
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Sep 2021 16:36:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=CrJLApUO;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1631662570; i=@fujitsu.com;
	bh=Y4g2ahqjL/FSWG8xdHJBhol4F1arl0Ld8PlnEFyc43o=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=CrJLApUOov3TwWLH447XYKEii1FErVaIb515AD08FWjKuSZZakFQOIRxAiT6Wgj9D
	 gx4cG5Bp7BwEZJuRyvupXTpFqrApXATAMt0FAsSNM9tBZM8IpNHnKNnGgaeuFZeqwA
	 zoivFpPiiNkb+Q6KdusQTbRHZYHEtbAb7z5RXSS8SKAUcOCVU3QSj/NdyR1XYtbPfZ
	 notz3drwI2tvcpsWhDqw7Qs8Q1LwGmZlF4HCplFAqfNdJpN1G7KTIMqdr82EWwbyqh
	 G2uRVb8gBN/8zO6oRhyy5DSGg8PKQ1/b6S/5K+QHrKFIZ8u2O0Mz167WHaleVmW4a1
	 9IiIHjG4nlVrA==
Received: from [100.113.7.40] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-central-1.aws.symcld.net id 9E/0B-23595-AE131416; Tue, 14 Sep 2021 23:36:10 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRWlGSWpSXmKPExsViZ8MRovvS0DH
  R4PsOK4s7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePU/r3sBe2cFWeWb2dsYFzL0cXIxSEkMItJ
  4s+Fv+wQzglGiWMdH1i7GDk52ATUJKbfugFkc3CICOhJXP0nChJmFlCRePG7hx3EFhbwktiws
  Y8ZxGYRUJX4/20lC0g5r4CTxMmjGSBhCQEFiSkP34OV8AoISpyc+YQFYoyExMEXL5ghahQlZl
  9uZoGwKyRmzWpjmsDIOwtJyywkLQsYmVYxWiYVZaZnlOQmZuboGhoY6BoaGuua6hqZGOolVuk
  m6aWW6ian5pUUJQJl9RLLi/WKK3OTc1L08lJLNjECwyulkPXjDsZDrz/oHWKU5GBSEuXdweOY
  KMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mC94EeUE6wKDU9tSItMwcY6jBpCQ4eJRFeRwOgNG9xQ
  WJucWY6ROoUo6KUOK8oMEKEBEASGaV5cG2w+LrEKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZ
  iXRR9oCk9mXgnc9FdAi5mAFh/Z7wCyuCQRISXVwBR4xnCZTd/FFwGzV+rcD7FZ+iJQv1jQRa7
  YJMMmxdZRXia6O6F+8Z1y3v1fOLz+ZlWJH/QWU8y3/1F6knexw8otou9Toq3u+Md6uO7PYqx7
  PJ/zvqme7LF5780+b+hxPLp7gcfuf/KuuavEayWXHk+WaZyxbpqPtmrhOuejvj+Z7z38v0Z5w
  +Q30RvUPn80mf/3TI7oYs5fkvnBf/fIf92lMceLozpikdNj17bf0Z+tlX5LWOakFm2altku9f
  D8QZUHyjktDZ2KMze9q+290cL23l5nfkfk/Ow1W9olpb6lshtm/lhcv7J7j/yTadPrRAubspb
  479l99WFv0q5L3WcKLSz9lETX5649rfBxvhJLcUaioRZzUXEiAKL4WkEqAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-238.messagelabs.com!1631662569!45055!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30563 invoked from network); 14 Sep 2021 23:36:09 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-2.tower-238.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 14 Sep 2021 23:36:09 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 18ENa1bP013232
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Sep 2021 00:36:09 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Wed, 15 Sep 2021 00:36:00 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 1/3] vulkan-headers: upgrade 1.2.182 -> 1.2.191
Date: Wed, 15 Sep 2021 07:35:44 +0800
Message-ID: <1631662546-37061-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ulkan-headers_1.2.182.0.bb => vulkan-headers_1.2.191.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-headers_1.2.182.0.bb => vulkan-headers_1.2.191.0.bb} (92%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-headers_1.2.182.0.bb b/meta/recipes-graphics/vulkan/vulkan-headers_1.2.191.0.bb
similarity index 92%
rename from meta/recipes-graphics/vulkan/vulkan-headers_1.2.182.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-headers_1.2.191.0.bb
index 5ae56ec076..679a455ef1 100644
--- a/meta/recipes-graphics/vulkan/vulkan-headers_1.2.182.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-headers_1.2.191.0.bb
@@ -9,9 +9,9 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=master"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=main"
 
-SRCREV = "37164a5726f7e6113810f9557903a117498421cf"
+SRCREV = "4fee3efc189c83ccd26a9cd8265185c98458c94d"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1

