Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.3])
 by mx.groups.io with SMTP id smtpd.web12.942.1625021616242885105
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Jun 2021 19:53:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=aeRef94Y;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.3, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1625021614; i=@fujitsu.com;
	bh=RJGDr58J5jrI3L4+JtlBPuLJDxJHhbVeCrAmBbqdo7Q=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=aeRef94Yv8S2HxLkqi62MfnypqYYeUptHXYYN5WdRo0ovS5J9TNN4t0W3uwCMyg8e
	 Ew9DGh5iDckYhGpPzWycYoLjVa99VwbCpnWtFLg5o/Dx+siEA4jLxZsm7E9jqq88N1
	 Vf49yMW8K3dosXGMDtRK3+p8akMDkp2OEn19cDQGvG80YpN1nM1VDljL3NBjyuAHLx
	 Ojr1eEwx+/zQ/Qzgi2ZAg7eigKVGNdeY2hOq7+hfTInOxIX7qkxNwShmhOF/pjySZt
	 zGauDhukQMA8od3tsUFckjXIxanLjJ7pVALcNH9pu/6orvQnXSp4TBamO9wppwrQPs
	 R0wgNBNXIyKrA==
Received: from [100.113.1.116] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-central-1.aws.symcld.net id B6/3F-07651-DACDBD06; Wed, 30 Jun 2021 02:53:33 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkkeJIrShJLcpLzFFi42Kxs+GYqrv2zu0
  Eg2Ub+S3u/HzH7sDocW7jCsYAxijWzLyk/IoE1oz5986wFCzgrDi4bC5LA+M5ji5GLg4hgVlM
  EpN+7WDtYuQEcvYwSnxpCQWx2QR0Jc49XsvexcjBISKgJ3H1nyhIWFjAV2La9b2MIDaLgKrE9
  JavrCAlvAIeEtsu1YCEJQQUJKY8fM8MYvMKCEqcnPmEBcRmFpCQOPjiBTNIuYSAosTs6fIQ5R
  USM2ZsY5vAyDMLSccsJB0LGJlWMVomFWWmZ5TkJmbm6BoaGOgaGhrrGuoaGZnpJVbpJuqlluo
  mp+aVFCUCZfUSy4v1iitzk3NS9PJSSzYxAkMopZDx0Q7G068/6B1ilORgUhLlnXLjdoIQX1J+
  SmVGYnFGfFFpTmrxIUYZDg4lCd5GkJxgUWp6akVaZg4wnGHSEhw8SiK8j28BpXmLCxJzizPTI
  VKnGBWlxHltQRICIImM0jy4NlgMXWKUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzOsDsp0nM6
  8EbvoroMVMQIsXPbkJsrgkESEl1cCkbGgbe4TxkM4x0VNOedfErEQ2JggpG53SPtcn8ZT3dvG
  G778mceYU1LaeLtNMO73yzJIPjHsLZ2/qvJfS2ZXGuV4ne3+k7afJR7hqW7P//lrLLPnYqa48
  5fOCzG/MIYnc26Ubbh/rDhYu7ys95uw2NS62pdlNUWpe3C+WcxprmV6HbHI2leCW/OkX+tzl0
  7HYlINrRNW72rl+xnK8U9Nzu7iZoVTG88DmayzzjLZr8U9IntOfcOJlYw9jR4pE1mTZ/iupZT
  YLeLr3uKXNZDkj8SDkkHRb0rob0umnd393Mm455mKY8+ul9ts8nmVhx/Zs1xNeqWn356r3Mu5
  lDhHltr2Gx46suPjHTWgakxJLcUaioRZzUXEiAKqo0J8cAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-7.tower-226.messagelabs.com!1625021612!29494!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1084 invoked from network); 30 Jun 2021 02:53:33 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-7.tower-226.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 30 Jun 2021 02:53:33 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15U2rWhn014447
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Jun 2021 03:53:32 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Wed, 30 Jun 2021 03:53:31 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] python3-importlib-metadata: upgrade 4.5.0 -> 4.6.0
Date: Wed, 30 Jun 2021 10:53:25 +0800
Message-ID: <1625021605-64993-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...ib-metadata_4.5.0.bb => python3-importlib-metadata_4.6.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-importlib-metadata_4.5.0.bb => python3-importlib-metadata_4.6.0.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-importlib-metadata_4.5.0.bb b/meta/recipes-devtools/python/python3-importlib-metadata_4.6.0.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-importlib-metadata_4.5.0.bb
rename to meta/recipes-devtools/python/python3-importlib-metadata_4.6.0.bb
index 7c156787a0..b9fd2fe59e 100644
--- a/meta/recipes-devtools/python/python3-importlib-metadata_4.5.0.bb
+++ b/meta/recipes-devtools/python/python3-importlib-metadata_4.6.0.bb
@@ -8,7 +8,7 @@ inherit pypi setuptools3
 PYPI_PACKAGE = "importlib_metadata"
 UPSTREAM_CHECK_REGEX = "/importlib-metadata/(?P<pver>(\d+[\.\-_]*)+)/"
 
-SRC_URI[sha256sum] = "b142cc1dd1342f31ff04bb7d022492b09920cb64fed867cd3ea6f80fe3ebd139"
+SRC_URI[sha256sum] = "4a5611fea3768d3d967c447ab4e93f567d95db92225b43b7b238dbfb855d70bb"
 
 S = "${WORKDIR}/importlib_metadata-${PV}"
 
-- 
2.25.1

