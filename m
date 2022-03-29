Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 356F0C433EF
	for <webhook@archiver.kernel.org>; Tue, 29 Mar 2022 01:31:35 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web12.1626.1648517494194727148
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 18:31:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=fCghPfKV;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1648517492; i=@fujitsu.com;
	bh=vDgA5tQFtsfT8tgjKNGI6auVpumYhj7J+ahMa1SbZ0w=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=fCghPfKVHUYvf0VMzIDk+qxWFxkj2WZKVMVcDw4FZY743k04AgNHk4YPs7itumx0t
	 CfgMYMJBN0q1+/GqSJFRHYKYcCysfOpzMJVKxu0QY3g6oGEwTVT90quSpIAjyu6FRI
	 Qx+CUDmnxzK8OSio5D9z7W9DueY3abkH8vp8kfoYxsZCuLZsGf0VyLHIfDSYBlajkC
	 zDaJqhWgyRaqRLMB3qZjaoyWNZnuJ3NEBVVdK7989S90Oj8tqRsd3cUKeHTkijIrUg
	 LAaxHPTD0wi2U8jjaRWFTMABVHANT7M4tSmNZXRp4UQnVg2BT5gQCZ19x88NKh8rH4
	 b/ml8jsI6dF1w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEIsWRWlGSWpSXmKPExsViZ8ORqFuc6JR
  kcOG/ocWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmtGzbAJLwVqOil/relgbGK+ydzFycQgJPGaU
  mH1tCWMXIyeQc55J4tY6XojEHkaJf5emsoEk2ATUJKbfusHaxcjBISKgJ3H1nyhImFlAReLF7
  x52EFtYwFHi/vYJzCA2i4CqxLbFW5lAbF4BJ4l3/56C2RICChJTHr5nhogLSpyc+YQFYo6ExM
  EXL5ghahQlZl9uZoGwKyRmzWqD6lWTuHpuE/MERv5ZSNpnIWlfwMi0itE6qSgzPaMkNzEzR9f
  QwEDX0NBU19hY19DcUi+xSjdRL7VUtzy1uETXSC+xvFgvtbhYr7gyNzknRS8vtWQTIzAoU4oV
  N+9gnLjyp94hRkkOJiVR3guaTklCfEn5KZUZicUZ8UWlOanFhxhlODiUJHiZEoBygkWp6akVa
  Zk5wAiBSUtw8CiJ8GrHA6V5iwsSc4sz0yFSpxgVpcR5i0ESAiCJjNI8uDZYVF5ilJUS5mVkYG
  AQ4ilILcrNLEGVf8UozsGoJMxrDzKFJzOvBG76K6DFTECL6x47giwuSURISTUw+Tx/88a798n
  zBbtSd++Y+L26VMjpKuv8z2VTCzib5H8f7DvC5NHEck9pluyDv75Fb8qLFD+t17F3ypv5v1vA
  uvb49x9lavvyNrL/fWebcXpa9QrhMy2fveorhadO/GgdJFN3y/Tn97zIcx9imsxP8kXP/X1ep
  Uap+mfAxokr1mr938U5OehRduakOhaj4009Hz9Nexp5Kvrvs7Xx8r4arkIurmv+Tf93t/G9NJ
  ugoHV9X7vJH+O/yZLfThX2/TsjbFS8xdE8csVT94jU/wEy93PMWwIS9/FGVGb+iKxlvRpp+es
  3X+WVP8GzX9j+6YtaYb7QwM99Pve5uuC+jINWv7ec15Nc/erJlGN3f8Y0KbEUZyQaajEXFScC
  APyHniFFAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-548.messagelabs.com!1648517491!14755!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19091 invoked from network); 29 Mar 2022 01:31:31 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-7.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 29 Mar 2022 01:31:31 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 6480610018E
	for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Mar 2022 02:31:31 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 49E0210004D
	for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Mar 2022 02:31:31 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 29 Mar 2022 02:31:09 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-pytz: upgrade 2021.3 -> 2022.1
Date: Tue, 29 Mar 2022 09:30:58 +0800
Message-ID: <1648517458-21335-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Tue, 29 Mar 2022 01:31:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163730

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pytz_2021.3.bb => python3-pytz_2022.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytz_2021.3.bb => python3-pytz_2022.1.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-pytz_2021.3.bb b/meta/recipes-devtools/python/python3-pytz_2022.1.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-pytz_2021.3.bb
rename to meta/recipes-devtools/python/python3-pytz_2022.1.bb
index 119342a4bd..a4bb4f5c8f 100644
--- a/meta/recipes-devtools/python/python3-pytz_2021.3.bb
+++ b/meta/recipes-devtools/python/python3-pytz_2022.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1a67fc46c1b596cce5d21209bbe75999"
 
 inherit pypi setuptools3 ptest
 
-SRC_URI[sha256sum] = "acad2d8b20a1af07d4e4c9d2e9285c5ed9104354062f275f3fcd88dcef4f1326"
+SRC_URI[sha256sum] = "1e760e2fe6a8163bc0b3d9a19c4f84342afa0a2affebfaa84b01b978a02ecaa7"
 
 RDEPENDS:${PN}:class-target += "\
     ${PYTHON_PN}-datetime \
-- 
2.25.1


