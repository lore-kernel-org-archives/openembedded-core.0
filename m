Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54ABFD2E026
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 08:43:49 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web10.4275.1729673026852875981
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Oct 2024 01:43:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jYkU6wXR;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: liu.ming50@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2fb443746b8so68396931fa.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 01:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729673024; x=1730277824; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=de2wsXp3kYjlVc8lMoh10tVszh/AUT/+/Kdq83hFN2Q=;
        b=jYkU6wXR1rLFDRyjMmN6d1QX2qi6Rudi6PSVY54046TglHrzNm9saz/ZYciT6TTKci
         KFq/ELaCaNQK5qbO2jRxOjJ+l2cYVFq7L2uQXOIo9X2PPYtTE0ReSOgzsFX9jkeSnelK
         mkVCXW6CcFz+q/5zM/wf7+ASlJvGreC/DwGoW7Ujx9BDWjLs+cwFGhZ4KTCZzhjZaDcq
         NYNN+rkKKmnJnshHfAS0ZNZyD2LSYtyNnud4djco6SzWoFopP0hiarS5Q3AV+egl+nzE
         vHez3+XXZ16ZR0XUXDStZaDEb1zqZPIFS0usGRhoiOV+xLMj0UkLx0zDyvSIu4Ckb6Qv
         bF8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729673024; x=1730277824;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=de2wsXp3kYjlVc8lMoh10tVszh/AUT/+/Kdq83hFN2Q=;
        b=cNwMwH70rZdQL94wiaBpYcJhE93wgM3nrudvjZokWUoBMRuNRv7+0lulqAaVjeELZE
         I3e0Du28iP4vyjl2wcsg/VZvz1HTAWtpuElvXSyUS8kUEEKDKCQv6G17RHhTHBVImwGk
         AOzByHVrwHKTHQAkt1F61tyfLxS0TetxrKBGx2XbJsOP8GbGFbIzcE8MpJ6o/WEVY7/l
         h7TuHQnxn5b4MiPjh0Nacjb1FkqlspuQhrEWRzJXyBdHRzqBGyGrE76Ay2Q4sxCYqRDF
         pSzf64ztiR9WtgvsPCGw3GC0euCMzfcx3oKEIFWTdaFs5mGcj26/t6Lm425UFvMATN8i
         1kZQ==
X-Gm-Message-State: AOJu0YxZgt+JkPg4V6Rz80DqT14RLz/XNtsfHcED1Yck1FE+LmG9P+pq
	uDqe6g74GKfVhismSc2omajJhuc5kjeqh89N04khp7Cd6+CY8gQ05nMqqw==
X-Google-Smtp-Source: AGHT+IGoazZs/rMulLyrCb/H0XKolUY7EPdlzvqTeU1G96j3k+zlzif+fCbwokvYUXTLvjeYB8Wxyg==
X-Received: by 2002:a05:651c:1549:b0:2fb:51e0:91b with SMTP id 38308e7fff4ca-2fc9d588ba7mr8752431fa.43.1729673023813;
        Wed, 23 Oct 2024 01:43:43 -0700 (PDT)
Received: from peterliu-Precision-5680.atlascopco.group ([213.50.243.108])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb66c72609sm4097040a12.88.2024.10.23.01.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 01:43:43 -0700 (PDT)
From: Ming Liu <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [PATCH] screen: uprev to 5.0.0
Date: Wed, 23 Oct 2024 10:43:39 +0200
Message-ID: <20241023084340.823184-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 08:43:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206185

Drop deprecated patches.

Inherit autotools-brokensep instead of autotools, there are some
generated headers in ${B} that referring to ${S}.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 ...0001-Remove-more-compatibility-stuff.patch | 31 ----------
 .../screen/0001-fix-for-multijob-build.patch  | 58 -------------------
 .../0002-comm.h-now-depends-on-term.h.patch   | 30 ----------
 .../{screen_4.9.1.bb => screen_5.0.0.bb}      | 11 ++--
 4 files changed, 4 insertions(+), 126 deletions(-)
 delete mode 100644 meta/recipes-extended/screen/screen/0001-Remove-more-compatibility-stuff.patch
 delete mode 100644 meta/recipes-extended/screen/screen/0001-fix-for-multijob-build.patch
 delete mode 100644 meta/recipes-extended/screen/screen/0002-comm.h-now-depends-on-term.h.patch
 rename meta/recipes-extended/screen/{screen_4.9.1.bb => screen_5.0.0.bb} (79%)

