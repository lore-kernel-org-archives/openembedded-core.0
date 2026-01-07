Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85542CD584B
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 10:31:34 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3120.1767781890510584717
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 02:31:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ITgiesU2;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1767781891; x=1799317891;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gTttpvetY6u04/+WNguw/bjOaAtHiE78/CXnaGg+lZI=;
  b=ITgiesU2j2tHwlRRa1Mca41y1I2FEFcWOx7NUneSwE+55g1ig+0Fi+WS
   +Wv3MZAdV/WECgC9r6MALeXqFPHW7MOAkGlglwohw7gOcCDNSxckOqHat
   qg4uSApXRFUGTusi410/ktrWCA/EdKQmdbHaVo8+JvGfNzw+NSuIcwlxZ
   ds2Hl1evsBWK044FKFSfXkUEUT240pdAeqe5n2IVkKq7AjhidbGwuMxn9
   yxBZ4tzTNGzBPYqgJEcD46hvdFC4qlHdKEWMu0aOaqiO4QvPwP056qhDP
   Vph5IIMgMgpzhw5Qv/XhKIv3lfuZL1KualeiMjjsoDW3xy6mKDEYVweQf
   Q==;
X-CSE-ConnectionGUID: IbC0bEStTeGhbmi5v0Qcuw==
X-CSE-MsgGUID: 4nLCGmegToaSNQ+D7tRxlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="229043543"
X-IronPort-AV: E=Sophos;i="6.21,207,1763391600"; 
   d="scan'208";a="229043543"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.19])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 19:31:30 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 1AE901002B8B
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Jan 2026 10:31:31 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id C07F4C060AA
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Jan 2026 10:31:30 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.191])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id E6F7C101BB60;
	Wed,  7 Jan 2026 10:31:27 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 08/15] python3-docutils: upgrade 0.22.3 -> 0.22.4
Date: Wed,  7 Jan 2026 18:30:55 +0800
Message-ID: <20260107103102.458-8-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260107103102.458-1-wangmy@fujitsu.com>
References: <20260107103102.458-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 10:31:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228978

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-docutils_0.22.3.bb => python3-docutils_0.22.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-docutils_0.22.3.bb => python3-docutils_0.22.4.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-docutils_0.22.3.bb b/meta/recipes-devtools/python/python3-docutils_0.22.4.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-docutils_0.22.3.bb
rename to meta/recipes-devtools/python/python3-docutils_0.22.4.bb
index a89e9941ca..571a19a958 100644
--- a/meta/recipes-devtools/python/python3-docutils_0.22.3.bb
+++ b/meta/recipes-devtools/python/python3-docutils_0.22.4.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "CC0-1.0 & BSD-2-Clause & GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING.rst;md5=ce467b04b35c7ac3429b6908fc8b318e"
 
-SRC_URI[sha256sum] = "21486ae730e4ca9f622677b1412b879af1791efcfba517e4c6f60be543fc8cdd"
+SRC_URI[sha256sum] = "4db53b1fde9abecbb74d91230d32ab626d94f6badfc575d6db9194a49df29968"
 
 inherit pypi python_flit_core
 
-- 
2.43.0


