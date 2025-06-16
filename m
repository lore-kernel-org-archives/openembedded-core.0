Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75950C7EE30
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 09:17:03 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.26268.1750065413647293025
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jun 2025 02:16:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=i2gspGRR;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1750065415; x=1781601415;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3pLbm1OnMo7VPgbEwwHWNAtbY/eUDFjgIcaQovHBQFI=;
  b=i2gspGRRe1icluhkAb73WLLwOEC9DdeY4dubUeZMude1XWUzE3M6U0OY
   5sjJIaIpXNZT7d4uggnekbll8z57Ko+Pbks0cn7SCm1ahiuR6uO1IqY6y
   QB9O1kO17ZNz/fnaEY5sbearxjyEBclJrHitgSLdi0ma5QMvJEeGyzU5g
   WcCTGkG7NxnaQBlb1/ofy81low9seCRBxnO9ox+icBakJvTzgItPCh6dU
   tmrlAsetejW2YYoqYSoXU0gJTslYmyW65DZjr0THM/YO0Q1bkgHogXI+p
   YnlA9ubJWttFVzbgN1dp+V82aOx3xK1G0mVU2eFICDgnBmcU/2/zfPd5N
   w==;
X-CSE-ConnectionGUID: ZTzLtOg+SACRheLU0/UufA==
X-CSE-MsgGUID: PvedMAwsTdexwQuD0PXrBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="202102161"
X-IronPort-AV: E=Sophos;i="6.16,240,1744038000"; 
   d="scan'208";a="202102161"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 18:16:54 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id F2959C68FB
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 18:16:51 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 988D211C5B
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 18:16:51 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id CD9131A0073;
	Mon, 16 Jun 2025 17:16:50 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 09/24] libsolv: upgrade 0.7.32 -> 0.7.33
Date: Mon, 16 Jun 2025 17:16:27 +0800
Message-ID: <20250616091643.918-9-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250616091643.918-1-wangmy@fujitsu.com>
References: <20250616091643.918-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 09:17:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218780

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- selected bug fixes:
  * improve transaction ordering by allowing more uninst->uninst
    edges
  * implement color filtering when adding update targets
- new features:
  * support orderwithrequires dependencies in susedata.xml

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libsolv/{libsolv_0.7.32.bb => libsolv_0.7.33.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libsolv/{libsolv_0.7.32.bb => libsolv_0.7.33.bb} (95%)

diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.32.bb b/meta/recipes-extended/libsolv/libsolv_0.7.33.bb
similarity index 95%
rename from meta/recipes-extended/libsolv/libsolv_0.7.32.bb
rename to meta/recipes-extended/libsolv/libsolv_0.7.33.bb
index 71786e40dc..7584251420 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.32.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.33.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/openSUSE/libsolv.git;branch=master;protocol=https \
            file://0001-utils-Conside-musl-when-wrapping-qsort_r.patch \
 "
 
-SRCREV = "95f64952e3270deb6be30ae4b786cae5c114c807"
+SRCREV = "9fb855d872139fb1ebebec4c892b338fccda69ba"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
-- 
2.43.0


