Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38C2AC83F1D
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 08:08:46 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.2992.1752566917092300246
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 01:08:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ZTecaIU8;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1752566917; x=1784102917;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=m3AiScHCC8wY1d0BRMsCJKKyFsM4kqnP3Ke7pZR6Hz0=;
  b=ZTecaIU8S1YTn4U50zlEXvIdbhfpWopeAk5MZ3v7itc4bkXQuWvRzGYb
   1TRb0pgL5f8ERlVMZEE2mXBHW5c3YIAnKmYM5SiMEKkn77uFoMTa63OUo
   kIEQ/hl1WcyQeKuAvJ+F0JSUewpuoEandn6Pr+H7EN5K8pD9JqRoABgHP
   hu7995DLxymBW+n3EL5MrMMhSN0IYVpqUA2se1wHSbQdvUCzMx5EriGB+
   YvChsaD/dW3k6Rj1j5aU0/CJIfML9r/ay1YVVyUP41P1HcUkkg5k7O4no
   oKqu4Pjv5uJftmvd9pDT9YoFZZeGiQwcDTh6gKaQRxZZt5ULNTdZsUC9m
   A==;
X-CSE-ConnectionGUID: f5M2ATsqQp6HRcBnJ4OXVQ==
X-CSE-MsgGUID: HXNof+zhQQq4vo2BgJd3fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="206892993"
X-IronPort-AV: E=Sophos;i="6.16,313,1744038000"; 
   d="scan'208";a="206892993"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([51.138.80.169])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 17:08:36 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 98EA11C00084
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 08:08:36 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id EB87810000F9
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 08:08:35 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 65A411A0074;
	Tue, 15 Jul 2025 16:08:32 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 17/19] tcl: upgrade 9.0.1 -> 9.0.2
Date: Tue, 15 Jul 2025 16:08:17 +0800
Message-ID: <20250715080819.622-17-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250715080819.622-1-wangmy@fujitsu.com>
References: <20250715080819.622-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 08:08:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220286

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/tcltk/{tcl_9.0.1.bb => tcl_9.0.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/tcltk/{tcl_9.0.1.bb => tcl_9.0.2.bb} (97%)

diff --git a/meta/recipes-devtools/tcltk/tcl_9.0.1.bb b/meta/recipes-devtools/tcltk/tcl_9.0.2.bb
similarity index 97%
rename from meta/recipes-devtools/tcltk/tcl_9.0.1.bb
rename to meta/recipes-devtools/tcltk/tcl_9.0.2.bb
index 765dc64e4d..87773c7717 100644
--- a/meta/recipes-devtools/tcltk/tcl_9.0.1.bb
+++ b/meta/recipes-devtools/tcltk/tcl_9.0.2.bb
@@ -23,7 +23,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/tcl/tcl-core${PV}-src.tar.gz \
            file://0004-tcl-update-the-header-location.patch \
            file://0005-tcl-fix-race-in-interp.test.patch \
            "
-SRC_URI[sha256sum] = "488fcb6c875a1762e9e8478319b20fbad9a31de475f056aeed94cc54b44cf221"
+SRC_URI[sha256sum] = "b563649181dfe12f970673c427c59208074fd7c91a20132d6cadf5d82d3371be"
 
 UPSTREAM_CHECK_URI = "https://www.tcl.tk/software/tcltk/download.html"
 UPSTREAM_CHECK_REGEX = "tcl(?P<pver>\d+(\.\d+)+)-src"
-- 
2.43.0


