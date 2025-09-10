Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B806CAC592
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 09:17:09 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.13217.1757495822248821987
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Sep 2025 02:17:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=FDVUl+QK;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1757495825; x=1789031825;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=x3m9pTiVAJXwosd5fjhrU00yClIKcbNL/+qqEcDrRg0=;
  b=FDVUl+QKHPcMbUMgLX1v+ExKNTCzEuCKyfbvbDWqPJikJ5QtLxH/qrey
   cz9QKMNZbFNvkY28AJKhBzGbDN5ISkxcnm63GOWOjvYNeAaRRU1xBJQKN
   Kq9UAkjRAui89iZ/HlUcjHvOA8DI0uLuRx7WcRn+HW6wkHaOd54yq/jAU
   AQdtIUobzqdT6cQEBNIJDeeEiOGKxJblmC5H5I16Cpjq7b0wERMVctS5m
   R1mutbLreUYg0t6jnxQNKQ70saAO1tq3NCUu9qOc+kuzwBgVukui19Pi5
   eowXhgnH+2/MZuWofU6qPd7e8DB/IlWIIS8ElNY6yuIVuSofG/VKD0oKo
   w==;
X-CSE-ConnectionGUID: AoItgOlQQwGZGE2+ANu1SA==
X-CSE-MsgGUID: E+Ya4uwRTYWwo4ARIm/L9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="212437418"
X-IronPort-AV: E=Sophos;i="6.18,253,1751209200"; 
   d="scan'208";a="212437418"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.128])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 18:17:04 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 60E891002BAA
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:03 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 1A2F6180024B
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:03 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTPS id 7F8301803FD3
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:01 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5F5C61A008A;
	Wed, 10 Sep 2025 17:16:57 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 07/40] enchant2: upgrade 2.8.10 -> 2.8.12
Date: Wed, 10 Sep 2025 17:16:13 +0800
Message-ID: <20250910091646.998-7-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250910091646.998-1-wangmy@fujitsu.com>
References: <20250910091646.998-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223159

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../enchant/{enchant2_2.8.10.bb => enchant2_2.8.12.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/enchant/{enchant2_2.8.10.bb => enchant2_2.8.12.bb} (91%)

diff --git a/meta/recipes-support/enchant/enchant2_2.8.10.bb b/meta/recipes-support/enchant/enchant2_2.8.12.bb
similarity index 91%
rename from meta/recipes-support/enchant/enchant2_2.8.10.bb
rename to meta/recipes-support/enchant/enchant2_2.8.12.bb
index e2965e9e10..84f0156bca 100644
--- a/meta/recipes-support/enchant/enchant2_2.8.10.bb
+++ b/meta/recipes-support/enchant/enchant2_2.8.12.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0 groff-native"
 inherit autotools pkgconfig github-releases
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/enchant-${PV}.tar.gz"
-SRC_URI[sha256sum] = "6db791265ace652c63a6d24f376f4c562b742284d70d3ccb9e1ce8be45b288c9"
+SRC_URI[sha256sum] = "20e5fab2ca0f95ba9d1ef5052fe5b028e3e1d66d4cdea6b9adfcbd3e524c2a09"
 
 GITHUB_BASE_URI = "https://github.com/rrthomas/enchant/releases"
 
-- 
2.43.0


