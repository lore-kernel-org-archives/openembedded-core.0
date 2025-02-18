Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E374C021B9
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 07:41:39 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.14684.1739864490887324136
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Feb 2025 23:41:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=UG82czGo;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739864491; x=1771400491;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=JqYsSt229UxJiU3gEO5txdwIDGgOroxwhkAqLITXVr4=;
  b=UG82czGo6fIvo7q//aXrcY+jm2HN+813wUh3ba9A7VTEMf5j4Q+9+CnG
   D6O9fftzJ6paYcgHsQb2adqPm+9bvtsEArE/46LUfcPlIBbAARe1X4mnS
   HtujUsTpAbia9eOMoZSgUBuGgS1rpREN+lXkmiQ5MuzaafJt5jTqgt7iz
   582iZYIV0epuLed8kfq+PFDVQ8LU4pYKoALwJS5kQ4V3hqRj13vGUJAch
   GYv/3bwd/GyOvEvKP7lFKTBmNUDu9PswM6wVZ+aFX5rAV0sgfK76W3c1N
   f/MVqYCqXr1K4p4nnnVYIqq3LfF6k2eYyqClPCf6c5zQ9zrvbXMNhX/+u
   A==;
X-CSE-ConnectionGUID: 2UloQP6pT9mfVj999daM/A==
X-CSE-MsgGUID: BuHWiH+2QEO3jJshmWHXXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="189521028"
X-IronPort-AV: E=Sophos;i="6.13,295,1732546800"; 
   d="scan'208";a="189521028"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 16:41:29 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id BCEA3C226C
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 16:41:26 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7BFF9D4BD5
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 16:41:26 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2013E1A000B;
	Tue, 18 Feb 2025 15:41:26 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 16/32] python3-babel: upgrade 2.16.0 -> 2.17.0
Date: Tue, 18 Feb 2025 15:39:19 +0800
Message-Id: <1739864375-21394-16-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739864375-21394-1-git-send-email-wangmy@fujitsu.com>
References: <1739864375-21394-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 07:41:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211580

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2025.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-babel_2.16.0.bb => python3-babel_2.17.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-babel_2.16.0.bb => python3-babel_2.17.0.bb} (74%)

diff --git a/meta/recipes-devtools/python/python3-babel_2.16.0.bb b/meta/recipes-devtools/python/python3-babel_2.17.0.bb
similarity index 74%
rename from meta/recipes-devtools/python/python3-babel_2.16.0.bb
rename to meta/recipes-devtools/python/python3-babel_2.17.0.bb
index 929d7e9983..f7ffbccdac 100644
--- a/meta/recipes-devtools/python/python3-babel_2.16.0.bb
+++ b/meta/recipes-devtools/python/python3-babel_2.17.0.bb
@@ -1,9 +1,9 @@
 SUMMARY = "A collection of tools for internationalizing Python applications"
 HOMEPAGE = "http://babel.edgewall.org/"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e7ebed8cd9f4ff11f547e3afd024a28c"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e83509a66c69efcb4f3a7d4f27fd0693"
 
-SRC_URI[sha256sum] = "d1f3554ca26605fe173f3de0c65f750f5a42f924499bf134de6423582298e316"
+SRC_URI[sha256sum] = "0c54cffb19f690cdcc52a3b50bcbf71e07a808d1c80d549f2459b9d2cf0afb9d"
 
 inherit pypi setuptools3
 
-- 
2.43.0


