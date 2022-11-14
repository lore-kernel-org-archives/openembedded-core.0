Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1423C433FE
	for <webhook@archiver.kernel.org>; Mon, 14 Nov 2022 19:01:16 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web09.671.1668452475974576970
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Nov 2022 11:01:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Re9B+1H+;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id t1so8145380wmi.4
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 11:01:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RAGARMIJJyy73wTg+9vWJC3+O7d+w2W5RUV7JcyIEmw=;
        b=Re9B+1H+be5hYJ99e8b4S4Zv3iFwzFPculeSFa49D+edwf7x2L4FjDutNlAIhIvsKO
         Z3ezh0IellxbXz8qLwSozW0OqNg9Er8fvyag8lOroPAc659wONk8hTc7qhFenvktku8M
         blxxGr0cMfs6HdpFymZFVd7LmuBFsrL/3rJgbnpG4YEz5jHrMPUH5crDLoe1YZpInGLr
         jONd8B6l2QOFtSKCpGAlg3tXH6Tvm7jZSeoO3GjNAzhToBWpf45/0QyM5UlDj9N8cSTl
         cDseq5ssM0nV5SaOmAom54sRrRvtCYItXTVl60L8/+6c/ZFffFmTxXkSFO/OJBte7quX
         wfGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RAGARMIJJyy73wTg+9vWJC3+O7d+w2W5RUV7JcyIEmw=;
        b=GDFcD9IT9JSJsfcaSGCUUD99tp0lTo8QwwXFG6aF9GOf43vCAYX5AXnXNpbukLY9im
         8Vy7G9YStJs1DYWYsxJK5zfXGCPnTnltLe7aaqsAzD7Q3pvOOMqYusPN//ssRXgGe/c3
         W9lY8tWPkgRWVFECu3jOIBXDz1sso21MuxneaSnudWtq2C1Yg9haBrWTECcEXwDeAbfi
         3af2+C3j3SfBTIFCwMAI2fQ2DXWPz8duS7qHwDeEZBaGmouS6qVW4ZYNGgJfsrrSS0Ds
         WmH8tC6gvP7IFZrUmk3O1gVeRq9WfqOy5yezfz3OzmWxbVlTNcaOv/UuDhms9Z+2Uffx
         mHxg==
X-Gm-Message-State: ANoB5pl5rQVRaml5b6ckAeT2Br8FYZpzfB58Jo/HFB/bNVRo3ctR9Y4S
	RGTz22NHSK76gbqSyHZRNunKcBbt89I=
X-Google-Smtp-Source: AA0mqf76fHd4/2ckNOhNplOq+KlXrcdtIhL9u9vJymHfSG3R+lKaCsyr0YeTNu7wltqzspKzHRl+9A==
X-Received: by 2002:a05:600c:43d2:b0:3cf:92cc:9e5f with SMTP id f18-20020a05600c43d200b003cf92cc9e5fmr8948778wmn.181.1668452474003;
        Mon, 14 Nov 2022 11:01:14 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id c7-20020a1c3507000000b003c6f1732f65sm18091811wma.38.2022.11.14.11.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 11:01:13 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/8] gettext: update 0.21 -> 0.21.1
Date: Mon, 14 Nov 2022 20:00:49 +0100
Message-Id: <20221114190056.2612669-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 19:01:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173254

License-update: formatting

Refresh gettext-minimal files from the 0.21.1 install tree.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...t-env.in-do-not-add-C-CXX-parameters.patch |   0
 ...01-tests-autopoint-3-unset-MAKEFLAGS.patch |   0
 .../parallel.patch                            |   0
 .../run-ptest                                 |   0
 .../serial-tests-config.patch                 |   0
 .../use-pkgconfig.patch                       | 226 +++++++++---------
 ...-builds-with-automake-1.16.4-and-new.patch |  29 ---
 ...rge-29-Add-executable-file-mode-bits.patch |  23 --
 .../gettext/gettext-0.21/mingw.patch          |  28 ---
 .../COPYING                                   |   0
 .../Makefile.in.in                            |   0
 .../aclocal/gettext.m4                        |  28 +--
 .../aclocal/host-cpu-c-abi.m4                 |  11 +-
 .../aclocal/iconv.m4                          |  67 +++---
 .../aclocal/intlmacosx.m4                     |   2 +-
 .../aclocal/lib-ld.m4                         |   6 +-
 .../aclocal/lib-link.m4                       |  23 +-
 .../aclocal/lib-prefix.m4                     |  17 +-
 .../aclocal/nls.m4                            |   2 +-
 .../aclocal/po.m4                             |  12 +-
 .../aclocal/progtest.m4                       |  12 +-
 .../config.rpath                              |   6 +-
 .../remove-potcdate.sin                       |   0
 ...21.bb => gettext-minimal-native_0.21.1.bb} |   0
 .../{gettext_0.21.bb => gettext_0.21.1.bb}    |   9 +-
 25 files changed, 223 insertions(+), 278 deletions(-)
 rename meta/recipes-core/gettext/{gettext-0.21 => gettext-0.21.1}/0001-init-env.in-do-not-add-C-CXX-parameters.patch (100%)
 rename meta/recipes-core/gettext/{gettext-0.21 => gettext-0.21.1}/0001-tests-autopoint-3-unset-MAKEFLAGS.patch (100%)
 rename meta/recipes-core/gettext/{gettext-0.21 => gettext-0.21.1}/parallel.patch (100%)
 rename meta/recipes-core/gettext/{gettext-0.21 => gettext-0.21.1}/run-ptest (100%)
 rename meta/recipes-core/gettext/{gettext-0.21 => gettext-0.21.1}/serial-tests-config.patch (100%)
 rename meta/recipes-core/gettext/{gettext-0.21 => gettext-0.21.1}/use-pkgconfig.patch (81%)
 delete mode 100644 meta/recipes-core/gettext/gettext-0.21/0001-libtextstyle-fix-builds-with-automake-1.16.4-and-new.patch
 delete mode 100644 meta/recipes-core/gettext/gettext-0.21/0001-msgmerge-29-Add-executable-file-mode-bits.patch
 delete mode 100644 meta/recipes-core/gettext/gettext-0.21/mingw.patch
 rename meta/recipes-core/gettext/{gettext-minimal-0.21 => gettext-minimal-0.21.1}/COPYING (100%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.21 => gettext-minimal-0.21.1}/Makefile.in.in (100%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.21 => gettext-minimal-0.21.1}/aclocal/gettext.m4 (94%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.21 => gettext-minimal-0.21.1}/aclocal/host-cpu-c-abi.m4 (98%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.21 => gettext-minimal-0.21.1}/aclocal/iconv.m4 (86%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.21 => gettext-minimal-0.21.1}/aclocal/intlmacosx.m4 (98%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.21 => gettext-minimal-0.21.1}/aclocal/lib-ld.m4 (97%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.21 => gettext-minimal-0.21.1}/aclocal/lib-link.m4 (96%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.21 => gettext-minimal-0.21.1}/aclocal/lib-prefix.m4 (95%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.21 => gettext-minimal-0.21.1}/aclocal/nls.m4 (99%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.21 => gettext-minimal-0.21.1}/aclocal/po.m4 (98%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.21 => gettext-minimal-0.21.1}/aclocal/progtest.m4 (90%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.21 => gettext-minimal-0.21.1}/config.rpath (99%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.21 => gettext-minimal-0.21.1}/remove-potcdate.sin (100%)
 rename meta/recipes-core/gettext/{gettext-minimal-native_0.21.bb => gettext-minimal-native_0.21.1.bb} (100%)
 rename meta/recipes-core/gettext/{gettext_0.21.bb => gettext_0.21.1.bb} (95%)

diff --git a/meta/recipes-core/gettext/gettext-0.21/0001-init-env.in-do-not-add-C-CXX-parameters.patch b/meta/recipes-core/gettext/gettext-0.21.1/0001-init-env.in-do-not-add-C-CXX-parameters.patch
similarity index 100%
rename from meta/recipes-core/gettext/gettext-0.21/0001-init-env.in-do-not-add-C-CXX-parameters.patch
rename to meta/recipes-core/gettext/gettext-0.21.1/0001-init-env.in-do-not-add-C-CXX-parameters.patch
diff --git a/meta/recipes-core/gettext/gettext-0.21/0001-tests-autopoint-3-unset-MAKEFLAGS.patch b/meta/recipes-core/gettext/gettext-0.21.1/0001-tests-autopoint-3-unset-MAKEFLAGS.patch
similarity index 100%
rename from meta/recipes-core/gettext/gettext-0.21/0001-tests-autopoint-3-unset-MAKEFLAGS.patch
rename to meta/recipes-core/gettext/gettext-0.21.1/0001-tests-autopoint-3-unset-MAKEFLAGS.patch
diff --git a/meta/recipes-core/gettext/gettext-0.21/parallel.patch b/meta/recipes-core/gettext/gettext-0.21.1/parallel.patch
similarity index 100%
rename from meta/recipes-core/gettext/gettext-0.21/parallel.patch
rename to meta/recipes-core/gettext/gettext-0.21.1/parallel.patch
diff --git a/meta/recipes-core/gettext/gettext-0.21/run-ptest b/meta/recipes-core/gettext/gettext-0.21.1/run-ptest
similarity index 100%
rename from meta/recipes-core/gettext/gettext-0.21/run-ptest
rename to meta/recipes-core/gettext/gettext-0.21.1/run-ptest
diff --git a/meta/recipes-core/gettext/gettext-0.21/serial-tests-config.patch b/meta/recipes-core/gettext/gettext-0.21.1/serial-tests-config.patch
similarity index 100%
rename from meta/recipes-core/gettext/gettext-0.21/serial-tests-config.patch
rename to meta/recipes-core/gettext/gettext-0.21.1/serial-tests-config.patch
diff --git a/meta/recipes-core/gettext/gettext-0.21/use-pkgconfig.patch b/meta/recipes-core/gettext/gettext-0.21.1/use-pkgconfig.patch
similarity index 81%
rename from meta/recipes-core/gettext/gettext-0.21/use-pkgconfig.patch
rename to meta/recipes-core/gettext/gettext-0.21.1/use-pkgconfig.patch
index fc77feb270..c12e0d3b88 100644
--- a/meta/recipes-core/gettext/gettext-0.21/use-pkgconfig.patch
+++ b/meta/recipes-core/gettext/gettext-0.21.1/use-pkgconfig.patch
@@ -1,4 +1,4 @@
-From 15647f679834be633fb4a9aeff4671b9cb95ccb8 Mon Sep 17 00:00:00 2001
+From 38c361e6860bfaefbefeccae621e698c301879f2 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 23 Jan 2018 00:54:13 +0000
 Subject: [PATCH] gettext: beat library detection into shape
