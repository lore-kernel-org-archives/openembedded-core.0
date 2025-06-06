Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED9D7C5AD49
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 11:43:49 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.31570.1749210220811676110
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jun 2025 04:43:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i1YFOQ0D;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-60768e108baso1597136a12.2
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 04:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749210219; x=1749815019; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=DR3f2c0rMFlV9MUZ1gGPuTgKwsNlDYoURA0OtGb3qp8=;
        b=i1YFOQ0D5moBYjHki8UXsx4VKRu9LiU00iKvoxDb7eL9LEdq7sothTWWjcx/AGuN3Q
         0dI+lbuQonS9qH/Qo/hbFP1EC6gLRdqtFAqFHxdYFbu2Glmfh7h60K//uoq0AUF0qSuW
         OamAHs1f9Nzq03JYckTiMPehIkzlkiMD7mzdxyemRQIViAz0/vC63XU+zjIa+QZ83EJJ
         f5pd8IbI3fTzf+I9b0xTmkD5YrTJBScyGgIPr8yI8yP6/enlbyda1dK2DlIXi3ZLMsiD
         07wYsbttFmkKq4m2WXC4XL50iwg7TfJ7S1zOX2xt6yOt4Z8isPcnHpS4rmqxEIIqN/sj
         VZHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749210219; x=1749815019;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DR3f2c0rMFlV9MUZ1gGPuTgKwsNlDYoURA0OtGb3qp8=;
        b=ONU/hzdYThGkDmao5X9EVK48UE4Y1VjDWQgfCzJTkx/D9TfT8IhaElbkng4iP4apzh
         NCmjhj5cLuUHVfpTX32nr4d+MQD5nVj0mu25HwzTeGHWxQLIrXn48AX8U2HFDpWDQ1QL
         AS9Kmp+P42DSFiSUE6vmMPFuQa0KRwDMsehmVoYg2ZH+sbE6BFAKvjs4S8NoV67biIgM
         6/uuFEmU0qyUOqSy1R13bkwQV9QTwwoZ/EUW2lL2po79j0GWpbERqnm1p7baypROAD7j
         ZxdodJ7JyrULet8rRARdaQApgqUolAwWBpiEq1CWLZAKmuJaezB1CMtFOMgrm6VLxhDk
         CFvw==
X-Gm-Message-State: AOJu0Yy44K6rJJ9757Y3/ATPyojn+Eg7PRCij0Fixm0twGDlGCKELQB5
	e53esAYNdG+ioXA4dtFXpkFrtDp2I/su1ElRi0SLTPfOE39Dcg7PUAkFFz4Uzw==
X-Gm-Gg: ASbGncvofZYx/J38S+KrgQ3aXuLk4/vEDsLZ9+WC2+1zwQn3OGvhN2ID0Ra25R7wXwt
	f1Rpk5F8YdielVRVoMhEpv3D0dSwCaYU2dpbuaWrQ4PQTXSNvfN1o3ito2eJ1bL4xoRtKYS1CRx
	luZidlT4UbT7i9qt8KwLYKWT1OE1s87o5J4Lgtk5Oqe+aNwQKOtnP0eQ3ikJiBcBqwxCQNBNNS9
	JOjaYnWpoWreQVn6x8kQnVGaKzr8GuYfEEvWHriaM0t6e7WKGiSvyjf5VPHtd5ws5wRA1Kow+7w
	5X9kVy/5PuSkOb3eCUzufg10b1QwfjrFJbOkgiN0VfZSrUqJQPalW2n/MjrxfvLJ6xmHw/9rIxf
	otg==
X-Google-Smtp-Source: AGHT+IHX6o+gRo7iBU0FpQoyjYFsqgo74L7O4w5h/mJc1RFwHOVLrmloKai8DvLGmLSNUjUZ4UEXcg==
X-Received: by 2002:a05:6402:1e8a:b0:606:adda:4f14 with SMTP id 4fb4d7f45d1cf-60773ec8dc3mr2261245a12.11.1749210218742;
        Fri, 06 Jun 2025 04:43:38 -0700 (PDT)
Received: from localhost.localdomain ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-607783dcd0csm879858a12.55.2025.06.06.04.43.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 04:43:38 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libtheora: upgrade 1.1.1 -> 1.2.0
Date: Fri,  6 Jun 2025 13:43:37 +0200
Message-ID: <20250606114337.611299-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 11:43:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218133

Major changes:
  - New 'ptalarbvorm' encoder
  - New th_encode_ctl option for copying configuration from an existing
    setup header, useful for splicing streams.
  - Added support for RISC OS.
  - Improved ARM support.
  - Various speed, bug fixes and code quality improvements.

