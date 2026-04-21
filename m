Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F3ADF89231
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 09:57:04 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20404.1776765413934295610
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 02:56:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Q9cg/SWS;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776765417; x=1808301417;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=C2JKhYP3a/qC0B4/OSOo5uKdPDrv3taF9npGw0qqzCw=;
  b=Q9cg/SWS7mR+g2lZA9pJk/xEJisuyfb+yukmyra69hfxu3f92m13GyF9
   4432qqeievIKRASzb/7qcSOndokhe2J4A1Pj23Frvf5flybp+gjZE3o+l
   fZOy/QtnTOfunpYc7i60EYFBO/gbreDA6IEzB/e7rzXVHfp1ZXE6z3r6P
   kQElI8komVzS6+e4gaRPJ2HAoAI7pIc1IU4pwYKV9T+hNUMDjkeeeWkyl
   W8rn2hW3adQKJ7J+50+yE7uGGfkpGlARRd+oXxgGg28mYK/8pJvKwGddT
   sLkZnHJEY5HNx6FQmgphqZjnG/dBdrkeu/RMkqJLbplGx49y5jS9yUp9U
   g==;
X-CSE-ConnectionGUID: 7Zmp+o5MRveP+kuCtGsVRw==
X-CSE-MsgGUID: VxdLrPcOScSbRnZ8/UFbeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="237630083"
X-IronPort-AV: E=Sophos;i="6.23,191,1770562800"; 
   d="scan'208";a="237630083"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 18:56:56 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 8D9815C25
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:56:55 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 3CC5B1C00118
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:56:55 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id B682614000E6;
	Tue, 21 Apr 2026 09:56:52 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 27/49] python3-lxml: upgrade 6.0.2 -> 6.0.4
Date: Tue, 21 Apr 2026 17:55:37 +0800
Message-ID: <20260421095559.1856-27-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260421095559.1856-1-wangmy@fujitsu.com>
References: <20260421095559.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:57:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235635

From: Wang Mingyu <wangmy@fujitsu.com>

Bugs fixed
----------
- Several out of memory error cases now raise "MemoryError" that were not
  handled before.
- Slicing with large step values (outside of "+/- sys.maxsize") could trigger
  undefined C behaviour.
- LP#2125399: Some failing tests were fixed or disabled in PyPy.
- LP#2138421: Memory leak in error cases when setting the "public_id" or
  "system_url" of a document.
- Memory leak in case of a memory allocation failure when copying document
  subtrees.
- When mapping an XPath result to Python failed, the result memory could leak.
- When preparing an XSLT transform failed, the XSLT parameter memory could
  leak.
- LP#2148019: Spurious MemoryError during namespace cleanup.

Other changes
-------------
- Built using Cython 3.2.4.
- Binary wheels use zlib 1.3.2.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-lxml_6.0.2.bb => python3-lxml_6.0.4.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-lxml_6.0.2.bb => python3-lxml_6.0.4.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-lxml_6.0.2.bb b/meta/recipes-devtools/python/python3-lxml_6.0.4.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-lxml_6.0.2.bb
rename to meta/recipes-devtools/python/python3-lxml_6.0.4.bb
index 876fda93b6..1257534c0f 100644
--- a/meta/recipes-devtools/python/python3-lxml_6.0.2.bb
+++ b/meta/recipes-devtools/python/python3-lxml_6.0.4.bb
@@ -18,7 +18,7 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
 
 DEPENDS += "libxml2 libxslt"
 
-SRC_URI[sha256sum] = "cd79f3367bd74b317dda655dc8fcfa304d9eb6e4fb06b7168c5cf27f96e0cd62"
+SRC_URI[sha256sum] = "4137516be2a90775f99d8ef80ec0283f8d78b5d8bd4630ff20163b72e7e9abf2"
 
 SRC_URI += "${PYPI_SRC_URI}"
 inherit pkgconfig pypi setuptools3
-- 
2.43.0


