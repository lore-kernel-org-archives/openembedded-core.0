Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CDCEC46467
	for <webhook@archiver.kernel.org>; Sun, 20 Nov 2022 13:31:40 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.12303.1668951090826319298
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Nov 2022 05:31:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=arjOeVG0;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id p16so6798187wmc.3
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 05:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6LxiKGK8ojFl40EnrTwFLP3Pjgzfz0DfRgj9uzbowR4=;
        b=arjOeVG0Qpl48LglZ0uzDA293UcCADnFDiFtunQyXcWJgphdzsX2pC7MO3CIw1M9CP
         T2b7zR7D1KfETPbCzc9foIlTWIZ4cGRe50doXDnuC13iA25ztvjzNn9fYGzER0dym7L/
         C3/x60aHYNb9twZCqVv1DNbFo6GlOnqBWt4bGrvS9vhAm+g1fiqllsi/gyqVNQgNF6In
         KQNRMVy3iAdz9h42amPpKV/CrDFo40TpJoXwOwbfNGoWS0D4E7K6de1idKvA59qIOkyS
         PPnbaFU+utOkJaNn8tRNEVFYsnVktE23L2AvSE+q9MFp+ZKl4r3kRx/OUWhyWmqEdf3p
         Pd0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6LxiKGK8ojFl40EnrTwFLP3Pjgzfz0DfRgj9uzbowR4=;
        b=bn3RyQI7hVhDvUU0Hfx4XBiaNAuRHdhwnjwu0fIbTGXYdlMkM8c4nRFXFP2IEyYu4g
         ARiNRJVb/hYUfzZlye3uCW9NCEKA+jzrw8++L6hySpM1GkB6wYticHUAIiJb2uFulmmQ
         UE4B3FHe6Mja3kHrrbDgtmQy7h8lUhSOJEZbQSrDDdWbPtXj0yKB95a4neZ7pZYubJfh
         Z12XG4/LaQR7BH/xwTU4cUbxFNcu/stD7CiTXanFnYdBR7XVX8hpK2LbG3Eh1DzKbonn
         ToOS6ij0emoQvG5uGosy9+O/0U50IXr555kHA4fI0wTL7VPiyW0Tm81Q2QGZ9KZkzKGn
         285A==
X-Gm-Message-State: ANoB5pmSyvxm0/JvMkUZgR+Fnc9WP032tK2CT+YoL/+x4/W2yzgqpCn3
	VE3I7fbWzpSat5OZ05WemWPEyGd66X4=
X-Google-Smtp-Source: AA0mqf4Lw1WLBmurcF/2ntr4J0sOXj8xY2sXtVk3P4vnxAuZ1vSqfEWCMz2lLTHbh//4YvpU31wJpg==
X-Received: by 2002:a05:600c:12ca:b0:3cf:98e8:3e48 with SMTP id v10-20020a05600c12ca00b003cf98e83e48mr13528066wmd.56.1668951089324;
        Sun, 20 Nov 2022 05:31:29 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id k18-20020a05600c1c9200b003b47b80cec3sm16295551wms.42.2022.11.20.05.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 05:31:28 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 03/17] swig: update 4.0.2 -> 4.1.0
Date: Sun, 20 Nov 2022 14:31:08 +0100
Message-Id: <20221120133122.2464634-3-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221120133122.2464634-1-alex@linutronix.de>
References: <20221120133122.2464634-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 13:31:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173584

swig has transitioned pcre -> pcre2
Update 0001-configure-use-pkg-config-for-pcre-detection.patch
accordingly.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/swig/swig.inc           |  2 +-
 ...re-use-pkg-config-for-pcre-detection.patch | 44 ++++++++++---------
 .../swig/{swig_4.0.2.bb => swig_4.1.0.bb}     |  2 +-
 3 files changed, 26 insertions(+), 22 deletions(-)
 rename meta/recipes-devtools/swig/{swig_4.0.2.bb => swig_4.1.0.bb} (72%)

diff --git a/meta/recipes-devtools/swig/swig.inc b/meta/recipes-devtools/swig/swig.inc
index 13470c1094..7a6c4d7359 100644
--- a/meta/recipes-devtools/swig/swig.inc
+++ b/meta/recipes-devtools/swig/swig.inc
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e7807a6282784a7dde4c846626b08fc6 \
 
 SECTION = "devel"
 
-DEPENDS = "libpcre bison-native"
+DEPENDS = "libpcre2 bison-native"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/swig/files/swig/"
diff --git a/meta/recipes-devtools/swig/swig/0001-configure-use-pkg-config-for-pcre-detection.patch b/meta/recipes-devtools/swig/swig/0001-configure-use-pkg-config-for-pcre-detection.patch
index fdb9760e89..cfcbd8c73a 100644
--- a/meta/recipes-devtools/swig/swig/0001-configure-use-pkg-config-for-pcre-detection.patch
+++ b/meta/recipes-devtools/swig/swig/0001-configure-use-pkg-config-for-pcre-detection.patch
@@ -1,52 +1,56 @@
-From 5c4d6d8538994d5fe9b3b46bfafaf0a605e3bda6 Mon Sep 17 00:00:00 2001
+From ffb785ed8d3cac3c28e014b1238d93e2bc1f0c01 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen.kooi@linaro.org>
 Date: Tue, 17 Jun 2014 08:18:17 +0200
 Subject: [PATCH] configure: use pkg-config for pcre detection
 
 Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
 Upstream-Status: Pending
