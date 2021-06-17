Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web11.1902.1623893420455366723
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jun 2021 18:30:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=dnWpTWBv;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1623893418; i=@fujitsu.com;
	bh=3sHCR21yvb3OXhyakOLSB+/Tz2PKk+QqExSQGEWM0dc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=dnWpTWBvIGxmFWeczq9PEHE5nALVWzQ5jILM97r+oquj7V+yf2pWcDk1DWDhI6/bk
	 1Be0d3ZthuOLDvzxV52Q4ySppP0Ao1oQ2ScJiq9ZSQgfZ6wvr1h5QfoQpeDanE7vvR
	 dS383Ve6RS0+BBpZnsVw5JTQybVp5DeTI0zyEWd8NP2SccxyXsWzC1LdL1CqyhVUVX
	 E8Qc/kH4UX7BImjgbRefcSi3+fDML3HYNmVMQv/bmQCsUSOrf9FoWS5Yl1KxlQol4t
	 x/ZwczpQUP1C6+EFtY2Yoi3R/ztyypN0HBrTrGHbk1KgPhZMtf8qjVJgwNSQo8z7Hq
	 OBogRtiHbyP8Q==
Received: from [100.113.1.143] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-central-1.aws.symcld.net id 09/E9-11194-AA5AAC06; Thu, 17 Jun 2021 01:30:18 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+GYortq6ak
  Eg1ntfBZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8aDM82sBd85K5bdvMXSwPiao4uRi0NIYBaT
  xO933xghnD2MEt3XPjF1MXJysAnoSpx7vJa9i5GDQ0RAT+LqP1GQsLCAjcSda+/YQGwWAVWJJ
  4fvgNm8Ap4SL46cZgexJQQUJKY8fM8MEReUODnzCQuIzSwgIXHwxQtmkJESAooSs6fLQ5RXSM
  yYsY1tAiPPLCQds5B0LGBkWsVomVSUmZ5RkpuYmaNraGCga2horGusa2hpopdYpZuol1qqm5y
  aV1KUCJTVSywv1iuuzE3OSdHLSy3ZxAgMo5RC5kM7GJ+8/qB3iFGSg0lJlLe581SCEF9Sfkpl
  RmJxRnxRaU5q8SFGGQ4OJQlepsVAOcGi1PTUirTMHGBIw6QlOHiURHh1FwGleYsLEnOLM9MhU
  qcYFaXEeS1A+gRAEhmleXBtsDi6xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmYt3AJ0BSezL
  wSuOmvgBYzAS1uEwJbXJKIkJJqYBK7mzZHPYHzbdXKX5Jau+d2Feg+FX4m++amGuvUZV7an6/
  OSjmdV33h7sUvchpLIuQtdQQzputUxH3rF3q35/7UmVWbfp+eZM6f23m5NemC++Xz63o2HAj6
  KzHdW1Rs/j7unpKLd7/8m/33641Az9teLTPUZ3/3Xml13WNO0uYKy+LiD4aTj027cbff+X8kU
  /iWX9bSmx/r2F7eUiL06IylS7Sjh0568qnYi/0mdrNlCrlytrDtjYp9VFIs1cm8b+OGZis1/w
  mHXr3zOuWyo3d5bpHu7BDN9QsiNPkbq7MOtfW2b/vCysBWEeX+8suzydmCl469tKu7/v/WJUM
  R6aL9NS3zGkz/Pj3KonJ/6xElluKMREMt5qLiRAD0mQqMHgMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-8.tower-232.messagelabs.com!1623893417!104223!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10951 invoked from network); 17 Jun 2021 01:30:18 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-8.tower-232.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Jun 2021 01:30:18 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15H1UHVs028732
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Jun 2021 02:30:17 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 17 Jun 2021 02:30:16 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] nfs-utils: upgrade 2.5.3 -> 2.5.4
Date: Thu, 17 Jun 2021 18:30:10 +0800
Message-ID: <1623925810-129657-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../nfs-utils/{nfs-utils_2.5.3.bb => nfs-utils_2.5.4.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/nfs-utils/{nfs-utils_2.5.3.bb => nfs-utils_2.5.4.bb} (98%)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.5.3.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.5.4.bb
similarity index 98%
rename from meta/recipes-connectivity/nfs-utils/nfs-utils_2.5.3.bb
rename to meta/recipes-connectivity/nfs-utils/nfs-utils_2.5.4.bb
index d8c6391b3d..5500a9249f 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.5.3.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.5.4.bb
@@ -31,7 +31,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
            file://0001-Makefile.am-fix-undefined-function-for-libnsm.a.patch \
            file://clang-warnings.patch \
            "
-SRC_URI[sha256sum] = "b54d6d8ea2ee62d64111278301ba4631b7bb19174e7f717a724fe5d463900c80"
+SRC_URI[sha256sum] = "51997d94e4c8bcef5456dd36a9ccc38e231207c4e9b6a9a2c108841e6aebe3dd"
 
 # Only kernel-module-nfsd is required here (but can be built-in)  - the nfsd module will
 # pull in the remainder of the dependencies.
-- 
2.25.1

