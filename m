Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0FBCCA0FE1
	for <webhook@archiver.kernel.org>; Fri,  1 Sep 2023 13:01:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web11.5659.1693573285195678325
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Sep 2023 06:01:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=bb/aG4U4;
 spf=pass (domain: intel.com, ip: 134.134.136.126, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693573285; x=1725109285;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=c4JrdI301CQ6A+rCHUuNQtgrbbWC6W41sR/9wnxBZ9U=;
  b=bb/aG4U4TBe+HY52CWAnbunnYBFx/X6hp99R1MUIfSx5QxrniEYhPYUW
   tKLXZwMKA1I9wv+u8RxYeuP/NsPpBadNbbGBmVPwu0IGdhGkBzi7eB7YM
   ddmgN/wa8+9oPGWBI/AAh2Ogp2KPBmyhiFT1hZsKfiwLuXvEqRUNA4QIP
   2IP3iiN7Ug26AiyQ0WXbUI7V9sxnlPsC7NebIBNoYkCIVQaXlnCW/014v
   fXwh2QDPclegBCh5A61WRlfdht+iOiEuc/Jw8+HEmQnxBuTBMENliULwi
   iOOXYk2lgdXP+bv+P3JvSCD5UZXgC4g2VsvuICHLSlwwz5lO858uCdCQj
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="361239741"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; 
   d="scan'208";a="361239741"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 06:01:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="739924071"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; 
   d="scan'208";a="739924071"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga002.jf.intel.com with ESMTP; 01 Sep 2023 06:01:21 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [mickledore][patch 2/4] python3: update 3.11.3 -> 3.11.4
Date: Fri,  1 Sep 2023 20:41:41 +0800
Message-Id: <20230901124143.1639925-2-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20230901124143.1639925-1-chee.yang.lee@intel.com>
References: <20230901124143.1639925-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Sep 2023 13:01:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187007

From: Alexander Kanavin <alex.kanavin@gmail.com>

upgrade include fix for CVE-2023-24329

(cherry picked from commit f7f163ebe8c53de4314d04595c1fbcc7af2deccc )

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 ...1-Don-t-search-system-for-headers-libraries.patch |  2 +-
 ...y-handle-stdin-I-O-errors-same-way-as-maste.patch | 12 ++++++------
 ...nfig.py-use-prefix-value-from-build-configu.patch |  2 +-
 .../12-distutils-prefix-is-inside-staging-area.patch |  2 +-
 meta/recipes-devtools/python/python3/makerace.patch  |  8 ++++----
 .../python/{python3_3.11.3.bb => python3_3.11.4.bb}  |  2 +-
 6 files changed, 14 insertions(+), 14 deletions(-)
 rename meta/recipes-devtools/python/{python3_3.11.3.bb => python3_3.11.4.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch b/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch
index c9253832cf..222a567dd5 100644
--- a/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch
+++ b/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch
@@ -1,4 +1,4 @@
-From 6cb667f37beacd832cb409e5244b3c90dfad32f7 Mon Sep 17 00:00:00 2001
+From aa8f1709c54557d2b51a9a37d15ccc3de62e90cb Mon Sep 17 00:00:00 2001
 From: Jeremy Puhlman <jpuhlman@mvista.com>
 Date: Wed, 4 Mar 2020 00:06:42 +0000
 Subject: [PATCH] Don't search system for headers/libraries
diff --git a/meta/recipes-devtools/python/python3/0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch b/meta/recipes-devtools/python/python3/0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch
index df5179e877..07c6aef9b9 100644
--- a/meta/recipes-devtools/python/python3/0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch
+++ b/meta/recipes-devtools/python/python3/0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch
@@ -1,4 +1,4 @@
-From 86061629f4a179e740a17e53dd2c98ab47af2fe2 Mon Sep 17 00:00:00 2001
+From 7b0a14e7320078ac891d415cab9b7568e3f52ad8 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Thu, 16 Sep 2021 16:35:37 +0200
 Subject: [PATCH] Lib/pty.py: handle stdin I/O errors same way as master I/O
@@ -30,18 +30,18 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/Lib/pty.py b/Lib/pty.py
-index 8d8ce40..35439c6 100644
+index fefb63a..4cef056 100644
 --- a/Lib/pty.py
 +++ b/Lib/pty.py
-@@ -154,7 +154,10 @@ def _copy(master_fd, master_read=_read, stdin_read=_read):
-                 os.write(STDOUT_FILENO, data)
+@@ -184,7 +184,10 @@ def _copy(master_fd, master_read=_read, stdin_read=_read):
+             i_buf = i_buf[n:]
  
-         if STDIN_FILENO in rfds:
+         if stdin_avail and STDIN_FILENO in rfds:
 -            data = stdin_read(STDIN_FILENO)
 +            try:
 +                data = stdin_read(STDIN_FILENO)
 +            except OSError:
 +                data = b""
              if not data:
-                 fds.remove(STDIN_FILENO)
+                 stdin_avail = False
              else:
diff --git a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
index d5b7ce2b95..a0f3d72992 100644
--- a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
+++ b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
@@ -1,4 +1,4 @@
-From 4ed481f4928c361970e78f27c4d9be8700af176b Mon Sep 17 00:00:00 2001
+From 512c617bd00b74b30a80dd56a12391de46e2b6cf Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 10 Sep 2021 12:28:31 +0200
 Subject: [PATCH] Lib/sysconfig.py: use prefix value from build configuration
diff --git a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch b/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
index 5ee4e4f126..bbdd8b586e 100644
--- a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
+++ b/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
@@ -1,4 +1,4 @@
-From 4c39252c71d8bca81fdc43753c83a59f8668c619 Mon Sep 17 00:00:00 2001
+From 843574d5a5b0818e83e20f8c0389d567bd4733fb Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 14 May 2013 15:00:26 -0700
 Subject: [PATCH] python3: Add target and native recipes
diff --git a/meta/recipes-devtools/python/python3/makerace.patch b/meta/recipes-devtools/python/python3/makerace.patch
index 979fc9dc36..c71c1e15de 100644
--- a/meta/recipes-devtools/python/python3/makerace.patch
+++ b/meta/recipes-devtools/python/python3/makerace.patch
@@ -1,4 +1,4 @@
-From 4f52aaf2a548b3356c6f1369c62b11335dc27464 Mon Sep 17 00:00:00 2001
+From dde5cb74f55b6dd39d25cff639d16940d9dad505 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Tue, 13 Jul 2021 23:19:29 +0100
 Subject: [PATCH] python3: Fix make race
@@ -18,11 +18,11 @@ Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 7558f0c..8cec819 100644
+index c6d7e85..205af6c 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2005,7 +2005,7 @@ TESTSUBDIRS=	ctypes/test \
- 		unittest/test unittest/test/testmock
+@@ -2045,7 +2045,7 @@ TESTSUBDIRS=	ctypes/test \
+ 		unittest/test/testmock
  
  TEST_MODULES=@TEST_MODULES@
 -libinstall:	all $(srcdir)/Modules/xxmodule.c
diff --git a/meta/recipes-devtools/python/python3_3.11.3.bb b/meta/recipes-devtools/python/python3_3.11.4.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.11.3.bb
rename to meta/recipes-devtools/python/python3_3.11.4.bb
index 0563a0ab9b..41b27094c7 100644
--- a/meta/recipes-devtools/python/python3_3.11.3.bb
+++ b/meta/recipes-devtools/python/python3_3.11.4.bb
@@ -39,7 +39,7 @@ SRC_URI:append:class-native = " \
            file://12-distutils-prefix-is-inside-staging-area.patch \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
            "
-SRC_URI[sha256sum] = "8a5db99c961a7ecf27c75956189c9602c968751f11dbeae2b900dbff1c085b5e"
+SRC_URI[sha256sum] = "2f0e409df2ab57aa9fc4cbddfb976af44e4e55bf6f619eee6bc5c2297264a7f6"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.37.3


