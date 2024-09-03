Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECD56CD3438
	for <webhook@archiver.kernel.org>; Tue,  3 Sep 2024 08:33:28 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.18515.1725352398195464899
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Sep 2024 01:33:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=A/TLXmQs;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1725352400; x=1756888400;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ViInjMWC5vSFORxYG6tQF13KhoLaItF3nwdY56Z970s=;
  b=A/TLXmQsF8qsX8e8c0xjaxc8eXrWIeOSRHtPp5Rz1eqtc2FAVzO3amJj
   6+obCCl/ScCOg0/6Zv5wU7EvGNqqD56efKhk6XAHGEl5wNt50N0lgIOqZ
   smwO9AVlyNltuMrBJPoJuGpnWxIh3rA0Pndo5kevVygXoRvd5qP/o9tNj
   gOi18n6qZQVghF/4nwciL1n5f+fnmPQhlRN4cG/KpzxCZqbDcwX6OShq8
   3YoGrWzfHbtxm3vFsmsDAYs0Np/zXy2DvLnIDpZftto7qLLrRf9M9f11t
   VtABvu0UpV9enX3NUQQNSzum+kVkwPwsdw7pVeQExgILXuSmUcWE/kdsP
   A==;
X-CSE-ConnectionGUID: kShWxcpoRUGUxYblmIjCnw==
X-CSE-MsgGUID: jM7SrmlGRrqmaOg1X2AYfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="172545773"
X-IronPort-AV: E=Sophos;i="6.10,198,1719846000"; 
   d="scan'208";a="172545773"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 17:33:18 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2E8BDD8008
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Sep 2024 17:33:16 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6BE19D4BF5
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Sep 2024 17:33:15 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id E015220076D22
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Sep 2024 17:33:14 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 855501A000C;
	Tue,  3 Sep 2024 16:33:14 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 14/22] python3-certifi: upgrade 2024.7.4 -> 2024.8.30
Date: Tue,  3 Sep 2024 16:32:51 +0800
Message-Id: <1725352379-20334-14-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1725352379-20334-1-git-send-email-wangmy@fujitsu.com>
References: <1725352379-20334-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28638.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28638.006
X-TMASE-Result: 10-2.115300-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIAf/HImzvCGBUtfqgsaZaLuce7gFxhKa2YkAyCbA7KV5soi2XrUn/J8m+
	hzBStant0zt8ihye3BAtuKBGekqUpnH7sbImOEBRJdvJg8+WllkSyKiw5OlAQdC+s1ExCXBRyIW
	fA1vuyD8Wshncas7+ukNL4wWHkro6XmmUINhXFL6i1vWxxxIzlQpmJdl/+Bd/sfZ9V6Q6rCZgvU
	oiYqGrVm457vI8IG8B/Y4nFsBWAdD6Qrn3xh/cy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 08:33:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204140

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...python3-certifi_2024.7.4.bb => python3-certifi_2024.8.30.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-certifi_2024.7.4.bb => python3-certifi_2024.8.30.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-certifi_2024.7.4.bb b/meta/recipes-devtools/python/python3-certifi_2024.8.30.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-certifi_2024.7.4.bb
rename to meta/recipes-devtools/python/python3-certifi_2024.8.30.bb
index 781e04213d..87047b9370 100644
--- a/meta/recipes-devtools/python/python3-certifi_2024.7.4.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2024.8.30.bb
@@ -7,7 +7,7 @@ HOMEPAGE = " http://certifi.io/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11618cb6a975948679286b1211bd573c"
 
-SRC_URI[sha256sum] = "5a1e7645bc0ec61a09e26c36f6106dd4cf40c6db3a1fb6352b0244e7fb057c7b"
+SRC_URI[sha256sum] = "bec941d2aa8195e248a60b31ff9f0558284cf01a52591ceda73ea9afffd69fd9"
 
 inherit pypi setuptools3
 
-- 
2.34.1


