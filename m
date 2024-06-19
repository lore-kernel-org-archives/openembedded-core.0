Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 181ACC2BD05
	for <webhook@archiver.kernel.org>; Wed, 19 Jun 2024 09:00:12 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.16261.1718787609145786315
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jun 2024 02:00:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hdmqlOfu;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-362bc731810so1091249f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 02:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718787607; x=1719392407; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4GWKlZK7sWGz5nYkCQoA2Km+5/975mnNIxvN/k28XVs=;
        b=hdmqlOfuS9gCgByOoGx1W8hfTBS8rznbu57Tc+z+YSrH+6WlDUL5w4Vl+YOWASTdq1
         tBQ8xR3mFYVE2U/slRRuTf5Ski5rrbds/ZCI2LQXqvgq4/dtqkAtwLmEkJ1cawoNdk2a
         Jxdag2nSSQL16ISV5Fdmaht9DTU/ZCCbdiB7sSJ1JCMaAe6lzyuaSHGvIKZx0/ASmloI
         y6I8706vZhimX18vM6ZhPCieEhXjTavgtdaS83guZ6iXWOOzmacdc1TglS1gkIr9s3kX
         kSuQuxHa2XFzFlch7Nuha72f+/tUPRiiiCwhYJcx6LfzAzBTiEZ+TqZZpJb4iRgj165M
         hH/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718787607; x=1719392407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4GWKlZK7sWGz5nYkCQoA2Km+5/975mnNIxvN/k28XVs=;
        b=RtcBHccoDVOzdPsqmaI77F0AdCnGUmrWglZA0tgu3TbWaag67nj1nRdAs/jvyYAK1z
         w87OkXXoM9NH1ZAHEj2vrEgq4BRHw/OlUeyaroD/YLLmdYEnSPT2LFvNycdpj8crGEBZ
         FJtVItcfMz9zTJ10hT3mP0JhHZ6Q4QZwNZC7psal0Grzs7M2DtYkCRdNoeuq7B+q9XEV
         lZJqdkeCOfMMm3JSl9dqVxo7ObmKNQ0I+12rhw4FMmOhd0AN15YR4GdkRZ4rWklqaK18
         lmhNYEMBKZ+KyTVjQJZH/q4naTTwhkFtisqQ6cbSaxXFmrzRJUdi7QHRckIRV3GmxXmf
         hrnQ==
X-Gm-Message-State: AOJu0YzGO73irAhj/Fb6aosR9j5U2cLqOf6f7XgzyROTMQnxOjIAyUFM
	1cL/BHSi7HTigC96rS4LBPNWKpnOxoBu1tKej7TgrsxZjADO12VMECLffg==
X-Google-Smtp-Source: AGHT+IEIi+SggS1vbPhqQtjBD0jf3gpYnsSDeKO2oML1z+1KR0QAlx8UxKfrtw/+MYwMlUymNIeZvw==
X-Received: by 2002:a5d:45c9:0:b0:362:12d4:5ea8 with SMTP id ffacd0b85a97d-36319990799mr1768051f8f.66.1718787607389;
        Wed, 19 Jun 2024 02:00:07 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36076515a80sm16401876f8f.76.2024.06.19.02.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 02:00:07 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 11/15] tcp-wrappers: mark all patches as inactive-upstream