See CHANGES file for full changelog.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../libtheora-1.1.1/autoreconf.patch          | 42 -------------------
 .../no-docs.patch                             | 10 ++---
 ...{libtheora_1.1.1.bb => libtheora_1.2.0.bb} |  5 +--
 3 files changed, 7 insertions(+), 50 deletions(-)
 delete mode 100644 meta/recipes-multimedia/libtheora/libtheora-1.1.1/autoreconf.patch
 rename meta/recipes-multimedia/libtheora/{libtheora-1.1.1 => libtheora}/no-docs.patch (54%)
 rename meta/recipes-multimedia/libtheora/{libtheora_1.1.1.bb => libtheora_1.2.0.bb} (81%)

diff --git a/meta/recipes-multimedia/libtheora/libtheora-1.1.1/autoreconf.patch b/meta/recipes-multimedia/libtheora/libtheora-1.1.1/autoreconf.patch
deleted file mode 100644
index 0fc09ba413..0000000000
--- a/meta/recipes-multimedia/libtheora/libtheora-1.1.1/autoreconf.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 859e58b440e64aeec446ae0a923a638e4203f408 Mon Sep 17 00:00:00 2001
-From: Tim Terriberry <tterribe@xiph.org>
-Date: Fri, 20 May 2011 20:41:50 +0000
-Subject: [PATCH] Make autoreconf -i -f work.
-
-Patch from David Schleef.
-
-svn path=/trunk/theora/; revision=17990
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- Makefile.am  | 2 ++
- configure.ac | 2 +-
- 2 files changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index d833491..369978d 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -2,6 +2,8 @@
- 
- AUTOMAKE_OPTIONS = foreign 1.6 dist-zip dist-bzip2
- 
-+ACLOCAL_AMFLAGS=-I m4
-+
- if THEORA_ENABLE_EXAMPLES
- EXAMPLES_DIR = examples
- else
-diff --git a/configure.ac b/configure.ac
-index 8260bdf..d4feb86 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -61,7 +61,7 @@ AC_LIBTOOL_WIN32_DLL
- AM_PROG_LIBTOOL
- 
- dnl Add parameters for aclocal
--AC_SUBST(ACLOCAL_AMFLAGS, "-I m4")
-+AC_CONFIG_MACRO_DIR([m4])
- 
- dnl Check for doxygen
- AC_CHECK_PROG(HAVE_DOXYGEN, doxygen, true, false)
diff --git a/meta/recipes-multimedia/libtheora/libtheora-1.1.1/no-docs.patch b/meta/recipes-multimedia/libtheora/libtheora/no-docs.patch
similarity index 54%
rename from meta/recipes-multimedia/libtheora/libtheora-1.1.1/no-docs.patch
rename to meta/recipes-multimedia/libtheora/libtheora/no-docs.patch
index 359f3d1a7a..e78e66592d 100644
--- a/meta/recipes-multimedia/libtheora/libtheora-1.1.1/no-docs.patch
+++ b/meta/recipes-multimedia/libtheora/libtheora/no-docs.patch
@@ -2,14 +2,14 @@ Upstream-Status: Inappropriate [configuration]
 
 Index: libtheora-1.1.1/Makefile.am
 ===================================================================
---- libtheora-1.1.1.orig/Makefile.am	2009-11-25 22:01:53.593775926 +0100
-+++ libtheora-1.1.1/Makefile.am	2009-11-25 22:02:00.777524017 +0100
-@@ -8,7 +8,7 @@
+--- ./Makefile.am	2009-11-25 22:01:53.593775926 +0100
++++ ./Makefile.am	2009-11-25 22:02:00.777524017 +0100
+@@ -9,7 +9,7 @@
  EXAMPLES_DIR =
  endif
  
 -SUBDIRS = lib include doc tests m4 $(EXAMPLES_DIR)
 +SUBDIRS = lib include tests m4 $(EXAMPLES_DIR)
  
- 
- # we include the whole debian/ dir in EXTRA_DIST because there's a problem
+ EXTRA_DIST = \
+ 	README.md CHANGES COPYING LICENSE \
diff --git a/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb b/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb
similarity index 81%
rename from meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb
rename to meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb
index d0a9a59b7c..ec51967aa1 100644
--- a/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb
+++ b/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb
@@ -8,11 +8,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=cf91718f59eb6a83d06dc7bcaf411132"
 DEPENDS = "libogg"
 
 
-SRC_URI = "http://downloads.xiph.org/releases/theora/libtheora-${PV}.tar.bz2 \
-           file://autoreconf.patch \
+SRC_URI = "http://downloads.xiph.org/releases/theora/libtheora-${PV}.tar.xz \
            file://no-docs.patch"
 
-SRC_URI[sha256sum] = "b6ae1ee2fa3d42ac489287d3ec34c5885730b1296f0801ae577a35193d3affbc"
+SRC_URI[sha256sum] = "ebdf77a8f5c0a8f7a9e42323844fa09502b34eb1d1fece7b5f54da41fe2122ec"
 
 UPSTREAM_CHECK_REGEX = "libtheora-(?P<pver>\d+(\.\d)+)\.(tar\.gz|tgz)"
 

