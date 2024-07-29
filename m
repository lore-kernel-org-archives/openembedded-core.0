Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DE85C49EA1
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 13:13:37 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.55673.1722258816352016232
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jul 2024 06:13:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=wuboZYZh;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2cb576db1c5so1848937a91.1
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 06:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1722258815; x=1722863615; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v4Us9LYVpvpZGCBrsF3QThilsCu0VJ4rUUESuyqNBTI=;
        b=wuboZYZh3z+frHmJ8lK8s+ypUQ/p6Zw3adM7NyvbMt7zQ3aqiz84AKkrhPzwcszGID
         mdxC9sAHEUC+SYcCpqRuFAwj8OHZg84iC3IV47woG6rKLKJXI4Bmr+KsujgQB6SBiGwQ
         cyKGK1zgFKnMx+/jL2fJFsG+4jbaO9UHoedlZNxeV7u9EY7axtkp9VZlpSb97t6Kl/No
         vanxWNXBWilVmPbP8Tl6bgM2Kz77FB1H0rtwqoL4ZcJeJXTAbqBVF8Z7oGguMvFB8mW6
         gBl3SBxSgrNJyMvIppZ9JPSoPDIUW9/4P8/mpkxhJC/iTTl4ofLhH2yF+de4NHjlhYJm
         GJJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722258815; x=1722863615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v4Us9LYVpvpZGCBrsF3QThilsCu0VJ4rUUESuyqNBTI=;
        b=IEOvkTUltHTlhObLdCXJ98dAVn1x8F59r/5C/YZhFzv4PNEtimbzyohdXoQKBRrRr3
         yf49kScO10fqQcZcj3MFQj8FC6fenr6zeCisRnvO0WCSe8EflBbKnCP4cYI5Iuc2IUfC
         upYnt7AiXQoQmpF8D/l3AXrt4WKk8ax8m+uReom6asAh6w1neTMgeGsGmaI33I++24x3
         wndyYHPsItSGCkBff2cLNrrXuX6x/oNaP/RoMmN4vIQVkOIJyvFaYKm9Ba/wER9I7pww
         T0Gm/1tkH50LdaVI+08B3uA1HYSOOwdFtJQlf2vVLHa58y2bK13FJL3SHhwaVO1Y+XMX
         Ql+A==
X-Gm-Message-State: AOJu0YzoMDmdEYoao5A5zox0mMH16soIPeMhfbjXpuqYukbw4Vkjd3Y4
	kcJGe5kjQyP1lFDQ5lv8fd+sv8yrNIPqMrXPSZLGhRWPGeC1EidT+qZ3+ows+ES6M4dxINFfxye
	ZbJ3HdA==
X-Google-Smtp-Source: AGHT+IG8VDxWJSXnQ79N7S1fzdC9M4CBk0IkU/oNygmW1zx63I1SaSwcROqePcgsG6nOgXrxetZIDg==
X-Received: by 2002:a17:90a:f481:b0:2bf:7eb7:373b with SMTP id 98e67ed59e1d1-2cf7e5eee82mr5250213a91.33.1722258815149;
        Mon, 29 Jul 2024 06:13:35 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cdb73b32cbsm10493788a91.17.2024.07.29.06.13.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 06:13:34 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 28/37] tcp-wrappers: mark all patches as inactive-upstream