Date: Wed, 19 Jun 2024 10:59:53 +0200
Message-Id: <20240619085957.2787700-11-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240619085957.2787700-1-alex.kanavin@gmail.com>
References: <20240619085957.2787700-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 09:00:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200897

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../tcp-wrappers-7.6/0001-Fix-build-with-clang.patch            | 2 +-
 .../0001-Fix-implicit-function-declaration-warnings.patch       | 2 +-
 .../tcp-wrappers-7.6/0001-Remove-fgets-extern-declaration.patch | 2 +-
 .../tcp-wrappers/tcp-wrappers-7.6/00_man_quoting.diff           | 2 +-
 .../tcp-wrappers/tcp-wrappers-7.6/01_man_portability.patch      | 2 +-
 .../tcp-wrappers/tcp-wrappers-7.6/05_wildcard_matching.patch    | 2 +-
 .../tcp-wrappers/tcp-wrappers-7.6/06_fix_gethostbyname.patch    | 2 +-
 .../tcp-wrappers/tcp-wrappers-7.6/10_usagi-ipv6.patch           | 2 +-
 .../tcp-wrappers/tcp-wrappers-7.6/11_tcpd_blacklist.patch       | 2 +-
 .../tcp-wrappers/tcp-wrappers-7.6/11_usagi_fix.patch            | 2 +-
 .../tcp-wrappers/tcp-wrappers-7.6/12_makefile_config.patch      | 2 +-
 .../tcp-wrappers/tcp-wrappers-7.6/13_shlib_weaksym.patch        | 2 +-
 .../tcp-wrappers/tcp-wrappers-7.6/14_cidr_support.patch         | 2 +-
 .../tcp-wrappers/tcp-wrappers-7.6/15_match_clarify.patch        | 2 +-
 .../tcp-wrappers/tcp-wrappers-7.6/expand_remote_port.patch      | 2 +-
 .../tcp-wrappers/tcp-wrappers-7.6/fix_warnings.patch            | 2 +-
 .../tcp-wrappers/tcp-wrappers-7.6/fix_warnings2.patch           | 2 +-
 .../tcp-wrappers/tcp-wrappers-7.6/have_strerror.patch           | 2 +-
 .../tcp-wrappers/tcp-wrappers-7.6/ldflags.patch                 | 2 +-
 .../tcp-wrappers/tcp-wrappers-7.6/makefile-fix-parallel.patch   | 2 +-
 .../tcp-wrappers/tcp-wrappers-7.6/man_fromhost.patch            | 2 +-
 .../tcp-wrappers/tcp-wrappers-7.6/musl-decls.patch              | 2 +-
 .../tcp-wrappers/tcp-wrappers-7.6/rename_strings_variable.patch | 2 +-
 .../tcp-wrappers/tcp-wrappers-7.6/restore_sigalarm.patch        | 2 +-
 meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/rfc931.diff | 2 +-
 .../tcp-wrappers/tcp-wrappers-7.6/safe_finger.patch             | 2 +-
 .../tcp-wrappers/tcp-wrappers-7.6/sig_fix.patch                 | 2 +-
 .../tcp-wrappers/tcp-wrappers-7.6/siglongjmp.patch              | 2 +-
 .../tcp-wrappers/tcp-wrappers-7.6/socklen_t.patch               | 2 +-
 .../tcp-wrappers/tcp-wrappers-7.6/tcpdchk_libwrapped.patch      | 2 +-
 30 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/0001-Fix-build-with-clang.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/0001-Fix-build-with-clang.patch
index 9d1e05d7f4e..9ca227d68d1 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/0001-Fix-build-with-clang.patch
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/0001-Fix-build-with-clang.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] Fix build with clang
 Fix "error: non-void function 'fix_options' should return a value".
 Add function prototype to tcpd.c and miscd.c.
 
-Upstream-Status: Pending
+Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs anywhere]
 
 Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
 ---
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/0001-Fix-implicit-function-declaration-warnings.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/0001-Fix-implicit-function-declaration-warnings.patch
index 474703885d9..85031779261 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/0001-Fix-implicit-function-declaration-warnings.patch
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/0001-Fix-implicit-function-declaration-warnings.patch
@@ -5,7 +5,7 @@ Subject: [PATCH] Fix implicit-function-declaration warnings
 
 These are seen with clang-15+
 
-Upstream-Status: Inappropriate [upstream is dead]
+Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs anywhere]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  hosts_access.c | 3 +++
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/0001-Remove-fgets-extern-declaration.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/0001-Remove-fgets-extern-declaration.patch
index 88c8d9cae7f..f485fe3fb6d 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/0001-Remove-fgets-extern-declaration.patch
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/0001-Remove-fgets-extern-declaration.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] Remove fgets() extern declaration
 These sources already include <stdio.h> which should bring the correct
 declaration
 
