Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECC37C3DA79
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 09:04:14 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.73973.1705309446223538970
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 01:04:06 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="133801630"
X-IronPort-AV: E=Sophos;i="6.04,196,1695654000"; 
   d="scan'208";a="133801630"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2024 18:04:03 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id E7C96CD6C5
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 18:04:01 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2D0F7D5078
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 18:04:01 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id BAF12202CCD23
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 18:04:00 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 53C7F1A0070;
	Mon, 15 Jan 2024 17:04:00 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libxmlb: upgrade 0.3.14 -> 0.3.15
Date: Mon, 15 Jan 2024 17:03:29 +0800
Message-Id: <1705309409-24068-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28120.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28120.006
X-TMASE-Result: 10--4.466800-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrb0NcOFSwefJs1Ir4NZzFmkWY
	FvwCgnnK/fnxtKMJWe8Nyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG2RbN
	5XR1zwhzrjPebt7kkbHk48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w7AqN
	+0JZHXd+XRNNvUVh6MFMNxbnks4hR2pPn7N1auKDNuPWAOvGVmDQiKfsvAoQDhdsNUxW7tH9RKX
	3hpYdgzqPnsTscLntaCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 09:04:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193645

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Sprinkle __attribute__((nonnull)) to give a little more compile-time safety
- Accept text/xml as an alternative to application/xml
- Do not inline shared code
- Fix compiling with Visual Studio
- Fix the exported api test on Windows
- Generate and use .def file for clang-cl builds
- Release source file handles early

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libxmlb/{libxmlb_0.3.14.bb => libxmlb_0.3.15.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libxmlb/{libxmlb_0.3.14.bb => libxmlb_0.3.15.bb} (93%)

diff --git a/meta/recipes-gnome/libxmlb/libxmlb_0.3.14.bb b/meta/recipes-gnome/libxmlb/libxmlb_0.3.15.bb
similarity index 93%
rename from meta/recipes-gnome/libxmlb/libxmlb_0.3.14.bb
rename to meta/recipes-gnome/libxmlb/libxmlb_0.3.15.bb
index 1d3b0de29a..528e3e0bab 100644
--- a/meta/recipes-gnome/libxmlb/libxmlb_0.3.14.bb
+++ b/meta/recipes-gnome/libxmlb/libxmlb_0.3.15.bb
@@ -8,7 +8,7 @@ SRC_URI = " \
 	file://0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch \
 	file://run-ptest \
 "
-SRCREV = "aa577b276adc66564f5777f9a522ca3bf0bfa65e"
+SRCREV = "25a6384ad60f7e8550292e6cb4f262cc5da74be4"
 S = "${WORKDIR}/git"
 
 DEPENDS = "glib-2.0 xz zstd"
-- 
2.34.1


