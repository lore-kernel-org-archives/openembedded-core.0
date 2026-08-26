Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEEEDC61DC2
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 08:14:07 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7707.1787732044214011933
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 01:14:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ZEdS0zaN;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787732048; x=1819268048;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jkhceaqwi9Ofkg6CaCvozyIjhFww5VkzoCxBnR4x/Us=;
  b=ZEdS0zaNUv8BC2cqFigj5OCRTDupBZEa3FpZ+7NS6yhm8ePTO3TWr4gb
   WORY837xni/anfOuMK/B+riNyKzNQ/eEkgvNslY//1osSS6caYICLGDFv
   tLtYbS/K7p335UnfzhAvQZlxcrK3P2pSAqz1DhrUBIcwJThfljxiZ4Nlm
   1OPY1w8xcMxtMPk6u4HBmd7MSMpIO3SYRqweyXf+EgppJ7xAUr2e6L7tu
   ZkSoebObyg8yoyLaSXPvWbgHMqE/lBlQhW72kj4O3henhrPekFfS4M3v2
   x3TgIBL26ZhoMA7XzoJPFFtkThXK0+U3+p7gfGd0p2gDPaQ9sjnKLAkIN
   A==;
X-CSE-ConnectionGUID: knwEEUSRTlC8FzjX4PN3zw==
X-CSE-MsgGUID: XDuwsrgrSru9XhacF1A/4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="240667619"
X-IronPort-AV: E=Sophos;i="6.25,244,1779116400"; 
   d="scan'208";a="240667619"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 17:14:06 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 8B9481C000E7
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:14:02 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 3CCCE101D6A7
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:14:02 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 5B8EB8214F5;
	Wed, 26 Aug 2026 08:14:00 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 06/17] gstreamer1.0-plugins-good: upgrade 1.28.5 -> 1.28.6
Date: Wed, 26 Aug 2026 16:13:37 +0800
Message-ID: <20260826081348.1006-6-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260826081348.1006-1-wangmy@fujitsu.com>
References: <20260826081348.1006-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:14:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244345

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ugins-good_1.28.5.bb => gstreamer1.0-plugins-good_1.28.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.28.5.bb => gstreamer1.0-plugins-good_1.28.6.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.6.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.6.bb
index 9d7fd62304..9c780afffc 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.6.bb
@@ -6,7 +6,7 @@ BUGTRACKER = "https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/issues
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "58b45d24a1d77b39d7bb7d9ccc6e2d76bbf28618998c335c163f18e6f94a9324"
+SRC_URI[sha256sum] = "b0c620a4b18b6ee931b4c43bbf1760d308666dc37f730a7e7f1ad327e59ce2df"
 
 S = "${UNPACKDIR}/gst-plugins-good-${PV}"
 
-- 
2.43.0


