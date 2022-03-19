Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F155DC4332F
	for <webhook@archiver.kernel.org>; Sat, 19 Mar 2022 07:16:21 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.4772.1647674180435367032
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Mar 2022 00:16:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=a1suVouy;
 spf=pass (domain: gmail.com, ip: 209.85.128.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id
 v130-20020a1cac88000000b00389d0a5c511so7696080wme.5
        for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Mar 2022 00:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=X3t9gSjcMxb1OU3pYqcfaizfLsdUOMsMwlZf1PGq4ZQ=;
        b=a1suVouy18ra0uN0DQYACFNWP+96iRgeMHALdph0vODpBW2Pm7DYem6QEJlNzhmhhJ
         bIm9VNvaJgvSyR9ihacxKizav7UvCi/J25BjT/lXm1k91JlSDu9VY6ubIqpR8p9bYcjA
         Iycl5FgyXaKvJaHMn/FBXwZORYV0L2+DOyLXQmbYBr9lzPdDmPbMLlMRK2ZDo73jEqRO
         LLpKwwVpdLELVc8NpjLwOm1rAyzM1UcwHAaHEhO7DlekVAW9uvKFZg1E1zWO6Z2Daq4x
         HFIA2e/j1W8quUr+SUB5/267pYdUMEqpO2P6IfLhpWfwcPFIcT7pHfSnRl/cXCYTffGp
         dSGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=X3t9gSjcMxb1OU3pYqcfaizfLsdUOMsMwlZf1PGq4ZQ=;
        b=njkk7X5xt7C0P9/F0SY2P4b7Ftzu9MFkU2tP5Ck0qg0PIWuwlqa5r/l5IPWuWCUFuI
         77G2/Eae/P/+mNTTr/DBgeqz7G6TedSA0x+BEZ/ajUAHxn1f3rUzby5fjFH5e6UNzeK6
         HJFtTlgH6knmjJASEZHEhq38adF2eIAqWXUkHx4ZOE26p0C0ZqjtxfAHFg5jhrMgF4Ys
         oVncf9jbk4WgkQCis0n6PqEl4O1MFUxvdJmFJa1wfbbXEelstIv2jNdaq+JBOlnxs+WW
         GyVS5Rhv70hgwjWhVpDmNiHwiZaRS5evXSh9B0sNzcFXxEvsMN2BID5d7ddzSGxZc5f8
         PnXQ==
X-Gm-Message-State: AOAM531Y3i34UzURfYkxasw6CBaqcT4nxY3HyENrDVGNueUQ2GDOBRGL
	15WWq5kJSmntwsoXLDsrfpG0f00eZtU=
X-Google-Smtp-Source: 
 ABdhPJw2bDIYwRGjJiE6d+LUJztDg8S8W/MSs1jAV5MpcxkHtYOA1I4C5EXKP3U4p+Ub/SZEfemO2Q==
X-Received: by 2002:a05:600c:4e4a:b0:38c:801c:2984 with SMTP id
 e10-20020a05600c4e4a00b0038c801c2984mr8577508wmq.168.1647674178886;
        Sat, 19 Mar 2022 00:16:18 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 i15-20020a05600011cf00b001edc2966dd4sm7656999wrx.47.2022.03.19.00.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Mar 2022 00:16:18 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 06/11] perl: update 5.34.0 -> 5.34.1
