Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30985F89223
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 09:56:43 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20451.1776765395379089110
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 02:56:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Oz7YaR7T;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776765395; x=1808301395;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SKEsmfi4z84fctHPOOlSqIS5aAfnMbNXUCK+d86R3i8=;
  b=Oz7YaR7TXcqEMc2Y7ZeKYypvg90sx/HaO2sKKhnpPy1TvaltoiYdg7v8
   f3jcFTG9z/S/WbHN9Zd1vsuu+mZIkUDSrzNmm40vd6rI9rhKxKtc3EjGo
   hqv+ef1PQWo16QLPDHiOybOcMxoGadkhYjAEQ2ItTZ2d5We+MZuWylOCl
   HSCLB+1pNsL9caKBD00CxUj8X+y70/dHdO6p3j27wC2MU2NPlnGSRGHqc
   5HRQ5ha0o4uevlQkS3VzDnFTjkzXYvG8iPyC4tG4qc20jHVs/tD1c+pNQ
   XogUrlzlB5nBPihTBbHQTv78CieCT0mdI1hnB+Eg1R7c+UpuQJeXNxIAb
   w==;
X-CSE-ConnectionGUID: Xyr8QNuKRoWcln8jT1/VRA==
X-CSE-MsgGUID: U4vPZrZJRoWrK0a2HCW4tA==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="242133426"
X-IronPort-AV: E=Sophos;i="6.23,191,1770562800"; 
   d="scan'208";a="242133426"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 18:56:33 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id C8C0836B
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:56:33 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 75E201800D65
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:56:33 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id E436614000E6;
	Tue, 21 Apr 2026 09:56:30 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 15/49] libadwaita: upgrade 1.8.4 -> 1.9.0
Date: Tue, 21 Apr 2026 17:55:25 +0800
Message-ID: <20260421095559.1856-15-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260421095559.1856-1-wangmy@fujitsu.com>
References: <20260421095559.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:56:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235623

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libadwaita/{libadwaita_1.8.4.bb => libadwaita_1.9.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libadwaita/{libadwaita_1.8.4.bb => libadwaita_1.9.0.bb} (89%)

diff --git a/meta/recipes-gnome/libadwaita/libadwaita_1.8.4.bb b/meta/recipes-gnome/libadwaita/libadwaita_1.9.0.bb
similarity index 89%
rename from meta/recipes-gnome/libadwaita/libadwaita_1.8.4.bb
rename to meta/recipes-gnome/libadwaita/libadwaita_1.9.0.bb
index 39423244d9..6236d075fe 100644
--- a/meta/recipes-gnome/libadwaita/libadwaita_1.8.4.bb
+++ b/meta/recipes-gnome/libadwaita/libadwaita_1.9.0.bb
@@ -12,7 +12,7 @@ DEPENDS = " \
 
 inherit gnomebase gobject-introspection gi-docgen vala features_check
 
-SRC_URI[archive.sha256sum] = "d02bb77b6f0ff1055002d299898c487cb2d83dbf940d9edf59f6fdf2572a921c"
+SRC_URI[archive.sha256sum] = "817837bf06363db5bbfce66085136eff1436af6625dfabff3ca08b87bfca1b6b"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES = "opengl"
-- 
2.43.0


