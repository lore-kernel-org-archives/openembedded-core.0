Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 763E9C3DA79
	for <webhook@archiver.kernel.org>; Tue, 16 Jan 2024 02:08:01 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.1935.1705370872772923376
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 18:07:53 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="134611266"
X-IronPort-AV: E=Sophos;i="6.04,197,1695654000"; 
   d="scan'208";a="134611266"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 11:07:49 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id C9DE2E8D33
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 11:07:47 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id EDD499FC08
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 11:07:46 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 80A872007911C
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 11:07:46 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 197DC1A015E;
	Tue, 16 Jan 2024 10:07:46 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Jiang Kai <jiangkai@fujitsu.com>,
	Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] enchant2: upgrade 2.6.4 -> 2.6.5
Date: Tue, 16 Jan 2024 10:06:38 +0800
Message-Id: <1705370800-31004-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1705370800-31004-1-git-send-email-wangmy@fujitsu.com>
References: <1705370800-31004-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28122.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28122.004
X-TMASE-Result: 10--2.812300-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrj0Iuqb6gHRtUjspoiX02F/fY
	RFkXA6TB4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2XXHQq6zBeSUNBd
	ORIzcI4bIA9+0jajqkuKmKbaPnYD+5UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO19R4
	Ss0oUmJ3tMjT5SbcnraKfp9Qz9rwSyh6IG4loOfMm+0VzGR92W8C1Q2x8BFb6CSbeWL/YQq7yOb
	F83/SxSqy8RzejXyiqzJWrJBy0t3fIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 02:08:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193811

From: Jiang Kai <jiangkai@fujitsu.com>

Changelog:
============
-permits error messages from spelling providers not to be valid UTF-8.
-The --with-hunspell-dir configure option is removed (along with all the
 other ---with-PROVIDER-dir options, which did nothing).
-Doxygen API documentation is now included in the release tarball

Signed-off-by: Jiang Kai <jiangkai@fujitsu.com>
Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../enchant/{enchant2_2.6.4.bb => enchant2_2.6.5.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/enchant/{enchant2_2.6.4.bb => enchant2_2.6.5.bb} (91%)

diff --git a/meta/recipes-support/enchant/enchant2_2.6.4.bb b/meta/recipes-support/enchant/enchant2_2.6.5.bb
similarity index 91%
rename from meta/recipes-support/enchant/enchant2_2.6.4.bb
rename to meta/recipes-support/enchant/enchant2_2.6.5.bb
index 431d02ea25..1d5c716bab 100644
--- a/meta/recipes-support/enchant/enchant2_2.6.4.bb
+++ b/meta/recipes-support/enchant/enchant2_2.6.5.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0 groff-native"
 inherit autotools pkgconfig github-releases
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/enchant-${PV}.tar.gz"
-SRC_URI[sha256sum] = "833b4d5600dbe9ac867e543aac6a7a40ad145351495ca41223d4499d3ddbbd2c"
+SRC_URI[sha256sum] = "9e8fd28cb65a7b6da3545878a5c2f52a15f03c04933a5ff48db89fe86845728e"
 
 GITHUB_BASE_URI = "https://github.com/AbiWord/enchant/releases"
 
-- 
2.34.1


