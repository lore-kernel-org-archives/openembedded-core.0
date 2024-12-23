Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0255EE77195
	for <webhook@archiver.kernel.org>; Mon, 23 Dec 2024 09:11:33 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.10440.1734945081618580580
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Dec 2024 01:11:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Vf3vPbOL;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1734945084; x=1766481084;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=H5FTRxZf7CtpzzXs6OVI7afi1y0k72bUgwXuqG9sMOs=;
  b=Vf3vPbOL7Kp3wPrbctYbM7N6DsU4psZnrJsnKyO7H93+BTNGfRixzmm+
   oqm0xiQQewIKfA7AoeBAGApqmD9FAujVyax25TbL8hSXfIIm8OE6+bHmT
   zpAMuFhxKBG79JUfU/JAgLhQ0XBhxLVpnpYnWNOvPJjQHR1xp/mlMNL/C
   I6ZwthVY2ZnKtNawkN/pfSyU0sREgmWkADclB5HtrAuMy9on1Kwcqze0e
   c5KtTX/uCzMJmFnKEsGBGJEh37JiyHtYoAbmMhnQhM0zrmiEyCK60UlcG
   PWcmAneDa/bb+nZp+IWO5/p+1+DGcWRMvM6XiLWpvNcLCnilwDjYzjJaN
   g==;
X-CSE-ConnectionGUID: KLOddrGsTWm0dZqIIgS6Tw==
X-CSE-MsgGUID: e84poR5MRYumGaycQLCEsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11294"; a="164121762"
X-IronPort-AV: E=Sophos;i="6.12,256,1728918000"; 
   d="scan'208";a="164121762"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2024 18:11:23 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id EBE0EDBB87
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 18:11:20 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id BCEFFD8B32
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 18:11:20 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4C2A822882D
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 18:11:20 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 126E41A0071;
	Mon, 23 Dec 2024 17:11:20 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 14/22] python3-pyopenssl: upgrade 24.2.1 -> 24.3.0
Date: Mon, 23 Dec 2024 17:10:57 +0800
Message-Id: <1734945065-4373-14-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1734945065-4373-1-git-send-email-wangmy@fujitsu.com>
References: <1734945065-4373-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28876.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28876.006
X-TMASE-Result: 10--1.114700-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mr+KgiyLtJrSBZUipC+zHNir6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AQhNjZQYyI3LRPJs/q8vyUxeY
	0Sr8d1/HQGlxIVvV/XoAy6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzytnSYyOMgNowCe
	3OxzqZtMNZDQjM3fz9I2IRH8b/G4Z661/HA0I2lw4JGTeTchVOwK4arHDMh6YYpRUTNu1VXwdQV
	9d8+RpYiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 09:11:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209026

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://github.com/pyca/pyopenssl/blob/main/CHANGELOG.rst

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-pyopenssl_24.2.1.bb => python3-pyopenssl_24.3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyopenssl_24.2.1.bb => python3-pyopenssl_24.3.0.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-pyopenssl_24.2.1.bb b/meta/recipes-devtools/python/python3-pyopenssl_24.3.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-pyopenssl_24.2.1.bb
rename to meta/recipes-devtools/python/python3-pyopenssl_24.3.0.bb
index 74c23fb614..b8a980be42 100644
--- a/meta/recipes-devtools/python/python3-pyopenssl_24.2.1.bb
+++ b/meta/recipes-devtools/python/python3-pyopenssl_24.3.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 DEPENDS += "openssl python3-cryptography"
 
-SRC_URI[sha256sum] = "4247f0dbe3748d560dcbb2ff3ea01af0f9a1a001ef5f7c4c647956ed8cbf0e95"
+SRC_URI[sha256sum] = "49f7a019577d834746bc55c5fce6ecbcec0f2b4ec5ce1cf43a9a173b8138bb36"
 
 inherit pypi setuptools3
 
-- 
2.43.0


