Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BE7FC54791
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 07:09:19 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.10791.1710313750140899810
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 00:09:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=V6m91McH;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710313751; x=1741849751;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=e4a1mBCdAr2uJCRs6xAwFL9L8m+pu0jKb0KSvXzE2LM=;
  b=V6m91McHYKttem3IvP/tX1JSkDs119lh51j9l1cZvA6xmbDeMWGyYHVk
   HUJQ2n3GC7o6bA52rmqcIkgGWmqeRPVKbO7zc0JC9+fWBbAKYjgI3MGYW
   69yuxkDsaAs973BFQkfO3UVfwsdccWnIHVAb642J7AjBsmcUvJMJ+dKwC
   c/h1WHxgVhqeolMEpE2BioSverA6hTSkVUiHwhrRIHDsRiJ6cD2196ZyL
   QnlA75+aymBL9v/PDr3g3eoh3VH7ZhwLRUd5rI1e6p5d6lEa2VBNIs+Cx
   Vr+TYp1FIXJUD1wGAjL8yrnGAOgUxX9HeFk0wH0e7TNjY/+XX/UrpdbM2
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="151572681"
X-IronPort-AV: E=Sophos;i="6.07,119,1708354800"; 
   d="scan'208";a="151572681"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 16:09:08 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id C73A4E6003
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:05 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 1278ED6247
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:05 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9EC3C21BD41
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:04 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4B8D31A006B;
	Wed, 13 Mar 2024 15:09:04 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 07/36] libadwaita: upgrade 1.4.3 -> 1.4.4
Date: Wed, 13 Mar 2024 15:08:05 +0800
Message-Id: <1710313714-12541-7-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710313714-12541-1-git-send-email-wangmy@fujitsu.com>
References: <1710313714-12541-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28248.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28248.004
X-TMASE-Result: 10--3.338900-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrTfK5j0EZbysn3IThl21UN7zl
	BfjmzOn3ldhq7sfFh4dKhBUJyxjhBu1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQCmL
	ENVLWzfdYPNn6POdBJcAoifPuvlEWu2PzD0SpTPXdCok3ibXlQX0tCKdnhB58I/9UW5M5dRNp7q
	EhmmPgy46HM5rqDwqtlgeMjwhZhSLTXf8orEX9L3slrq3Lc1wMMpJgFoWlTmqtgZtcyngroJgxh
	2jNS3le3CZ0drGnbM8kYH6+FfoMo5iYu81In5w0HSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 07:09:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197009

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fix layout with GtkSettings:gtk-xft-dpi == 0
- AdwNavigationView
  - Fix signal mentions in push() docs
- AdwStatusPage
  - Fix property notification in set_child()
- AdwToolbarView
  - Fix a typo in docs
- Translation updates
  - British English

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libadwaita/{libadwaita_1.4.3.bb => libadwaita_1.4.4.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libadwaita/{libadwaita_1.4.3.bb => libadwaita_1.4.4.bb} (88%)

diff --git a/meta/recipes-gnome/libadwaita/libadwaita_1.4.3.bb b/meta/recipes-gnome/libadwaita/libadwaita_1.4.4.bb
similarity index 88%
rename from meta/recipes-gnome/libadwaita/libadwaita_1.4.3.bb
rename to meta/recipes-gnome/libadwaita/libadwaita_1.4.4.bb
index e3f849ad6a..e81580feba 100644
--- a/meta/recipes-gnome/libadwaita/libadwaita_1.4.3.bb
+++ b/meta/recipes-gnome/libadwaita/libadwaita_1.4.4.bb
@@ -11,7 +11,7 @@ DEPENDS = " \
 
 inherit gnomebase gobject-introspection gi-docgen vala features_check
 
-SRC_URI[archive.sha256sum] = "ae9622222b0eb18e23675655ad2ba01741db4d8655a796f4cf077b093e2f5841"
+SRC_URI[archive.sha256sum] = "f802b7d8d5ae33be4650ef571a580f144a806202a26f527dacd57d1560938828"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES = "opengl"
-- 
2.34.1


