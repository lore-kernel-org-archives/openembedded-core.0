Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C52AE77187
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 08:58:35 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.77346.1734425913371418691
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Dec 2024 00:58:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jvWgotP2;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1734425913; x=1765961913;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ke1c4/P+wnMmpLHaWIjAsXmA4Ummhi937t/HSHXRh6o=;
  b=jvWgotP2xnVTjv1ykqAKNKScEMDiCNtYlO6OpL1Q++bHGzU1I3mP48TD
   fZ4J+7FOJwQBM3LEFBXT/ZaRB99yjcM48jlz/3upHptoHZEyZd6ww1h8n
   gAtJhcQq5E+79Ik4AfC4rmUYtEg0XVoy1nlAQXCzK3V9Cu72tfd847Eef
   aq9hQxsXLzJGYrjnfrL8Aj6T0w7rTFVJu0R+ENXEzNGJF5je5TNaeXmvk
   m9KIxnHN9M3dg0WOZY58NJowRD6WYKHwoI9Wky+FYxulqktErg9tJaA4l
   PLBFS2McNa9cWjKgDaERXwLCwxOpwnzth1LIhwT97P/cuYgRrXH/1Blqe
   g==;
X-CSE-ConnectionGUID: 4gTb/pa3R+a1OWPyAZt6wg==
X-CSE-MsgGUID: OiGDicprQyGI+YaFOGTb9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="162907335"
X-IronPort-AV: E=Sophos;i="6.12,241,1728918000"; 
   d="scan'208";a="162907335"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 17:58:30 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id C4A57E445A
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 17:58:28 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8EB87E6475
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 17:58:28 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2BFC62007CDE4
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 17:58:28 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BBFC51A000B;
	Tue, 17 Dec 2024 16:58:27 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH 08/21] libjitterentropy: upgrade 3.6.0 -> 3.6.1
Date: Tue, 17 Dec 2024 16:57:54 +0800
Message-Id: <1734425887-18069-8-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1734425887-18069-1-git-send-email-wangmy@fujitsu.com>
References: <1734425887-18069-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28864.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28864.006
X-TMASE-Result: 10-0.706400-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqxM+b8yxBqvA+aG
	g/Bit59t9Swy3pLY+nx3aWU5jdY62O1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQRBg
	61kSK4DiBkESMI05d4qHvyg1ZsxTfNyl1nd9CIt0URSScn+QSXmVV1G+Ck2l7+gtHj7OwNO36CZ
	XLlV1mSb7cETZ9CRd+n6+82ChmqrSHzu/6+Qf36Dj8GlBs3kQGT6M0OXQIK6P4NW8DeoJ97aJ19
	Z3fiA8ahfUiAW9utOQfANI+zhCtqfIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 08:58:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208812

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
 * Add more test code
 * Add support for SunPRO compiler
 * Fix compilation on OpenBSD by replacing sed with tr
 * internal timer: Add support for Apple
 * Various small fixes to compilation to imporve portability

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../{libjitterentropy_3.6.0.bb => libjitterentropy_3.6.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libjitterentropy/{libjitterentropy_3.6.0.bb => libjitterentropy_3.6.1.bb} (95%)

diff --git a/meta/recipes-support/libjitterentropy/libjitterentropy_3.6.0.bb b/meta/recipes-support/libjitterentropy/libjitterentropy_3.6.1.bb
similarity index 95%
rename from meta/recipes-support/libjitterentropy/libjitterentropy_3.6.0.bb
rename to meta/recipes-support/libjitterentropy/libjitterentropy_3.6.1.bb
index e9ff898617..35be1e2e50 100644
--- a/meta/recipes-support/libjitterentropy/libjitterentropy_3.6.0.bb
+++ b/meta/recipes-support/libjitterentropy/libjitterentropy_3.6.1.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=18a5cada7ee95e61db4180f0cb4a69cf \
                     file://LICENSE.bsd;md5=66a5cedaf62c4b2637025f049f9b826f \
                     "
 SRC_URI = "git://github.com/smuellerDD/jitterentropy-library.git;branch=master;protocol=https"
-SRCREV = "7199c8959347b0e8342df7dc6e0c1fc4b484d2fb"
+SRCREV = "16c9e5c93e614f0df25f1cb30d0730102e6f4e41"
 S = "${WORKDIR}/git"
 
 do_configure[noexec] = "1"
-- 
2.43.0


