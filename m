Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12550C4332F
	for <webhook@archiver.kernel.org>; Wed, 10 Nov 2021 19:39:49 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web08.322.1636573187531002022
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 11:39:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TGYckH01;
 spf=pass (domain: gmail.com, ip: 209.85.128.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id v127so3176953wme.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 11:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ePbzXlF1Fz6lAtP6TNDRFYFo6lobwFJTUy9qDZbxxR0=;
        b=TGYckH01nu4UwJvUQ0/ABAVzwWSbKaG4/p42RRYEKmbT55W2LLoyxc0x3ph8a4vAwc
         /+4G2O3iEdj23usaIC3YLSd8D0qeIrlvwNy/AZWPio1r1FUfJLrGpWPyh7OVsPblfdIT
         OxTsnux6UBCRR8DnL1ihuoGZygLM3bBHGamxfPapr11s9mlKh8oV1VXL8EQPUv5Yo+Rx
         dVLIogO+2iKkhfeTArkuCwkURjkJNgQWtUdP96TzeXqms6cGqACOX+4KpE7d+pwROKT0
         e3ksDetpmViLPDXQBblpwvwt+7++OmKMQ2ShCTITmGns77MogYAe1xx12duStLYxg9j7
         hqWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ePbzXlF1Fz6lAtP6TNDRFYFo6lobwFJTUy9qDZbxxR0=;
        b=ASbJ44d68XMvV6LDriNBx7opF0Lg+iCpahE0VKvn0NhSuirYiotrmVyt5/rzySsV5S
         lsiH3mM2uvnnQ2DTYyGlloej1V7UM0DOzeccNkC9rksYiTVeCsS4/GK4oOxLmOOCFQDM
         GqRu4+SE25TjE6GoEIUhNMrAfvyzzsumzvTtKyLuNbXPrAKgTeAnAl4FRs5vwC4Jdlp9
         vf3lsLeajO5Yt/wERE5xxzdan4u9TmYr+N0odkDBHOAa45aSzqbLnACj+Zi54321F0v4
         kHpSxLzqqu7vP2a4CnpBbhnWQtgDPpZmkr5PwUVgvsDqrTxehjs/zpUQOAjGb5IZVq9U
         v4uQ==
X-Gm-Message-State: AOAM5307mDhEAkAQwzkiype9UC8EIHtTLvm6y3vv+r6Db54k7EWpYwzB
	CE68oweVwxfPlCpchY0BdXCKRQAXdL0=
X-Google-Smtp-Source: 
 ABdhPJwXl/sNAqfBDLKTnGDpevk+VC6SSdHSWxYIpr/wSbOObqG4rx9hnKpf3jtpCrnD75hxR2OQHQ==
X-Received: by 2002:a05:600c:350c:: with SMTP id
 h12mr1763775wmq.123.1636573186165;
        Wed, 10 Nov 2021 11:39:46 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 q18sm6865124wmc.7.2021.11.10.11.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 11:39:45 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	David Michael <fedora.dm0@gmail.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 07/24] libgpg-error: update 1.42 -> 1.43
Date: Wed, 10 Nov 2021 20:39:20 +0100
Message-Id: <20211110193937.2606747-7-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211110193937.2606747-1-alex@linutronix.de>
References: <20211110193937.2606747-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Nov 2021 19:39:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158091

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libgpg-error/libgpg-error/fix-cross.patch | 28 -------------------
 .../libgpg-error/libgpg-error/pkgconfig.patch | 17 +++++------
 ...gpg-error_1.42.bb => libgpg-error_1.43.bb} |  3 +-
 3 files changed, 10 insertions(+), 38 deletions(-)
 delete mode 100644 meta/recipes-support/libgpg-error/libgpg-error/fix-cross.patch
 rename meta/recipes-support/libgpg-error/{libgpg-error_1.42.bb => libgpg-error_1.43.bb} (92%)

