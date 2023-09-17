Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A784BCD13DE
	for <webhook@archiver.kernel.org>; Sun, 17 Sep 2023 09:39:26 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.27147.1694943560659153964
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Sep 2023 02:39:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RVU94faT;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-9a645e54806so432618566b.0
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Sep 2023 02:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694943559; x=1695548359; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NnDvR1XXZrZsivP9GoVJqitJy5qP+rngxlgJYzcNBmM=;
        b=RVU94faTj3WK+EdWVfknrVEX5oSheNzkI1503SpWrUfVWSxvmCHVqBq7nEZ4p8t/5g
         +iJiw2YadIBucGnnU23slJ6oKCIrlEDOp91PgVFAK6aw/Xp/ECacfq1t7whoMQ7u0DRf
         41YfSDzWwfGMZQaV5n7qdKVxejgJL1oNUW9fjVzWpjHV/4CzFuUm/naqOAh9AxMie8Qh
         DyFLiH+qQHAcdkVlgdyCFRxZmBANXaQxwdKnGCxUWLnRgDU55LkyfY4EfCLgSpoZOgws
         CYSXbN3IMc8CZOASzD9ctHcjsu6DrxQ1h1iudsXHzgHMrSerhMBtHUPE42F8Xio094s2
         aW9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694943559; x=1695548359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NnDvR1XXZrZsivP9GoVJqitJy5qP+rngxlgJYzcNBmM=;
        b=NWrz52jztvYtrpZQQ3N32vi3m55grKk6Uidpnos6tDQT0hsZwkAehY66fCiEFNbglJ
         akis6+CfaKSpUEcKMj5F1tYd993+NbIlft85D8katv1YZX22lWWRarubdx2jx1EhKUyi
         viVFJIdBsvB2IJRkCrCXa8SDpX7zIm4P9UY/q8Q420W0tc2RZwLP9d9MUI0S6FSTBqOE
         EZHb+SyAn16diFUXKz2pQ1sEK8Bx/PYoHB5fE/J9We0QT32Wz3yxgH8IChgt8EbKiEnh
         vsB6CK66tDDdIKnKKmPtRDIdfXGdCBD4did+hF5VlCpaWI15kfqMzz9NDXR/szWv3ze4
         Hc1w==
X-Gm-Message-State: AOJu0YwxwdProD+mG/9nCB4atXUSLS2WRNK8Jc3+9UILdreLspq1Pzp4
	57d6jKXKre/IGxaUsv5DWnvrWwBLCpU=
X-Google-Smtp-Source: AGHT+IEu9LsisO2qCeB4PGyPYGQ7zSD+aEMBI52/m/6tumncr6I7vNMFB1Lg49Vv8Q0nyGtQpEWBbw==
X-Received: by 2002:a17:906:5306:b0:9ad:eb9c:dd00 with SMTP id h6-20020a170906530600b009adeb9cdd00mr2714622ejo.12.1694943559111;
        Sun, 17 Sep 2023 02:39:19 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d8-20020a17090694c800b0099ce188be7fsm4779683ejy.3.2023.09.17.02.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Sep 2023 02:39:18 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 24/29] screen: update 4.9.0 -> 4.9.1
Date: Sun, 17 Sep 2023 11:38:56 +0200
Message-Id: <20230917093901.428214-24-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230917093901.428214-1-alex@linutronix.de>
References: <20230917093901.428214-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Sep 2023 09:39:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187797

Remove patches; they are merged upstream or backported.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...-Add-needed-system-headers-in-checks.patch | 151 ------------------
 .../screen/screen/signal-permission.patch     |  40 -----
 .../{screen_4.9.0.bb => screen_4.9.1.bb}      |   4 +-
 3 files changed, 1 insertion(+), 194 deletions(-)
 delete mode 100644 meta/recipes-extended/screen/screen/0001-configure-Add-needed-system-headers-in-checks.patch
 delete mode 100644 meta/recipes-extended/screen/screen/signal-permission.patch
 rename meta/recipes-extended/screen/{screen_4.9.0.bb => screen_4.9.1.bb} (89%)