+
 ---
- configure.ac | 38 +++++++-------------------------------
- 1 file changed, 7 insertions(+), 31 deletions(-)
+ configure.ac | 39 +++++++--------------------------------
+ 1 file changed, 7 insertions(+), 32 deletions(-)
 
+diff --git a/configure.ac b/configure.ac
+index f88004a..3a2b47c 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -52,38 +52,14 @@ AC_MSG_RESULT([$with_pcre])
+@@ -57,39 +57,14 @@ AC_MSG_RESULT([$with_pcre])
  
  dnl To make configuring easier, check for a locally built PCRE using the Tools/pcre-build.sh script
  if test x"${with_pcre}" = xyes ; then
--  AC_MSG_CHECKING([whether to use local PCRE])
+-  AC_MSG_CHECKING([whether to use local PCRE2])
 -  local_pcre_config=no
--  if test -z $PCRE_CONFIG; then
--    if test -f `pwd`/pcre/pcre-swig-install/bin/pcre-config; then
--      PCRE_CONFIG=`pwd`/pcre/pcre-swig-install/bin/pcre-config
--      local_pcre_config=$PCRE_CONFIG
+-  if test -z "$PCRE2_CONFIG"; then
+-    if test -f `pwd`/pcre/pcre-swig-install/bin/pcre2-config; then
+-      PCRE2_CONFIG=`pwd`/pcre/pcre-swig-install/bin/pcre2-config
+-      local_pcre_config=$PCRE2_CONFIG
 -    fi
 -  fi
 -  AC_MSG_RESULT([$local_pcre_config])
 -fi
 -AS_IF([test "x$with_pcre" != xno],
--  [AX_PATH_GENERIC([pcre],
+-  [AX_PATH_GENERIC([pcre2],
 -    [], dnl Minimal version of PCRE we need -- accept any
 -    [], dnl custom sed script for version parsing is not needed
--    [AC_DEFINE([HAVE_PCRE], [1], [Define if you have PCRE library])
--     LIBS="$LIBS $PCRE_LIBS"
--     CPPFLAGS="$CPPFLAGS $PCRE_CFLAGS"
+-    [AC_DEFINE([HAVE_PCRE], [1], [Define if you have PCRE2 library])
+-     LIBS="$LIBS $PCRE2_LIBS"
+-     CPPFLAGS="$CPPFLAGS $PCRE2_CFLAGS"
 -    ],
 -    [AC_MSG_FAILURE([
--        Cannot find pcre-config script from PCRE (Perl Compatible Regular Expressions)
+-        Cannot find pcre2-config script from PCRE2 (Perl Compatible Regular Expressions)
 -        library package. This dependency is needed for configure to complete,
 -        Either:
--        - Install the PCRE developer package on your system (preferred approach).
--        - Download the PCRE source tarball, build and install on your system
+-        - Install the PCRE2 developer package on your system (preferred approach).
+-        - Download the PCRE2 source tarball, build and install on your system
 -          as you would for any package built from source distribution.
--        - Use the Tools/pcre-build.sh script to build PCRE just for SWIG to statically
+-        - Use the Tools/pcre-build.sh script to build PCRE2 just for SWIG to statically
 -          link against. Run 'Tools/pcre-build.sh --help' for instructions.
--          (quite easy and does not require privileges to install PCRE on your system)
+-          (quite easy and does not require privileges to install PCRE2 on your system)
 -        - Use configure --without-pcre to disable regular expressions support in SWIG
 -          (not recommended).])
--    ])
-+  PKG_CHECK_MODULES([PCRE], [libpcre], [
+-    ],
+-    [],[],[--libs8])
++  PKG_CHECK_MODULES([PCRE], [libpcre2], [
 +    AC_DEFINE([HAVE_PCRE], [1], [Define if you have PCRE library])
 +    LIBS="$LIBS $PCRE_LIBS"
 +    CPPFLAGS="$CPPFLAGS $PCRE_CFLAGS"
diff --git a/meta/recipes-devtools/swig/swig_4.0.2.bb b/meta/recipes-devtools/swig/swig_4.1.0.bb
similarity index 72%
rename from meta/recipes-devtools/swig/swig_4.0.2.bb
rename to meta/recipes-devtools/swig/swig_4.1.0.bb
index 718ad89a5d..0eabd8ed60 100644
--- a/meta/recipes-devtools/swig/swig_4.0.2.bb
+++ b/meta/recipes-devtools/swig/swig_4.1.0.bb
@@ -4,4 +4,4 @@ SRC_URI += "file://0001-Use-proc-self-exe-for-swig-swiglib-on-non-Win32-plat.pat
             file://0001-configure-use-pkg-config-for-pcre-detection.patch \
             file://determinism.patch \
            "
-SRC_URI[sha256sum] = "d53be9730d8d58a16bf0cbd1f8ac0c0c3e1090573168bfa151b01eb47fa906fc"
+SRC_URI[sha256sum] = "d6a9a8094e78f7cfb6f80a73cc271e1fe388c8638ed22668622c2c646df5bb3d"
-- 
2.30.2


