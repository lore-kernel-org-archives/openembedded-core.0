Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB8E0EB64DA
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 08:31:21 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.3884.1686904278144393513
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jun 2023 01:31:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=PnNylpiZ;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-666683eb028so476757b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 01:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686904277; x=1689496277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xg9bUOYxu91jpk0UMwvycWFzNsUna9bOyO7rLeD2p4g=;
        b=PnNylpiZYL8ng/vs7VMhDGBK5ounwwH118u+iGxTHb4Q8RXKIM+VVpwy4lVg4Z4ol1
         WDRNFQM39l6rgxNIvV4b4kGuXzJLW+ORki+3OZw1tMOH3drMAWivU3YNfAyeCMOKF3iU
         AACgs5qgObYbO5yqo3fW94hUOzjXTt118UmOSUfNy5K999BsMQPh6iDDJ+safgsejU1o
         WQUSaTFnedYRu0Ln25gCX0n6Wsp+G7NWt8Hd5iTdHAsdOsG4gQvKoplP7xgIba9RP3rY
         tPuEwwFEXgq/0GEUGWp0u8OKC9IhkM/ypZ2iua5giqFX1SoxmA3j6/eyQsQSz3P5CMrL
         z4vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686904277; x=1689496277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xg9bUOYxu91jpk0UMwvycWFzNsUna9bOyO7rLeD2p4g=;
        b=LHlxj5VizH0O19Mo7Zb5X6yaumb06/hYqhHJ8m8HnldgpG+dVY/N7UO+yn8pBKRpXM
         cSw8B4kSwNBQCV0v3moqyjqLCUjlg5oFM14cvaKF/6yS8qKp4Wc2VDb5EBoK6QEMSW2G
         qvsdIxemjkd7oexnB/SfvIejMvsZq431I067CMPtMhi1ydn1yove09NVSCW44ANb9hZ9
         OSt8ZAES6cbRUL5dHzHUEiXH/S3fbSBfHxmVC0KuIxkBJJrl3iZzx30TrFRC4YOeL6Kt
         X8lcepCY8ag6+Yz8+9+E7jqt+Ta7YB1mt95eDVSiHN9Kwpi3GNyiDVrygmtGzgmvbHg5
         ju5A==
X-Gm-Message-State: AC+VfDyvs31iWdwmVapgKcJp3OfG4vg1mnykuvEXjqe6w0RT5PapbwhD
	A62G1F5BBSXyWAM6Zae2iXNe3+USjAA=
X-Google-Smtp-Source: ACHHUZ50uiYyUT8SaxGHThOsIudZ4IF/7dcsIMKWNJXOm3Bn+j18zH1ulW0ozpWmtwGTqh2NZtav7g==
X-Received: by 2002:a05:6a00:170e:b0:666:e1f4:5153 with SMTP id h14-20020a056a00170e00b00666e1f45153mr50860pfc.0.1686904277165;
        Fri, 16 Jun 2023 01:31:17 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::eb87])
        by smtp.gmail.com with ESMTPSA id s18-20020aa78d52000000b00653dc27acadsm12969145pfe.205.2023.06.16.01.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jun 2023 01:31:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 5/5] rpcsvc-proto: Upgrade to 1.4.4
Date: Fri, 16 Jun 2023 01:31:11 -0700
Message-ID: <20230616083111.3007680-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230616083111.3007680-1-raj.khem@gmail.com>
References: <20230616083111.3007680-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 08:31:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183005

Drop already upstreamed patch in 1.4.4

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../rpcsvc-proto/rpcsvc-proto.bb              |  5 +-
 ...FILE-macro-to-control-largefile-supp.patch | 80 -------------------
 .../0001-Use-cross-compiled-rpcgen.patch      | 11 +--
 3 files changed, 6 insertions(+), 90 deletions(-)
 delete mode 100644 meta/recipes-extended/rpcsvc-proto/rpcsvc-proto/0001-Use-AC_SYS_LARGEFILE-macro-to-control-largefile-supp.patch

diff --git a/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto.bb b/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto.bb
index 00919a3d70e..20933153a32 100644
--- a/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto.bb
+++ b/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto.bb
@@ -15,13 +15,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0daaf958d5531ab86169ec6e275e1517"
 SECTION = "libs"
 DEPENDS += "rpcsvc-proto-native"
 
-PV = "1.4.3"
+PV = "1.4.4"
 
