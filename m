Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 997B6C55AB9
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 04:05:33 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9672.1785816316780011266
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 21:05:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=nJhLMZuD;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1785816325; x=1817352325;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RTeOvzxH8PqtigGnMy7l1QDPioz7Jyueo4Hu8Bb/5cQ=;
  b=nJhLMZuD1qP0pkVQUw0343Kuu8VjmBwSuuuoS3Ne5uI5Wu9HUvCCNsjh
   TXwb4wOrnK2pAjxfTkdmWXkLKdYaBwD+7mHlYzpVDh+Q5GcN/rbByxTDG
   Qg9zVpYRN7gI4xt8/B69Z++TRZ0W24q/EIPDb/l804IkFqeZa6/3FTpQH
   5P3rC2TzqccALWEfYnq8zWBjHKiBwbGMXOttJc0imSknNj/IcD2OblALD
   6hXKerjC7soRuAiUtSMvZtn/srNnL+TeNbsWcgDEoj86VJHnHsUhxI6Gj
   231Qwxl+b/Uj6JC0h0XLkPp2y55mxDZLZQQoLuwx7Y6AjZQ7S7diKJ2qb
   w==;
X-CSE-ConnectionGUID: pTyXJt0TQTGSeUr3GrlQow==
X-CSE-MsgGUID: 8NRT1CL3QimG+5din6VlJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="253187925"
X-IronPort-AV: E=Sophos;i="6.25,203,1779116400"; 
   d="scan'208";a="253187925"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 13:05:24 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id A7B1FA3B2
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Aug 2026 04:05:21 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 5BCF6180414E
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Aug 2026 04:05:21 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 83A551800514;
	Tue,  4 Aug 2026 04:05:19 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 4/8] python3-pip: upgrade 26.1.2 -> 26.2
Date: Tue,  4 Aug 2026 12:05:04 +0800
Message-ID: <20260804040509.1454-4-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260804040509.1454-1-wangmy@fujitsu.com>
References: <20260804040509.1454-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 04:05:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242680

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2026

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pip_26.1.2.bb => python3-pip_26.2.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pip_26.1.2.bb => python3-pip_26.2.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-pip_26.1.2.bb b/meta/recipes-devtools/python/python3-pip_26.2.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-pip_26.1.2.bb
rename to meta/recipes-devtools/python/python3-pip_26.2.bb
index 945aad1834..13ba2b9e5f 100644
--- a/meta/recipes-devtools/python/python3-pip_26.1.2.bb
+++ b/meta/recipes-devtools/python/python3-pip_26.2.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=63ec52baf95163b597008bb46db68030 \
                     file://src/pip/_vendor/certifi/LICENSE;md5=11618cb6a975948679286b1211bd573c \
                     file://src/pip/_vendor/distlib/LICENSE.txt;md5=f6a11430d5cd6e2cd3832ee94f22ddfc \
                     file://src/pip/_vendor/distro/LICENSE;md5=d2794c0df5b907fdace235a619d80314 \
-                    file://src/pip/_vendor/idna/LICENSE.md;md5=18a4795c19833413a7e2f1cb3cd3b143 \
+                    file://src/pip/_vendor/idna/LICENSE.md;md5=9a6c29079fc90c29d80332f44d2625f2 \
                     file://src/pip/_vendor/msgpack/COPYING;md5=cd9523181d9d4fbf7ffca52eaa2a5751 \
                     file://src/pip/_vendor/packaging/LICENSE;md5=faadaedca9251a90b205c9167578ce91 \
                     file://src/pip/_vendor/pkg_resources/LICENSE;md5=141643e11c48898150daa83802dbc65f \
@@ -26,7 +26,7 @@ inherit pypi python_setuptools_build_meta
 
 SRC_URI += "file://no_shebang_mangling.patch"
 
-SRC_URI[sha256sum] = "f49cd134c61cf2fd75e0ce2676db03e4054504a5a4986d00f8299ae632dc4605"
+SRC_URI[sha256sum] = "2d8542afcc84cdd8e846c2b36b2861fad1da376dd98f8e7113e9108a3c331690"
 
 CVE_PRODUCT = "pypa:pip"
 
-- 
2.43.0


