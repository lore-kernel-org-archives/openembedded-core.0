Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A02B4D5A6C5
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 01:30:28 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.35683.1732584618723242908
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 17:30:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=OnpRCU42;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1732584619; x=1764120619;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Ud5Iu00dFM5/mbOpxChY25r1wyz59ZGd9yXzWmzywcs=;
  b=OnpRCU42p6BGX3LR1d1muPVizjaZq6zlD3FMFzfUlEXicOMvQoMTM74k
   UJ/5KDPiAAfjz8Pslu9c8BvP0X9ugoMJrIcyGvDiDgt2n0B1aoe525HQi
   Gd6aAoipNeb8gDMhHEX6UiSRnixTuX3CNB4aCxDgeyeuc5QIJqZZJLpHq
   3z3vvC1gjJpjfeXKeoKO8G0OM94Xc7DvSQxNWanJ9PqR+lzsWyBC8bNbT
   2iZaRfc9T9Mf7QsWopCWcjMS3sGlP2JlDN4oTkY3n9kmqCF7S6Ly1CG6d
   pNqBq97oWKukksymn/JO5fKnX3WWi9c1XdrXg2xuk9WBF33f72L37LVaw
   g==;
X-CSE-ConnectionGUID: Qz9K+rYARRiKPXvB98yIXQ==
X-CSE-MsgGUID: eMrNrsU7TtC7A8w8+bCalg==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="168976129"
X-IronPort-AV: E=Sophos;i="6.12,184,1728918000"; 
   d="scan'208";a="168976129"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 10:30:16 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 5A308B4118
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 10:30:14 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id E0D45D17C5
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 10:30:13 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7F1A62007B73D
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 10:30:13 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2B70C1A006C;
	Tue, 26 Nov 2024 09:30:13 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 03/16] libadwaita: upgrade 1.6.1 -> 1.6.2
Date: Tue, 26 Nov 2024 09:29:49 +0800
Message-Id: <1732584602-4785-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1732584602-4785-1-git-send-email-wangmy@fujitsu.com>
References: <1732584602-4785-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28820.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28820.003
X-TMASE-Result: 10--1.611400-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyv+Aw16GgqpO8d4
	2TTaKPtT2kxqyz95wrq2xeQ5BdLfO5/51VneE1l3sDpn40N9M3lUENBIMyKD0QfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzv+affHI8kAmiNmDV1CgtRtZIcJTn2HkqsekphWnlDPb3rsOYTuNrXJujxY
	yRBa/qJXcsDK2xBHh7jaPj0W1qn0TGVuWouVipcmry8MHydpeS8FYXk6rrQGPNMWiIdMdKbeihU
	Z+PvpjhFjF/gdd3Dnljua8rBHebyuv1CytwAH4h/eigM5Q04rIz3+0tl6j7uf6/2/nZkihaOgB/
	fz3EXdcVKT0eFRmfDs4YhafCzgujIdY9jOi4lTI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 01:30:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207810

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- AdwDialog
  - Fix accessible role critical when using window-backed dialogs
- AdwHeaderBar
  - Fix a typo in docs
- AdwMessageDialog
  - Fix a typo in adw_message_dialog_response() deprecation message
- AdwStyleManager
  - Fix initial color scheme value on Windows
- Translation updates
  - Dutch
  - Serbian

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libadwaita/{libadwaita_1.6.1.bb => libadwaita_1.6.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libadwaita/{libadwaita_1.6.1.bb => libadwaita_1.6.2.bb} (88%)

diff --git a/meta/recipes-gnome/libadwaita/libadwaita_1.6.1.bb b/meta/recipes-gnome/libadwaita/libadwaita_1.6.2.bb
similarity index 88%
rename from meta/recipes-gnome/libadwaita/libadwaita_1.6.1.bb
rename to meta/recipes-gnome/libadwaita/libadwaita_1.6.2.bb
index a32153c128..8cb32814cb 100644
--- a/meta/recipes-gnome/libadwaita/libadwaita_1.6.1.bb
+++ b/meta/recipes-gnome/libadwaita/libadwaita_1.6.2.bb
@@ -10,7 +10,7 @@ DEPENDS = " \
 
 inherit gnomebase gobject-introspection gi-docgen vala features_check
 
-SRC_URI[archive.sha256sum] = "d00ac845a4545d92e6805e31095a51c68f9f4e02426900472084b0cddce3f833"
+SRC_URI[archive.sha256sum] = "7542f8354e6808dd4e9a31551bbdfc0170735e4af4d1b3e69186500ccb9c01eb"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES = "opengl"
-- 
2.34.1


