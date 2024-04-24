Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2F29C25B75
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 08:43:14 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.11790.1713948189281173293
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Apr 2024 01:43:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rOKF2Qxr;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713948189; x=1745484189;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=pEoiTW0xXeVQb0s7Qifd3fcIdxv/cgdgi2WvJjMuTLs=;
  b=rOKF2QxrI6iyztS7MQIqXwakWVpsF02GK/zJ8+7wNDlnYeYbxo9RodJH
   Z7atG5N3QZWeOgiceLjLm6lH4rxfplJzZOPRF4wbKtRT85+q3GL3t0xe/
   HzRt28UUn/LgPOSR2yL7N/oExclYiYmNmw4znL/Oz29UST+wFwqx9Av19
   5AmV5mRL+ldxLuoJ3mLMKQxjjG+pvCXzpQZkPJ6/6tPNJ2rCefCwPu2iW
   jdmr4mU3XR0OtrznD4aHEEekB7h7CFja00JMkhg/pdvXiHeMCESkbbAWX
   5xqbpbkaBlfgnXvWTCugFhEwBPLs6rdF7tA3lJIGg1hn58gkH9o1/+TA+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="145017033"
X-IronPort-AV: E=Sophos;i="6.07,225,1708354800"; 
   d="scan'208";a="145017033"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 17:43:06 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id B0C3FE8F23
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:43:04 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id E6A96DB9FC
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:43:03 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 80163220024
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:43:03 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2D4311A000B;
	Wed, 24 Apr 2024 16:43:03 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 24/38] python3-hypothesis: upgrade 6.99.4 -> 6.100.1
Date: Wed, 24 Apr 2024 16:42:18 +0800
Message-Id: <1713948152-13501-24-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713948152-13501-1-git-send-email-wangmy@fujitsu.com>
References: <1713948152-13501-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28340.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28340.006
X-TMASE-Result: 10--2.827600-10.000000
X-TMASE-MatchedRID: +qH7TW9/Rkejz0nOeth/yUIIxwDaU5mrtOtXYgbXjdeMJxigKCCiS4Ah
	acUmDrNs6L/fmYG+mejzue7fWLKKrc1YNkuvGNxvgvmNrsT46HLYUDvAr2Y/1xSWRpbU2lCMcDC
	LyqWYjajsdJOrIBnRuSAGr+KzdTm7otihZr0PA+bece0aRiX9Wo5A6wTicMJ01YzbHoRn9L3ATI
	MkKMaIrOArY2JkKW9pBdRHP6FCEZVaQiLka9EcSk7nLUqYrlslNmVjpriVEtkR1hH2Ye3qWJ6ba
	/D5x6cp4vM1YF6AJbY1+l7XRPciwwtuKBGekqUpnH7sbImOEBRtCCLDSDVYTaSWl7epmU3LMR90
	yUhOCUZQj7+uSGkxmSJ4hAlEYX/tyY9OzzFFdi7u3zlr4aFYotR8hO/TuQGrpHJtVWAKm8PsfZ9
	V6Q6rCZgvUoiYqGrVm457vI8IG8B/Y4nFsBWAdD6Qrn3xh/cy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 08:43:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198669

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
-improve a rare error message for flaky tests
-The from_dtype() function no longer generates NaT ("not-a-time") values for
 the datetime64 or timedelta64 dtypes if passed allow_nan=False
-includes the backend setting in the how_generated field of our observability output.
-If you were running Python 3.13 (currently in alpha) with pytest-xdist and
 then attempted to pretty-print a lambda functions which was created using
 the eval() builtin, it would have raised an AssertionError.
-improves an internal invariant.
-fixes Hypothesis sometimes raising a Flaky error when generating collections
 of unique floats containing nan.
-continues our work on refactoring the shrinker
-continues our work on refactoring shrinker internals
-resolves PermissionError that come from creating databases on inaccessible paths.
-starts work on refactoring our shrinker internals. There is no user-visible change.
-fixes a longstanding performance problem in stateful testing

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...thon3-hypothesis_6.99.4.bb => python3-hypothesis_6.100.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.99.4.bb => python3-hypothesis_6.100.1.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.99.4.bb b/meta/recipes-devtools/python/python3-hypothesis_6.100.1.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.99.4.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.100.1.bb
index 64b8cf2c31..af7facfe7e 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.99.4.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.100.1.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "edc8f984dba5d1b69a6a4564246b7850fa7ec351d2b27c9e7a43c91deab8d45c"
+SRC_URI[sha256sum] = "ebff09d7fa4f1fb6a855a812baf17e578b4481b7b70ec6d96496210d1a4c6c35"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.34.1


