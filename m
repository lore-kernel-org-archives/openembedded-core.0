Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31055C369A4
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 06:49:55 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.9254.1727246984662502903
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 23:49:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=nBtUgifq;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727246985; x=1758782985;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=t40HAdLKevNZoPTL5tAB25IhyDnAOk0MfcZUJPrye1A=;
  b=nBtUgifqBmO/MkG3LowUuVeR8Ji0DSI3TwL4rBkcGDm3tr6cav7IGEa+
   qrAXe4N/98xrgMNnKQsSCvSe1rA+czT1gbBROB88jY50xM8TW/qhysSXH
   bB9KHrmeUw2TK8tks5Bz94aoXrFjhTVff0PIf9HLcKNAfZdJ8e3ryLPWa
   s94P09PvokB4TxyGPFjwsU4NlfwrT3sYudgG0pIPZOFH0C7LdeF4gnEg/
   WcYupcqneZgAFu2tOeo6LszQyUywIXOcoYNswTDdhrpebeMuy2wXZJ2eE
   GpTeDecP97Jow9+7LO9MYUy5DaMXLDP/EKgEHAfQChx5ztr+9W2SrD700
   A==;
X-CSE-ConnectionGUID: nha1xXmeQLKDv6wkjbQkdQ==
X-CSE-MsgGUID: WqryJqNhQRqlWXXm9FsZRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="153715122"
X-IronPort-AV: E=Sophos;i="6.10,256,1719846000"; 
   d="scan'208";a="153715122"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 15:49:41 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 68089DB3C9
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:39 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id A3B55CFBB2
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:38 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 38AED20086335
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:38 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id DC2E01A000A;
	Wed, 25 Sep 2024 14:49:37 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 14/47] libarchive: upgrade 3.7.4 -> 3.7.5
Date: Wed, 25 Sep 2024 14:48:47 +0800
Message-Id: <1727246960-20665-14-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
References: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28686.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28686.005
X-TMASE-Result: 10-0.618900-10.000000
X-TMASE-MatchedRID: N25sXaafkGCjz0nOeth/yTo39wOA02LhpxAd6mi1Ga14YeSlHZYFotxI
	EsjaZQAA0EpnicEQwmSWZt/1iXMs3k6ckvvckgJ1iV0ptmwZhq0OPDBPSvoRdL54YCapH5tA4bK
	KzrJaqbPlrLbFCE1wrDq5nIXYAYmwWcYSOWxqzbLR7uN8GOEHx4iAeZ2rVOJtj2iyfwmt0k9j8i
	9T/sSpPE41mULYHLPNhyF9iTv8DjI7mT8/EEC+/rGWmeVAULKHsxmxfL/bmMDI9EDAP/dpthJ7P
	fO8ragfGtPsII7bpSFNeWPWZS1UGTBoPsIJ2P3pgvmNrsT46HJUENBIMyKD0QfxTM57BPHD7v0M
	lFSLfmlNDQmQ8bbzv+affHI8kAmiUtG3fovCeXmVUcz8XpiS9HM0J0a6ZmxJM/dZg2GSzOU1TVv
	TmtWwCY5WJeNSPI1T6r8EH4FDUMdccQ8eam5EfRRFJJyf5BJeAaUQk5EZOUn6C0ePs7A07YVH0d
	q7wY7uR9Zhy3GxKcXccOG3tzSLmm/OwgmWU/67dAqQoxnYUrD5/JCdpzCRtMmVeE1X4U1nPcGaF
	f7+sa2KrDwb/rcxtxUrrirl0t916OAxkjgonfRTyZ1y9sjWHZLqPOO5dObQxMzMgJrM/hR6Fi1p
	V3LGbw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 06:49:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204907

From: Wang Mingyu <wangmy@fujitsu.com>

configurehack.patch
refreshed for 3.7.5

