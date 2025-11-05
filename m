Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E2B9CCFA1C
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:47:51 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3004.1762386462904147314
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:47:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=JJFaAE5P;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1762386465; x=1793922465;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9rQ9G6DNWzubk24dQ9Z/SE45epUVvvwgzV/fBTw6Z1E=;
  b=JJFaAE5PTGZE8d3uOa5dZYUwJwe7ouiurBSZW6cbt/EBfKV7HfCsjLOo
   3BnNgqR3N87GD5Hx7FuXI9bn42AzhYo9uhM7XBjPQob4zntTz2RfYeXIZ
   WAXNwhTACKnubdA0pReP8PDsuW/G7uja/vSOaOV8P6xBgTWkUPXSRuvP+
   3MEv2PBnS6WtzhBsADV/v9OLRt5ZEituxt6H48Z/t5dxoYNx03KePVhjS
   +/0E5ceUixLn36kjPf5MCmcqYzpf6io+OfLZvhoJPexfFaeeaJT2fC7nD
   BWY28QRy/KgLT/DkcoAAFieZNIRCM7S6hikLShCHPlk3tTBqT+fbO11Vi
   g==;
X-CSE-ConnectionGUID: 00ELDXFcTUOjXMiu3Lq2VQ==
X-CSE-MsgGUID: KUw0zxKpSjm+BBUbY4o7Yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="197067463"
X-IronPort-AV: E=Sophos;i="6.19,283,1754924400"; 
   d="scan'208";a="197067463"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([20.61.8.234])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 08:47:45 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 236A742A338
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Nov 2025 23:47:45 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id D0A0010003B7
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Nov 2025 23:47:44 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 528E71400AC0;
	Wed,  5 Nov 2025 23:47:42 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 15/29] gst-examples: upgrade 1.26.5 -> 1.26.7
Date: Thu,  6 Nov 2025 07:46:58 +0800
Message-ID: <20251105234712.446-15-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251105234712.446-1-wangmy@fujitsu.com>
References: <20251105234712.446-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:47:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225945

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{gst-examples_1.26.5.bb => gst-examples_1.26.7.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gst-examples_1.26.5.bb => gst-examples_1.26.7.bb} (96%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-examples_1.26.5.bb b/meta/recipes-multimedia/gstreamer/gst-examples_1.26.7.bb
similarity index 96%
rename from meta/recipes-multimedia/gstreamer/gst-examples_1.26.5.bb
rename to meta/recipes-multimedia/gstreamer/gst-examples_1.26.7.bb
index 2fa4ef11fe..6790f0b038 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples_1.26.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-examples_1.26.7.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://gitlab.freedesktop.org/gstreamer/gstreamer.git;protocol=https;b
            file://gst-player.desktop \
            "
 
-SRCREV = "82cbccedf7946a32d28a5aaec8ebbcb627770c19"
+SRCREV = "c5a5c302f5e7218182c0633decec16b25de82add"
 
 S = "${UNPACKDIR}/${BP}/subprojects/gst-examples"
 
-- 
2.43.0


