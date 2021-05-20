Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.69])
 by mx.groups.io with SMTP id smtpd.web08.2594.1621474723788688641
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 May 2021 18:38:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=KBjFIjOO;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.69, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1621474721; i=@fujitsu.com;
	bh=TbDq7JRkuasQo6PQH9WOXw5bJcJU7CS697nvm/192fo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=KBjFIjOOcp36qVLO96n+B82cR7AqimAqmMc6i1f5cZc8KfKsZVAbqXgVvJx++ogQ8
	 NtwdS1ESYRgqA5eR9Mi/XxHzVLoM3tmpcH0XVgOG7uIDH1gsL5hxF7q30agimKLeEI
	 hz/G0Tqez7foamSZGzo4CA8eOGlNa2XPukQdLSVk5G0AiigxByTzzSfwyZDwGwy+XD
	 ETDjPxoqQZjTOeGecezeXujxRBaMXQjzEUitnSOz4gLjU+8WeJWyhjR7rQ1ap0jbO3
	 Y68Vjd5Gf3h7eot7lgY9jJ9085WxUzM+Sb3wRr3JkbGy83suJ9yikm20U79brrsoc0
	 HU+4yNQ6CYT2g==
Received: from [100.112.196.73] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-b.eu-west-1.aws.symcld.net id B0/80-64908-F9DB5A06; Thu, 20 May 2021 01:38:39 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkkeJIrShJLcpLzFFi42Kxs+EI0Z2/d2m
  CwaL18hZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bHaQvYCv5wVFzaeYGpgXE1RxcjF4eQwCwm
  iSOX7zNDOHsYJRpeNbJ1MXJysAnoSpx7vJa9i5GDQ0RAT+LqP1GQsLCAt8SbB2eZQMIsAqoSU
  39ngYR5BTwlJv0/xwRiSwgoSEx5+J4ZIi4ocXLmExYQm1lAQuLgixfMIK0SAooSs6fLQ5RXSM
  yYsY1tAiPPLCQds5B0LGBkWsVokVSUmZ5RkpuYmaNraGCga2hopGtoaaFraGygl1ilm6SXWqp
  bnlpcomuol1herFdcmZuck6KXl1qyiREYQikFx5p2MJ58/UHvEKMkB5OSKK/Z/UUJQnxJ+SmV
  GYnFGfFFpTmpxYcYZTg4lCR4xXcvTRASLEpNT61Iy8wBhjNMWoKDR0mE9/82oDRvcUFibnFmO
  kTqFKOilDgv1x6ghABIIqM0D64NFkOXGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnz1oNs58
  nMK4Gb/gpoMRPI4sZFIItLEhFSUg1M6eYHi5a+z+ibfLXcSmGWfJmtjg+/xATnwyvfrFk991Z
  1/rUZOsxVmus/8gTNCUpNlmI8t6nhQuvdutsPX7QZbgna9rAu9NLhX00nwycq3Wjn3unGVnz9
  XOrrsJ7W8vszmNr+VLmlejnJmR463cs5L8vmMsuaa1udxc4YMTrbrOuKeK+3covMirdHbz2ff
  UfT+o1a/TQGx79X1yZ8rz4WsMYjvcT/x1xx186X72Yrpv18s1/LN1nxJ/+0xOtN5y6lfrGael
  FhBQ/37eBrJ8IvmfU8f3PjzgdZ/jlt7Zc1FLUOh+ZsMCw77peYaH321jlBH86YCnEu211qGY+
  +cM66c+juXMHWgHe7Ns7jUI6dqcRSnJFoqMVcVJwIAKYZ4XMcAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-18.tower-287.messagelabs.com!1621474719!235836!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12329 invoked from network); 20 May 2021 01:38:39 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-18.tower-287.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 20 May 2021 01:38:39 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14K1cdH7008323
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 20 May 2021 02:38:39 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 20 May 2021 02:38:37 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] python3-sortedcontainers: upgrade 2.3.0 -> 2.4.0
Date: Thu, 20 May 2021 09:38:32 +0800
Message-ID: <1621474712-127620-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...tedcontainers_2.3.0.bb => python3-sortedcontainers_2.4.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-sortedcontainers_2.3.0.bb => python3-sortedcontainers_2.4.0.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-sortedcontainers_2.3.0.bb b/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-sortedcontainers_2.3.0.bb
rename to meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb
index 6060c03723..0755d3e177 100644
--- a/meta/recipes-devtools/python/python3-sortedcontainers_2.3.0.bb
+++ b/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb
@@ -4,6 +4,6 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7c7c6a1a12ec816da16c1839137d53ae"
 
 inherit pypi setuptools3
-SRC_URI[sha256sum] = "59cc937650cf60d677c16775597c89a960658a09cf7c1a668f86e1e4464b10a1"
+SRC_URI[sha256sum] = "25caa5a06cc30b6b83d11423433f65d1f9d76c4c6a0c90e3379eaa43b9bfdb88"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1

