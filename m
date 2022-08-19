Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89208C32789
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 02:43:35 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web08.50679.1660877009442128014
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 19:43:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=7fPgvtjP;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d16so3021485pll.11
        for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 19:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=2qm7AFK5vIecKpaFRee+r5o5dDMXtbsBagZkoZjDn8U=;
        b=7fPgvtjPKWXaWpAhdQeJag4py9dCoOfKvpcgXKaPww5fW8SLGvB+u9yIzo8ru8mT0s
         S2FaKdWqUv4uVhds52Sk0Lm16+oukcU62EV+Z+74Ddikrjdu929kiK7f5cDjcpgeVIEZ
         OjnsyNQZM/g+VcdHK2mNq2piXjQoQc50PZvpnayGPSKVhmyR9Luij86hQ4p8VLYkk5yV
         9JLy4I73yiUcMmL99Ejc/rLT0c5+vY/catQqq5PfaVOLI4mVQCyV7qbQV44m/p+0QRl9
         2ZI8vlNNNvZXJB7FzAMVAwnyLSHvKUtccZkxElvXn/abrtnnQvnYDubmseilaFn6oLID
         lg0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=2qm7AFK5vIecKpaFRee+r5o5dDMXtbsBagZkoZjDn8U=;
        b=bSDPAEpkQ5O93/w3rnR/oEG4r+WF2iOVcK+3gqgLHtE88DOvwfgyKh0XvAd6L54yZn
         32gPkifrcu4fSik3Dh2mxRbXOMFljbhLOk71VhoZHO/xnGQKon9E6iBavD1Yx2QLXzti
         GeFR+dJm2mUWgMdUSI2O9Vnng4taO0viFNTfSsefGSs1odZmfDbL2tG3DbDP/+R7dU0f
         LDGtNnenbTReesYKfp9qGsYOsAKbrUSX71ps+dKrOsFgJpMaLTUAgiYxpqLU7Gj96hpT
         +3H8oq/WjQtP3amiCuqpMAWlXAa5WbzBVVM38Xkj4GSWZNqsK8noWCrGpvAUM3DbOwsN
         iTiw==
X-Gm-Message-State: ACgBeo3/v/x28Z1K17xXRnCzJnVAIKS3TDXA25d0fwMxyucRemJc5DaP
	FV4iqhI1Y5649AHadj0C2PAV3p/JBLRX8ohy
X-Google-Smtp-Source: 
 AA6agR5YAJN2fatoyXOJTYGC6hd4wNpwYe33hauEuA+FwBClExceHS28tCViLLuTMpB1rIpIBAXrCg==
X-Received: by 2002:a17:90a:1d0:b0:1fa:c551:5e83 with SMTP id
 16-20020a17090a01d000b001fac5515e83mr7089497pjd.106.1660877008475;
        Thu, 18 Aug 2022 19:43:28 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 t12-20020a17090a4e4c00b001fa80cde150sm4150145pjl.20.2022.08.18.19.43.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 19:43:27 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/26] vim: update from 9.0.0063 to 9.0.0115
Date: Thu, 18 Aug 2022 16:42:32 -1000
Message-Id: 
 <27e4c6f98be296fb5f67ac7775461854d48f6c9a.1660876844.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1660876844.git.steve@sakoman.com>
References: <cover.1660876844.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 02:43:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169553

From: Randy MacLeod <randy.macleod@windriver.com>

Drop crosscompile.patch which was merged as part of:
   509695c1c (tag: v9.0.0065) patch 9.0.0065: \
      cross-compiling doesn't work because of timer_create check

Also drop: racefix.patch which may have been fixed upstream
and is being tracked by:
   https://github.com/vim/vim/pull/10776
where upstream is asking if the different approach resolves the
race condition. Let's see what's out there!

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit 6996472cd33d2d4b91821f2dfe24a27a697e4afe)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../vim/files/crosscompile.patch              | 51 -------------------
 meta/recipes-support/vim/files/racefix.patch  | 37 --------------
 meta/recipes-support/vim/vim.inc              |  6 +--
 3 files changed, 2 insertions(+), 92 deletions(-)
 delete mode 100644 meta/recipes-support/vim/files/crosscompile.patch
 delete mode 100644 meta/recipes-support/vim/files/racefix.patch