Date: Sat, 19 Mar 2022 08:16:00 +0100
Message-Id: <20220319071605.152904-6-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220319071605.152904-1-alex@linutronix.de>
References: <20220319071605.152904-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Mar 2022 07:16:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163462

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...e5fdd87aa205011512cd1e6cc655bcf677fd.patch | 31 --------------
 .../perl/files/CVE-2021-36770.patch           | 40 -------------------
 ...2398e766500cb5d83c4d76b642fcf31d997a.patch | 40 -------------------
 ...297a58b8f10ab885c19eec48ea076116cc1f.patch | 25 ------------
 .../perl/files/perl-configpm-switch.patch     |  4 +-
 .../perl/{perl_5.34.0.bb => perl_5.34.1.bb}   |  6 +--
 6 files changed, 3 insertions(+), 143 deletions(-)
 delete mode 100644 meta/recipes-devtools/perl/files/5bc1e5fdd87aa205011512cd1e6cc655bcf677fd.patch
 delete mode 100644 meta/recipes-devtools/perl/files/CVE-2021-36770.patch
 delete mode 100644 meta/recipes-devtools/perl/files/aacd2398e766500cb5d83c4d76b642fcf31d997a.patch
 delete mode 100644 meta/recipes-devtools/perl/files/ea57297a58b8f10ab885c19eec48ea076116cc1f.patch
 rename meta/recipes-devtools/perl/{perl_5.34.0.bb => perl_5.34.1.bb} (98%)

