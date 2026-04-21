Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04645F327DB
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 09:56:33 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20392.1776765387499628032
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 02:56:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Z83aBrL1;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776765387; x=1808301387;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SM5kfnBCQ2Yxvpnsp+NPX/2rfWCwK62MiK1PishcZww=;
  b=Z83aBrL1/ITb2lo8RtxbtmB4Xvt6cacFHzD+z8GIfaPQWlSdYVr0/clU
   erh8/EsOUjN2cGt/DWD231xD+XX+zLqr6+4oUYEyXrHItJb+/ZiJEmWwQ
   DxCrC1/qBgc1KcyouaIRO02/w9MhZRt610VJ0coPWRYOxhzT9+tuIEj/w
   76duPHmSKKss5FmNypKdINxdfu8EAXdIS8GDGwxz2x10ZUrqUqojkY13D
   YK4aKSMABlWPjFU0aYJVaimFrWTyWk83Zk7o149JzilkHboSKWzGKzB3T
   Hb3PjstDi12rKcwoBPQP/HashIDDJL5hxnxfAR/v+98HpPQuspjFK4RjI
   g==;
X-CSE-ConnectionGUID: ToG9LAI/QGmBcJ166Y0aow==
X-CSE-MsgGUID: t73bHIRsRRS5OYB4Vusl/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="237135611"
X-IronPort-AV: E=Sophos;i="6.23,191,1770562800"; 
   d="scan'208";a="237135611"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 18:56:26 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id E667D100035D
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:56:25 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 956DA10003B9
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:56:25 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id F0689140025F;
	Tue, 21 Apr 2026 09:56:22 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 11/49] gsettings-desktop-schemas: upgrade 50.0 -> 50.1
Date: Tue, 21 Apr 2026 17:55:21 +0800
Message-ID: <20260421095559.1856-11-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260421095559.1856-1-wangmy@fujitsu.com>
References: <20260421095559.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:56:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235619

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...esktop-schemas_50.0.bb => gsettings-desktop-schemas_50.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gsettings-desktop-schemas/{gsettings-desktop-schemas_50.0.bb => gsettings-desktop-schemas_50.1.bb} (84%)

diff --git a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_50.0.bb b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_50.1.bb
similarity index 84%
rename from meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_50.0.bb
rename to meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_50.1.bb
index 5fda20c6c3..1edb548ad6 100644
--- a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_50.0.bb
+++ b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_50.1.bb
@@ -11,4 +11,4 @@ DEPENDS = "glib-2.0"
 
 inherit gnomebase gsettings gobject-introspection gettext
 
-SRC_URI[archive.sha256sum] = "358f07cb253727650e132805df3c69f7bf90448040bce171b6f6f2cb1b9c37ef"
+SRC_URI[archive.sha256sum] = "0a2aa25082672585d16fcdab61c7b0e33f035fb87476505c794f29565afa485b"
-- 
2.43.0


