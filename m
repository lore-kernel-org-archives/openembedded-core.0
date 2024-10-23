Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 804AFD2E03A
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 09:44:39 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web10.4958.1729676675031525518
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Oct 2024 02:44:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LLiAE70w;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: liu.ming50@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a9a1b71d7ffso1030174266b.1
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 02:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729676673; x=1730281473; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tkxoLzS14X5B7OR1h2/eJqaFXmtqHBnpOxuoNPUxOFA=;
        b=LLiAE70wZMQSEcywXLbmGc9jDS7gmOUwj0tfxEHl9/rFKYi8M7hYBkqZprXDK0k7rP
         uRciHeyc6RK1XgZVh7znc3fiIavWux65pOPUXcEIrNob7pV4Oj02T/cND2aQo0ZQYVHq
         37h2RBdfgiRB1jA8v0arbpBGRDPE8VLYceBD5CZIu71MxVdm2O4pFlX2uDzzwO4GF/mV
         7W0nCk2trcY/EPM8o2K4X1VyTVCc7CtGXit4BTvCrwD2TvpoL+v9+3MYiE/g2HPTwt9R
         RmFwQ9hzS0AGyrkTaHHMtyIUmelG3Nw4V1c4yq2BOghRl7ZP4Qb3GfBgO1jv4C13xPA1
         Anyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729676673; x=1730281473;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tkxoLzS14X5B7OR1h2/eJqaFXmtqHBnpOxuoNPUxOFA=;
        b=ny11spLChBHPuOGPtZAkEjS8vHoquwcMhEeaOSvxN3vbUvpjleUqPk3kidoJXrkGy/
         BPgOKHtWC8IK51h63W1d+tMuQtG2wDr6KjAc4PCse+0mGr2F9S889RRQBMxIlRzLzikn
         Rf4bFXkyyzfGreqahMq1o3ttvjhHHlv3dM2zNbd4aG8rElfxZfqLDriT6Xssvn285osy
         7Oz8x7YK3ZkLLq6F+8hzZ80ePZBIqc/1HUPAxMqa3p/H4Hfvz8jsmu/hoAD75e+2csmi
         FM28nHjD1sMwqxeZVOyXk9odLdkAVc2HDBB4xrDUR2jptTSB+c6Sd+ZC7anxphdvW0vS
         V0Kg==
X-Gm-Message-State: AOJu0Yy3IdyuHjYKNFrPxmw2vBrmIa5KUrGmPJU2Ah0pY4AvU2d5XHp7
	Cu8EkCLWfsfWF9txSP/cB6HCtd0MSqjv7eVzSOm9zrZxSruw6lTIc+ECcQ==
X-Google-Smtp-Source: AGHT+IGZnjA8rBQnctjffSQ+S1Sawgc9092xRvVwnPtHTnDScfiRs47d0Qi524Z0nrn+2sjGW6KPVw==
X-Received: by 2002:a17:907:2ce4:b0:a9a:d23:f8ca with SMTP id a640c23a62f3a-a9abf84acb1mr182950766b.13.1729676672574;
        Wed, 23 Oct 2024 02:44:32 -0700 (PDT)
Received: from peterliu-Precision-5680.atlascopco.group ([213.50.243.108])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a912d639asm451288666b.5.2024.10.23.02.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 02:44:32 -0700 (PDT)
From: Ming Liu <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [PATCH V2] screen: uprev to 5.0.0
Date: Wed, 23 Oct 2024 11:44:26 +0200
Message-ID: <20241023094428.3417173-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 09:44:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206191

License-Update: A typo "httpss->https" fixed in Copyright.

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


