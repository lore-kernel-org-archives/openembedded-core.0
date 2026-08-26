Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 644A2C61DBD
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 08:18:48 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7743.1787732322107144872
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 01:18:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=H/j6XKyx;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787732325; x=1819268325;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rGcNoMkYIOrx17ST1eoOFDDjSXOhO/xZv0ZQjV3zXzg=;
  b=H/j6XKyxqtNi3JjBp+lYNl5KYNILx0cv0+iZI6hTLtgeZPDiXSJJV/nL
   /Hpcpsbyiw97XPfgfIYElSj9UXX27H7JciSBj4JRunWJVGlKtomla7W+6
   WLS1eGYvMjpjNh3XJWtKe/kS+4upf48FETpNvyJnYIpu0MO+zKcBVY8h/
   VhynxAI/HU0Dp7cBFojgMfTNabyD0hKCub6Po3sLt47KOCn98sKkU1BIe
   FQ6XGHXIOFg6HVd0wg+PnTUUR5MLoNnnIOznVFsYQbp6zwITlIMTsfMlm
   Q/0+FhNUYQFDUUDadYph8b+Qyu9TJvTInVUv9YZ3pIbar9p+c0nVASzEz
   w==;
X-CSE-ConnectionGUID: mYMPkslnTQGjenKtV0BreA==
X-CSE-MsgGUID: 4bVJr7RxSVWGWkDKaCW1iA==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="240668711"
X-IronPort-AV: E=Sophos;i="6.25,244,1779116400"; 
   d="scan'208";a="240668711"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 17:18:44 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 65A698203FC
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:18:40 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 1BFBD140012D
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:18:40 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 1D2D88214FC;
	Wed, 26 Aug 2026 08:18:37 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 09/17] gstreamer1.0-rtsp-server: upgrade 1.28.5 -> 1.28.6
Date: Wed, 26 Aug 2026 16:18:24 +0800
Message-ID: <20260826081832.1059-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260826081832.1059-1-wangmy@fujitsu.com>
References: <20260826081832.1059-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:18:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244349

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...rtsp-server_1.28.5.bb => gstreamer1.0-rtsp-server_1.28.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.28.5.bb => gstreamer1.0-rtsp-server_1.28.6.bb} (90%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.6.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.6.bb
index 0b6672c3a6..f775dd08e7 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.6.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "7e19fddeb1261bebc3ec397857fedd5c77129b66ab52788fdadad05117566225"
+SRC_URI[sha256sum] = "0cb725b1351f75e88803c55dddea1f27be09523ddcd7f29ab18270e182a2a463"
 
 S = "${UNPACKDIR}/${PNREAL}-${PV}"
 
-- 
2.43.0


