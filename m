Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B7AEC41535
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 09:28:58 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.8612.1702978131504150568
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Dec 2023 01:28:52 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="123325990"
X-IronPort-AV: E=Sophos;i="6.04,287,1695654000"; 
   d="scan'208";a="123325990"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 18:27:58 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id DE0FAD64AD
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 18:27:55 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id DCB16BF3C8
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 18:27:54 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 726B0202C2A05
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 18:27:54 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2EFBD1A006F;
	Tue, 19 Dec 2023 17:27:54 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] kbd: upgrade 2.6.3 -> 2.6.4
Date: Tue, 19 Dec 2023 17:27:49 +0800
Message-Id: <1702978069-7420-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28066.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28066.006
X-TMASE-Result: 10-4.077200-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqzIFck3f6fvyAzy
	kugU40wiKaYrswcBhT7GKIf6hBf7VQE4dbnyjMJaTuctSpiuWyUUi4Ehat05499RlPzeVuQQ7u6
	4os8CzyHwCBNO5BSkruhAZQXEXXZu5UcZtwNsCroURSScn+QSXpjDMT0TyDk5+gtHj7OwNO25V9
	z3vqk3KvM3x1giRik80WXVz705pbIfiGFCgAGteTTOg18P8eVSgFq0h2ajaOX9Sv9xdcsY7RjLi
	TnkS+Bl7N0pA3wW8Y+lZI24qYW67fIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 09:28:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192695

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Use AX_ADD_FORTIFY_SOURCE to avoid redefining _FORTIFY_SOURCE
-Do not look up include files in the current working directory

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-core/kbd/{kbd_2.6.3.bb => kbd_2.6.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/kbd/{kbd_2.6.3.bb => kbd_2.6.4.bb} (94%)

diff --git a/meta/recipes-core/kbd/kbd_2.6.3.bb b/meta/recipes-core/kbd/kbd_2.6.4.bb
similarity index 94%
rename from meta/recipes-core/kbd/kbd_2.6.3.bb
rename to meta/recipes-core/kbd/kbd_2.6.4.bb
index 5287781ac1..790055aa96 100644
--- a/meta/recipes-core/kbd/kbd_2.6.3.bb
+++ b/meta/recipes-core/kbd/kbd_2.6.4.bb
@@ -16,7 +16,7 @@ RCONFLICTS:${PN} = "console-tools"
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/${BP}.tar.xz \
            "
 
-SRC_URI[sha256sum] = "04996c08d7d1c460966fb244a3d3883352c2674b7ad522003d9f4ecb8ab48deb"
+SRC_URI[sha256sum] = "519f8d087aecca7e0a33cd084bef92c066eb19731666653dcc70c9d71aa40926"
 
 EXTRA_OECONF = "--disable-tests"
 PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} \
-- 
2.34.1


