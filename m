Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web08.2404.1609185896605520177
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Dec 2020 12:04:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Cqos1qG+;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id p22so10728426edu.11
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Dec 2020 12:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PXFyrmMI6lvKiEHl70UypBK7ZiqqHRu9OPGGHcQNUTk=;
        b=Cqos1qG+x1jxg3REcPC8FuTAm96o13oJuDtGPTCMyt4wx4EdHYYpLmFw3J8zpVEqPv
         r/rsl+x03FqYSFQG+uSmurq8K80VapAzfJHGEfHNxea2FMPUFRB62L3pPM6PwiCEusUm
         hTGSY3jKmMCgRI8MuwkkvVPikjq5Fx65rrmpoLWjSGNI8jxUMg1uV0xOJyywYF8oHriQ
         aGGoZGoZXD9OB3YhQiIthZHXq1cEHRx0TS8DVP7gjj78nIOSnF44u9c4qWE3y68m5i9/
         qRrhGi1kxABP76MHjmVLH2teEeeMp1xb6BwtLyYAbgVrsPDwv8CL9D/Qn9erOHVanWBd
         ejbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PXFyrmMI6lvKiEHl70UypBK7ZiqqHRu9OPGGHcQNUTk=;
        b=X0rPbdn7SM2fVrl9/cjUbx5BYdlLuIFJHBHESGyXyEjTJ3hPVBTIx7gjdZU41s2GLf
         p8xtAgS6wpLbRLAxrDQsuAersKci/TmFi77uiffeI1PpQv9Dfm0zY5qoiQriHfyj8/mR
         vRZMvkQW5oZm30WKZp76NX97+s2mVVrmTcMS7CdZnMy9ImTF/TZcQ+AeeQBmhhA+pFvq
         Xz5VT7q7V9k3GZM2E/3DyJbVUT42ohfMFJPOf0HSKh2Ke5OBSc85rK6IV9OsP5r8rJhz
         UlQHfaQHHpRolarf2WANgiZS8NtYVUXVx1ppbwmdBPi5oPg/rk4qK9hQST39kwF1eDqW
         0zug==
X-Gm-Message-State: AOAM531yumQhtORgWIzAuKjQmyu9lLNxxirKvyR904Db9c3GGsIg5jyi
	I+FNtHD6ylWO4qdtiLe8e1YLbyyFpLw=
X-Google-Smtp-Source: ABdhPJzSPvZlRTLWCfcoWfaA5IKfHmNYXQDzlRWTDwBvfW0YHcQJTLiuelWMfd5PK8OWoSyD04JGdg==
X-Received: by 2002:a50:bb44:: with SMTP id y62mr43553645ede.103.1609185895259;
        Mon, 28 Dec 2020 12:04:55 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost-live.fritz.box ([2a02:2450:1011:4f7:a0c9:fd7f:e532:e1ec])
        by smtp.gmail.com with ESMTPSA id a10sm17447476ejk.92.2020.12.28.12.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Dec 2020 12:04:54 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 16/22] mtools: update 4.0.25 -> 4.0.26
Date: Mon, 28 Dec 2020 21:04:30 +0100
Message-Id: <20201228200436.78130-16-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201228200436.78130-1-alex.kanavin@gmail.com>
References: <20201228200436.78130-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../mtools/disable-hardcoded-configs.patch    |  6 +-
 .../mtools/mtools/mtools-makeinfo.patch       | 78 +++++++++++--------
 .../{mtools_4.0.25.bb => mtools_4.0.26.bb}    |  2 +-
 3 files changed, 48 insertions(+), 38 deletions(-)
 rename meta/recipes-devtools/mtools/{mtools_4.0.25.bb => mtools_4.0.26.bb} (93%)

diff --git a/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch b/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
index 4705890157..f187487096 100644
--- a/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
+++ b/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
@@ -1,4 +1,4 @@
-From c61a3df892ba88d9f3f84c1844481457a04b051f Mon Sep 17 00:00:00 2001
+From 9590860ba35cbd524cec51bdd009f0c63a7dd417 Mon Sep 17 00:00:00 2001
 From: Ed Bartosh <ed.bartosh@linux.intel.com>
 Date: Tue, 13 Jun 2017 14:55:52 +0300
 Subject: [PATCH] Disabled reading host configs.
@@ -12,10 +12,10 @@ Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
  1 file changed, 8 deletions(-)
 
 diff --git a/config.c b/config.c
-index 46af755..5ed9114 100644
+index 415755f..b61a49d 100644
 --- a/config.c
 +++ b/config.c
-@@ -737,14 +737,6 @@ void read_config(void)
+@@ -774,14 +774,6 @@ void read_config(void)
  	memcpy(devices, const_devices,
  	       nr_const_devices*sizeof(struct device));
  
