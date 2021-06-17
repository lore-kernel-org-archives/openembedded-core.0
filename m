Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.116])
 by mx.groups.io with SMTP id smtpd.web12.1979.1623893388408076644
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jun 2021 18:29:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=V3Xv8TSY;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.116, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1623893386; i=@fujitsu.com;
	bh=WCe5lg9h5h0/27fW0QukUQ5IwcIwMHCRmRo7Qr2mpCA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=V3Xv8TSY6QKCJFDQigzXfIRjg4LQiGIOAluQDdEjxFI8tWy/WbTEGqncqjT+CvHmK
	 M5K8eSU3903gQS0AzRaF96MOXCejA893epZ1+BeL84SZ7dJSMTTR41yCCUnhUthSue
	 D9FJBlgCZjMABDr/jKUORaMuOQg4NJ1XjBBTx3jgRiRw2CB2m1fyoyCYuQt69/tHQv
	 fWd/vL4M1iD5AwAGyZLPrMZVfX4MzDCm6Ih3xO917m3gkHAocJdf/2RzKTBA59x4Gj
	 q21IqgSS57THDgZj2wa8z+RgcsehLMoOdhtn101ooFzXDsn9UgCtHxBqeci8dCyatI
	 EAgVox/yVjMVg==
Received: from [100.113.7.10] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-b.eu-central-1.aws.symcld.net id 7D/7B-14259-985AAC06; Thu, 17 Jun 2021 01:29:45 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupikeJIrShJLcpLzFFi42Kxs+GYqtu59FS
  CwdlnjBZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8b12T3MBfc5Kva9u8DcwNjD0cXIxSEkMItJ
  YkPfLUYIZw+jxJ3Dc4EcTg42AV2Jc4/XsncxcnCICOhJXP0nCmIKC7hKrJrMD1LBIqAqsev5F
  GYQm1fAU+Likq9gnRICChJTHr6HigtKnJz5hAXEZhaQkDj44gUzyBgJAUWJ2dPlIcorJGbM2M
  Y2gZFnFpKOWUg6FjAyrWK0TCrKTM8oyU3MzNE1NDDQNTQ01jXRNTIw1Uus0k3SSy3VTU7NKyl
  KBMrqJZYX6xVX5ibnpOjlpZZsYgQGUUohy9kdjF9ef9A7xCjJwaQkytvceSpBiC8pP6UyI7E4
  I76oNCe1+BCjDAeHkgQv02KgnGBRanpqRVpmDjCgYdISHDxKIry6i4DSvMUFibnFmekQqVOMi
  lLivBYgfQIgiYzSPLg2WBRdYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMW7gEaApPZl4J3P
  RXQIuZgBa3CYEtLklESEk1MKWJ9T3xucl10phhXyOv7tznDzR9FbNVJbm/l1n93bXE1Mrv3eY
  oHa9DczbmKVVuv+ehpf+5iMFR71bmM6fcvmXzIn48OBvBe/910dnPa889exp4WOdQyqfsfc8+
  tepaSEyJO14W+vqtptn2y1JBXxhLFJdLF1ry/3n7+KbG7ukJDGvlTIVv+Qq5m2+/EzpHu7xiy
  vMkIY3/+3ndm7uSb223neQeZeal2n7yPZd9dejqpkCfyx1GJ3k9pO9/Wfrs4W1mZpnUD7VNjW
  85/FKZfUNDb/HePJ90f44Wz/01OxruFN5dpvc1qPWTuMRVUdaV+zQTTh255+/ds/XrxPVz27k
  Sml0DFXROmSzaMXuBqhJLcUaioRZzUXEiAIWUrZAdAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-9.tower-248.messagelabs.com!1623893384!86889!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6290 invoked from network); 17 Jun 2021 01:29:44 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-9.tower-248.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Jun 2021 01:29:44 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15H1TigY012880
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Jun 2021 02:29:44 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 17 Jun 2021 02:29:43 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] python3-dbusmock: upgrade 0.23.0 -> 0.23.1
Date: Thu, 17 Jun 2021 18:29:36 +0800
Message-ID: <1623925776-129606-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-dbusmock_0.23.0.bb => python3-dbusmock_0.23.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dbusmock_0.23.0.bb => python3-dbusmock_0.23.1.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-dbusmock_0.23.0.bb b/meta/recipes-devtools/python/python3-dbusmock_0.23.1.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-dbusmock_0.23.0.bb
rename to meta/recipes-devtools/python/python3-dbusmock_0.23.1.bb
index 80990d8fbb..b5fa1868b8 100644
--- a/meta/recipes-devtools/python/python3-dbusmock_0.23.0.bb
+++ b/meta/recipes-devtools/python/python3-dbusmock_0.23.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/python-dbusmock/"
 LICENSE = "GPL-3.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
-SRC_URI[sha256sum] = "8c0b873a3f23869b416b51deeec39b3d5ab4c9875b705fc90ae917e4969c2574"
+SRC_URI[sha256sum] = "b5c36a9c9935d1867cf79d8666b08ad906660e6d4d967e9fded4361ad7eef54f"
 
 PYPI_PACKAGE = "python-dbusmock"
 
-- 
2.25.1

