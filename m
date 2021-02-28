Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.7712.1614526637671814318
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Feb 2021 07:37:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tr5ETXLB;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id do6so23545109ejc.3
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Feb 2021 07:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rTSXU2vsh67c43H5CC3SfjUmPnWbttxPVVDujiWNeVw=;
        b=tr5ETXLBEoySVeaGK+XFtwH4aj3DHasCLxzCAY9Pa7960BwNl15y2BZPqFEIhuY8oz
         wSFuTaDT84mlVsBiCAQ4BTqVc7E6hpQM2i32BrJXAcc7qaApk23ftktlHNzUtZ1b0akU
         YYp9x+L60eIXHI0fa30Q8se7WoLlXfd+TXTKVRumnaZUPtbpCRjEcJ8CqGc3IImPG6S2
         XBItOZiYPK6EYOkKAqdZNdKRJrmpltUReVPDzW47cFGO6rmFOW4a1VOQPanDHegan3y2
         Bhm7hUJtmhEhhepTBYz6m/bMgTBi3fdpdOpDpAdQYjFcP7xiepRbm7XAWD7pEKwML0Lg
         4TcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rTSXU2vsh67c43H5CC3SfjUmPnWbttxPVVDujiWNeVw=;
        b=qzy9nQUKvDJV+flkrlpkMBPlnfMe1T+207OkmGtrUJtCs8atrLgFagZ6dpO5UjjwfN
         57p9sHqhzFKqseRzGe4GpGINqrwVXy+TssWgzFBkPuh7+rj38DUATXA/QDIF5FHjgU/8
         DDedqkaYRf0qEJ9xTfn4thSWaqqlxl58gWd2nogs2PT5uWrgtItz8Tn2lH1C4KRdqql9
         afE7FZhDJLO5mFCB7DTL1k2lGh+NtomYZtPSsJRe9DPE8/ehh0J2xdbATTCh5KAr6orG
         e3zTDiqTi+kwMdujccicNBD/9LWWYPFp5O/knxmaxlAo2yFWyA+mFa4nqhiT6YQrJ/k1
         d3Vg==
X-Gm-Message-State: AOAM531F+PPrshgjK0xiALU44XFpbkS3UUpvq4zKapJHuALVJybGq1K+
	aNjVLNRYbpC2hAEhswg0w9KMEB3UH1/Nag==
X-Google-Smtp-Source: ABdhPJz3mLUOY4JzrOL64y9xjvYm0rkBWix11Lo92zidLIbt9IKG0G9xr4G8F0mWm3yzqd1VBXHZlQ==
X-Received: by 2002:a17:907:9858:: with SMTP id jj24mr11818852ejc.212.1614526636236;
        Sun, 28 Feb 2021 07:37:16 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2450:1011:512:45a5:1b3d:84d2:e7fc])
        by smtp.gmail.com with ESMTPSA id b17sm10234780ejj.9.2021.02.28.07.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Feb 2021 07:37:15 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 06/24] e2fsprogs: update 1.45.7 -> 1.46.1
Date: Sun, 28 Feb 2021 16:36:44 +0100
Message-Id: <20210228153702.498275-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210228153702.498275-1-alex.kanavin@gmail.com>
References: <20210228153702.498275-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop gettext patches; upstream has fixed the issues.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/e2fsprogs/e2fsprogs.inc |  2 +-
 ...-configure.ac-correct-AM_GNU_GETTEXT.patch | 26 ------------------
 ...to-use-gettext-defines-that-no-longe.patch | 27 -------------------
 ...-missing-check-for-permission-denied.patch |  2 +-
 .../e2fsprogs/e2fsprogs/mkdir_p.patch         | 17 +++++++++---
 .../e2fsprogs/e2fsprogs/quiet-debugfs.patch   |  6 ++---
 ...2fsprogs_1.45.7.bb => e2fsprogs_1.46.1.bb} |  5 ++--
 7 files changed, 20 insertions(+), 65 deletions(-)
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-configure.ac-correct-AM_GNU_GETTEXT.patch
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-intl-do-not-try-to-use-gettext-defines-that-no-longe.patch
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.45.7.bb => e2fsprogs_1.46.1.bb} (96%)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
index 009f5ed807..2f113c5e8d 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
@@ -17,7 +17,7 @@ LIC_FILES_CHKSUM = "file://NOTICE;md5=d50be0580c0b0a7fbc7a4830bbe6c12b \
                       file://lib/et/et_name.c;beginline=1;endline=11;md5=ead236447dac7b980dbc5b4804d8c836 \
                       file://lib/ss/ss.h;beginline=1;endline=20;md5=6e89ad47da6e75fecd2b5e0e81e1d4a6"
 SECTION = "base"
