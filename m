Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web11.181519.1598214098746808093
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2020 13:21:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OTSWT5nf;
 spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id b17so985033ejq.8
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Aug 2020 13:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PzGA654k+waklpz3d2Pk8ZpXTlwPiK26T2NGzpvlqSg=;
        b=OTSWT5nfExnk9IEHsHuNR7gOSVCn2FXUtRtn3+7oU0FkeMEnYDjyRqGeIQlHFrAS8u
         MjT3MKFiJwhWWVuqgYYGUqRs2MZfl7zm2oYHQypSjD8vk/qp0OrkMhx+3VPzmggladmZ
         K4fXhKzmqSGevNNLdTbr/oRw2gWUOujO9TfUyNKTExm3559nObhavvNKBO85WGNKwsbZ
         Ayx2D7GzbKPTGuJpnJrInoKMZc7BkAEskd4mK3yQYF6w5fzbeHnoOlv7LezkOVApMB/B
         dzxRfR94onUZbaVbcgOOC90vwn1zkDa+m58zG/aWFmVcshw7/BooAaJ3U/U7XEoD2f9g
         gBwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PzGA654k+waklpz3d2Pk8ZpXTlwPiK26T2NGzpvlqSg=;
        b=UwOlmdLbiq9HqaGwWt9AFk4V+3kw1jjn4NAPpod/DbQ0gBpc5FeZ06/grqDkHi5VsH
         CoW0+Q9+ovYb+i8ahLjlEkQ9Rl5F4rV8fdJRCHj0OQE8AvT2vK3qzmiEW4OMNsJMe+ph
         0G9iDgeahG+Ygcr0uOg3W/Ta/7hsRo5iExs6XRHDmzKX8kL5E8+awl/V6ITEm0jHgeP/
         Bf/80UCYEXcxuGj8h1qcbo15sDDT0tjyUy0rfsdzY+iVEbVCBsSabg+0Q/mEM3thoL09
         nHp44pEMA0gnALYokms9gDJ2sRgUWQD/I4if9N1aBR7yrbH2Q/VBda/mS8GVZfuKlR43
         QhEQ==
X-Gm-Message-State: AOAM532lsRLpevlMLTHFz1uhqbgUA8RTkBf7Vyj6LBMflU7K6JcD/fBR
	hvQ8KzSEDU+2yPYWOwOXwlOu429ng58=
X-Google-Smtp-Source: ABdhPJxr4oOLHf8oIi0Gz0VQojigMmCRdpFHrZ6ZnlEhgrRuHuW5ToIxKOHuikBWn+hV5MVpyPjDYw==
X-Received: by 2002:a17:906:15cc:: with SMTP id l12mr2784588ejd.7.1598214096657;
        Sun, 23 Aug 2020 13:21:36 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box (cable-95-168-130-13.cust.telecolumbus.net. [95.168.130.13])
        by smtp.gmail.com with ESMTPSA id sd17sm7342480ejb.93.2020.08.23.13.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2020 13:21:36 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 34/37] gettext: update 0.20.2 -> 0.21
