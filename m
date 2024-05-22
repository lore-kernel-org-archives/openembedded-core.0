Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 890B9C27C65
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 09:16:01 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.5674.1716369343923111312
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 May 2024 02:15:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Y22f1NIu;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716369344; x=1747905344;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=eweyyF1aWiq6TLipRWbmxoSwu02Az9cPX9O65pvuWNM=;
  b=Y22f1NIuIDI8WXKZypbDBRvWbhkKfmV636qgp66P0AR1p+7zyCb5l2Sh
   FUibjYfCD587Tp5CHpFNOejsyhZkw+33PrfyydmfAy3ACl+Q6l1DAGcY7
   YLrgeQB0Wg8WdwjtPdKd9CorMu9+2KqG6HQYmjvRlWbHm5t8QRVVuKV1d
   FHXyNDesJfK2EfHgp92hUgENQdS6jtXV7io0gTQryFY9EkJDm3YNvRVzW
   eI9NaS6ErdyawDyJHE2VMsXdfWVyzPLILvujoZYv0/6hznfJqNn0XEspb
   79WLWH/jU1RGz2OeEmTl0IfU89UHSgz3Xji2Kojw4gExPIiThuI1eaD2z
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="158511136"
X-IronPort-AV: E=Sophos;i="6.08,179,1712588400"; 
   d="scan'208";a="158511136"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 18:15:42 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9FD01CD6E5
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:39 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id C80AAD7B86
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:38 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 52C932022B83F
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:38 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id F3D8C1A000B;
	Wed, 22 May 2024 17:15:37 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 32/42] python3-hypothesis: upgrade 6.100.1 -> 6.102.4
Date: Wed, 22 May 2024 17:14:39 +0800
Message-Id: <1716369289-22526-32-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
References: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28402.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28402.006
X-TMASE-Result: 10--1.591500-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mrBgA+oehWZhE+++3dUGxY376p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74DCHpeB2SdtvoFum2PEjqt1o8W
	MkQWv6iV3LAytsQR4e1cppCzPq+1UxlblqLlYqXKh3gw4mS40f0yVCTuwuVqf97tf2cladMFJ2W
	5OOlYo5VgwzbbyRcrxMJMpdvDXL/i7fvNXZSNMI+QS6f9EzICcO6IcZa5Rz0f+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 09:16:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199725

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://hypothesis.readthedocs.io/en/latest/changes.html

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-hypothesis_6.100.1.bb => python3-hypothesis_6.102.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.100.1.bb => python3-hypothesis_6.102.4.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.100.1.bb b/meta/recipes-devtools/python/python3-hypothesis_6.102.4.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.100.1.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.102.4.bb
index a689be9a1a..ec43514d41 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.100.1.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.102.4.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "ebff09d7fa4f1fb6a855a812baf17e578b4481b7b70ec6d96496210d1a4c6c35"
+SRC_URI[sha256sum] = "59b4d144346d5cffb482cc1bafbd21b13ff31608e8c4b3e4630339aee3e87763"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.34.1