diff --git a/meta/recipes-extended/screen/screen/0001-configure-Add-needed-system-headers-in-checks.patch b/meta/recipes-extended/screen/screen/0001-configure-Add-needed-system-headers-in-checks.patch
deleted file mode 100644
index 80659942c73..00000000000
--- a/meta/recipes-extended/screen/screen/0001-configure-Add-needed-system-headers-in-checks.patch
+++ /dev/null
@@ -1,151 +0,0 @@
-From 4e102de2e6204c1d8e8be00bb5ffd4587e70350c Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 15 Aug 2022 10:35:53 -0700
-Subject: [PATCH] configure: Add needed system headers in checks
-
-Newer compilers throw warnings when a funciton is used with implicit
-declaration and enabling -Werror can silently fail these tests and
-result in wrong configure results. Therefore add the needed headers in
-the AC_TRY_LINK macros
-
-	* configure.ac: Add missing system headers in AC_TRY_LINK.
-
-Upstream-Status: Submitted [https://lists.gnu.org/archive/html/screen-devel/2022-08/msg00000.html]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure.ac | 57 +++++++++++++++++++++++++++++++++++++++-------------
- 1 file changed, 43 insertions(+), 14 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index c0f02df..d308079 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -233,6 +233,7 @@ AC_CHECKING(BSD job jontrol)
- AC_TRY_LINK(
- [#include <sys/types.h>
- #include <sys/ioctl.h>
-+#include <unistd.h>
- ], [
- #ifdef POSIX
- tcsetpgrp(0, 0);
-@@ -250,12 +251,16 @@ dnl
- dnl    ****  setresuid(), setreuid(), seteuid()  ****
- dnl
- AC_CHECKING(setresuid)
--AC_TRY_LINK(,[
--setresuid(0, 0, 0);
-+AC_TRY_LINK([
-+#include <unistd.h>
-+],[
-+return setresuid(0, 0, 0);
- ], AC_DEFINE(HAVE_SETRESUID))
- AC_CHECKING(setreuid)
--AC_TRY_LINK(,[
--setreuid(0, 0);
-+AC_TRY_LINK([
-+#include <unistd.h>
-+],[
-+return setreuid(0, 0);
- ], AC_DEFINE(HAVE_SETREUID))
- dnl
- dnl seteuid() check:
-@@ -274,7 +279,9 @@ seteuid(0);
- 
- dnl execvpe
- AC_CHECKING(execvpe)
--AC_TRY_LINK(,[
-+AC_TRY_LINK([
-+    #include <unistd.h>
-+],[
-     execvpe(0, 0, 0);
- ], AC_DEFINE(HAVE_EXECVPE)
- CFLAGS="$CFLAGS -D_GNU_SOURCE")
-@@ -284,10 +291,18 @@ dnl    ****  select()  ****
- dnl
- 
- AC_CHECKING(select)
--AC_TRY_LINK(,[select(0, 0, 0, 0, 0);],, 
-+AC_TRY_LINK([
-+    #include <sys/select.h>
-+],[
-+    select(0, 0, 0, 0, 0);
-+],, 
- LIBS="$LIBS -lnet -lnsl"
- AC_CHECKING(select with $LIBS)
--AC_TRY_LINK(,[select(0, 0, 0, 0, 0);],, 
-+AC_TRY_LINK([
-+    #include <sys/select.h>
-+],[
-+    select(0, 0, 0, 0, 0);
-+],, 
- AC_MSG_ERROR(!!! no select - no screen))
- )
- dnl
-@@ -624,11 +639,19 @@ dnl
- dnl    ****  termcap or terminfo  ****
- dnl
- AC_CHECKING(for tgetent)
--AC_TRY_LINK(,tgetent((char *)0, (char *)0);,,
-+AC_TRY_LINK([
-+    #include <curses.h>
-+    #include <term.h>
-+],[
-+    tgetent((char *)0, (char *)0);
-+],,
- olibs="$LIBS"
- LIBS="-lcurses $olibs"
- AC_CHECKING(libcurses)
--AC_TRY_LINK(,[
-+AC_TRY_LINK([
-+    #include <curses.h>
-+    #include <term.h>
-+],[
- #ifdef __hpux
- __sorry_hpux_libcurses_is_totally_broken_in_10_10();
- #else
-@@ -871,7 +894,7 @@ test -f /usr/lib/libutil.a && LIBS="$LIBS -lutil"
- fi
- 
- AC_CHECKING(getloadavg)
--AC_TRY_LINK(,[getloadavg((double *)0, 0);],
-+AC_TRY_LINK([#include <stdlib.h>],[getloadavg((double *)0, 0);],
- AC_DEFINE(LOADAV_GETLOADAVG) load=1,
- if test "$cross_compiling" = no && test -f /usr/lib/libkvm.a ; then
- olibs="$LIBS"
-@@ -1109,10 +1132,10 @@ AC_CHECKING(IRIX sun library)
- AC_TRY_LINK(,,,LIBS="$oldlibs")
- 
- AC_CHECKING(syslog)
--AC_TRY_LINK(,[closelog();], , [oldlibs="$LIBS"
-+AC_TRY_LINK([#include <syslog.h>],[closelog();], , [oldlibs="$LIBS"
- LIBS="$LIBS -lbsd"
- AC_CHECKING(syslog in libbsd.a)
--AC_TRY_LINK(, [closelog();], AC_NOTE(- found.), [LIBS="$oldlibs"
-+AC_TRY_LINK([#include <syslog.h>], [closelog();], AC_NOTE(- found.), [LIBS="$oldlibs"
- AC_NOTE(- bad news: syslog missing.) AC_DEFINE(NOSYSLOG)])])
- 
- AC_EGREP_CPP(YES_IS_DEFINED,
-@@ -1149,7 +1172,7 @@ AC_CHECKING(getspnam)
- AC_TRY_LINK([#include <shadow.h>], [getspnam("x");],AC_DEFINE(SHADOWPW))
- 
- AC_CHECKING(getttyent)
--AC_TRY_LINK(,[getttyent();], AC_DEFINE(GETTTYENT))
-+AC_TRY_LINK([#include <ttyent.h>],[getttyent();], AC_DEFINE(GETTTYENT))
- 
- AC_CHECKING(fdwalk)
- AC_TRY_LINK([#include <stdlib.h>], [fdwalk(NULL, NULL);],AC_DEFINE(HAVE_FDWALK))
-@@ -1204,7 +1227,13 @@ main() {
- AC_SYS_LONG_FILE_NAMES
- 
- AC_MSG_CHECKING(for vsprintf)
--AC_TRY_LINK([#include <stdarg.h>],[va_list valist; vsprintf(0,0,valist);], AC_MSG_RESULT(yes);AC_DEFINE(USEVARARGS), AC_MSG_RESULT(no))
-+AC_TRY_LINK([
-+    #include <stdarg.h>
-+    #include <stdio.h>
-+],[
-+   va_list valist;
-+   vsprintf(0,0,valist);
-+], AC_MSG_RESULT(yes);AC_DEFINE(USEVARARGS), AC_MSG_RESULT(no))
- 
- AC_HEADER_DIRENT
- 
diff --git a/meta/recipes-extended/screen/screen/signal-permission.patch b/meta/recipes-extended/screen/screen/signal-permission.patch
deleted file mode 100644
index 77dc649090a..00000000000
--- a/meta/recipes-extended/screen/screen/signal-permission.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From e9ad41bfedb4537a6f0de20f00b27c7739f168f7 Mon Sep 17 00:00:00 2001
-From: Alexander Naumov <alexander_naumov@opensuse.org>
-Date: Mon, 30 Jan 2023 17:22:25 +0200
-Subject: fix: missing signal sending permission check on failed query messages
-
-Signed-off-by: Alexander Naumov <alexander_naumov@opensuse.org>
-
-CVE: CVE-2023-24626
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- src/socket.c | 9 +++++++--
- 1 file changed, 7 insertions(+), 2 deletions(-)
-
-diff --git a/src/socket.c b/src/socket.c
-index 147dc54..54d8cb8 100644
---- a/socket.c
-+++ b/socket.c
-@@ -1285,11 +1285,16 @@ ReceiveMsg()
-           else
-             queryflag = -1;
- 
--          Kill(m.m.command.apid,
-+          if (CheckPid(m.m.command.apid)) {
-+            Msg(0, "Query attempt with bad pid(%d)!", m.m.command.apid);
-+          }
-+          else {
-+            Kill(m.m.command.apid,
-                (queryflag >= 0)
-                    ? SIGCONT
-                    : SIG_BYE); /* Send SIG_BYE if an error happened */
--          queryflag = -1;
-+            queryflag = -1;
-+          }
-         }
-         break;
-       case MSG_COMMAND:
--- 
-cgit v1.1
-
diff --git a/meta/recipes-extended/screen/screen_4.9.0.bb b/meta/recipes-extended/screen/screen_4.9.1.bb
similarity index 89%
rename from meta/recipes-extended/screen/screen_4.9.0.bb
rename to meta/recipes-extended/screen/screen_4.9.1.bb
index 235cd8c6cfc..7b040e6b578 100644
--- a/meta/recipes-extended/screen/screen_4.9.0.bb
+++ b/meta/recipes-extended/screen/screen_4.9.1.bb
@@ -21,11 +21,9 @@ SRC_URI = "${GNU_MIRROR}/screen/screen-${PV}.tar.gz \
            file://0002-comm.h-now-depends-on-term.h.patch \
            file://0001-fix-for-multijob-build.patch \
            file://0001-Remove-more-compatibility-stuff.patch \
-           file://0001-configure-Add-needed-system-headers-in-checks.patch \
-           file://signal-permission.patch \
            "
 
-SRC_URI[sha256sum] = "f9335281bb4d1538ed078df78a20c2f39d3af9a4e91c57d084271e0289c730f4"
+SRC_URI[sha256sum] = "26cef3e3c42571c0d484ad6faf110c5c15091fbf872b06fa7aa4766c7405ac69"
 
 inherit autotools texinfo
 
-- 
2.30.2


