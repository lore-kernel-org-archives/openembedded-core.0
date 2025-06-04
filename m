Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDDD2C71135
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 08:45:49 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.11724.1749026743023722759
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 01:45:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=enyBftem;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749026744; x=1780562744;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=T6mJ0eGUcLyFvpt1K2FKHAFGGHYY4fbkitF/rK3izZ4=;
  b=enyBftemrgm9cpHAd/cSkr1kDw/ih4cS+w8Ouxfo+h0PU/7V8Gw017wK
   Snrkedkz89272CK2eoTtsKOdgzDEESDzU6y2Sx3MU6syMV9cpUFeZGsvf
   42xnl6Tu4Tuw8g6ro3cg3qemKDuzkUQzSWIdFJ4FCUBP9ucx4YG2t3qp4
   O5dk4f0tb4SfdHoo9U7PVOTiX7Tmz81FmhUMIFylRHvL3eMvqyprSkfaS
   PHA2W+jWzC5iLoALEmHPjFeVRHkqbdANm8kTKD5xhZkZMAxPdW5T5FnH9
   zt3C4+EKwSbBoD7Z+dSdotkI4NoyON7B0MNsu+cHPJKqG10UDrT0W7CSf
   w==;
X-CSE-ConnectionGUID: n5xlMCEoRT28SS+O/ooGGQ==
X-CSE-MsgGUID: TxHJbEYVRSeBxUnIMyUlJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="201662309"
X-IronPort-AV: E=Sophos;i="6.16,208,1744038000"; 
   d="scan'208";a="201662309"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 17:45:41 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 19AF8C68FB
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:36 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id CDAE4C8BF5
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:35 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4B5D21A009A;
	Wed,  4 Jun 2025 16:45:35 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 21/45] libadwaita: upgrade 1.7.2 -> 1.7.4
Date: Wed,  4 Jun 2025 16:44:59 +0800
Message-ID: <20250604084524.864-21-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250604084524.864-1-wangmy@fujitsu.com>
References: <20250604084524.864-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 08:45:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217875

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libadwaita/{libadwaita_1.7.2.bb => libadwaita_1.7.4.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libadwaita/{libadwaita_1.7.2.bb => libadwaita_1.7.4.bb} (88%)

diff --git a/meta/recipes-gnome/libadwaita/libadwaita_1.7.2.bb b/meta/recipes-gnome/libadwaita/libadwaita_1.7.4.bb
similarity index 88%
rename from meta/recipes-gnome/libadwaita/libadwaita_1.7.2.bb
rename to meta/recipes-gnome/libadwaita/libadwaita_1.7.4.bb
index 4dc583ab39..e2bfb0984e 100644
--- a/meta/recipes-gnome/libadwaita/libadwaita_1.7.2.bb
+++ b/meta/recipes-gnome/libadwaita/libadwaita_1.7.4.bb
@@ -11,7 +11,7 @@ DEPENDS = " \
 
 inherit gnomebase gobject-introspection gi-docgen vala features_check
 
-SRC_URI[archive.sha256sum] = "28ee2ff589c6debe47af9da7a56e37c97d6849e003918a4b223f690d25f960be"
+SRC_URI[archive.sha256sum] = "a012bef97ac0d726b969b18099f75fc5eee9e92c012af9672b827350d53ae970"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES = "opengl"
-- 
2.43.0


