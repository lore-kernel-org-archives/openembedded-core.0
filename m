Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68EF0E7D258
	for <webhook@archiver.kernel.org>; Tue, 26 Sep 2023 08:23:50 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.14112.1695716625446947367
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Sep 2023 01:23:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="113127855"
X-IronPort-AV: E=Sophos;i="6.03,177,1694703600"; 
   d="scan'208";a="113127855"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 17:23:42 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id C1B57CA1EB
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 17:23:40 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id EE149D5E2E
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 17:23:39 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7A7132005932A;
	Tue, 26 Sep 2023 17:23:39 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] kbd: upgrade 2.6.2 -> 2.6.3
Date: Tue, 26 Sep 2023 16:23:28 +0800
Message-Id: <1695716608-8393-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27898.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27898.006
X-TMASE-Result: 10-4.520600-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yfx0ykrbAxjCchr4pBLGIvAH8UzOewTxw78F
	Hrw7frluf146W0iUu2uZSVZPP+dKGvr252PTOmm/PKN38CLPK0FV4BnlVId1nZsoi2XrUn/J8m+
	hzBStanvIM9mETCO70ydET58jp62SE2RtcA0W08RNoJxKR0ko6vXtKzR9TLd8dtnQhAoVcTVz5T
	T5qaBcV3gqrcVDe2aUbNju4yzmkN1jsiuO7lLSJJC/BBeFhV0IS7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 08:23:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188226

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-core/kbd/{kbd_2.6.2.bb => kbd_2.6.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/kbd/{kbd_2.6.2.bb => kbd_2.6.3.bb} (94%)

diff --git a/meta/recipes-core/kbd/kbd_2.6.2.bb b/meta/recipes-core/kbd/kbd_2.6.3.bb
similarity index 94%
rename from meta/recipes-core/kbd/kbd_2.6.2.bb
rename to meta/recipes-core/kbd/kbd_2.6.3.bb
index abd039f7a9..5287781ac1 100644
--- a/meta/recipes-core/kbd/kbd_2.6.2.bb
+++ b/meta/recipes-core/kbd/kbd_2.6.3.bb
@@ -16,7 +16,7 @@ RCONFLICTS:${PN} = "console-tools"
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/${BP}.tar.xz \
            "
 
-SRC_URI[sha256sum] = "33e3bb3c3f55933b10f053b14b5f69a2e24c28543e9ec7690246fe47628dd94f"
+SRC_URI[sha256sum] = "04996c08d7d1c460966fb244a3d3883352c2674b7ad522003d9f4ecb8ab48deb"
 
 EXTRA_OECONF = "--disable-tests"
 PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} \
-- 
2.34.1