diff --git a/meta/recipes-extended/screen/screen/0001-Remove-more-compatibility-stuff.patch b/meta/recipes-extended/screen/screen/0001-Remove-more-compatibility-stuff.patch
deleted file mode 100644
index 1413724d07..0000000000
--- a/meta/recipes-extended/screen/screen/0001-Remove-more-compatibility-stuff.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-This fixes
-../screen-4.6.2/pty.c: In function 'OpenPTY':
-../screen-4.6.2/pty.c:328:7: warning: implicit declaration of function 'openpty'; did you mean 'openat'? [-Wimplicit-function-declaration]
-   if (openpty(&f, &s, TtyName, NULL, NULL) != 0)
-       ^~~~~~~
-
-Signed-off-by: Amadeusz Sławiński <amade@asmblr.net>
-Signed-off-by: Adrian Bunk <bunk@stusta.de>
-Upstream-Status: Backport
-
----
- pty.c | 6 +-----
- 1 file changed, 1 insertion(+), 5 deletions(-)
-
-diff --git a/pty.c b/pty.c
-index 1c0660e..502338f 100644
---- a/pty.c
-+++ b/pty.c
-@@ -47,11 +47,7 @@
- # include <sys/ttold.h>
- #endif
- 
--#ifdef ISC
--# include <sys/tty.h>
--# include <sys/sioctl.h>
--# include <sys/pty.h>
--#endif
-+#include <pty.h>
- 
- #ifdef sgi
- # include <sys/sysmacros.h>
diff --git a/meta/recipes-extended/screen/screen/0001-fix-for-multijob-build.patch b/meta/recipes-extended/screen/screen/0001-fix-for-multijob-build.patch
deleted file mode 100644
index fbdb0eb478..0000000000
--- a/meta/recipes-extended/screen/screen/0001-fix-for-multijob-build.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 79ad2885e26631077dd6b8aebe17ae95b38133a6 Mon Sep 17 00:00:00 2001
-From: Jackie Huang <jackie.huang@windriver.com>
-Date: Tue, 26 Jul 2016 14:23:59 +0800
-Subject: [PATCH] fix for multijob build
-
-make sure that comm.sh script generates comm.h header before doing
-anything else
-
-Signed-off-by: Amadeusz Sawiski <amade@asmblr.net>
-
-Upstream-Status: Backport
-
-Backport patch to fix parallel build failure and update context to make patch
-coulde be applied.
-
-http://git.savannah.gnu.org/cgit/screen.git/commit?id=c0de6dd
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
----
- Makefile.in | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/Makefile.in b/Makefile.in
-index aca7da3..3607711 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -298,7 +298,7 @@ search.o: layout.h viewport.h canvas.h search.c config.h screen.h os.h osdef.h a
-  comm.h layer.h term.h image.h display.h window.h mark.h extern.h
- tty.o: layout.h viewport.h canvas.h tty.c config.h screen.h os.h osdef.h ansi.h acls.h comm.h \
-  layer.h term.h image.h display.h window.h extern.h
--term.o: layout.h viewport.h canvas.h term.c term.h
-+term.o: layout.h viewport.h canvas.h term.c term.h comm.h
- window.o: layout.h viewport.h canvas.h window.c config.h screen.h os.h osdef.h ansi.h acls.h \
-  comm.h layer.h term.h image.h display.h window.h extern.h logfile.h
- utmp.o: layout.h viewport.h canvas.h utmp.c config.h screen.h os.h osdef.h ansi.h acls.h \
-@@ -324,7 +324,7 @@ canvas.o: layout.h viewport.h canvas.h canvas.c config.h screen.h os.h osdef.h a
-  comm.h layer.h term.h image.h display.h window.h extern.h \
-  braille.h
- comm.o: layout.h viewport.h canvas.h comm.c config.h acls.h comm.h
--kmapdef.o: layout.h viewport.h canvas.h kmapdef.c config.h
-+kmapdef.o: layout.h viewport.h canvas.h kmapdef.c config.h comm.h
- acls.o: layout.h viewport.h canvas.h acls.c config.h screen.h os.h osdef.h ansi.h acls.h comm.h \
-  layer.h term.h image.h display.h window.h extern.h
- braille.o: layout.h viewport.h canvas.h braille.c config.h screen.h os.h osdef.h ansi.h acls.h \
-@@ -350,7 +350,7 @@ layout.o: layout.h viewport.h canvas.h layout.c config.h screen.h os.h osdef.h a
- viewport.o: layout.h viewport.h canvas.h viewport.c config.h screen.h os.h osdef.h ansi.h acls.h \
-  comm.h layer.h term.h image.h display.h window.h extern.h \
-  braille.h
--list_generic.o: list_generic.h list_generic.c layer.h screen.h osdef.h
--list_display.o: list_generic.h list_display.c layer.h screen.h osdef.h
-+list_generic.o: list_generic.h list_generic.c layer.h screen.h osdef.h comm.h
-+list_display.o: list_generic.h list_display.c layer.h screen.h osdef.h comm.h
- list_window.o: list_generic.h list_window.c window.h layer.h screen.h osdef.h comm.h
- 
--- 
-1.9.1
-
diff --git a/meta/recipes-extended/screen/screen/0002-comm.h-now-depends-on-term.h.patch b/meta/recipes-extended/screen/screen/0002-comm.h-now-depends-on-term.h.patch
deleted file mode 100644
index a01dc24751..0000000000
--- a/meta/recipes-extended/screen/screen/0002-comm.h-now-depends-on-term.h.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-Upstream-Status: Backport
-
-Backport from:
-
-http://git.savannah.gnu.org/cgit/screen.git/commit/?id=39c5f1c
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
-From 39c5f1c76f1fcef4b5958bf828a63f53426b6984 Mon Sep 17 00:00:00 2001
-From: Mike Gerwitz <mike@mikegerwitz.com>
-Date: Tue, 24 Dec 2013 22:16:31 -0500
-Subject: [PATCH] comm.h now depends on term.h
-
----
- src/Makefile.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: screen-4.6.1/Makefile.in
-===================================================================
---- screen-4.6.1.orig/Makefile.in
-+++ screen-4.6.1/Makefile.in
-@@ -133,7 +133,7 @@ kmapdef.c: term.h
- tty.c:	tty.sh 
- 	sh $(srcdir)/tty.sh tty.c
- 
--comm.h: comm.c comm.sh config.h
-+comm.h: comm.c comm.sh config.h term.h
- 	AWK=$(AWK) CC="$(CC) $(CFLAGS)" srcdir=${srcdir} sh $(srcdir)/comm.sh
- 
- osdef.h: osdef.sh config.h osdef.h.in
diff --git a/meta/recipes-extended/screen/screen_4.9.1.bb b/meta/recipes-extended/screen/screen_5.0.0.bb
similarity index 79%
rename from meta/recipes-extended/screen/screen_4.9.1.bb
rename to meta/recipes-extended/screen/screen_5.0.0.bb
index 57d1481049..fec5663fc2 100644
--- a/meta/recipes-extended/screen/screen_4.9.1.bb
+++ b/meta/recipes-extended/screen/screen_5.0.0.bb
@@ -8,7 +8,7 @@ BUGTRACKER = "https://savannah.gnu.org/bugs/?func=additem&group=screen"
 SECTION = "console/utils"
 
 LICENSE = "GPL-3.0-or-later"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
