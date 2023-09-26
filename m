Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D864E7D259
	for <webhook@archiver.kernel.org>; Tue, 26 Sep 2023 08:24:10 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.14322.1695716647120623011
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Sep 2023 01:24:07 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="121407296"
X-IronPort-AV: E=Sophos;i="6.03,177,1694703600"; 
   d="scan'208";a="121407296"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 17:24:04 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 80A4DDB3C9
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 17:24:02 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id B8937CFBC2
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 17:24:01 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id D1ECE2FC8156;
	Tue, 26 Sep 2023 17:24:00 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libsecret: upgrade 0.21.0 -> 0.21.1
Date: Tue, 26 Sep 2023 16:23:50 +0800
Message-Id: <1695716630-8555-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27898.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27898.006
X-TMASE-Result: 10--2.671800-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrTfK5j0EZbytCbDVw9++PqcPM
	yuDqjdhr82jJesNrruFVF51vxLbfWe1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQCmL
	ENVLWzfdehQf6tJm39AHPh0m8/rkHrWL/xQJnm46eAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNfb10tGfb82/EcjfNOxFk2KtU1r2TSgEv+LiUJpnJm1CKfahoqWIcdbUANni3p/EixlOU
	/QfAYmdeBNrz0RS4p/89gOIwrseloJXtKB2OUbbU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 08:24:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188227

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
 * Fix updating credentials by another process in the same Flatpak sandbox [#62, !99]
 * Migrate to g_memdup2 [!121]
 * Print error logs in CI [!125]
 * Updated translations

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libsecret/{libsecret_0.21.0.bb => libsecret_0.21.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libsecret/{libsecret_0.21.0.bb => libsecret_0.21.1.bb} (91%)

diff --git a/meta/recipes-gnome/libsecret/libsecret_0.21.0.bb b/meta/recipes-gnome/libsecret/libsecret_0.21.1.bb
similarity index 91%
rename from meta/recipes-gnome/libsecret/libsecret_0.21.0.bb
rename to meta/recipes-gnome/libsecret/libsecret_0.21.1.bb
index 8f560f9f39..63102476cb 100644
--- a/meta/recipes-gnome/libsecret/libsecret_0.21.0.bb
+++ b/meta/recipes-gnome/libsecret/libsecret_0.21.1.bb
@@ -14,7 +14,7 @@ inherit gnomebase gi-docgen vala gobject-introspection manpages
 
 DEPENDS += "glib-2.0 libgcrypt gettext-native"
 
-SRC_URI[archive.sha256sum] = "2735b29d1cc0e5b12ba90bee88bd21774ac8db4ae1a4b716f46c409c19a14613"
+SRC_URI[archive.sha256sum] = "674f51323a5f74e4cb7e3277da68b5afddd333eca25bc9fd2d820a92972f90b1"
 
 GTKDOC_MESON_OPTION = 'gtk_doc'
 
-- 
2.34.1


