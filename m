Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55E7CC7EE2C
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 09:17:03 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.26273.1750065419322996396
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jun 2025 02:16:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LkfpL6F2;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1750065419; x=1781601419;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QxRoUcIdkLfDllHAlY7/t67RAUd9RpNwhFBJv2nGShk=;
  b=LkfpL6F2rGxtll3wSWOrf+hvZ0WqiyM24Rbil27E7FF1QMqS4OOfM6E9
   j2MOaZ2OuJAMZaBflHcG6hcdtcbt4K6o1NM9O0mDcQT/SwHtfKCjZP1zB
   Ik7v1n/nqTY9X/6zEwmqZ4YpFl1DchYgQ0dwb7F/tyL7RZOcQHvkR110w
   CSrmG5Gk8F5dPBK1jjwWbirmPwfz22ER7+RAIA7MYtTo54CyOrwzjpFLQ
   5leP0noljZx6W5p0fq2ZfJdNRJAFXNlVIHTrpa6l7GvtVF2rvnYoem8wX
   0vNvwERE8E4mpcGQhJ42LMu+ENnNEQ9vXg13en1MSBf8feHogBeyxYpgm
   A==;
X-CSE-ConnectionGUID: Mu+OFeL/TVuQ1ZFNtzhaJg==
X-CSE-MsgGUID: c/R5HYJMSn6oEdvVGVvVIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="190834241"
X-IronPort-AV: E=Sophos;i="6.16,240,1744038000"; 
   d="scan'208";a="190834241"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 18:16:56 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 45DBAC68FB
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 18:16:54 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id E6B87CFB67
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 18:16:53 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 749A61A0073;
	Mon, 16 Jun 2025 17:16:53 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 16/24] python3-hypothesis: upgrade 6.132.0 -> 6.135.9
Date: Mon, 16 Jun 2025 17:16:34 +0800
Message-ID: <20250616091643.918-16-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250616091643.918-1-wangmy@fujitsu.com>
References: <20250616091643.918-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 09:17:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218792

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-hypothesis_6.132.0.bb => python3-hypothesis_6.135.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.132.0.bb => python3-hypothesis_6.135.9.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.132.0.bb b/meta/recipes-devtools/python/python3-hypothesis_6.135.9.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.132.0.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.135.9.bb
index 52688b8765..efc5229fbc 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.132.0.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.135.9.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "55868060add41baa6176ed9c3456655678d140c74e3514bdf03381dae6391403"
+SRC_URI[sha256sum] = "a80a256268b8af3d34d62be30f6bf4a7d099b2b762621cc5f3f1de65e7b98543"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.43.0


