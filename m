Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E1C6107761E
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 10:14:55 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7737.1773915292529980072
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 03:14:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pSBn1rgf;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773915292; x=1805451292;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XaAkYT3xCRr39DxTLObga0EEwf4W+sfXvEnIjjn7xds=;
  b=pSBn1rgfobwqGfW93eHyhq4vEkS6E1UpybAHm6WyQqXvD6Gd20imLdP+
   3eXAeCavovGIhSkxlqNeb4KRL62XbZ52Yd/afMJuid6TQ0MGlj4YZSGc4
   KyXVP/E/+EgrVloQ0gcS/f1R+2pQYlNHu+Xp7BHzK/ndX07xq752g4dby
   vSHJ0zHX99nBV4xy4/8i4SaGMkMvi7TcvyH5S499uW7PmjWtuEa6CVjlP
   h5i8Bf1O0kyntylJVMPQuE6NWB+Y42YnE3tSS/43XseIBesJ48L0s6Zmc
   c+2twxUv/xv3nMCreX//DAtKoXKVmi9icpVTlXauPVa0uzMjp2WpF1Si4
   Q==;
X-CSE-ConnectionGUID: 3gx1QE5nQv+uFurD1wu6pw==
X-CSE-MsgGUID: eUdKua9vS8mJkDK0AQckjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="221352177"
X-IronPort-AV: E=Sophos;i="6.23,129,1770562800"; 
   d="scan'208";a="221352177"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 19:14:51 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 12E6EC020CB
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:14:51 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id BBE53C00755
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:14:50 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id B67DA101E523;
	Thu, 19 Mar 2026 10:14:47 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 16/40] libpciaccess: upgrade 0.18.1 -> 0.19
Date: Thu, 19 Mar 2026 18:13:08 +0800
Message-ID: <20260319101332.2067-16-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260319101332.2067-1-wangmy@fujitsu.com>
References: <20260319101332.2067-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:14:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233483

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-lib/{libpciaccess_0.18.1.bb => libpciaccess_0.19.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libpciaccess_0.18.1.bb => libpciaccess_0.19.bb} (87%)

diff --git a/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb b/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb
similarity index 87%
rename from meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb
rename to meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb
index 7bcf51d56f..428dffad81 100644
--- a/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=54c978968e565218eea36cf03ef24352"
 DEPENDS = "util-macros"
 
 SRC_URI = "${XORG_MIRROR}/individual/lib/${BP}.tar.xz"
-SRC_URI[sha256sum] = "4af43444b38adb5545d0ed1c2ce46d9608cc47b31c2387fc5181656765a6fa76"
+SRC_URI[sha256sum] = "3c55aa86c82e54a4e3109786f0463530d53b36b6d1cfd14616454f985dd2aa43"
 
 inherit pkgconfig meson
 
-- 
2.43.0


