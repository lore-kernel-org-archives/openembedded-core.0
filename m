Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 299A9C83F21
	for <webhook@archiver.kernel.org>; Thu, 31 Aug 2023 02:45:53 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.8680.1693449951766396384
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 19:45:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="129619714"
X-IronPort-AV: E=Sophos;i="6.02,215,1688396400"; 
   d="scan'208";a="129619714"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 11:45:50 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5F8AEDE569
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 11:45:47 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 89F46BF4AD
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 11:45:46 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0A0E06BEF6;
	Thu, 31 Aug 2023 11:45:45 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-hypothesis: upgrade 6.82.5 -> 6.82.7
Date: Thu, 31 Aug 2023 10:45:41 +0800
Message-Id: <1693449941-28302-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27846.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27846.004
X-TMASE-Result: 10-0.820900-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrxZpjHSMI6w5uwe1DQn3m1EFY
	UJLQupgqUmZ/vaUO45elZxj2UhQ/0xLmJd2F/yFuP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW5fZPFUbFYJwdOq8pg5T0yx5UcZtwNsCrqDGx/OQ1GV8mVV1G+Ck2l7+gtHj7OwNO2eVW
	/ZdL52j82VxgEP5O3SgupBpgFU3/vwWZ4V2LsjzxCthv6u6sX3c/VSbUCW9J/KV9wM2NWYu2qx2
	HW0nxPszJ5Yl5CwlzribCCs+dVTAbIlR0CP+9uuvukFcYgGbHWubInJ6UnEoYlgGwbvE/hr
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 02:45:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186950

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
- updates our autoformatting tools, improving our code style without any API changes.
- enables and fixes many more of ruff‘s lint rules.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-hypothesis_6.82.5.bb => python3-hypothesis_6.82.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.82.5.bb => python3-hypothesis_6.82.7.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.82.5.bb b/meta/recipes-devtools/python/python3-hypothesis_6.82.7.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.82.5.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.82.7.bb
index 89efeff633..5df95eb67b 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.82.5.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.82.7.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "41e78b4cbc0a36b38729a761e31b92d81d87a60a297994c03f2ccb2c946f5ebd"
+SRC_URI[sha256sum] = "06069ff2f18b530a253c0b853b9fae299369cf8f025b3ad3b86ee7131ecd3207"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.34.1


