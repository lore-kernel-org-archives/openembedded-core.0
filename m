Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEB76CD98D0
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 09:50:12 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16354.1781085008386379877
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 02:50:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=GAdTi5IH;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1781085008; x=1812621008;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EOLRsi0HVpJ0Th509kv99TgUg4jW/xNJoINwVk5dQco=;
  b=GAdTi5IHuv0W4vye5fXcPdruXIFF4URuhce0TahLlurHsaspkriT+OGg
   lT3+Sasv1/jhb5qjz4TH8+yEbw8jQKVHwPl5eMCcdAd770SJ7nE353yR6
   NqrsBfNN8exZHlx9XON+S6A/L0L7SIsZbVLZm3XT64qDDPazxU4CLskmX
   cSEKplBN2WjisXG5J2svQKkMWS/0G+LAqplQzBXdN9uB1tfSZO4+INL9g
   RDykRo5lIMiCYvOJmOBY5D697C7+sCiPVVxZusPHduvx31to5nlTOLom5
   Nw18uJidqufHHf6ZahjwusaqBndbcauXdapjYZ9Ptr+0Lt9i/C4HYVTv8
   w==;
X-CSE-ConnectionGUID: TDIFFjbLRFa4OI5ltDuNCQ==
X-CSE-MsgGUID: sHqVozPWRRCtHsBdJDfnBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="222556062"
X-IronPort-AV: E=Sophos;i="6.24,197,1774278000"; 
   d="scan'208";a="222556062"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 18:50:06 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id DAA8F1000343
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 09:50:06 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (unknown [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 89D1E1809AE9
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 09:50:06 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 940F41400277;
	Wed, 10 Jun 2026 09:50:04 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 12/16] harfbuzz: upgrade 14.2.0 -> 14.2.1
Date: Wed, 10 Jun 2026 17:49:27 +0800
Message-ID: <20260610094932.2264-12-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260610094932.2264-1-wangmy@fujitsu.com>
References: <20260610094932.2264-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 09:50:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238337

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../harfbuzz/{harfbuzz_14.2.0.bb => harfbuzz_14.2.1.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_14.2.0.bb => harfbuzz_14.2.1.bb} (96%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_14.2.0.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_14.2.1.bb
similarity index 96%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_14.2.0.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_14.2.1.bb
index c130819f31..6b6c6a0f60 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_14.2.0.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_14.2.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b98429b8e8e3c2a67cfef01e99e4893d \
                     "
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "94017020f96d025bb66ae91574e4cf334bcad23e8175a8a40565b3721bc2eaff"
+SRC_URI[sha256sum] = "a54a5d8e9380a41fbb762ce367bcbf7704792dfca0d93f1bbca86c5a57902e0e"
 
 inherit meson pkgconfig lib_package gtk-doc gobject-introspection github-releases
 
-- 
2.43.0


