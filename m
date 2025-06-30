Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60028C8303C
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 09:13:38 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.35177.1751274810576654104
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jun 2025 02:13:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=gGRIwlnJ;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751274812; x=1782810812;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3OV9aitpboTyrYJkJWjjZEqZ18GS0JGT1uqnIqSlMLE=;
  b=gGRIwlnJmCIqlH4VUfEPSuAwdmtsDTySdeteIUUi+zGO8TClm5UuhTfh
   SXVCg95kNRZyoHTZHAmJ2HZJwnQsg8t3vODSV/+BJfxA51IGZEQYbkrn+
   KuMHRUOnffpq4Sb2WO2Ef4gOiRQEDKcy7H8njerUTruEU2siz54qojfkd
   PuIIcgstAc9Ybmo4Ez3p7tdCsaWR8xWUC6X8ps/NznBQhQ1eHuQ/hwHP4
   GTqDV6POLx4sENe7eotWbMNbY4UtFTrdM5cgxneQd/NxQyYeS5DRtnj07
   6uMoPrGx9Mt5heBG/cq13u8NOlfGRSpem7MS9zr4cpPzBLEdZ4eDKQI3h
   w==;
X-CSE-ConnectionGUID: La/bifEhS1GSczha+jpwpw==
X-CSE-MsgGUID: K1wexdbNRcSdy+EhmMC0iQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="203801336"
X-IronPort-AV: E=Sophos;i="6.16,277,1744038000"; 
   d="scan'208";a="203801336"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([20.61.8.234])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 18:13:31 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 8ECA3100034B
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:31 +0000 (UTC)
Received: from oym-m1.gw.nic.fujitsu.com (oym-m1.gw.nic.fujitsu.com [10.85.9.161])
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTP id 10EBD1000116
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:31 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 77F6AD88DA
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 18:13:29 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id F2EBA1A000B;
	Mon, 30 Jun 2025 17:13:28 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 25/37] pango: upgrade 1.56.3 -> 1.56.4
Date: Mon, 30 Jun 2025 17:13:03 +0800
Message-ID: <20250630091315.1897-25-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250630091315.1897-1-wangmy@fujitsu.com>
References: <20250630091315.1897-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219483

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- fontconfig: Improve the add_font_file implementation
- fontconfig: Combine font features and style variants
- fontconfig: Make sure font faces stay alive
- win32: Drop some caching
- win32: Make sure font faces stay alive
- win32: Modernize and simplify the code
- win32: Stop synthesizing fonts
- win32: Implement list models
- coretext: Support synthetic small caps
- layout: Avoid assertions in line breaking
- build: Require GLib 2.82

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-graphics/pango/{pango_1.56.3.bb => pango_1.56.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/pango/{pango_1.56.3.bb => pango_1.56.4.bb} (94%)

diff --git a/meta/recipes-graphics/pango/pango_1.56.3.bb b/meta/recipes-graphics/pango/pango_1.56.4.bb
similarity index 94%
rename from meta/recipes-graphics/pango/pango_1.56.3.bb
rename to meta/recipes-graphics/pango/pango_1.56.4.bb
index 479327dfde..5de51508fe 100644
--- a/meta/recipes-graphics/pango/pango_1.56.3.bb
+++ b/meta/recipes-graphics/pango/pango_1.56.4.bb
@@ -18,7 +18,7 @@ UPSTREAM_CHECK_REGEX = "pango-(?P<pver>\d+\.(?!9\d+)\d+\.\d+)"
 GIR_MESON_ENABLE_FLAG = "enabled"
 GIR_MESON_DISABLE_FLAG = "disabled"
 
-SRC_URI[archive.sha256sum] = "2606252bc25cd8d24e1b7f7e92c3a272b37acd6734347b73b47a482834ba2491"
+SRC_URI[archive.sha256sum] = "17065e2fcc5f5a5bdbffc884c956bfc7c451a96e8c4fb2f8ad837c6413cb5a01"
 
 DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz fribidi"
 DEPENDS += "${@' python3-docutils-native' if d.getVar('GIDOCGEN_ENABLED') == 'True' else ''}"
-- 
2.43.0


