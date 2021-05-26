Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web09.323.1622073127737801113
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 May 2021 16:52:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=OzjbUgfP;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1622073125; i=@fujitsu.com;
	bh=4gJWVkXACZwcZo5SgzFDw6ElNgBSeb74W9SYIMAEuR4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=OzjbUgfPEY/t8MEr6U94R+Xu3OI319IzTHz7XQFKae4TCPtV4EsTp1FBZQ864vNB3
	 V0G9AswpK1vLXQPK8Q3zlVSbRtfjZ8qbr+lVFSDcSw5+0Se6dA0bLk6JL2/TQAufty
	 U+Y8oMrKFSNusXxw2QHHNljnPjQ33+vT+SNVvyQDNzCBTHqfqsFgb4D/be5iDAenCo
	 5hZE92DmQG0BMrQTBlU2uLB/L1gi8Zdgvog0U8ITYd+jGT1OkpSmPr9Q7eWmO0mGI7
	 qhG4m3T6+JZrlJiyqfpQO/EE8+5kGkz1Snl8nJLSrWmCKL/MaQKh2CkA2WwtYaim8+
	 5Dd7nLZJlP61A==
Received: from [100.112.193.63] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-1.aws.symcld.net id 20/BD-28327-52FDEA06; Wed, 26 May 2021 23:52:05 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRWlGSWpSXmKPExsViZ8MRqqt6f12
  CwZMnvBZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8aGmbfZCr5yVMz7v5mxgbGBo4uRi0NIYBaT
  xMVpu1ggnBOMErdPrgZyODnYBNQkpt+6wdrFyMEhIqAncfWfKEiYWUBF4sXvHnYQW1jAQWLiz
  gWsIDaLgKrE7aXTwOK8Ao4SOx4tAYtLCChITHn4nhnE5hRwkvi+soMRxBYCqnn9cxIjRL2gxM
  mZT1gg5ktIHHzxghmiV1Fi9uVmFgi7QuL14UvMExj5ZyFpmYWkZQEj0ypGi6SizPSMktzEzBx
  dQwMDXUNDI11DS1NdI0NTvcQq3US91FLd8tTiEl1DvcTyYr3iytzknBS9vNSSTYzAcEwpOHx9
  B+Ot1x/0DjFKcjApifJeO7EuQYgvKT+lMiOxOCO+qDQntfgQowwHh5IE7+TbQDnBotT01Iq0z
  BxgbMCkJTh4lER4e28BpXmLCxJzizPTIVKnGBWlxHk97wIlBEASGaV5cG2weLzEKCslzMvIwM
  AgxFOQWpSbWYIq/4pRnINRSZjXHGQKT2ZeCdz0V0CLmYAWCyWCLS5JREhJNTD5/JctWfdIwbF
  h5eXZpzby6PZ7TtrbH/9f4IiWx4+jJxb+49V0Xsv/R6O3P7Au6KnPhN1v7pRUBhjOuMu2pkt/
  mvaW6+s3eW6bn85rE/NTK0n7bkDMRrOnkU8kCyW/CEh7Fmecl4zcwB61x8mD9Xj+3tv7p85kW
  LuZx+2XMt/8c39lnl062bQ4Z2W24qfmRVHmv7/uv/FxW7ot51fuVY6Fk+pCxCYERv6bzR74wK
  Fy0wlBh/5/90ozrB2EHvxf13fL9lyaZNqs29Jms9O4tJjkbSJbkpvrVpQufxr/+Uzaf2PuRe/
  7vpUHcQu2OnlKlS311wzjPPSA26x6S2TXogah65e6mUufdr24N3udyX0lluKMREMt5qLiRAA0
  dIY8QgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-22.tower-267.messagelabs.com!1622073124!11356!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21035 invoked from network); 26 May 2021 23:52:05 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-22.tower-267.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 26 May 2021 23:52:05 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14QNq42g019289
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 27 May 2021 00:52:04 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 27 May 2021 00:52:03 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] stress-ng: upgrade 0.12.08 -> 0.12.09
Date: Thu, 27 May 2021 07:51:48 +0800
Message-ID: <1622073108-6638-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1622073108-6638-1-git-send-email-wangmy@fujitsu.com>
References: <1622073108-6638-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../stress-ng/{stress-ng_0.12.08.bb => stress-ng_0.12.09.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.12.08.bb => stress-ng_0.12.09.bb} (90%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb b/meta/recipes-extended/stress-ng/stress-ng_0.12.09.bb
similarity index 90%
rename from meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.12.09.bb
index 24de8e39be..f7e5f03e78 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.12.09.bb
@@ -9,7 +9,7 @@ SRC_URI = "https://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.xz \
            file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch \
            file://no_daddr_t.patch \
            "
-SRC_URI[sha256sum] = "39e98cbb682bd3f907b2c718c20747bc94804abc92fbc4dad3a50bf530108d09"
+SRC_URI[sha256sum] = "cffac091082c7adbfec649be3c66941c3d622f8b96795656bcce2e20d669cfeb"
 
 DEPENDS = "coreutils-native"
 
-- 
2.25.1