Date: Sun, 23 Aug 2020 22:20:28 +0200
Message-Id: <20200823202031.24686-34-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200823202031.24686-1-alex.kanavin@gmail.com>
References: <20200823202031.24686-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop add-with-bisonlocaledir.patch as upstream (gnulib, not bison)
now determines the directory from datadir.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../add-with-bisonlocaledir.patch             | 58 -------------------
 ...t-env.in-do-not-add-C-CXX-parameters.patch |  0
 ...01-tests-autopoint-3-unset-MAKEFLAGS.patch |  0
 .../gettext/gettext-0.21/mingw.patch          | 28 +++++++++
 .../parallel.patch                            |  0
 .../run-ptest                                 |  0
 .../serial-tests-config.patch                 |  0
 .../use-pkgconfig.patch                       | 16 ++---
 .../COPYING                                   |  0
 .../Makefile.in.in                            |  9 ++-
 .../aclocal/gettext.m4                        |  0
 .../aclocal/host-cpu-c-abi.m4                 |  0
 .../aclocal/iconv.m4                          |  0
 .../aclocal/intlmacosx.m4                     |  0
 .../aclocal/lib-ld.m4                         |  0
 .../aclocal/lib-link.m4                       |  0
 .../aclocal/lib-prefix.m4                     |  0
 .../aclocal/nls.m4                            |  0
 .../aclocal/po.m4                             |  0
 .../aclocal/progtest.m4                       |  0
 .../config.rpath                              |  0
 .../remove-potcdate.sin                       |  0
 ...20.2.bb => gettext-minimal-native_0.21.bb} |  0
 .../{gettext_0.20.2.bb => gettext_0.21.bb}    |  7 +--
 24 files changed, 46 insertions(+), 72 deletions(-)
 delete mode 100644 meta/recipes-core/gettext/gettext-0.20.2/add-with-bisonlocaledir.patch
 rename meta/recipes-core/gettext/{gettext-0.20.2 => gettext-0.21}/0001-init-env.in-do-not-add-C-CXX-parameters.patch (100%)
 rename meta/recipes-core/gettext/{gettext-0.20.2 => gettext-0.21}/0001-tests-autopoint-3-unset-MAKEFLAGS.patch (100%)
 create mode 100644 meta/recipes-core/gettext/gettext-0.21/mingw.patch
 rename meta/recipes-core/gettext/{gettext-0.20.2 => gettext-0.21}/parallel.patch (100%)
 rename meta/recipes-core/gettext/{gettext-0.20.2 => gettext-0.21}/run-ptest (100%)
 rename meta/recipes-core/gettext/{gettext-0.20.2 => gettext-0.21}/serial-tests-config.patch (100%)
 rename meta/recipes-core/gettext/{gettext-0.20.2 => gettext-0.21}/use-pkgconfig.patch (99%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.20.2 => gettext-minimal-0.21}/COPYING (100%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.20.2 => gettext-minimal-0.21}/Makefile.in.in (97%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.20.2 => gettext-minimal-0.21}/aclocal/gettext.m4 (100%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.20.2 => gettext-minimal-0.21}/aclocal/host-cpu-c-abi.m4 (100%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.20.2 => gettext-minimal-0.21}/aclocal/iconv.m4 (100%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.20.2 => gettext-minimal-0.21}/aclocal/intlmacosx.m4 (100%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.20.2 => gettext-minimal-0.21}/aclocal/lib-ld.m4 (100%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.20.2 => gettext-minimal-0.21}/aclocal/lib-link.m4 (100%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.20.2 => gettext-minimal-0.21}/aclocal/lib-prefix.m4 (100%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.20.2 => gettext-minimal-0.21}/aclocal/nls.m4 (100%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.20.2 => gettext-minimal-0.21}/aclocal/po.m4 (100%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.20.2 => gettext-minimal-0.21}/aclocal/progtest.m4 (100%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.20.2 => gettext-minimal-0.21}/config.rpath (100%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.20.2 => gettext-minimal-0.21}/remove-potcdate.sin (100%)
 rename meta/recipes-core/gettext/{gettext-minimal-native_0.20.2.bb => gettext-minimal-native_0.21.bb} (100%)
 rename meta/recipes-core/gettext/{gettext_0.20.2.bb => gettext_0.21.bb} (97%)

