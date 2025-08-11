Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14EACC87FDB
	for <webhook@archiver.kernel.org>; Mon, 11 Aug 2025 11:50:06 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.45905.1754912995756709089
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Aug 2025 04:49:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=br1jLbu8;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-615d1865b2dso6263373a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Aug 2025 04:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754912994; x=1755517794; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=BoNB/FGVEikx3fGnJeY9hnoiiQxjNthEwn7i8zHWNOg=;
        b=br1jLbu8KOcQkMHtO3RmQctKjg8v/Zfnm76IhKx6Z/LDYE4jcPhCY6h732V/Rsx7uD
         jtF/TVeCrdkhpyiGAi2L7yFIlDKYcX/lc6OkEyBDQkVIpyPOECw7l6fhAoHHvsBqoJZB
         dZbUFr9bxd3GJMJuB2XRzRdoAM9ZboGUVI+0/sE6FizOECHg0vZFuWqpyz46FnjmBaul
         X3tvmzbot1qxmXiarLvSsbPe80hZegex5aVJl/jDze5Ux6B0SFdfzib1VOYcYILS27T+
         gsioqIxoqnA4omjWpU79KqYuNHQ1vYGyvWtyf1CJKBwnIuEifIW0q8+kAoWGU58pukZN
         0auQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754912994; x=1755517794;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BoNB/FGVEikx3fGnJeY9hnoiiQxjNthEwn7i8zHWNOg=;
        b=Ugxv5yuKb1hnXOUMfPMg3aZWDY9e3HKgSX/72h8JhXkYmvE9LuV2Wvpc8VOW1iMz4s
         aw4z8SNM1pneBcs32treHNF/fpetgOA88cwAc2TnWx84wBPl5C1qxQztEOQQleRo1Je1
         LDzaJ8WrOMI1bMSAWN5W676MpiAtkT9wl2ISBbGTy6NueLQW7QPWbK8XJ0n8JdYZ6epJ
         vEgoG5B17jwyTeXwUre4iBcZN3vp7hmKj4yhfsTx/ndwPDOlaLQOFEUnP4amxkEEVvKS
         WMt9+JvIJoMhqXSnokC0aEtTrhtkbMbq+Gzu2BSdY4eSMQH56vqVDKFCTaJuPh+MDX2a
         MOIg==
X-Gm-Message-State: AOJu0YyKPaTTIaA7CSip8re4wmnfv6ifY9u14sI0+6hFyBmU4hyawPnw
	nOTMKuTm1i2MiktXQ+C9WiukU/kswZFfITOaZUkxaJgcScVM5Xb7Nsn0QYhT0Q==
X-Gm-Gg: ASbGnctTF198Uan/ZeabVRPkXoYOgGM9Ey0zA1GTMwuCO5qwSVNyPSE4o9OlBgL33gH
	wteNCs9hFoI6LR+5+AoPcPjEQE01321bu5pRf7NG+OGK5M60FaFJErUxHRx9Gmb2y9Qmx5bKBzr
	WIUvWFhulQ/YFsCLoVysVcJ0LsAXUM7W6rAq//oCIQSBFCkRTdm1qhxZQB7AzQXl7g3tj1YKZhC
	gOPVnSr6KWfa76hdO67/KFJAPpxwCPtP4m4kuOiAyAs6KyvYW6CH6PPrgMnJ1SF0xQKJqn8sUJ0
	K4B4PUIy+GdPwxSYAZ1fHvGvBqEQScl2ank/DgaVbspJFsV9FGMrjhXz34jmK/oGSUaL0JiMAMr
	TjoxC9deu8oUz6w26xRY=
X-Google-Smtp-Source: AGHT+IH8iah+yciYvRGBn2aNNv/XDMXsOx9HVuDghaxl2zJY2b1j/hWwE51GCh+sFn4FGSihtDIeZA==
X-Received: by 2002:a17:906:d54b:b0:af3:9676:e9ec with SMTP id a640c23a62f3a-af9c64a9220mr1084688166b.39.1754912993539;
        Mon, 11 Aug 2025 04:49:53 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21e44csm1990475266b.113.2025.08.11.04.49.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 04:49:53 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] gperf: upgrade 3.1 -> 3.3
Date: Mon, 11 Aug 2025 13:49:52 +0200
Message-ID: <20250811114952.19565-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Aug 2025 11:50:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221734

Both patches were dropped, because they are included in this release.

License-Update: copyright date Update

Changelog:
3.3:
* Speedup: gperf is now between 2x and 2.5x faster.

