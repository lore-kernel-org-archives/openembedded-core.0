Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C368CCDB47E
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 09:00:18 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.34400.1697187609216880342
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Oct 2023 02:00:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="114871370"
X-IronPort-AV: E=Sophos;i="6.03,221,1694703600"; 
   d="scan'208";a="114871370"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 18:00:06 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id BFAB7DDC65
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 18:00:04 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id F1F30BCB63
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 18:00:03 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2E8D120050181;
	Fri, 13 Oct 2023 18:00:03 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libubootenv: upgrade 0.3.4 -> 0.3.5
Date: Fri, 13 Oct 2023 16:59:47 +0800
Message-Id: <1697187587-4243-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27932.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27932.006
X-TMASE-Result: 10-3.537000-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyvlz4G0C4MbOBxq
	dt22rdOg6Y0NhLe2qGVHtatGVcUpDz13WcdbGR6QP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW5tMXimGWsZZAYUFsN5WfiFqqg2TSZUFr1oMLOoNHsM9lXgGeVUh3WdmyiLZetSf8nyb6
	HMFK1qe11j5mhaIsibJ0RPnyOnrZI6EosWzovfvsBvXl0wxowkC6YsuXrprf2UeBgpdzUXhYnbr
	b5OuYOS6HJLvHUbJJEk8pSzcNskITrLZejH6lPN9KYsCPAxifZLv5Eyr/YIrqsDhztRXZ9Cm+LY
	9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 09:00:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189039

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Fix slowness on SPI flash
Fixes validating Env flags
Feature: get U-Boot namespace from DT
Feature: specify UBI volumes from MTD path

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../u-boot/{libubootenv_0.3.4.bb => libubootenv_0.3.5.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-bsp/u-boot/{libubootenv_0.3.4.bb => libubootenv_0.3.5.bb} (93%)

diff --git a/meta/recipes-bsp/u-boot/libubootenv_0.3.4.bb b/meta/recipes-bsp/u-boot/libubootenv_0.3.5.bb
similarity index 93%
rename from meta/recipes-bsp/u-boot/libubootenv_0.3.4.bb
rename to meta/recipes-bsp/u-boot/libubootenv_0.3.5.bb
index ac1e03b8e9..b68bbb430a 100644
--- a/meta/recipes-bsp/u-boot/libubootenv_0.3.4.bb
+++ b/meta/recipes-bsp/u-boot/libubootenv_0.3.5.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSES/LGPL-2.1-or-later.txt;md5=4fbd65380cdd255951
 SECTION = "libs"
 
 SRC_URI = "git://github.com/sbabic/libubootenv;protocol=https;branch=master"
-SRCREV = "4dfb5254fc0540a36e87914bc14644c047ea7678"
+SRCREV = "3f4d15e36ceb58085b08dd13f3f2788e9299877b"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


