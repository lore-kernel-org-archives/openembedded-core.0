Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE1EB108E1D3
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 10:19:35 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7927.1773915565485419288
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 03:19:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=gAMCB6f3;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773915568; x=1805451568;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DvtUohF7n/6PCeOyEqEGGg+oXfzhWMWM8gE7TMgNb1c=;
  b=gAMCB6f3Mn2Xra9b1eXxoVs7ynjOEJEMLSS+luTVFjXL032SWVYi6NQl
   ukVYwc5jvc1UtE4xGWSoeLJYR4Uz9KkWG9byDWJmeajeKXOYtKzX8JxzR
   IehZJ5LuM1VcL31sIbWUSTMZTQ8lsIe4Xg1Hs4X0Ikr1Tg9UxqF9EA4ts
   4lIOzUms0dkh+7X+KvkP548CeG5+KzRfZuz4xwTWvPM7HobWWpGMUxLEv
   kiSVrhf476X4Wc9lFoADhr12ZHFIJ5E3e6PSDXHwVxMZOV4yWwLPH1EN1
   8r3MwzrPVjZI26wJc/oEtq0Lp/RX1WRoZ58B2QveuckmdpEV7a6EfZu9F
   w==;
X-CSE-ConnectionGUID: +hcTUHQhTGOHzYrB6MdZag==
X-CSE-MsgGUID: WJpvKr+rRyWDQLinOWfiqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="233898255"
X-IronPort-AV: E=Sophos;i="6.23,129,1770562800"; 
   d="scan'208";a="233898255"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 19:15:24 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 934F61000372
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:15:23 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 41FBCC000A7
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:15:23 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 689BC101E52D;
	Thu, 19 Mar 2026 10:15:20 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 31/40] python3-sphinxcontrib-svg2pdfconverter: upgrade 2.0.0 -> 2.1.0
Date: Thu, 19 Mar 2026 18:13:23 +0800
Message-ID: <20260319101332.2067-31-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260319101332.2067-1-wangmy@fujitsu.com>
References: <20260319101332.2067-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:19:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233503

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...2.0.0.bb => python3-sphinxcontrib-svg2pdfconverter_2.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-sphinxcontrib-svg2pdfconverter_2.0.0.bb => python3-sphinxcontrib-svg2pdfconverter_2.1.0.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-svg2pdfconverter_2.0.0.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-svg2pdfconverter_2.1.0.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-sphinxcontrib-svg2pdfconverter_2.0.0.bb
rename to meta/recipes-devtools/python/python3-sphinxcontrib-svg2pdfconverter_2.1.0.bb
index 82ba8a2dcb..ec5d4c8c9a 100644
--- a/meta/recipes-devtools/python/python3-sphinxcontrib-svg2pdfconverter_2.0.0.bb
+++ b/meta/recipes-devtools/python/python3-sphinxcontrib-svg2pdfconverter_2.1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/missinglinkelectronics/sphinxcontrib-svg2pdfconve
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b11cf936853a71258d4b57bb1849a3f9"
 
-SRC_URI[sha256sum] = "ab9c8f1080391e231812d20abf2657a69ee35574563b1014414f953964a95fa3"
+SRC_URI[sha256sum] = "9756e82d5f3bf11629ffcbafb1f8a1092d3bb4789e33494032cdce9a9c8459d3"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


