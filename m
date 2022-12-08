Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3AC8C3A5A7
	for <webhook@archiver.kernel.org>; Thu,  8 Dec 2022 06:10:52 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web11.6973.1670479844561538211
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Dec 2022 22:10:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=p3MGj3pm;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670479842; i=@fujitsu.com;
	bh=Nt+RU4bpqm2l3ytTl5FeiU5yJDeCC4TlWnGTG6Giiy4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=p3MGj3pm/YlD7/HvUo+6Bga71Dc3EgzLEQDNcgLgxaLDbfLwVARS/j8k4c/GRRrY2
	 wf50mXTE14rQpQ+arkhK+X7Ub1rxG3XvIIrKe8sGYthlyaFQakWX3WHvVWx3OjNkjM
	 omRLB7vdogPQ/RN4qLkorgrMYYOO4vXyPRhkQs/uiVkwPEMi+KjM0niKMcDvdLCnOz
	 HqERUmWpTyQ3CjFqu0Yxi8yj1tQWattBjlOqoX0NuUpxJyVwAt3IJphKkLZeNG5z32
	 70ppLMeEXBwFWA1Pfdz6fgOTHDimrph4JiipuvXqZ0Hzkc8cKuGZuqdvLi1OKluGCi
	 sN7WvtPcmBCzg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMIsWRWlGSWpSXmKPExsViZ8OxWfdR/cR
  kg6tdAhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bLdR3MBU85Kg7ufMzYwNjD0cXIxSEk8IBR
  YumNtywQziUmiR+LGqGc3YwSh5cfZu1i5ORgE5CSuHH/P1sXIweHiICexNV/oiBhZgEViRe/e
  9hBbGEBL4n/X4+wgNgsQPFZ2zaygdi8Ao4SG6/tAauREFCQmPLwPTOIzSngJLHtbQuYLQRUM3
  XCdHaIekGJkzOfsEDMl5A4+OIFM0SvosTsy80sEHaFxKxZbUwQtprE1XObmCcwCs5C0j4LSfs
  CRqZVjObFqUVlqUW6hpZ6SUWZ6RkluYmZOXqJVbqJeqmlunn5RSUZuoZ6ieXFeqnFxXrFlbnJ
  OSl6eaklmxiB4ZtSnBq9g3Husj96hxglOZiURHlfVPcnC/El5adUZiQWZ8QXleakFh9ilOHgU
  JLgvVA5MVlIsCg1PbUiLTMHGEswaQkOHiURXt9aoDRvcUFibnFmOkTqFKMux8yvbQeYhVjy8v
  NSpcR519UBFQmAFGWU5sGNgMX1JUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvHUgU3gy80r
  gNr0COoIJ6Ih7/3tBjihJREhJNTDpNhz7kX25LEH25hKDSHu/2NbNaxfdSHtx9fo0jW4hXs+a
  OItlWyb9qv25lNXoaP6C/HMq/S9mntMLOm3/7oyC/kH+D4eZvFdITijYarDadebc/DV/d210u
  2P7pK056eOOCwHTmW9MY0zaL1TfyFQbP+9B9Bxj2z/83zYWnOn+fpLZK3y3gOySDPNbbA/fVt
  yxEzStl1KMPvH7q/AWyXkSSQuvGPqleVYycX2y8F15OC7/4LNXApmb0/6VWt9Zw3T/6+6oW72
  v9slOvBtc2jTl/hKv54v/uL8xUJ0z0eLIhENdTsvXdRw94L/9TIdTg5PCvVV2e11/Linff0vB
  5WHPZ8lp7Gn+LnFLlT9fYuDNVWIpzkg01GIuKk4EAH+I2+hmAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-732.messagelabs.com!1670479841!174407!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32345 invoked from network); 8 Dec 2022 06:10:42 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-2.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Dec 2022 06:10:42 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id BE26E154
	for <openembedded-core@lists.openembedded.org>; Thu,  8 Dec 2022 06:10:41 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id B1BE57B
	for <openembedded-core@lists.openembedded.org>; Thu,  8 Dec 2022 06:10:41 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Thu, 8 Dec 2022 06:10:40 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-web3: upgrade 5.31.1 -> 5.31.2
Date: Thu, 8 Dec 2022 14:09:54 +0800
Message-ID: <1670479794-1225-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1670479794-1225-1-git-send-email-wangmy@fujitsu.com>
References: <1670479794-1225-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Dec 2022 06:10:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174381

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-web3_5.31.1.bb => python3-web3_5.31.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-web3_5.31.1.bb => python3-web3_5.31.2.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-web3_5.31.1.bb b/meta-python/recipes-devtools/python/python3-web3_5.31.2.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-web3_5.31.1.bb
rename to meta-python/recipes-devtools/python/python3-web3_5.31.2.bb
index 587d34f00..486cf08b8 100644
--- a/meta-python/recipes-devtools/python/python3-web3_5.31.1.bb
+++ b/meta-python/recipes-devtools/python/python3-web3_5.31.2.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1dc2732bdc5e50382737979791cbb3b7"
 
-SRC_URI[sha256sum] = "74732fbd4b2e2baff9d0ac61f268b3e7b25b09ca6572d619390a9d782c2289f2"
+SRC_URI[sha256sum] = "fc27ef2acacb9375e1d486ce7b0f4188c5e543d65f7bb8692f8b969f408bfa9b"
 
 inherit pypi setuptools3
 
-- 
2.25.1