Date: Mon, 29 Jul 2024 06:12:38 -0700
Message-Id: <81d8c2567d9319e68854217022bb038546b6298a.1722258106.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722258106.git.steve@sakoman.com>
References: <cover.1722258106.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 13:13:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202642

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0bc555fce11e1d25928310961c53aefd407fbd23)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
index 9d1e05d7f4..9ca227d68d 100644
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
index 474703885d..8503177926 100644
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
index 88c8d9cae7..f485fe3fb6 100644
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
index 16d6719cbc..c5ba3af306 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/00_man_quoting.diff
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/00_man_quoting.diff
@@ -1,4 +1,4 @@
-Upstream-Status: Backport
+Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs anywhere]
 
 diff -ruN tcp_wrappers_7.6.orig/hosts_access.5 tcp_wrappers_7.6/hosts_access.5
 --- tcp_wrappers_7.6.orig/hosts_access.5	1995-01-30 19:51:47.000000000 +0100
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/01_man_portability.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/01_man_portability.patch
index 9a735bff6d..fea8ab9d7a 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/01_man_portability.patch
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/01_man_portability.patch
@@ -1,4 +1,4 @@
-Upstream-Status: Backport
+Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs anywhere]
 
 diff -ruNp tcp_wrappers_7.6.orig/hosts_access.3 tcp_wrappers_7.6/hosts_access.3
 --- tcp_wrappers_7.6.orig/hosts_access.3	2005-03-09 18:30:25.000000000 +0100
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/05_wildcard_matching.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/05_wildcard_matching.patch
index 9e188027fc..525cd3531b 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/05_wildcard_matching.patch
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/05_wildcard_matching.patch
@@ -1,4 +1,4 @@
-Upstream-Status: Backport
+Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs anywhere]
 
 See https://bugzilla.redhat.com/bugzilla/show_bug.cgi?id=17847
 
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/06_fix_gethostbyname.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/06_fix_gethostbyname.patch
index 725f4b5957..1f3f9e24ac 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/06_fix_gethostbyname.patch
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/06_fix_gethostbyname.patch
@@ -1,4 +1,4 @@
-Upstream-Status: Backport
+Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs anywhere]
 
 * Mon Feb  5 2001 Preston Brown <pbrown@redhat.com>
 - fix gethostbyname to work better with dot "." notation (#16949)
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/10_usagi-ipv6.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/10_usagi-ipv6.patch
index 96d47c39f4..ea45777734 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/10_usagi-ipv6.patch
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/10_usagi-ipv6.patch
@@ -1,4 +1,4 @@
-Upstream-Status: Backport
+Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs anywhere]
 
 diff -ruN tcp_wrappers_7.6.orig/fix_options.c tcp_wrappers_7.6/fix_options.c
 --- tcp_wrappers_7.6.orig/fix_options.c	1997-04-08 02:29:19.000000000 +0200
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/11_tcpd_blacklist.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/11_tcpd_blacklist.patch
index 226106f4ff..77d5b42342 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/11_tcpd_blacklist.patch
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/11_tcpd_blacklist.patch
@@ -1,4 +1,4 @@
-Upstream-Status: Backport
+Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs anywhere]
 
 Path: news.porcupine.org!news.porcupine.org!not-for-mail
 From: Wietse Venema <wietse@((no)(spam)(please))wzv.win.tue.nl>
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/11_usagi_fix.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/11_usagi_fix.patch
index 260e8d3138..09a1e0527e 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/11_usagi_fix.patch
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/11_usagi_fix.patch
@@ -1,4 +1,4 @@
-Upstream-Status: Backport
+Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs anywhere]
 
 diff -uN tcp_wrappers_7.6/hosts_access.c tcp_wrappers_7.6.new/hosts_access.c
 --- tcp_wrappers_7.6/hosts_access.c	Mon May 20 14:00:56 2002
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/12_makefile_config.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/12_makefile_config.patch
index d473fb6342..895a72e6b4 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/12_makefile_config.patch
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/12_makefile_config.patch
@@ -1,4 +1,4 @@
-Upstream-Status: Backport
+Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs anywhere]
 
 Index: tcp_wrappers_7.6/Makefile
 ===================================================================
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/13_shlib_weaksym.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/13_shlib_weaksym.patch
index bd1396bc79..9503fb3c88 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/13_shlib_weaksym.patch
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/13_shlib_weaksym.patch
@@ -1,4 +1,4 @@
-Upstream-Status: Backport
+Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs anywhere]
 
 diff -ruN tcp_wrappers_7.6.orig/Makefile tcp_wrappers_7.6/Makefile
 --- tcp_wrappers_7.6.orig/Makefile	2004-05-02 15:37:59.000000000 +0200
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/14_cidr_support.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/14_cidr_support.patch
index eb5685c576..b6681df8ce 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/14_cidr_support.patch
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/14_cidr_support.patch
@@ -1,4 +1,4 @@
-Upstream-Status: Backport
+Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs anywhere]
 
 diff -ruN tcp_wrappers_7.6.orig/hosts_access.5 tcp_wrappers_7.6/hosts_access.5
 --- tcp_wrappers_7.6.orig/hosts_access.5	2003-08-21 03:15:36.000000000 +0200
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/15_match_clarify.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/15_match_clarify.patch
index 3ca6874119..0c8594cac3 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/15_match_clarify.patch
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/15_match_clarify.patch
@@ -1,4 +1,4 @@
-Upstream-Status: Backport
+Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs anywhere]
 
 diff -ruN tcp_wrappers_7.6.orig/hosts_access.5 tcp_wrappers_7.6/hosts_access.5
 --- tcp_wrappers_7.6.orig/hosts_access.5	2004-04-25 12:17:59.000000000 +0200
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/expand_remote_port.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/expand_remote_port.patch
index 3087377976..0c54ba6d35 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/expand_remote_port.patch
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/expand_remote_port.patch
@@ -1,4 +1,4 @@
-Upstream-Status: Backport
+Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs anywhere]
 
 diff -ruN tcp_wrappers_7.6.orig/eval.c tcp_wrappers_7.6/eval.c
 --- tcp_wrappers_7.6.orig/eval.c	1995-01-30 19:51:46.000000000 +0100
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/fix_warnings.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/fix_warnings.patch
index 965544cc0b..0fd2ca7b2b 100644
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
index 27157a2e6d..d9a6909db7 100644
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
index 4cc554fc38..9b1a3c0fa1 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/have_strerror.patch
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/have_strerror.patch
@@ -1,4 +1,4 @@
-Upstream-Status: Backport
+Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs anywhere]
 
 diff -ruN tcp_wrappers_7.6.orig/percent_m.c tcp_wrappers_7.6/percent_m.c
 --- tcp_wrappers_7.6.orig/percent_m.c	1994-12-28 17:42:37.000000000 +0100
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/ldflags.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/ldflags.patch
index 3ba214d241..79b677f456 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/ldflags.patch
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/ldflags.patch
@@ -1,4 +1,4 @@
-Upstream-Status: Backport
+Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs anywhere]
 
 Index: tcp_wrappers_7.6.orig/Makefile
 ===================================================================
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/makefile-fix-parallel.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/makefile-fix-parallel.patch
index 797352579b..23762449ac 100644
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
index 19bd7d3c0f..30e74a1de1 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/man_fromhost.patch
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/man_fromhost.patch
@@ -1,4 +1,4 @@
-Upstream-Status: Backport
+Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs anywhere]
 
 diff -ruN tcp_wrappers_7.6.orig/hosts_access.3 tcp_wrappers_7.6/hosts_access.3
 --- tcp_wrappers_7.6.orig/hosts_access.3	2004-04-25 00:10:48.000000000 +0200
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/musl-decls.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/musl-decls.patch
index eee640e8a8..b998675aa0 100644
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
index 7650600ab5..f42b9d2799 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/rename_strings_variable.patch
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/rename_strings_variable.patch
@@ -1,6 +1,6 @@
 STRINGS name conflicts with variable for strings tools (e.g. i586-oe-linux-strings)
 
