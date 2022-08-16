Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFEE4C25B0D
	for <webhook@archiver.kernel.org>; Tue, 16 Aug 2022 03:30:15 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web08.11704.1660620609381524746
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Aug 2022 20:30:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bVFkDTuE;
 spf=pass (domain: gmail.com, ip: 209.85.215.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 24so8180755pgr.7
        for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Aug 2022 20:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=z1afqLnQhqllfmpYCc0P2HFLvFN29PUrQNPwN0sGb5c=;
        b=bVFkDTuEasqwBuR8vp7y/TmJfo7b+LCvh2tsifrNCOmqac9/jtrR+GGgzwdG/CyB6F
         IaTako+fjkXu3JHnvIFmU/Dd8fTo72pg+irpnzZTrJp4Pzi8J+eyUZIZMv2MlLiw5zrD
         qYeyslBJpHFuJ49t3xTOhnABfcpD9lsO3dB5IVizT5UVs7RPyblqiHhBcGYcQW7n6rNU
         /9PRz8FYoFwqZZLYkQt9qqLkZlzfoz4sMgr0PZKBkqwzhGJR+yjzXicL7VxFQ1pJmHDw
         6ttK9lFpOSJsvzzqoLCUw3mF3lFPEbXYPBZFOO0lvEnqLRdwOOGhVHo06/6wCmhev0QE
         hwrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=z1afqLnQhqllfmpYCc0P2HFLvFN29PUrQNPwN0sGb5c=;
        b=w3rtSZOxcW91dDEmpK8LoRy1US6PCvdTzanNSpj8ghwq4wWSs6oyRzGNsL5K8l1oAQ
         hhczE20Eoy4KVTkHTVsnECol6yuva21C7zCkmWlR0bpoYm6574RfPQqQeaLrgNOgEwC3
         Cg7dUv7Os7ff+9xMkVsGzyVxT9VnBzzcNvps24vPfVb2HgkyqoEdtkdTbEa1zKzWR59i
         pHFEvz+BjmtFiwF5pGoiPVedf4odGebtsMxWGCZfsCRWjB6GZmkTccfHmzChIILKcwL7
         +Ixuuv7EbA+SsR3pluTUIaisizJ/YgYgcNF6gd13WX1MgpplDRNJpZqgO+YcaGnvuPYs
         +efA==
X-Gm-Message-State: ACgBeo3oG5Tv9dYw8KXmoCWNgsCAURsI9HBmRf7DZ3BzIjSIDZDgfmax
	RbCpv1SKUBVXFEuF17S7Oa1wOOUVXeEdKA==
X-Google-Smtp-Source: 
 AA6agR70Ii5EHEIuJPT6wbK8fZ/XrZodKFob7v+iy4zip/KYTxKJjiPpbfnA29vCjc7yET008hvxZQ==
X-Received: by 2002:a63:6b06:0:b0:41b:79c9:7313 with SMTP id
 g6-20020a636b06000000b0041b79c97313mr16169425pgc.409.1660620609624;
        Mon, 15 Aug 2022 20:30:09 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bb7a])
        by smtp.gmail.com with ESMTPSA id
 b190-20020a621bc7000000b0052d87b76d12sm7218807pfb.68.2022.08.15.20.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Aug 2022 20:30:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/6] screen: Add missing include files in configure checks
Date: Mon, 15 Aug 2022 20:30:01 -0700
Message-Id: <20220816033005.2700801-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220816033005.2700801-1-raj.khem@gmail.com>
References: <20220816033005.2700801-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Aug 2022 03:30:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169416

Fixes builds with -Werror

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-Add-needed-system-headers-in-checks.patch | 151 ++++++++++++++++++
 meta/recipes-extended/screen/screen_4.9.0.bb  |   3 +-
 2 files changed, 153 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/screen/screen/0001-configure-Add-needed-system-headers-in-checks.patch

