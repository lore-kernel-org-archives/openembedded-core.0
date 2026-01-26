Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4CE8CF65FA
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 12:36:16 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18479.1769430968981110571
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jan 2026 04:36:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Y+8thywm;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769430969; x=1800966969;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yIDfTYeaWGJMVlgbeII1jH6pVDVBy1D/D15oflLWKVw=;
  b=Y+8thywmV/z36sZlo5+5K2BsFq45esJ+zhThz7nW5GTixkmTcUHhXF1e
   NZbB7HPGEyieTY8I5T/G7qpmrI3A0yi8C+3TaKIPmC5J+kAmEmAuMgI+G
   QtkTRy6TrQ0bAD30/GTPUz3Qp0PQQyhelOfpwAae8W59tBWK5hwWgoww5
   dZRWbyfgv11FjqdhPcd//+zExO6ClRtReDe/8MBLEhT18ntzIHFOOy3rO
   euTb8S1MEvTf4tKhWXv10/Ub/ZrEdvjJQbz9wkLffd/yc5vMAvBKdwr3l
   BnufbVLUzMLB/InExDKtX7sfPjwWgWFxgvHqE8TSEyaiEsbnp/5sCEB9M
   g==;
X-CSE-ConnectionGUID: zO6RmRlXRlOP3O66KrMVLw==
X-CSE-MsgGUID: jH+UKmDATdGH7/TzSy6tQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="214548844"
X-IronPort-AV: E=Sophos;i="6.21,255,1763391600"; 
   d="scan'208";a="214548844"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.128])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 21:36:07 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 7E0271C00673
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 12:36:07 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 3061C18000C4
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 12:36:07 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id B4CD8405E02;
	Mon, 26 Jan 2026 12:36:04 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 11/17] python3-pyasn1: upgrade 0.6.1 -> 0.6.2
Date: Mon, 26 Jan 2026 20:35:10 +0800
Message-ID: <20260126123517.1020-11-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260126123517.1020-1-wangmy@fujitsu.com>
References: <20260126123517.1020-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 12:36:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229994

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pyasn1_0.6.1.bb => python3-pyasn1_0.6.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyasn1_0.6.1.bb => python3-pyasn1_0.6.2.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-pyasn1_0.6.1.bb b/meta/recipes-devtools/python/python3-pyasn1_0.6.2.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-pyasn1_0.6.1.bb
rename to meta/recipes-devtools/python/python3-pyasn1_0.6.2.bb
index 820ef27d2b..01157e251e 100644
--- a/meta/recipes-devtools/python/python3-pyasn1_0.6.1.bb
+++ b/meta/recipes-devtools/python/python3-pyasn1_0.6.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://pyasn1.sourceforge.net/"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=190f79253908c986e6cacf380c3a5f6d"
 
-SRC_URI[sha256sum] = "6f580d2bdd84365380830acf45550f2511469f673cb4a5ae3857a3170128b034"
+SRC_URI[sha256sum] = "9b59a2b25ba7e4f8197db7686c09fb33e658b98339fadb826e9512629017833b"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-- 
2.43.0


