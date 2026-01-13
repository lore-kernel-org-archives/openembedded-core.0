Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53651D0C83B
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 10:25:51 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.55856.1768299941363493474
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jan 2026 02:25:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rPoc5pxk;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1768299941; x=1799835941;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CN9HUvdBRVa7orH5oAji7ub98ktByKi5YIzXXPhd4l0=;
  b=rPoc5pxkzQhhKyMgeTpbqOOQIEIcgginnl+IU1cxyeZFV0nuINZ9hDzP
   ij2WU0G0ZwPsoKC2J2B2tK7CwAMsZjTOn29/FlqRtR0pmy5hy3A1pPV4X
   dXdUBctIOZu7TRiUI1KTcCepHDGdRAwIMQxM6i/4g076fJgh8p8DV3ov4
   RnllRBb9/tP20jBcNbTQu7nebWvPUbWS9MRH+M5Wb02fOA3z9iJWaljmp
   Xjn+ZmUMhah+zq7+VcRCaaE5WD45lV/0H2599VXgyuQOz3XSBVeL7hZLp
   NmyOgIjP8JLFLoMrM33QDia2uo9EitTQLrT1vAZy200Cs/UkVmEKCStay
   A==;
X-CSE-ConnectionGUID: R7Lae6h9Tai9sRTsUoYQeg==
X-CSE-MsgGUID: YDOmIxdUT4K4vy91XIZgOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="225618105"
X-IronPort-AV: E=Sophos;i="6.21,222,1763391600"; 
   d="scan'208";a="225618105"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([20.61.8.234])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 19:25:39 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id C83791C00094
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 10:25:39 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 75B0118026FA
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 10:25:39 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.191])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id ABEBF826FF9;
	Tue, 13 Jan 2026 10:25:36 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 11/18] python3-jsonschema: upgrade 4.25.1 -> 4.26.0
Date: Tue, 13 Jan 2026 18:25:01 +0800
Message-ID: <20260113102509.728-11-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260113102509.728-1-wangmy@fujitsu.com>
References: <20260113102509.728-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 10:25:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229250

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Decrease import time by delaying importing of urllib.request

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-jsonschema_4.25.1.bb => python3-jsonschema_4.26.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-jsonschema_4.25.1.bb => python3-jsonschema_4.26.0.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-jsonschema_4.25.1.bb b/meta/recipes-devtools/python/python3-jsonschema_4.26.0.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-jsonschema_4.25.1.bb
rename to meta/recipes-devtools/python/python3-jsonschema_4.26.0.bb
index 5ccb829ff4..5a778656af 100644
--- a/meta/recipes-devtools/python/python3-jsonschema_4.25.1.bb
+++ b/meta/recipes-devtools/python/python3-jsonschema_4.26.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7a60a81c146ec25599a3e1dabb8610a8 \
                     file://json/LICENSE;md5=9d4de43111d33570c8fe49b4cb0e01af"
 
-SRC_URI[sha256sum] = "e4a9655ce0da0c0b67a085847e00a3a51449e1157f4f75e9fb5aa545e122eb85"
+SRC_URI[sha256sum] = "0c26707e2efad8aa1bfc5b7ce170f3fccc2e4918ff85989ba9ffa9facb2be326"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


