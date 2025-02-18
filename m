Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01682C021B5
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 07:41:39 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.14627.1739864484748024222
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Feb 2025 23:41:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MThwr1/W;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739864492; x=1771400492;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=myYjxcsQY+hRFtmi0qBE6s5lw5+NGx2Ik5a+OjCRUXg=;
  b=MThwr1/WCzQJrNsbg4RoE76TUlmfcU4wPq8hjNBIPWt86yM3qECXjock
   PKIxQGP/KozSzp3vqWp6RXM450URO6KIKuCAAF03gPhB+wZHlSLN2CvWt
   6N/bF6ooX7EwRlhZsiJ8eTDfUfbnLvvq7Pq/C3/t/FaI5YFoMehfAVpX7
   MCdkVvS+Y5U29+9DbmvawAGLS0qUb0JZ54ZKbEBM0acyiFxq2Q+5HmClk
   9ZXkpwRgKyRDXY9ji2hzpimFogKNH0gbeIvRK0KTq8WJGXF7rHGjk3E9b
   RVJwzphgEze/Wm4QMNOFv8bInhatDB/kmUUfOWaeLf3B2cbQJi/RskIJF
   A==;
X-CSE-ConnectionGUID: nkAHjnFwSUKCOOEAsp2c3A==
X-CSE-MsgGUID: tDBHfMIATDq2NAPSPGP+1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="177697695"
X-IronPort-AV: E=Sophos;i="6.13,295,1732546800"; 
   d="scan'208";a="177697695"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 16:41:30 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id A8169B416C
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 16:41:28 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 6F9FDCF7D9
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 16:41:28 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0DD151A0071;
	Tue, 18 Feb 2025 15:41:28 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 21/32] python3-numpy: upgrade 2.2.2 -> 2.2.3
Date: Tue, 18 Feb 2025 15:39:24 +0800
Message-Id: <1739864375-21394-21-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739864375-21394-1-git-send-email-wangmy@fujitsu.com>
References: <1739864375-21394-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 07:41:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211583

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-numpy_2.2.2.bb => python3-numpy_2.2.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-numpy_2.2.2.bb => python3-numpy_2.2.3.bb} (96%)

diff --git a/meta/recipes-devtools/python/python3-numpy_2.2.2.bb b/meta/recipes-devtools/python/python3-numpy_2.2.3.bb
similarity index 96%
rename from meta/recipes-devtools/python/python3-numpy_2.2.2.bb
rename to meta/recipes-devtools/python/python3-numpy_2.2.3.bb
index 3b74e9059d..db9a99946c 100644
--- a/meta/recipes-devtools/python/python3-numpy_2.2.2.bb
+++ b/meta/recipes-devtools/python/python3-numpy_2.2.3.bb
@@ -12,7 +12,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://fix_reproducibility.patch \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "ed6906f61834d687738d25988ae117683705636936cc605be0bb208b23df4d8f"
+SRC_URI[sha256sum] = "dbdc15f0c81611925f382dfa97b3bd0bc2c1ce19d4fe50482cb0ddc12ba30020"
 
 GITHUB_BASE_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
-- 
2.43.0