-DEPENDS = "util-linux attr"
+DEPENDS = "util-linux attr autoconf-archive"
 
 SRC_URI = "git://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git"
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-configure.ac-correct-AM_GNU_GETTEXT.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-configure.ac-correct-AM_GNU_GETTEXT.patch
deleted file mode 100644
index 2719594c2f..0000000000
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-configure.ac-correct-AM_GNU_GETTEXT.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From f907fea9ea053d5433b5199ce74008664141f753 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Tue, 19 Nov 2019 17:32:33 +0100
-Subject: [PATCH] configure.ac: correct AM_GNU_GETTEXT
-
-New version of gettext require the 'external' argument.
-
-Upstream-Status: Pending
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 654ff43d..4772b97b 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -873,7 +873,7 @@ AC_SUBST(GETTEXT_PACKAGE)
- AC_SUBST(PACKAGE)
- AC_SUBST(VERSION)
- 
--AM_GNU_GETTEXT
-+AM_GNU_GETTEXT([external])
- dnl @MKDIR_P@ is expanded in AM_GNU_GETTEXT
- AC_SUBST([mkdir_p],['$(MKDIR_P)'])
- dnl
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-intl-do-not-try-to-use-gettext-defines-that-no-longe.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-intl-do-not-try-to-use-gettext-defines-that-no-longe.patch
deleted file mode 100644
index 31b585fc9a..0000000000
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-intl-do-not-try-to-use-gettext-defines-that-no-longe.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From d034239f05cfba849f6ad16eb3f1ea37efbe4f95 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Tue, 19 Nov 2019 18:34:00 +0100
-Subject: [PATCH] intl: do not try to use gettext defines that no longer exist
-
-Newer version of gettext no longer define this in m4 files,
-so patch it out until e2fsprogs upstream sorts the situation.
-
-Upstream-Status: Inappropriate [hardcodes a choice]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- intl/Makefile.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/intl/Makefile.in b/intl/Makefile.in
-index e037e23c..89a876b8 100644
---- a/intl/Makefile.in
-+++ b/intl/Makefile.in
-@@ -175,7 +175,7 @@ libgnuintl.h.msvc-static libgnuintl.h.msvc-shared README.woe32 Makefile.msvc
- DISTFILES.obsolete = xopen-msg.sed linux-msg.sed po2tbl.sed.in cat-compat.c \
- COPYING.LIB-2 gettext.h libgettext.h plural-eval.c libgnuintl.h
- 
--all: all-@USE_INCLUDED_LIBINTL@
-+all:
- all-yes: libintl.$la libintl.h charset.alias ref-add.sed ref-del.sed
- all-no: all-no-@BUILD_INCLUDED_LIBINTL@
- all-no-yes: libgnuintl.$la
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsprogs-fix-missing-check-for-permission-denied.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsprogs-fix-missing-check-for-permission-denied.patch
index 284ac90196..d7c07c3b0f 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsprogs-fix-missing-check-for-permission-denied.patch
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsprogs-fix-missing-check-for-permission-denied.patch
@@ -1,4 +1,4 @@
-From b55dfb4b62e507ae4f0814aec7597b56f9d6292a Mon Sep 17 00:00:00 2001
+From 9263b8764702f2b26ddaaf80808ebab31a1dba3b Mon Sep 17 00:00:00 2001
 From: Jackie Huang <jackie.huang@windriver.com>
 Date: Wed, 10 Aug 2016 11:19:44 +0800
 Subject: [PATCH] Fix missing check for permission denied.
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/mkdir_p.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/mkdir_p.patch
index b0fa4b8cc5..f6916a1112 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/mkdir_p.patch
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/mkdir_p.patch
@@ -1,18 +1,27 @@
-e2fsprogs: expand @mkdir_p@
+From e3a30baa5c1e2f0ac7e246539db1c7db5a2fe302 Mon Sep 17 00:00:00 2001
+From: Joe Slater <jslater@windriver.com>
+Date: Tue, 7 Mar 2017 14:53:19 -0800
+Subject: [PATCH] e2fsprogs: expand @mkdir_p@
 
 Add AC_SUBST to configure.ac.  @mkdir_p@ is currently
