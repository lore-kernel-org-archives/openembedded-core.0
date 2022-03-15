Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB9FDC433EF
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 12:13:18 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web09.9916.1647346397597938010
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 05:13:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=qZ0a6S0K;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1647346396; i=@fujitsu.com;
	bh=A8l2HB+zwL3wDNbcFnwQJDFr8gyzoiUImmbdXf8eyEs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=qZ0a6S0KK8Qalr/XPio1vrZeH5w9x9bWGBSEI95s4g6mGkaCLQSBjDvBPYnlJ1Jw+
	 MzV6gWxC8oaodORyoZzg1foyGt5/ulDVLuY30LUmd+0YjRjXR9t3eV8wauEFbxarDA
	 GmXDkd9/aknJcgKFoI7wWMrLEoJQJY2754XXHowa1Mqhp2sV4fv/4eXDtDIPoMjqs/
	 jGQeWboU55F9UngNcvFFcuhrb3L19085IFBsLCoRyx6ycRF4DR6V8Ki1t6+EVIEof1
	 Osh1M2pI4ddvxMKseCwWHxziiJv65Z13kcWO9XfxVeadjoioqcpdLzBp10CLRFPwXz
	 BECEgQEZsZTZQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRWlGSWpSXmKPExsViZ8MxSfd2k0G
  SwdwVahZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8azTztYC/ZwVlxf3cPWwHiSo4uRi0NI4DGj
  RPvePawQznkmiVdP57NAOCcYJfr3/mTvYuTkYBNQk5h+6wZQFQeHiICexNV/oiBhZgEViRe/e
  8BKhAWcJNo7PrGB2CwCqhIPd89jArF5geJXu88zgtgSAgoSUx6+ZwaxOQWcJRqn9IH1CgHVHD
  94gxGiXlDi5MwnLBDzJSQOvnjBDNGrKDH7cjMLhF0hMWtWGxOErSZx9dwm5gmMgrOQtM9C0r6
  AkWkVo3VSUWZ6RkluYmaOrqGBga6hoamusYWuoYmBXmKVbqJeaqlueWpxia6RXmJ5sV5qcbFe
  cWVuck6KXl5qySZGYBinFKv17GA8seqn3iFGSQ4mJVHewnKDJCG+pPyUyozE4oz4otKc1OJDj
  DIcHEoSvCn1QDnBotT01Iq0zBxgTMGkJTh4lER4X5YCpXmLCxJzizPTIVKnGBWlxHnVgJEoJA
  CSyCjNg2uDxfElRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK87iBTeDLzSuCmvwJazAS0eJ6
  0HsjikkSElFQDk/3x+vkPDMQmL54VfnSlm0aNTuUjx3qTN103Og3d3VKKd2Uorqj7o6wUyyv5
  VDgtYmPl2e65t1+4nrhlNX3Xn2X6Ci1/Hys/FAufes1e7+0KnnmON9KUJ67i2HxU8pnVianHJ
  c4v1zivo7teZNvaiY8mLd8aF2Z9L8GD7+2Etcb7hKfbW15SFju47WxFU/q8UMWqPNnNx3SmRe
  swOgjEZSoURFff+cLY/OrpZfZzNoFTil/Uff0gtuXGatVoiwyjDp+I9FKm6vJ1PwPaZjonz/p
  uVGW8TWhbd+Uv+ZqAdxUuD3ek/kn8+aXIK7vozKyvzUx5rpIv0g3bzwU3brU7b2Xmd4pNxmPW
  yYtLInY2KLEUZyQaajEXFScCAGzLMateAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-565.messagelabs.com!1647346395!13568!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22968 invoked from network); 15 Mar 2022 12:13:15 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-7.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Mar 2022 12:13:15 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 3D90210034F
	for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 12:13:15 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 311581000E9
	for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 12:13:15 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Tue, 15 Mar 2022 12:12:53 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-numpy: upgrade 1.22.2 -> 1.22.3
Date: Tue, 15 Mar 2022 20:12:31 +0800
Message-ID: <1647346351-79061-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1647346351-79061-1-git-send-email-wangmy@fujitsu.com>
References: <1647346351-79061-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Mar 2022 12:13:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163239

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-numpy_1.22.2.bb => python3-numpy_1.22.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-numpy_1.22.2.bb => python3-numpy_1.22.3.bb} (96%)

diff --git a/meta/recipes-devtools/python/python3-numpy_1.22.2.bb b/meta/recipes-devtools/python/python3-numpy_1.22.3.bb
similarity index 96%
rename from meta/recipes-devtools/python/python3-numpy_1.22.2.bb
rename to meta/recipes-devtools/python/python3-numpy_1.22.3.bb
index 6ceb451ff3..b5b1c4e714 100644
--- a/meta/recipes-devtools/python/python3-numpy_1.22.2.bb
+++ b/meta/recipes-devtools/python/python3-numpy_1.22.3.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://github.com/${SRCNAME}/${SRCNAME}/releases/download/v${PV}/${S
            file://0001-numpy-core-Define-RISCV-32-support.patch \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "093d513a460fd94f94c16193c3ef29b2d69a33e482071e3d6d6e561a700587a6"
+SRC_URI[sha256sum] = "a906c0b4301a3d62ccf66d058fe779a65c1c34f6719ef2058f96e1856f48bca5"
 
 UPSTREAM_CHECK_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.25.1