diff --git a/meta/recipes-support/vim/files/crosscompile.patch b/meta/recipes-support/vim/files/crosscompile.patch
deleted file mode 100644
index 583d3fc7b0..0000000000
--- a/meta/recipes-support/vim/files/crosscompile.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-configure.ac: Fix create_timer solaris test for cross compiling
-
-A runtime test was added for create_timer however this meant cross compiling
-would no longer work. Allow a cache value to be specified to allow cross
-compiling again.
-
-Signed-off-by: Richard Purdie richard.purdie@linuxfoundation.org
-
-Upstream-Status: Submitted [https://github.com/vim/vim/pull/10777]
-
-Index: git/src/configure.ac
-===================================================================
---- git.orig/src/configure.ac
-+++ git/src/configure.ac
-@@ -3814,7 +3814,7 @@ AC_COMPILE_IFELSE([AC_LANG_PROGRAM(
- dnl Check for timer_create. It probably requires the 'rt' library.
- dnl Run the program to find out if timer_create(CLOCK_MONOTONIC) actually
- dnl works, on Solaris timer_create() exists but fails at runtime.
--AC_MSG_CHECKING([for timer_create])
-+AC_CACHE_CHECK([for timer_create], [vim_cv_timer_create],
- save_LIBS="$LIBS"
- LIBS="$LIBS -lrt"
- AC_RUN_IFELSE([AC_LANG_PROGRAM([
-@@ -3831,7 +3831,7 @@ static void set_flag(union sigval sv) {}
-   if (timer_create(CLOCK_MONOTONIC, &action, &timer_id) < 0)
-     exit(1);  // cannot create a monotonic timer
-   ])],
--  AC_MSG_RESULT(yes; with -lrt); AC_DEFINE(HAVE_TIMER_CREATE),
-+  AC_MSG_NOTICE(timer_create with -lrt); vim_cv_timer_create=yes,
-   LIBS="$save_LIBS"
-   AC_RUN_IFELSE([AC_LANG_PROGRAM([
- #include<signal.h>
-@@ -3847,8 +3847,16 @@ static void set_flag(union sigval sv) {}
-     if (timer_create(CLOCK_MONOTONIC, &action, &timer_id) < 0)
-       exit(1);  // cannot create a monotonic timer
-     ])],
--    AC_MSG_RESULT(yes); AC_DEFINE(HAVE_TIMER_CREATE),
--    AC_MSG_RESULT(no)))
-+    vim_cv_timer_create=yes,
-+    vim_cv_timer_create=no),
-+    AC_MSG_ERROR(cross-compiling: please set 'vim_cv_timer_create')
-+    )
-+)
-+
-+if test "x$vim_cv_timer_create" = "xyes" ; then
-+  AC_DEFINE(HAVE_TIMER_CREATE)
-+fi
-+
- 
- AC_CACHE_CHECK([whether stat() ignores a trailing slash], [vim_cv_stat_ignores_slash],
-   [
diff --git a/meta/recipes-support/vim/files/racefix.patch b/meta/recipes-support/vim/files/racefix.patch
deleted file mode 100644
index 34bd37d650..0000000000
--- a/meta/recipes-support/vim/files/racefix.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-po/Makefile: Avoid race over LINGUAS file
-
-The creation of the LINGUAS file is duplicated for each desktop file
-which can lead the commands to race against each other. One target might
-remove it before another has been able to use it. Rework the makefile to
-avoid this as the expense of leaving the file on disk.
-
-Signed-off-by: Richard Purdie richard.purdie@linuxfoundation.org
-
-Upstream-Status: Submitted [https://github.com/vim/vim/pull/10776]
-
-Index: git/src/po/Makefile
-===================================================================
---- git.orig/src/po/Makefile
-+++ git/src/po/Makefile
-@@ -207,17 +207,16 @@ $(PACKAGE).pot: $(PO_INPUTLIST) $(PO_VIM
- 	# Delete the temporary files
- 	rm *.js
- 
--vim.desktop: vim.desktop.in $(POFILES)
-+LINGUAS:
- 	echo $(LANGUAGES) | tr " " "\n" |sed -e '/\./d' | sort > LINGUAS
-+
-+vim.desktop: vim.desktop.in $(POFILES) LINGUAS
- 	$(MSGFMT) --desktop -d . --template vim.desktop.in -o tmp_vim.desktop
--	rm -f LINGUAS
- 	if command -v desktop-file-validate; then desktop-file-validate tmp_vim.desktop; fi
- 	mv tmp_vim.desktop vim.desktop
- 
--gvim.desktop: gvim.desktop.in $(POFILES)
--	echo $(LANGUAGES) | tr " " "\n" |sed -e '/\./d' | sort > LINGUAS
-+gvim.desktop: gvim.desktop.in $(POFILES) LINGUAS
- 	$(MSGFMT) --desktop -d . --template gvim.desktop.in -o tmp_gvim.desktop
--	rm -f LINGUAS
- 	if command -v desktop-file-validate; then desktop-file-validate tmp_gvim.desktop; fi
- 	mv tmp_gvim.desktop gvim.desktop
- 
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 31229534e4..48896465ed 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -18,12 +18,10 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://vim-add-knob-whether-elf.h-are-checked.patch \
            file://0001-src-Makefile-improve-reproducibility.patch \
            file://no-path-adjust.patch \
-           file://racefix.patch \
-           file://crosscompile.patch \
            "
 
-PV .= ".0063"
-SRCREV = "d61efa50f8f5b9d9dcbc136705cc33874f0fdcb3"
+PV .= ".0115"
+SRCREV = "6747cf1671bd41cddee77c65b3f9a70509f968db"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.25.1


