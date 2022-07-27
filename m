Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6B28C19F28
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 00:41:46 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web09.14404.1658882496606958713
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 17:41:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=1N8Nq3/e;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d10so14693911pfd.9
        for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 17:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=DLBHQmsE3zgz4f60Td4hI7yeIp+SQd3WqnWkWOFBdgY=;
        b=1N8Nq3/ejR5bgUnJhzEVCxWSAeGzu8Y6Kw9INUmMAInGGJm2yNxs2LP/XTA7OOmFUc
         axsa+oyWp6/XZbNfX2E3IGhNbifaydA7HGsJPQHT4qZ6YtQGXqbrURddDvBc/j1PBH7C
         Lcbe+19ymAju/ftwl1Rj5t4GxihWaePIHoGgBsRHrYbGdBn3T3yddDS16Pu9yRe+SYNj
         WTl23SEl8gD5yDrFk4bnwnhprJ3NE444x6aGamdJRO0+vZJxWgmIrZxCQ6glVMXd3K/m
         N0+AzpbkqyY4NhQnrlWEONVGdRyqMundY2tPd6/Y6MDUHZYcgqefJQpLEOG1tD8iF91l
         4ApQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DLBHQmsE3zgz4f60Td4hI7yeIp+SQd3WqnWkWOFBdgY=;
        b=5kavdOvXzN/eLALjze/o6PyPWV8wag5WYu0V3ELVL4EqMCRmzVzGDSrY958Z8NFofk
         f8kfCelH+La9U708bDngOqm9raAOvavY+hZ5PSR8/llUmk6wFWb+XvhFLgygwqFg9ZPj
         ZUm1HWfiqlp4NUGGNHGKGTmofNz6G0kidIrnpIZDeh4EA2EG1vWYGkcTQfe4h6dY1Md3
         hmCVSXYgdCmpKtUsDH0ShHLy1EKJ7lTv+RrP6dwW7iCZxlX7R5MAiMiOYDKDKciv0Wc8
         HgQxgt8ABEIIHPfhs/xIullHVvaued3lFKRxQXQAmxVtLDWxyJbCB6hYw5Hq4QYDScLK
         rTMw==
X-Gm-Message-State: AJIora8I1Rbtm2hwDV1DJKjOe7mAk06jS5ewHyX1FKRL0QX3SB7krzrz
	kpeultiGg/Nmsj1Rfq650ZyPk+dYbddiPPW3
X-Google-Smtp-Source: 
 AGRyM1vrEbBMYZaSXAo5nrfNGNrYWBqhBG9BPzXqFWafbWYem0zUlo/GEcmpilAgVu/TW/xR2ngYzg==
X-Received: by 2002:a63:1c0f:0:b0:41a:3b20:5f8c with SMTP id
 c15-20020a631c0f000000b0041a3b205f8cmr16712415pgc.44.1658882495199;
        Tue, 26 Jul 2022 17:41:35 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 u16-20020a170902e5d000b0015e8d4eb219sm12356278plf.99.2022.07.26.17.41.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 17:41:34 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/15] vim: Upgrade 9.0.0021 -> 9.0.0063
Date: Tue, 26 Jul 2022 14:40:39 -1000
Message-Id: 
 <8b42e405fc630537398116a1429a9bc7cb2152ab.1658882276.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1658882276.git.steve@sakoman.com>
References: <cover.1658882276.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Jul 2022 00:41:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168531

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Pulls in several CVE fixes.
Added a patch to avoid timer_create cross compile issue (and submitted upstream).
Also submit the race fix upstream.
We disable timer_create in the native case since some systems have it
and some don't so this makes us consistent.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d0c1de084c7ce030d47a428e4bbfbc4ce2996057)
Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../vim/files/crosscompile.patch              | 51 +++++++++++++++++++
 meta/recipes-support/vim/files/racefix.patch  | 12 +++--
 meta/recipes-support/vim/vim.inc              |  9 +++-
 3 files changed, 66 insertions(+), 6 deletions(-)
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
index 7e2c624bc1..31229534e4 100644
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
@@ -95,6 +96,10 @@ EXTRA_OECONF = " \
     STRIP=/bin/true \
 "
 
+# Some host distros don't have it, disable consistently
+EXTRA_OECONF:append:class-native = " vim_cv_timer_create=no"
+EXTRA_OECONF:append:class-target = " vim_cv_timer_create=yes"
+
 do_install() {
     autotools_do_install
 
-- 
2.25.1