-Upstream-Status: Pending
+Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs anywhere]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  hosts_access.c | 1 -
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/00_man_quoting.diff b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/00_man_quoting.diff
index 16d6719cbc1..c5ba3af3067 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/00_man_quoting.diff
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/00_man_quoting.diff
@@ -1,4 +1,4 @@
-Upstream-Status: Backport
+Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs anywhere]
 
 diff -ruN tcp_wrappers_7.6.orig/hosts_access.5 tcp_wrappers_7.6/hosts_access.5
 --- tcp_wrappers_7.6.orig/hosts_access.5	1995-01-30 19:51:47.000000000 +0100
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/01_man_portability.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/01_man_portability.patch
index 9a735bff6d1..fea8ab9d7af 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/01_man_portability.patch
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/01_man_portability.patch
@@ -1,4 +1,4 @@
-Upstream-Status: Backport
+Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs anywhere]
 
 diff -ruNp tcp_wrappers_7.6.orig/hosts_access.3 tcp_wrappers_7.6/hosts_access.3
 --- tcp_wrappers_7.6.orig/hosts_access.3	2005-03-09 18:30:25.000000000 +0100
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/05_wildcard_matching.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/05_wildcard_matching.patch
index 9e188027fc0..525cd3531ba 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/05_wildcard_matching.patch
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/05_wildcard_matching.patch
@@ -1,4 +1,4 @@
-Upstream-Status: Backport
+Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs anywhere]
 
 See https://bugzilla.redhat.com/bugzilla/show_bug.cgi?id=17847
 
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/06_fix_gethostbyname.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/06_fix_gethostbyname.patch
index 725f4b59578..1f3f9e24acd 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/06_fix_gethostbyname.patch
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/06_fix_gethostbyname.patch
@@ -1,4 +1,4 @@
-Upstream-Status: Backport
+Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs anywhere]
 
 * Mon Feb  5 2001 Preston Brown <pbrown@redhat.com>
 - fix gethostbyname to work better with dot "." notation (#16949)
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/10_usagi-ipv6.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/10_usagi-ipv6.patch
index 96d47c39f40..ea45777734d 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/10_usagi-ipv6.patch
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/10_usagi-ipv6.patch
@@ -1,4 +1,4 @@
-Upstream-Status: Backport
+Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs anywhere]
 
 diff -ruN tcp_wrappers_7.6.orig/fix_options.c tcp_wrappers_7.6/fix_options.c
 --- tcp_wrappers_7.6.orig/fix_options.c	1997-04-08 02:29:19.000000000 +0200
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/11_tcpd_blacklist.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/11_tcpd_blacklist.patch
index 226106f4ff8..77d5b423421 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/11_tcpd_blacklist.patch
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/11_tcpd_blacklist.patch
@@ -1,4 +1,4 @@
-Upstream-Status: Backport
+Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs anywhere]
 
 Path: news.porcupine.org!news.porcupine.org!not-for-mail
 From: Wietse Venema <wietse@((no)(spam)(please))wzv.win.tue.nl>
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/11_usagi_fix.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/11_usagi_fix.patch
index 260e8d31387..09a1e0527e3 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/11_usagi_fix.patch
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/11_usagi_fix.patch
@@ -1,4 +1,4 @@
-Upstream-Status: Backport
+Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs anywhere]
 
 diff -uN tcp_wrappers_7.6/hosts_access.c tcp_wrappers_7.6.new/hosts_access.c
 --- tcp_wrappers_7.6/hosts_access.c	Mon May 20 14:00:56 2002
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/12_makefile_config.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/12_makefile_config.patch
index d473fb63429..895a72e6b4b 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/12_makefile_config.patch
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/12_makefile_config.patch
@@ -1,4 +1,4 @@
-Upstream-Status: Backport
+Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs anywhere]
 
 Index: tcp_wrappers_7.6/Makefile
 ===================================================================
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/13_shlib_weaksym.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/13_shlib_weaksym.patch
index bd1396bc795..9503fb3c881 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/13_shlib_weaksym.patch
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/13_shlib_weaksym.patch
@@ -1,4 +1,4 @@
-Upstream-Status: Backport
+Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs anywhere]
 
 diff -ruN tcp_wrappers_7.6.orig/Makefile tcp_wrappers_7.6/Makefile
 --- tcp_wrappers_7.6.orig/Makefile	2004-05-02 15:37:59.000000000 +0200
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/14_cidr_support.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/14_cidr_support.patch
index eb5685c5761..b6681df8ce4 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/14_cidr_support.patch
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/14_cidr_support.patch
@@ -1,4 +1,4 @@
-Upstream-Status: Backport
+Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs anywhere]
 
 diff -ruN tcp_wrappers_7.6.orig/hosts_access.5 tcp_wrappers_7.6/hosts_access.5
 --- tcp_wrappers_7.6.orig/hosts_access.5	2003-08-21 03:15:36.000000000 +0200
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/15_match_clarify.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/15_match_clarify.patch
index 3ca6874119e..0c8594cac3a 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/15_match_clarify.patch
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/15_match_clarify.patch
@@ -1,4 +1,4 @@
-Upstream-Status: Backport
+Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs anywhere]
 
 diff -ruN tcp_wrappers_7.6.orig/hosts_access.5 tcp_wrappers_7.6/hosts_access.5
 --- tcp_wrappers_7.6.orig/hosts_access.5	2004-04-25 12:17:59.000000000 +0200
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/expand_remote_port.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/expand_remote_port.patch
index 30873779760..0c54ba6d35b 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/expand_remote_port.patch
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/expand_remote_port.patch
@@ -1,4 +1,4 @@
-Upstream-Status: Backport
+Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs anywhere]
 
 diff -ruN tcp_wrappers_7.6.orig/eval.c tcp_wrappers_7.6/eval.c
 --- tcp_wrappers_7.6.orig/eval.c	1995-01-30 19:51:46.000000000 +0100
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/fix_warnings.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/fix_warnings.patch
index 965544cc0bd..0fd2ca7b2b5 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/fix_warnings.patch
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/fix_warnings.patch
@@ -1,7 +1,7 @@
 Compile warning fixes from Debian
 
 Signed-off-by: Adrian Bunk <bunk@stusta.de>
