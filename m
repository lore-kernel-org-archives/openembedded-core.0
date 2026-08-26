Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FA49C61DC4
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 08:18:49 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7745.1787732325303315244
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 01:18:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=GOAEL5lo;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787732326; x=1819268326;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9bZIt02JFP+8DYqYJyDoAn7uX1Ig3aW+g5tN5NuYotI=;
  b=GOAEL5lo9Y3mr4IWJ1ex/PLfAuBdxXIJZP/JKheJl2fYmgy12sL3Opr/
   etGJ1eik+9LCsipUzX2Bp5XR1sO0+lTb3QZBanBhwXyuTrVv65Ug11SFP
   qq7BTFvX5sxcfyzYuIq7haGFmiIOyNCzDpLgDk331weM/ZBoXE2PFOg3u
   DXlpVZnPyXejwmLZGyif9yQetiJ88QssHtEu3wHyZ/r+5VbwSwb/qshgs
   ZmkMm81K1blx42jZ/Lj/dAy87XF7weS/esX/8ZhmwPsRlxkxQjBBqx14T
   1T/KA3la4gRG/4h/wOLNW9DKRcNg2OaakVihB8xDaVEl8lO8YtAzulc2u
   g==;
X-CSE-ConnectionGUID: Y7fv12RUS0maZ05Gn4zoZg==
X-CSE-MsgGUID: tohJAlZjQCqC4K/SzJgjCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="252690526"
X-IronPort-AV: E=Sophos;i="6.25,244,1779116400"; 
   d="scan'208";a="252690526"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 17:18:45 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 399EE5536
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:18:45 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id E4485100137F
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:18:44 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 06CA98214F5;
	Wed, 26 Aug 2026 08:18:42 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 12/17] pango: upgrade 1.58.0 -> 1.58.2
Date: Wed, 26 Aug 2026 16:18:27 +0800
Message-ID: <20260826081832.1059-5-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260826081832.1059-1-wangmy@fujitsu.com>
References: <20260826081832.1059-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:18:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244352

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-graphics/pango/{pango_1.58.0.bb => pango_1.58.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/pango/{pango_1.58.0.bb => pango_1.58.2.bb} (94%)

diff --git a/meta/recipes-graphics/pango/pango_1.58.0.bb b/meta/recipes-graphics/pango/pango_1.58.2.bb
similarity index 94%
rename from meta/recipes-graphics/pango/pango_1.58.0.bb
rename to meta/recipes-graphics/pango/pango_1.58.2.bb
index 6e1aebad1d..9eafc9636c 100644
--- a/meta/recipes-graphics/pango/pango_1.58.0.bb
+++ b/meta/recipes-graphics/pango/pango_1.58.2.bb
@@ -18,7 +18,7 @@ UPSTREAM_CHECK_REGEX = "pango-(?P<pver>\d+\.(?!9\d+)\d+\.\d+)"
 GIR_MESON_ENABLE_FLAG = "enabled"
 GIR_MESON_DISABLE_FLAG = "disabled"
 
-SRC_URI[archive.sha256sum] = "bc5bad6213ad4886a47d1e80292fd850b64159b50db67917a43d9ea80ee2298a"
+SRC_URI[archive.sha256sum] = "342385b6ca3b7c73455d7c80a13b7dbe4489e00bc3bd4c5bd6ed4dce421e374a"
 
 DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz fribidi"
 DEPENDS += "${@' python3-docutils-native' if d.getVar('GIDOCGEN_ENABLED') == 'True' else ''}"
-- 
2.43.0


