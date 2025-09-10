Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 369C8CA101F
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 09:18:00 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.13166.1757495870541028021
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Sep 2025 02:17:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=B+DWGBIO;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1757495871; x=1789031871;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IrjL9ZWY+EalZIfdxCwGXcvexMMQoqHUED704ZLIjhE=;
  b=B+DWGBIOO1maQNYSiXVS34mytZUOTO25ZDFf/12l5DdN+EKWxhgPoO/2
   SKk4mD/N1T2Zuzfs40jYxRa1Jf9Z3Os4O3AEnTzMG3+R8Xi7UuZzYfa2u
   GR+VeQMNV8ruFvHXgLmXIo0jmvdwPxz5JHJUVFgS2cJnXT8loSjJ3GWLf
   3C4+dfPhifAUwM/3NokpqymaX7G2HfC4L4mnEEi7RO737n2WTMl/R3s3L
   f505OkXJN9EtIv88v+5GoBcdqYyhIUtRMqmA0Or2F5PVqtroO3kUT/byX
   tViA8gB4CL+vV4IcvIwmBXHJJTZLiLurBAKxO98SKa4SNj7GeilNnKrxm
   Q==;
X-CSE-ConnectionGUID: rvv9PAL0QTGvegtNQ0XFPw==
X-CSE-MsgGUID: UlLe7q2AS96bKmFeodMyYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="199856650"
X-IronPort-AV: E=Sophos;i="6.18,253,1751209200"; 
   d="scan'208";a="199856650"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.19])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 18:17:50 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id DE055C00355
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:49 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 991FA8D65CC
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:49 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTPS id EBDD61800B1F
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:47 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id DB4441A0096;
	Wed, 10 Sep 2025 17:17:44 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 36/40] ruby: upgrade 3.4.4 -> 3.4.5
Date: Wed, 10 Sep 2025 17:16:42 +0800
Message-ID: <20250910091646.998-36-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250910091646.998-1-wangmy@fujitsu.com>
References: <20250910091646.998-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:18:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223187

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/ruby/{ruby_3.4.4.bb => ruby_3.4.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/ruby/{ruby_3.4.4.bb => ruby_3.4.5.bb} (98%)

diff --git a/meta/recipes-devtools/ruby/ruby_3.4.4.bb b/meta/recipes-devtools/ruby/ruby_3.4.5.bb
similarity index 98%
rename from meta/recipes-devtools/ruby/ruby_3.4.4.bb
rename to meta/recipes-devtools/ruby/ruby_3.4.5.bb
index c532403339..b77d76578e 100644
--- a/meta/recipes-devtools/ruby/ruby_3.4.4.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.4.5.bb
@@ -49,7 +49,7 @@ do_configure:prepend() {
 
 DEPENDS:append:libc-musl = " libucontext"
 
-SRC_URI[sha256sum] = "a0597bfdf312e010efd1effaa8d7f1d7833146fdc17950caa8158ffa3dcbfa85"
+SRC_URI[sha256sum] = "1d88d8a27b442fdde4aa06dc99e86b0bbf0b288963d8433112dd5fac798fd5ee"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
-- 
2.43.0


