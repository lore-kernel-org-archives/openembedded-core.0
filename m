Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4319ECCF9F8
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:47:21 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2980.1762386439864192560
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:47:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=FiqtJF32;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1762386440; x=1793922440;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=NCE6Nb01QBYsWYcmue0lZnWAwIQjSDvO5M2dAmQ21o0=;
  b=FiqtJF329PJfSrwE38fSDu+jbDZZcNlTU69fZEDOFCj4j/nOkmAbMQah
   wfGmGNj1RP8/rBFm8LhWFRBx6XgaKDeNLNSzc/RORWuaCbfrG0XRVsXXG
   HRF0igi/FVqrWfl+eeC87TO1trybWcgcfcRJ+9z2XOFq/l8kaCL0KG45N
   oe6ghxqUJF4++WJ8+C4u1ei40/mQVBWD0wHaCQKDVWpdFP9kPLp55tZiZ
   GXRzbZKZnWT86KJTyEGKsBA6antJtWXnz7CdMDG9fQ/pqsFBisig0v0Xn
   UXyAvcNldxrUeoi3yx6gOzkxJHWJMxZUfFJZdXVBFt4g0Iu7zN0nd4IIJ
   Q==;
X-CSE-ConnectionGUID: ts8ziWW9RHWT+DEIhQptBw==
X-CSE-MsgGUID: 7gwzAL/ITUaOAUocEuO9Pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="221965688"
X-IronPort-AV: E=Sophos;i="6.19,283,1754924400"; 
   d="scan'208";a="221965688"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.19])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 08:47:18 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 159021002BB8
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Nov 2025 23:47:18 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id C27ADC02F00
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Nov 2025 23:47:17 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 5D72D14005BD;
	Wed,  5 Nov 2025 23:47:15 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 01/29] adwaita-icon-theme: upgrade 48.0 -> 49.0
Date: Thu,  6 Nov 2025 07:46:44 +0800
Message-ID: <20251105234712.446-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:47:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225931

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- symbolic: night light
- symbolic: battery rendered as square
- symbolic: plugged variants of battery status
- symbolic: vpn metaphor
- symbolic: gtk rendering optimizations
- cursors: fleur -> all-resize
- cursors: DND cleanup

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{adwaita-icon-theme_48.0.bb => adwaita-icon-theme_49.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gnome/{adwaita-icon-theme_48.0.bb => adwaita-icon-theme_49.0.bb} (91%)

diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme_48.0.bb b/meta/recipes-gnome/gnome/adwaita-icon-theme_49.0.bb
similarity index 91%
rename from meta/recipes-gnome/gnome/adwaita-icon-theme_48.0.bb
rename to meta/recipes-gnome/gnome/adwaita-icon-theme_49.0.bb
index 38b5410086..a12faeb8fd 100644
--- a/meta/recipes-gnome/gnome/adwaita-icon-theme_48.0.bb
+++ b/meta/recipes-gnome/gnome/adwaita-icon-theme_49.0.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c84cac88e46fc07647ea07e6c24eeb7c \
 
 inherit gnomebase allarch gtk-icon-cache
 
-SRC_URI[archive.sha256sum] = "847068888650d9673115be6dbf2bfdc31a46aebc528a6a9db4420e60e656b8d4"
+SRC_URI[archive.sha256sum] = "65166461d1b278aa942f59aa8d0fccf1108d71c65f372c6266e172449791755c"
 
 DEPENDS += "librsvg-native"
 
-- 
2.43.0


