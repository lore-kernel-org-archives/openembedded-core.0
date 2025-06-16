Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FA00C7EE2A
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 09:17:03 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.26269.1750065415509386391
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jun 2025 02:16:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=QPD5/s8E;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1750065415; x=1781601415;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hgz/sLgPCNOPvsuqqZGKYW1hBY8ZiOg1Xk08AbX5Wts=;
  b=QPD5/s8EIGGFMFYx+LbVjKFPnDeob4JZhuUKB9012WwxhfTWr8tstc6e
   VjgeiNgHIeyTfJ1kE2LKcLQdCe1ehMkkxGCIPbTQAXmTAwf8RiOPNqsDn
   ku9BVS0KxYGLc6TO3Rdqun4K8dPw9HEw3AiVk6RBMkbnnD3802Kw056zu
   UHiAREmsrOw0SaGNppUB49GW8/CD488TG5kewruCa03vk5KCJPZIExHLL
   nttbQgBqpKHZQY44kpgYfJxn3zUmZRpCH3Mnp7e89OT8Wh4xbXXh/mKVW
   SNO+qesW/GUivZOl/pYTTNWi3hTDv+Ty5F3PN5faG3PjLJvGQEafxqOF5
   A==;
X-CSE-ConnectionGUID: D0KAgt5jQ8KBHs3C5FnbyA==
X-CSE-MsgGUID: maoxzY59R52UShX9dDXsJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="191320666"
X-IronPort-AV: E=Sophos;i="6.16,240,1744038000"; 
   d="scan'208";a="191320666"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 18:16:53 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id C5EB4E9E80
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 18:16:50 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6EB78D7624
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 18:16:50 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 06F5A1A0073;
	Mon, 16 Jun 2025 17:16:49 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 07/24] libjpeg-turbo: upgrade 3.1.0 -> 3.1.1
Date: Mon, 16 Jun 2025 17:16:25 +0800
Message-ID: <20250616091643.918-7-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250616091643.918-1-wangmy@fujitsu.com>
References: <20250616091643.918-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 09:17:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218781

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
- Hardened the libjpeg API against hypothetical calling applications that may
  erroneously change the value of the 'data_precision' field in
  'jpeg_compress_struct' or 'jpeg_decompress_struct' after calling
  'jpeg_start_compress()' or 'jpeg_start_decompress()'.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../jpeg/{libjpeg-turbo_3.1.0.bb => libjpeg-turbo_3.1.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/jpeg/{libjpeg-turbo_3.1.0.bb => libjpeg-turbo_3.1.1.bb} (97%)

diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.0.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.1.bb
similarity index 97%
rename from meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.0.bb
rename to meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.1.bb
index a5f1932a90..2b39a4c1d9 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.0.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.1.bb
@@ -9,7 +9,7 @@ DEPENDS:append:x86-64:class-target = " nasm-native"
 DEPENDS:append:x86:class-target = " nasm-native"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.gz"
-SRC_URI[sha256sum] = "9564c72b1dfd1d6fe6274c5f95a8d989b59854575d4bbee44ade7bc17aa9bc93"
+SRC_URI[sha256sum] = "aadc97ea91f6ef078b0ae3a62bba69e008d9a7db19b34e4ac973b19b71b4217c"
 
 PE = "1"
 
-- 
2.43.0


