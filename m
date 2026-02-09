Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2E2DE78D57
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 09:03:55 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43847.1770627831054739062
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 01:03:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ABGrsew3;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770627832; x=1802163832;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=55O7p5PaIe3FD+M01oj4gRRPnWlYuC8Ag3EvZ2uZxxo=;
  b=ABGrsew3Yl6xViejzD5JY/6nCdjE9xT0acl14I2JWJ8uujtVPkP8CxNE
   +wPoDMW6zVXGSQGapKk16tY2e/ZJ8Oq1RUaxTWkzZAdHJkqaO50i42EMW
   5uMYbJ/yOVRV1G0B0+d9p3BEMuvHE3CkewPkl/4xGU51Fxbwmu86V/axx
   6zMCb+oIAYAT1vjdntaZicrcczcJl5VH/FlIFCBsU1ReXcJStnZ+IFCjR
   8tIuWUGVPE+LH/eQKS2FqdV1pRZ98JTULCNcfYQMNO8h8bwqsgV3klKtG
   fsy4TRge0LBLWDRXYhhRCZntYltHWTRImslfhUFirw3tMLEl1PtrIBfMy
   w==;
X-CSE-ConnectionGUID: rK4EdiDJQ2aJXQvvk+lSaQ==
X-CSE-MsgGUID: chjAXxR2QECmzMAFi8tM7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="216965252"
X-IronPort-AV: E=Sophos;i="6.21,281,1763391600"; 
   d="scan'208";a="216965252"
Received: from unknown (HELO mail.fujitsu.com) ([51.138.80.169])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 18:03:51 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.fujitsu.com (Postfix) with ESMTPS id 619871000346
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 09:03:51 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 155241800E85
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 09:03:51 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 72FA2101A41D;
	Mon,  9 Feb 2026 09:03:48 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 15/39] libxrandr: upgrade 1.5.4 -> 1.5.5
Date: Mon,  9 Feb 2026 17:02:53 +0800
Message-ID: <20260209090317.1468-15-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260209090317.1468-1-wangmy@fujitsu.com>
References: <20260209090317.1468-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 09:03:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230726

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-lib/{libxrandr_1.5.4.bb => libxrandr_1.5.5.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxrandr_1.5.4.bb => libxrandr_1.5.5.bb} (87%)

diff --git a/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb b/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb
similarity index 87%
rename from meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb
rename to meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb
index 3e2825b916..8696d11025 100644
--- a/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb
@@ -19,4 +19,4 @@ XORG_PN = "libXrandr"
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[sha256sum] = "1ad5b065375f4a85915aa60611cc6407c060492a214d7f9daf214be752c3b4d3"
+SRC_URI[sha256sum] = "72b922c2e765434e9e9f0960148070bd4504b288263e2868a4ccce1b7cf2767a"
-- 
2.43.0