-not expanded so no locale data is written into usr/share/locale. 
+not expanded so no locale data is written into usr/share/locale.
 
 Upstream-Status: Pending
 
 Signed-off-by: Joe Slater <jslater@windriver.com>
 
+---
+ configure.ac | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 4c4b5523..3475c707 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -811,6 +811,8 @@ AC_SUBST(PACKAGE)
+@@ -919,6 +919,8 @@ AC_SUBST(PACKAGE)
  AC_SUBST(VERSION)
  
- AM_GNU_GETTEXT
+ AM_GNU_GETTEXT([external])
 +dnl @MKDIR_P@ is expanded in AM_GNU_GETTEXT
 +AC_SUBST([mkdir_p],['$(MKDIR_P)'])
  dnl
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/quiet-debugfs.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/quiet-debugfs.patch
index aac88eed98..88d0ae77c9 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/quiet-debugfs.patch
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/quiet-debugfs.patch
@@ -1,4 +1,4 @@
-From 9aa68ad81b97847dda3493145f4b0a7cc580c551 Mon Sep 17 00:00:00 2001
+From 6e4c1644a3a8cacf7c1f5953cc378589bb046d5a Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Mon, 23 Dec 2013 13:38:34 +0000
 Subject: [PATCH] e2fsprogs: silence debugfs
@@ -14,10 +14,10 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/debugfs/debugfs.c b/debugfs/debugfs.c
-index 15b01214..15164df2 100644
+index 132c5f9d..98063727 100644
 --- a/debugfs/debugfs.c
 +++ b/debugfs/debugfs.c
-@@ -2492,7 +2492,7 @@ static int source_file(const char *cmd_file, int ss_idx)
+@@ -2510,7 +2510,7 @@ static int source_file(const char *cmd_file, int ss_idx)
  		cp = strchr(buf, '\r');
  		if (cp)
  			*cp = 0;
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.7.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb
similarity index 96%
rename from meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.7.bb
rename to meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb
index 1a00807757..be8b67c35d 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.7.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb
@@ -4,15 +4,14 @@ SRC_URI += "file://remove.ldconfig.call.patch \
            file://run-ptest \
            file://ptest.patch \
            file://mkdir_p.patch \
-           file://0001-configure.ac-correct-AM_GNU_GETTEXT.patch \
-           file://0001-intl-do-not-try-to-use-gettext-defines-that-no-longe.patch \
            "
 
 SRC_URI_append_class-native = " file://e2fsprogs-fix-missing-check-for-permission-denied.patch \
                                 file://quiet-debugfs.patch \
 "
 
-SRCREV = "5403970e44241cec26f98aaa0124b9881b4bbf4f"
+
+SRCREV = "3114c623f56b0d61f5f34b85f7b23d28f6c848c0"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+(\.\d+)*)$"
 
 EXTRA_OECONF += "--libdir=${base_libdir} --sbindir=${base_sbindir} \
-- 
2.29.2