@@ -14,18 +14,18 @@ Upstream-Status: Inappropriate [upstream still refuse to consider pkg-config]
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 
 ---
- gettext-tools/gnulib-m4/libxml.m4             |  99 +----------------
- .../gnulib-local/lib/term-styled-ostream.oo.c |  12 +--
- libtextstyle/gnulib-local/m4/libcroco.m4      |  99 +++--------------
- libtextstyle/gnulib-local/m4/libglib.m4       | 100 +++---------------
- libtextstyle/gnulib-m4/libcroco.m4            |  99 +++--------------
- libtextstyle/gnulib-m4/libglib.m4             | 100 +++---------------
- libtextstyle/lib/term-styled-ostream.c        |  12 +--
- libtextstyle/lib/term-styled-ostream.oo.c     |  12 +--
- 8 files changed, 83 insertions(+), 450 deletions(-)
+ gettext-tools/gnulib-m4/libxml.m4             | 105 +----------------
+ .../gnulib-local/lib/term-styled-ostream.oo.c |  12 +-
+ libtextstyle/gnulib-local/m4/libcroco.m4      |  98 +++-------------
+ libtextstyle/gnulib-local/m4/libglib.m4       | 106 +++---------------
+ libtextstyle/gnulib-m4/libcroco.m4            |  98 +++-------------
+ libtextstyle/gnulib-m4/libglib.m4             | 106 +++---------------
+ libtextstyle/lib/term-styled-ostream.c        |  12 +-
+ libtextstyle/lib/term-styled-ostream.oo.c     |  12 +-
+ 8 files changed, 79 insertions(+), 470 deletions(-)
 
 diff --git a/gettext-tools/gnulib-m4/libxml.m4 b/gettext-tools/gnulib-m4/libxml.m4
-index 2f80c37..30ce58e 100644
+index 0340490..0355388 100644
 --- a/gettext-tools/gnulib-m4/libxml.m4
 +++ b/gettext-tools/gnulib-m4/libxml.m4
 @@ -13,6 +13,7 @@ dnl gl_LIBXML(FORCE-INCLUDED)
