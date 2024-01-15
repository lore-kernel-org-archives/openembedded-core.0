Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0434EC3DA79
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 09:15:25 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.74217.1705310121478364804
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 01:15:21 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="134162430"
X-IronPort-AV: E=Sophos;i="6.04,196,1695654000"; 
   d="scan'208";a="134162430"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2024 18:15:18 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id C99C9D4F5B
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 18:15:16 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 13347D5E93
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 18:15:16 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id A8AAF202CCD24
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 18:15:15 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 509E71A0070;
	Mon, 15 Jan 2024 17:15:15 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] vte: upgrade 0.74.1 -> 0.74.2
Date: Mon, 15 Jan 2024 17:14:34 +0800
Message-Id: <1705310074-24318-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28120.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28120.006
X-TMASE-Result: 10--5.066500-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yfx0ykrbAxjCchr4pBLGIvAH8UzOewTxw78F
	Hrw7frluf146W0iUu2uD0fiPNa0yFqZY4PxfRMWEfOaYwP8dcX7Ij3ZumgJuKOjMOEZ5AL0SFFy
	os4QuK8MxIkWFjNFcbnqUwDIlKjKMrWL/xQJnm46eAiCmPx4NwGmRqNBHmBveafSbrzwSjfwqtq
	5d3cxkNZ1365yRBLNoawaf3M7n5vCT7LFVlM41KAJ86OC15zGY02/9j9IvKnA=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 09:15:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193650

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-support/vte/{vte_0.74.1.bb => vte_0.74.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/vte/{vte_0.74.1.bb => vte_0.74.2.bb} (96%)

diff --git a/meta/recipes-support/vte/vte_0.74.1.bb b/meta/recipes-support/vte/vte_0.74.2.bb
similarity index 96%
rename from meta/recipes-support/vte/vte_0.74.1.bb
rename to meta/recipes-support/vte/vte_0.74.2.bb
index 071f668464..d8eafde2fb 100644
--- a/meta/recipes-support/vte/vte_0.74.1.bb
+++ b/meta/recipes-support/vte/vte_0.74.2.bb
@@ -19,7 +19,7 @@ GIDOCGEN_MESON_OPTION = "docs"
 inherit gnomebase gi-docgen features_check upstream-version-is-even gobject-introspection systemd vala
 
 SRC_URI += "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch"
-SRC_URI[archive.sha256sum] = "2328c3f1c998350a18e0e513348e9fc581d57ea4e7b89aedf11e0e3c65042b4f"
+SRC_URI[archive.sha256sum] = "a535fb2a98fea8a2449cd1a02cccf5190131dddff52e715afdace3feb536eae7"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-- 
2.34.1


