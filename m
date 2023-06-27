Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 475D4EB64DD
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 07:19:35 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.7570.1687850365691477773
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 00:19:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="101720441"
X-IronPort-AV: E=Sophos;i="6.01,161,1684767600"; 
   d="scan'208";a="101720441"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 16:19:24 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 74696D29F0
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 16:19:21 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id A8181D5C46
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 16:19:20 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 253916C833;
	Tue, 27 Jun 2023 16:19:20 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] kbd: upgrade 2.5.1 -> 2.6.0
Date: Tue, 27 Jun 2023 15:17:00 +0800
Message-Id: <1687850250-20040-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1687850250-20040-1-git-send-email-wangmy@fujitsu.com>
References: <1687850250-20040-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27716.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27716.005
X-TMASE-Result: 10-4.520600-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yfx0ykrbAxjCchr4pBLGIvAH8UzOewTxw78F
	Hrw7frluf146W0iUu2uZSVZPP+dKGvr252PTOmm/PKN38CLPK0FV4BnlVId1nZsoi2XrUn/J8m+
	hzBStanvIM9mETCO70ydET58jp62SJbErl8fpkR44g6Kn8Ps8egBu8aw+9WXLeIFCcNUOzDlcRg
	QwiYj+L8/AsDgVtypSQ+nS+8eannHu+IvGKJ6JyvmmTPCNcGd9S7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 07:19:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183444

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-core/kbd/{kbd_2.5.1.bb => kbd_2.6.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/kbd/{kbd_2.5.1.bb => kbd_2.6.0.bb} (94%)

diff --git a/meta/recipes-core/kbd/kbd_2.5.1.bb b/meta/recipes-core/kbd/kbd_2.6.0.bb
similarity index 94%
rename from meta/recipes-core/kbd/kbd_2.5.1.bb
rename to meta/recipes-core/kbd/kbd_2.6.0.bb
index 7662b8f685..9a3e0a7476 100644
--- a/meta/recipes-core/kbd/kbd_2.5.1.bb
+++ b/meta/recipes-core/kbd/kbd_2.6.0.bb
@@ -16,7 +16,7 @@ RCONFLICTS:${PN} = "console-tools"
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/${BP}.tar.xz \
            "
 
-SRC_URI[sha256sum] = "ccdf452387a6380973d2927363e9cbb939fa2068915a6f937ff9d24522024683"
+SRC_URI[sha256sum] = "9c159433db5df8ef31d86b42f5b09d32311bdda2ed35107fb1926243da60b28a"
 
 EXTRA_OECONF = "--disable-tests"
 PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} \
-- 
2.34.1


