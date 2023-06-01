Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76BBAC7EE23
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 09:04:08 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.26247.1685610245060064069
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jun 2023 02:04:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="118987835"
X-IronPort-AV: E=Sophos;i="6.00,209,1681138800"; 
   d="scan'208";a="118987835"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 18:04:06 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id E1567CD7E0
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Jun 2023 18:04:03 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 25A47D5B20
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Jun 2023 18:04:03 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 56AD288857;
	Thu,  1 Jun 2023 18:04:02 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-dbusmock: upgrade 0.28.7 -> 0.29.0
Date: Thu,  1 Jun 2023 17:03:28 +0800
Message-Id: <1685610221-29015-22-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1685610221-29015-1-git-send-email-wangmy@fujitsu.com>
References: <1685610221-29015-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27664.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27664.006
X-TMASE-Result: 10-2.741600-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mr8ej03A8UqeUEwyFdzXVmdb6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74D4qCLIu0mtIB5DOMAR5/aPeVs
	0skyEaS2BkESMI05d4iiOf1NDnCI+5UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO19R4
	Ss0oUmJ1V0hPYGr/wi9CsaHaKJw3f+icLHoPvemclT7JAFeUjvobzdOsFOg9Ejqron4sh+NcdtP
	1qR/AuPwry24DTMWlQMr44wG0pMg/IMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 09:04:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182078

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
    Support loading templates from XDG_DATA_DIRS
    iio-sensors-proxy: Throw proper D-Bus errors instead of Python Exception

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-dbusmock_0.28.7.bb => python3-dbusmock_0.29.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dbusmock_0.28.7.bb => python3-dbusmock_0.29.0.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-dbusmock_0.28.7.bb b/meta/recipes-devtools/python/python3-dbusmock_0.29.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-dbusmock_0.28.7.bb
rename to meta/recipes-devtools/python/python3-dbusmock_0.29.0.bb
index 4ea21a56ea..32a43e00b9 100644
--- a/meta/recipes-devtools/python/python3-dbusmock_0.28.7.bb
+++ b/meta/recipes-devtools/python/python3-dbusmock_0.29.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/python-dbusmock/"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
-SRC_URI[sha256sum] = "0786977750dbcbde6e2553339a2e66d9a8d4453d5c848b945e8fd1badb736ffd"
+SRC_URI[sha256sum] = "3efdb3d800386b65e8854d8ee4538764241382b4e664423ad7d959c9008dd408"
 
 PYPI_PACKAGE = "python-dbusmock"
 
-- 
2.34.1


