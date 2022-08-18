Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C74DDC00140
	for <webhook@archiver.kernel.org>; Thu, 18 Aug 2022 16:57:02 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web12.44439.1660841821350307389
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 09:57:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=zAZq4kdG;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id y141so2071360pfb.7
        for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 09:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=1PbJDv362jbQHt/8ruRmHMLXed7xxv6o7GIxFbe1lDs=;
        b=zAZq4kdGOck1joO7n0pj9AtMQJuLncynUE8+ih9SL2BBjibL3YPUrRpKG6cChRautq
         RLu+fEebN5Q0PcVqaeg7LH5OpDRGGfqLBoayCiTvWXPboWuFoCBTlw2Qk+pkftZMJ84I
         0AjO48MPZXGrN3ZyTObN1sKKEohwmwb8HwCclJCJllWp46vmSyIh/RDLk9yOsKK9KMcG
         jZV0++iXmRy8zT6KqZW3yjSezYNRl5NCPAyHhtZMZ5A4AGzSn34SRC3xLFHIAYA0tfbl
         OANER21SA8PGM7pYad95z+/8EjwqhRwReI5IwVOs/whpEUg//99eRgRQSQ4KQKVEMCer
         iXcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=1PbJDv362jbQHt/8ruRmHMLXed7xxv6o7GIxFbe1lDs=;
        b=PId90123rG1zHEUbFPwcsODmA1Dz91mIqsaam4yJRnBoBHsuglSi3tnTDPeWNWbG2M
         wAHTJK4GZ+3dwKYqEcalxjZX/wA42bpNV7sBPvf/Yl5ImuJea3c8iebui62TtY0dAaGx
         /7GFr0RUUWc9lJcOuOHRwg5XStTna5ik3vo0NFCWu4F2qfRIcCqLR2aSZL6XVLuVoYGD
         GKOpypQaOOYmyGGoLtTlpYX9p6rqt8GAej4KKC7+8cMIL6HpKc0YwioBa3Xq3CV7tYkC
         oTMAH9DBVKMF5aB1GHUpbFbny+BTN5vvhIdZAo/82ymICNOfl++e1XzJVg8xELOpkgAo
         CcmA==
X-Gm-Message-State: ACgBeo2pCtDVgsFJLAnVkS+mtPwAB9cpg4PgNlw2/96l/xuyO8isaJcl
	Zc1pQH397B23vd3cYz1644I+abnPvCV9hDvP
X-Google-Smtp-Source: 
 AA6agR77RUqlqRsfz0F4Um+/AOPWFDCbYVNhMAzh75BoXeAC8x5m4y8BIVRinUoG1OKz+lf5ncFfIA==
X-Received: by 2002:a05:6a00:2393:b0:535:58e7:8f90 with SMTP id
 f19-20020a056a00239300b0053558e78f90mr3768518pfc.84.1660841820293;
        Thu, 18 Aug 2022 09:57:00 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h135-20020a62838d000000b0052d432b4cc0sm1897446pfe.33.2022.08.18.09.56.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 09:56:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/11] vim: Upgrade 9.0.0021 -> 9.0.0063
Date: Thu, 18 Aug 2022 06:56:21 -1000
Message-Id: 
 <0669d93ae531fecdb786a3c2205245febaeb3465.1660841536.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1660841536.git.steve@sakoman.com>
References: <cover.1660841536.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Aug 2022 16:57:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169526

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Pulls in several CVE fixes.
Added a patch to avoid timer_create cross compile issue (and submitted upstream).
Also submit the race fix upstream.
We disable timer_create in the native case since some systems have it
and some don't so this makes us consistent.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d0c1de084c7ce030d47a428e4bbfbc4ce2996057)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../vim/files/crosscompile.patch              | 51 +++++++++++++++++++
 meta/recipes-support/vim/files/racefix.patch  | 12 +++--
 meta/recipes-support/vim/vim.inc              | 10 +++-
 3 files changed, 67 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-support/vim/files/crosscompile.patch

