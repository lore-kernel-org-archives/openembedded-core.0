Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EED5E78D68
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 09:04:26 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43859.1770627861941390613
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 01:04:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=r4ESljWS;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770627862; x=1802163862;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PzBs3qz8WjZmKwDBc6Z/nhS1sNQntaE8/dUwUTsbI+Y=;
  b=r4ESljWSVRswmPlh2tIBh2WKXQme/hUNSwtmNZcMM029luR5XsQa9Pix
   IWMzlYt7xX+K9wCUPQ62RqyOGaZK+TYUHdhQzrlKZZ3bAi/7nnDFef1bH
   loZ3O/SCEtJp7zxo1gNxmMNoIwLLyybfZ7oWMAxcCRrIz4td9LWjmZuAI
   6X1+SSgxXlgYFK8RL1fI7urTf7VpVVqlSFBgLFgG8mUaK5XydRpTY/1Ah
   bMc9JkONs8oLfXqRsq/x02j1CGZUD53ydcI5o/jbViPPnyzFBsggeP+tJ
   AKCDxXKtZew1F7z4z+3ehVzA6s7hZNPxxZTNSpIREKRCHah1CequZOpUR
   Q==;
X-CSE-ConnectionGUID: y3TIopTRTcK7Gj13kAsKOQ==
X-CSE-MsgGUID: hB7efLaSRaujzCLOUOsoiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="229682239"
X-IronPort-AV: E=Sophos;i="6.21,281,1763391600"; 
   d="scan'208";a="229682239"
Received: from unknown (HELO mail.fujitsu.com) ([51.138.80.169])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 18:04:20 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.fujitsu.com (Postfix) with ESMTPS id 78AB325F
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 09:04:20 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 1CE7E14003B9
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 09:04:20 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 643D9101A427;
	Mon,  9 Feb 2026 09:04:17 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 31/39] shaderc: upgrade 2025.5 -> 2026.1
Date: Mon,  9 Feb 2026 17:03:09 +0800
Message-ID: <20260209090317.1468-31-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260209090317.1468-1-wangmy@fujitsu.com>
References: <20260209090317.1468-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 09:04:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230741

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../shaderc/{shaderc_2025.5.bb => shaderc_2026.1.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/shaderc/{shaderc_2025.5.bb => shaderc_2026.1.bb} (95%)

diff --git a/meta/recipes-graphics/shaderc/shaderc_2025.5.bb b/meta/recipes-graphics/shaderc/shaderc_2026.1.bb
similarity index 95%
rename from meta/recipes-graphics/shaderc/shaderc_2025.5.bb
rename to meta/recipes-graphics/shaderc/shaderc_2026.1.bb
index 9ae5defa5f..1d66c2b810 100644
--- a/meta/recipes-graphics/shaderc/shaderc_2025.5.bb
+++ b/meta/recipes-graphics/shaderc/shaderc_2026.1.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/google/shaderc"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRCREV = "bca2fa0bf0242340440d54f8d8e05c5dd2fafcea"
+SRCREV = "75f8c09ada4a69b086afdd2c03d7a8be06242414"
 SRC_URI = "git://github.com/google/shaderc.git;protocol=https;branch=main;tag=v${PV} \
            file://0001-cmake-disable-building-external-dependencies.patch \
            file://0002-libshaderc_util-fix-glslang-header-file-location.patch \
-- 
2.43.0


