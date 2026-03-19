Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF18F107529C
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 10:14:24 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7848.1773915258464594700
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 03:14:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=n1O/Th1U;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773915259; x=1805451259;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7HQwsnEMZcOKrJ47Jimxzn6q0Io7RE1lBvRWTL2Jjfw=;
  b=n1O/Th1UXpipjMRfsUtO3CNhIENBDFcA+nvkWpbfyk6x6kSePyBCJ1uv
   kGAGWySrNyaz0i3rJCrkt61dJNaB27NxdSNfa2M3ChEUGo/WNL6YzmNth
   E2zOhMVYGdW2iEQe5jHdK4Ljalvk3Jw3kOkuQYPlL8tn62DPMFfV4cD0s
   3gHu3IRUx4mlCjFz/Ens/hnq4MKOTIk663hOb0JzKNxaizniEHL1oN8mk
   UYIgbiXDQyqMZyiRZeYGz6KM6INyef1bXaBF7wobO9HUoSZM81jJviOMe
   TFr2UNZi2se2Vjuo/NJj8qyKzaONxd/1DhriknAa9lk06vO07T87GE0Ir
   w==;
X-CSE-ConnectionGUID: GmTTBn3YTEm6zidpWh+eHw==
X-CSE-MsgGUID: zJVULN2FSWi8HvySw5208A==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="233324725"
X-IronPort-AV: E=Sophos;i="6.23,129,1770562800"; 
   d="scan'208";a="233324725"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 19:14:17 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 0573D1C166C5
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:14:17 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id AF1391410C9A
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:14:16 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id B1C56101E52A;
	Thu, 19 Mar 2026 10:14:13 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 10/40] fastfloat: upgrade 8.2.3 -> 8.2.4
Date: Thu, 19 Mar 2026 18:13:02 +0800
Message-ID: <20260319101332.2067-10-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260319101332.2067-1-wangmy@fujitsu.com>
References: <20260319101332.2067-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:14:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233478

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../fastfloat/{fastfloat_8.2.3.bb => fastfloat_8.2.4.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/fastfloat/{fastfloat_8.2.3.bb => fastfloat_8.2.4.bb} (90%)

diff --git a/meta/recipes-devtools/fastfloat/fastfloat_8.2.3.bb b/meta/recipes-devtools/fastfloat/fastfloat_8.2.4.bb
similarity index 90%
rename from meta/recipes-devtools/fastfloat/fastfloat_8.2.3.bb
rename to meta/recipes-devtools/fastfloat/fastfloat_8.2.4.bb
index 9ccf3dce0c..a5b48d259b 100644
--- a/meta/recipes-devtools/fastfloat/fastfloat_8.2.3.bb
+++ b/meta/recipes-devtools/fastfloat/fastfloat_8.2.4.bb
@@ -9,6 +9,6 @@ LIC_FILES_CHKSUM = " \
 
 SRC_URI = "git://github.com/fastfloat/fast_float.git;protocol=https;branch=main;tag=v${PV}"
 
-SRCREV = "01ce95dfe46abccf3264fbccf9f5139ea9016cd2"
+SRCREV = "eb9ab42c0aa86d3cc41871ba7306527d95077b3b"
 
 inherit cmake
-- 
2.43.0


