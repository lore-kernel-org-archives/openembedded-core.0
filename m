Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C31CC43334
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 00:32:18 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web09.21808.1658104334548770128
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jul 2022 17:32:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=hc2EjFBU;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id
 89-20020a17090a09e200b001ef7638e536so16671690pjo.3
        for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jul 2022 17:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=lKNtv4x9LFVyAS2xgEWNUvC8xU6cYTVo+snTJUyM3gI=;
        b=hc2EjFBUogV6hkPdvZov48UJuwQr8XlRRdCijARd4rf5cP5gXTQfjxh848qIknHXKi
         iXrdRxY4ISQBalilvq9gFwe02e2K+drQ/kj9IeUUKpDyRDRceNBFfw5DXpbh8HZwHubj
         jZowmEOLuW0PYvHPuScHSPUP+2IArPGjTlpxqSLUNaNis8UWnsl0Jqj/FC5pXhtGWGDV
         VrC4bDQqtq04pSs/oGq8y6nE+5W5JCBucDSLArhSEGU3jgNqRniv1eXbRa+z9S8LFz2v
         SMewQq6nnbAT5bec+OeYttzPGuYV260eedDU5/Iw6n/OGVHgV+HuWLqyOHvVgAsoIH5I
         vw2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lKNtv4x9LFVyAS2xgEWNUvC8xU6cYTVo+snTJUyM3gI=;
        b=g7JhWcZSuJCoAmRne79gseVFmgnQ+y88MnQZ6ByCOWd0ggg3zwHZwRv+8qx5jyswuN
         KWQcT9WxBEk5Gwehr6E0kxtCkBXdA1b5ODmg3PUwZUW1JBI7Ci0vC3JE+MLyZSaPlvaa
         w0a//eeJBIKw1LbvRgT1WyFgM+U2CvWhtGWgHYj2sgAhQdNjplQl2v/SGQQDngjcVN3J
         DoVH2PKlwV+IEHCdw9jzNA2kr5TmjEX4/dsrT62e8b3jDoZMN/PRvqlKqyrRhe1ANq20
         4puF0QWpSxlyF7XHkOudW+T6xugIFLTGEsjUGQlg90sfRNZ9Bar0lBk47B20cPY7svTN
         y6LQ==
X-Gm-Message-State: AJIora/YsTp+OKppsMdxTIv1VklW/TcmKEK5GuSFG4ESOq+xPMdpDlaf
	oNinj0MR7rSjT+JvSxPxq/kOOP3UdoUw7mqN
X-Google-Smtp-Source: 
 AGRyM1sGRx4rrKI39r2PG1ongZzw0Syq8BUT0oYrk1YyDkWeSA2lPlMqXSoCZ18puB0PjbZ6l+Qwiw==
X-Received: by 2002:a17:90b:224b:b0:1ef:e06a:32f1 with SMTP id
 hk11-20020a17090b224b00b001efe06a32f1mr36365795pjb.197.1658104333349;
        Sun, 17 Jul 2022 17:32:13 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 s30-20020a17090a2f2100b001ef831a2015sm9958183pjd.22.2022.07.17.17.32.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jul 2022 17:32:11 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 22/23] gperf: Switch to upstream patch
Date: Sun, 17 Jul 2022 14:30:23 -1000
Message-Id: 
 <873ac23a4958b4abbc124baa4ad7c973ee9dd5a8.1658093505.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1658093505.git.steve@sakoman.com>
References: <cover.1658093505.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Jul 2022 00:32:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168187

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Upstream merged a patch to handle the reproducibility issue, switch to
their patch which is functionally equivalent.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit db28cd0e1540e44db963108430205c8c0c817774)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...c6e57a308a05889c80c048dbc58bdc378dcb.patch | 181 ++++++++++++++++++
 .../gperf/gperf/reproducibility.patch         |  26 ---
 meta/recipes-extended/gperf/gperf_3.1.bb      |   2 +-
 3 files changed, 182 insertions(+), 27 deletions(-)
 create mode 100644 meta/recipes-extended/gperf/gperf/1862c6e57a308a05889c80c048dbc58bdc378dcb.patch
 delete mode 100644 meta/recipes-extended/gperf/gperf/reproducibility.patch

