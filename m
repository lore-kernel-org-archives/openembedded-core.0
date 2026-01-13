Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25D21D0C830
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 10:25:31 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.56083.1768299922470856672
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jan 2026 02:25:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=oMDJEYgX;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1768299922; x=1799835922;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2k6c5YOYKsOTh9sBLR9ekDLPnfQhOFdTCtmOoGwh+kY=;
  b=oMDJEYgXGeAPvxTykzwqhOoeuCxT5BlnXkcDkZMz4GSb8qQaWq0PWNBq
   lLiqUq7udh5o6yRNcgPcCFge+x1ibTqtC56qILY++Tin00bjgei0+EBHm
   9dd9SMxL7Q7R0Jtvok4Y5mAvYNQzd7Azyl1RkDzCUbjNikLrRaMOiBdVw
   HakmFPWf31XP2g/gfozuyfzVKidZS1rxMwWaEi18RNUL3QzV3v5mjsj0o
   LTlUtJk0WIYSY6D2x67v8sLs1Lp80EcFk0FiwxzReQPufi1Sr3rDZ8dTx
   ePwLQYAWWvdT/0x3CxYhBsdFmPuxxfKe+EoX1DjHbu5coGwGRUmAoBhE4
   g==;
X-CSE-ConnectionGUID: clE+hLe9R8ysSEgtXlsVnA==
X-CSE-MsgGUID: Pxcz6AoySuS+SlWpX39NmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="204468563"
X-IronPort-AV: E=Sophos;i="6.21,222,1763391600"; 
   d="scan'208";a="204468563"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([51.138.80.169])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 19:25:20 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id EC7D942A32A
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 10:25:20 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 948901C00151
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 10:25:20 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.191])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id DB223826FFA;
	Tue, 13 Jan 2026 10:25:17 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 02/18] alsa-ucm-conf: upgrade 1.2.15.1 -> 1.2.15.2
Date: Tue, 13 Jan 2026 18:24:52 +0800
Message-ID: <20260113102509.728-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260113102509.728-1-wangmy@fujitsu.com>
References: <20260113102509.728-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 10:25:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229241

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{alsa-ucm-conf_1.2.15.1.bb => alsa-ucm-conf_1.2.15.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/alsa/{alsa-ucm-conf_1.2.15.1.bb => alsa-ucm-conf_1.2.15.2.bb} (89%)

diff --git a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.15.1.bb b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.15.2.bb
similarity index 89%
rename from meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.15.1.bb
rename to meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.15.2.bb
index 961a1444e3..1716ccf1e9 100644
--- a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.15.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.15.2.bb
@@ -8,7 +8,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=20d74d74db9741697903372ad001d3b4"
 
 SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "246c5d59d217b6f7f47a11fd10f1b766d25abcb0d9c996af3079bb9c9ac5a1b0"
+SRC_URI[sha256sum] = "07b93bab13b2c54f4ecce1374efb8fce23a353d7e0038dd3c533a24825ea0ba3"
 # Something went wrong at upstream tarballing
 
 inherit allarch
-- 
2.43.0