-Upstream-Status: Pending
+Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs anywhere]
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/restore_sigalarm.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/restore_sigalarm.patch
index 5875b81b2f..a864e38129 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/restore_sigalarm.patch
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/restore_sigalarm.patch
@@ -1,4 +1,4 @@
-Upstream-Status: Backport
+Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs anywhere]
 
 diff -ruN tcp_wrappers_7.6.orig/rfc931.c tcp_wrappers_7.6/rfc931.c
 --- tcp_wrappers_7.6.orig/rfc931.c	2004-08-29 18:40:08.000000000 +0200
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/rfc931.diff b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/rfc931.diff
index 723f4f136a..2d0f548f89 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/rfc931.diff
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/rfc931.diff
@@ -1,4 +1,4 @@
-Upstream-Status: Backport
+Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs anywhere]
 
 diff -ruNp tcp_wrappers_7.6.orig/scaffold.c tcp_wrappers_7.6/scaffold.c
 --- tcp_wrappers_7.6.orig/scaffold.c	2005-03-09 18:22:04.000000000 +0100
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/safe_finger.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/safe_finger.patch
index fc2afeef15..b6543fc92e 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/safe_finger.patch
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/safe_finger.patch
@@ -1,4 +1,4 @@
-Upstream-Status: Backport
+Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs anywhere]
 
 --- tcp-wrappers-7.6-ipv6.1.orig/safe_finger.c
 +++ tcp-wrappers-7.6-ipv6.1/safe_finger.c
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/sig_fix.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/sig_fix.patch
index 9d7ea042b2..843063fd7c 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/sig_fix.patch
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/sig_fix.patch
@@ -1,4 +1,4 @@
-Upstream-Status: Backport
+Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs anywhere]
 
 * Mon Feb 10 2003 Harald Hoyer <harald@redhat.de> 7.6-29
 - added security patch tcp_wrappers-7.6-sig.patch
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/siglongjmp.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/siglongjmp.patch
index 76dd6340b2..d4a1146594 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/siglongjmp.patch
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/siglongjmp.patch
@@ -1,4 +1,4 @@
-Upstream-Status: Backport
+Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs anywhere]
 
 diff -ruNp tcp_wrappers_7.6.orig/rfc931.c tcp_wrappers_7.6/rfc931.c
 --- tcp_wrappers_7.6.orig/rfc931.c	2004-08-29 18:42:25.000000000 +0200
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/socklen_t.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/socklen_t.patch
index cf4f993c1a..fb64f93f1d 100644
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
index be29bdcfaa..2e3b1719fd 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/tcpdchk_libwrapped.patch
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/tcpdchk_libwrapped.patch
@@ -1,4 +1,4 @@
-Upstream-Status: Backport
+Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs anywhere]
 
 diff -ruN tcp_wrappers_7.6.orig/tcpdchk.c tcp_wrappers_7.6/tcpdchk.c
 --- tcp_wrappers_7.6.orig/tcpdchk.c	2003-08-21 02:50:37.000000000 +0200
-- 
2.34.1


