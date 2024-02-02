Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01E34C48286
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 00:45:45 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.12312.1706834742976919620
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 16:45:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=acpOmMfV;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1706834743; x=1738370743;
  h=from:to:cc:subject:date:message-id;
  bh=TSbsaThQsscT61Ae5JRxN3PyNXGgAoOln+8W8obnXMo=;
  b=acpOmMfVrTOgzOpO9QdhT/XvotNWenycms4yizhe1jnKRcYNmxZeNEF0
   BiGK1d01MQDJEV/3zAkGgrWO07c1WqnAjJcnrmD1zBDixKk/3vgJ4cfyT
   oV8DnXnmRSvhMSeGbYlaaNf1hbGPpoYiDLjSTDH+r5EfwW+B/1bAEpriP
   FYcxuAgZOAldudcSSjkuOirUsREIleGKqHXW2VfoSN9IE39AWgsfskGH/
   VwxxSqp75Ho/dZhXPY4gsUZqlpeaAHJCDWmvAv6GobwdEZJSxYPkr3KHw
   fEYTTlFPvtkTB7jnORUHaajB0RCGYAgZk3q29cSTYp9Ya/bxGkI91jxwq
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="135725611"
X-IronPort-AV: E=Sophos;i="6.05,236,1701097200"; 
   d="scan'208";a="135725611"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2024 09:45:40 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 44469D62B0
	for <openembedded-core@lists.openembedded.org>; Fri,  2 Feb 2024 09:45:38 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 7FE5E23120F
	for <openembedded-core@lists.openembedded.org>; Fri,  2 Feb 2024 09:45:37 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 16A8820096427
	for <openembedded-core@lists.openembedded.org>; Fri,  2 Feb 2024 09:45:37 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9131C1A009A;
	Fri,  2 Feb 2024 08:45:36 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-pytz: upgrade 2023.3 -> 2023.4
Date: Fri,  2 Feb 2024 08:33:31 +0800
Message-Id: <1706834011-20221-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28158.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28158.003
X-TMASE-Result: 10--0.169200-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0Zs0T0PE+KHuWuLG21Eb4T84Fum2PEjqt1o8W
	MkQWv6iV3LAytsQR4e1cppCzPq+1UxlblqLlYqXLI0+rx48puSljWYo9vSjM5+xqFkIBrt0CpLS
	RxoP8jj6ICYx2R9qzZsGuRVj4LJx+u+Ddz5HAZyuKh5ohloL/1X0eaoG3W5GD+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Feb 2024 00:45:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194774

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pytz_2023.3.bb => python3-pytz_2023.4.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytz_2023.3.bb => python3-pytz_2023.4.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-pytz_2023.3.bb b/meta/recipes-devtools/python/python3-pytz_2023.4.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-pytz_2023.3.bb
rename to meta/recipes-devtools/python/python3-pytz_2023.4.bb
index 09fa26093f..c2e8e3707a 100644
--- a/meta/recipes-devtools/python/python3-pytz_2023.3.bb
+++ b/meta/recipes-devtools/python/python3-pytz_2023.4.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1a67fc46c1b596cce5d21209bbe75999"
 
 inherit pypi setuptools3 ptest
 
-SRC_URI[sha256sum] = "1d8ce29db189191fb55338ee6d0387d82ab59f3d00eac103412d64e0ebd0c588"
+SRC_URI[sha256sum] = "31d4583c4ed539cd037956140d695e42c033a19e984bfce9964a3f7d59bc2b40"
 
 RDEPENDS:${PN}:class-target += "\
     ${PYTHON_PN}-datetime \
-- 
2.34.1


