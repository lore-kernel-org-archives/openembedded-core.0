Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.3792.1595986297036130819
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2020 18:31:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,408,1589212800"; 
   d="scan'208";a="97031514"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 29 Jul 2020 09:31:33 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 8139D4CE4B10
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2020 09:31:30 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 29 Jul 2020 09:31:29 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] flex:Refresh patch.
Date: Wed, 29 Jul 2020 09:31:22 +0800
Message-ID: <1595986282-33013-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 8139D4CE4B10.A3F7A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Two changes conflict in the original patch, and it is remade.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../flex/flex/check-funcs.patch               | 36 +++++++------------
 1 file changed, 12 insertions(+), 24 deletions(-)

diff --git a/meta/recipes-devtools/flex/flex/check-funcs.patch b/meta/recipes-devtools/flex/flex/check-funcs.patch
index 037ca81fdc..25e03bc7de 100644
--- a/meta/recipes-devtools/flex/flex/check-funcs.patch
+++ b/meta/recipes-devtools/flex/flex/check-funcs.patch
@@ -1,10 +1,4 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From c42de062bbdc7c31d7181c10a74202d493280ada Mon Sep 17 00:00:00 2001
-From: Explorer09 <explorer09@gmail.com>
-Date: Tue, 27 Feb 2018 09:10:12 +0800
-Subject: [PATCH] build: Move dnl comments out of AC_CHECK_FUNCS
+Subject: build: Move dnl comments out of AC_CHECK_FUNCS
 
 Due to a bug, autoheader (2.69) will treat M4 dnl comments in a quoted
 argument of AC_CHECK_FUNCS as function tokens and generate a lot of
@@ -20,28 +14,20 @@ I have reported the autoheader bug here:
 
 As a workaround, let's move comments out of AC_CHECK_FUNCS.
 
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
 Signed-off-by: Kang-Che Sung <explorer09@gmail.com>
+Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
 ---
- configure.ac | 29 +++++++++++++----------------
- 1 file changed, 13 insertions(+), 16 deletions(-)
+ configure.ac | 28 +++++++++++++---------------
+ 1 file changed, 13 insertions(+), 15 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 55e774b0..d0f3b7da 100644
+index 55e774b..5ea3a93 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -166,6 +166,7 @@ strtol dnl
- AC_CHECK_FUNCS([dnl
- pow dnl           Used only by "examples/manual/expr"
- setlocale dnl     Needed only if NLS is enabled
-+reallocarr dnl    NetBSD function. Use reallocarray if not available.
- reallocarray dnl  OpenBSD function. We have replacement if not available.
- ])
- 
-diff --git a/configure.ac b/configure.ac
-index 3c977a4e..9c53590f 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -158,22 +158,19 @@ AC_FUNC_REALLOC
+@@ -153,21 +153,19 @@ AC_FUNC_REALLOC
  AS_IF([test "$cross_compiling" = yes],
     AC_MSG_WARN([result $ac_cv_func_realloc_0_nonnull guessed because of cross compilation]))
  
@@ -58,7 +44,6 @@ index 3c977a4e..9c53590f 100644
 -AC_CHECK_FUNCS([dnl
 -pow dnl           Used only by "examples/manual/expr"
 -setlocale dnl     Needed only if NLS is enabled
--reallocarr dnl    NetBSD function. Use reallocarray if not available.
 -reallocarray dnl  OpenBSD function. We have replacement if not available.
 -])
 +dnl Autoheader (<= 2.69) bug: "dnl" comments in a quoted argument of
@@ -77,3 +62,6 @@ index 3c977a4e..9c53590f 100644
  
  AC_CONFIG_FILES(
  Makefile
+-- 
+2.25.1
+
-- 
2.25.1