-Upstream-Status: Inappropriate [upstream is dead]
+Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs anywhere]
 
 --- a/options.c
 +++ b/options.c
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/fix_warnings2.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/fix_warnings2.patch
index 27157a2e6dc..d9a6909db70 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/fix_warnings2.patch
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/fix_warnings2.patch
@@ -1,7 +1,7 @@
 Compile warning fixes from Debian
 
 Signed-off-by: Adrian Bunk <bunk@stusta.de>
-Upstream-Status: Inappropriate [upstream is dead]
+Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs anywhere]
 
 --- a/clean_exit.c
 +++ b/clean_exit.c
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/have_strerror.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/have_strerror.patch
index 4cc554fc380..9b1a3c0fa1a 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/have_strerror.patch
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/have_strerror.patch
@@ -1,4 +1,4 @@
-Upstream-Status: Backport
+Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs anywhere]
 
 diff -ruN tcp_wrappers_7.6.orig/percent_m.c tcp_wrappers_7.6/percent_m.c
 --- tcp_wrappers_7.6.orig/percent_m.c	1994-12-28 17:42:37.000000000 +0100
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/ldflags.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/ldflags.patch
index 3ba214d241b..79b677f456c 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/ldflags.patch
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/ldflags.patch
@@ -1,4 +1,4 @@
-Upstream-Status: Backport
+Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs anywhere]
 
 Index: tcp_wrappers_7.6.orig/Makefile
 ===================================================================
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/makefile-fix-parallel.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/makefile-fix-parallel.patch
index 797352579b6..23762449ac4 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/makefile-fix-parallel.patch
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/makefile-fix-parallel.patch
@@ -12,7 +12,7 @@ problem.
 Also fixed:
 Fatal error: can't create shared/hosts_access.o: No such file or directory
 
-Upstream-Status: Pending
+Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs anywhere]
 
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 ---
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/man_fromhost.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/man_fromhost.patch
index 19bd7d3c0fa..30e74a1de11 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/man_fromhost.patch
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/man_fromhost.patch
@@ -1,4 +1,4 @@
-Upstream-Status: Backport
+Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs anywhere]
 
 diff -ruN tcp_wrappers_7.6.orig/hosts_access.3 tcp_wrappers_7.6/hosts_access.3
 --- tcp_wrappers_7.6.orig/hosts_access.3	2004-04-25 00:10:48.000000000 +0200
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/musl-decls.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/musl-decls.patch
index eee640e8a82..b998675aa0b 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/musl-decls.patch
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/musl-decls.patch
@@ -1,7 +1,7 @@
 __BEGIN_DECLS/__END_DECLS are BSD specific and not defined in musl
 glibc and uclibc had sys/cdefs.h doing it.
 