diff --git a/meta/recipes-core/gettext/gettext-0.20.2/add-with-bisonlocaledir.patch b/meta/recipes-core/gettext/gettext-0.20.2/add-with-bisonlocaledir.patch
deleted file mode 100644
index 35a131067a..0000000000
--- a/meta/recipes-core/gettext/gettext-0.20.2/add-with-bisonlocaledir.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 04bd40fe2c48c6e01ab418a04d27c4aff644ad96 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Wed, 17 Feb 2016 23:54:02 -0500
-Subject: [PATCH] m4/bison-i18n.m4: add --with-bisonlocaledir to assign
- BISON_LOCALEDIR
-
-The variable BISON_LOCALEDIR is assigned only by the output of
-'bison --print-localedir', we add option --with-bisonlocaledir
-to assign it explicitly. It is helpful for user to split the
-native compile and cross compile.
-
-For backward compatibility, if option not used, it still
-make use of the output of 'bison --print-localedir'.
-
-Upstream-Status: Submitted [bison-patches@gnu.org]
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- gettext-tools/gnulib-m4/bison-i18n.m4 | 10 ++++++++--
- 1 file changed, 8 insertions(+), 2 deletions(-)
-
-diff --git a/gettext-tools/gnulib-m4/bison-i18n.m4 b/gettext-tools/gnulib-m4/bison-i18n.m4
-index f5cfd3a..fb6ac4d 100644
---- a/gettext-tools/gnulib-m4/bison-i18n.m4
-+++ b/gettext-tools/gnulib-m4/bison-i18n.m4
-@@ -14,11 +14,16 @@ dnl sets BISON_LOCALEDIR to indicate where to find the bison-runtime.mo files
- dnl and defines YYENABLE_NLS if there are bison-runtime.mo files at all.
- AC_DEFUN([BISON_I18N],
- [
-+  dnl Default is not to set bisonlocaledir
-+  AC_ARG_WITH([bisonlocaledir],
-+    [  --with-bisonlocaledir   sets BISON_LOCALEDIR to indicate where to find the bison-runtime.mo files],
-+    BISON_LOCALEDIR=$withval,
-+    BISON_LOCALEDIR=)
-+
-   if test -z "$USE_NLS"; then
-     echo "The BISON-I18N macro is used without being preceded by AM-GNU-GETTEXT." 1>&2
-     exit 1
-   fi
--  BISON_LOCALEDIR=
-   BISON_USE_NLS=no
-   if test "$USE_NLS" = yes; then
-     dnl Determine bison's localedir.
-@@ -26,9 +31,10 @@ AC_DEFUN([BISON_I18N],
-     dnl But even is YACC is called "yacc", it may be a script that invokes bison
-     dnl and accepts the --print-localedir option.
-     dnl YACC's default value is empty; BISON's default value is :.
--    if (${YACC-${BISON-:}} --print-localedir) >/dev/null 2>&1; then
-+    if test -z "$BISON_LOCALEDIR" -a ${YACC-${BISON-:}} --print-localedir >/dev/null 2>&1; then
-       BISON_LOCALEDIR=`${YACC-${BISON-:}} --print-localedir`
-     fi
-+    AC_MSG_RESULT([$BISON_LOCALEDIR])
-     AC_SUBST([BISON_LOCALEDIR])
-     if test -n "$BISON_LOCALEDIR"; then
-       dnl There is no need to enable internationalization if the user doesn't
--- 
-1.9.1
-
diff --git a/meta/recipes-core/gettext/gettext-0.20.2/0001-init-env.in-do-not-add-C-CXX-parameters.patch b/meta/recipes-core/gettext/gettext-0.21/0001-init-env.in-do-not-add-C-CXX-parameters.patch
similarity index 100%
rename from meta/recipes-core/gettext/gettext-0.20.2/0001-init-env.in-do-not-add-C-CXX-parameters.patch
rename to meta/recipes-core/gettext/gettext-0.21/0001-init-env.in-do-not-add-C-CXX-parameters.patch
diff --git a/meta/recipes-core/gettext/gettext-0.20.2/0001-tests-autopoint-3-unset-MAKEFLAGS.patch b/meta/recipes-core/gettext/gettext-0.21/0001-tests-autopoint-3-unset-MAKEFLAGS.patch
similarity index 100%
rename from meta/recipes-core/gettext/gettext-0.20.2/0001-tests-autopoint-3-unset-MAKEFLAGS.patch
rename to meta/recipes-core/gettext/gettext-0.21/0001-tests-autopoint-3-unset-MAKEFLAGS.patch
diff --git a/meta/recipes-core/gettext/gettext-0.21/mingw.patch b/meta/recipes-core/gettext/gettext-0.21/mingw.patch
new file mode 100644
index 0000000000..b062c784f6
--- /dev/null
+++ b/meta/recipes-core/gettext/gettext-0.21/mingw.patch
@@ -0,0 +1,28 @@
+From 7cf68dffb2adb76375bfb0781e277510523a1f3e Mon Sep 17 00:00:00 2001
+From: Michele Locati <michele@locati.it>
+Date: Thu, 30 Jul 2020 18:58:02 +0200
+Subject: [PATCH] build: Fix build failure on Cygwin and mingw.
+
+* gettext-tools/woe32dll/gettextsrc-exports.c: Export formatstring_ruby.
+
+Upstream-Status: Backport
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ gettext-tools/woe32dll/gettextsrc-exports.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/gettext-tools/woe32dll/gettextsrc-exports.c b/gettext-tools/woe32dll/gettextsrc-exports.c
+index 4477ae8..6d76089 100644
+--- a/gettext-tools/woe32dll/gettextsrc-exports.c
++++ b/gettext-tools/woe32dll/gettextsrc-exports.c
+@@ -50,6 +50,7 @@ VARIABLE(formatstring_python)
+ VARIABLE(formatstring_python_brace)
+ VARIABLE(formatstring_qt)
+ VARIABLE(formatstring_qt_plural)
++VARIABLE(formatstring_ruby)
+ VARIABLE(formatstring_scheme)
+ VARIABLE(formatstring_sh)
+ VARIABLE(formatstring_smalltalk)
+-- 
+1.9.1
+
diff --git a/meta/recipes-core/gettext/gettext-0.20.2/parallel.patch b/meta/recipes-core/gettext/gettext-0.21/parallel.patch
similarity index 100%
rename from meta/recipes-core/gettext/gettext-0.20.2/parallel.patch
rename to meta/recipes-core/gettext/gettext-0.21/parallel.patch
diff --git a/meta/recipes-core/gettext/gettext-0.20.2/run-ptest b/meta/recipes-core/gettext/gettext-0.21/run-ptest
similarity index 100%
rename from meta/recipes-core/gettext/gettext-0.20.2/run-ptest
rename to meta/recipes-core/gettext/gettext-0.21/run-ptest
diff --git a/meta/recipes-core/gettext/gettext-0.20.2/serial-tests-config.patch b/meta/recipes-core/gettext/gettext-0.21/serial-tests-config.patch
similarity index 100%
rename from meta/recipes-core/gettext/gettext-0.20.2/serial-tests-config.patch
rename to meta/recipes-core/gettext/gettext-0.21/serial-tests-config.patch
diff --git a/meta/recipes-core/gettext/gettext-0.20.2/use-pkgconfig.patch b/meta/recipes-core/gettext/gettext-0.21/use-pkgconfig.patch
similarity index 99%
rename from meta/recipes-core/gettext/gettext-0.20.2/use-pkgconfig.patch
rename to meta/recipes-core/gettext/gettext-0.21/use-pkgconfig.patch
index feb56719d7..fc77feb270 100644
--- a/meta/recipes-core/gettext/gettext-0.20.2/use-pkgconfig.patch
+++ b/meta/recipes-core/gettext/gettext-0.21/use-pkgconfig.patch
@@ -1,4 +1,4 @@
-From c832880c5242b454a2c9e61b6a2dc26aecdc51bd Mon Sep 17 00:00:00 2001
+From 15647f679834be633fb4a9aeff4671b9cb95ccb8 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 23 Jan 2018 00:54:13 +0000
 Subject: [PATCH] gettext: beat library detection into shape
@@ -25,7 +25,7 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
  8 files changed, 83 insertions(+), 450 deletions(-)
 
 diff --git a/gettext-tools/gnulib-m4/libxml.m4 b/gettext-tools/gnulib-m4/libxml.m4
-index 05b9550..031ee65 100644
+index 2f80c37..30ce58e 100644
 --- a/gettext-tools/gnulib-m4/libxml.m4
 +++ b/gettext-tools/gnulib-m4/libxml.m4
 @@ -13,6 +13,7 @@ dnl gl_LIBXML(FORCE-INCLUDED)
@@ -142,7 +142,7 @@ index 05b9550..031ee65 100644
    ])
    AC_SUBST([LIBXML])
 diff --git a/libtextstyle/gnulib-local/lib/term-styled-ostream.oo.c b/libtextstyle/gnulib-local/lib/term-styled-ostream.oo.c
-index 2cfd4a8..d42c8b4 100644
+index 2ff978f..5ffb17a 100644
 --- a/libtextstyle/gnulib-local/lib/term-styled-ostream.oo.c
 +++ b/libtextstyle/gnulib-local/lib/term-styled-ostream.oo.c
 @@ -22,15 +22,15 @@
@@ -166,7 +166,7 @@ index 2cfd4a8..d42c8b4 100644
 +#include <libcroco/cr-string.h>
  
  #include "term-ostream.h"
- #include "hash.h"
+ #include "mem-hash-map.h"
 diff --git a/libtextstyle/gnulib-local/m4/libcroco.m4 b/libtextstyle/gnulib-local/m4/libcroco.m4
 index bc53cc6..10b2455 100644
 --- a/libtextstyle/gnulib-local/m4/libcroco.m4
@@ -646,7 +646,7 @@ index 5853772..767fba2 100644
    AC_SUBST([LTLIBGLIB])
    AC_SUBST([INCGLIB])
 diff --git a/libtextstyle/lib/term-styled-ostream.c b/libtextstyle/lib/term-styled-ostream.c
-index 3675b5f..811e546 100644
+index 5484800..16793fa 100644
 --- a/libtextstyle/lib/term-styled-ostream.c
 +++ b/libtextstyle/lib/term-styled-ostream.c
 @@ -28,15 +28,15 @@
@@ -670,9 +670,9 @@ index 3675b5f..811e546 100644
 +#include <libcroco/cr-string.h>
  
  #include "term-ostream.h"
- #include "hash.h"
+ #include "mem-hash-map.h"
 diff --git a/libtextstyle/lib/term-styled-ostream.oo.c b/libtextstyle/lib/term-styled-ostream.oo.c
-index 2cfd4a8..d42c8b4 100644
+index 2ff978f..5ffb17a 100644
 --- a/libtextstyle/lib/term-styled-ostream.oo.c
 +++ b/libtextstyle/lib/term-styled-ostream.oo.c
 @@ -22,15 +22,15 @@
@@ -696,4 +696,4 @@ index 2cfd4a8..d42c8b4 100644
 +#include <libcroco/cr-string.h>
  
  #include "term-ostream.h"
- #include "hash.h"
+ #include "mem-hash-map.h"
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.20.2/COPYING b/meta/recipes-core/gettext/gettext-minimal-0.21/COPYING
similarity index 100%
rename from meta/recipes-core/gettext/gettext-minimal-0.20.2/COPYING
rename to meta/recipes-core/gettext/gettext-minimal-0.21/COPYING
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.20.2/Makefile.in.in b/meta/recipes-core/gettext/gettext-minimal-0.21/Makefile.in.in
similarity index 97%
rename from meta/recipes-core/gettext/gettext-minimal-0.20.2/Makefile.in.in
rename to meta/recipes-core/gettext/gettext-minimal-0.21/Makefile.in.in
index de980e040a..6b25f0d916 100644
--- a/meta/recipes-core/gettext/gettext-minimal-0.20.2/Makefile.in.in
+++ b/meta/recipes-core/gettext/gettext-minimal-0.21/Makefile.in.in
@@ -7,7 +7,7 @@
 # notice and this notice are preserved.  This file is offered as-is,
 # without any warranty.
 #
-# Origin: gettext-0.20.2
+# Origin: gettext-0.21
 GETTEXT_MACRO_VERSION = 0.20
 
 PACKAGE = @PACKAGE@
@@ -415,12 +415,17 @@ dist distdir:
 	@$(MAKE) dist2
 # This is a separate target because 'update-po' must be executed before.
 dist2: $(srcdir)/stamp-po $(DISTFILES)
-	dists="$(DISTFILES)"; \
+	@dists="$(DISTFILES)"; \
 	if test "$(PACKAGE)" = "gettext-tools"; then \
 	  dists="$$dists Makevars.template"; \
 	fi; \
 	if test -f $(srcdir)/$(DOMAIN).pot; then \
 	  dists="$$dists $(DOMAIN).pot stamp-po"; \
+	else \
+	  case $(XGETTEXT) in \
+	    :) echo "Warning: Creating a tarball without '$(DOMAIN).pot', because a suitable 'xgettext' program was not found in PATH." 1>&2;; \
+	    *) echo "Warning: Creating a tarball without '$(DOMAIN).pot', because 'xgettext' found no strings to extract. Check the contents of the POTFILES.in file and the XGETTEXT_OPTIONS in the Makevars file." 1>&2;; \
+	  esac; \
 	fi; \
 	if test -f $(srcdir)/ChangeLog; then \
 	  dists="$$dists ChangeLog"; \
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.20.2/aclocal/gettext.m4 b/meta/recipes-core/gettext/gettext-minimal-0.21/aclocal/gettext.m4
similarity index 100%
rename from meta/recipes-core/gettext/gettext-minimal-0.20.2/aclocal/gettext.m4
rename to meta/recipes-core/gettext/gettext-minimal-0.21/aclocal/gettext.m4
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.20.2/aclocal/host-cpu-c-abi.m4 b/meta/recipes-core/gettext/gettext-minimal-0.21/aclocal/host-cpu-c-abi.m4
similarity index 100%
rename from meta/recipes-core/gettext/gettext-minimal-0.20.2/aclocal/host-cpu-c-abi.m4
rename to meta/recipes-core/gettext/gettext-minimal-0.21/aclocal/host-cpu-c-abi.m4
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.20.2/aclocal/iconv.m4 b/meta/recipes-core/gettext/gettext-minimal-0.21/aclocal/iconv.m4
similarity index 100%
rename from meta/recipes-core/gettext/gettext-minimal-0.20.2/aclocal/iconv.m4
rename to meta/recipes-core/gettext/gettext-minimal-0.21/aclocal/iconv.m4
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.20.2/aclocal/intlmacosx.m4 b/meta/recipes-core/gettext/gettext-minimal-0.21/aclocal/intlmacosx.m4
similarity index 100%
rename from meta/recipes-core/gettext/gettext-minimal-0.20.2/aclocal/intlmacosx.m4
rename to meta/recipes-core/gettext/gettext-minimal-0.21/aclocal/intlmacosx.m4
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.20.2/aclocal/lib-ld.m4 b/meta/recipes-core/gettext/gettext-minimal-0.21/aclocal/lib-ld.m4
similarity index 100%
rename from meta/recipes-core/gettext/gettext-minimal-0.20.2/aclocal/lib-ld.m4
rename to meta/recipes-core/gettext/gettext-minimal-0.21/aclocal/lib-ld.m4
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.20.2/aclocal/lib-link.m4 b/meta/recipes-core/gettext/gettext-minimal-0.21/aclocal/lib-link.m4
similarity index 100%
rename from meta/recipes-core/gettext/gettext-minimal-0.20.2/aclocal/lib-link.m4
rename to meta/recipes-core/gettext/gettext-minimal-0.21/aclocal/lib-link.m4
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.20.2/aclocal/lib-prefix.m4 b/meta/recipes-core/gettext/gettext-minimal-0.21/aclocal/lib-prefix.m4
similarity index 100%
rename from meta/recipes-core/gettext/gettext-minimal-0.20.2/aclocal/lib-prefix.m4
rename to meta/recipes-core/gettext/gettext-minimal-0.21/aclocal/lib-prefix.m4
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.20.2/aclocal/nls.m4 b/meta/recipes-core/gettext/gettext-minimal-0.21/aclocal/nls.m4
similarity index 100%
rename from meta/recipes-core/gettext/gettext-minimal-0.20.2/aclocal/nls.m4
rename to meta/recipes-core/gettext/gettext-minimal-0.21/aclocal/nls.m4
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.20.2/aclocal/po.m4 b/meta/recipes-core/gettext/gettext-minimal-0.21/aclocal/po.m4
similarity index 100%
rename from meta/recipes-core/gettext/gettext-minimal-0.20.2/aclocal/po.m4
rename to meta/recipes-core/gettext/gettext-minimal-0.21/aclocal/po.m4
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.20.2/aclocal/progtest.m4 b/meta/recipes-core/gettext/gettext-minimal-0.21/aclocal/progtest.m4
similarity index 100%
rename from meta/recipes-core/gettext/gettext-minimal-0.20.2/aclocal/progtest.m4
rename to meta/recipes-core/gettext/gettext-minimal-0.21/aclocal/progtest.m4
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.20.2/config.rpath b/meta/recipes-core/gettext/gettext-minimal-0.21/config.rpath
similarity index 100%
rename from meta/recipes-core/gettext/gettext-minimal-0.20.2/config.rpath
rename to meta/recipes-core/gettext/gettext-minimal-0.21/config.rpath
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.20.2/remove-potcdate.sin b/meta/recipes-core/gettext/gettext-minimal-0.21/remove-potcdate.sin
similarity index 100%
rename from meta/recipes-core/gettext/gettext-minimal-0.20.2/remove-potcdate.sin
rename to meta/recipes-core/gettext/gettext-minimal-0.21/remove-potcdate.sin
diff --git a/meta/recipes-core/gettext/gettext-minimal-native_0.20.2.bb b/meta/recipes-core/gettext/gettext-minimal-native_0.21.bb
similarity index 100%
rename from meta/recipes-core/gettext/gettext-minimal-native_0.20.2.bb
rename to meta/recipes-core/gettext/gettext-minimal-native_0.21.bb
diff --git a/meta/recipes-core/gettext/gettext_0.20.2.bb b/meta/recipes-core/gettext/gettext_0.21.bb
similarity index 97%
rename from meta/recipes-core/gettext/gettext_0.20.2.bb
rename to meta/recipes-core/gettext/gettext_0.21.bb
index fda11c44cc..54305623dd 100644
--- a/meta/recipes-core/gettext/gettext_0.20.2.bb
+++ b/meta/recipes-core/gettext/gettext_0.21.bb
@@ -18,15 +18,14 @@ PROVIDES_class-native = "virtual/gettext-native"
 RCONFLICTS_${PN} = "proxy-libintl"
 SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \
            file://parallel.patch \
-           file://add-with-bisonlocaledir.patch \
            file://use-pkgconfig.patch \
            file://run-ptest \
            file://serial-tests-config.patch \
            file://0001-tests-autopoint-3-unset-MAKEFLAGS.patch \
            file://0001-init-env.in-do-not-add-C-CXX-parameters.patch \
+           file://mingw.patch \
            "
-SRC_URI[md5sum] = "30fec34a895fab4c02584449c500aac2"
-SRC_URI[sha256sum] = "ecb9d0908ca41d5ca5fef974323b3bba6bec19eebba0b44f396de98cfcc089f1"
+SRC_URI[sha256sum] = "c77d0da3102aec9c07f43671e60611ebff89a996ef159497ce8e59d075786b12"
 
 inherit autotools texinfo pkgconfig ptest
 
@@ -130,7 +129,7 @@ do_install_append_class-native () {
 	rm ${D}${datadir}/gettext/po/remove-potcdate.sin
 
         create_wrapper ${D}${bindir}/msgfmt \
-                GETTEXTDATADIR="${STAGING_DATADIR_NATIVE}/gettext-0.20.2/"
+                GETTEXTDATADIR="${STAGING_DATADIR_NATIVE}/gettext-${PV}/"
 
 }
 
-- 
2.28.0