diff --git a/meta/recipes-support/vim/files/crosscompile.patch b/meta/recipes-support/vim/files/crosscompile.patch
new file mode 100644
index 0000000000..583d3fc7b0
--- /dev/null
+++ b/meta/recipes-support/vim/files/crosscompile.patch
@@ -0,0 +1,51 @@
+configure.ac: Fix create_timer solaris test for cross compiling
+
+A runtime test was added for create_timer however this meant cross compiling
+would no longer work. Allow a cache value to be specified to allow cross
+compiling again.
+
+Signed-off-by: Richard Purdie richard.purdie@linuxfoundation.org
+
+Upstream-Status: Submitted [https://github.com/vim/vim/pull/10777]
+
+Index: git/src/configure.ac
+===================================================================
+--- git.orig/src/configure.ac
++++ git/src/configure.ac
+@@ -3814,7 +3814,7 @@ AC_COMPILE_IFELSE([AC_LANG_PROGRAM(
+ dnl Check for timer_create. It probably requires the 'rt' library.
+ dnl Run the program to find out if timer_create(CLOCK_MONOTONIC) actually
+ dnl works, on Solaris timer_create() exists but fails at runtime.
+-AC_MSG_CHECKING([for timer_create])
++AC_CACHE_CHECK([for timer_create], [vim_cv_timer_create],
+ save_LIBS="$LIBS"
+ LIBS="$LIBS -lrt"
+ AC_RUN_IFELSE([AC_LANG_PROGRAM([
+@@ -3831,7 +3831,7 @@ static void set_flag(union sigval sv) {}
+   if (timer_create(CLOCK_MONOTONIC, &action, &timer_id) < 0)
+     exit(1);  // cannot create a monotonic timer
+   ])],
+-  AC_MSG_RESULT(yes; with -lrt); AC_DEFINE(HAVE_TIMER_CREATE),
++  AC_MSG_NOTICE(timer_create with -lrt); vim_cv_timer_create=yes,
+   LIBS="$save_LIBS"
+   AC_RUN_IFELSE([AC_LANG_PROGRAM([
+ #include<signal.h>
+@@ -3847,8 +3847,16 @@ static void set_flag(union sigval sv) {}
+     if (timer_create(CLOCK_MONOTONIC, &action, &timer_id) < 0)
+       exit(1);  // cannot create a monotonic timer
+     ])],
+-    AC_MSG_RESULT(yes); AC_DEFINE(HAVE_TIMER_CREATE),
+-    AC_MSG_RESULT(no)))
++    vim_cv_timer_create=yes,
++    vim_cv_timer_create=no),
++    AC_MSG_ERROR(cross-compiling: please set 'vim_cv_timer_create')
++    )
++)
++
++if test "x$vim_cv_timer_create" = "xyes" ; then
++  AC_DEFINE(HAVE_TIMER_CREATE)
++fi
++
+ 
+ AC_CACHE_CHECK([whether stat() ignores a trailing slash], [vim_cv_stat_ignores_slash],
+   [
diff --git a/meta/recipes-support/vim/files/racefix.patch b/meta/recipes-support/vim/files/racefix.patch
index 1cb8fb442f..34bd37d650 100644
--- a/meta/recipes-support/vim/files/racefix.patch
+++ b/meta/recipes-support/vim/files/racefix.patch
@@ -1,9 +1,13 @@
+po/Makefile: Avoid race over LINGUAS file
+
 The creation of the LINGUAS file is duplicated for each desktop file
-which can lead the commands to race against each other. Rework
-the makefile to avoid this as the expense of leaving the file on disk.
+which can lead the commands to race against each other. One target might
+remove it before another has been able to use it. Rework the makefile to
+avoid this as the expense of leaving the file on disk.
+
+Signed-off-by: Richard Purdie richard.purdie@linuxfoundation.org
 
-Upstream-Status: Pending
-RP 2021/2/15
+Upstream-Status: Submitted [https://github.com/vim/vim/pull/10776]
 
 Index: git/src/po/Makefile
 ===================================================================
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 1893759ae9..ed9219d8c1 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -19,10 +19,11 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://0001-src-Makefile-improve-reproducibility.patch \
            file://no-path-adjust.patch \
            file://racefix.patch \
+           file://crosscompile.patch \
            "
 
-PV .= ".0021"
-SRCREV = "5e59ea54c0c37c2f84770f068d95280069828774"
+PV .= ".0063"
+SRCREV = "d61efa50f8f5b9d9dcbc136705cc33874f0fdcb3"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
@@ -94,6 +95,11 @@ EXTRA_OECONF = " \
     STRIP=/bin/true \
 "
 
+# Some host distros don't have it, disable consistently
+# also disable on dunfell target builds
+EXTRA_OECONF_append_class-native = " vim_cv_timer_create=no"
+EXTRA_OECONF_append_class-target = " vim_cv_timer_create=no"
+
 do_install() {
     autotools_do_install
 
-- 
2.25.1


