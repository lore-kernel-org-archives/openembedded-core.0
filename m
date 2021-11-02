Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C9AAC433EF
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 03:36:27 +0000 (UTC)
Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web09.4762.1635824179933014976
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Nov 2021 20:36:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=neutral (domain: fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@fujitsu.com)
IronPort-Data: =?us-ascii?q?A9a23=3AHzkq1Kil3G6PeWFV9YxDOQc6X161QBIKZh0ujC4?=
 =?us-ascii?q?5NGQNrF6WrkVUzmAZDGuCO/uOZGaheNB3ao3io0lX6sfdz9JiSQpp+Hw8FHgiR?=
 =?us-ascii?q?ejtX4rAdhiqV8+xwmwvdGo+toNGLICowPkcFhcwnT/wdOi+xZVA/fvQHOOlUba?=
 =?us-ascii?q?dYnsZqTJME0/NtzoywobVvaY42bBVMyvV0T/Di5W31G2NglaYAUpIg063ky6Di?=
 =?us-ascii?q?dyp0N8uUvPSUtgQ1LPWvyF94JvyvshdJVOgKmVfNrbSq+ouUNiEEm3lExcFUrt?=
 =?us-ascii?q?Jk57wdAsEX7zTIROTzHFRXsBOgDAb/mprjPl9b6FaNC+7iB3Q9zx14MpEs5O1W?=
 =?us-ascii?q?C8nI6/NhP8AFRJfFkmSOIUfoeGYfCTi65L7I0ruNiGEL+9VJEYuMIsV/+x6DW1?=
 =?us-ascii?q?D+bkTLyoARhSCnP6thrWjR+9hg84uIMXmMMUYoH4I8N1zJZ7KWriaG+OTu4Aeh?=
 =?us-ascii?q?2x226hz8T/lT5JxQVJSgN7oOnWj4msqNa8=3D?=
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3ApSCIaqNyr9pQrsBcTqSjsMiBIKoaSvp037BL?=
 =?us-ascii?q?7SBMoHNuH/Bw+/rFoB15737JYVQqN03I8OroUMK9qBvnhP1ICOIqUYtKMjOJhF?=
 =?us-ascii?q?eV?=
X-IronPort-AV: E=Sophos;i="5.87,201,1631548800";
   d="scan'208";a="116754526"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 02 Nov 2021 11:36:25 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 991DF4D0F936
	for <openembedded-core@lists.openembedded.org>;
 Tue,  2 Nov 2021 11:36:21 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Tue, 2 Nov 2021 11:36:22 +0800
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-dbusmock: upgrade 0.24.0 -> 0.24.1
Date: Tue, 2 Nov 2021 11:35:11 +0800
Message-ID: <1635824112-40302-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1635824112-40302-1-git-send-email-wangmy@fujitsu.com>
References: <1635824112-40302-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 991DF4D0F936.A7DFB
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@fujitsu.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Nov 2021 03:36:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157732

Do not register standard D-Bus service directories (Thanks Benjamin Berg)
templates: Add IIO Sensors Proxy support (Thanks Marco Trevisan)
Fix importlib module import (Thanks Marco Trevisan)
Clean up code for most recent pylint version

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-dbusmock_0.24.0.bb => python3-dbusmock_0.24.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dbusmock_0.24.0.bb => python3-dbusmock_0.24.1.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-dbusmock_0.24.0.bb b/meta/recipes-devtools/python/python3-dbusmock_0.24.1.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-dbusmock_0.24.0.bb
rename to meta/recipes-devtools/python/python3-dbusmock_0.24.1.bb
index 271a2b105f..cf272328b3 100644
--- a/meta/recipes-devtools/python/python3-dbusmock_0.24.0.bb
+++ b/meta/recipes-devtools/python/python3-dbusmock_0.24.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/python-dbusmock/"
 LICENSE = "GPL-3.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
-SRC_URI[sha256sum] = "0be0d51dba4aee050bb2cd9074a377bf9308306df1eb7918038c6ffe7153c272"
+SRC_URI[sha256sum] = "56d660bd5f5d0edfe8b0eedfbb9b0814a134eb94b46fca16c379dca68be5724f"
 
 PYPI_PACKAGE = "python-dbusmock"
 
-- 
2.25.1




