Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 005A5C021A9
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 07:41:39 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.14637.1739864493138144434
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Feb 2025 23:41:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=PAdBdWHD;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739864493; x=1771400493;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=5KchXG3MGhQT500z/ZIu5oL3w5X5qJggIEtc/lTe9BU=;
  b=PAdBdWHDljATS1ZRO+a6zxJAmJ2SX+WJ4Gp/S/xT6p5nKJ9I4+pb6ehz
   NVw0UY4b2NKOdQtBtrH8w3CWjexnLfdDY+Hhnf/VvsB4F78HI2cwffv8h
   usdOgDHGlwWhI09EQk8LM8ETaCagLmXJnSYyqYrjHBl4Z8Y7dXSZI5ClY
   SCzTt4TgD9PBSP1jMYfqA1edRILP52ahundRqvl5ApLKCMOmEK1GBe4Bg
   29XUJhzOBx4+ONjiQ1ihG72/GfVGe6LSu0GlMnjpK5kVqK4Lk6NtiIhMQ
   U0kszn8LcZW6PKbTFyEUjAYe4+caFrSqffiPXFE8Ptat2ALwQR6WgchCQ
   w==;
X-CSE-ConnectionGUID: TzNbMnFhRdC3xSrPvisWyg==
X-CSE-MsgGUID: Xi/+nZkBQc+8CfhU7OyA+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="190373912"
X-IronPort-AV: E=Sophos;i="6.13,295,1732546800"; 
   d="scan'208";a="190373912"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 16:41:31 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id EAC12D5011
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 16:41:28 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id A5A86F313
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 16:41:28 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4537E1A000B;
	Tue, 18 Feb 2025 15:41:28 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 22/32] python3-pip: upgrade 25.0 -> 25.0.1
Date: Tue, 18 Feb 2025 15:39:25 +0800
Message-Id: <1739864375-21394-22-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739864375-21394-1-git-send-email-wangmy@fujitsu.com>
References: <1739864375-21394-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 07:41:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211588

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fix an unsupported type annotation on Python 3.10 and earlier.
- Fix a regression where truststore would never be used while installing build dependencies.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pip_25.0.bb => python3-pip_25.0.1.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pip_25.0.bb => python3-pip_25.0.1.bb} (96%)

diff --git a/meta/recipes-devtools/python/python3-pip_25.0.bb b/meta/recipes-devtools/python/python3-pip_25.0.1.bb
similarity index 96%
rename from meta/recipes-devtools/python/python3-pip_25.0.bb
rename to meta/recipes-devtools/python/python3-pip_25.0.1.bb
index 8908fc9115..e54e63cba5 100644
--- a/meta/recipes-devtools/python/python3-pip_25.0.bb
+++ b/meta/recipes-devtools/python/python3-pip_25.0.1.bb
@@ -27,7 +27,7 @@ inherit pypi python_setuptools_build_meta
 
 SRC_URI += "file://no_shebang_mangling.patch"
 
-SRC_URI[sha256sum] = "8e0a97f7b4c47ae4a494560da84775e9e2f671d415d8d828e052efefb206b30b"
+SRC_URI[sha256sum] = "88f96547ea48b940a3a385494e181e29fb8637898f88d88737c5049780f196ea"
 
 RDEPENDS:${PN} = "\
   python3-compile \
-- 
2.43.0


