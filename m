Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63CD7C369AE
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 00:52:16 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.63725.1744073526785789747
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 17:52:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=tVNuWEhv;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744073527; x=1775609527;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=1JdtCGLSOvQdy8mzl2bbZ60JpkUv5ubqa4J0wpRkTtY=;
  b=tVNuWEhvjL3TN/1F1lrTmIBVZOaS2NCxwCeUmN19s8Ek/kvPAbKvVSOw
   /lio41OQ1bN34JITuuu+xTKd+NmwVtPZzs8hNPiubT4A2RzcNmYclnSzf
   stJ4axKX96s79blXMPj51/yvqFCrgEboOWf2LC63nB4583d3B3Npo8npL
   lKDSeotpws+vFpoW+V2JcebO8A2f50aQeaz55AxLHdWLLOdIOvjhduw+P
   wimbApcYXHLobRtsjUw3k5aTXB1bSm8aEUU164AfpWeRc4kw1vzumnGC2
   CiTPCrQ+iJzAiIuFStNb6GcTtYhhRvoRoQBZBUr/1OsgrO27CgCYTPv0F
   w==;
X-CSE-ConnectionGUID: 564CDv6uTue6EDsRhRgw7Q==
X-CSE-MsgGUID: J315HePVRY2hxBO7WwAxxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="183070467"
X-IronPort-AV: E=Sophos;i="6.15,196,1739804400"; 
   d="scan'208";a="183070467"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 09:52:00 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4B8DAC2266
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Apr 2025 09:51:58 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0AC2FD4C00
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Apr 2025 09:51:58 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A64171A00A1;
	Tue,  8 Apr 2025 08:51:56 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 03/15] gawk: upgrade 5.3.1 -> 5.3.2
Date: Tue,  8 Apr 2025 08:51:30 +0800
Message-Id: <1744073502-27695-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1744073502-27695-1-git-send-email-wangmy@fujitsu.com>
References: <1744073502-27695-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 00:52:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214488

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Add-parameter-signatures-for-getenv-and-getopt.patch
removed since it's included in 5.3.2

