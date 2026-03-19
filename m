Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02409107529F
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 10:14:45 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7856.1773915283897508596
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 03:14:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HtSvUuxQ;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773915284; x=1805451284;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3OL7hGR7vTHzctYj/WTVERY3wVQdRXZzR2RtQN4zNiQ=;
  b=HtSvUuxQ8UHWfb8e32ccENdcz4dTP5Zbm5xYrpBFLp1ifHLb+if379ml
   ZibDrmEd0ak7sozy5+E3nBmSWvo9tdloRXO05hxMcJqKm+yMVPIu/lLUs
   XYMUaoiufUzpC2CDq9NSbVnuL9Tx6fsbwcmleXTCaI6+aMXyIBJIoQDUK
   txJ40EfzwgDxxoI2hUuiL2t711xc7YAhIze1OfF60+LeMbdMU+0AijL9V
   bSl8fY6skO0LEDZXsuzXBodD2ERA2m5VECRgm4WqjgEhPJJ7CQXCkChaI
   xwgfTQeeb84e9nGWdpLAy0gQFzDTqe6mrmDGuNxiNYeVboI7G7gax0sl5
   A==;
X-CSE-ConnectionGUID: MeYp0d3MQmWxxYr4naFHrQ==
X-CSE-MsgGUID: RTBh05hjSXOXzeInM/hyrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="233324762"
X-IronPort-AV: E=Sophos;i="6.23,129,1770562800"; 
   d="scan'208";a="233324762"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 19:14:43 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 6BE758203D5
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:14:42 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 2041318002D5
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:14:42 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 2C014101E52D;
	Thu, 19 Mar 2026 10:14:38 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 12/40] harfbuzz: upgrade 12.3.2 -> 13.1.1
Date: Thu, 19 Mar 2026 18:13:04 +0800
Message-ID: <20260319101332.2067-12-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260319101332.2067-1-wangmy@fujitsu.com>
References: <20260319101332.2067-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:14:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233480

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../harfbuzz/{harfbuzz_12.3.2.bb => harfbuzz_13.1.1.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_12.3.2.bb => harfbuzz_13.1.1.bb} (95%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_13.1.1.bb
similarity index 95%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_13.1.1.bb
index 12bebc4bee..30a19a84fe 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_13.1.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b98429b8e8e3c2a67cfef01e99e4893d \
                     "
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "6f6db164359a2da5a84ef826615b448b33e6306067ad829d85d5b0bf936f1bb8"
+SRC_URI[sha256sum] = "e7f3b8bac3fdcc529985be8e84fbd65c675ac47ee58512b15a5dd620c79ffe2a"
 
 DEPENDS += "glib-2.0-native"
 
-- 
2.43.0