diff --git a/meta/recipes-devtools/perl/files/5bc1e5fdd87aa205011512cd1e6cc655bcf677fd.patch b/meta/recipes-devtools/perl/files/5bc1e5fdd87aa205011512cd1e6cc655bcf677fd.patch
deleted file mode 100644
index 1cb65d932c..0000000000
--- a/meta/recipes-devtools/perl/files/5bc1e5fdd87aa205011512cd1e6cc655bcf677fd.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 5bc1e5fdd87aa205011512cd1e6cc655bcf677fd Mon Sep 17 00:00:00 2001
-From: Sergey Poznyakoff <gray@gnu.org>
-Date: Wed, 23 Jun 2021 15:31:42 +0300
-Subject: [PATCH] Fix definition of ITEM_NOT_FOUND for pre-1.13 versions.
-
-Upstream-Status: Backport
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- ext/GDBM_File/GDBM_File.xs | 9 +++++----
- 1 file changed, 5 insertions(+), 4 deletions(-)
-
-diff --git a/ext/GDBM_File/GDBM_File.xs b/ext/GDBM_File/GDBM_File.xs
-index 494c2889ca89..0125b5dcac4d 100644
---- a/ext/GDBM_File/GDBM_File.xs
-+++ b/ext/GDBM_File/GDBM_File.xs
-@@ -145,10 +145,11 @@ output_datum(pTHX_ SV *arg, char *str, int size)
- #define gdbm_setopt(db,optflag,optval,optlen) not_here("gdbm_setopt")
- #endif
- 
--#if GDBM_VERSION_MAJOR == 1 && GDBM_VERSION_MINOR < 13        
--/* Prior to 1.13, gdbm_fetch family functions set gdbm_errno to GDBM_NO_ERROR
--   if the requested key did not exist */
--# define ITEM_NOT_FOUND()  (gdbm_errno == GDBM_NO_ERROR)
-+#if GDBM_VERSION_MAJOR == 1 && GDBM_VERSION_MINOR < 13
-+/* Prior to 1.13, only gdbm_fetch set GDBM_ITEM_NOT_FOUND if the requested
-+   key did not exist.  Other similar function wouls set GDBM_NO_ERROR instead.
-+   The GDBM_ITEM_NOT_FOUND existeds as early as in 1.7.3 */
-+# define ITEM_NOT_FOUND()  (gdbm_errno == GDBM_NO_ERROR || gdbm_errno == GDBM_ITEM_NOT_FOUND)
- #else
- # define ITEM_NOT_FOUND()  (gdbm_errno == GDBM_ITEM_NOT_FOUND)
- #endif
diff --git a/meta/recipes-devtools/perl/files/CVE-2021-36770.patch b/meta/recipes-devtools/perl/files/CVE-2021-36770.patch
deleted file mode 100644
index 1ef548b305..0000000000
--- a/meta/recipes-devtools/perl/files/CVE-2021-36770.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-Backport patch to fix CVE-2021-36770. And drop the section of code which
-updates version.
-
-Upstream-Status: Backport [https://github.com/Perl/perl5/commit/c1a937f]
-CVE: CVE-2021-36770
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-
-From c1a937fef07c061600a0078f4cb53fe9c2136bb9 Mon Sep 17 00:00:00 2001
-From: Ricardo Signes <rjbs@semiotic.systems>
-Date: Mon, 9 Aug 2021 08:14:05 -0400
-Subject: [PATCH] Encode.pm: apply a local patch for CVE-2021-36770
-
-I expect Encode to see a new release today.
-
-Without this fix, Encode::ConfigLocal can be loaded from a path relative
-to the current directory, because the || operator will evaluate @INC in
-scalar context, putting an integer as the only value in @INC.
----
- cpan/Encode/Encode.pm | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/cpan/Encode/Encode.pm b/cpan/Encode/Encode.pm
-index a56a99947f..b96a850416 100644
---- a/cpan/Encode/Encode.pm
-+++ b/cpan/Encode/Encode.pm
-@@ -65,8 +66,8 @@ require Encode::Config;
- eval {
-     local $SIG{__DIE__};
-     local $SIG{__WARN__};
--    local @INC = @INC || ();
--    pop @INC if $INC[-1] eq '.';
-+    local @INC = @INC;
-+    pop @INC if @INC && $INC[-1] eq '.';
-     require Encode::ConfigLocal;
- };
- 
--- 
-2.33.0
-
diff --git a/meta/recipes-devtools/perl/files/aacd2398e766500cb5d83c4d76b642fcf31d997a.patch b/meta/recipes-devtools/perl/files/aacd2398e766500cb5d83c4d76b642fcf31d997a.patch
deleted file mode 100644
index 628903f41c..0000000000
--- a/meta/recipes-devtools/perl/files/aacd2398e766500cb5d83c4d76b642fcf31d997a.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From aacd2398e766500cb5d83c4d76b642fcf31d997a Mon Sep 17 00:00:00 2001
-From: Sergey Poznyakoff <gray@gnu.org>
-Date: Wed, 23 Jun 2021 10:26:50 +0300
-Subject: [PATCH] Fix GDBM_File to compile with version 1.20 and earlier
-
-* ext/GDBM_File/GDBM_File.xs (ITEM_NOT_FOUND): Define conditionally,
-depending on the GDBM_VERSION_MAJOR and GDBM_VERSION_MINOR.
-Don't assume GDBM_ITEM_NOT_FOUND is a define (it isn't since
-gdbm commit d3e27957).
-
-Upstream-Status: Backport
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- ext/GDBM_File/GDBM_File.xs | 11 +++++------
- 1 file changed, 5 insertions(+), 6 deletions(-)
-
-diff --git a/ext/GDBM_File/GDBM_File.xs b/ext/GDBM_File/GDBM_File.xs
-index cd0bb6f26ffa..494c2889ca89 100644
---- a/ext/GDBM_File/GDBM_File.xs
-+++ b/ext/GDBM_File/GDBM_File.xs
-@@ -145,14 +145,13 @@ output_datum(pTHX_ SV *arg, char *str, int size)
- #define gdbm_setopt(db,optflag,optval,optlen) not_here("gdbm_setopt")
- #endif
- 
--#ifndef GDBM_ITEM_NOT_FOUND
--# define GDBM_ITEM_NOT_FOUND GDBM_NO_ERROR
--#endif
--
-+#if GDBM_VERSION_MAJOR == 1 && GDBM_VERSION_MINOR < 13        
- /* Prior to 1.13, gdbm_fetch family functions set gdbm_errno to GDBM_NO_ERROR
-    if the requested key did not exist */
--#define ITEM_NOT_FOUND()                                                \
--    (gdbm_errno == GDBM_ITEM_NOT_FOUND || gdbm_errno == GDBM_NO_ERROR)
-+# define ITEM_NOT_FOUND()  (gdbm_errno == GDBM_NO_ERROR)
-+#else
-+# define ITEM_NOT_FOUND()  (gdbm_errno == GDBM_ITEM_NOT_FOUND)
-+#endif
- 
- #define CHECKDB(db) do {                        \
-     if (!db->dbp) {                             \
diff --git a/meta/recipes-devtools/perl/files/ea57297a58b8f10ab885c19eec48ea076116cc1f.patch b/meta/recipes-devtools/perl/files/ea57297a58b8f10ab885c19eec48ea076116cc1f.patch
deleted file mode 100644
index 3864f1a121..0000000000
--- a/meta/recipes-devtools/perl/files/ea57297a58b8f10ab885c19eec48ea076116cc1f.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From ea57297a58b8f10ab885c19eec48ea076116cc1f Mon Sep 17 00:00:00 2001
-From: Sergey Poznyakoff <gray@gnu.org>
-Date: Wed, 23 Jun 2021 14:24:47 +0300
-Subject: [PATCH] Raise version number in ext/GDBM_File/GDBM_File.pm
-
-Upstream-Status: Backport
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- ext/GDBM_File/GDBM_File.pm | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/ext/GDBM_File/GDBM_File.pm b/ext/GDBM_File/GDBM_File.pm
-index d837536f804c..cb08d091b829 100644
---- a/ext/GDBM_File/GDBM_File.pm
-+++ b/ext/GDBM_File/GDBM_File.pm
-@@ -363,7 +363,7 @@ require XSLoader;
- );
- 
- # This module isn't dual life, so no need for dev version numbers.
--$VERSION = '1.19';
-+$VERSION = '1.20';
- 
- XSLoader::load();
- 
diff --git a/meta/recipes-devtools/perl/files/perl-configpm-switch.patch b/meta/recipes-devtools/perl/files/perl-configpm-switch.patch
index 80ce4a6de7..15189a0c04 100644
--- a/meta/recipes-devtools/perl/files/perl-configpm-switch.patch
+++ b/meta/recipes-devtools/perl/files/perl-configpm-switch.patch
@@ -1,4 +1,4 @@
-From 5120acaa2be5787d9657f6b91bc8ee3c2d664fbe Mon Sep 17 00:00:00 2001
+From 1f7cc5db2ca549c37c6a7923368e1a0104f31b99 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Sun, 27 May 2007 21:04:11 +0000
 Subject: [PATCH] perl: 5.8.7 -> 5.8.8 (from OE)