-SRCREV = "71e0a12c04d130a78674ac6309eefffa6ecee612"
+SRCREV = "c65926005e50da02a4da3e26abc42eded36cd19d"
 
 SRC_URI = "git://github.com/thkukuk/${BPN};branch=master;protocol=https \
            file://0001-Use-cross-compiled-rpcgen.patch \
-           file://0001-Use-AC_SYS_LARGEFILE-macro-to-control-largefile-supp.patch \
            "
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto/0001-Use-AC_SYS_LARGEFILE-macro-to-control-largefile-supp.patch b/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto/0001-Use-AC_SYS_LARGEFILE-macro-to-control-largefile-supp.patch
deleted file mode 100644
index f07866d55ae..00000000000
--- a/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto/0001-Use-AC_SYS_LARGEFILE-macro-to-control-largefile-supp.patch
+++ /dev/null
@@ -1,80 +0,0 @@
-From 6820c53c3952f78185beb59f767c372fc745dcf3 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 11 Dec 2022 21:42:59 -0800
-Subject: [PATCH] Use AC_SYS_LARGEFILE macro to control largefile support
-
-The autoconf macro AC_SYS_LARGEFILE defines _FILE_OFFSET_BITS=64
-where necessary to ensure that off_t and all interfaces using off_t
-are 64bit, even on 32bit systems.
-
-replace stat64 by equivalent stat struct/func
-
-Upstream-Status: Accepted [https://github.com/thkukuk/rpcsvc-proto/pull/15]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure.ac      |  1 +
- rpcgen/rpc_main.c | 16 +++++-----------
- 2 files changed, 6 insertions(+), 11 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index bacc2fb..a9fc730 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -8,6 +8,7 @@ AC_PREFIX_DEFAULT(/usr)
- AC_SUBST(PACKAGE)
- AC_SUBST(VERSION)
- 
-+AC_SYS_LARGEFILE
- AC_PROG_CC
- AC_GNU_SOURCE
- AM_PROG_CC_C_O
-diff --git a/rpcgen/rpc_main.c b/rpcgen/rpc_main.c
-index 277adc6..fd7dea9 100644
---- a/rpcgen/rpc_main.c
-+++ b/rpcgen/rpc_main.c
-@@ -62,12 +62,6 @@
- #define EXTEND	1		/* alias for TRUE */
- #define DONT_EXTEND	0	/* alias for FALSE */
- 
--#ifdef __APPLE__
--# if __DARWIN_ONLY_64_BIT_INO_T
--#  define stat64 stat
--# endif
--#endif
--
- struct commandline
-   {
-     int cflag;			/* xdr C routines */
-@@ -337,9 +331,9 @@ clear_args (void)
- static void
- find_cpp (void)
- {
--  struct stat64 buf;
-+  struct stat buf;
- 
--  if (stat64 (CPP, &buf) == 0)
-+  if (stat (CPP, &buf) == 0)
-     return;
- 
-   if (cppDefined) /* user specified cpp but it does not exist */
-@@ -1125,17 +1119,17 @@ putarg (int whereto, const char *cp)
- static void
- checkfiles (const char *infile, const char *outfile)
- {
--  struct stat64 buf;
-+  struct stat buf;
- 
-   if (infile)			/* infile ! = NULL */
--    if (stat64 (infile, &buf) < 0)
-+    if (stat (infile, &buf) < 0)
-       {
- 	perror (infile);
- 	crash ();
-       }
-   if (outfile)
-     {
--      if (stat64 (outfile, &buf) < 0)
-+      if (stat (outfile, &buf) < 0)
- 	return;			/* file does not exist */
-       else
- 	{
diff --git a/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto/0001-Use-cross-compiled-rpcgen.patch b/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto/0001-Use-cross-compiled-rpcgen.patch
index 208974004b4..8e459b5634f 100644
--- a/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto/0001-Use-cross-compiled-rpcgen.patch
+++ b/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto/0001-Use-cross-compiled-rpcgen.patch
@@ -10,14 +10,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  rpcsvc/Makefile.am | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: git/rpcsvc/Makefile.am
-===================================================================
---- git.orig/rpcsvc/Makefile.am
-+++ git/rpcsvc/Makefile.am
-@@ -12,5 +12,5 @@ nodist_rpcsvc_HEADERS = klm_prot.h nlm_p
+--- a/rpcsvc/Makefile.am
++++ b/rpcsvc/Makefile.am
+@@ -12,4 +12,4 @@ nodist_rpcsvc_HEADERS = klm_prot.h nlm_p
  	nfs_prot.h rquota.h sm_inter.h
  
- %.h: %.x
+ .x.h:
 -	$(top_builddir)/rpcgen/rpcgen -h -o $@ $<
 +	rpcgen -h -o $@ $<
- 
-- 
2.41.0


