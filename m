Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB240E7719B
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 09:01:35 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.16404.1736240494288149787
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jan 2025 01:01:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=l4sQR1S5;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1736240494; x=1767776494;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=7oF74y5YGxge7pwVcev/2NO1ht9AwewDIYMmXI3jL30=;
  b=l4sQR1S5OsfIKJ+5hY5ibpe+htZ5713GPMo0KgQ+x7Yg7sWTy6UHJWDe
   WLoH0MCHABIeDw1eWV4IU2iE/z0Mue5pe/ZNcrEXRtTIiAk/dzUJB5CnJ
   DOwF8liP0jMCTTO7dac6lqQn9PVFIkGZaK0MlEidDg8fnzf5ooFiA+GAQ
   aEEj+o2JA84QP3gH+EHYKf+dnLuvnynahjfYWQMJFbYnsb/WzXxM7zLZO
   4YtJynGFILN4TeJitwaOaE/U57jpVOEvzyUV2BTo4Q1Vpj7gWd8o9BPGB
   WhTI8IuSEABDJ5+ykcKgyHvmnH68lvmWZiKarmP2+pD/cHZr0c9cKj6pX
   w==;
X-CSE-ConnectionGUID: XQdZ5fcQR3uU1nUsSLgMXg==
X-CSE-MsgGUID: mtRSVmZ9QUyxd2RCWbAsRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="174177448"
X-IronPort-AV: E=Sophos;i="6.12,295,1728918000"; 
   d="scan'208";a="174177448"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 18:01:32 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id BA7C1D501B
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:29 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 91EBED9698
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:29 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1A36440FF6
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:29 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C78F31A0073;
	Tue,  7 Jan 2025 17:01:28 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 04/13] libedit: upgrade 20240808-3.1 -> 20250104-3.1
Date: Tue,  7 Jan 2025 17:01:13 +0800
Message-Id: <1736240482-5243-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1736240482-5243-1-git-send-email-wangmy@fujitsu.com>
References: <1736240482-5243-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28908.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28908.003
X-TMASE-Result: 10-0.536900-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIAf/HImzvCGOeKNmNNd29XMKPrF7dK57PVBDonH99+VvlRTIgxjQat27Q
	sk///w2vi8zVgXoAltuJ5hXsnxp7jFnjKVTYbDMDEQdG7H66TyHEqm8QYBtMOce9YMjOXo61/IN
	rxSaEGXqUEQT4+kP2X4NOlF/NpqyVGqDcJTftnP2Jr2uYcwPUC84NgvQ8qNw9HZKSeDQO4Sg83i
	t8caHumgr6lqxbIXlHC3tMwY3ma2xUDj+dgUQVyTE7Co9fKv3w=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 09:01:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209436

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{libedit_20240808-3.1.bb => libedit_20250104-3.1.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/libedit/{libedit_20240808-3.1.bb => libedit_20250104-3.1.bb} (89%)

diff --git a/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb b/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb
similarity index 89%
rename from meta/recipes-devtools/libedit/libedit_20240808-3.1.bb
rename to meta/recipes-devtools/libedit/libedit_20250104-3.1.bb
index bf6ec8ebd3..cad24d8d65 100644
--- a/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb
+++ b/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb
@@ -13,7 +13,7 @@ inherit autotools
 SRC_URI = "http://www.thrysoee.dk/editline/${BP}.tar.gz \
            file://stdc-predef.patch \
           "
-SRC_URI[sha256sum] = "5f0573349d77c4a48967191cdd6634dd7aa5f6398c6a57fe037cc02696d6099f"
+SRC_URI[sha256sum] = "23792701694550a53720630cd1cd6167101b5773adddcb4104f7345b73a568ac"
 
 # configure hardcodes /usr/bin search path bypassing HOSTTOOLS
 CACHED_CONFIGUREVARS += "ac_cv_path_NROFF=/bin/false"
-- 
2.43.0


