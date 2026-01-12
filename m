Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA974C9EC66
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 10:26:32 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30086.1768213588863975024
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jan 2026 02:26:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DELcggko;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1768213589; x=1799749589;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=z+JsiyW5k5KWRn1kq0PexYArRVmf6+pmgZ/jKxuFL70=;
  b=DELcggkoa9BaBz1EgkYoQaSb46qkP0UuJjRPUbAdGjl3uz72EpD78GKq
   bDFbHFt85KQXUJr2BaOZcKSVGiioIsBdQ47L3d14HMy6HI6GPKsGpasLE
   NE4zHGU/PBK/qGTr28hrcxLhA4E4rpzHOIQheQMCoHop5nAfjr4L+OwWE
   FvmDF7P/rFBo1zcDj3DN2NqZIabcUE9ibHXG98NNXgC9cGNJCnyn5Mm6e
   A1GJBqwm4qsndww8eKnujYBBJCcGpJHgHGVniJuRSyXVTPFepKEIyrRXm
   UuesgQCBiWRqAiQ+doFc3EQOmWAihq+vZvmFtmsHxQRUO4vXwRwiJAGZ/
   g==;
X-CSE-ConnectionGUID: p9WohONJToybTybYY9M76Q==
X-CSE-MsgGUID: x/ABXT43QTeDXz7N1zlRTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="225525958"
X-IronPort-AV: E=Sophos;i="6.21,219,1763391600"; 
   d="scan'208";a="225525958"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([20.61.8.234])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 19:26:27 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 0156A1C00090
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Jan 2026 10:26:27 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id AC0321800317
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Jan 2026 10:26:26 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 635DD18005EA
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Jan 2026 10:26:24 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 1/2] python3-roman-numerals-py: upgrade 3.1.0 -> 4.1.0
Date: Mon, 12 Jan 2026 18:24:53 +0800
Message-ID: <20260112102454.7235-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Jan 2026 10:26:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229201

1. Upstream has renamed roman_numerals-py to roman_numerals
https://pypi.org/project/roman-numerals-py/4.1.0/

2. Changelog
https://github.com/AA-Turner/roman-numerals/blob/master/CHANGES.rst

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...numerals-py_3.1.0.bb => python3-roman-numerals_4.1.0.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-roman-numerals-py_3.1.0.bb => python3-roman-numerals_4.1.0.bb} (60%)

diff --git a/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb b/meta/recipes-devtools/python/python3-roman-numerals_4.1.0.bb
similarity index 60%
rename from meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb
rename to meta/recipes-devtools/python/python3-roman-numerals_4.1.0.bb
index 9a76df0de2..7a97fd3b19 100644
--- a/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb
+++ b/meta/recipes-devtools/python/python3-roman-numerals_4.1.0.bb
@@ -3,9 +3,9 @@ HOMEPAGE = "https://github.com/AA-Turner/roman-numerals/"
 LICENSE = "0BSD & CC0-1.0"
 LIC_FILES_CHKSUM = "file://LICENCE.rst;md5=bfcc8b16e42929aafeb9d414360bc2fd"
 
-SRC_URI[sha256sum] = "be4bf804f083a4ce001b5eb7e3c0862479d10f94c936f6c4e5f250aa5ff5bd2d"
-PYPI_PACKAGE = "roman_numerals_py"
-UPSTREAM_CHECK_PYPI_PACKAGE = "roman_numerals_py"
+SRC_URI[sha256sum] = "1af8b147eb1405d5839e78aeb93131690495fe9da5c91856cb33ad55a7f1e5b2"
+PYPI_PACKAGE = "roman_numerals"
+UPSTREAM_CHECK_PYPI_PACKAGE = "roman_numerals"
 
 inherit pypi python_flit_core
 
-- 
2.43.0


