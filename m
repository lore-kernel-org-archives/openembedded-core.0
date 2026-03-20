Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71AB7108B903
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 11:40:59 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10607.1774006851879672438
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Mar 2026 04:40:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=SSH+eZLw;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1774006852; x=1805542852;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=cQ59IYBtw9TLS3WyU3ffbWrAmVdSfgzJlgU91s0njMw=;
  b=SSH+eZLwKJGmFK34cOE+wkWvZRb5gkvtQf+fFfK/9okHJGyJ7zgYcg2n
   GT2Fw//sJkPKg1B0FAxQjJpntb2OvnXnkJPqVEXh+iuer3TyhRPJKUsSI
   k+kKho96naCyiim7fl9t8fNtJERuhzneEa3UPHJAj4lE2hC0V9BZFrxhq
   pvkh1XyFSzAY1Z+22/P0jL7QY14PpGUYGkLENsWX0ONazSLMRyXoEWlS3
   SbBAIMxbnsxiDTPZfYO6DIF6I3h725uPBnhpqCz+tWFEYtPWTCS8CLgWG
   Zfmn0ppHkWYQxuhF9s2/+N/QcV278vOz/3vOsnckNcdEOggJ8AqNwb2nj
   w==;
X-CSE-ConnectionGUID: pw13bFGPQRW8kU2ujaXGxA==
X-CSE-MsgGUID: 0qdT3BaKTTqLvm6HQEamCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="212982818"
X-IronPort-AV: E=Sophos;i="6.23,130,1770562800"; 
   d="scan'208";a="212982818"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 20:40:50 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 353CE1000148
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 11:40:50 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id D713D1C0028E
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 11:40:49 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id E488C1802193;
	Fri, 20 Mar 2026 11:40:46 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] rt-tests/hwlatdetect: upgrade 2.9 -> 2.10
Date: Fri, 20 Mar 2026 19:40:43 +0800
Message-ID: <20260320114043.2125-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 11:40:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233598

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch
refreshed for 2.10

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...kefile-Allow-for-CC-and-AR-to-be-overridden.patch | 12 ++++++++----
 meta/recipes-rt/rt-tests/rt-tests.inc                |  4 ++--
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch b/meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch
index fface76731..a39781908e 100644
--- a/meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch
+++ b/meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch
@@ -9,17 +9,18 @@ commit 7763cf316d7896fa05b816a46998f0827ab6e6eb.
 Signed-off-by: Randy Witt <randy.e.witt@intel.com>
 
 Upstream-Status: Inappropriate [other]
-
 ---
  Makefile | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile b/Makefile
-index 223a839..a735584 100644
+index 83d2a33..e757839 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -2,6 +2,6 @@
- VERSION = 2.8
+@@ -2,8 +2,8 @@
+ include feature/test-feature.mak
+ 
+ VERSION = 2.10
 -CC = $(CROSS_COMPILE)gcc
 -AR = $(CROSS_COMPILE)ar
 +CC ?= $(CROSS_COMPILE)gcc
@@ -27,3 +28,6 @@ index 223a839..a735584 100644
  
  OBJDIR = bld
  
+-- 
+2.43.0
+
diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc b/meta/recipes-rt/rt-tests/rt-tests.inc
index 2042768d5a..e782d990c8 100644
--- a/meta/recipes-rt/rt-tests/rt-tests.inc
+++ b/meta/recipes-rt/rt-tests/rt-tests.inc
@@ -1,5 +1,5 @@
-SRCREV = "9166c3f0bb9c5d3e31dc80aff165a5073b5ac5be"
-PV = "2.9"
+SRCREV = "40b14a2aac9449dfb07d4f9b4bd873fc3ea62f28"
+PV = "2.10"
 PE = "1"
 
 SRC_URI = "git://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git;branch=main;protocol=https;tag=v${PV}"
-- 
2.43.0