+LIC_FILES_CHKSUM = "file://COPYING;md5=c678957b0c8e964aa6c70fd77641a71e \
                     file://screen.h;endline=26;md5=b8dc717c9a3dba842ae6c44ca0f73f52 \
                     "
 
@@ -18,19 +18,16 @@ RDEPENDS:${PN} = "base-files"
 
 SRC_URI = "${GNU_MIRROR}/screen/screen-${PV}.tar.gz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'file://screen.pam', '', d)} \
-           file://0002-comm.h-now-depends-on-term.h.patch \
-           file://0001-fix-for-multijob-build.patch \
-           file://0001-Remove-more-compatibility-stuff.patch \
            "
 
-SRC_URI[sha256sum] = "26cef3e3c42571c0d484ad6faf110c5c15091fbf872b06fa7aa4766c7405ac69"
+SRC_URI[sha256sum] = "f04a39d00a0e5c7c86a55338808903082ad5df4d73df1a2fd3425976aed94971"
 
-inherit autotools texinfo
+inherit autotools-brokensep texinfo
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[utempter] = "ac_cv_header_utempter_h=yes,ac_cv_header_utempter_h=no,libutempter,"
 
-EXTRA_OECONF = "--with-pty-mode=0620 --with-pty-group=5 --with-sys-screenrc=${sysconfdir}/screenrc \
+EXTRA_OECONF = "--with-pty-mode=0620 --with-pty-group=5 --with-system_screenrc=${sysconfdir}/screenrc \
                ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '--enable-pam', '--disable-pam', d)}"
 
 do_install:append () {
-- 
2.43.0


