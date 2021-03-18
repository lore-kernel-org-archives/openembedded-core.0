Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.4])
 by mx.groups.io with SMTP id smtpd.web08.4519.1616038503733540571
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Mar 2021 20:35:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 85.158.142.4, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
Received: from [100.113.2.232] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-central-1.aws.symcld.net id 21/DA-03420-56AC2506; Thu, 18 Mar 2021 03:35:01 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRWlGSWpSXmKPExsViZ8MxVTf1VFC
  CweW70hZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8anKVtZCho4K+bvvM/UwLico4uRk0NIYDOT
  RNMRzS5GLiD7BKPEmvln2UESbAKaEr1btjB2MXJwiAjoSVz9JwoSZhZQl7i0roUFxBYW8JbY+
  WstK4jNIqAqMb9/NVgrr4CrxPaeHWC2hICCxJSH75lBbE4BN4mbz/uZIfa6Sky7cYIJol5Q4u
  TMJywQ8yUkDr54wQzRqygx+3IzC4RdJbGmYxrbBEb+WUhaZiFpWcDItIrRMqkoMz2jJDcxM0f
  X0MBA19DQWNdY19DSRC+xSjdRL7VUNzk1r6QoESirl1herFdcmZuck6KXl1qyiREYjimFzId2
  MD55/UHvEKMkB5OSKK/o+qAEIb6k/JTKjMTijPii0pzU4kOMMhwcShK8ESeBcoJFqempFWmZO
  cDYgElLcPAoifC+PAKU5i0uSMwtzkyHSJ1iVJQS5zUH6RMASWSU5sG1weLxEqOslDAvIwMDgx
  BPQWpRbmYJqvwrRnEORiVh3qMngKbwZOaVwE1/BbSYCWhxBD/Y4pJEhJRUA1PL0QOZXmtF9jF
  MYGFYO6H9p3zrkqoHbI4t+xPuVz19+P/8L9d6Bm11Hz7PF9/OW14+sOpu03rF1VO1vbZyGLEt
  ZerxXvFnd21nWmiO39K5DzSNVCLlP9t377zAtVHsQY3U+SbDl94xHz+rfMzu6PhxWex+avZDl
  bu/Tvc3PWdrkPvl6su5QuZ+5Kf2/wcd0qdHWpoVOZ/jexMU3crnoeBa/+jDg+/hz7c/5ZzIfS
  LiIutiSZ1pp6vVdyVnfjCefH7pKo3sU66Vh77c/vXgp2ebw/dnfzMV1ZYq5yw9tMhYe/3Jm1n
  rom/c+L0usPDlbB+OfU8mpu99dMi12NI544TYy0dMO8Osrq+siAkO1VuixFKckWioxVxUnAgA
  4/2O6kIDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-232.messagelabs.com!1616038500!71715!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12373 invoked from network); 18 Mar 2021 03:35:01 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-11.tower-232.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 18 Mar 2021 03:35:01 -0000
Received: from r01ukexcasm214.r01.fujitsu.local (ex2k13_214.fs.fujitsu.com [10.182.185.116])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 12I3YvNH029296
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Mar 2021 03:35:00 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 18 Mar 2021 03:34:55 +0000
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH 3/3] vulkan-tools: upgrade 1.2.162.1 -> 1.2.170.0
Date: Thu, 18 Mar 2021 11:34:40 +0800
Message-ID: <1616038480-24925-3-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1616038480-24925-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1616038480-24925-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../{vulkan-tools_1.2.162.1.bb => vulkan-tools_1.2.170.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-tools_1.2.162.1.bb => vulkan-tools_1.2.170.0.bb} (94%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-tools_1.2.162.1.bb b/meta/recipes-graphics/vulkan/vulkan-tools_1.2.170.0.bb
similarity index 94%
rename from meta/recipes-graphics/vulkan/vulkan-tools_1.2.162.1.bb
rename to meta/recipes-graphics/vulkan/vulkan-tools_1.2.170.0.bb
index a5c3bbcb14..0c8bcaa085 100644
--- a/meta/recipes-graphics/vulkan/vulkan-tools_1.2.162.1.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-tools_1.2.170.0.bb
@@ -6,8 +6,8 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=sdk-1.2.162"
-SRCREV = "8f0c2e40d4134f53f82ce48de72c7be92baa6b3d"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=sdk-1.2.170"
+SRCREV = "88ea55de928a08ba5c5f65a93d1e7c8f666fc43f"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1

