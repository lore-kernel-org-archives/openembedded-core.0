Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web08.22872.1625672763514279401
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jul 2021 08:46:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=CDx534lR;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1625672761; i=@fujitsu.com;
	bh=/bjY4B92fLbElWG6s3P6WuBTT74A7IG0tqlkJs5qmcE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=CDx534lR+NawBRrJgLUtwRsbUTb1X/lOq5UqCdwn4SDhgTzWo95RkDxahp9VVprl6
	 7FYHoVrhXRWiiSp495fZj5Qi5gSCdsvRzcm3kBsEPGYntu0cyVoBE+zWrPTscvJA5A
	 OqAkn6JZlI38ynU5GYzHDhwvzHHpjDF0A9Smw56Ga0l2wpuk/8M/In0+Zg4vnXaWGy
	 kSnNDJzm86FGB+PzU/IBdMPdbc8nXpI0iPQI9wL+wjKJj3jWF7eQJVIVqSNSIj/BRi
	 xS517bkoiri8SjvF+pEddsJnH0rgdvwDTW6dfF40aZfzNe9jzzVnMktEX69kR/V8yQ
	 ltp9pOdOHgBJw==
Received: from [100.112.193.7] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-1.aws.symcld.net id B9/78-31114-93CC5E06; Wed, 07 Jul 2021 15:46:01 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrEIsWRWlGSWpSXmKPExsViZ8MRqmt55mm
  CwZpnXBZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8a7rZcYC7ZxVuzdPoG9gfEwRxcjF4eQwEwm
  iWcPVzBDOMcZJV59OALkcHKwCahJTL91g7WLkYNDREBP4uo/UZAws4CKxIvfPewgYWEBD4k/G
  0pBwixA4TkTHjCDhHkFHCXmvFcFCUsIKEhMefgebCCngJPE4/6/YLYQUEnTjxcsIDavgKDEyZ
  lPWCCmS0gcfPGCGaJXUWL25WYWCLtC4vXhS8wTGPlnIWmZhaRlASPTKkbzpKLM9IyS3MTMHF1
  DAwNdQ0MjXUNLI10TE73EKt1EvdRS3fLU4hJdQ73E8mK94src5JwUvbzUkk2MwEBMKTigs4Px
  56sPeocYJTmYlER5Z654miDEl5SfUpmRWJwRX1Sak1p8iFGGg0NJgtftFFBOsCg1PbUiLTMHG
  BUwaQkOHiUR3tkgad7igsTc4sx0iNQpxnCON2uXLGLmeAsm2+7dBZLtYHLmgoOrmTlmgcn77Y
  eA5AMQKcSSl5+XKiXOGw4yTgBkXEZpHtwyWNRfYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCT
  MmwIyhSczrwTupldA5zIBnctwGOzckkSElFQDk7p0lZ/RK7mAQ5lFK7dUSEbM2Sq2Nc5owXn5
  n+uLhGYvDN8g18Jqr/DiV+GcCxfvX2Vq+vxL+5pa9rIpeeFLtLn9/9U6OGWeStUusf/KPDtBv
  kN0Uoh2DIutXNOEaH3mVSqRFzoFdB1P+rRHNP2MkNb6U1RUOGWyw3/HlKAnEQGHgmvzxeXDF4
  oW69kzrLywTlq8pUflcQnf2Zb3/9PbWAzbnKKuTg+/fGva12+MHgtZ7nx8eiPFLNNExfJwSvf
  h/Nfll+KFDCZIrN7R4sGRJfIzK0nw/FTmZ2+LzZVnevDIv6zxf87C9ZGHR9nEwXLHissuB7YI
  JBVMNNWsrtzPuo73c8buZqPDFVpnjZVYijMSDbWYi4oTAT5G0OZ1AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-267.messagelabs.com!1625672760!189105!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28430 invoked from network); 7 Jul 2021 15:46:01 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-16.tower-267.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 7 Jul 2021 15:46:01 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 167Fk0DG004199
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 7 Jul 2021 16:46:00 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Wed, 7 Jul 2021 16:45:58 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 2/3] vulkan-loader: upgrade 1.2.176 -> 1.2.182
Date: Wed, 7 Jul 2021 23:45:47 +0800
Message-ID: <1625672748-3956-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1625672748-3956-1-git-send-email-wangmy@fujitsu.com>
References: <1625672748-3956-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

build: Update to header 1.2.182
- Update known-good
- Disable codegen for VK_HUAWEI_subpass_shading
  KhronosGroup/Vulkan-Docs#1564
- Generate source

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{vulkan-loader_1.2.176.0.bb => vulkan-loader_1.2.182.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/vulkan/{vulkan-loader_1.2.176.0.bb => vulkan-loader_1.2.182.0.bb} (96%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-loader_1.2.176.0.bb b/meta/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bb
similarity index 96%
rename from meta/recipes-graphics/vulkan/vulkan-loader_1.2.176.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bb
index e241a2f156..ec09fd0f72 100644
--- a/meta/recipes-graphics/vulkan/vulkan-loader_1.2.176.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bb
@@ -11,7 +11,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7dbefed23242760aa3475ee42801c5ac"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git \
            "
-SRCREV = "eb6d6f95dff809d66e95b903105da6424e75862f"
+SRCREV = "1896143df69d439b0933c1bb485f5a4587bdf2dc"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1

