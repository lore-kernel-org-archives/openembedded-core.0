Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB7F1C677C4
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 08:45:49 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.11726.1749026744437654212
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 01:45:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=XdJ1lZgl;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749026744; x=1780562744;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Stj9Cn1QlVhSZGHJR6PzoGsGbfkTd+ia79Lwd9lc1Vk=;
  b=XdJ1lZglQRhtqMntGHEtjg9PS55DeneUBk+DsFKsL73b0NIzpGDPvCfN
   qBclJ6ytiTdY8OEOLI+fsVtMzULjKgxL3G4h7ksW34WFFpXz6lbGCCYy0
   VnvwtGvp//Z5TgYEqhav5UkEqSTi0H4s1LgZCFzOLkMShKto4sGmKbvVO
   +b3IZa4Zh7jtP+iXmWkxrsWZ5kFKT2kUhzGzO8aUGCblrmeKAF/VizVgW
   UqFWiLXBUn6qo0JU6RhkBXybPDRJP13DnQ6caESDMOv3+TIZjbQSUde5K
   flPkYTIX7EkzjTDwm/oJiPkCx+WjefoZHOwCagWyAx8nkpRChezlUI0HX
   Q==;
X-CSE-ConnectionGUID: faI2/E3vRl2PY+5YwXl0tQ==
X-CSE-MsgGUID: fRMBpvg9Rz+q5fWOd9xqbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="190102937"
X-IronPort-AV: E=Sophos;i="6.16,208,1744038000"; 
   d="scan'208";a="190102937"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 17:45:42 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2DBE2E4960
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:40 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id DD3ACD4C15
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:39 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5A8971A0078;
	Wed,  4 Jun 2025 16:45:39 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 32/45] ofono: upgrade 2.16 -> 2.17
Date: Wed,  4 Jun 2025 16:45:10 +0800
Message-ID: <20250604084524.864-32-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250604084524.864-1-wangmy@fujitsu.com>
References: <20250604084524.864-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 08:45:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217881

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-connectivity/ofono/{ofono_2.16.bb => ofono_2.17.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/ofono/{ofono_2.16.bb => ofono_2.17.bb} (95%)

diff --git a/meta/recipes-connectivity/ofono/ofono_2.16.bb b/meta/recipes-connectivity/ofono/ofono_2.17.bb
similarity index 95%
rename from meta/recipes-connectivity/ofono/ofono_2.16.bb
rename to meta/recipes-connectivity/ofono/ofono_2.17.bb
index ea3120974c..36bbe9439a 100644
--- a/meta/recipes-connectivity/ofono/ofono_2.16.bb
+++ b/meta/recipes-connectivity/ofono/ofono_2.17.bb
@@ -10,7 +10,7 @@ DEPENDS = "dbus glib-2.0 udev mobile-broadband-provider-info ell"
 SRC_URI = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
            file://ofono \
            "
-SRC_URI[sha256sum] = "6fa2e168e74e1d1879008806537eff2f0b3c86eb5412fbc093f4236e2a15c9ef"
+SRC_URI[sha256sum] = "70bb50997d3a7657edf133355677f8e04b2158bcb031118a67b296107f6ea73e"
 
 inherit autotools pkgconfig update-rc.d systemd gobject-introspection-data
 
-- 
2.43.0


