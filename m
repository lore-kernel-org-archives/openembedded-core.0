Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 269A4E7719E
	for <webhook@archiver.kernel.org>; Mon, 23 Dec 2024 09:11:33 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.10441.1734945081779026322
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Dec 2024 01:11:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=m5L6aT+6;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1734945083; x=1766481083;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=x3BpjUoaZS/OHoWY8dGrgnefhWL0vE73Ch0h3mDLgio=;
  b=m5L6aT+6ElTkiK14Gpcj6WpKiLvTPPZXjE6+R9YKfxUtTlcSO8Chojdf
   zHZTHH2jVOqOBDy70QoD/G8DKBMyV4XjLemhkWdB4EsW2Ni0Ic7bWVP4Y
   54dCNgu/rG779Kj9nnXCbGz2ipIo2axBTyW9uLPoywaVzxi0KhehutlmO
   qm8QEpAJhOugV9yL/MdcqKMrTmGNpt64dqsZZrrmrG495FmqRLGx+sO3y
   SG/VybCXd+2lJIC7OIc2NzXSOJQNygxFkJq5FL76dTVZI7liBDQZk9Q8i
   ryILZ63gsaEcGZ6N/bPg4QBi25JTcoQWbokhBoZ4OZy0/IvFKvlRmk0tJ
   A==;
X-CSE-ConnectionGUID: dsTMf5JQR3mfMZViy7BV6Q==
X-CSE-MsgGUID: VewTrvtkRqK7xX+hk15aQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11294"; a="187085591"
X-IronPort-AV: E=Sophos;i="6.12,256,1728918000"; 
   d="scan'208";a="187085591"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2024 18:11:21 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id E3AB896743
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 18:11:18 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id AC3F7D5086
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 18:11:18 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 329676B4DF
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 18:11:18 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id CE1731A006C;
	Mon, 23 Dec 2024 17:11:17 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 06/22] python3-certifi: upgrade 2024.8.30 -> 2024.12.14
Date: Mon, 23 Dec 2024 17:10:49 +0800
Message-Id: <1734945065-4373-6-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1734945065-4373-1-git-send-email-wangmy@fujitsu.com>
References: <1734945065-4373-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28876.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28876.006
X-TMASE-Result: 10-2.115300-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIAf/HImzvCGBUtfqgsaZaLuce7gFxhKa2YkAyCbA7KV5soi2XrUn/J8m+
	hzBStant0zt8ihye3BAtuKBGekqUpnH7sbImOEBTQBGDw4Sr8xX1BM/ZxW6ep9tKFoceI42yDos
	qrVmM0tHig/k0MWKVmllGtEKtfTgxxpx2oK3UellTs/cXJPDquHtVuwvXtPZ3sfZ9V6Q6rCZgvU
	oiYqGrVm457vI8IG8B/Y4nFsBWAdD6Qrn3xh/cy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 09:11:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209021

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...thon3-certifi_2024.8.30.bb => python3-certifi_2024.12.14.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-certifi_2024.8.30.bb => python3-certifi_2024.12.14.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-certifi_2024.8.30.bb b/meta/recipes-devtools/python/python3-certifi_2024.12.14.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-certifi_2024.8.30.bb
rename to meta/recipes-devtools/python/python3-certifi_2024.12.14.bb
index 87047b9370..714e231efe 100644
--- a/meta/recipes-devtools/python/python3-certifi_2024.8.30.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2024.12.14.bb
@@ -7,7 +7,7 @@ HOMEPAGE = " http://certifi.io/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11618cb6a975948679286b1211bd573c"
 
-SRC_URI[sha256sum] = "bec941d2aa8195e248a60b31ff9f0558284cf01a52591ceda73ea9afffd69fd9"
+SRC_URI[sha256sum] = "b650d30f370c2b724812bee08008be0c4163b163ddaec3f2546c1caf65f191db"
 
 inherit pypi setuptools3
 
-- 
2.43.0