@@ -20,7 +20,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 16 insertions(+), 2 deletions(-)
 
 diff --git a/configpm b/configpm
-index c8de8bf..204613c 100755
+index 94a4778..99b20c9 100755
 --- a/configpm
 +++ b/configpm
 @@ -687,7 +687,7 @@ sub FETCH {
diff --git a/meta/recipes-devtools/perl/perl_5.34.0.bb b/meta/recipes-devtools/perl/perl_5.34.1.bb
similarity index 98%
rename from meta/recipes-devtools/perl/perl_5.34.0.bb
rename to meta/recipes-devtools/perl/perl_5.34.1.bb
index 60a7aff906..ccd6ad5a0e 100644
--- a/meta/recipes-devtools/perl/perl_5.34.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.34.1.bb
@@ -16,10 +16,6 @@ SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
            file://perl-dynloader.patch \
            file://0002-Constant-Fix-up-shebang.patch \
            file://determinism.patch \
-           file://CVE-2021-36770.patch \
-           file://aacd2398e766500cb5d83c4d76b642fcf31d997a.patch \
-           file://ea57297a58b8f10ab885c19eec48ea076116cc1f.patch \
-           file://5bc1e5fdd87aa205011512cd1e6cc655bcf677fd.patch \
            file://0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch \
            "
 SRC_URI:append:class-native = " \
@@ -29,7 +25,7 @@ SRC_URI:append:class-target = " \
            file://encodefix.patch \
 "
 
-SRC_URI[perl.sha256sum] = "551efc818b968b05216024fb0b727ef2ad4c100f8cb6b43fab615fa78ae5be9a"
+SRC_URI[perl.sha256sum] = "357951a491b0ba1ce3611263922feec78ccd581dddc24a446b033e25acf242a1"
 
 S = "${WORKDIR}/perl-${PV}"
 
-- 
2.30.2


