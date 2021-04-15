Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [])
 by mx.groups.io with SMTP id smtpd.web11.3269.1618466885628582543
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Apr 2021 23:08:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=KV2ShurH;
 spf=neutral (domain: fujitsu.com, ip: <nil>, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1618466883; i=@fujitsu.com;
	bh=MLci134JPXRj+hSOB263wOodJZp/qih6/tOqd6G73fs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=KV2ShurHHUX3Qcfcodgu5/BVaxB1UCpkgZO1eWeUZZcTpKykBMZGboxZOb05VNBs5
	 KHGPKq2IAq5eeizg1/e0sjS0mlvn7pQF/5ZgN1h+RmNGlyY4Hr61FAS9ButztPmA56
	 eyNAz3X9EABlgneLVccfp9oR+iRbUV3VjPDHdx2QFPp64+xF1vMSd02QcSas/1ZoE1
	 gC42NJJQyLEGahzc5c/nXt5W2s6sopIujtFu0zPghqH4d6KnlZyCaq9bJ0ZmICG5aZ
	 PV4l7OojTDfdPuKnZw0YUao/Y/4cW03pTt2WgxR0IVYWAkPsU+x7TzomKHW79I1VaS
	 pytihfWrncocg==
Received: from [100.112.192.143] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-a.eu-west-1.aws.symcld.net id AD/D0-01834-348D7706; Thu, 15 Apr 2021 06:08:03 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJIsWRWlGSWpSXmKPExsViZ8MxVdf5Rnm
  CwcPrvBZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8aiJZcYC+ZzVsy7fIG1gXE6RxcjF4eQwCwm
  iVfL37JCOMcZJRZu3MPUxcjJwSagJjH91g2gBAeHiICexNV/oiBhZgEViRe/e9hBwsIClhIXL
  nqBhFkEVCVOrJ/IDGLzCjhJLF5zgR3ElhBQkJjy8D1YnFPAWWLyvkWMILYQUM3LzhmsEPWCEi
  dnPmGBGC8hcfDFC2aIXkWJ2ZebWSDsSonO9QsYJzDyz0LSMgtJywJGplWM5klFmekZJbmJmTm
  6hgYGuoaGRrqGlqa6JmZ6iVW6iXqppbrlqcUluoZ6ieXFesWVuck5KXp5qSWbGIGhmFJwWG8H
  44Q3H/QOMUpyMCmJ8h5aUZYgxJeUn1KZkVicEV9UmpNafIhRhoNDSYJ3x7XyBCHBotT01Iq0z
  BxgXMCkJTh4lER4v10HSvMWFyTmFmemQ6ROMepyXFm1ZBGzEEtefl6qlDivDEiRAEhRRmke3A
  hYjF5ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMxbAzKFJzOvBG7TK6AjmICOqFhVCnJESSJ
  CSqqBaV79lXSvLbk3mH/z5Gbp3yk8+Sj0dtpfT1lXPlGx7gens1ZJhgb0O2YuiBR2PSlc0C84
  xSo+/dAPs1/rH+TP7j1y7ekRb3ujIm5veQberLVSCxdynmYsYtj21Ibjat7bjoeH3vR8Pqez+
  NovqcXbza6l6+x28OsL5wupX7pAkVn3asb3hdf6FcNaL5u1xMdEzfONWilzI0DXviiPIfmJza
  tTkaLed7fN9amq7Gp12/k0dN5sTSm27eY3bRxfaZd2Ns0M+aVwcY4gt+WbMp+r538EZb5zedV
  6y+Hnp3W8i/3+9S7+NiO8RT9zq8Em99YeldXGPlH3i88u9f7wWqToVgrvlmqDEKnWi6znwyYq
  sRRnJBpqMRcVJwIAPamRtUwDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-23.tower-267.messagelabs.com!1618466882!1467925!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5630 invoked from network); 15 Apr 2021 06:08:03 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-23.tower-267.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 15 Apr 2021 06:08:03 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 13F67kQ3031807
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 07:08:02 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 15 Apr 2021 07:07:37 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] mesa: upgrade 21.0.1 -> 21.0.2
Date: Thu, 15 Apr 2021 14:07:20 +0800
Message-ID: <1618466841-24292-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1618466841-24292-1-git-send-email-wangmy@fujitsu.com>
References: <1618466841-24292-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-graphics/mesa/mesa.inc                           | 2 +-
 meta/recipes-graphics/mesa/{mesa_21.0.1.bb => mesa_21.0.2.bb} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/mesa/{mesa_21.0.1.bb => mesa_21.0.2.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index caf3c62ad8..5705ae0f08 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -21,7 +21,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch \
            "
 
-SRC_URI[sha256sum] = "379fc984459394f2ab2d84049efdc3a659869dc1328ce72ef0598506611712bb"
+SRC_URI[sha256sum] = "46c1dc5bb54a372dee43ec3c067229c299187d5bdadf1402756bbf66a6df5b88"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-graphics/mesa/mesa_21.0.1.bb b/meta/recipes-graphics/mesa/mesa_21.0.2.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_21.0.1.bb
rename to meta/recipes-graphics/mesa/mesa_21.0.2.bb
-- 
2.25.1

