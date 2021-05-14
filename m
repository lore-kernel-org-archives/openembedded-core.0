Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web09.3129.1620955773664017196
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 May 2021 18:29:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=AGMzUI63;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1620955771; i=@fujitsu.com;
	bh=UNwkqa08oUGRsE2eAq2sc/GMzV2LUGCpdCmLz+nP/kg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=AGMzUI63NZEejOHs1Xz6TK/Ty2vwzxSiSLYLH8I7HNbhVKSPa6R5k1ZH9DoHoB+Z9
	 wVRu14f2Wjoyng5U96Fj8D2OHQga228OFiCIkwKnEW3bkK135aqsRAQ16fQM+0dO24
	 LXhlXpM+Wqr9pn0ft1904zGjo5NQZImv3/jGsVlyLZPzeOoc1kCRQxRwiTZoql5r8r
	 PeymxLIJBgTdR7RX/jm9RJPHuW6WKZOkZILfOLpT35wiZmjOhuheYTcVTBy3NLkj8f
	 TfITH+/71C8D1kwvNJbQZjaVvxBc2wjQPUzpzDbOmSEQF69FiYH0+uHsI2BEwQyX/Z
	 trTMv3euLYrEw==
Received: from [100.113.6.49] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-central-1.aws.symcld.net id AB/8B-57985-A72DD906; Fri, 14 May 2021 01:29:30 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRWlGSWpSXmKPExsViZ8MRolt1aW6
  CwYYZnBZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8aWvzdYCv5yVDy/fJ2pgXEJRxcjF4eQwCwm
  iWObulkgnOOMElvedTB2MXJysAmoSUy/dYO1i5GDQ0RAT+LqP1GQMLOAisSL3z3sILawgI/Ev
  ckPWEBKWARUJVqvWYCEeQUcJdp2rgYrkRBQkJjy8D0ziM0p4CTx/sAGdpByIaCazu8BEOWCEi
  dnPmGBmC4hcfDFC2aIVkWJ2ZebWSDsConXhy8xT2Dkn4WkZRaSlgWMTKsYLZKKMtMzSnITM3N
  0DQ0MdA0NjXXNdC3M9RKrdJP0Ukt1k1PzSooSgZJ6ieXFesWVuck5KXp5qSWbGIGhmFLIFr6D
  8czrD3qHGCU5mJREeU96zk4Q4kvKT6nMSCzOiC8qzUktPsQow8GhJMH77MLcBCHBotT01Iq0z
  BxgXMCkJTh4lER4q84DpXmLCxJzizPTIVKnGBWlxHnvgPQJgCQySvPg2mCxeIlRVkqYl5GBgU
  GIpyC1KDezBFX+FaM4B6OSMO92kCk8mXklcNNfAS1mAlp8Y/oskMUliQgpqQam/nDRmxY7w+c
  Zh7jqZCx8qn2TQ7MvitPuQVjMLo0FEY6cW8zMF8yReP29zOxYAdv+ylDVmplKHpXns/9e3t/g
  NW/FxiNeB26pRK5bo9ueOckz7d/knoA0pZndHDOeMqa8kHvquaf30u6gsIYEFevwfguR/EPlT
  p8nnli4NPfrC6OoxS3vbtw8Z24q2e3Pb3tSmv3jwWuMCkxO7yXq/Bd3hC+d+3zzjW+zjLyMZj
  Ib3lvd8ltY+XStH89zbaM3J+dO/+kSa/VGnU0+VjriidSTmXuKJr8+xKVZcULtlH/2Z/a8a1e
  /v2UyOy+i8CGgIWfOypVHC69ENy3dWPdQpe0/+79U3obHvkn3UgL/zfioxFKckWioxVxUnAgA
  SIzzlUADAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-238.messagelabs.com!1620955769!43493!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3999 invoked from network); 14 May 2021 01:29:30 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-9.tower-238.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 14 May 2021 01:29:30 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14E1TTxU023677
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 14 May 2021 02:29:29 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 14 May 2021 02:29:27 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 4/4] vulkan-tools: upgrade 1.2.170.0 -> 1.2.176.0
Date: Fri, 14 May 2021 09:28:40 +0800
Message-ID: <1620955720-4296-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1620955720-4296-1-git-send-email-wangmy@fujitsu.com>
References: <1620955720-4296-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{vulkan-tools_1.2.170.0.bb => vulkan-tools_1.2.176.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-tools_1.2.170.0.bb => vulkan-tools_1.2.176.0.bb} (94%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-tools_1.2.170.0.bb b/meta/recipes-graphics/vulkan/vulkan-tools_1.2.176.0.bb
similarity index 94%
rename from meta/recipes-graphics/vulkan/vulkan-tools_1.2.170.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-tools_1.2.176.0.bb
index 0c8bcaa085..10fa0fdb3a 100644
--- a/meta/recipes-graphics/vulkan/vulkan-tools_1.2.170.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-tools_1.2.176.0.bb
@@ -6,8 +6,8 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=sdk-1.2.170"
-SRCREV = "88ea55de928a08ba5c5f65a93d1e7c8f666fc43f"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=sdk-1.2.176"
+SRCREV = "eb3d67bd17ee433e2b0a8e56a7249bd83908812e"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1