diff --git a/meta/recipes-devtools/mtools/mtools/mtools-makeinfo.patch b/meta/recipes-devtools/mtools/mtools/mtools-makeinfo.patch
index 8ceb0af136..6ae91d6cb9 100644
--- a/meta/recipes-devtools/mtools/mtools/mtools-makeinfo.patch
+++ b/meta/recipes-devtools/mtools/mtools/mtools-makeinfo.patch
@@ -1,9 +1,48 @@
+From 3cf56b36db78679273f61ba78fbbf7f3fab52f68 Mon Sep 17 00:00:00 2001
+From: Marcin Juszkiewicz <hrw@openedhand.com>
+Date: Fri, 8 Jun 2007 08:35:12 +0000
+Subject: [PATCH] mtools: imported from OE
+
 Upstream-Status: Inappropriate [licensing]
 
-Index: mtools-4.0.18/configure.in
-===================================================================
---- mtools-4.0.18.orig/configure.in
-+++ mtools-4.0.18/configure.in
+---
+ Makefile.in  | 11 ++++++-----
+ configure.in | 27 +++++++++++++++++++++++++++
+ 2 files changed, 33 insertions(+), 5 deletions(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index 616d59f..85b5b1d 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -26,10 +26,11 @@ USERCFLAGS =
+ USERLDFLAGS =
+ USERLDLIBS =
+ 
+-MAKEINFO = makeinfo
+-TEXI2DVI = texi2dvi
+-TEXI2PDF = texi2pdf
+-TEXI2HTML = texi2html
++MAKEINFO = @MAKEINFO@
++TEXI2DVI = @TEXI2DVI@
++TEXI2PDF = @TEXI2PDF@
++TEXI2HTML = @TEXI2HTML@
++DVI2PS = @DVI2PS@
+ 
+ 
+ # do not edit below this line
+@@ -199,7 +200,7 @@ dvi: mtools.dvi
+ 
+ ps: mtools.ps
+ %.ps: %.dvi
+-	dvips -f < $< > $@
++	$(DVI2PS) -f < $< > $@
+ 
+ pdf: mtools.pdf
+ %.pdf: %.texi sysconfdir.texi
+diff --git a/configure.in b/configure.in
+index 5ff75c1..c0f7440 100644
+--- a/configure.in
++++ b/configure.in
 @@ -35,6 +35,33 @@ AC_CANONICAL_SYSTEM
  AC_C_CONST
  AC_C_INLINE
@@ -35,35 +74,6 @@ Index: mtools-4.0.18/configure.in
 +AC_SUBST(TEXI2HTML)
 +AC_SUBST(DVI2PS)
 +
- 
  dnl Check for configuration options
  dnl Enable OS/2 extended density format disks
-Index: mtools-4.0.18/Makefile.in
-===================================================================
---- mtools-4.0.18.orig/Makefile.in
-+++ mtools-4.0.18/Makefile.in
-@@ -26,10 +26,11 @@ USERCFLAGS =
- USERLDFLAGS =
- USERLDLIBS =
- 
--MAKEINFO = makeinfo
--TEXI2DVI = texi2dvi
--TEXI2PDF = texi2pdf
--TEXI2HTML = texi2html
-+MAKEINFO = @MAKEINFO@
-+TEXI2DVI = @TEXI2DVI@
-+TEXI2PDF = @TEXI2PDF@
-+TEXI2HTML = @TEXI2HTML@
-+DVI2PS = @DVI2PS@
- 
- 
- # do not edit below this line
-@@ -198,7 +199,7 @@ dvi: mtools.dvi
- 
- ps: mtools.ps
- %.ps: %.dvi
--	dvips -f < $< > $@
-+	$(DVI2PS) -f < $< > $@
- 
- pdf: mtools.pdf
- %.pdf: %.texi sysconfdir.texi
+ AC_ARG_ENABLE(xdf,
diff --git a/meta/recipes-devtools/mtools/mtools_4.0.25.bb b/meta/recipes-devtools/mtools/mtools_4.0.26.bb
similarity index 93%
rename from meta/recipes-devtools/mtools/mtools_4.0.25.bb
rename to meta/recipes-devtools/mtools/mtools_4.0.26.bb
index bca33a28ee..4938713065 100644
--- a/meta/recipes-devtools/mtools/mtools_4.0.25.bb
+++ b/meta/recipes-devtools/mtools/mtools_4.0.26.bb
@@ -24,7 +24,7 @@ RRECOMMENDS_${PN}_libc-glibc = "\
 	glibc-gconv-ibm866 \
 	glibc-gconv-ibm869 \
 	"
-SRC_URI[sha256sum] = "fd161eec3bb7a93d13936db67725ad3e17f2d5f4e6fa8f7667fbc7ac728e2c15"
+SRC_URI[sha256sum] = "539f1c8b476a16e198d8bcb10a5799e22e69de49d854f7dbd85b64c2a45dea1a"
 
 SRC_URI = "${GNU_MIRROR}/mtools/mtools-${PV}.tar.bz2 \
            file://mtools-makeinfo.patch \
-- 
2.29.2