diff --git a/meta/recipes-support/libgpg-error/libgpg-error/fix-cross.patch b/meta/recipes-support/libgpg-error/libgpg-error/fix-cross.patch
deleted file mode 100644
index ae424cdb9a..0000000000
--- a/meta/recipes-support/libgpg-error/libgpg-error/fix-cross.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From: David Michael <fedora.dm0@gmail.com>
-Date: Fri, 26 Mar 2021 07:06:50 +0000 (+0900)
-Subject: build: Fix generation of lock-obj-pub.native.h for cross build.
-X-Git-Url: http://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgpg-error.git;a=commitdiff_plain;h=33593864cd54143db594c4237bba41e14179061c
-
-build: Fix generation of lock-obj-pub.native.h for cross build.
-
-* src/gen-lock-obj.sh: Capture echo output with quotes.
-
-Fixes-commit: 99ae862a96a569724f49a604ebb7d3f6d2c2d374
-Signed-off-by: David Michael <fedora.dm0@gmail.com>
-Upstream-Status: Backport
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
-
-diff --git a/src/gen-lock-obj.sh b/src/gen-lock-obj.sh
-index a710f0c..258eec6 100755
---- a/src/gen-lock-obj.sh
-+++ b/src/gen-lock-obj.sh
-@@ -38,7 +38,7 @@
- #     AWK=gawk ./gen-lock-obj.sh
- #
- 
--if test -n `echo -n`; then
-+if test -n "`echo -n`"; then
-     ECHO_C='\c'
-     ECHO_N=''
- else
diff --git a/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch b/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch
index aea8eba5fa..ff15759309 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch
+++ b/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch
@@ -1,4 +1,4 @@
-From 62651c5c7b4a391f16dbe1b09c6e220efe5c8a35 Mon Sep 17 00:00:00 2001
+From 52aae746760ce5b88e61ce994f5055e4ce809821 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Thu, 29 Mar 2018 15:12:17 +0800
 Subject: [PATCH] support pkgconfig
@@ -14,14 +14,14 @@ Signed-off-by: Armin Kuster <akuster808@gmail.com>
 Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
 
 ---
- src/gpg-error.m4 | 159 +----------------------------------------------
- 1 file changed, 3 insertions(+), 156 deletions(-)
+ src/gpg-error.m4 | 160 +----------------------------------------------
+ 1 file changed, 3 insertions(+), 157 deletions(-)
 
 diff --git a/src/gpg-error.m4 b/src/gpg-error.m4
-index d910754..76f045c 100644
+index 56a5d07..28920ae 100644
 --- a/src/gpg-error.m4
 +++ b/src/gpg-error.m4
-@@ -27,156 +27,12 @@ dnl is added to the gpg_config_script_warn variable.
+@@ -27,157 +27,12 @@ dnl is added to the gpg_config_script_warn variable.
  dnl
  AC_DEFUN([AM_PATH_GPG_ERROR],
  [ AC_REQUIRE([AC_CANONICAL_HOST])
@@ -63,7 +63,7 @@ index d910754..76f045c 100644
 -  min_gpg_error_version=ifelse([$1], ,1.33,$1)
 -  ok=no
 -
--  AC_PATH_PROG(GPGRT_CONFIG, gpgrt-config, no)
+-  AC_PATH_PROG(GPGRT_CONFIG, gpgrt-config, no, [$prefix/bin:$PATH])
 -  if test "$GPGRT_CONFIG" != "no"; then
 -    # Determine gpgrt_libdir
 -    #
@@ -78,7 +78,8 @@ index d910754..76f045c 100644
 -    #   Fedora/openSUSE style: /usr/lib, /usr/lib32 or /usr/lib64
 -    # It is assumed that CC is specified to the one of host on cross build.
 -    if libdir_candidates=$(${CC:-cc} -print-search-dirs | \
--          sed -n -e "/^libraries/{s/libraries: =//;s/:/\n/gp}"); then
+-          sed -n -e "/^libraries/{s/libraries: =//;s/:/\\
+-/g;p;}"); then
 -      # From the output of -print-search-dirs, select valid pkgconfig dirs.
 -      libdir_candidates=$(for dir in $libdir_candidates; do
 -        if p=$(cd $dir 2>/dev/null && pwd); then
@@ -181,7 +182,7 @@ index d910754..76f045c 100644
      fi
      if test x"$gpg_error_config_host" != xnone ; then
        if test x"$gpg_error_config_host" != x"$host" ; then
-@@ -192,15 +48,6 @@ AC_DEFUN([AM_PATH_GPG_ERROR],
+@@ -193,15 +48,6 @@ AC_DEFUN([AM_PATH_GPG_ERROR],
        fi
      fi
    else
diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.42.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.43.bb
similarity index 92%
rename from meta/recipes-support/libgpg-error/libgpg-error_1.42.bb
rename to meta/recipes-support/libgpg-error/libgpg-error_1.43.bb
index 04f5760b76..fe3824b8e0 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.42.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.43.bb
@@ -17,11 +17,10 @@ UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/libgpg-error/libgpg-error-${PV}.tar.bz2 \
            file://pkgconfig.patch \
            file://0001-Do-not-fail-when-testing-config-scripts.patch \
-           file://fix-cross.patch \
            file://0001-configure.ac-do-not-hardcode-gnu-libc-when-generatin.patch \
            "
 
-SRC_URI[sha256sum] = "fc07e70f6c615f8c4f590a8e37a9b8dd2e2ca1e9408f8e60459c67452b925e23"
+SRC_URI[sha256sum] = "a9ab83ca7acc442a5bd846a75b920285ff79bdb4e3d34aa382be88ed2c3aebaf"
 
 BINCONFIG = "${bindir}/gpg-error-config"
 
-- 
2.20.1


