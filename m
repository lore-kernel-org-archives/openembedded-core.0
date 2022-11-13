Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FD82C4332F
	for <webhook@archiver.kernel.org>; Sun, 13 Nov 2022 03:12:46 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web10.233.1668309157366317655
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Nov 2022 19:12:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=bJ+IPGQu;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1668309155; i=@fujitsu.com;
	bh=Uuz56WRpDOoGthAByfBuoWXhFTjP87TM86p6iooK4rI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=bJ+IPGQuIrE19M5h9uzbYwD9WymsFtmydxiBtFeP46fezUz3Ry4RQCqBAPMrrtyGH
	 s2Z+xlgVeaqRENuVCBRSmxQBU4QgrdjUlnfYjClj/5I7y7ijwmfuNaU6UlP9HrsAOi
	 Qz5A1h5OTpy7WZcfKQDlFEnbuumd3CGYOR2RcDbLm0UB1IWtV1mbRNmDCv3UeLLcAY
	 ZMw+D1TPUB42n1/95M27rDFHm0cLn8D5CgoIRDdkqy6oDfzVUMH3y8lFOeDtZOILhj
	 lxTVkDTkFVpz/Kgh8z2su8zlGHtc6lky0StsU5DXVRxFi2Nop0ilAd/a7zxupSnTNe
	 GBp4jMoE9SufQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJIsWRWlGSWpSXmKPExsViZ8ORqLsooSD
  ZYOl8XYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPj+zesBVu5K37cm8XewDiXq4uRi0NI4DGj
  xLZrrcwQzjUmieeTVgA5nEDOHkaJKac1QGw2ASmJG/f/s3UxcnCICOhJXP0nChJmFlCRePG7h
  x3EFhawkVjZeZURxGYRUJV4Pm87mM0r4CTxY8dmVhBbQkBBYsrD98wQcUGJkzOfsEDMkZA4+O
  IFM0SNosTsy80sEHaFxKxZbUwQtprE1XObmCcw8s9C0j4LSfsCRqZVjGbFqUVlqUW6hgZ6SUW
  Z6RkluYmZOXqJVbqJeqmluuWpxSW6hnqJ5cV6qcXFesWVuck5KXp5qSWbGIGhmFLMEr+D8eGy
  P3qHGCU5mJREedOu5ycL8SXlp1RmJBZnxBeV5qQWH2KU4eBQkuD9HVmQLCRYlJqeWpGWmQOMC
  5i0BAePkghvhR1Qmre4IDG3ODMdInWKUZdj5te2A8xCLHn5ealS4rwJ8UBFAiBFGaV5cCNgMX
  qJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjDv2migKTyZeSVwm14BHcEEdMT3yDyQI0oSEVJ
  SDUzzZ+x/vubPKcGvF7oOyXfNdVjVtdmB8Rozw+/m+Wf1RHpLM8Mkr4aFvEjt/pbNf9PHRn0F
  Zwzr04viS1Nf9Tw/ci5LsrZPpXvvAtPCtkezAu+Gc654JpPBe7FGrlCq30L51I6+5/Ya/2rkL
  8YwyL5MVlvqtmT7a0njr1vexbTo8bhPud81M15NfM95n4B1G42KNieeq71TE/1K4IlXkOz8tS
  zXXR+oeWyt4Llzp9f28ZzaiN87+fZNrbWZZdNqoNr5/bRu3l3OCLmguf0i849v/5fNubuh50q
  NnHzplZVa0r0l3Gu2H1n6+9HfB8sFIr3vnPdZEed3cuO7ew/llc4csND48qqVW8vvd+MesXNK
  LMUZiYZazEXFiQBrMtHxTAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-591.messagelabs.com!1668309154!393283!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11244 invoked from network); 13 Nov 2022 03:12:34 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-3.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 13 Nov 2022 03:12:34 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 61AC8100198
	for <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 03:12:34 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 547F2100194
	for <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 03:12:34 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Sun, 13 Nov 2022 03:12:32 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] sysstat: upgrade 12.6.0 -> 12.6.1
Date: Sun, 13 Nov 2022 11:12:17 +0800
Message-ID: <1668309137-15285-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 03:12:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173182

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* Fix possible overflow in sa_common.c (GHSL-2022-074).
* sa_conv.c: Make size of statistics structures from older sysstat
  versions immutable.
* Declare sadc dependency on libsyscom.a.
* Fix gcc v11.2 warnings.
* Various cosmetic fixes.
* sar: Remove `-I int_list` from man-page and help.
* Consolidate systemctl commands in README file.
* Remove whitespace characters at the end of lines.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../sysstat/{sysstat_12.6.0.bb => sysstat_12.6.1.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/sysstat/{sysstat_12.6.0.bb => sysstat_12.6.1.bb} (65%)

diff --git a/meta/recipes-extended/sysstat/sysstat_12.6.0.bb b/meta/recipes-extended/sysstat/sysstat_12.6.1.bb
similarity index 65%
rename from meta/recipes-extended/sysstat/sysstat_12.6.0.bb
rename to meta/recipes-extended/sysstat/sysstat_12.6.1.bb
index 273c5c1815..6df7bdbb83 100644
--- a/meta/recipes-extended/sysstat/sysstat_12.6.0.bb
+++ b/meta/recipes-extended/sysstat/sysstat_12.6.1.bb
@@ -4,4 +4,4 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a23a74b3f4caf9616230789d94217acb"
 
 SRC_URI += "file://0001-configure.in-remove-check-for-chkconfig.patch"
 
-SRC_URI[sha256sum] = "699fd948836d77f9ad0541fd5dcf75cd2505f9da4ec14df669286ad047c23d97"
+SRC_URI[sha256sum] = "18ff5a4e149e2568e43385637f72437fe6bafcc1322a93d13d1981e9464a0342"
-- 
2.25.1


