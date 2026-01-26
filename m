Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9BEBCF65FE
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 12:38:56 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19095.1769431131501478063
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jan 2026 04:38:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=KmOzRl/A;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769431129; x=1800967129;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=1Vi463h+Qw6WLThLqY4vkVlEslIqdmx7dGAW4GD0tUM=;
  b=KmOzRl/AGgVVsQoxEuGWS/MwcF0RdVMndkdzK8cxJ8hEGKtW4Xrrall5
   G1yh/XE9g2C47q5Ge9gXdGewSy3qCPh8sWrka1XYiZyHU0E4fgKLckz/R
   ioWVAOf0tCMCRMNVKWP6AFyrpy0UdFmwxbaECTBDT1aErbbtinsWxRRyf
   p60R6qUDfHcmv7GgqGyTaEhk+dL32tvbYUVUQkrjF4rtRBUrosqnZJJc/
   PeO5mkvP/XtF4uMmqZjW/3aOM8WjDp2WnUp96gnYOvnZ97lxQstrLaIbf
   8+neyGt8B3HcwMp/rITmL7ScmSrUcY0yyqh+yzy41XqeCpcMvTMLkL6du
   A==;
X-CSE-ConnectionGUID: ox1h0rmAQs6HNz/3vLYRRA==
X-CSE-MsgGUID: /ShO9HugQi21NlSD+iNWGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="205947376"
X-IronPort-AV: E=Sophos;i="6.21,255,1763391600"; 
   d="scan'208";a="205947376"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.19])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 21:38:48 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id E3E031020FB6
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 12:38:49 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 9ADCC8D29D2
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 12:38:49 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id E71BE101905D;
	Mon, 26 Jan 2026 12:38:46 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 12/17] python3-pycparser: upgrade 2.23 -> 3.0
Date: Mon, 26 Jan 2026 20:38:39 +0800
Message-ID: <20260126123844.1052-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 12:38:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229996

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pycparser_2.23.bb => python3-pycparser_3.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pycparser_2.23.bb => python3-pycparser_3.0.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-pycparser_2.23.bb b/meta/recipes-devtools/python/python3-pycparser_3.0.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-pycparser_2.23.bb
rename to meta/recipes-devtools/python/python3-pycparser_3.0.bb
index a33a6553b4..ab2258a3e1 100644
--- a/meta/recipes-devtools/python/python3-pycparser_2.23.bb
+++ b/meta/recipes-devtools/python/python3-pycparser_3.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/eliben/pycparser"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=9761c3ffee7ba99c60dca0408fd3262b"
 
-SRC_URI[sha256sum] = "78816d4f24add8f10a06d6f05b4d424ad9e96cfebf68a4ddc99c65c0720d00c2"
+SRC_URI[sha256sum] = "600f49d217304a5902ac3c37e1281c9fe94e4d0489de643a9504c5cdfdfc6b29"
 
 inherit pypi setuptools3
 
-- 
2.43.0