diff --git a/meta/recipes-extended/gperf/gperf/1862c6e57a308a05889c80c048dbc58bdc378dcb.patch b/meta/recipes-extended/gperf/gperf/1862c6e57a308a05889c80c048dbc58bdc378dcb.patch
new file mode 100644
index 0000000000..98959db0a8
--- /dev/null
+++ b/meta/recipes-extended/gperf/gperf/1862c6e57a308a05889c80c048dbc58bdc378dcb.patch
@@ -0,0 +1,181 @@
+From 1862c6e57a308a05889c80c048dbc58bdc378dcb Mon Sep 17 00:00:00 2001
+From: Bruno Haible <bruno@clisp.org>
+Date: Tue, 5 Jul 2022 07:51:46 +0200
+Subject: [PATCH] Add support for reproducible builds.
+
+Suggested by Richard Purdie <richard.purdie@linuxfoundation.org> in
+<https://lists.gnu.org/archive/html/bug-gperf/2022-07/msg00000.html>.
+
+* autogen.sh: Import also lib/filename.h.
+* Makefile.in (IMPORTED_FILES): Add lib/filename.h.
+* src/options.cc: Include filename.h.
+(Options::print_options): Print only the base name of the program name.
+* tests/*.exp: Update.
+
+Upstream-Status: Backport
+
+Index: gperf-3.1/ChangeLog
+===================================================================
+--- gperf-3.1.orig/ChangeLog
++++ gperf-3.1/ChangeLog
+@@ -1,3 +1,14 @@
++2022-07-05  Bruno Haible  <bruno@clisp.org>
++
++	Add support for reproducible builds.
++	Suggested by Richard Purdie <richard.purdie@linuxfoundation.org> in
++	<https://lists.gnu.org/archive/html/bug-gperf/2022-07/msg00000.html>.
++	* autogen.sh: Import also lib/filename.h.
++	* Makefile.in (IMPORTED_FILES): Add lib/filename.h.
++	* src/options.cc: Include filename.h.
++	(Options::print_options): Print only the base name of the program name.
++	* tests/*.exp: Update.
++
+ 2017-01-02  Marcel Schaible <marcel.schaible@studium.fernuni-hagen.de>
+ 	
+ 	* gperf-3.1 released.
+Index: gperf-3.1/src/options.cc
+===================================================================
+--- gperf-3.1.orig/src/options.cc
++++ gperf-3.1/src/options.cc
+@@ -26,6 +26,7 @@
+ #include <string.h> /* declares strcmp() */
+ #include <ctype.h>  /* declares isdigit() */
+ #include <limits.h> /* defines CHAR_MAX */
++#include "filename.h"
+ #include "getopt.h"
+ #include "version.h"
+ 
+@@ -280,6 +281,16 @@ Options::print_options () const
+     {
+       const char *arg = _argument_vector[i];
+ 
++      if (i == 0)
++        {
++          /* _argument_vector[0] is the program name.  Print only its base name.
++             This is useful for reproducible builds.  */
++          const char *p = arg + strlen (arg);
++          while (p > arg && ! ISSLASH (p[-1]))
++            p--;
++          arg = p;
++        }
++
+       /* Escape arg if it contains shell metacharacters.  */
+       if (*arg == '-')
+         {
+Index: gperf-3.1/lib/filename.h
+===================================================================
+--- /dev/null
++++ gperf-3.1/lib/filename.h
+@@ -0,0 +1,112 @@
++/* Basic filename support macros.
++   Copyright (C) 2001-2022 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, see
++   <https://www.gnu.org/licenses/>.  */
++
++/* From Paul Eggert and Jim Meyering.  */
++
++#ifndef _FILENAME_H
++#define _FILENAME_H
++
++#include <string.h>
++
++#ifdef __cplusplus
++extern "C" {
++#endif
++
++
++/* Filename support.
++   ISSLASH(C)                  tests whether C is a directory separator
++                               character.
++   HAS_DEVICE(Filename)        tests whether Filename contains a device
++                               specification.
++   FILE_SYSTEM_PREFIX_LEN(Filename)  length of the device specification
++                                     at the beginning of Filename,
++                                     index of the part consisting of
++                                     alternating components and slashes.
++   FILE_SYSTEM_DRIVE_PREFIX_CAN_BE_RELATIVE
++                               1 when a non-empty device specification
++                               can be followed by an empty or relative
++                               part,
++                               0 when a non-empty device specification
++                               must be followed by a slash,
++                               0 when device specification don't exist.
++   IS_ABSOLUTE_FILE_NAME(Filename)
++                               tests whether Filename is independent of
++                               any notion of "current directory".
++   IS_RELATIVE_FILE_NAME(Filename)
++                               tests whether Filename may be concatenated
++                               to a directory filename.
++   Note: On native Windows, OS/2, DOS, "c:" is neither an absolute nor a
++   relative file name!
++   IS_FILE_NAME_WITH_DIR(Filename)  tests whether Filename contains a device
++                                    or directory specification.
++ */
++#if defined _WIN32 || defined __CYGWIN__ \
++    || defined __EMX__ || defined __MSDOS__ || defined __DJGPP__
++  /* Native Windows, Cygwin, OS/2, DOS */
++# define ISSLASH(C) ((C) == '/' || (C) == '\\')
++  /* Internal macro: Tests whether a character is a drive letter.  */
++# define _IS_DRIVE_LETTER(C) \
++    (((C) >= 'A' && (C) <= 'Z') || ((C) >= 'a' && (C) <= 'z'))
++  /* Help the compiler optimizing it.  This assumes ASCII.  */
++# undef _IS_DRIVE_LETTER
++# define _IS_DRIVE_LETTER(C) \
++    (((unsigned int) (C) | ('a' - 'A')) - 'a' <= 'z' - 'a')
++# define HAS_DEVICE(Filename) \
++    (_IS_DRIVE_LETTER ((Filename)[0]) && (Filename)[1] == ':')
++# define FILE_SYSTEM_PREFIX_LEN(Filename) (HAS_DEVICE (Filename) ? 2 : 0)
++# ifdef __CYGWIN__
++#  define FILE_SYSTEM_DRIVE_PREFIX_CAN_BE_RELATIVE 0
++# else
++   /* On native Windows, OS/2, DOS, the system has the notion of a
++      "current directory" on each drive.  */
++#  define FILE_SYSTEM_DRIVE_PREFIX_CAN_BE_RELATIVE 1
++# endif
++# if FILE_SYSTEM_DRIVE_PREFIX_CAN_BE_RELATIVE
++#  define IS_ABSOLUTE_FILE_NAME(Filename) \
++     ISSLASH ((Filename)[FILE_SYSTEM_PREFIX_LEN (Filename)])
++# else
++#  define IS_ABSOLUTE_FILE_NAME(Filename) \
++     (ISSLASH ((Filename)[0]) || HAS_DEVICE (Filename))
++# endif
++# define IS_RELATIVE_FILE_NAME(Filename) \
++    (! (ISSLASH ((Filename)[0]) || HAS_DEVICE (Filename)))
++# define IS_FILE_NAME_WITH_DIR(Filename) \
++    (strchr ((Filename), '/') != NULL || strchr ((Filename), '\\') != NULL \
++     || HAS_DEVICE (Filename))
++#else
++  /* Unix */
++# define ISSLASH(C) ((C) == '/')
++# define HAS_DEVICE(Filename) ((void) (Filename), 0)
++# define FILE_SYSTEM_PREFIX_LEN(Filename) ((void) (Filename), 0)
++# define FILE_SYSTEM_DRIVE_PREFIX_CAN_BE_RELATIVE 0
++# define IS_ABSOLUTE_FILE_NAME(Filename) ISSLASH ((Filename)[0])
++# define IS_RELATIVE_FILE_NAME(Filename) (! ISSLASH ((Filename)[0]))
++# define IS_FILE_NAME_WITH_DIR(Filename) (strchr ((Filename), '/') != NULL)
++#endif
++
++/* Deprecated macros.  For backward compatibility with old users of the
++   'filename' module.  */
++#define IS_ABSOLUTE_PATH IS_ABSOLUTE_FILE_NAME
++#define IS_PATH_WITH_DIR IS_FILE_NAME_WITH_DIR
++
++
++#ifdef __cplusplus
++}
++#endif
++
++#endif /* _FILENAME_H */
diff --git a/meta/recipes-extended/gperf/gperf/reproducibility.patch b/meta/recipes-extended/gperf/gperf/reproducibility.patch
deleted file mode 100644
index 9f80828dbd..0000000000
--- a/meta/recipes-extended/gperf/gperf/reproducibility.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-By default gperf puts a header into generated files with the full path to
-the tool along with the commandline used. This patch removes the path to
-the binary, allowing reproducible source files (which can be included in
-debug source packages).
-
-Upstream-Status: Pending
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-Index: gperf-3.1/src/options.cc
-===================================================================
---- gperf-3.1.orig/src/options.cc
-+++ gperf-3.1/src/options.cc
-@@ -280,6 +280,13 @@ Options::print_options () const
-     {
-       const char *arg = _argument_vector[i];
- 
-+      if (i == 0) {
-+          const char *shortarg = strrchr(arg, '/');
-+          if (shortarg) {
-+              arg = shortarg + 1;
-+          }
-+      }
-+
-       /* Escape arg if it contains shell metacharacters.  */
-       if (*arg == '-')
-         {
diff --git a/meta/recipes-extended/gperf/gperf_3.1.bb b/meta/recipes-extended/gperf/gperf_3.1.bb
index 3564ac0805..c9f09c7931 100644
--- a/meta/recipes-extended/gperf/gperf_3.1.bb
+++ b/meta/recipes-extended/gperf/gperf_3.1.bb
@@ -9,7 +9,7 @@ SRC_URI  = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz"
 SRC_URI[md5sum] = "9e251c0a618ad0824b51117d5d9db87e"
 SRC_URI[sha256sum] = "588546b945bba4b70b6a3a616e80b4ab466e3f33024a352fc2198112cdbb3ae2"
 
-SRC_URI:append = " file://reproducibility.patch"
+SRC_URI += "file://1862c6e57a308a05889c80c048dbc58bdc378dcb.patch"
 
 inherit autotools
 
-- 
2.25.1


