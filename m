Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.3024.1620955766674966869
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 May 2021 18:29:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=EDk8EDu3;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1620955764; i=@fujitsu.com;
	bh=YjBggDPTp9skDW4adWRHGUL/2kDHkn+kXbyvHaoXmOE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=EDk8EDu3mspfTCHcWFOabAQ2Eu3yLwiJWJHBPK3jm3z/uTdeI9uTi+i3gRJeKCkuz
	 4ELb46uewt3fthS24aB1kvOQPPSAump5MfOr+WbmnHKgRWnWYZK8om7tFmLr3Rq/M/
	 ItnLzSAnx75XbCKpqW1WOJBI30+xPOiFPLjcW29IZs/kkz/08ircu00OWBlzG4rqsk
	 5P2IG+Lba6Go9YQBKz1YhP1k46mDiPETZFdzdOSU+jFmJzB8Vqn8GdeQH/g8ZAsviW
	 E7DcSUlwqErN4VBRFMFACj/LhWU+z4Vsv/UPw9DWTg3qVssdPf2vb+8CUwVosPTTny
	 Wu/JCL33ZQIZw==
Received: from [100.113.6.49] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-central-1.aws.symcld.net id AE/C4-15146-472DD906; Fri, 14 May 2021 01:29:24 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrCIsWRWlGSWpSXmKPExsViZ8MRolt8aW6
  CwdmvJhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bcTV+YC1ZyVJxssWlgvM7excjFISQwi0ni
  8au5zBDOcUaJ9a3tbF2MnBxsAmoS02/dYO1i5OAQEdCTuPpPFCTMLKAi8eJ3DzuILSzgJzHx9
  AcmEJtFQFVi+uY2MJtXwFFi4rlrLCC2hICCxJSH75lBbE4BJ4n3Bzawg4wUAqrp/B4AUS4ocX
  LmExaI8RISB1+8YIZoVZSYfbkZakyFxOvDl5gnMPLPQtIyC0nLAkamVYyWSUWZ6RkluYmZObq
  GBga6hobGuia6hsYGeolVukl6qaW6yal5JUWJQFm9xPJiveLK3OScFL281JJNjMBgTClkadrB
  +PvVB71DjJIcTEqivCc9ZycI8SXlp1RmJBZnxBeV5qQWH2KU4eBQkuB9dmFugpBgUWp6akVaZ
  g4wMmDSEhw8SiK8VeeB0rzFBYm5xZnpEKlTjOEcb9YuWcTM8RZMtt27CyTbweTMBQdXM3PMAp
  P32w8ByQcgUoglLz8vVUqc9w7INgGQcRmleXDLYJF/iVFWSpiXkYGBQYinILUoN7MEVf4Vozg
  Ho5Iw73aQKTyZeSVwN70COpcJ6Nwb02eBnFuSiJCSamCas+j8Sk5T7bbJrXq9D27/Wl7bkGa9
  yCPz8RXWJ5eE5sXf4Y74v4bPawXjohkih88WHXRY2jnB3OLa5Uama/3L9knqnQj8fVW6up3v5
  3SHg3afJA/MDDKXUS5atunXz10KOz77XA/q36NnfHWXl7mu9cIP0RrpX9OfcyzpOv5kT1/UkU
  BnvX1zMk6yMwsZvFfJ7pka/ojd6FR6aclKn+KQfS1cL+fuYyh8P0PtcNzutQkz+GYeWJpzpr/
  9tXJM85GnN7ve71jebOLdrsuio8J6taco95RV2eNMpp89Lz2l7TfJLDtgtr7y2MflRt1bi707
  Oc9J/JMMMDRZHFhlKHf84N/WrUfitFbv6Pi6bEK4EktxRqKhFnNRcSIAGC55j3cDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-248.messagelabs.com!1620955763!213895!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7135 invoked from network); 14 May 2021 01:29:23 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-3.tower-248.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 14 May 2021 01:29:23 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14E1TMba023648
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 14 May 2021 02:29:23 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 14 May 2021 02:29:20 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 2/4] vulkan-headers: upgrade 1.2.170.0 -> 1.2.176.0
Date: Fri, 14 May 2021 09:28:38 +0800
Message-ID: <1620955720-4296-2-git-send-email-wangmy@fujitsu.com>
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
 ...{vulkan-headers_1.2.170.0.bb => vulkan-headers_1.2.176.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/vulkan/{vulkan-headers_1.2.170.0.bb => vulkan-headers_1.2.176.0.bb} (93%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-headers_1.2.170.0.bb b/meta/recipes-graphics/vulkan/vulkan-headers_1.2.176.0.bb
similarity index 93%
rename from meta/recipes-graphics/vulkan/vulkan-headers_1.2.170.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-headers_1.2.176.0.bb
index 4c9c94f3d2..cff654a06c 100644
--- a/meta/recipes-graphics/vulkan/vulkan-headers_1.2.170.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-headers_1.2.176.0.bb
@@ -11,7 +11,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=master"
 
-SRCREV = "1d99b835ec3cd5a7fb2f2a2dd9a615ee2d1f0101"
+SRCREV = "074fa3055cfee530992bcbfa0fcb23106a82c1ab"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1

