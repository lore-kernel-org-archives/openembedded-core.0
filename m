Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 253D4CF6C08
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 08:22:53 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1604.1767774163019123820
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 00:22:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mG2AwHv3;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1767774164; x=1799310164;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=hLT5cW1cz6JQY0ZeN8vwOZZEOuC8CNh21dSFpAyWxKQ=;
  b=mG2AwHv3gEiKzcLidCHGf9fplQCPQXinYhyq4zmBKiGFaAh7xa5VD1xg
   QP1I5vFQEzVCyGmnEG4NHTYRTzGvM127QEQMbG23u64KlYMvDfb4SGbfL
   gVkviaiyJtb1vht2D5g6+V9JS9tDYx7gqjNyZYQBbB0dviVR6s4M2mCbZ
   IP8xlCo74X5X5gXhB8kWw72SuCMWMgIqb+X/XWEZL0loJeSoiqRGjSe1n
   VG/ad+kZeoXyNc6JbLR06WiAJoYmGpcXuXmGsz4jy9Nx/DKVUIGosWJSa
   mefi3MWRjrC2JU74OYJNsbleZ+JnhET2JFxL05D2YG+VL1SGlUD27FAD8
   g==;
X-CSE-ConnectionGUID: L9YBdFEKTN2yQKTQyVJ6Ew==
X-CSE-MsgGUID: qFh669/BRMO5O3+4lNZ3Gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="225018372"
X-IronPort-AV: E=Sophos;i="6.21,207,1763391600"; 
   d="scan'208";a="225018372"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([51.138.80.169])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 17:22:42 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 210A91C00092
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Jan 2026 08:22:41 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id C31A11C0CAEB
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Jan 2026 08:22:40 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 813491004B3A
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Jan 2026 08:22:38 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] python3-roman-numerals-py: upgrade 3.1.0 -> 4.1.0
Date: Wed,  7 Jan 2026 16:22:33 +0800
Message-ID: <20260107082233.803-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 08:22:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228959

Changelog:
  Restore LICENCE.rst in the roman-numerals-py meta-package
  Add some debug assertions for unsafe blocks

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...umerals-py_3.1.0.bb => python3-roman-numerals-py_4.1.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-roman-numerals-py_3.1.0.bb => python3-roman-numerals-py_4.1.0.bb} (68%)

diff --git a/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb b/meta/recipes-devtools/python/python3-roman-numerals-py_4.1.0.bb
similarity index 68%
rename from meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb
rename to meta/recipes-devtools/python/python3-roman-numerals-py_4.1.0.bb
index 9a76df0de2..8689a6315f 100644
--- a/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb
+++ b/meta/recipes-devtools/python/python3-roman-numerals-py_4.1.0.bb
@@ -3,10 +3,10 @@ HOMEPAGE = "https://github.com/AA-Turner/roman-numerals/"
 LICENSE = "0BSD & CC0-1.0"
 LIC_FILES_CHKSUM = "file://LICENCE.rst;md5=bfcc8b16e42929aafeb9d414360bc2fd"
 
-SRC_URI[sha256sum] = "be4bf804f083a4ce001b5eb7e3c0862479d10f94c936f6c4e5f250aa5ff5bd2d"
+SRC_URI[sha256sum] = "f5d7b2b4ca52dd855ef7ab8eb3590f428c0b1ea480736ce32b01fef2a5f8daf9"
 PYPI_PACKAGE = "roman_numerals_py"
 UPSTREAM_CHECK_PYPI_PACKAGE = "roman_numerals_py"
 
-inherit pypi python_flit_core
+inherit pypi python_flit_core python_setuptools_build_meta
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


