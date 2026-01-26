Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C531ECF65FB
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 12:35:56 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18471.1769430950055996512
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jan 2026 04:35:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=b74yrg7z;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769430951; x=1800966951;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5uNf9G+9sFpQ96JhbjYdL2pCI8FxBF9m3mCtkADIqg4=;
  b=b74yrg7zrQ7s5ONlca9LAVp99jPs+KyjOqyEG88WmGtRcZUzM1Z3bM9z
   ynRTDl+1x5CspYmvsnOHXJXspCtWw9N9Gu4we/TbV6p9ycr+uNXI8AsWx
   WFwOLmrlG/esEBU+3FHrhMldpToz/yU8VVqQdTt//SDZIbd06IFyLAii6
   TQ+9w3WxAhlg502CBTe7YpBzK8cqD4iIwQeNRzxmC/hZwWWfWfBM/J6Lu
   SbPtuqEP1v9GkjvRbJOwFirFOjnktxteW2syhb1zNq5+NtwahU/XU2vGD
   RU8ka7L96ZgVcV0p7MfQMSfUz7FAovB5SbAeX++jJUTsQ8QVgenY/TGtO
   A==;
X-CSE-ConnectionGUID: jX9+1UmFSc6YbP0tsGfv0A==
X-CSE-MsgGUID: JHkgMqeHRse9/Lp40SMcJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="227076645"
X-IronPort-AV: E=Sophos;i="6.21,255,1763391600"; 
   d="scan'208";a="227076645"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.19])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 21:35:49 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 2B06E8214E5
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 12:35:48 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id D0E39C00418
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 12:35:47 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 62C0A405ABD;
	Mon, 26 Jan 2026 12:35:45 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 07/17] python3-meson-python: upgrade 0.18.0 -> 0.19.0
Date: Mon, 26 Jan 2026 20:35:06 +0800
Message-ID: <20260126123517.1020-7-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260126123517.1020-1-wangmy@fujitsu.com>
References: <20260126123517.1020-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 12:35:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229990

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-meson-python_0.18.0.bb => python3-meson-python_0.19.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-meson-python_0.18.0.bb => python3-meson-python_0.19.0.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-meson-python_0.18.0.bb b/meta/recipes-devtools/python/python3-meson-python_0.19.0.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-meson-python_0.18.0.bb
rename to meta/recipes-devtools/python/python3-meson-python_0.19.0.bb
index 742a2580a7..66e636ef82 100644
--- a/meta/recipes-devtools/python/python3-meson-python_0.18.0.bb
+++ b/meta/recipes-devtools/python/python3-meson-python_0.19.0.bb
@@ -14,7 +14,7 @@ PYPI_PACKAGE = "meson_python"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_mesonpy
-SRC_URI[sha256sum] = "c56a99ec9df669a40662fe46960321af6e4b14106c14db228709c1628e23848d"
+SRC_URI[sha256sum] = "9959d198aa69b57fcfd354a34518c6f795b781a73ed0656f4d01660160cc2553"
 
 DEPENDS:remove:class-native = "python3-meson-python-native"
 
-- 
2.43.0