Changelog:
============
- fix multiple vulnerabilities identified by SAST
- cpio: ignore out-of-range gid/uid/size/ino and harden AFIO parsing
- lzop: prevent integer overflow
- rar4: protect copy_from_lzss_window_to_unp()
- rar4: fix CVE-2024-26256
- rar4: fix OOB in delta and audio filter
- rar4: fix out of boundary access with large files
- rar4: add boundary checks to rgb filter
- rar4: fix OOB access with unicode filenames
- rar5: clear 'data ready' cache on window buffer reallocs
- rpm: calculate huge header sizes correctly
- unzip: unify EOF handling
- util: fix out of boundary access in mktemp functions
- uu: stop processing if lines are too long
- 7zip: fix issue when skipping first file in 7zip archive that is a multiple of 65536 bytes
- ar: fix archive entries having no type
- lha: do not allow negative file sizes
- lha: fix integer truncation on 32-bit systems
- shar: check strdup return value
- rar5: don't try to read rediculously long names
- xar: fix another infinite loop and expat error handling
- many Windows fixes, cleanups and improvements

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libarchive/libarchive/configurehack.patch     | 15 ++++++++-------
 .../{libarchive_3.7.4.bb => libarchive_3.7.5.bb}  |  2 +-
 2 files changed, 9 insertions(+), 8 deletions(-)
 rename meta/recipes-extended/libarchive/{libarchive_3.7.4.bb => libarchive_3.7.5.bb} (96%)

diff --git a/meta/recipes-extended/libarchive/libarchive/configurehack.patch b/meta/recipes-extended/libarchive/libarchive/configurehack.patch
index 45fddd9147..1d416d4e6d 100644
--- a/meta/recipes-extended/libarchive/libarchive/configurehack.patch
+++ b/meta/recipes-extended/libarchive/libarchive/configurehack.patch
@@ -1,4 +1,8 @@
-To work with autoconf 2.73, tweak the macro ordering in configure.in.
+From 18d5b2ff6ba3bbe856777447e59ee4d3343b0131 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Thu, 27 Jul 2023 20:47:55 -0700
+Subject: [PATCH] To work with autoconf 2.73, tweak the macro ordering in
+ configure.in.
 
 Upstream-Status: Pending
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
@@ -7,10 +11,10 @@ Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
  1 file changed, 13 insertions(+), 13 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 503bb75..e3101da 100644
+index 227275a..b75eb87 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -414,6 +414,19 @@ if test "x$with_bz2lib" != "xno"; then
+@@ -429,6 +429,19 @@ if test "x$with_bz2lib" != "xno"; then
    esac
  fi
  
@@ -30,7 +34,7 @@ index 503bb75..e3101da 100644
  AC_ARG_WITH([libb2],
    AS_HELP_STRING([--without-libb2], [Don't build support for BLAKE2 through libb2]))
  
-@@ -678,19 +691,6 @@ fi
+@@ -693,19 +706,6 @@ fi
  
  AC_SUBST(DEAD_CODE_REMOVAL)
  
@@ -50,6 +54,3 @@ index 503bb75..e3101da 100644
  # Check for tm_gmtoff in struct tm
  AC_CHECK_MEMBERS([struct tm.tm_gmtoff, struct tm.__tm_gmtoff],,,
  [
--- 
-2.34.1
-
diff --git a/meta/recipes-extended/libarchive/libarchive_3.7.4.bb b/meta/recipes-extended/libarchive/libarchive_3.7.5.bb
similarity index 96%
rename from meta/recipes-extended/libarchive/libarchive_3.7.4.bb
rename to meta/recipes-extended/libarchive/libarchive_3.7.5.bb
index da85764116..15a307c2f5 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.7.4.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.7.5.bb
@@ -33,7 +33,7 @@ SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz"
 SRC_URI += "file://configurehack.patch"
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 
-SRC_URI[sha256sum] = "7875d49596286055b52439ed42f044bd8ad426aa4cc5aabd96bfe7abb971d5e8"
+SRC_URI[sha256sum] = "37556113fe44d77a7988f1ef88bf86ab68f53d11e85066ffd3c70157cc5110f1"
 
 CVE_STATUS[CVE-2023-30571] = "upstream-wontfix: upstream has documented that reported function is not thread-safe"
 
-- 
2.34.1