3.2:
* The generated code avoids several types of warnings:
  - "implicit fallthrough" warnings in 'switch' statements.
  - "unused parameter" warnings regarding 'str' or 'len'.
  - "missing initializer for field ..." warnings.
  - "zero as null pointer constant" warnings.

* The input file may now use Windows line terminators (CR/LF) instead of
  Unix line terminators (LF).
  Note: This is an incompatible change. If you want to use a keyword that
  ends in a CR byte, such as xyz<CR>, write it as "xyz\r".

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../0001-Make-the-code-C-17-compliant.patch   |  29 ---
 ...c6e57a308a05889c80c048dbc58bdc378dcb.patch | 181 ------------------
 .../gperf/{gperf_3.1.bb => gperf_3.3.bb}      |   9 +-
 3 files changed, 3 insertions(+), 216 deletions(-)
 delete mode 100644 meta/recipes-extended/gperf/gperf/0001-Make-the-code-C-17-compliant.patch
 delete mode 100644 meta/recipes-extended/gperf/gperf/1862c6e57a308a05889c80c048dbc58bdc378dcb.patch
 rename meta/recipes-extended/gperf/{gperf_3.1.bb => gperf_3.3.bb} (68%)

diff --git a/meta/recipes-extended/gperf/gperf/0001-Make-the-code-C-17-compliant.patch b/meta/recipes-extended/gperf/gperf/0001-Make-the-code-C-17-compliant.patch
deleted file mode 100644
index 96e70cdb36..0000000000
--- a/meta/recipes-extended/gperf/gperf/0001-Make-the-code-C-17-compliant.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 6194f0027045433598a61965758b4531a3d06d1f Mon Sep 17 00:00:00 2001
-From: Bruno Haible <bruno@clisp.org>
-Date: Sun, 30 Aug 2020 12:36:15 +0200
-Subject: [PATCH] Make the code C++17 compliant.
-
-* lib/getline.cc (getstr): Don't use the 'register' keyword.
-
-Upstream-Status: Backport [https://git.savannah.gnu.org/gitweb/?p=gperf.git;a=commit;h=a63b830554920476881837eeacd4a6b507632b19]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- lib/getline.cc | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/getline.cc b/lib/getline.cc
-index c57c633..0984a7c 100644
---- a/lib/getline.cc
-+++ b/lib/getline.cc
-@@ -55,7 +55,7 @@ getstr (char **lineptr, size_t *n, FILE *stream, char terminator, size_t offset)
- 
-   for (;;)
-     {
--      register int c = getc (stream);
-+      int c = getc (stream);
- 
-       /* We always want at least one char left in the buffer, since we
-          always (unless we get an error while reading the first char)
--- 
-2.39.0
-
diff --git a/meta/recipes-extended/gperf/gperf/1862c6e57a308a05889c80c048dbc58bdc378dcb.patch b/meta/recipes-extended/gperf/gperf/1862c6e57a308a05889c80c048dbc58bdc378dcb.patch
deleted file mode 100644
index 98959db0a8..0000000000
--- a/meta/recipes-extended/gperf/gperf/1862c6e57a308a05889c80c048dbc58bdc378dcb.patch
+++ /dev/null
@@ -1,181 +0,0 @@
-From 1862c6e57a308a05889c80c048dbc58bdc378dcb Mon Sep 17 00:00:00 2001
-From: Bruno Haible <bruno@clisp.org>
-Date: Tue, 5 Jul 2022 07:51:46 +0200
-Subject: [PATCH] Add support for reproducible builds.
-
-Suggested by Richard Purdie <richard.purdie@linuxfoundation.org> in
-<https://lists.gnu.org/archive/html/bug-gperf/2022-07/msg00000.html>.
-
-* autogen.sh: Import also lib/filename.h.
-* Makefile.in (IMPORTED_FILES): Add lib/filename.h.
-* src/options.cc: Include filename.h.
-(Options::print_options): Print only the base name of the program name.
-* tests/*.exp: Update.
-
-Upstream-Status: Backport
-
-Index: gperf-3.1/ChangeLog
-===================================================================
---- gperf-3.1.orig/ChangeLog
-+++ gperf-3.1/ChangeLog
-@@ -1,3 +1,14 @@
-+2022-07-05  Bruno Haible  <bruno@clisp.org>
-+
-+	Add support for reproducible builds.
-+	Suggested by Richard Purdie <richard.purdie@linuxfoundation.org> in
-+	<https://lists.gnu.org/archive/html/bug-gperf/2022-07/msg00000.html>.
-+	* autogen.sh: Import also lib/filename.h.
-+	* Makefile.in (IMPORTED_FILES): Add lib/filename.h.
-+	* src/options.cc: Include filename.h.
-+	(Options::print_options): Print only the base name of the program name.
-+	* tests/*.exp: Update.
-+
- 2017-01-02  Marcel Schaible <marcel.schaible@studium.fernuni-hagen.de>
- 	
- 	* gperf-3.1 released.
-Index: gperf-3.1/src/options.cc
-===================================================================
---- gperf-3.1.orig/src/options.cc
-+++ gperf-3.1/src/options.cc
-@@ -26,6 +26,7 @@
- #include <string.h> /* declares strcmp() */
- #include <ctype.h>  /* declares isdigit() */
- #include <limits.h> /* defines CHAR_MAX */
-+#include "filename.h"
- #include "getopt.h"
- #include "version.h"
- 
-@@ -280,6 +281,16 @@ Options::print_options () const
-     {
-       const char *arg = _argument_vector[i];
- 
-+      if (i == 0)
-+        {
-+          /* _argument_vector[0] is the program name.  Print only its base name.
-+             This is useful for reproducible builds.  */
-+          const char *p = arg + strlen (arg);
-+          while (p > arg && ! ISSLASH (p[-1]))
-+            p--;
-+          arg = p;
-+        }
-+
-       /* Escape arg if it contains shell metacharacters.  */
-       if (*arg == '-')
-         {
-Index: gperf-3.1/lib/filename.h
-===================================================================
---- /dev/null
-+++ gperf-3.1/lib/filename.h
-@@ -0,0 +1,112 @@
-+/* Basic filename support macros.
-+   Copyright (C) 2001-2022 Free Software Foundation, Inc.
-+   This file is part of the GNU C Library.
-+
-+   The GNU C Library is free software; you can redistribute it and/or
-+   modify it under the terms of the GNU Lesser General Public
-+   License as published by the Free Software Foundation; either
-+   version 2.1 of the License, or (at your option) any later version.
-+
-+   The GNU C Library is distributed in the hope that it will be useful,
-+   but WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   Lesser General Public License for more details.
-+
-+   You should have received a copy of the GNU Lesser General Public
-+   License along with the GNU C Library; if not, see
-+   <https://www.gnu.org/licenses/>.  */
-+
-+/* From Paul Eggert and Jim Meyering.  */
-+
-+#ifndef _FILENAME_H
-+#define _FILENAME_H
-+
-+#include <string.h>
-+
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
-+
-+
-+/* Filename support.
-+   ISSLASH(C)                  tests whether C is a directory separator
-+                               character.
-+   HAS_DEVICE(Filename)        tests whether Filename contains a device
-+                               specification.
-+   FILE_SYSTEM_PREFIX_LEN(Filename)  length of the device specification
-+                                     at the beginning of Filename,
-+                                     index of the part consisting of
-+                                     alternating components and slashes.
-+   FILE_SYSTEM_DRIVE_PREFIX_CAN_BE_RELATIVE
-+                               1 when a non-empty device specification
-+                               can be followed by an empty or relative
-+                               part,
-+                               0 when a non-empty device specification
-+                               must be followed by a slash,
-+                               0 when device specification don't exist.
-+   IS_ABSOLUTE_FILE_NAME(Filename)
-+                               tests whether Filename is independent of
-+                               any notion of "current directory".
-+   IS_RELATIVE_FILE_NAME(Filename)
-+                               tests whether Filename may be concatenated
-+                               to a directory filename.
-+   Note: On native Windows, OS/2, DOS, "c:" is neither an absolute nor a
-+   relative file name!
-+   IS_FILE_NAME_WITH_DIR(Filename)  tests whether Filename contains a device
-+                                    or directory specification.
-+ */
-+#if defined _WIN32 || defined __CYGWIN__ \
-+    || defined __EMX__ || defined __MSDOS__ || defined __DJGPP__
-+  /* Native Windows, Cygwin, OS/2, DOS */
-+# define ISSLASH(C) ((C) == '/' || (C) == '\\')
-+  /* Internal macro: Tests whether a character is a drive letter.  */
-+# define _IS_DRIVE_LETTER(C) \
-+    (((C) >= 'A' && (C) <= 'Z') || ((C) >= 'a' && (C) <= 'z'))
-+  /* Help the compiler optimizing it.  This assumes ASCII.  */
-+# undef _IS_DRIVE_LETTER
-+# define _IS_DRIVE_LETTER(C) \
-+    (((unsigned int) (C) | ('a' - 'A')) - 'a' <= 'z' - 'a')
-+# define HAS_DEVICE(Filename) \
-+    (_IS_DRIVE_LETTER ((Filename)[0]) && (Filename)[1] == ':')
-+# define FILE_SYSTEM_PREFIX_LEN(Filename) (HAS_DEVICE (Filename) ? 2 : 0)
-+# ifdef __CYGWIN__
-+#  define FILE_SYSTEM_DRIVE_PREFIX_CAN_BE_RELATIVE 0
-+# else
-+   /* On native Windows, OS/2, DOS, the system has the notion of a
-+      "current directory" on each drive.  */
-+#  define FILE_SYSTEM_DRIVE_PREFIX_CAN_BE_RELATIVE 1
-+# endif
-+# if FILE_SYSTEM_DRIVE_PREFIX_CAN_BE_RELATIVE
-+#  define IS_ABSOLUTE_FILE_NAME(Filename) \
-+     ISSLASH ((Filename)[FILE_SYSTEM_PREFIX_LEN (Filename)])
-+# else
-+#  define IS_ABSOLUTE_FILE_NAME(Filename) \
-+     (ISSLASH ((Filename)[0]) || HAS_DEVICE (Filename))
-+# endif
-+# define IS_RELATIVE_FILE_NAME(Filename) \
-+    (! (ISSLASH ((Filename)[0]) || HAS_DEVICE (Filename)))
-+# define IS_FILE_NAME_WITH_DIR(Filename) \
-+    (strchr ((Filename), '/') != NULL || strchr ((Filename), '\\') != NULL \
-+     || HAS_DEVICE (Filename))
-+#else
-+  /* Unix */
-+# define ISSLASH(C) ((C) == '/')
-+# define HAS_DEVICE(Filename) ((void) (Filename), 0)
-+# define FILE_SYSTEM_PREFIX_LEN(Filename) ((void) (Filename), 0)
-+# define FILE_SYSTEM_DRIVE_PREFIX_CAN_BE_RELATIVE 0
-+# define IS_ABSOLUTE_FILE_NAME(Filename) ISSLASH ((Filename)[0])
-+# define IS_RELATIVE_FILE_NAME(Filename) (! ISSLASH ((Filename)[0]))
-+# define IS_FILE_NAME_WITH_DIR(Filename) (strchr ((Filename), '/') != NULL)
-+#endif
-+
-+/* Deprecated macros.  For backward compatibility with old users of the
-+   'filename' module.  */
-+#define IS_ABSOLUTE_PATH IS_ABSOLUTE_FILE_NAME
-+#define IS_PATH_WITH_DIR IS_FILE_NAME_WITH_DIR
-+
-+
-+#ifdef __cplusplus
-+}
-+#endif
-+
-+#endif /* _FILENAME_H */
diff --git a/meta/recipes-extended/gperf/gperf_3.1.bb b/meta/recipes-extended/gperf/gperf_3.3.bb
similarity index 68%
rename from meta/recipes-extended/gperf/gperf_3.1.bb
rename to meta/recipes-extended/gperf/gperf_3.3.bb
index 7a79c07042..7af2130114 100644
--- a/meta/recipes-extended/gperf/gperf_3.1.bb
+++ b/meta/recipes-extended/gperf/gperf_3.3.bb
@@ -3,13 +3,10 @@ HOMEPAGE = "http://www.gnu.org/software/gperf"
 SUMMARY  = "Generate a perfect hash function from a set of keywords"
 LICENSE  = "GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://src/main.cc;beginline=8;endline=19;md5=dec8f611845d047387ed56b5b85fa99b"
+                    file://src/main.cc;beginline=8;endline=19;md5=ca1c43fa02be95aa2e10d567684e6fd5"
 
-SRC_URI  = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz \
-            file://0001-Make-the-code-C-17-compliant.patch"
-SRC_URI[sha256sum] = "588546b945bba4b70b6a3a616e80b4ab466e3f33024a352fc2198112cdbb3ae2"
-
-SRC_URI += "file://1862c6e57a308a05889c80c048dbc58bdc378dcb.patch"
+SRC_URI  = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz"
+SRC_URI[sha256sum] = "fd87e0aba7e43ae054837afd6cd4db03a3f2693deb3619085e6ed9d8d9604ad8"
 
 inherit autotools
 

