Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 411F8C433EF
	for <webhook@archiver.kernel.org>; Fri, 17 Jun 2022 01:38:27 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web11.25605.1655429903508495446
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jun 2022 18:38:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Neioh/ja;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1655429901; i=@fujitsu.com;
	bh=74XxOc5aVhU6au8UnOTsQjXYhmAAHYO797C48E6EMZw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Neioh/jaq0pTsIri5GN1L7bzYGjz4ACMo5SPNX06WJevdZoOZTYtrbfXvE9mGfL3t
	 wuMa6uO4LMVS9Oyg0u+zz81QZzJLvNYLVO1eTOzFKH9RiYL6we1SZNBfOV++kL2cN5
	 fP1xNpnFjeTtdid+Bi2aibnEx/p0Xjvwxqhw6NOXhCW822ILUmNyCwoFhlOg/O3emN
	 vZ4mPoXYFpOLacAQaxFtRWmM1yARxpEGEk9UfS8XbAzjRI3hV8zFYMMz2oMNMqvoJo
	 +yppqLsu9d2i6k6k+0OiFgE8Z4cQ5NhjF2xva1EcfCADOfsLPIuGMJscNQBYTLgzeZ
	 r9vv0i8XTbYqw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIIsWRWlGSWpSXmKPExsViZ8ORpMtze3W
  Swc7FGhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8aMxS2sBb+EK758vcbYwHhZsIuRk0NI4AGj
  xIWD0l2MXED2aSaJm/e+MkM4JxklzizawwpSxSagLvH45mvGLkYODhEBPYmr/0RBwswCqhLdF
  9ewg9jCAjYSl5Z+ZgaxWYDiDw+0gNm8Au4S35++AxsjIaAgMeXhe6i4oMTJmU9YIOZISBx88Y
  IZokZJ4sSKj0wQdoXE68OXoOJqElfPbWKewMg/C0n7LCTtCxiZVjHaJBVlpmeU5CZm5ugaGhj
  oGhqaAmlDXWMDvcQq3US91FLdvPyikgxdQ73E8mK91OJiveLK3OScFL281JJNjMCwTClOldvB
  eGDfL71DjJIcTEqivFrHVycJ8SXlp1RmJBZnxBeV5qQWH2KU4eBQkuB9dAMoJ1iUmp5akZaZA
  4wRmLQEB4+SCK/9ZaA0b3FBYm5xZjpE6hSjPcfVK1f2MnNMnf1vPzPHcjA582vbAWYhlrz8vF
  Qpcd6rN4HaBEDaMkrz4IbCYvoSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWFeNpApPJl5JXC
  7XwGdxQR0VuO+FSBnlSQipKQamOR+8aZLJc+12/nM6tc+lijWGI9togqd32yEUzN5LEQ9kn9c
  VunYvrQsnud65Hxunab7oX1mnbxT4orZM9lsvzdGHm3lPH3boW9bqOOHzIOrjSdP//eFPV1TJ
  fpgyPZdq1yad7ltTr59yvL+V66WiXMuvX2z3uDGhuRJq5/tf7LUXEd/Yncdu1kfa87mu/qHut
  6fuKV547zDUnH5+ZPnfYrZUL5jQ8yH3437eELvlRdX1LxL3R23Zn7+lda9j929ox7nbVy3Psx
  l5z2vt+dcM69IcDA4xp68p/X8TO38zq6jib9eXM3aP/nT8fi7IksP6TWeOFnHbfK6wJPvZoyP
  l9A/hX9HPVJ6hLS7eiytRJRYijMSDbWYi4oTAdhi2EhkAwAA
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-18.tower-728.messagelabs.com!1655429900!62904!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7560 invoked from network); 17 Jun 2022 01:38:20 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-18.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 17 Jun 2022 01:38:20 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 18C8E1AE
	for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jun 2022 02:38:20 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 0C7967C
	for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jun 2022 02:38:20 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 17 Jun 2022 02:37:59 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [OE-core] [PATCH] python3: upgrade 3.10.4 -> 3.10.5
Date: Fri, 17 Jun 2022 09:37:49 +0800
Message-ID: <1655429870-19507-1-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jun 2022 01:38:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167011

From: Xu Huan <xuhuan.fnst@fujitsu.com>

0001-Don-t-search-system-for-headers-libraries.patch
refreshed for new version.

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../0001-Don-t-search-system-for-headers-libraries.patch    | 6 +++---
 .../python/{python3_3.10.4.bb => python3_3.10.5.bb}         | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/python/{python3_3.10.4.bb => python3_3.10.5.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch b/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch
index 5485020eb4..62dce4b827 100644
--- a/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch
+++ b/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch
@@ -1,4 +1,4 @@
-From b6ead2d17ceafed47e598b6f50f3ff669deec5ab Mon Sep 17 00:00:00 2001
+From c83256e40d3057ac6325d649f9ce4c4da2c00874 Mon Sep 17 00:00:00 2001
 From: Jeremy Puhlman <jpuhlman@mvista.com>
 Date: Wed, 4 Mar 2020 00:06:42 +0000
 Subject: Don't search system for headers/libraries
@@ -11,10 +11,10 @@ Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/setup.py b/setup.py
-index c190002..5ef368d 100644
+index f7a3d39..9d2273d 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -854,8 +854,8 @@ class PyBuildExt(build_ext):
+@@ -857,8 +857,8 @@ class PyBuildExt(build_ext):
              add_dir_to_list(self.compiler.include_dirs,
                              sysconfig.get_config_var("INCLUDEDIR"))
  
diff --git a/meta/recipes-devtools/python/python3_3.10.4.bb b/meta/recipes-devtools/python/python3_3.10.5.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.10.4.bb
rename to meta/recipes-devtools/python/python3_3.10.5.bb
index 6bd3a6aba8..5933654e12 100644
--- a/meta/recipes-devtools/python/python3_3.10.4.bb
+++ b/meta/recipes-devtools/python/python3_3.10.5.bb
@@ -42,7 +42,7 @@ SRC_URI:append:class-native = " \
            file://12-distutils-prefix-is-inside-staging-area.patch \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
            "
-SRC_URI[sha256sum] = "80bf925f571da436b35210886cf79f6eb5fa5d6c571316b73568343451f77a19"
+SRC_URI[sha256sum] = "8437efd5b106ef0a75aabfbf23d880625120a73a86a22ade4d2e2e68d7b74486"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.25.1