0001-configure.ac-re-enable-disabled-printf-features.patch
refreshed for 5.3.2`

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ter-signatures-for-getenv-and-getopt.patch | 54 -------------------
 ...c-re-enable-disabled-printf-features.patch |  8 +--
 .../gawk/{gawk_5.3.1.bb => gawk_5.3.2.bb}     |  3 +-
 3 files changed, 5 insertions(+), 60 deletions(-)
 delete mode 100644 meta/recipes-extended/gawk/gawk/0001-Add-parameter-signatures-for-getenv-and-getopt.patch
 rename meta/recipes-extended/gawk/{gawk_5.3.1.bb => gawk_5.3.2.bb} (94%)

diff --git a/meta/recipes-extended/gawk/gawk/0001-Add-parameter-signatures-for-getenv-and-getopt.patch b/meta/recipes-extended/gawk/gawk/0001-Add-parameter-signatures-for-getenv-and-getopt.patch
deleted file mode 100644
index 7ed615a881..0000000000
--- a/meta/recipes-extended/gawk/gawk/0001-Add-parameter-signatures-for-getenv-and-getopt.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 4a8352eeaa99bbea3461696855c973447e87abdd Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 22 Mar 2025 15:14:16 -0700
-Subject: [PATCH] Add parameter signatures for getenv() and getopt()
-
-GCC-15 complains about it when building for musl C library
-
-Upstream-Status: Submitted [https://lists.gnu.org/archive/html/bug-gawk/2025-03/msg00027.html]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- missing_d/fnmatch.c | 2 +-
- support/getopt.c    | 2 +-
- support/getopt.h    | 2 +-
- 3 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/missing_d/fnmatch.c b/missing_d/fnmatch.c
-index ccb7e34..7f97fbf 100644
---- a/missing_d/fnmatch.c
-+++ b/missing_d/fnmatch.c
-@@ -121,7 +121,7 @@ USA.  */
-    whose names are inconsistent.  */
- 
- # if !defined _LIBC && !defined getenv
--extern char *getenv ();
-+extern char *getenv (const char*);
- # endif
- 
- # ifndef errno
-diff --git a/support/getopt.c b/support/getopt.c
-index eeb71ba..e7ebd19 100644
---- a/support/getopt.c
-+++ b/support/getopt.c
-@@ -152,7 +152,7 @@ static struct _getopt_data getopt_data;
-    whose names are inconsistent.  */
- 
- #ifndef getenv
--extern char *getenv ();
-+extern char *getenv (const char*);
- #endif
- 
- #endif /* not __GNU_LIBRARY__ */
-diff --git a/support/getopt.h b/support/getopt.h
-index 8393569..06482cf 100644
---- a/support/getopt.h
-+++ b/support/getopt.h
-@@ -181,7 +181,7 @@ extern int __posix_getopt (int ___argc, char *const *___argv,
- #  endif
- # endif
- #else /* not __GNU_LIBRARY__ */
--extern int getopt ();
-+extern int getopt (int,  char * const*, const char *);
- #endif /* __GNU_LIBRARY__ */
- 
- #ifndef __need_getopt
diff --git a/meta/recipes-extended/gawk/gawk/0001-configure.ac-re-enable-disabled-printf-features.patch b/meta/recipes-extended/gawk/gawk/0001-configure.ac-re-enable-disabled-printf-features.patch
index 4fe60c7cb8..bcbc569531 100644
--- a/meta/recipes-extended/gawk/gawk/0001-configure.ac-re-enable-disabled-printf-features.patch
+++ b/meta/recipes-extended/gawk/gawk/0001-configure.ac-re-enable-disabled-printf-features.patch
@@ -1,4 +1,4 @@
-From 879fb11c7c006a8533a092fb75b38d84cc570d83 Mon Sep 17 00:00:00 2001
+From 9ce3184188e3fa275fde0258a165f4446a6e80f7 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 22 Nov 2024 12:13:58 +0100
 Subject: [PATCH] configure.ac: re-enable disabled printf features
@@ -12,10 +12,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index cb99ffe..5fe792f 100644
+index 0ccd460..7df7e5b 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -398,7 +398,7 @@ int main()
+@@ -400,7 +400,7 @@ int main()
  ])],
  	has_f_format=yes,
  	has_f_format=no,
@@ -24,7 +24,7 @@ index cb99ffe..5fe792f 100644
  )
  if test "$has_f_format" = yes
  then
-@@ -427,7 +427,7 @@ int main()
+@@ -429,7 +429,7 @@ int main()
  ])],
  	has_a_format=yes,
  	has_a_format=no,
diff --git a/meta/recipes-extended/gawk/gawk_5.3.1.bb b/meta/recipes-extended/gawk/gawk_5.3.2.bb
similarity index 94%
rename from meta/recipes-extended/gawk/gawk_5.3.1.bb
rename to meta/recipes-extended/gawk/gawk_5.3.2.bb
index 1fe2f2b2a7..833fe78bf9 100644
--- a/meta/recipes-extended/gawk/gawk_5.3.1.bb
+++ b/meta/recipes-extended/gawk/gawk_5.3.2.bb
@@ -18,10 +18,9 @@ PACKAGECONFIG[mpfr] = "--with-mpfr,--without-mpfr, mpfr"
 SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
            file://run-ptest \
            file://0001-configure.ac-re-enable-disabled-printf-features.patch \
-           file://0001-Add-parameter-signatures-for-getenv-and-getopt.patch \
            "
 
-SRC_URI[sha256sum] = "fa41b3a85413af87fb5e3a7d9c8fa8d4a20728c67651185bb49c38a7f9382b1e"
+SRC_URI[sha256sum] = "8639a1a88fb411a1be02663739d03e902a6d313b5c6fe024d0bfeb3341a19a11"
 
 inherit autotools gettext texinfo update-alternatives
 
-- 
2.43.0


