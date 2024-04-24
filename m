Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 019B0C3DA40
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 08:43:15 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.11723.1713948185262143713
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Apr 2024 01:43:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=nR9uCUV3;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713948187; x=1745484187;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=gu8hHdPJKJiEVEI13glLIJguHrPC7lqXQCU6lUNBOOQ=;
  b=nR9uCUV33SbhlS9vaXjHXnchPatyGknzO+YoQoJL4pxVet2Q1LSj2/7T
   b/9Rb6n1W9Rfeyd0kpPcsHOryb8SqpAUlDg2CQ4zOiYxXnZL/TtpqOCBu
   1FBgLh6/ICuayQJrI8Vc07erzFWiQv8aU3BHAZFN2EBB+ObFpcdGb38+F
   Rm0+SvbWNlq4sOdAQQkYfvXgcZdfckhuEIxT0Qq2hpTIgzyn66y5guVHo
   jgG0gN3zAg9ZdMOk0fqdHUkR9vjuoNsv27eN1W6IJs1WAgd8FRDS6IEX+
   BBoLI+Wy/aQIu/AxC8T2AP6ScRUXp42cMLNFnTMLuuNefd3noPl7+iepV
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="135830465"
X-IronPort-AV: E=Sophos;i="6.07,225,1708354800"; 
   d="scan'208";a="135830465"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 17:43:05 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 56449D9DC1
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:43:03 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8FBBADE7E5
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:43:02 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1F2AA202CE122
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:43:02 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BFF071A000A;
	Wed, 24 Apr 2024 16:43:01 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 21/38] python3-cython: upgrade 3.0.9 -> 3.0.10
Date: Wed, 24 Apr 2024 16:42:15 +0800
Message-Id: <1713948152-13501-21-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713948152-13501-1-git-send-email-wangmy@fujitsu.com>
References: <1713948152-13501-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28340.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28340.006
X-TMASE-Result: 10-5.477100-10.000000
X-TMASE-MatchedRID: KEcVumlYY7qjz0nOeth/yUIIxwDaU5mrYPFgliRo7bn+Aw16GgqpO9CI
	dFezA+nmlHI332PB9T0qrvwor1IuhLMviKTfZG4+dXu122+iJtoxVUWGXs3C8/Rv8t35IK7xdCI
	Zl7SNYAztYHgCEZbcR1F6d2QvgJgSh2EU0vzIu28tMfCdg6KRDWhADSmwSTddsrDwfHQQaK2WUm
	v7Tno2kCqq0O5S3DJ8ivFp0d/OglarUIsIb6+8FE7nLUqYrlslFIuBIWrdOeNfBKBbkRhUdWBQc
	oax9FB3WyXEB937q1d5OPD8XJFfpB8TzIzimOwPC24oEZ6SpSlsZUSYh+N/ewADq1zQuI62WDEE
	UsKOsdzTp6mznuhri0OqXlQG8kzpXWpvhCvl/vARNjZ4q2PR94znpSppI3hSikDIyukJAUV4VDo
	QMrYUYQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 08:43:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198664

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* Cython generated incorrect self-casts when directly calling final methods of subtypes.
* Internal C names generated from C function signatures could become too long for MSVC.
* The "noexcept" warnings could be misleading in some cases.
* The "@cython.ufunc" implementation could generate incomplete C code.
* The "libcpp.complex" declarations could result in incorrect C++ code.
* Several tests were adapted to work with both NumPy 1.x and 2.0.
* C compiler warnings when the freelist implementation is disabled (e.g. on PyPy) were fixed.
  It can now be disabled explicitly with the C macro guard "CYTHON_USE_FREELISTS=0".
* Some C macro guards for feature flags were missing from the NOGIL Python configuration.
* Some recently added builtins were unconditionally looked up at module import time
  (if used by user code) that weren't available on all Python versions and could thus
  fail the import.
* A performance hint regarding exported pxd declarations was improved.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/python/python-cython.inc                  | 2 +-
 .../{python3-cython_3.0.9.bb => python3-cython_3.0.10.bb}       | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-cython_3.0.9.bb => python3-cython_3.0.10.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-cython.inc b/meta/recipes-devtools/python/python-cython.inc
index 2235aa9332..87a2e88a1a 100644
--- a/meta/recipes-devtools/python/python-cython.inc
+++ b/meta/recipes-devtools/python/python-cython.inc
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=61c3ee8961575861fa86c7e62bc9f69c"
 PYPI_PACKAGE = "Cython"
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[sha256sum] = "a2d354f059d1f055d34cfaa62c5b68bc78ac2ceab6407148d47fb508cf3ba4f3"
+SRC_URI[sha256sum] = "dcc96739331fb854dcf503f94607576cfe8488066c61ca50dfd55836f132de99"
 UPSTREAM_CHECK_REGEX = "Cython-(?P<pver>.*)\.tar"
 
 inherit pypi
diff --git a/meta/recipes-devtools/python/python3-cython_3.0.9.bb b/meta/recipes-devtools/python/python3-cython_3.0.10.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-cython_3.0.9.bb
rename to meta/recipes-devtools/python/python3-cython_3.0.10.bb
-- 
2.34.1


