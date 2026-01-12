Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACD8FD277C9
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 10:10:42 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30173.1768212634917229329
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jan 2026 02:10:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=WPaA6hfB;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1768212635; x=1799748635;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=z+JsiyW5k5KWRn1kq0PexYArRVmf6+pmgZ/jKxuFL70=;
  b=WPaA6hfBs8jTUTC69znaV4T8OJiGWW6rvF0T8hI6nbqpy6S5r2uWdJtT
   Yrjw4lmWtfvAyuDh0GUQuULUPOXROSdFCBU77s1qsCKxmXl+rJgRYXWWD
   7gIeCGON/GX4Y6OO0nq0E89+FF8R1LX3lrouWXPQMRNCtTbVuUohnHVZs
   e8pzNQXmjXP0vQ6wwHDBtavNTZ0i3Bg4Z/hm3FLKMdWR533oZPimw6hwt
   4WqGcBx/a6EqIPrncr9EFtBBLDaErcTJwqEw1NejiImpvXYha9rulx8fz
   3fPsgx0zfr4wrJ/5ZzUnvoMJX5/gbjGVOrc2UgAV7x922GyDQYYKQzlL/
   g==;
X-CSE-ConnectionGUID: j7Duwc1fTHGQ1FPjZrjpfA==
X-CSE-MsgGUID: MAbsjiV/Rm6/X5bk5IyPGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="229494176"
X-IronPort-AV: E=Sophos;i="6.21,219,1763391600"; 
   d="scan'208";a="229494176"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 19:10:33 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 4BF231000343
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Jan 2026 10:10:33 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 02F06C006D6
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Jan 2026 10:10:33 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id C067C20000EE
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Jan 2026 10:10:30 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH v3] python3-roman-numerals-py: upgrade 3.1.0 -> 4.1.0
Date: Mon, 12 Jan 2026 18:10:27 +0800
Message-ID: <20260112101027.7153-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Jan 2026 10:10:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229198

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


