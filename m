Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F6CAC83F16
	for <webhook@archiver.kernel.org>; Thu, 31 Aug 2023 02:34:53 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.8492.1693449289427464929
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 19:34:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="109449127"
X-IronPort-AV: E=Sophos;i="6.02,215,1688396400"; 
   d="scan'208";a="109449127"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 11:34:48 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4D2F7E8526
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 11:34:45 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 87DA4D5EB9
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 11:34:44 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id B4ED12FC2743;
	Thu, 31 Aug 2023 11:34:43 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libsecret: upgrade 0.20.5 -> 0.21.0
Date: Thu, 31 Aug 2023 10:34:18 +0800
Message-Id: <1693449258-27896-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27846.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27846.004
X-TMASE-Result: 10-4.251800-10.000000
X-TMASE-MatchedRID: wbL0rUvz+3Cjz0nOeth/yUIIxwDaU5mr7xtPw/8I7HSb44rijF7e9HJ9
	Mbn64cXRTXizGt9BdLQ+j95AJb21u0pOsvsL8hZ0YO2LBxTMwiCSiza26cvwNKvWBS71/UX/RLc
	3tR39k3I0IXF7YXZ/Cw3KvrUy7pE6bRev5+PfDD/y3h9RQZ4StME5XPQnBzGXR/IzlV+CMbZ8AJ
	gOVgJb+pmZQz5PaEsF06rymDlPTLHlRxm3A2wKuhRFJJyf5BJe3QfwsVk0UbvqwGfCk7KUs0UcG
	UM5Nt8c8gvhrRDpA+CmuJknWqnK5JfEq0ZIuqvZinPh7pi+00bwxXnv9n255y82jNmC48w2LmCd
	NVJC+eFBD+fo3+4/XogeppQyntVe0v8srR3gjfRl7+AkHjVJOxuqkzsKv5+9ftwZ3X11IV0=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 02:34:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186940

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
 * Unlock the keyring before getting secret attributes [!105]
 * file-backend: avoid deadlock when portal op is canceled [!118, !120]
 * Properly chain-up GTasks around GDBusProxy::init_async [!106]
 * Fix nullable in secret_collection_for_alias_* [!110]
 * Fix finish function for searchv [!112]
 * secret-paths: Fix a little memory leak [!109]
 * Stop using GSlice [!116]
 * docs: port to gi-docgen [!101]
 * docs: fix example in usage docs [!117]
 * Several CI fixes [!111, !114]
 * Updated translations

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libsecret/{libsecret_0.20.5.bb => libsecret_0.21.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libsecret/{libsecret_0.20.5.bb => libsecret_0.21.0.bb} (91%)

diff --git a/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb b/meta/recipes-gnome/libsecret/libsecret_0.21.0.bb
similarity index 91%
rename from meta/recipes-gnome/libsecret/libsecret_0.20.5.bb
rename to meta/recipes-gnome/libsecret/libsecret_0.21.0.bb
index 9b09c3bee4..8f560f9f39 100644
--- a/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb
+++ b/meta/recipes-gnome/libsecret/libsecret_0.21.0.bb
@@ -14,7 +14,7 @@ inherit gnomebase gi-docgen vala gobject-introspection manpages
 
 DEPENDS += "glib-2.0 libgcrypt gettext-native"
 
-SRC_URI[archive.sha256sum] = "3fb3ce340fcd7db54d87c893e69bfc2b1f6e4d4b279065ffe66dac9f0fd12b4d"
+SRC_URI[archive.sha256sum] = "2735b29d1cc0e5b12ba90bee88bd21774ac8db4ae1a4b716f46c409c19a14613"
 
 GTKDOC_MESON_OPTION = 'gtk_doc'
 
-- 
2.34.1


