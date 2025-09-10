Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B593BCAC58D
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 09:17:39 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.13160.1757495857306327713
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Sep 2025 02:17:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Nk0lBWeP;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1757495857; x=1789031857;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9rqNP3+DiBqKZQYCOvfkMsIuMKEn15hId5jMbpVPbNw=;
  b=Nk0lBWePDRgjolq9tJBg/6d+46sNRvuzvBU5DrtAfNbF0qnA46a1U50/
   GGLMRbRzOyGyq6GALryyFn9foozT7Ubtv6A1n91+IASRm1AzYAu9N5pg7
   XkTaFj/TRmOrKzJ91CNUxzuqDJiYJM176hbWKY30P6edB+XMr/0OiaJOc
   HHndlK/ed3BW7poo6pZr87BDV1bBy8BhCBkWyDy8NCnyd3RiUNKbZ7L1d
   8A9CaZqNblmqRFLiVidY2GiGf/r+c5k0yXSqgAFMk+eKh8gtiGD87kpgc
   WVnxKehWOCFAR/ufS9r3uvbkLIeiP78Z2zLOLZg7Ajh2r0W/XASHF+/pT
   w==;
X-CSE-ConnectionGUID: 4+hNpRPxRE6s/zrVUHyctw==
X-CSE-MsgGUID: 1wMI6/5uTiqvSboH7wLRNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="191302764"
X-IronPort-AV: E=Sophos;i="6.18,253,1751209200"; 
   d="scan'208";a="191302764"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.19])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 18:17:35 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 9FD991C1C724
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:35 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 55FD41800243
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:35 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTPS id ADFA2829F3A
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:33 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A48851A008D;
	Wed, 10 Sep 2025 17:17:30 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 19/40] libxres: upgrade 1.2.2 -> 1.2.3
Date: Wed, 10 Sep 2025 17:16:25 +0800
Message-ID: <20250910091646.998-19-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250910091646.998-1-wangmy@fujitsu.com>
References: <20250910091646.998-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223172

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-lib/{libxres_1.2.2.bb => libxres_1.2.3.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxres_1.2.2.bb => libxres_1.2.3.bb} (84%)

diff --git a/meta/recipes-graphics/xorg-lib/libxres_1.2.2.bb b/meta/recipes-graphics/xorg-lib/libxres_1.2.3.bb
similarity index 84%
rename from meta/recipes-graphics/xorg-lib/libxres_1.2.2.bb
rename to meta/recipes-graphics/xorg-lib/libxres_1.2.3.bb
index 72b28d9107..b9c71d4073 100644
--- a/meta/recipes-graphics/xorg-lib/libxres_1.2.2.bb
+++ b/meta/recipes-graphics/xorg-lib/libxres_1.2.3.bb
@@ -16,4 +16,4 @@ PE = "1"
 
 XORG_PN = "libXres"
 
-SRC_URI[sha256sum] = "9a7446f3484b9b7538ac5ee30d2c1ce9e5b7fbbaf1440e02f6cca186a1fa745f"
+SRC_URI[sha256sum] = "d2de8f5401d6c86a8992791654547eb8def585dfdc0c08cc16e24ef6aeeb69dc"
-- 
2.43.0


