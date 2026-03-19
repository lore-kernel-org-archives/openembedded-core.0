Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0389A107760A
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 10:15:05 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7861.1773915296701729366
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 03:14:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HmVkukIf;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773915297; x=1805451297;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GSvGWmJrddtADGBk0GxlQJBwS/4nCBNshz17sW3Vjig=;
  b=HmVkukIfM4vP9RsoOjnViMmrCST6qBHnlruQzxkTPEZd7fS/jtqFJLDp
   PlEP4EKyqYj3l6Z7LxDr9852uJolwjRl4m0IE/bkfDB2T2F9pnUtFwyDR
   ugJnqyrAhNfZ6OOEFGncfQOJFj2N0opEwe1hInPETQioBqLCnH1Rvhxq9
   pd6pm62a7Ws/KU/utLyExh8wHokWg0UgE/YUrdVXY5bzWtGmq8ywa1Ep8
   vlEsGmA1c1kolos/ft1CDDwDbnJTto+jd2ddYnSateCMZV9PLk61dg4RN
   TzOHFrRc3ywU8GZc2EVEVxMUh8VuQW8Ptixw68uaCnm7jWoiXuOsjirSJ
   A==;
X-CSE-ConnectionGUID: CUTffOfOTaCvx5U1Oi4kWA==
X-CSE-MsgGUID: F/bPfKkjRGiNw3sOszQgOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="212891253"
X-IronPort-AV: E=Sophos;i="6.23,129,1770562800"; 
   d="scan'208";a="212891253"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 19:14:55 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 47D261878
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:14:55 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id EB87DC03727
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:14:54 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 0ADEC101E52D;
	Thu, 19 Mar 2026 10:14:51 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 18/40] lttng-modules: upgrade 2.14.3 -> 2.15.0
Date: Thu, 19 Mar 2026 18:13:10 +0800
Message-ID: <20260319101332.2067-18-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260319101332.2067-1-wangmy@fujitsu.com>
References: <20260319101332.2067-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:15:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233484

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../lttng/{lttng-modules_2.14.4.bb => lttng-modules_2.15.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/lttng/{lttng-modules_2.14.4.bb => lttng-modules_2.15.0.bb} (94%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.14.4.bb b/meta/recipes-kernel/lttng/lttng-modules_2.15.0.bb
similarity index 94%
rename from meta/recipes-kernel/lttng/lttng-modules_2.14.4.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.15.0.bb
index 722b1ac5dd..60e6be5255 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.14.4.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.15.0.bb
@@ -16,7 +16,7 @@ SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
 SRC_URI:append = " file://0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch \
                    file://0001-fix-adjust-range-in-btrfs-probe-for-v6.18.14.patch \
                 "
-SRC_URI[sha256sum] = "63deefbc15d9ce7c43d858187533367b01dcb6e8469d6b69ccb757d6d3dbb0ad"
+SRC_URI[sha256sum] = "d37bcc747dc0864ce6ecd45e3ccae4f7e16591c16664abb394ed57ab43628f47"
 
 export INSTALL_MOD_DIR = "kernel/lttng-modules"
 
-- 
2.43.0


