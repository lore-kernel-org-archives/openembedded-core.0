Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A7F8C433F5
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 03:36:51 +0000 (UTC)
Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.4710.1635824210811030027
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Nov 2021 20:36:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=neutral (domain: fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@fujitsu.com)
IronPort-Data: =?us-ascii?q?A9a23=3APdM3ia8k+XIIDa41zJUBDrUDoHyTJUtcMsCJ2f8?=
 =?us-ascii?q?bfWQNrUoi1WFTmGMeW22CaPaNYWKncoogaIq/8ktUusXUy95kGVdlrnsFo1Bi8?=
 =?us-ascii?q?5ScXYvDRqvT04J+FuWaFQQ/qZx2huDodKjYdVeB4EfyWlTdhSMkj/jRH+KlULW?=
 =?us-ascii?q?s1h1ZHmeIdg9w0HqPpMZp2uaEsfDha++8kYuaT//3YTdJ6BYoWo4g0J9vnTs01?=
 =?us-ascii?q?BjEVJz0iXRlDRxDlAe2e3D4l/vzL4npR5fzatE88uJX24/+IL+FEmPxp3/BC/u?=
 =?us-ascii?q?ulPD1b08LXqXPewOJjxK6WYD72l4b+HN0if19aZLwam8O49mNt894ztpIpLS+V?=
 =?us-ascii?q?AUoIrbR3u8aVnG0FgknZPMZpeOaeinXXcu7iheun2HX6/J2AUc7OIcV9up6DSR?=
 =?us-ascii?q?F8uYVADQMdQyYweWuzbS2T+NhisguII/sJox3h53K5Vk1Ft5/GdaaHfqMvoQeg?=
 =?us-ascii?q?V8Nagl1Na62T6IkhfBHNXwsuyFyB2o=3D?=
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AbjTNxavGw48eZYsfX/fUJhQ17skD79V00zEX?=
 =?us-ascii?q?/kB9WHVpmszxra+TdZUgpHjJYVkqOU3I9ersBEDEewK/yXcX2/h0AV7BZmnbUQ?=
 =?us-ascii?q?KTRekIh7cKgQeQfhEWndQy6U4PScRD4IqaNykCsS+D2njaLz92+qjgzEm3v5ai?=
 =?us-ascii?q?815dCRFtd7p77xp0TiKSEkhNTgFAApYjfaDsnfZvln6xf2gNdMSnCj0gV+jHnd?=
 =?us-ascii?q?fCk5XrelooHBgigTP+9w+A2frrFQSCxBcCX3dqybcmy2LMlAv0/eGCnpiAu2fh?=
 =?us-ascii?q?61M=3D?=
X-IronPort-AV: E=Sophos;i="5.87,201,1631548800";
   d="scan'208";a="116754539"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 02 Nov 2021 11:36:49 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id B03204D100E7
	for <openembedded-core@lists.openembedded.org>;
 Tue,  2 Nov 2021 11:36:46 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Tue, 2 Nov 2021 11:36:47 +0800
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-docutils: upgrade 0.17.1 -> 0.18
Date: Tue, 2 Nov 2021 11:35:12 +0800
Message-ID: <1635824112-40302-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1635824112-40302-1-git-send-email-wangmy@fujitsu.com>
References: <1635824112-40302-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: B03204D100E7.A31DC
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@fujitsu.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Nov 2021 03:36:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157733

The exceptions to the "Public Domain Dedication" changed.

-License-Update: Copyright year updated to 2021.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-docutils_0.17.1.bb => python3-docutils_0.18.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-docutils_0.17.1.bb => python3-docutils_0.18.bb} (60%)

diff --git a/meta/recipes-devtools/python/python3-docutils_0.17.1.bb b/meta/recipes-devtools/python/python3-docutils_0.18.bb
similarity index 60%
rename from meta/recipes-devtools/python/python3-docutils_0.17.1.bb
rename to meta/recipes-devtools/python/python3-docutils_0.18.bb
index 54a809847f..979eea27fb 100644
--- a/meta/recipes-devtools/python/python3-docutils_0.17.1.bb
+++ b/meta/recipes-devtools/python/python3-docutils_0.18.bb
@@ -2,9 +2,9 @@ SUMMARY = "Docutils is a modular system for processing documentation into useful
 HOMEPAGE = "http://docutils.sourceforge.net"
 SECTION = "devel/python"
 LICENSE = "PSF & BSD-2-Clause & GPLv3"
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=836a1950177996968a49ff477a4a61c4"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=01aec8e28f975e3f369e06b5eb2af9b9"
 
-SRC_URI[sha256sum] = "686577d2e4c32380bb50cbb22f575ed742d58168cee37e99117a854bcd88f125"
+SRC_URI[sha256sum] = "c1d5dab2b11d16397406a282e53953fe495a46d69ae329f55aa98a5c4e3c5fbb"
 
 inherit pypi setuptools3
 
-- 
2.25.1




