Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9ED1E77197
	for <webhook@archiver.kernel.org>; Mon, 23 Dec 2024 09:11:32 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.10442.1734945082255578133
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Dec 2024 01:11:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jnvWfVSN;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1734945084; x=1766481084;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=AhcJk++hx4+/Q0N8RvdH3oF2Xd1DSvfDFwOslLrfreQ=;
  b=jnvWfVSNFjW/QbHEBajxOolj4bKXR1x1cqTY4uwlnnQQle4/kdef69Vv
   PqtLUz01qMCToA1lwZ3I6vIv0XGqoiRNW5F/ot0td5NgSsXiGMe97tldm
   K54dKt38w5TCPdLEm2rI2osmmD4S0XWr2ElGGQmnURp8XvQGof2X9JtVT
   xRlEn0R96n451u64Cbzx6PovZfzUoRrb0bHsfT/ZCdcBqCYsqNvLC0by5
   liiLThxk1lEsTL21p6TxGzPrrV4EfgpTwPadxxsYaJ5r1GRZny07Rgk3H
   3LponUgqUz5wkxmsTLXkme7GC9Q6PaxIeVoHiN5h0PXhJ5KQTuOjBjRZ0
   Q==;
X-CSE-ConnectionGUID: Ghyzjqr7Qt637BtqTXxU3A==
X-CSE-MsgGUID: 7eYUQX2BRhm6+usxQaUXIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11294"; a="184685046"
X-IronPort-AV: E=Sophos;i="6.12,256,1728918000"; 
   d="scan'208";a="184685046"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2024 18:11:23 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7A1EF9674B
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 18:11:21 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 4D738CF7C4
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 18:11:21 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id A3EEF20076D2C
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 18:11:20 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4CE951A0073;
	Mon, 23 Dec 2024 17:11:20 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 15/22] python3-pytest-subtests: upgrade 0.13.1 -> 0.14.1
Date: Mon, 23 Dec 2024 17:10:58 +0800
Message-Id: <1734945065-4373-15-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1734945065-4373-1-git-send-email-wangmy@fujitsu.com>
References: <1734945065-4373-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28876.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28876.006
X-TMASE-Result: 10-2.923600-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrTfK5j0EZbyvk6Qbi+9i6DzmS
	FvfDzVPYvAdlz3zxr6YNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0JwcxlwV9fM+V9jt7Oki
	GGidO7I9AYdLFXr37Pnp5g9gYJWDLeBzEkCCpnRlIcJTn2HkqsX0tCKdnhB58I/9UW5M5dRNp7q
	EhmmPgy46HM5rqDwqtgtpVattb0BJ0yVC/1dktOMaLGHoDpfLD5uNP6EWatZ21ZEC3Bfqcjck1U
	UFQzRra/JkqRNIBU01MEtrSsbr0cBYKSbUbFXrbHSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 09:11:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209028

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fix self.instance._outcome is None
- Add support for Python 3.13.
- Dropped support for EOL Python 3.8.
- Fixed output when using TestCase.skipTest
- Fixed pytest requirement to >=7.3

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...est-subtests_0.13.1.bb => python3-pytest-subtests_0.14.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytest-subtests_0.13.1.bb => python3-pytest-subtests_0.14.1.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-pytest-subtests_0.13.1.bb b/meta/recipes-devtools/python/python3-pytest-subtests_0.14.1.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-pytest-subtests_0.13.1.bb
rename to meta/recipes-devtools/python/python3-pytest-subtests_0.14.1.bb
index 743442ea30..56cec25b86 100644
--- a/meta/recipes-devtools/python/python3-pytest-subtests_0.13.1.bb
+++ b/meta/recipes-devtools/python/python3-pytest-subtests_0.14.1.bb
@@ -7,7 +7,7 @@ BUGTRACKER = "https://github.com/pytest-dev/pytest-subtests/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=242b4e17fa287dcf7aef372f6bc3dcb1"
 
-SRC_URI[sha256sum] = "989e38f0f1c01bc7c6b2e04db7d9fd859db35d77c2c1a430c831a70cbf3fde2d"
+SRC_URI[sha256sum] = "350c00adc36c3aff676a66135c81aed9e2182e15f6c3ec8721366918bbbf7580"
 
 PYPI_PACKAGE = "pytest_subtests"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.43.0


