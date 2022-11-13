Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E72EEC433FE
	for <webhook@archiver.kernel.org>; Sun, 13 Nov 2022 02:57:15 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web09.131.1668308232266053653
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Nov 2022 18:57:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=TuEu4E0t;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1668308230; i=@fujitsu.com;
	bh=4+I9lCYIGtC7c2azIyWMM1fuo0PYVGHY0IQ9ewGMKkM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=TuEu4E0t19iiSIymDoxLYrr+Zp5owqvGLmxYIL0TGk+KvAJTnhsYJaB88qeSMmCFC
	 m5F7p/HDOtnJkb9ZBgKz7UOtzDG1B0Ws5UQv11DRauDuEO2sIDXxYV807JPkka+9pu
	 9P6DPcXDf9Y5Yz6XNtWMeEL7+CUtQvyDwGEGujQ3HMfTKlq1mIGwhywV1RaWogo6ND
	 wHfkhAUhy1JmHvJtsEbQBTvS9nyF0vWrNCNybqS1TPpt6AmBDJb3pWiXnUe74Sx4K8
	 qcr1j3BkYPAh1nTbT0dBvOyGR9Oa9gyCCDaoNnknJEOVzbhh/QJ+X8sOQX3OYpxSAy
	 4mOnVtsEv5t7A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJIsWRWlGSWpSXmKPExsViZ8OxWZcltiD
  ZYNlreYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPbhzOMBd/YK2ZMucXcwNjG3sXIxSEkcJ9R
  4vLxdhYI5xKTxIpdfVDOHkaJdy/uAJVxcrAJSEncuP+frYuRg0NEQE/i6j9RkDCzgIrEi989Y
  CXCArYSUz7NZQWxWQRUJZqWbmUCKecVcJK4cz4FJCwhoCAx5eF7ZhCbV0BQ4uTMJywQYyQkDr
  54wQxRoygx+3IzC4RdITFrVhsThK0mcfXcJuYJjPyzkLTPQtK+gJFpFaNZcWpRWWqRrqGBXlJ
  RZnpGSW5iZo5eYpVuol5qqW55anGJrqFeYnmxXmpxsV5xZW5yTopeXmrJJkZgKKYUs8TvYHy4
  7I/eIUZJDiYlUd606/nJQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR4f0cWJAsJFqWmp1akZeYA4
  wImLcHBoyTCW2EHlOYtLkjMLc5Mh0idYtTlmPm17QCzEEtefl6qlDivN8gMAZCijNI8uBGwGL
  3EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZh3XxjQFJ7MvBK4Ta+AjmACOuJ7ZB7IESWJCCm
  pBqbcYxY7Vy/0t/1T9MIoktfiypzHU4JPK/jf0Vhr8WbHqr8V6+2kt7LUtyU4/NkTWWcstqjS
  5r7zj+SZ9sb7/iz2fG7//fW9Dy4uITO87+s8MHk8pZ4hvdAtPG7RQTO9GfElOy588O+U+Mt7e
  Xfw3icMislbG8RKZ9U9jpRf4nPqRrXOzoV3ZdSZD/VPvbolcd7luZF7VqW+ljltbcK92DDRxC
  vY9w0rd3asY9wc+4dBk89oxB1a++WugWsPQ4WZVmZOVWnzzX27sp63TD9fsUley++GWcQnJ4a
  aBulPpst9Hk/5cD2QjftzvsPN/+eThHqulKzN3R78cFt5wiElhScOLHvb7A7dqtrLasWw0FKJ
  pTgj0VCLuag4EQDXj8xUTAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-587.messagelabs.com!1668308228!413064!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12203 invoked from network); 13 Nov 2022 02:57:08 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-5.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 13 Nov 2022 02:57:08 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 2C1BE7B
	for <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 02:57:08 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 1FDEE73
	for <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 02:57:08 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Sun, 13 Nov 2022 02:57:06 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libdrm: upgrade 2.4.113 -> 2.4.114
Date: Sun, 13 Nov 2022 10:56:50 +0800
Message-ID: <1668308210-14483-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 02:57:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173167

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../drm/{libdrm_2.4.113.bb => libdrm_2.4.114.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.113.bb => libdrm_2.4.114.bb} (97%)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.113.bb b/meta/recipes-graphics/drm/libdrm_2.4.114.bb
similarity index 97%
rename from meta/recipes-graphics/drm/libdrm_2.4.113.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.114.bb
index 959ef68032..16087f97e5 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.113.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.114.bb
@@ -13,7 +13,7 @@ DEPENDS = "libpthread-stubs"
 SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.xz \
           "
 
-SRC_URI[sha256sum] = "7fd7eb2967f63beb4606f22d50e277d993480d05ef75dd88a9bd8e677323e5e1"
+SRC_URI[sha256sum] = "3049cf843a47d12e5eeefbc3be3496d782fa09f42346bf0b7defe3d1e598d026"
 
 inherit meson pkgconfig manpages
 
-- 
2.25.1