@@ -36,7 +36,7 @@ index 2f80c37..30ce58e 100644
    AC_REQUIRE([AM_ICONV_LINK])
  
    ifelse([$1], , [
-@@ -30,100 +31,10 @@ AC_DEFUN([gl_LIBXML],
+@@ -30,106 +31,10 @@ AC_DEFUN([gl_LIBXML],
    INCXML=
    ifelse([$1], [yes], , [
      if test "$gl_cv_libxml_use_included" != yes; then
@@ -60,14 +60,16 @@ index 2f80c37..30ce58e 100644
 -        dnl -Wl,--disable-auto-import.
 -        AC_LIB_LINKFLAGS_BODY([xml2])
 -        LIBS="$gl_save_LIBS $LIBXML2 $LIBICONV"
--        AC_TRY_LINK([#include <libxml/xmlversion.h>
--                     #include <libxml/xmlmemory.h>
--                     #include <libxml/xpath.h>
--                    ],
--          [xmlCheckVersion (0);
--           xmlFree ((void *) 0);
--           xmlXPathSetContextNode ((void *)0, (void *)0);
--          ],
+-        AC_LINK_IFELSE(
+-          [AC_LANG_PROGRAM(
+-             [[#include <libxml/xmlversion.h>
+-               #include <libxml/xmlmemory.h>
+-               #include <libxml/xpath.h>
+-             ]],
+-             [[xmlCheckVersion (0);
+-               xmlFree ((void *) 0);
+-               xmlXPathSetContextNode ((void *)0, (void *)0);
+-             ]])],
 -          [gl_cv_libxml=yes
 -           gl_cv_LIBXML="$LIBXML2 $LIBICONV"
 -           gl_cv_LTLIBXML="$LTLIBXML2 $LTLIBICONV"
@@ -75,14 +77,16 @@ index 2f80c37..30ce58e 100644
 -        if test "$gl_cv_libxml" != yes; then
 -          gl_save_CPPFLAGS="$CPPFLAGS"
 -          CPPFLAGS="$CPPFLAGS $INCXML2"
--          AC_TRY_LINK([#include <libxml/xmlversion.h>
--                       #include <libxml/xmlmemory.h>
--                       #include <libxml/xpath.h>
--                      ],
--            [xmlCheckVersion (0);
--             xmlFree ((void *) 0);
--             xmlXPathSetContextNode ((void *)0, (void *)0);
--            ],
+-          AC_LINK_IFELSE(
+-            [AC_LANG_PROGRAM(
+-               [[#include <libxml/xmlversion.h>
+-                 #include <libxml/xmlmemory.h>
+-                 #include <libxml/xpath.h>
+-               ]],
+-               [[xmlCheckVersion (0);
+-                 xmlFree ((void *) 0);
+-                 xmlXPathSetContextNode ((void *)0, (void *)0);
+-               ]])],
 -            [gl_cv_libxml=yes
 -             gl_cv_LIBXML="$LIBXML2 $LIBICONV"
 -             gl_cv_LTLIBXML="$LTLIBXML2 $LTLIBICONV"
@@ -94,26 +98,28 @@ index 2f80c37..30ce58e 100644
 -            dnl In libxml2-2.6, it includes <libxml/xmlexports.h> which is
 -            dnl self-contained.
 -            libxml2_include_dir=
--            AC_TRY_CPP([#include <libxml2/libxml/xmlexports.h>],
+-            AC_PREPROC_IFELSE([AC_LANG_SOURCE([[#include <libxml2/libxml/xmlexports.h>]])],
 -              [gl_ABSOLUTE_HEADER([libxml2/libxml/xmlexports.h])
 -               libxml2_include_dir=`echo "$gl_cv_absolute_libxml2_libxml_xmlexports_h" | sed -e 's,.libxml.xmlexports\.h$,,'`
 -              ])
 -            if test -z "$libxml2_include_dir"; then
--              AC_TRY_CPP([#include <libxml2/libxml/xmlversion.h>],
+-              AC_PREPROC_IFELSE([AC_LANG_SOURCE([[#include <libxml2/libxml/xmlversion.h>]])],
 -                [gl_ABSOLUTE_HEADER([libxml2/libxml/xmlversion.h])
 -                 libxml2_include_dir=`echo "$gl_cv_absolute_libxml2_libxml_xmlversion_h" | sed -e 's,.libxml.xmlversion\.h$,,'`
 -                ])
 -            fi
 -            if test -n "$libxml2_include_dir" && test -d "$libxml2_include_dir"; then
 -              CPPFLAGS="$gl_save_CPPFLAGS -I$libxml2_include_dir"
--              AC_TRY_LINK([#include <libxml/xmlversion.h>
--                           #include <libxml/xmlmemory.h>
--                           #include <libxml/xpath.h>
--                          ],
--                [xmlCheckVersion (0);
--                 xmlFree ((void *) 0);
--                 xmlXPathSetContextNode ((void *)0, (void *)0);
--                ],
+-              AC_LINK_IFELSE(
+-                [AC_LANG_PROGRAM(
+-                   [[#include <libxml/xmlversion.h>
+-                     #include <libxml/xmlmemory.h>
+-                     #include <libxml/xpath.h>
+-                   ]],
+-                   [[xmlCheckVersion (0);
+-                     xmlFree ((void *) 0);
+-                     xmlXPathSetContextNode ((void *)0, (void *)0);
+-                   ]])],
 -                [gl_cv_libxml=yes
 -                 gl_cv_LIBXML="$LIBXML2 $LIBICONV"
 -                 gl_cv_LTLIBXML="$LTLIBXML2 $LTLIBICONV"
@@ -168,17 +174,10 @@ index 2ff978f..5ffb17a 100644
  #include "term-ostream.h"
  #include "mem-hash-map.h"
 diff --git a/libtextstyle/gnulib-local/m4/libcroco.m4 b/libtextstyle/gnulib-local/m4/libcroco.m4
-index bc53cc6..10b2455 100644
+index 39e72b1..042915a 100644
 --- a/libtextstyle/gnulib-local/m4/libcroco.m4
 +++ b/libtextstyle/gnulib-local/m4/libcroco.m4
-@@ -1,99 +1,34 @@
--# libcroco.m4 serial 3
--dnl Copyright (C) 2006-2007, 2019 Free Software Foundation, Inc.
-+# libcroco.m4 serial 2 (gettext-0.17)
-+dnl Copyright (C) 2006, 2015-2016 Free Software Foundation, Inc.
- dnl This file is free software; the Free Software Foundation
- dnl gives unlimited permission to copy and/or distribute it,
- dnl with or without modifications, as long as this notice is preserved.
+@@ -6,97 +6,29 @@ dnl with or without modifications, as long as this notice is preserved.
  
  dnl From Bruno Haible.
  
@@ -233,8 +232,9 @@ index bc53cc6..10b2455 100644
 -        dnl one that built the library.
 -        AC_LIB_LINKFLAGS_BODY([croco-0.6], [glib-2.0])
 -        LIBS="$gl_save_LIBS $LIBCROCO_0_6"
--        AC_TRY_LINK([#include <libcroco-config.h>],
--          [const char *version = LIBCROCO_VERSION; return !version;],
+-        AC_LINK_IFELSE(
+-          [AC_LANG_PROGRAM([[#include <libcroco-config.h>]],
+-            [[const char *version = LIBCROCO_VERSION; return !version;]])],
 -          [gl_cv_libcroco=yes
 -           gl_cv_LIBCROCO="$LIBCROCO_0_6"
 -           gl_cv_LTLIBCROCO="$LTLIBCROCO_0_6"
@@ -242,8 +242,9 @@ index bc53cc6..10b2455 100644
 -        if test "$gl_cv_libcroco" != yes; then
 -          gl_save_CPPFLAGS="$CPPFLAGS"
 -          CPPFLAGS="$CPPFLAGS $INCCROCO_0_6"
--          AC_TRY_LINK([#include <libcroco-config.h>],
--            [const char *version = LIBCROCO_VERSION; return !version;],
+-          AC_LINK_IFELSE(
+-            [AC_LANG_PROGRAM([[#include <libcroco-config.h>]],
+-              [[const char *version = LIBCROCO_VERSION; return !version;]])],
 -            [gl_cv_libcroco=yes
 -             gl_cv_LIBCROCO="$LIBCROCO_0_6"
 -             gl_cv_LTLIBCROCO="$LTLIBCROCO_0_6"
@@ -252,8 +253,9 @@ index bc53cc6..10b2455 100644
 -          if test "$gl_cv_libcroco" != yes; then
 -            dnl Often the include files are installed in
 -            dnl /usr/include/libcroco-0.6/libcroco.
--            AC_TRY_LINK([#include <libcroco-0.6/libcroco/libcroco-config.h>],
--              [const char *version = LIBCROCO_VERSION; return !version;],
+-            AC_LINK_IFELSE(
+-              [AC_LANG_PROGRAM([[#include <libcroco-config.h>]],
+-                [[const char *version = LIBCROCO_VERSION; return !version;]])],
 -              [gl_ABSOLUTE_HEADER([libcroco-0.6/libcroco/libcroco-config.h])
 -               libcroco_include_dir=`echo "$gl_cv_absolute_libcroco_0_6_libcroco_libcroco_config_h" | sed -e 's,.libcroco-config\.h$,,'`
 -               if test -d "$libcroco_include_dir"; then
@@ -289,10 +291,10 @@ index bc53cc6..10b2455 100644
    AC_SUBST([LTLIBCROCO])
    AC_SUBST([INCCROCO])
 diff --git a/libtextstyle/gnulib-local/m4/libglib.m4 b/libtextstyle/gnulib-local/m4/libglib.m4
-index 5853772..767fba2 100644
+index 7ee5029..bb1e5e4 100644
 --- a/libtextstyle/gnulib-local/m4/libglib.m4
 +++ b/libtextstyle/gnulib-local/m4/libglib.m4
-@@ -6,100 +6,26 @@ dnl with or without modifications, as long as this notice is preserved.
+@@ -6,106 +6,26 @@ dnl with or without modifications, as long as this notice is preserved.
  
  dnl From Bruno Haible.
  
@@ -340,12 +342,14 @@ index 5853772..767fba2 100644
 -        dnl one that built the library.
 -        AC_LIB_LINKFLAGS_BODY([glib-2.0])
 -        LIBS="$gl_save_LIBS $LIBGLIB_2_0"
--        AC_TRY_LINK([#include <glib.h>
--#ifndef G_BEGIN_DECLS
--error this glib.h includes a glibconfig.h from a glib version 1.x
--#endif
--],
--          [g_string_new ("foo");],
+-        AC_LINK_IFELSE(
+-          [AC_LANG_PROGRAM(
+-             [[#include <glib.h>
+-               #ifndef G_BEGIN_DECLS
+-               error this glib.h includes a glibconfig.h from a glib version 1.x
+-               #endif
+-             ]],
+-             [[g_string_new ("foo");]])],
 -          [gl_cv_libglib=yes
 -           gl_cv_LIBGLIB="$LIBGLIB_2_0"
 -           gl_cv_LTLIBGLIB="$LTLIBGLIB_2_0"
@@ -353,12 +357,14 @@ index 5853772..767fba2 100644
 -        if test "$gl_cv_libglib" != yes; then
 -          gl_save_CPPFLAGS="$CPPFLAGS"
 -          CPPFLAGS="$CPPFLAGS $INCGLIB_2_0"
--          AC_TRY_LINK([#include <glib.h>
--#ifndef G_BEGIN_DECLS
--error this glib.h includes a glibconfig.h from a glib version 1.x
--#endif
--],
--            [g_string_new ("foo");],
+-          AC_LINK_IFELSE(
+-            [AC_LANG_PROGRAM(
+-               [[#include <glib.h>
+-                 #ifndef G_BEGIN_DECLS
+-                 error this glib.h includes a glibconfig.h from a glib version 1.x
+-                 #endif
+-               ]],
+-               [[g_string_new ("foo");]])],
 -            [gl_cv_libglib=yes
 -             gl_cv_LIBGLIB="$LIBGLIB_2_0"
 -             gl_cv_LTLIBGLIB="$LTLIBGLIB_2_0"
@@ -369,12 +375,14 @@ index 5853772..767fba2 100644
 -            dnl and /usr/lib/glib-2.0/include.
 -            if test -n "$LIBGLIB_2_0_PREFIX"; then
 -              CPPFLAGS="$gl_save_CPPFLAGS -I$LIBGLIB_2_0_PREFIX/include/glib-2.0 -I$LIBGLIB_2_0_PREFIX/$acl_libdirstem/glib-2.0/include"
--              AC_TRY_LINK([#include <glib.h>
--#ifndef G_BEGIN_DECLS
--error this glib.h includes a glibconfig.h from a glib version 1.x
--#endif
--],
--                [g_string_new ("foo");],
+-              AC_LINK_IFELSE(
+-                [AC_LANG_PROGRAM(
+-                   [[#include <glib.h>
+-                     #ifndef G_BEGIN_DECLS
+-                     error this glib.h includes a glibconfig.h from a glib version 1.x
+-                     #endif
+-                   ]],
+-                   [[g_string_new ("foo");]])],
 -                [gl_cv_libglib=yes
 -                 gl_cv_LIBGLIB="$LIBGLIB_2_0"
 -                 gl_cv_LTLIBGLIB="$LTLIBGLIB_2_0"
@@ -407,17 +415,10 @@ index 5853772..767fba2 100644
    AC_SUBST([LTLIBGLIB])
    AC_SUBST([INCGLIB])
 diff --git a/libtextstyle/gnulib-m4/libcroco.m4 b/libtextstyle/gnulib-m4/libcroco.m4
-index bc53cc6..10b2455 100644
+index 39e72b1..042915a 100644
 --- a/libtextstyle/gnulib-m4/libcroco.m4
 +++ b/libtextstyle/gnulib-m4/libcroco.m4
-@@ -1,99 +1,34 @@
--# libcroco.m4 serial 3
--dnl Copyright (C) 2006-2007, 2019 Free Software Foundation, Inc.
-+# libcroco.m4 serial 2 (gettext-0.17)
-+dnl Copyright (C) 2006, 2015-2016 Free Software Foundation, Inc.
- dnl This file is free software; the Free Software Foundation
- dnl gives unlimited permission to copy and/or distribute it,
- dnl with or without modifications, as long as this notice is preserved.
+@@ -6,97 +6,29 @@ dnl with or without modifications, as long as this notice is preserved.
  
  dnl From Bruno Haible.
  
@@ -472,8 +473,9 @@ index bc53cc6..10b2455 100644
 -        dnl one that built the library.
 -        AC_LIB_LINKFLAGS_BODY([croco-0.6], [glib-2.0])
 -        LIBS="$gl_save_LIBS $LIBCROCO_0_6"
--        AC_TRY_LINK([#include <libcroco-config.h>],
--          [const char *version = LIBCROCO_VERSION; return !version;],
+-        AC_LINK_IFELSE(
+-          [AC_LANG_PROGRAM([[#include <libcroco-config.h>]],
+-            [[const char *version = LIBCROCO_VERSION; return !version;]])],
 -          [gl_cv_libcroco=yes
 -           gl_cv_LIBCROCO="$LIBCROCO_0_6"
 -           gl_cv_LTLIBCROCO="$LTLIBCROCO_0_6"
@@ -481,8 +483,9 @@ index bc53cc6..10b2455 100644
 -        if test "$gl_cv_libcroco" != yes; then
 -          gl_save_CPPFLAGS="$CPPFLAGS"
 -          CPPFLAGS="$CPPFLAGS $INCCROCO_0_6"
--          AC_TRY_LINK([#include <libcroco-config.h>],
--            [const char *version = LIBCROCO_VERSION; return !version;],
+-          AC_LINK_IFELSE(
+-            [AC_LANG_PROGRAM([[#include <libcroco-config.h>]],
+-              [[const char *version = LIBCROCO_VERSION; return !version;]])],
 -            [gl_cv_libcroco=yes
 -             gl_cv_LIBCROCO="$LIBCROCO_0_6"
 -             gl_cv_LTLIBCROCO="$LTLIBCROCO_0_6"
@@ -491,8 +494,9 @@ index bc53cc6..10b2455 100644
 -          if test "$gl_cv_libcroco" != yes; then
 -            dnl Often the include files are installed in
 -            dnl /usr/include/libcroco-0.6/libcroco.
--            AC_TRY_LINK([#include <libcroco-0.6/libcroco/libcroco-config.h>],
--              [const char *version = LIBCROCO_VERSION; return !version;],
+-            AC_LINK_IFELSE(
+-              [AC_LANG_PROGRAM([[#include <libcroco-config.h>]],
+-                [[const char *version = LIBCROCO_VERSION; return !version;]])],
 -              [gl_ABSOLUTE_HEADER([libcroco-0.6/libcroco/libcroco-config.h])
 -               libcroco_include_dir=`echo "$gl_cv_absolute_libcroco_0_6_libcroco_libcroco_config_h" | sed -e 's,.libcroco-config\.h$,,'`
 -               if test -d "$libcroco_include_dir"; then
@@ -528,10 +532,10 @@ index bc53cc6..10b2455 100644
    AC_SUBST([LTLIBCROCO])
    AC_SUBST([INCCROCO])
 diff --git a/libtextstyle/gnulib-m4/libglib.m4 b/libtextstyle/gnulib-m4/libglib.m4
-index 5853772..767fba2 100644
+index 7ee5029..bb1e5e4 100644
 --- a/libtextstyle/gnulib-m4/libglib.m4
 +++ b/libtextstyle/gnulib-m4/libglib.m4
-@@ -6,100 +6,26 @@ dnl with or without modifications, as long as this notice is preserved.
+@@ -6,106 +6,26 @@ dnl with or without modifications, as long as this notice is preserved.
  
  dnl From Bruno Haible.
  
@@ -579,12 +583,14 @@ index 5853772..767fba2 100644
 -        dnl one that built the library.
 -        AC_LIB_LINKFLAGS_BODY([glib-2.0])
 -        LIBS="$gl_save_LIBS $LIBGLIB_2_0"
--        AC_TRY_LINK([#include <glib.h>
--#ifndef G_BEGIN_DECLS
--error this glib.h includes a glibconfig.h from a glib version 1.x
--#endif
--],
--          [g_string_new ("foo");],
+-        AC_LINK_IFELSE(
+-          [AC_LANG_PROGRAM(
+-             [[#include <glib.h>
+-               #ifndef G_BEGIN_DECLS
+-               error this glib.h includes a glibconfig.h from a glib version 1.x
+-               #endif
+-             ]],
+-             [[g_string_new ("foo");]])],
 -          [gl_cv_libglib=yes
 -           gl_cv_LIBGLIB="$LIBGLIB_2_0"
 -           gl_cv_LTLIBGLIB="$LTLIBGLIB_2_0"
@@ -592,12 +598,14 @@ index 5853772..767fba2 100644
 -        if test "$gl_cv_libglib" != yes; then
 -          gl_save_CPPFLAGS="$CPPFLAGS"
 -          CPPFLAGS="$CPPFLAGS $INCGLIB_2_0"
--          AC_TRY_LINK([#include <glib.h>
--#ifndef G_BEGIN_DECLS
--error this glib.h includes a glibconfig.h from a glib version 1.x
--#endif
--],
--            [g_string_new ("foo");],
+-          AC_LINK_IFELSE(
+-            [AC_LANG_PROGRAM(
+-               [[#include <glib.h>
+-                 #ifndef G_BEGIN_DECLS
+-                 error this glib.h includes a glibconfig.h from a glib version 1.x
+-                 #endif
+-               ]],
+-               [[g_string_new ("foo");]])],
 -            [gl_cv_libglib=yes
 -             gl_cv_LIBGLIB="$LIBGLIB_2_0"
 -             gl_cv_LTLIBGLIB="$LTLIBGLIB_2_0"
@@ -608,12 +616,14 @@ index 5853772..767fba2 100644
 -            dnl and /usr/lib/glib-2.0/include.
 -            if test -n "$LIBGLIB_2_0_PREFIX"; then
 -              CPPFLAGS="$gl_save_CPPFLAGS -I$LIBGLIB_2_0_PREFIX/include/glib-2.0 -I$LIBGLIB_2_0_PREFIX/$acl_libdirstem/glib-2.0/include"
--              AC_TRY_LINK([#include <glib.h>
--#ifndef G_BEGIN_DECLS
--error this glib.h includes a glibconfig.h from a glib version 1.x
--#endif
--],
--                [g_string_new ("foo");],
+-              AC_LINK_IFELSE(
+-                [AC_LANG_PROGRAM(
+-                   [[#include <glib.h>
+-                     #ifndef G_BEGIN_DECLS
+-                     error this glib.h includes a glibconfig.h from a glib version 1.x
+-                     #endif
+-                   ]],
+-                   [[g_string_new ("foo");]])],
 -                [gl_cv_libglib=yes
 -                 gl_cv_LIBGLIB="$LIBGLIB_2_0"
 -                 gl_cv_LTLIBGLIB="$LTLIBGLIB_2_0"
diff --git a/meta/recipes-core/gettext/gettext-0.21/0001-libtextstyle-fix-builds-with-automake-1.16.4-and-new.patch b/meta/recipes-core/gettext/gettext-0.21/0001-libtextstyle-fix-builds-with-automake-1.16.4-and-new.patch
deleted file mode 100644
index 727d1db552..0000000000
--- a/meta/recipes-core/gettext/gettext-0.21/0001-libtextstyle-fix-builds-with-automake-1.16.4-and-new.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 2f127ebe425c97b0641fe1bc73247e91e18c2be0 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Thu, 11 Nov 2021 22:06:16 +0100
-Subject: [PATCH] libtextstyle: fix builds with automake 1.16.4 and newer
-
-Upstream-Status: Submitted [http://savannah.gnu.org/bugs/?59929]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- libtextstyle/configure.ac | 5 ++---
- 1 file changed, 2 insertions(+), 3 deletions(-)
-
-diff --git a/libtextstyle/configure.ac b/libtextstyle/configure.ac
-index 63b4c2a..cab9025 100644
---- a/libtextstyle/configure.ac
-+++ b/libtextstyle/configure.ac
-@@ -17,11 +17,10 @@ dnl along with this program.  If not, see <https://www.gnu.org/licenses/>.
- dnl Process this file with autoconf to produce a configure script.
- 
- AC_PREREQ([2.63])
--AC_INIT
-+AC_INIT([libtextstyle],
-+    [0.20.1])
- AC_CONFIG_SRCDIR([version.sh])
- AC_CONFIG_AUX_DIR([build-aux])
--. $srcdir/version.sh
--gl_INIT_PACKAGE([libtextstyle], [$VERSION_NUMBER])
- AM_INIT_AUTOMAKE([1.13 silent-rules])
- AM_CONFIG_HEADER([config.h])
- 
diff --git a/meta/recipes-core/gettext/gettext-0.21/0001-msgmerge-29-Add-executable-file-mode-bits.patch b/meta/recipes-core/gettext/gettext-0.21/0001-msgmerge-29-Add-executable-file-mode-bits.patch
deleted file mode 100644
index e42a6c0a4d..0000000000
--- a/meta/recipes-core/gettext/gettext-0.21/0001-msgmerge-29-Add-executable-file-mode-bits.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-From 71988f83b69c4ed98d1b9418da80edf11a931894 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 23 Sep 2020 22:08:34 -0700
-Subject: [PATCH] msgmerge-29: Add executable file mode bits
-
-This script is installed with default mode bits and executed directly
-e.g ./msgmerge-29 when doing make check which results in
-
-/bin/bash: line 9: ./msgmerge-29: Permission denied
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- gettext-tools/tests/msgmerge-29 | 0
- 1 file changed, 0 insertions(+), 0 deletions(-)
- mode change 100644 => 100755 gettext-tools/tests/msgmerge-29
-
-diff --git a/gettext-tools/tests/msgmerge-29 b/gettext-tools/tests/msgmerge-29
-old mode 100644
-new mode 100755
--- 
-2.28.0
-
diff --git a/meta/recipes-core/gettext/gettext-0.21/mingw.patch b/meta/recipes-core/gettext/gettext-0.21/mingw.patch
deleted file mode 100644
index b062c784f6..0000000000
--- a/meta/recipes-core/gettext/gettext-0.21/mingw.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 7cf68dffb2adb76375bfb0781e277510523a1f3e Mon Sep 17 00:00:00 2001
-From: Michele Locati <michele@locati.it>
-Date: Thu, 30 Jul 2020 18:58:02 +0200
-Subject: [PATCH] build: Fix build failure on Cygwin and mingw.
-
-* gettext-tools/woe32dll/gettextsrc-exports.c: Export formatstring_ruby.
-
-Upstream-Status: Backport
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- gettext-tools/woe32dll/gettextsrc-exports.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/gettext-tools/woe32dll/gettextsrc-exports.c b/gettext-tools/woe32dll/gettextsrc-exports.c
-index 4477ae8..6d76089 100644
---- a/gettext-tools/woe32dll/gettextsrc-exports.c
-+++ b/gettext-tools/woe32dll/gettextsrc-exports.c
-@@ -50,6 +50,7 @@ VARIABLE(formatstring_python)
- VARIABLE(formatstring_python_brace)
- VARIABLE(formatstring_qt)
- VARIABLE(formatstring_qt_plural)
-+VARIABLE(formatstring_ruby)
- VARIABLE(formatstring_scheme)
- VARIABLE(formatstring_sh)
- VARIABLE(formatstring_smalltalk)
--- 
-1.9.1
-
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.21/COPYING b/meta/recipes-core/gettext/gettext-minimal-0.21.1/COPYING
similarity index 100%
rename from meta/recipes-core/gettext/gettext-minimal-0.21/COPYING
rename to meta/recipes-core/gettext/gettext-minimal-0.21.1/COPYING
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.21/Makefile.in.in b/meta/recipes-core/gettext/gettext-minimal-0.21.1/Makefile.in.in
similarity index 100%
rename from meta/recipes-core/gettext/gettext-minimal-0.21/Makefile.in.in
rename to meta/recipes-core/gettext/gettext-minimal-0.21.1/Makefile.in.in
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.21/aclocal/gettext.m4 b/meta/recipes-core/gettext/gettext-minimal-0.21.1/aclocal/gettext.m4
similarity index 94%
rename from meta/recipes-core/gettext/gettext-minimal-0.21/aclocal/gettext.m4
rename to meta/recipes-core/gettext/gettext-minimal-0.21.1/aclocal/gettext.m4
index 4f25a27d93..f4492405bd 100644
--- a/meta/recipes-core/gettext/gettext-minimal-0.21/aclocal/gettext.m4
+++ b/meta/recipes-core/gettext/gettext-minimal-0.21.1/aclocal/gettext.m4
@@ -1,4 +1,4 @@
-# gettext.m4 serial 71 (gettext-0.20.2)
+# gettext.m4 serial 72 (gettext-0.21.1)
 dnl Copyright (C) 1995-2014, 2016, 2018-2020 Free Software Foundation, Inc.
 dnl This file is free software; the Free Software Foundation
 dnl gives unlimited permission to copy and/or distribute it,
@@ -55,22 +55,22 @@ dnl
 AC_DEFUN([AM_GNU_GETTEXT],
 [
   dnl Argument checking.
-  ifelse([$1], [], , [ifelse([$1], [external], , [ifelse([$1], [use-libtool], ,
+  m4_if([$1], [], , [m4_if([$1], [external], , [m4_if([$1], [use-libtool], ,
     [errprint([ERROR: invalid first argument to AM_GNU_GETTEXT
 ])])])])
-  ifelse(ifelse([$1], [], [old])[]ifelse([$1], [no-libtool], [old]), [old],
+  m4_if(m4_if([$1], [], [old])[]m4_if([$1], [no-libtool], [old]), [old],
     [errprint([ERROR: Use of AM_GNU_GETTEXT without [external] argument is no longer supported.
 ])])
-  ifelse([$2], [], , [ifelse([$2], [need-ngettext], , [ifelse([$2], [need-formatstring-macros], ,
+  m4_if([$2], [], , [m4_if([$2], [need-ngettext], , [m4_if([$2], [need-formatstring-macros], ,
     [errprint([ERROR: invalid second argument to AM_GNU_GETTEXT
 ])])])])
   define([gt_included_intl],
-    ifelse([$1], [external], [no], [yes]))
+    m4_if([$1], [external], [no], [yes]))
   gt_NEEDS_INIT
   AM_GNU_GETTEXT_NEED([$2])
 
   AC_REQUIRE([AM_PO_SUBDIRS])dnl
-  ifelse(gt_included_intl, yes, [
+  m4_if(gt_included_intl, yes, [
     AC_REQUIRE([AM_INTL_SUBDIR])dnl
   ])
 
@@ -88,7 +88,7 @@ AC_DEFUN([AM_GNU_GETTEXT],
   dnl - Invoke AM_ICONV_LINKFLAGS_BODY here, outside any 'if'.
   dnl - Control the expansions in more detail using AC_PROVIDE_IFELSE.
   dnl Since AC_PROVIDE_IFELSE is not documented, we avoid it.
-  ifelse(gt_included_intl, yes, , [
+  m4_if(gt_included_intl, yes, , [
     AC_REQUIRE([AM_ICONV_LINKFLAGS_BODY])
   ])
 
@@ -98,7 +98,7 @@ AC_DEFUN([AM_GNU_GETTEXT],
   dnl Set USE_NLS.
   AC_REQUIRE([AM_NLS])
 
-  ifelse(gt_included_intl, yes, [
+  m4_if(gt_included_intl, yes, [
     BUILD_INCLUDED_LIBINTL=no
     USE_INCLUDED_LIBINTL=no
   ])
@@ -118,7 +118,7 @@ AC_DEFUN([AM_GNU_GETTEXT],
   dnl If we use NLS figure out what method
   if test "$USE_NLS" = "yes"; then
     gt_use_preinstalled_gnugettext=no
-    ifelse(gt_included_intl, yes, [
+    m4_if(gt_included_intl, yes, [
       AC_MSG_CHECKING([whether included gettext is requested])
       AC_ARG_WITH([included-gettext],
         [  --with-included-gettext use the GNU gettext library included here],
@@ -174,7 +174,7 @@ return * gettext ("")$gt_expression_test_code + __GNU_GETTEXT_SYMBOL_EXPRESSION
 
         if { eval "gt_val=\$$gt_func_gnugettext_libc"; test "$gt_val" != "yes"; }; then
           dnl Sometimes libintl requires libiconv, so first search for libiconv.
-          ifelse(gt_included_intl, yes, , [
+          m4_if(gt_included_intl, yes, , [
             AM_ICONV_LINK
           ])
           dnl Search for libintl and define LIBINTL, LTLIBINTL and INCINTL
@@ -261,7 +261,7 @@ return * gettext ("")$gt_expression_test_code + __GNU_GETTEXT_SYMBOL_EXPRESSION
           INCINTL=
         fi
 
-    ifelse(gt_included_intl, yes, [
+    m4_if(gt_included_intl, yes, [
         if test "$gt_use_preinstalled_gnugettext" != "yes"; then
           dnl GNU gettext is not found in the C library.
           dnl Fall back on included GNU gettext library.
@@ -273,8 +273,8 @@ return * gettext ("")$gt_expression_test_code + __GNU_GETTEXT_SYMBOL_EXPRESSION
         dnl Mark actions used to generate GNU NLS library.
         BUILD_INCLUDED_LIBINTL=yes
         USE_INCLUDED_LIBINTL=yes
-        LIBINTL="ifelse([$3],[],\${top_builddir}/intl,[$3])/libintl.la $LIBICONV $LIBTHREAD"
-        LTLIBINTL="ifelse([$3],[],\${top_builddir}/intl,[$3])/libintl.la $LTLIBICONV $LTLIBTHREAD"
+        LIBINTL="m4_if([$3],[],\${top_builddir}/intl,[$3])/libintl.la $LIBICONV $LIBTHREAD"
+        LTLIBINTL="m4_if([$3],[],\${top_builddir}/intl,[$3])/libintl.la $LTLIBICONV $LTLIBTHREAD"
         LIBS=`echo " $LIBS " | sed -e 's/ -lintl / /' -e 's/^ //' -e 's/ $//'`
       fi
 
@@ -341,7 +341,7 @@ return * gettext ("")$gt_expression_test_code + __GNU_GETTEXT_SYMBOL_EXPRESSION
     POSUB=po
   fi
 
-  ifelse(gt_included_intl, yes, [
+  m4_if(gt_included_intl, yes, [
     dnl In GNU gettext we have to set BUILD_INCLUDED_LIBINTL to 'yes'
     dnl because some of the testsuite requires it.
     BUILD_INCLUDED_LIBINTL=yes
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.21/aclocal/host-cpu-c-abi.m4 b/meta/recipes-core/gettext/gettext-minimal-0.21.1/aclocal/host-cpu-c-abi.m4
similarity index 98%
rename from meta/recipes-core/gettext/gettext-minimal-0.21/aclocal/host-cpu-c-abi.m4
rename to meta/recipes-core/gettext/gettext-minimal-0.21.1/aclocal/host-cpu-c-abi.m4
index 6db2aa25ae..b9223241b4 100644
--- a/meta/recipes-core/gettext/gettext-minimal-0.21/aclocal/host-cpu-c-abi.m4
+++ b/meta/recipes-core/gettext/gettext-minimal-0.21.1/aclocal/host-cpu-c-abi.m4
@@ -1,5 +1,5 @@
-# host-cpu-c-abi.m4 serial 13
-dnl Copyright (C) 2002-2020 Free Software Foundation, Inc.
+# host-cpu-c-abi.m4 serial 15
+dnl Copyright (C) 2002-2022 Free Software Foundation, Inc.
 dnl This file is free software; the Free Software Foundation
 dnl gives unlimited permission to copy and/or distribute it,
 dnl with or without modifications, as long as this notice is preserved.
@@ -211,7 +211,7 @@ changequote([,])dnl
          # be generating 64-bit code.
          AC_COMPILE_IFELSE(
            [AC_LANG_SOURCE(
-              [[#if defined __powerpc64__ || defined _ARCH_PPC64
+              [[#if defined __powerpc64__ || defined __LP64__
                  int ok;
                 #else
                  error fail
@@ -382,6 +382,9 @@ EOF
 #ifndef __ia64__
 #undef __ia64__
 #endif
+#ifndef __loongarch64__
+#undef __loongarch64__
+#endif
 #ifndef __m68k__
 #undef __m68k__
 #endif
@@ -605,7 +608,7 @@ changequote([,])dnl
            # be generating 64-bit code.
            AC_COMPILE_IFELSE(
              [AC_LANG_SOURCE(
-                [[#if defined __powerpc64__ || defined _ARCH_PPC64
+                [[#if defined __powerpc64__ || defined __LP64__
                    int ok;
                   #else
                    error fail
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.21/aclocal/iconv.m4 b/meta/recipes-core/gettext/gettext-minimal-0.21.1/aclocal/iconv.m4
similarity index 86%
rename from meta/recipes-core/gettext/gettext-minimal-0.21/aclocal/iconv.m4
rename to meta/recipes-core/gettext/gettext-minimal-0.21.1/aclocal/iconv.m4
index e593b7270a..00057953e3 100644
--- a/meta/recipes-core/gettext/gettext-minimal-0.21/aclocal/iconv.m4
+++ b/meta/recipes-core/gettext/gettext-minimal-0.21.1/aclocal/iconv.m4
@@ -1,5 +1,5 @@
-# iconv.m4 serial 21
-dnl Copyright (C) 2000-2002, 2007-2014, 2016-2020 Free Software Foundation,
+# iconv.m4 serial 24
+dnl Copyright (C) 2000-2002, 2007-2014, 2016-2022 Free Software Foundation,
 dnl Inc.
 dnl This file is free software; the Free Software Foundation
 dnl gives unlimited permission to copy and/or distribute it,
@@ -7,6 +7,12 @@ dnl with or without modifications, as long as this notice is preserved.
 
 dnl From Bruno Haible.
 
+AC_PREREQ([2.64])
+
+dnl Note: AM_ICONV is documented in the GNU gettext manual
+dnl <https://www.gnu.org/software/gettext/manual/html_node/AM_005fICONV.html>.
+dnl Don't make changes that are incompatible with that documentation!
+
 AC_DEFUN([AM_ICONV_LINKFLAGS_BODY],
 [
   dnl Prerequisites of AC_LIB_LINKFLAGS_BODY.
@@ -86,8 +92,9 @@ AC_DEFUN([AM_ICONV_LINK],
 #endif
              ]],
              [[int result = 0;
-  /* Test against AIX 5.1 bug: Failures are not distinguishable from successful
-     returns.  */
+  /* Test against AIX 5.1...7.2 bug: Failures are not distinguishable from
+     successful returns.  This is even documented in
+     <https://www.ibm.com/support/knowledgecenter/ssw_aix_72/i_bostechref/iconv.html> */
   {
     iconv_t cd_utf8_to_88591 = iconv_open ("ISO8859-1", "UTF-8");
     if (cd_utf8_to_88591 != (iconv_t)(-1))
@@ -225,8 +232,7 @@ AC_DEFUN([AM_ICONV_LINK],
   AC_SUBST([LTLIBICONV])
 ])
 
-dnl Define AM_ICONV using AC_DEFUN_ONCE for Autoconf >= 2.64, in order to
-dnl avoid warnings like
+dnl Define AM_ICONV using AC_DEFUN_ONCE, in order to avoid warnings like
 dnl "warning: AC_REQUIRE: `AM_ICONV' was expanded before it was required".
 dnl This is tricky because of the way 'aclocal' is implemented:
 dnl - It requires defining an auxiliary macro whose name ends in AC_DEFUN.
@@ -234,54 +240,43 @@ dnl   Otherwise aclocal's initial scan pass would miss the macro definition.
 dnl - It requires a line break inside the AC_DEFUN_ONCE and AC_DEFUN expansions.
 dnl   Otherwise aclocal would emit many "Use of uninitialized value $1"
 dnl   warnings.
-m4_define([gl_iconv_AC_DEFUN],
-  m4_version_prereq([2.64],
-    [[AC_DEFUN_ONCE(
-        [$1], [$2])]],
-    [m4_ifdef([gl_00GNULIB],
-       [[AC_DEFUN_ONCE(
-           [$1], [$2])]],
-       [[AC_DEFUN(
-           [$1], [$2])]])]))
-gl_iconv_AC_DEFUN([AM_ICONV],
+AC_DEFUN_ONCE([AM_ICONV],
 [
   AM_ICONV_LINK
   if test "$am_cv_func_iconv" = yes; then
-    AC_MSG_CHECKING([for iconv declaration])
-    AC_CACHE_VAL([am_cv_proto_iconv], [
-      AC_COMPILE_IFELSE(
-        [AC_LANG_PROGRAM(
-           [[
+    AC_CACHE_CHECK([whether iconv is compatible with its POSIX signature],
+      [gl_cv_iconv_nonconst],
+      [AC_COMPILE_IFELSE(
+         [AC_LANG_PROGRAM(
+            [[
 #include <stdlib.h>
 #include <iconv.h>
 extern
 #ifdef __cplusplus
 "C"
 #endif
-#if defined(__STDC__) || defined(_MSC_VER) || defined(__cplusplus)
 size_t iconv (iconv_t cd, char * *inbuf, size_t *inbytesleft, char * *outbuf, size_t *outbytesleft);
-#else
-size_t iconv();
-#endif
-           ]],
-           [[]])],
-        [am_cv_proto_iconv_arg1=""],
-        [am_cv_proto_iconv_arg1="const"])
-      am_cv_proto_iconv="extern size_t iconv (iconv_t cd, $am_cv_proto_iconv_arg1 char * *inbuf, size_t *inbytesleft, char * *outbuf, size_t *outbytesleft);"])
-    am_cv_proto_iconv=`echo "[$]am_cv_proto_iconv" | tr -s ' ' | sed -e 's/( /(/'`
-    AC_MSG_RESULT([
-         $am_cv_proto_iconv])
+            ]],
+            [[]])],
+         [gl_cv_iconv_nonconst=yes],
+         [gl_cv_iconv_nonconst=no])
+      ])
   else
     dnl When compiling GNU libiconv on a system that does not have iconv yet,
     dnl pick the POSIX compliant declaration without 'const'.
-    am_cv_proto_iconv_arg1=""
+    gl_cv_iconv_nonconst=yes
+  fi
+  if test $gl_cv_iconv_nonconst = yes; then
+    iconv_arg1=""
+  else
+    iconv_arg1="const"
   fi
-  AC_DEFINE_UNQUOTED([ICONV_CONST], [$am_cv_proto_iconv_arg1],
+  AC_DEFINE_UNQUOTED([ICONV_CONST], [$iconv_arg1],
     [Define as const if the declaration of iconv() needs const.])
   dnl Also substitute ICONV_CONST in the gnulib generated <iconv.h>.
   m4_ifdef([gl_ICONV_H_DEFAULTS],
     [AC_REQUIRE([gl_ICONV_H_DEFAULTS])
-     if test -n "$am_cv_proto_iconv_arg1"; then
+     if test $gl_cv_iconv_nonconst != yes; then
        ICONV_CONST="const"
      fi
     ])
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.21/aclocal/intlmacosx.m4 b/meta/recipes-core/gettext/gettext-minimal-0.21.1/aclocal/intlmacosx.m4
similarity index 98%
rename from meta/recipes-core/gettext/gettext-minimal-0.21/aclocal/intlmacosx.m4
rename to meta/recipes-core/gettext/gettext-minimal-0.21.1/aclocal/intlmacosx.m4
index ebd9937c1a..ecc88d6e74 100644
--- a/meta/recipes-core/gettext/gettext-minimal-0.21/aclocal/intlmacosx.m4
+++ b/meta/recipes-core/gettext/gettext-minimal-0.21.1/aclocal/intlmacosx.m4
@@ -1,5 +1,5 @@
 # intlmacosx.m4 serial 8 (gettext-0.20.2)
-dnl Copyright (C) 2004-2014, 2016, 2019-2020 Free Software Foundation, Inc.
+dnl Copyright (C) 2004-2014, 2016, 2019-2022 Free Software Foundation, Inc.
 dnl This file is free software; the Free Software Foundation
 dnl gives unlimited permission to copy and/or distribute it,
 dnl with or without modifications, as long as this notice is preserved.
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.21/aclocal/lib-ld.m4 b/meta/recipes-core/gettext/gettext-minimal-0.21.1/aclocal/lib-ld.m4
similarity index 97%
rename from meta/recipes-core/gettext/gettext-minimal-0.21/aclocal/lib-ld.m4
rename to meta/recipes-core/gettext/gettext-minimal-0.21.1/aclocal/lib-ld.m4
index 98c348faff..934207a765 100644
--- a/meta/recipes-core/gettext/gettext-minimal-0.21/aclocal/lib-ld.m4
+++ b/meta/recipes-core/gettext/gettext-minimal-0.21.1/aclocal/lib-ld.m4
@@ -1,5 +1,5 @@
-# lib-ld.m4 serial 9
-dnl Copyright (C) 1996-2003, 2009-2020 Free Software Foundation, Inc.
+# lib-ld.m4 serial 10
+dnl Copyright (C) 1996-2003, 2009-2022 Free Software Foundation, Inc.
 dnl This file is free software; the Free Software Foundation
 dnl gives unlimited permission to copy and/or distribute it,
 dnl with or without modifications, as long as this notice is preserved.
@@ -122,7 +122,7 @@ else
       *-*-aix*)
         AC_COMPILE_IFELSE(
           [AC_LANG_SOURCE(
-             [[#if defined __powerpc64__ || defined _ARCH_PPC64
+             [[#if defined __powerpc64__ || defined __LP64__
                 int ok;
                #else
                 error fail
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.21/aclocal/lib-link.m4 b/meta/recipes-core/gettext/gettext-minimal-0.21.1/aclocal/lib-link.m4
similarity index 96%
rename from meta/recipes-core/gettext/gettext-minimal-0.21/aclocal/lib-link.m4
rename to meta/recipes-core/gettext/gettext-minimal-0.21.1/aclocal/lib-link.m4
index eecf70ec76..3b75bcd0de 100644
--- a/meta/recipes-core/gettext/gettext-minimal-0.21/aclocal/lib-link.m4
+++ b/meta/recipes-core/gettext/gettext-minimal-0.21.1/aclocal/lib-link.m4
@@ -1,5 +1,5 @@
-# lib-link.m4 serial 31
-dnl Copyright (C) 2001-2020 Free Software Foundation, Inc.
+# lib-link.m4 serial 33
+dnl Copyright (C) 2001-2022 Free Software Foundation, Inc.
 dnl This file is free software; the Free Software Foundation
 dnl gives unlimited permission to copy and/or distribute it,
 dnl with or without modifications, as long as this notice is preserved.
@@ -196,8 +196,8 @@ AC_DEFUN([AC_LIB_LINKFLAGS_BODY],
     eval additional_libdir3=\"$exec_prefix/$acl_libdirstem3\"
   ])
   AC_ARG_WITH(PACK[-prefix],
-[[  --with-]]PACK[[-prefix[=DIR]  search for ]PACKLIBS[ in DIR/include and DIR/lib
-  --without-]]PACK[[-prefix     don't search for ]PACKLIBS[ in includedir and libdir]],
+[[  --with-]]PACK[[-prefix[=DIR]  search for ]]PACKLIBS[[ in DIR/include and DIR/lib
+  --without-]]PACK[[-prefix     don't search for ]]PACKLIBS[[ in includedir and libdir]],
 [
     if test "X$withval" = "Xno"; then
       use_additional=no
@@ -631,7 +631,20 @@ AC_DEFUN([AC_LIB_LINKFLAGS_BODY],
                     ;;
                   -l*)
                     dnl Handle this in the next round.
-                    names_next_round="$names_next_round "`echo "X$dep" | sed -e 's/^X-l//'`
+                    dnl But on GNU systems, ignore -lc options, because
+                    dnl   - linking with libc is the default anyway,
+                    dnl   - linking with libc.a may produce an error
+                    dnl     "/usr/bin/ld: dynamic STT_GNU_IFUNC symbol `strcmp' with pointer equality in `/usr/lib/libc.a(strcmp.o)' can not be used when making an executable; recompile with -fPIE and relink with -pie"
+                    dnl     or may produce an executable that always crashes, see
+                    dnl     <https://lists.gnu.org/archive/html/grep-devel/2020-09/msg00052.html>.
+                    dep=`echo "X$dep" | sed -e 's/^X-l//'`
+                    if test "X$dep" != Xc \
+                       || case $host_os in
+                            linux* | gnu* | k*bsd*-gnu) false ;;
+                            *)                          true ;;
+                          esac; then
+                      names_next_round="$names_next_round $dep"
+                    fi
                     ;;
                   *.la)
                     dnl Handle this in the next round. Throw away the .la's
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.21/aclocal/lib-prefix.m4 b/meta/recipes-core/gettext/gettext-minimal-0.21.1/aclocal/lib-prefix.m4
similarity index 95%
rename from meta/recipes-core/gettext/gettext-minimal-0.21/aclocal/lib-prefix.m4
rename to meta/recipes-core/gettext/gettext-minimal-0.21.1/aclocal/lib-prefix.m4
index c8a0b464c2..999f712f5a 100644
--- a/meta/recipes-core/gettext/gettext-minimal-0.21/aclocal/lib-prefix.m4
+++ b/meta/recipes-core/gettext/gettext-minimal-0.21.1/aclocal/lib-prefix.m4
@@ -1,5 +1,5 @@
-# lib-prefix.m4 serial 17
-dnl Copyright (C) 2001-2005, 2008-2020 Free Software Foundation, Inc.
+# lib-prefix.m4 serial 20
+dnl Copyright (C) 2001-2005, 2008-2022 Free Software Foundation, Inc.
 dnl This file is free software; the Free Software Foundation
 dnl gives unlimited permission to copy and/or distribute it,
 dnl with or without modifications, as long as this notice is preserved.
@@ -174,14 +174,14 @@ AC_DEFUN([AC_LIB_PREPARE_MULTILIB],
 
   AC_CACHE_CHECK([for ELF binary format], [gl_cv_elf],
     [AC_EGREP_CPP([Extensible Linking Format],
-       [#ifdef __ELF__
+       [#if defined __ELF__ || (defined __linux__ && defined __EDG__)
         Extensible Linking Format
         #endif
        ],
        [gl_cv_elf=yes],
        [gl_cv_elf=no])
-     ])
-  if test $gl_cv_elf; then
+    ])
+  if test $gl_cv_elf = yes; then
     # Extract the ELF class of a file (5th byte) in decimal.
     # Cf. https://en.wikipedia.org/wiki/Executable_and_Linkable_Format#File_header
     if od -A x < /dev/null >/dev/null 2>/dev/null; then
@@ -198,20 +198,23 @@ AC_DEFUN([AC_LIB_PREPARE_MULTILIB],
         echo
       }
     fi
+    # Use 'expr', not 'test', to compare the values of func_elfclass, because on
+    # Solaris 11 OpenIndiana and Solaris 11 OmniOS, the result is 001 or 002,
+    # not 1 or 2.
 changequote(,)dnl
     case $HOST_CPU_C_ABI_32BIT in
       yes)
         # 32-bit ABI.
         acl_is_expected_elfclass ()
         {
-          test "`func_elfclass | sed -e 's/[ 	]//g'`" = 1
+          expr "`func_elfclass | sed -e 's/[ 	]//g'`" = 1 > /dev/null
         }
         ;;
       no)
         # 64-bit ABI.
         acl_is_expected_elfclass ()
         {
-          test "`func_elfclass | sed -e 's/[ 	]//g'`" = 2
+          expr "`func_elfclass | sed -e 's/[ 	]//g'`" = 2 > /dev/null
         }
         ;;
       *)
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.21/aclocal/nls.m4 b/meta/recipes-core/gettext/gettext-minimal-0.21.1/aclocal/nls.m4
similarity index 99%
rename from meta/recipes-core/gettext/gettext-minimal-0.21/aclocal/nls.m4
rename to meta/recipes-core/gettext/gettext-minimal-0.21.1/aclocal/nls.m4
index 5a506fc4b5..7c11c90f52 100644
--- a/meta/recipes-core/gettext/gettext-minimal-0.21/aclocal/nls.m4
+++ b/meta/recipes-core/gettext/gettext-minimal-0.21.1/aclocal/nls.m4
@@ -1,5 +1,5 @@
 # nls.m4 serial 6 (gettext-0.20.2)
-dnl Copyright (C) 1995-2003, 2005-2006, 2008-2014, 2016, 2019-2020 Free
+dnl Copyright (C) 1995-2003, 2005-2006, 2008-2014, 2016, 2019-2022 Free
 dnl Software Foundation, Inc.
 dnl This file is free software; the Free Software Foundation
 dnl gives unlimited permission to copy and/or distribute it,
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.21/aclocal/po.m4 b/meta/recipes-core/gettext/gettext-minimal-0.21.1/aclocal/po.m4
similarity index 98%
rename from meta/recipes-core/gettext/gettext-minimal-0.21/aclocal/po.m4
rename to meta/recipes-core/gettext/gettext-minimal-0.21.1/aclocal/po.m4
index 3778fd7aac..2f14f8e2b1 100644
--- a/meta/recipes-core/gettext/gettext-minimal-0.21/aclocal/po.m4
+++ b/meta/recipes-core/gettext/gettext-minimal-0.21.1/aclocal/po.m4
@@ -1,5 +1,5 @@
-# po.m4 serial 31 (gettext-0.20.2)
-dnl Copyright (C) 1995-2014, 2016, 2018-2020 Free Software Foundation, Inc.
+# po.m4 serial 32 (gettext-0.21.1)
+dnl Copyright (C) 1995-2014, 2016, 2018-2022 Free Software Foundation, Inc.
 dnl This file is free software; the Free Software Foundation
 dnl gives unlimited permission to copy and/or distribute it,
 dnl with or without modifications, as long as this notice is preserved.
@@ -179,7 +179,9 @@ changequote([,])dnl
                 #      presentlang can be used as a fallback for messages
                 #      which are not translated in the desiredlang catalog).
                 case "$desiredlang" in
-                  "$presentlang"*) useit=yes;;
+                  "$presentlang" | "$presentlang"_* | "$presentlang".* | "$presentlang"@*)
+                    useit=yes
+                    ;;
                 esac
               done
               if test $useit = yes; then
@@ -379,7 +381,9 @@ changequote([,])dnl
         #      presentlang can be used as a fallback for messages
         #      which are not translated in the desiredlang catalog).
         case "$desiredlang" in
-          "$presentlang"*) useit=yes;;
+          "$presentlang" | "$presentlang"_* | "$presentlang".* | "$presentlang"@*)
+            useit=yes
+            ;;
         esac
       done
       if test $useit = yes; then
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.21/aclocal/progtest.m4 b/meta/recipes-core/gettext/gettext-minimal-0.21.1/aclocal/progtest.m4
similarity index 90%
rename from meta/recipes-core/gettext/gettext-minimal-0.21/aclocal/progtest.m4
rename to meta/recipes-core/gettext/gettext-minimal-0.21.1/aclocal/progtest.m4
index f28010aed1..4a5b0b4c6d 100644
--- a/meta/recipes-core/gettext/gettext-minimal-0.21/aclocal/progtest.m4
+++ b/meta/recipes-core/gettext/gettext-minimal-0.21.1/aclocal/progtest.m4
@@ -1,5 +1,5 @@
-# progtest.m4 serial 8 (gettext-0.20.2)
-dnl Copyright (C) 1996-2003, 2005, 2008-2020 Free Software Foundation, Inc.
+# progtest.m4 serial 9 (gettext-0.21.1)
+dnl Copyright (C) 1996-2003, 2005, 2008-2022 Free Software Foundation, Inc.
 dnl This file is free software; the Free Software Foundation
 dnl gives unlimited permission to copy and/or distribute it,
 dnl with or without modifications, as long as this notice is preserved.
@@ -16,7 +16,7 @@ dnl They are *not* in the public domain.
 dnl Authors:
 dnl   Ulrich Drepper <drepper@cygnus.com>, 1996.
 
-AC_PREREQ([2.50])
+AC_PREREQ([2.53])
 
 # Search path for a program which passes the given test.
 
@@ -61,7 +61,7 @@ AC_CACHE_VAL([ac_cv_path_$1],
     ;;
   *)
     ac_save_IFS="$IFS"; IFS=$PATH_SEPARATOR
-    for ac_dir in ifelse([$5], , $PATH, [$5]); do
+    for ac_dir in m4_if([$5], , $PATH, [$5]); do
       IFS="$ac_save_IFS"
       test -z "$ac_dir" && ac_dir=.
       for ac_exec_ext in '' $ac_executable_extensions; do
@@ -77,12 +77,12 @@ AC_CACHE_VAL([ac_cv_path_$1],
     IFS="$ac_save_IFS"
 dnl If no 4th arg is given, leave the cache variable unset,
 dnl so AC_PATH_PROGS will keep looking.
-ifelse([$4], , , [  test -z "[$]ac_cv_path_$1" && ac_cv_path_$1="$4"
+m4_if([$4], , , [  test -z "[$]ac_cv_path_$1" && ac_cv_path_$1="$4"
 ])dnl
     ;;
 esac])dnl
 $1="$ac_cv_path_$1"
-if test ifelse([$4], , [-n "[$]$1"], ["[$]$1" != "$4"]); then
+if test m4_if([$4], , [-n "[$]$1"], ["[$]$1" != "$4"]); then
   AC_MSG_RESULT([$][$1])
 else
   AC_MSG_RESULT([no])
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.21/config.rpath b/meta/recipes-core/gettext/gettext-minimal-0.21.1/config.rpath
similarity index 99%
rename from meta/recipes-core/gettext/gettext-minimal-0.21/config.rpath
rename to meta/recipes-core/gettext/gettext-minimal-0.21.1/config.rpath
index 24be79cfb6..1e1ab67906 100755
--- a/meta/recipes-core/gettext/gettext-minimal-0.21/config.rpath
+++ b/meta/recipes-core/gettext/gettext-minimal-0.21.1/config.rpath
@@ -2,7 +2,7 @@
 # Output a system dependent set of variables, describing how to set the
 # run time search path of shared libraries in an executable.
 #
-#   Copyright 1996-2020 Free Software Foundation, Inc.
+#   Copyright 1996-2022 Free Software Foundation, Inc.
 #   Taken from GNU libtool, 2001
 #   Originally by Gordon Matzigkeit <gord@gnu.ai.mit.edu>, 1996
 #
@@ -371,7 +371,7 @@ else
       hardcode_direct=yes
       hardcode_minus_L=yes
       ;;
-    freebsd* | dragonfly*)
+    freebsd* | dragonfly* | midnightbsd*)
       hardcode_libdir_flag_spec='-R$libdir'
       hardcode_direct=yes
       ;;
@@ -547,7 +547,7 @@ case "$host_os" in
   freebsd[23].*)
     library_names_spec='$libname$shrext$versuffix'
     ;;
-  freebsd* | dragonfly*)
+  freebsd* | dragonfly* | midnightbsd*)
     library_names_spec='$libname$shrext'
     ;;
   gnu*)
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.21/remove-potcdate.sin b/meta/recipes-core/gettext/gettext-minimal-0.21.1/remove-potcdate.sin
similarity index 100%
rename from meta/recipes-core/gettext/gettext-minimal-0.21/remove-potcdate.sin
rename to meta/recipes-core/gettext/gettext-minimal-0.21.1/remove-potcdate.sin
diff --git a/meta/recipes-core/gettext/gettext-minimal-native_0.21.bb b/meta/recipes-core/gettext/gettext-minimal-native_0.21.1.bb
similarity index 100%
rename from meta/recipes-core/gettext/gettext-minimal-native_0.21.bb
rename to meta/recipes-core/gettext/gettext-minimal-native_0.21.1.bb
diff --git a/meta/recipes-core/gettext/gettext_0.21.bb b/meta/recipes-core/gettext/gettext_0.21.1.bb
similarity index 95%
rename from meta/recipes-core/gettext/gettext_0.21.bb
rename to meta/recipes-core/gettext/gettext_0.21.1.bb
index 364e6a52a1..ec80a89e49 100644
--- a/meta/recipes-core/gettext/gettext_0.21.bb
+++ b/meta/recipes-core/gettext/gettext_0.21.1.bb
@@ -12,9 +12,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c678957b0c8e964aa6c70fd77641a71e"
 LICENSE:append = " ${@bb.utils.contains('PACKAGECONFIG', 'libxml', '', '& MIT', d)}"
 LIC_FILES_CHKSUM:append = " ${@bb.utils.contains('PACKAGECONFIG', 'libxml', '', 'file://libtextstyle/lib/libxml/COPYING;md5=2044417e2e5006b65a8b9067b683fcf1', d)}"
 # without croco in PACKAGECONFIG vendor copy of the lib will be used
-LIC_FILES_CHKSUM:append = " ${@bb.utils.contains('PACKAGECONFIG', 'croco', '', 'file://libtextstyle/lib/libcroco/libcroco.h;md5=915a46e7307c2f7f8d2b9c503fc434ed;beginline=10;endline=28', d)}"
+LIC_FILES_CHKSUM:append = " ${@bb.utils.contains('PACKAGECONFIG', 'croco', '', 'file://libtextstyle/lib/libcroco/libcroco.h;md5=424013a9ed5401aa58cf83f3188c6865;beginline=10;endline=28', d)}"
 # without glib in PACKAGECONFIG vendor copy of the lib will be used
-LIC_FILES_CHKSUM:append = " ${@bb.utils.contains('PACKAGECONFIG', 'glib', '', 'file://libtextstyle/lib/glib/ghash.c;md5=af89a160226edf0b276b6183888037d0;beginline=10;endline=27', d)}"
+LIC_FILES_CHKSUM:append = " ${@bb.utils.contains('PACKAGECONFIG', 'glib', '', 'file://libtextstyle/lib/glib/ghash.c;md5=e3159f5ac38dfe77af5cc0ee104dab2d;beginline=10;endline=27', d)}"
 
 
 DEPENDS = "gettext-native virtual/libiconv"
@@ -29,11 +29,8 @@ SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \
            file://serial-tests-config.patch \
            file://0001-tests-autopoint-3-unset-MAKEFLAGS.patch \
            file://0001-init-env.in-do-not-add-C-CXX-parameters.patch \
-           file://mingw.patch \
-           file://0001-msgmerge-29-Add-executable-file-mode-bits.patch \
-           file://0001-libtextstyle-fix-builds-with-automake-1.16.4-and-new.patch \
            "
-SRC_URI[sha256sum] = "c77d0da3102aec9c07f43671e60611ebff89a996ef159497ce8e59d075786b12"
+SRC_URI[sha256sum] = "e8c3650e1d8cee875c4f355642382c1df83058bd5a11ee8555c0cf276d646d45"
 
 inherit autotools texinfo pkgconfig ptest
 
-- 
2.30.2


