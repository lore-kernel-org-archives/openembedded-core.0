Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BC22CCFA0D
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:47:51 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3004.1762386462904147314
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:47:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=feFcWBrP;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1762386463; x=1793922463;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=W5p5bKtDg6xrAs37EJn3eQ2vTnupOl/Sr1PYyUSbjRk=;
  b=feFcWBrPOuOYvfyMl07Q876jdHNPChruP497I3SLd6a8bq6Y0kGgSewI
   HD4eSNFj7kIY32TbBVw64i9Gd5RFvETynaKgVuzQ3KClqQyzp3uL1Cxca
   oz49QX2iVNGVNNoPQyvSKRwJaGgTLduy0l4hwEtDMObdllBC97faoLClZ
   w7as459diEi+cvcCzsnP8o9MFa+cEJcVfF/039SlBYdBzfyJZOhZAcrF9
   fE55hHmegzvhXdgaQ1hbcWCwft5j7NB1RSI1/GUBRklEtYoSPv1g3+ZhA
   e2PQcnXL4OL2t/FFmjQtGSz9arvtsl5H2Zc1VMh5ZXFL2QCYvDImdcMAk
   Q==;
X-CSE-ConnectionGUID: 6ASyghN3TFqEhJWOnakhWw==
X-CSE-MsgGUID: ejWILqnpQOqRrdfE+Sra8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="197067457"
X-IronPort-AV: E=Sophos;i="6.19,283,1754924400"; 
   d="scan'208";a="197067457"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.128])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 08:47:41 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 526DD1C03389
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Nov 2025 23:47:41 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 0E5DAC011BE
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Nov 2025 23:47:41 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id A13E01400AC0;
	Wed,  5 Nov 2025 23:47:38 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 13/29] gsettings-desktop-schemas: upgrade 48.0 -> 49.1
Date: Thu,  6 Nov 2025 07:46:56 +0800
Message-ID: <20251105234712.446-13-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251105234712.446-1-wangmy@fujitsu.com>
References: <20251105234712.446-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:47:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225943

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Fix build with meson >1.9.0
- Support keypad page up/down keys in relevant keycombos
- Increase document font size to 12pt
- Use xdg-terminal-exec as default terminal launcher
- Switch to JXL for background image
- Add option to configure restart/shutdown options being available in the
  lockscreen
- Translation updates

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...esktop-schemas_48.0.bb => gsettings-desktop-schemas_49.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gsettings-desktop-schemas/{gsettings-desktop-schemas_48.0.bb => gsettings-desktop-schemas_49.1.bb} (84%)

diff --git a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_48.0.bb b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_49.1.bb
similarity index 84%
rename from meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_48.0.bb
rename to meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_49.1.bb
index 30ab992db4..6705c967ca 100644
--- a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_48.0.bb
+++ b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_49.1.bb
@@ -11,4 +11,4 @@ DEPENDS = "glib-2.0"
 
 inherit gnomebase gsettings gobject-introspection gettext
 
-SRC_URI[archive.sha256sum] = "e68f155813bf18f865a8b2c8e9d473588b6ccadcafbb666ab788857c6c2d1bd3"
+SRC_URI[archive.sha256sum] = "777a7f83d5e5a8076b9bf809cb24101b1b1ba9c230235e3c3de8e13968ed0e63"
-- 
2.43.0


