Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF7B3CD11DD
	for <webhook@archiver.kernel.org>; Tue, 26 Mar 2024 00:37:43 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.7883.1711413461296775247
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Mar 2024 17:37:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=lcsWNWHl;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711413463; x=1742949463;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=LUgNGnmyeIBmKyUXp80YHRJguUrX+gXm4VRDb1noB0g=;
  b=lcsWNWHlnw3fEYBcQ1Egf14RiDT79EjgTm7AM5ZVmv9TW8hi5b/hzhDS
   LVGCalr7cLeZ4sdJlezkxoOoi0T5gh+UcRTngDid8VtkoHxU5txZzGT+d
   ha88T+pf5xlKp5W/mKOe88YUWcRkKFk7srX+PuBpd7oOZ4tmy6vY4J6K/
   D5FymWwh29Ez1mLi6RrdztUiNo63DMOFkCS85diiPjpdUYKA3wDQygf4y
   9CVlVEjAjVHCorECPVUswMLGI6+OdUcHnKxFYM2w2GetOVX9H3Rw/z2od
   zyKvAzUro095vbcjD7MetDOr77+BoWwVDuraViNN8/wsSQPtzpP1izZAQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="153313965"
X-IronPort-AV: E=Sophos;i="6.07,154,1708354800"; 
   d="scan'208";a="153313965"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:37:41 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id E10E710A32E
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:37:38 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1F14456F7C
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:37:38 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id A48D720097BFD
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:37:37 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4FBC01A006A;
	Tue, 26 Mar 2024 08:37:37 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-Core] [PATCH 28/34] python3-wheel: upgrade 0.42.0 -> 0.43.0
Date: Tue, 26 Mar 2024 08:34:46 +0800
Message-Id: <1711413292-3025-28-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711413292-3025-1-git-send-email-wangmy@fujitsu.com>
References: <1711413292-3025-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28274.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28274.003
X-TMASE-Result: 10-0.313400-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrSc4iQ7VD4M2U8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUN3IFFT9wqfr0QhNjZQYyI3Cl6ppmExqcYnpt
	r8PnHpyni8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFFWbnFD0Qt0l8XNuudwBrcgPg6
	ZzkhiJ5oXUeg5Hkx30690dg0jZGyNb/fxupP8HryerNp2OVULgqffgYQWfcJCxDdEhshV4iux9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 00:37:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197516

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Dropped support for Python 3.7
-Updated vendored packaging to 24.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-wheel_0.42.0.bb => python3-wheel_0.43.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-wheel_0.42.0.bb => python3-wheel_0.43.0.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-wheel_0.42.0.bb b/meta/recipes-devtools/python/python3-wheel_0.43.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-wheel_0.42.0.bb
rename to meta/recipes-devtools/python/python3-wheel_0.43.0.bb
index 807888e6c0..ba309ae5fc 100644
--- a/meta/recipes-devtools/python/python3-wheel_0.42.0.bb
+++ b/meta/recipes-devtools/python/python3-wheel_0.43.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7ffb0db04527cfe380e4f2726bd05ebf"
 
-SRC_URI[sha256sum] = "c45be39f7882c9d34243236f2d63cbd58039e360f85d0913425fbd7ceea617a8"
+SRC_URI[sha256sum] = "465ef92c69fa5c5da2d1cf8ac40559a8c940886afcef87dcf14b9470862f1d85"
 
 inherit python_flit_core pypi
 
-- 
2.34.1