diff --git a/meta/recipes-extended/screen/screen/0001-configure-Add-needed-system-headers-in-checks.patch b/meta/recipes-extended/screen/screen/0001-configure-Add-needed-system-headers-in-checks.patch
new file mode 100644
index 00000000000..80659942c73
--- /dev/null
+++ b/meta/recipes-extended/screen/screen/0001-configure-Add-needed-system-headers-in-checks.patch
@@ -0,0 +1,151 @@
+From 4e102de2e6204c1d8e8be00bb5ffd4587e70350c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 15 Aug 2022 10:35:53 -0700
+Subject: [PATCH] configure: Add needed system headers in checks
+
+Newer compilers throw warnings when a funciton is used with implicit
+declaration and enabling -Werror can silently fail these tests and
+result in wrong configure results. Therefore add the needed headers in
+the AC_TRY_LINK macros
+
+	* configure.ac: Add missing system headers in AC_TRY_LINK.
+
+Upstream-Status: Submitted [https://lists.gnu.org/archive/html/screen-devel/2022-08/msg00000.html]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 57 +++++++++++++++++++++++++++++++++++++++-------------
+ 1 file changed, 43 insertions(+), 14 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index c0f02df..d308079 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -233,6 +233,7 @@ AC_CHECKING(BSD job jontrol)
+ AC_TRY_LINK(
+ [#include <sys/types.h>
+ #include <sys/ioctl.h>
++#include <unistd.h>
+ ], [
+ #ifdef POSIX
+ tcsetpgrp(0, 0);
+@@ -250,12 +251,16 @@ dnl
+ dnl    ****  setresuid(), setreuid(), seteuid()  ****
+ dnl
+ AC_CHECKING(setresuid)
+-AC_TRY_LINK(,[
+-setresuid(0, 0, 0);
++AC_TRY_LINK([
++#include <unistd.h>
++],[
++return setresuid(0, 0, 0);
+ ], AC_DEFINE(HAVE_SETRESUID))
+ AC_CHECKING(setreuid)
+-AC_TRY_LINK(,[
+-setreuid(0, 0);
++AC_TRY_LINK([
++#include <unistd.h>
++],[
++return setreuid(0, 0);
+ ], AC_DEFINE(HAVE_SETREUID))
+ dnl
+ dnl seteuid() check:
+@@ -274,7 +279,9 @@ seteuid(0);
+ 
+ dnl execvpe
+ AC_CHECKING(execvpe)
+-AC_TRY_LINK(,[
++AC_TRY_LINK([
++    #include <unistd.h>
++],[
+     execvpe(0, 0, 0);
+ ], AC_DEFINE(HAVE_EXECVPE)
+ CFLAGS="$CFLAGS -D_GNU_SOURCE")
+@@ -284,10 +291,18 @@ dnl    ****  select()  ****
+ dnl
+ 
+ AC_CHECKING(select)
+-AC_TRY_LINK(,[select(0, 0, 0, 0, 0);],, 
++AC_TRY_LINK([
++    #include <sys/select.h>
++],[
++    select(0, 0, 0, 0, 0);
++],, 
+ LIBS="$LIBS -lnet -lnsl"
+ AC_CHECKING(select with $LIBS)
+-AC_TRY_LINK(,[select(0, 0, 0, 0, 0);],, 
++AC_TRY_LINK([
++    #include <sys/select.h>
++],[
++    select(0, 0, 0, 0, 0);
++],, 
+ AC_MSG_ERROR(!!! no select - no screen))
+ )
+ dnl
+@@ -624,11 +639,19 @@ dnl
+ dnl    ****  termcap or terminfo  ****
+ dnl
+ AC_CHECKING(for tgetent)
+-AC_TRY_LINK(,tgetent((char *)0, (char *)0);,,
++AC_TRY_LINK([
++    #include <curses.h>
++    #include <term.h>
++],[
++    tgetent((char *)0, (char *)0);
++],,
+ olibs="$LIBS"
+ LIBS="-lcurses $olibs"
+ AC_CHECKING(libcurses)
+-AC_TRY_LINK(,[
++AC_TRY_LINK([
++    #include <curses.h>
++    #include <term.h>
++],[
+ #ifdef __hpux
+ __sorry_hpux_libcurses_is_totally_broken_in_10_10();
+ #else
+@@ -871,7 +894,7 @@ test -f /usr/lib/libutil.a && LIBS="$LIBS -lutil"
+ fi
+ 
+ AC_CHECKING(getloadavg)
+-AC_TRY_LINK(,[getloadavg((double *)0, 0);],
++AC_TRY_LINK([#include <stdlib.h>],[getloadavg((double *)0, 0);],
+ AC_DEFINE(LOADAV_GETLOADAVG) load=1,
+ if test "$cross_compiling" = no && test -f /usr/lib/libkvm.a ; then
+ olibs="$LIBS"
+@@ -1109,10 +1132,10 @@ AC_CHECKING(IRIX sun library)
+ AC_TRY_LINK(,,,LIBS="$oldlibs")
+ 
+ AC_CHECKING(syslog)
+-AC_TRY_LINK(,[closelog();], , [oldlibs="$LIBS"
++AC_TRY_LINK([#include <syslog.h>],[closelog();], , [oldlibs="$LIBS"
+ LIBS="$LIBS -lbsd"
+ AC_CHECKING(syslog in libbsd.a)
+-AC_TRY_LINK(, [closelog();], AC_NOTE(- found.), [LIBS="$oldlibs"
++AC_TRY_LINK([#include <syslog.h>], [closelog();], AC_NOTE(- found.), [LIBS="$oldlibs"
+ AC_NOTE(- bad news: syslog missing.) AC_DEFINE(NOSYSLOG)])])
+ 
+ AC_EGREP_CPP(YES_IS_DEFINED,
+@@ -1149,7 +1172,7 @@ AC_CHECKING(getspnam)
+ AC_TRY_LINK([#include <shadow.h>], [getspnam("x");],AC_DEFINE(SHADOWPW))
+ 
+ AC_CHECKING(getttyent)
+-AC_TRY_LINK(,[getttyent();], AC_DEFINE(GETTTYENT))
++AC_TRY_LINK([#include <ttyent.h>],[getttyent();], AC_DEFINE(GETTTYENT))
+ 
+ AC_CHECKING(fdwalk)
+ AC_TRY_LINK([#include <stdlib.h>], [fdwalk(NULL, NULL);],AC_DEFINE(HAVE_FDWALK))
+@@ -1204,7 +1227,13 @@ main() {
+ AC_SYS_LONG_FILE_NAMES
+ 
+ AC_MSG_CHECKING(for vsprintf)
+-AC_TRY_LINK([#include <stdarg.h>],[va_list valist; vsprintf(0,0,valist);], AC_MSG_RESULT(yes);AC_DEFINE(USEVARARGS), AC_MSG_RESULT(no))
++AC_TRY_LINK([
++    #include <stdarg.h>
++    #include <stdio.h>
++],[
++   va_list valist;
++   vsprintf(0,0,valist);
++], AC_MSG_RESULT(yes);AC_DEFINE(USEVARARGS), AC_MSG_RESULT(no))
+ 
+ AC_HEADER_DIRENT
+ 
diff --git a/meta/recipes-extended/screen/screen_4.9.0.bb b/meta/recipes-extended/screen/screen_4.9.0.bb
index b36173b8dee..77e8000bf3b 100644
--- a/meta/recipes-extended/screen/screen_4.9.0.bb
+++ b/meta/recipes-extended/screen/screen_4.9.0.bb
@@ -21,7 +21,8 @@ SRC_URI = "${GNU_MIRROR}/screen/screen-${PV}.tar.gz \
            file://0002-comm.h-now-depends-on-term.h.patch \
            file://0001-fix-for-multijob-build.patch \
            file://0001-Remove-more-compatibility-stuff.patch \
-          "
+           file://0001-configure-Add-needed-system-headers-in-checks.patch \
+           "
 
 SRC_URI[sha256sum] = "f9335281bb4d1538ed078df78a20c2f39d3af9a4e91c57d084271e0289c730f4"
 
-- 
2.37.2


