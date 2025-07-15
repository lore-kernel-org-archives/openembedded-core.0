Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27AE2C83F17
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 08:08:46 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.2996.1752566920226435210
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 01:08:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=h9+0ScjA;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1752566920; x=1784102920;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=T1Om0u6ei/+X6ZDow+LGk7mX//CNzpDwRdD6fgQXtlw=;
  b=h9+0ScjAIuMfv6d7TanYeTd2L6ygDigMCcG7t+Xz9brbHBhQzOiWvAt9
   /UNEdmxbuRizpj41pJRXhl2oqY81U81AeE4ZDMX66GIXx9LX9hb7t6R02
   9LBWOaoyOEPRtAfIx7PxFNyfDIEER7mC3t1Vt3F2Hro547JdJhNnbShLw
   Ob8MAE/8N7l5mIcyqCMc7rbcKorHSRzODmkOffrYPgNx99EqzfU2C5JDq
   KRoBdVFsXv0EVErIK43aYZuI1CZWYmwR8hKwehQPnHrjXnSygx3uYE515
   U2OF0NdK6/GIc9atWef0XcRN0M4GbT5q3mz8gKRkWjlkgYIJ8HswUtEj3
   w==;
X-CSE-ConnectionGUID: QCyA1onqSaepWImFfZF6yw==
X-CSE-MsgGUID: JnzcGs2ORZOfHpInYcewaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="194841300"
X-IronPort-AV: E=Sophos;i="6.16,313,1744038000"; 
   d="scan'208";a="194841300"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([51.138.80.169])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 17:08:39 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id CB7391548
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 08:08:38 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 25D8F1C002BA
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 08:08:38 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 753B21A008D;
	Tue, 15 Jul 2025 16:08:34 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 19/19] wayland: upgrade 1.23.1 -> 1.24.0
Date: Tue, 15 Jul 2025 16:08:19 +0800
Message-ID: <20250715080819.622-19-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250715080819.622-1-wangmy@fujitsu.com>
References: <20250715080819.622-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 08:08:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220288

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../wayland/{wayland_1.23.1.bb => wayland_1.24.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{wayland_1.23.1.bb => wayland_1.24.0.bb} (96%)

diff --git a/meta/recipes-graphics/wayland/wayland_1.23.1.bb b/meta/recipes-graphics/wayland/wayland_1.24.0.bb
similarity index 96%
rename from meta/recipes-graphics/wayland/wayland_1.23.1.bb
rename to meta/recipes-graphics/wayland/wayland_1.24.0.bb
index 3a5d91be04..5fb7951781 100644
--- a/meta/recipes-graphics/wayland/wayland_1.23.1.bb
+++ b/meta/recipes-graphics/wayland/wayland_1.24.0.bb
@@ -16,7 +16,7 @@ SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland/-/releases/${PV}/downl
            file://run-ptest \
            file://0001-build-Fix-strndup-detection-on-MinGW.patch \
            "
-SRC_URI[sha256sum] = "864fb2a8399e2d0ec39d56e9d9b753c093775beadc6022ce81f441929a81e5ed"
+SRC_URI[sha256sum] = "82892487a01ad67b334eca83b54317a7c86a03a89cfadacfef5211f11a5d0536"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/wayland/wayland/-/tags"
 UPSTREAM_CHECK_REGEX = "releases/(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
-- 
2.43.0


