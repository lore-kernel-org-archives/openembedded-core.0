Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.67])
 by mx.groups.io with SMTP id smtpd.web11.510.1631662572676476580
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Sep 2021 16:36:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ijzNKBOM;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.67, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1631662570; i=@fujitsu.com;
	bh=ifeNShQDfgQb/5F+52yvxTNZLHJXKGAPuJS0poNzAZg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ijzNKBOMW+D5MvoD9O5CXEfW7/V3yQJna93PnK2JJYVV9HClaxwW1I0uGBzGWVSLy
	 sZ5mzxijOBQnRBhWa0AIZ3d6vfulN3QkkOo1UZ4Ou8BjHqEhBl10Bek/lfuQeS1jXq
	 w0LeNJoOumC8yhtglcYjOCr6kEBKPGDXxkOfdw9AtpzKJgHFjfV4g+pSay5fBBEXU+
	 7MJrT1TOzF9yy5ySbygcIsUR5pMiSqBZVJBOBZSLCnAcduEVXHsqCdxxdv1I1SmB1/
	 Z8gxkb7bc/xhYZ3xM9hFnll+GeCq5HY/tRDYEFiroarvkvllEg9+sn0JraFM/skH6P
	 Y11k01lDkKMZg==
Received: from [100.112.196.248] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-west-1.aws.symcld.net id A7/4E-25352-AE131416; Tue, 14 Sep 2021 23:36:10 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrCIsWRWlGSWpSXmKPExsViZ8MRovvS0DH
  RYPlSK4s7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPD7t+MBfM5Krafm8TUwHiAvYuRi0NIYBaT
  xJ0pT1i6GDmBnBOMEt+/5YDYbAJqEtNv3WDtYuTgEBHQk7j6TxQkzCygIvHidw87iC0s4Cnx5
  u4BJhCbRUBVYve+5WBxXgEnicYLl8FsCQEFiSkP3zOD2JwCzhLbD11kgljlJDH/51EmiHpBiZ
  MzIU5gFpCQOPjiBTNEr6LE7MvNLBB2hcSsWW1MExj5ZyFpmYWkZQEj0ypGi6SizPSMktzEzBx
  dQwMDXUNDI11DSwtdI0NTvcQq3SS91FLd8tTiEl1DvcTyYr3iytzknBS9vNSSTYzAYEwpOHZ9
  B+PV1x/0DjFKcjApifLu4HFMFOJLyk+pzEgszogvKs1JLT7EKMPBoSTB+0APKCdYlJqeWpGWm
  QOMDJi0BAePkgivowFQmre4IDG3ODMdInWKMZzjzdoli5g53oLJtnt3gWQ7mJy54OBqZo5ZYP
  J++yEg+QBECrHk5eelSonzigJjV0gAZFxGaR7cMljkX2KUlRLmZWRgYBDiKUgtys0sQZV/xSj
  OwagkzMuiDzSFJzOvBO6mV0DnMgGde2S/A8i5JYkIKakGpqrpD9xP1Qaem33k/tTLBzY/zJlx
  9zJbzJcZrZMFN7m/rAgKd8pl365uvz141tIq/XKT5StXnz5+daIJf6xowCehk3OvJ0+erpLAu
  8XsuGzI74snz15fJfsvq1Lhoob0hH1P6xY3PRGM45/cfKRQiX13+5qkklPKC+0ymV0WyufZRT
  xrn8/dqJadk/bP+tvjlFV3Ah+KLrNsCs7Qazt/xHZhwyGlTS6v58efb14+d+WzDdrvX+Usje3
  8HaFmf80mIEwsd56SVD6j78+HjWfF82PznIzfh2wLL71avX3jBqu3Zx1ube42ZZJfn3lfd+ZS
  zZXiC2Lb568vvueRsqli9uUpRXbvjSafr0o5dU7z4kYlluKMREMt5qLiRACFyaSWdwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-287.messagelabs.com!1631662569!79619!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21687 invoked from network); 14 Sep 2021 23:36:09 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-4.tower-287.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 14 Sep 2021 23:36:09 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 18ENa1bQ013232
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Sep 2021 00:36:09 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Wed, 15 Sep 2021 00:36:02 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 2/3] vulkan-loader: upgrade 1.2.182 -> 1.2.191
Date: Wed, 15 Sep 2021 07:35:45 +0800
Message-ID: <1631662546-37061-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1631662546-37061-1-git-send-email-wangmy@fujitsu.com>
References: <1631662546-37061-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{vulkan-loader_1.2.182.0.bb => vulkan-loader_1.2.191.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/vulkan/{vulkan-loader_1.2.182.0.bb => vulkan-loader_1.2.191.0.bb} (96%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bb b/meta/recipes-graphics/vulkan/vulkan-loader_1.2.191.0.bb
similarity index 96%
rename from meta/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-loader_1.2.191.0.bb
index a36fa1f844..898a790296 100644
--- a/meta/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-loader_1.2.191.0.bb
@@ -11,7 +11,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7dbefed23242760aa3475ee42801c5ac"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git \
            "
-SRCREV = "1896143df69d439b0933c1bb485f5a4587bdf2dc"
+SRCREV = "7d7cdaa17bc8c349102cfee1d5062d6b7185c172"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1