-Upstream-Status: Pending
+Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs anywhere]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 Index: tcp_wrappers_7.6/tcpd.h
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/rename_strings_variable.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/rename_strings_variable.patch
index 7650600ab53..f42b9d2799a 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/rename_strings_variable.patch
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/rename_strings_variable.patch
@@ -1,6 +1,6 @@
 STRINGS name conflicts with variable for strings tools (e.g. i586-oe-linux-strings)
 
-Upstream-Status: Pending
+Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs anywhere]
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/restore_sigalarm.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/restore_sigalarm.patch
index 5875b81b2fc..a864e381298 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/restore_sigalarm.patch
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/restore_sigalarm.patch
@@ -1,4 +1,4 @@
-Upstream-Status: Backport
+Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs anywhere]
 
 diff -ruN tcp_wrappers_7.6.orig/rfc931.c tcp_wrappers_7.6/rfc931.c
 --- tcp_wrappers_7.6.orig/rfc931.c	2004-08-29 18:40:08.000000000 +0200
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/rfc931.diff b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/rfc931.diff
index 723f4f136a8..2d0f548f89f 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/rfc931.diff
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/rfc931.diff
@@ -1,4 +1,4 @@
-Upstream-Status: Backport
+Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs anywhere]
 
 diff -ruNp tcp_wrappers_7.6.orig/scaffold.c tcp_wrappers_7.6/scaffold.c
 --- tcp_wrappers_7.6.orig/scaffold.c	2005-03-09 18:22:04.000000000 +0100
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/safe_finger.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/safe_finger.patch
index fc2afeef15d..b6543fc92e5 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/safe_finger.patch
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/safe_finger.patch
@@ -1,4 +1,4 @@
-Upstream-Status: Backport
+Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs anywhere]
 
 --- tcp-wrappers-7.6-ipv6.1.orig/safe_finger.c
 +++ tcp-wrappers-7.6-ipv6.1/safe_finger.c
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/sig_fix.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/sig_fix.patch
index 9d7ea042b26..843063fd7cf 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/sig_fix.patch
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/sig_fix.patch
@@ -1,4 +1,4 @@
-Upstream-Status: Backport
+Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs anywhere]
 
 * Mon Feb 10 2003 Harald Hoyer <harald@redhat.de> 7.6-29
 - added security patch tcp_wrappers-7.6-sig.patch
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/siglongjmp.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/siglongjmp.patch
index 76dd6340b21..d4a1146594c 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/siglongjmp.patch
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/siglongjmp.patch
@@ -1,4 +1,4 @@
-Upstream-Status: Backport
+Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs anywhere]
 
 diff -ruNp tcp_wrappers_7.6.orig/rfc931.c tcp_wrappers_7.6/rfc931.c
 --- tcp_wrappers_7.6.orig/rfc931.c	2004-08-29 18:42:25.000000000 +0200
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/socklen_t.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/socklen_t.patch
index cf4f993c1aa..fb64f93f1d1 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/socklen_t.patch
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/socklen_t.patch
@@ -7,7 +7,7 @@ Date:   Tue Feb 12 09:53:50 2013 -0500
     Added support for socklen_t type to len argument passed to socket related
     calls. This fixes a bug that causes tcp wrappers to fail when using sshd.
     
-Upstream-Status: Pending
+Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs anywhere]
 Signed-off-by: farrah rashid <farrah.rashid@windriver.com>
 
 diff --git a/fix_options.c b/fix_options.c
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/tcpdchk_libwrapped.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/tcpdchk_libwrapped.patch
index be29bdcfaa8..2e3b1719fd3 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/tcpdchk_libwrapped.patch
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/tcpdchk_libwrapped.patch
@@ -1,4 +1,4 @@
-Upstream-Status: Backport
+Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs anywhere]
 
 diff -ruN tcp_wrappers_7.6.orig/tcpdchk.c tcp_wrappers_7.6/tcpdchk.c
 --- tcp_wrappers_7.6.orig/tcpdchk.c	2003-08-21 02:50:37.000000000 +0200
-- 
2.39.2


