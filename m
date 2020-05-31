Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web12.17623.1590940454299974522
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2020 08:54:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UqxvPrxk;
 spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id l27so6907602ejc.1
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2020 08:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zvzyT+9JohB6ZuScvVbXfd8UGssA92lWb4sxDNk7eTA=;
        b=UqxvPrxkqq1oGN0dO0tZBcQ0TWQ2HQCZ7Ow6Cv9NXOMuR/dePaWFj2mzplPb7frIvA
         fI/dMKpUHizlvfH80ORAbTXqXf4ZXF9w2Bzd4hzrRu68LRpLoos0enUKhXEkHvJRYNx2
         lZr+9dxfz14VEUjzY23kiRM31vVsEIB8JHz/uX8BQZCff5xHEyjTVpC9lPut+LCLmhkM
         igAf4G3FUsOjlKZw6qBe77fh9tXKkpTfmZfZ+aGB/WF+XSiFhuC0ZOYMJ/na20wf8Qm9
         MubZTHj13Z65tsoxH4mymzSIT1IeN9wyfYJkSqcUBm+fzUasM1DUNIDtHb2KgStCLoSs
         t4DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zvzyT+9JohB6ZuScvVbXfd8UGssA92lWb4sxDNk7eTA=;
        b=k5SDY/ISBTk4fpUmc9U7tQOTk+fbUZKsx5s43wDdD9l6Z4sJBic3/rCmKkQICFu2op
         XYMLC68HOBj/cQ4ZXXyaLLF5JlUc92YX3BDDx24vhetyFcw/wTJCVo9Hjb/g/+pWZ6qO
         sZQunLUwM25z8bjCl64F1yhAY+mKA2wXOCHa7geiKwWPjFWxlw6lZjPfBtfz9nDkKaCz
         wfeqmkNwilmVZfMFovpSBYPCQWXd8oKWbCNjC0UHXJH37khCdTT9iJ6Ky4NmgqVuiSgF
         UZ+TIOuFr9FssTCvEW5Mr95WZzQ7blQANsBh0ABV9Q6kcfFhyiTv4LE/wKhJDzP/DojB
         U3wA==
X-Gm-Message-State: AOAM532mwjCNEeoRlrvC7mywxGau4rUdq/DWVlRoZGVnAdBb33Ic9q2y
	NTr9CPFpXjvjkR9cIHRFso7ge6jz
X-Google-Smtp-Source: ABdhPJx5YkofUmN2JFnNC4fzmX4ekWHMoWWQL9gMRONHqmbEEqjlj4qDenhpy40AVN7S0WEdvQMI1g==
X-Received: by 2002:a17:906:5fcd:: with SMTP id k13mr3556674ejv.459.1590940451781;
        Sun, 31 May 2020 08:54:11 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
        by smtp.gmail.com with ESMTPSA id dn15sm13227042ejc.26.2020.05.31.08.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 08:54:11 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 50/70] gettext: update 0.20.1 -> 0.20.2
Date: Sun, 31 May 2020 17:52:34 +0200
Message-Id: <20200531155254.10283-50-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531155254.10283-1-alex.kanavin@gmail.com>
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...aviour-of-for-msgfmt-on-PO-files-wit.patch |  87 --------
 ...nt.c-timsort.h-fix-formatting-issues.patch |  71 ------
 ...t-env.in-do-not-add-C-CXX-parameters.patch |   0
 ...01-tests-autopoint-3-unset-MAKEFLAGS.patch |   0
 .../add-with-bisonlocaledir.patch             |   0
 .../parallel.patch                            |   0
 .../run-ptest                                 |   0
 .../serial-tests-config.patch                 |   0
 .../use-pkgconfig.patch                       |  36 +---
 .../COPYING                                   |   0
 .../Makefile.in.in                            |  12 +-
 .../aclocal/gettext.m4                        |   8 +-
 .../aclocal/host-cpu-c-abi.m4                 |  45 +++-
 .../aclocal/iconv.m4                          |   2 +-
 .../aclocal/intlmacosx.m4                     |  33 ++-
 .../aclocal/lib-ld.m4                         |   2 +-
 .../aclocal/lib-link.m4                       | 154 +++++++------
 .../aclocal/lib-prefix.m4                     | 203 ++++++++++++------
 .../aclocal/nls.m4                            |  10 +-
 .../aclocal/po.m4                             |   8 +-
 .../aclocal/progtest.m4                       |   8 +-
 .../config.rpath                              |   2 +-
 .../remove-potcdate.sin                       |   0
 ....1.bb => gettext-minimal-native_0.20.2.bb} |   0
 .../{gettext_0.20.1.bb => gettext_0.20.2.bb}  |   8 +-
 25 files changed, 319 insertions(+), 370 deletions(-)
 delete mode 100644 meta/recipes-core/gettext/gettext-0.20.1/0001-msgmerge-Fix-behaviour-of-for-msgfmt-on-PO-files-wit.patch
 delete mode 100644 meta/recipes-core/gettext/gettext-0.20.1/cr-statement.c-timsort.h-fix-formatting-issues.patch
 rename meta/recipes-core/gettext/{gettext-0.20.1 => gettext-0.20.2}/0001-init-env.in-do-not-add-C-CXX-parameters.patch (100%)
 rename meta/recipes-core/gettext/{gettext-0.20.1 => gettext-0.20.2}/0001-tests-autopoint-3-unset-MAKEFLAGS.patch (100%)
 rename meta/recipes-core/gettext/{gettext-0.20.1 => gettext-0.20.2}/add-with-bisonlocaledir.patch (100%)
 rename meta/recipes-core/gettext/{gettext-0.20.1 => gettext-0.20.2}/parallel.patch (100%)
 rename meta/recipes-core/gettext/{gettext-0.20.1 => gettext-0.20.2}/run-ptest (100%)
 rename meta/recipes-core/gettext/{gettext-0.20.1 => gettext-0.20.2}/serial-tests-config.patch (100%)
 rename meta/recipes-core/gettext/{gettext-0.20.1 => gettext-0.20.2}/use-pkgconfig.patch (95%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.20.1 => gettext-minimal-0.20.2}/COPYING (100%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.20.1 => gettext-minimal-0.20.2}/Makefile.in.in (99%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.20.1 => gettext-minimal-0.20.2}/aclocal/gettext.m4 (98%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.20.1 => gettext-minimal-0.20.2}/aclocal/host-cpu-c-abi.m4 (94%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.20.1 => gettext-minimal-0.20.2}/aclocal/iconv.m4 (99%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.20.1 => gettext-minimal-0.20.2}/aclocal/intlmacosx.m4 (70%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.20.1 => gettext-minimal-0.20.2}/aclocal/lib-ld.m4 (98%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.20.1 => gettext-minimal-0.20.2}/aclocal/lib-link.m4 (85%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.20.1 => gettext-minimal-0.20.2}/aclocal/lib-prefix.m4 (54%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.20.1 => gettext-minimal-0.20.2}/aclocal/nls.m4 (77%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.20.1 => gettext-minimal-0.20.2}/aclocal/po.m4 (98%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.20.1 => gettext-minimal-0.20.2}/aclocal/progtest.m4 (92%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.20.1 => gettext-minimal-0.20.2}/config.rpath (99%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.20.1 => gettext-minimal-0.20.2}/remove-potcdate.sin (100%)
 rename meta/recipes-core/gettext/{gettext-minimal-native_0.20.1.bb => gettext-minimal-native_0.20.2.bb} (100%)
 rename meta/recipes-core/gettext/{gettext_0.20.1.bb => gettext_0.20.2.bb} (96%)

diff --git a/meta/recipes-core/gettext/gettext-0.20.1/0001-msgmerge-Fix-behaviour-of-for-msgfmt-on-PO-files-wit.patch b/meta/recipes-core/gettext/gettext-0.20.1/0001-msgmerge-Fix-behaviour-of-for-msgfmt-on-PO-files-wit.patch
deleted file mode 100644
index 2245889386..0000000000
--- a/meta/recipes-core/gettext/gettext-0.20.1/0001-msgmerge-Fix-behaviour-of-for-msgfmt-on-PO-files-wit.patch
+++ /dev/null
@@ -1,87 +0,0 @@
-From 75e315fdec82d1a17ebcd9e0712d109323578d68 Mon Sep 17 00:00:00 2001
-From: Bruno Haible <bruno@clisp.org>
-Date: Sun, 19 May 2019 11:10:06 +0200
-Subject: [PATCH] msgmerge: Fix behaviour of --for-msgfmt on PO files with no
- translations.
-
-msgmerge: Fix behaviour of --for-msgfmt on PO files with no translations.
-
-Reported by Don Lawrence <dlawrence@iecok.com>
-in <https://lists.freedesktop.org/archives/p11-glue/2019-May/000700.html>
-via Daiki Ueno
-in <https://lists.gnu.org/archive/html/bug-gettext/2019-05/msg00124.html>.
-
-* gettext-tools/src/msgmerge.c (main): Treat force_po like true if for_msgfmt
-is true.
-* gettext-tools/tests/msgmerge-26: Add test of PO file with no translations.
-
-Upstream-Status: Backport [https://git.savannah.gnu.org/gitweb/?p=gettext.git;a=commitdiff;h=2336451ed68d91ff4b5ae1acbc1eca30e47a86a9]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- gettext-tools/src/msgmerge.c    |  4 ++--
- gettext-tools/tests/msgmerge-26 | 36 ++++++++++++++++++++++++++++++---
- 2 files changed, 35 insertions(+), 5 deletions(-)
-
-diff --git a/gettext-tools/src/msgmerge.c b/gettext-tools/src/msgmerge.c
-index cd762c0..92c9b7a 100644
---- a/gettext-tools/src/msgmerge.c
-+++ b/gettext-tools/src/msgmerge.c
-@@ -520,8 +520,8 @@ There is NO WARRANTY, to the extent permitted by law.\n\
-   else
-     {
-       /* Write the merged message list out.  */
--      msgdomain_list_print (result, output_file, output_syntax, force_po,
--                            false);
-+      msgdomain_list_print (result, output_file, output_syntax,
-+                            for_msgfmt || force_po, false);
-     }
- 
-   exit (EXIT_SUCCESS);
-diff --git a/gettext-tools/tests/msgmerge-26 b/gettext-tools/tests/msgmerge-26
-index cd3862e..b86f7a0 100755
---- a/gettext-tools/tests/msgmerge-26
-+++ b/gettext-tools/tests/msgmerge-26
-@@ -73,7 +73,37 @@ msgstr "Papaya"
- EOF
- 
- : ${DIFF=diff}
--${DIFF} mm-test26.ok mm-test26.out
--result=$?
-+${DIFF} mm-test26.ok mm-test26.out || Exit 1
- 
--exit $result
-+# Test with a PO file that has no translated messages.
-+
-+cat <<\EOF > mm-test26a.in1
-+msgid ""
-+msgstr ""
-+"Content-Type: text/plain; charset=UTF-8\n"
-+
-+msgid "Hello world"
-+msgstr "Hallo Welt"
-+EOF
-+
-+cat <<\EOF > mm-test26a.in2
-+msgid ""
-+msgstr ""
-+"Content-Type: text/plain; charset=ASCII\n"
-+
-+msgid "Hello, world!"
-+msgstr ""
-+EOF
-+
-+: ${MSGMERGE=msgmerge}
-+${MSGMERGE} --for-msgfmt -o mm-test26a.tmp mm-test26a.in1 mm-test26a.in2 \
-+    || Exit 1
-+LC_ALL=C tr -d '\r' < mm-test26a.tmp > mm-test26a.out || Exit 1
-+
-+cat <<\EOF > mm-test26a.ok
-+msgid ""
-+msgstr "Content-Type: text/plain; charset=UTF-8\n"
-+EOF
-+
-+: ${DIFF=diff}
-+${DIFF} mm-test26a.ok mm-test26a.out || Exit 1
--- 
-2.24.1
-
diff --git a/meta/recipes-core/gettext/gettext-0.20.1/cr-statement.c-timsort.h-fix-formatting-issues.patch b/meta/recipes-core/gettext/gettext-0.20.1/cr-statement.c-timsort.h-fix-formatting-issues.patch
deleted file mode 100644
index 0561ed7d32..0000000000
--- a/meta/recipes-core/gettext/gettext-0.20.1/cr-statement.c-timsort.h-fix-formatting-issues.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From f6245ef5530fc37a6243e798df34162fbbeab6f0 Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Sun, 19 Feb 2017 23:32:46 -0800
-Subject: [PATCH] cr-statement.c/timsort.h: fix formatting issues
-
-Fixed when compile with "-Wformat -Wformat-security -Werror=format-security":
-| gettext-tools/gnulib-lib/libcroco/cr-statement.c: In function 'cr_statement_dump_charset':
-| gettext-tools/gnulib-lib/libcroco/cr-statement.c:2661:17: error: format not a string literal and no format arguments [-Werror=format-security]
-|                  fprintf (a_fp, str) ;
-
-And:
-gettext-tools/gnulib-lib/libxml/timsort.h:326:80: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'unsigned int' [-Wformat=]
-       fprintf(stderr, "Error allocating temporary storage for tim sort: need %lu bytes", sizeof(SORT_TYPE) * new_size);
-
-Upstream-Status: Pending
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
-
----
- libtextstyle/lib/libcroco/cr-statement.c | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/libtextstyle/lib/libcroco/cr-statement.c b/libtextstyle/lib/libcroco/cr-statement.c
-index 617520f..100104b 100644
---- a/libtextstyle/lib/libcroco/cr-statement.c
-+++ b/libtextstyle/lib/libcroco/cr-statement.c
-@@ -2607,7 +2607,7 @@ cr_statement_dump_ruleset (CRStatement * a_this, FILE * a_fp, glong a_indent)
-         g_return_if_fail (a_fp && a_this);
-         str = cr_statement_ruleset_to_string (a_this, a_indent);
-         if (str) {
--                fprintf (a_fp, str);
-+                fprintf (a_fp, "%s", str);
-                 g_free (str);
-                 str = NULL;
-         }
-@@ -2658,7 +2658,7 @@ cr_statement_dump_charset (CRStatement * a_this, FILE * a_fp, gulong a_indent)
-         str = cr_statement_charset_to_string (a_this,
-                                               a_indent) ;
-         if (str) {
--                fprintf (a_fp, str) ;
-+                fprintf (a_fp, "%s", str) ;
-                 g_free (str) ;
-                 str = NULL ;
-         }
-@@ -2685,7 +2685,7 @@ cr_statement_dump_page (CRStatement * a_this, FILE * a_fp, gulong a_indent)
- 
-         str = cr_statement_at_page_rule_to_string (a_this, a_indent) ;
-         if (str) {
--                fprintf (a_fp, str);
-+                fprintf (a_fp, "%s", str);
-                 g_free (str) ;
-                 str = NULL ; 
-         }
-@@ -2711,7 +2711,7 @@ cr_statement_dump_media_rule (CRStatement * a_this,
- 
-         str = cr_statement_media_rule_to_string (a_this, a_indent) ;
-         if (str) {
--                fprintf (a_fp, str) ;
-+                fprintf (a_fp, "%s", str) ;
-                 g_free (str) ;
-                 str = NULL ;
-         }
-@@ -2737,7 +2737,7 @@ cr_statement_dump_import_rule (CRStatement * a_this, FILE * a_fp,
- 
-         str = cr_statement_import_rule_to_string (a_this, a_indent) ;
-         if (str) {
--                fprintf (a_fp, str) ;
-+                fprintf (a_fp, "%s", str) ;
-                 g_free (str) ;
-                 str = NULL ;
-         }
diff --git a/meta/recipes-core/gettext/gettext-0.20.1/0001-init-env.in-do-not-add-C-CXX-parameters.patch b/meta/recipes-core/gettext/gettext-0.20.2/0001-init-env.in-do-not-add-C-CXX-parameters.patch
similarity index 100%
rename from meta/recipes-core/gettext/gettext-0.20.1/0001-init-env.in-do-not-add-C-CXX-parameters.patch
rename to meta/recipes-core/gettext/gettext-0.20.2/0001-init-env.in-do-not-add-C-CXX-parameters.patch
diff --git a/meta/recipes-core/gettext/gettext-0.20.1/0001-tests-autopoint-3-unset-MAKEFLAGS.patch b/meta/recipes-core/gettext/gettext-0.20.2/0001-tests-autopoint-3-unset-MAKEFLAGS.patch
similarity index 100%
rename from meta/recipes-core/gettext/gettext-0.20.1/0001-tests-autopoint-3-unset-MAKEFLAGS.patch
rename to meta/recipes-core/gettext/gettext-0.20.2/0001-tests-autopoint-3-unset-MAKEFLAGS.patch
diff --git a/meta/recipes-core/gettext/gettext-0.20.1/add-with-bisonlocaledir.patch b/meta/recipes-core/gettext/gettext-0.20.2/add-with-bisonlocaledir.patch
similarity index 100%
rename from meta/recipes-core/gettext/gettext-0.20.1/add-with-bisonlocaledir.patch
rename to meta/recipes-core/gettext/gettext-0.20.2/add-with-bisonlocaledir.patch
diff --git a/meta/recipes-core/gettext/gettext-0.20.1/parallel.patch b/meta/recipes-core/gettext/gettext-0.20.2/parallel.patch
similarity index 100%
rename from meta/recipes-core/gettext/gettext-0.20.1/parallel.patch
rename to meta/recipes-core/gettext/gettext-0.20.2/parallel.patch
diff --git a/meta/recipes-core/gettext/gettext-0.20.1/run-ptest b/meta/recipes-core/gettext/gettext-0.20.2/run-ptest
similarity index 100%
rename from meta/recipes-core/gettext/gettext-0.20.1/run-ptest
rename to meta/recipes-core/gettext/gettext-0.20.2/run-ptest
diff --git a/meta/recipes-core/gettext/gettext-0.20.1/serial-tests-config.patch b/meta/recipes-core/gettext/gettext-0.20.2/serial-tests-config.patch
similarity index 100%
rename from meta/recipes-core/gettext/gettext-0.20.1/serial-tests-config.patch
rename to meta/recipes-core/gettext/gettext-0.20.2/serial-tests-config.patch
diff --git a/meta/recipes-core/gettext/gettext-0.20.1/use-pkgconfig.patch b/meta/recipes-core/gettext/gettext-0.20.2/use-pkgconfig.patch
similarity index 95%
rename from meta/recipes-core/gettext/gettext-0.20.1/use-pkgconfig.patch
rename to meta/recipes-core/gettext/gettext-0.20.2/use-pkgconfig.patch
index d3f3fe8e2f..feb56719d7 100644
--- a/meta/recipes-core/gettext/gettext-0.20.1/use-pkgconfig.patch
+++ b/meta/recipes-core/gettext/gettext-0.20.2/use-pkgconfig.patch
@@ -1,4 +1,4 @@
-From ef414b06be80c6f605731abc9e674e396b80ec9e Mon Sep 17 00:00:00 2001
+From c832880c5242b454a2c9e61b6a2dc26aecdc51bd Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 23 Jan 2018 00:54:13 +0000
 Subject: [PATCH] gettext: beat library detection into shape
@@ -15,14 +15,14 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
 
 ---
  gettext-tools/gnulib-m4/libxml.m4             |  99 +----------------
- .../gnulib-local/lib/term-styled-ostream.oo.c |  12 +-
+ .../gnulib-local/lib/term-styled-ostream.oo.c |  12 +--
  libtextstyle/gnulib-local/m4/libcroco.m4      |  99 +++--------------
- libtextstyle/gnulib-local/m4/libglib.m4       | 104 +++---------------
+ libtextstyle/gnulib-local/m4/libglib.m4       | 100 +++---------------
  libtextstyle/gnulib-m4/libcroco.m4            |  99 +++--------------
- libtextstyle/gnulib-m4/libglib.m4             | 104 +++---------------
- libtextstyle/lib/term-styled-ostream.c        |  12 +-
- libtextstyle/lib/term-styled-ostream.oo.c     |  12 +-
- 8 files changed, 87 insertions(+), 454 deletions(-)
+ libtextstyle/gnulib-m4/libglib.m4             | 100 +++---------------
+ libtextstyle/lib/term-styled-ostream.c        |  12 +--
+ libtextstyle/lib/term-styled-ostream.oo.c     |  12 +--
+ 8 files changed, 83 insertions(+), 450 deletions(-)
 
 diff --git a/gettext-tools/gnulib-m4/libxml.m4 b/gettext-tools/gnulib-m4/libxml.m4
 index 05b9550..031ee65 100644
@@ -289,17 +289,10 @@ index bc53cc6..10b2455 100644
    AC_SUBST([LTLIBCROCO])
    AC_SUBST([INCCROCO])
 diff --git a/libtextstyle/gnulib-local/m4/libglib.m4 b/libtextstyle/gnulib-local/m4/libglib.m4
-index bef6fa3..8841755 100644
+index 5853772..767fba2 100644
 --- a/libtextstyle/gnulib-local/m4/libglib.m4
 +++ b/libtextstyle/gnulib-local/m4/libglib.m4
-@@ -1,105 +1,31 @@
--# libglib.m4 serial 4
--dnl Copyright (C) 2006-2007, 2019 Free Software Foundation, Inc.
-+# libglib.m4 serial 3 (gettext-0.17)
-+dnl Copyright (C) 2006-2007, 2015-2016 Free Software Foundation, Inc.
- dnl This file is free software; the Free Software Foundation
- dnl gives unlimited permission to copy and/or distribute it,
- dnl with or without modifications, as long as this notice is preserved.
+@@ -6,100 +6,26 @@ dnl with or without modifications, as long as this notice is preserved.
  
  dnl From Bruno Haible.
  
@@ -535,17 +528,10 @@ index bc53cc6..10b2455 100644
    AC_SUBST([LTLIBCROCO])
    AC_SUBST([INCCROCO])
 diff --git a/libtextstyle/gnulib-m4/libglib.m4 b/libtextstyle/gnulib-m4/libglib.m4
-index bef6fa3..8841755 100644
+index 5853772..767fba2 100644
 --- a/libtextstyle/gnulib-m4/libglib.m4
 +++ b/libtextstyle/gnulib-m4/libglib.m4
-@@ -1,105 +1,31 @@
--# libglib.m4 serial 4
--dnl Copyright (C) 2006-2007, 2019 Free Software Foundation, Inc.
-+# libglib.m4 serial 3 (gettext-0.17)
-+dnl Copyright (C) 2006-2007, 2015-2016 Free Software Foundation, Inc.
- dnl This file is free software; the Free Software Foundation
- dnl gives unlimited permission to copy and/or distribute it,
- dnl with or without modifications, as long as this notice is preserved.
+@@ -6,100 +6,26 @@ dnl with or without modifications, as long as this notice is preserved.
  
  dnl From Bruno Haible.
  
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.20.1/COPYING b/meta/recipes-core/gettext/gettext-minimal-0.20.2/COPYING
similarity index 100%
rename from meta/recipes-core/gettext/gettext-minimal-0.20.1/COPYING
rename to meta/recipes-core/gettext/gettext-minimal-0.20.2/COPYING
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.20.1/Makefile.in.in b/meta/recipes-core/gettext/gettext-minimal-0.20.2/Makefile.in.in
similarity index 99%
rename from meta/recipes-core/gettext/gettext-minimal-0.20.1/Makefile.in.in
rename to meta/recipes-core/gettext/gettext-minimal-0.20.2/Makefile.in.in
index fdb6ad3588..de980e040a 100644
--- a/meta/recipes-core/gettext/gettext-minimal-0.20.1/Makefile.in.in
+++ b/meta/recipes-core/gettext/gettext-minimal-0.20.2/Makefile.in.in
@@ -1,13 +1,13 @@
 # Makefile for PO directory in any package using GNU gettext.
 # Copyright (C) 1995-2000 Ulrich Drepper <drepper@gnu.ai.mit.edu>
-# Copyright (C) 2000-2019 Free Software Foundation, Inc.
+# Copyright (C) 2000-2020 Free Software Foundation, Inc.
 #
 # Copying and distribution of this file, with or without modification,
 # are permitted in any medium without royalty provided the copyright
 # notice and this notice are preserved.  This file is offered as-is,
 # without any warranty.
 #
-# Origin: gettext-0.20
+# Origin: gettext-0.20.2
 GETTEXT_MACRO_VERSION = 0.20
 
 PACKAGE = @PACKAGE@
@@ -90,6 +90,9 @@ DISTFILESDEPS = $(DISTFILESDEPS_$(DIST_DEPENDS_ON_UPDATE_PO))
 
 # Makevars gets inserted here. (Don't remove this line!)
 
+all: all-@USE_NLS@
+
+
 .SUFFIXES:
 .SUFFIXES: .po .gmo .sed .sin .nop .po-create .po-update
 
@@ -107,7 +110,8 @@ DISTFILESDEPS = $(DISTFILESDEPS_$(DIST_DEPENDS_ON_UPDATE_PO))
 # the .pot file. This eliminates the need to update the .po files when the
 # .pot file has changed, which would be troublesome if the .po files are put
 # under version control.
-.po.gmo: $(srcdir)/$(DOMAIN).pot
+$(GMOFILES): $(srcdir)/$(DOMAIN).pot
+.po.gmo:
 	@lang=`echo $* | sed -e 's,.*/,,'`; \
 	test "$(srcdir)" = . && cdcmd="" || cdcmd="cd $(srcdir) && "; \
 	echo "$${cdcmd}rm -f $${lang}.gmo && $(MSGMERGE) $(MSGMERGE_FOR_MSGFMT_OPTION) -o $${lang}.1po $${lang}.po $(DOMAIN).pot && $(GMSGFMT) -c --statistics --verbose -o $${lang}.gmo $${lang}.1po && rm -f $${lang}.1po"; \
@@ -123,8 +127,6 @@ DISTFILESDEPS = $(DISTFILESDEPS_$(DIST_DEPENDS_ON_UPDATE_PO))
 	mv t-$@ $@
 
 
-all: all-@USE_NLS@
-
 all-yes: $(srcdir)/stamp-po
 all-no:
 
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/gettext.m4 b/meta/recipes-core/gettext/gettext-minimal-0.20.2/aclocal/gettext.m4
similarity index 98%
rename from meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/gettext.m4
rename to meta/recipes-core/gettext/gettext-minimal-0.20.2/aclocal/gettext.m4
index e7832418ea..4f25a27d93 100644
--- a/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/gettext.m4
+++ b/meta/recipes-core/gettext/gettext-minimal-0.20.2/aclocal/gettext.m4
@@ -1,15 +1,15 @@
-# gettext.m4 serial 70 (gettext-0.20)
-dnl Copyright (C) 1995-2014, 2016, 2018 Free Software Foundation, Inc.
+# gettext.m4 serial 71 (gettext-0.20.2)
+dnl Copyright (C) 1995-2014, 2016, 2018-2020 Free Software Foundation, Inc.
 dnl This file is free software; the Free Software Foundation
 dnl gives unlimited permission to copy and/or distribute it,
 dnl with or without modifications, as long as this notice is preserved.
 dnl
 dnl This file can be used in projects which are not available under
-dnl the GNU General Public License or the GNU Library General Public
+dnl the GNU General Public License or the GNU Lesser General Public
 dnl License but which still want to provide support for the GNU gettext
 dnl functionality.
 dnl Please note that the actual code of the GNU gettext library is covered
-dnl by the GNU Library General Public License, and the rest of the GNU
+dnl by the GNU Lesser General Public License, and the rest of the GNU
 dnl gettext package is covered by the GNU General Public License.
 dnl They are *not* in the public domain.
 
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/host-cpu-c-abi.m4 b/meta/recipes-core/gettext/gettext-minimal-0.20.2/aclocal/host-cpu-c-abi.m4
similarity index 94%
rename from meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/host-cpu-c-abi.m4
rename to meta/recipes-core/gettext/gettext-minimal-0.20.2/aclocal/host-cpu-c-abi.m4
index 4407296d08..6db2aa25ae 100644
--- a/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/host-cpu-c-abi.m4
+++ b/meta/recipes-core/gettext/gettext-minimal-0.20.2/aclocal/host-cpu-c-abi.m4
@@ -1,5 +1,5 @@
-# host-cpu-c-abi.m4 serial 11
-dnl Copyright (C) 2002-2019 Free Software Foundation, Inc.
+# host-cpu-c-abi.m4 serial 13
+dnl Copyright (C) 2002-2020 Free Software Foundation, Inc.
 dnl This file is free software; the Free Software Foundation
 dnl gives unlimited permission to copy and/or distribute it,
 dnl with or without modifications, as long as this notice is preserved.
@@ -55,7 +55,7 @@ AC_DEFUN([gl_HOST_CPU_C_ABI],
     [case "$host_cpu" in
 
 changequote(,)dnl
-       i[4567]86 )
+       i[34567]86 )
 changequote([,])dnl
          gl_cv_host_cpu_c_abi=i386
          ;;
@@ -457,7 +457,8 @@ EOF
 
 
 dnl Sets the HOST_CPU_C_ABI_32BIT variable to 'yes' if the C language ABI
-dnl (application binary interface) is a 32-bit one, or to 'no' otherwise.
+dnl (application binary interface) is a 32-bit one, to 'no' if it is a 64-bit
+dnl one, or to 'unknown' if unknown.
 dnl This is a simplified variant of gl_HOST_CPU_C_ABI.
 AC_DEFUN([gl_HOST_CPU_C_ABI_32BIT],
 [
@@ -467,14 +468,44 @@ AC_DEFUN([gl_HOST_CPU_C_ABI_32BIT],
        case "$gl_cv_host_cpu_c_abi" in
          i386 | x86_64-x32 | arm | armhf | arm64-ilp32 | hppa | ia64-ilp32 | mips | mipsn32 | powerpc | riscv*-ilp32* | s390 | sparc)
            gl_cv_host_cpu_c_abi_32bit=yes ;;
-         *)
+         x86_64 | alpha | arm64 | hppa64 | ia64 | mips64 | powerpc64 | powerpc64-elfv2 | riscv*-lp64* | s390x | sparc64 )
            gl_cv_host_cpu_c_abi_32bit=no ;;
+         *)
+           gl_cv_host_cpu_c_abi_32bit=unknown ;;
        esac
      else
        case "$host_cpu" in
 
+         # CPUs that only support a 32-bit ABI.
+         arc \
+         | bfin \
+         | cris* \
+         | csky \
+         | epiphany \
+         | ft32 \
+         | h8300 \
+         | m68k \
+         | microblaze | microblazeel \
+         | nds32 | nds32le | nds32be \
+         | nios2 | nios2eb | nios2el \
+         | or1k* \
+         | or32 \
+         | sh | sh[1234] | sh[1234]e[lb] \
+         | tic6x \
+         | xtensa* )
+           gl_cv_host_cpu_c_abi_32bit=yes
+           ;;
+
+         # CPUs that only support a 64-bit ABI.
 changequote(,)dnl
-         i[4567]86 )
+         alpha | alphaev[4-8] | alphaev56 | alphapca5[67] | alphaev6[78] \
+         | mmix )
+changequote([,])dnl
+           gl_cv_host_cpu_c_abi_32bit=no
+           ;;
+
+changequote(,)dnl
+         i[34567]86 )
 changequote([,])dnl
            gl_cv_host_cpu_c_abi_32bit=yes
            ;;
@@ -634,7 +665,7 @@ changequote([,])dnl
            ;;
 
          *)
-           gl_cv_host_cpu_c_abi_32bit=no
+           gl_cv_host_cpu_c_abi_32bit=unknown
            ;;
        esac
      fi
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/iconv.m4 b/meta/recipes-core/gettext/gettext-minimal-0.20.2/aclocal/iconv.m4
similarity index 99%
rename from meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/iconv.m4
rename to meta/recipes-core/gettext/gettext-minimal-0.20.2/aclocal/iconv.m4
index a285e9daa5..e593b7270a 100644
--- a/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/iconv.m4
+++ b/meta/recipes-core/gettext/gettext-minimal-0.20.2/aclocal/iconv.m4
@@ -1,5 +1,5 @@
 # iconv.m4 serial 21
-dnl Copyright (C) 2000-2002, 2007-2014, 2016-2019 Free Software Foundation,
+dnl Copyright (C) 2000-2002, 2007-2014, 2016-2020 Free Software Foundation,
 dnl Inc.
 dnl This file is free software; the Free Software Foundation
 dnl gives unlimited permission to copy and/or distribute it,
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/intlmacosx.m4 b/meta/recipes-core/gettext/gettext-minimal-0.20.2/aclocal/intlmacosx.m4
similarity index 70%
rename from meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/intlmacosx.m4
rename to meta/recipes-core/gettext/gettext-minimal-0.20.2/aclocal/intlmacosx.m4
index 30e6f50e0a..ebd9937c1a 100644
--- a/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/intlmacosx.m4
+++ b/meta/recipes-core/gettext/gettext-minimal-0.20.2/aclocal/intlmacosx.m4
@@ -1,15 +1,15 @@
-# intlmacosx.m4 serial 6 (gettext-0.20)
-dnl Copyright (C) 2004-2014, 2016, 2019 Free Software Foundation, Inc.
+# intlmacosx.m4 serial 8 (gettext-0.20.2)
+dnl Copyright (C) 2004-2014, 2016, 2019-2020 Free Software Foundation, Inc.
 dnl This file is free software; the Free Software Foundation
 dnl gives unlimited permission to copy and/or distribute it,
 dnl with or without modifications, as long as this notice is preserved.
 dnl
 dnl This file can be used in projects which are not available under
-dnl the GNU General Public License or the GNU Library General Public
+dnl the GNU General Public License or the GNU Lesser General Public
 dnl License but which still want to provide support for the GNU gettext
 dnl functionality.
 dnl Please note that the actual code of the GNU gettext library is covered
-dnl by the GNU Library General Public License, and the rest of the GNU
+dnl by the GNU Lesser General Public License, and the rest of the GNU
 dnl gettext package is covered by the GNU General Public License.
 dnl They are *not* in the public domain.
 
@@ -33,21 +33,15 @@ AC_DEFUN([gt_INTL_MACOSX],
     AC_DEFINE([HAVE_CFPREFERENCESCOPYAPPVALUE], [1],
       [Define to 1 if you have the Mac OS X function CFPreferencesCopyAppValue in the CoreFoundation framework.])
   fi
-  dnl Check for API introduced in Mac OS X 10.5.
-  AC_CACHE_CHECK([for CFLocaleCopyCurrent], [gt_cv_func_CFLocaleCopyCurrent],
-    [gt_save_LIBS="$LIBS"
-     LIBS="$LIBS -Wl,-framework -Wl,CoreFoundation"
-     AC_LINK_IFELSE(
-       [AC_LANG_PROGRAM(
-          [[#include <CoreFoundation/CFLocale.h>]],
-          [[CFLocaleCopyCurrent();]])],
-       [gt_cv_func_CFLocaleCopyCurrent=yes],
-       [gt_cv_func_CFLocaleCopyCurrent=no])
-     LIBS="$gt_save_LIBS"])
-  if test $gt_cv_func_CFLocaleCopyCurrent = yes; then
-    AC_DEFINE([HAVE_CFLOCALECOPYCURRENT], [1],
-      [Define to 1 if you have the Mac OS X function CFLocaleCopyCurrent in the CoreFoundation framework.])
-  fi
+  dnl Don't check for the API introduced in Mac OS X 10.5, CFLocaleCopyCurrent,
+  dnl because in macOS 10.13.4 it has the following behaviour:
+  dnl When two or more languages are specified in the
+  dnl "System Preferences > Language & Region > Preferred Languages" panel,
+  dnl it returns en_CC where CC is the territory (even when English is not among
+  dnl the preferred languages!).  What we want instead is what
+  dnl CFLocaleCopyCurrent returned in earlier macOS releases and what
+  dnl CFPreferencesCopyAppValue still returns, namely ll_CC where ll is the
+  dnl first among the preferred languages and CC is the territory.
   AC_CACHE_CHECK([for CFLocaleCopyPreferredLanguages], [gt_cv_func_CFLocaleCopyPreferredLanguages],
     [gt_save_LIBS="$LIBS"
      LIBS="$LIBS -Wl,-framework -Wl,CoreFoundation"
@@ -64,7 +58,6 @@ AC_DEFUN([gt_INTL_MACOSX],
   fi
   INTL_MACOSX_LIBS=
   if test $gt_cv_func_CFPreferencesCopyAppValue = yes \
-     || test $gt_cv_func_CFLocaleCopyCurrent = yes \
      || test $gt_cv_func_CFLocaleCopyPreferredLanguages = yes; then
     INTL_MACOSX_LIBS="-Wl,-framework -Wl,CoreFoundation"
   fi
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/lib-ld.m4 b/meta/recipes-core/gettext/gettext-minimal-0.20.2/aclocal/lib-ld.m4
similarity index 98%
rename from meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/lib-ld.m4
rename to meta/recipes-core/gettext/gettext-minimal-0.20.2/aclocal/lib-ld.m4
index a18719630d..98c348faff 100644
--- a/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/lib-ld.m4
+++ b/meta/recipes-core/gettext/gettext-minimal-0.20.2/aclocal/lib-ld.m4
@@ -1,5 +1,5 @@
 # lib-ld.m4 serial 9
-dnl Copyright (C) 1996-2003, 2009-2019 Free Software Foundation, Inc.
+dnl Copyright (C) 1996-2003, 2009-2020 Free Software Foundation, Inc.
 dnl This file is free software; the Free Software Foundation
 dnl gives unlimited permission to copy and/or distribute it,
 dnl with or without modifications, as long as this notice is preserved.
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/lib-link.m4 b/meta/recipes-core/gettext/gettext-minimal-0.20.2/aclocal/lib-link.m4
similarity index 85%
rename from meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/lib-link.m4
rename to meta/recipes-core/gettext/gettext-minimal-0.20.2/aclocal/lib-link.m4
index 0ff10731fa..eecf70ec76 100644
--- a/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/lib-link.m4
+++ b/meta/recipes-core/gettext/gettext-minimal-0.20.2/aclocal/lib-link.m4
@@ -1,5 +1,5 @@
-# lib-link.m4 serial 28
-dnl Copyright (C) 2001-2019 Free Software Foundation, Inc.
+# lib-link.m4 serial 31
+dnl Copyright (C) 2001-2020 Free Software Foundation, Inc.
 dnl This file is free software; the Free Software Foundation
 dnl gives unlimited permission to copy and/or distribute it,
 dnl with or without modifications, as long as this notice is preserved.
@@ -192,6 +192,8 @@ AC_DEFUN([AC_LIB_LINKFLAGS_BODY],
   AC_LIB_WITH_FINAL_PREFIX([
     eval additional_includedir=\"$includedir\"
     eval additional_libdir=\"$libdir\"
+    eval additional_libdir2=\"$exec_prefix/$acl_libdirstem2\"
+    eval additional_libdir3=\"$exec_prefix/$acl_libdirstem3\"
   ])
   AC_ARG_WITH(PACK[-prefix],
 [[  --with-]]PACK[[-prefix[=DIR]  search for ]PACKLIBS[ in DIR/include and DIR/lib
@@ -204,17 +206,23 @@ AC_DEFUN([AC_LIB_LINKFLAGS_BODY],
         AC_LIB_WITH_FINAL_PREFIX([
           eval additional_includedir=\"$includedir\"
           eval additional_libdir=\"$libdir\"
+          eval additional_libdir2=\"$exec_prefix/$acl_libdirstem2\"
+          eval additional_libdir3=\"$exec_prefix/$acl_libdirstem3\"
         ])
       else
         additional_includedir="$withval/include"
         additional_libdir="$withval/$acl_libdirstem"
-        if test "$acl_libdirstem2" != "$acl_libdirstem" \
-           && test ! -d "$withval/$acl_libdirstem"; then
-          additional_libdir="$withval/$acl_libdirstem2"
-        fi
+        additional_libdir2="$withval/$acl_libdirstem2"
+        additional_libdir3="$withval/$acl_libdirstem3"
       fi
     fi
 ])
+  if test "X$additional_libdir2" = "X$additional_libdir"; then
+    additional_libdir2=
+  fi
+  if test "X$additional_libdir3" = "X$additional_libdir"; then
+    additional_libdir3=
+  fi
   dnl Search the library and its dependencies in $additional_libdir and
   dnl $LDFLAGS. Using breadth-first-seach.
   LIB[]NAME=
@@ -270,48 +278,54 @@ AC_DEFUN([AC_LIB_LINKFLAGS_BODY],
             shrext=
           fi
           if test $use_additional = yes; then
-            dir="$additional_libdir"
-            dnl The same code as in the loop below:
-            dnl First look for a shared library.
-            if test -n "$acl_shlibext"; then
-              if test -f "$dir/$libname$shrext"; then
-                found_dir="$dir"
-                found_so="$dir/$libname$shrext"
-              else
-                if test "$acl_library_names_spec" = '$libname$shrext$versuffix'; then
-                  ver=`(cd "$dir" && \
-                        for f in "$libname$shrext".*; do echo "$f"; done \
-                        | sed -e "s,^$libname$shrext\\\\.,," \
-                        | sort -t '.' -n -r -k1,1 -k2,2 -k3,3 -k4,4 -k5,5 \
-                        | sed 1q ) 2>/dev/null`
-                  if test -n "$ver" && test -f "$dir/$libname$shrext.$ver"; then
-                    found_dir="$dir"
-                    found_so="$dir/$libname$shrext.$ver"
+            for additional_libdir_variable in additional_libdir additional_libdir2 additional_libdir3; do
+              if test "X$found_dir" = "X"; then
+                eval dir=\$$additional_libdir_variable
+                if test -n "$dir"; then
+                  dnl The same code as in the loop below:
+                  dnl First look for a shared library.
+                  if test -n "$acl_shlibext"; then
+                    if test -f "$dir/$libname$shrext" && acl_is_expected_elfclass < "$dir/$libname$shrext"; then
+                      found_dir="$dir"
+                      found_so="$dir/$libname$shrext"
+                    else
+                      if test "$acl_library_names_spec" = '$libname$shrext$versuffix'; then
+                        ver=`(cd "$dir" && \
+                              for f in "$libname$shrext".*; do echo "$f"; done \
+                              | sed -e "s,^$libname$shrext\\\\.,," \
+                              | sort -t '.' -n -r -k1,1 -k2,2 -k3,3 -k4,4 -k5,5 \
+                              | sed 1q ) 2>/dev/null`
+                        if test -n "$ver" && test -f "$dir/$libname$shrext.$ver" && acl_is_expected_elfclass < "$dir/$libname$shrext.$ver"; then
+                          found_dir="$dir"
+                          found_so="$dir/$libname$shrext.$ver"
+                        fi
+                      else
+                        eval library_names=\"$acl_library_names_spec\"
+                        for f in $library_names; do
+                          if test -f "$dir/$f" && acl_is_expected_elfclass < "$dir/$f"; then
+                            found_dir="$dir"
+                            found_so="$dir/$f"
+                            break
+                          fi
+                        done
+                      fi
+                    fi
                   fi
-                else
-                  eval library_names=\"$acl_library_names_spec\"
-                  for f in $library_names; do
-                    if test -f "$dir/$f"; then
+                  dnl Then look for a static library.
+                  if test "X$found_dir" = "X"; then
+                    if test -f "$dir/$libname.$acl_libext" && ${AR-ar} -p "$dir/$libname.$acl_libext" | acl_is_expected_elfclass; then
                       found_dir="$dir"
-                      found_so="$dir/$f"
-                      break
+                      found_a="$dir/$libname.$acl_libext"
                     fi
-                  done
+                  fi
+                  if test "X$found_dir" != "X"; then
+                    if test -f "$dir/$libname.la"; then
+                      found_la="$dir/$libname.la"
+                    fi
+                  fi
                 fi
               fi
-            fi
-            dnl Then look for a static library.
-            if test "X$found_dir" = "X"; then
-              if test -f "$dir/$libname.$acl_libext"; then
-                found_dir="$dir"
-                found_a="$dir/$libname.$acl_libext"
-              fi
-            fi
-            if test "X$found_dir" != "X"; then
-              if test -f "$dir/$libname.la"; then
-                found_la="$dir/$libname.la"
-              fi
-            fi
+            done
           fi
           if test "X$found_dir" = "X"; then
             for x in $LDFLAGS $LTLIB[]NAME; do
@@ -321,7 +335,7 @@ AC_DEFUN([AC_LIB_LINKFLAGS_BODY],
                   dir=`echo "X$x" | sed -e 's/^X-L//'`
                   dnl First look for a shared library.
                   if test -n "$acl_shlibext"; then
-                    if test -f "$dir/$libname$shrext"; then
+                    if test -f "$dir/$libname$shrext" && acl_is_expected_elfclass < "$dir/$libname$shrext"; then
                       found_dir="$dir"
                       found_so="$dir/$libname$shrext"
                     else
@@ -331,14 +345,14 @@ AC_DEFUN([AC_LIB_LINKFLAGS_BODY],
                               | sed -e "s,^$libname$shrext\\\\.,," \
                               | sort -t '.' -n -r -k1,1 -k2,2 -k3,3 -k4,4 -k5,5 \
                               | sed 1q ) 2>/dev/null`
-                        if test -n "$ver" && test -f "$dir/$libname$shrext.$ver"; then
+                        if test -n "$ver" && test -f "$dir/$libname$shrext.$ver" && acl_is_expected_elfclass < "$dir/$libname$shrext.$ver"; then
                           found_dir="$dir"
                           found_so="$dir/$libname$shrext.$ver"
                         fi
                       else
                         eval library_names=\"$acl_library_names_spec\"
                         for f in $library_names; do
-                          if test -f "$dir/$f"; then
+                          if test -f "$dir/$f" && acl_is_expected_elfclass < "$dir/$f"; then
                             found_dir="$dir"
                             found_so="$dir/$f"
                             break
@@ -349,7 +363,7 @@ AC_DEFUN([AC_LIB_LINKFLAGS_BODY],
                   fi
                   dnl Then look for a static library.
                   if test "X$found_dir" = "X"; then
-                    if test -f "$dir/$libname.$acl_libext"; then
+                    if test -f "$dir/$libname.$acl_libext" && ${AR-ar} -p "$dir/$libname.$acl_libext" | acl_is_expected_elfclass; then
                       found_dir="$dir"
                       found_a="$dir/$libname.$acl_libext"
                     fi
@@ -375,7 +389,8 @@ AC_DEFUN([AC_LIB_LINKFLAGS_BODY],
               dnl standard /usr/lib.
               if test "$enable_rpath" = no \
                  || test "X$found_dir" = "X/usr/$acl_libdirstem" \
-                 || test "X$found_dir" = "X/usr/$acl_libdirstem2"; then
+                 || test "X$found_dir" = "X/usr/$acl_libdirstem2" \
+                 || test "X$found_dir" = "X/usr/$acl_libdirstem3"; then
                 dnl No hardcoding is needed.
                 LIB[]NAME="${LIB[]NAME}${LIB[]NAME:+ }$found_so"
               else
@@ -475,6 +490,13 @@ AC_DEFUN([AC_LIB_LINKFLAGS_BODY],
                 fi
                 additional_includedir="$basedir/include"
                 ;;
+              */$acl_libdirstem3 | */$acl_libdirstem3/)
+                basedir=`echo "X$found_dir" | sed -e 's,^X,,' -e "s,/$acl_libdirstem3/"'*$,,'`
+                if test "$name" = '$1'; then
+                  LIB[]NAME[]_PREFIX="$basedir"
+                fi
+                additional_includedir="$basedir/include"
+                ;;
             esac
             if test "X$additional_includedir" != "X"; then
               dnl Potentially add $additional_includedir to $INCNAME.
@@ -525,19 +547,21 @@ AC_DEFUN([AC_LIB_LINKFLAGS_BODY],
               for dep in $dependency_libs; do
                 case "$dep" in
                   -L*)
-                    additional_libdir=`echo "X$dep" | sed -e 's/^X-L//'`
-                    dnl Potentially add $additional_libdir to $LIBNAME and $LTLIBNAME.
+                    dependency_libdir=`echo "X$dep" | sed -e 's/^X-L//'`
+                    dnl Potentially add $dependency_libdir to $LIBNAME and $LTLIBNAME.
                     dnl But don't add it
                     dnl   1. if it's the standard /usr/lib,
                     dnl   2. if it's /usr/local/lib and we are using GCC on Linux,
                     dnl   3. if it's already present in $LDFLAGS or the already
                     dnl      constructed $LIBNAME,
                     dnl   4. if it doesn't exist as a directory.
-                    if test "X$additional_libdir" != "X/usr/$acl_libdirstem" \
-                       && test "X$additional_libdir" != "X/usr/$acl_libdirstem2"; then
+                    if test "X$dependency_libdir" != "X/usr/$acl_libdirstem" \
+                       && test "X$dependency_libdir" != "X/usr/$acl_libdirstem2" \
+                       && test "X$dependency_libdir" != "X/usr/$acl_libdirstem3"; then
                       haveit=
-                      if test "X$additional_libdir" = "X/usr/local/$acl_libdirstem" \
-                         || test "X$additional_libdir" = "X/usr/local/$acl_libdirstem2"; then
+                      if test "X$dependency_libdir" = "X/usr/local/$acl_libdirstem" \
+                         || test "X$dependency_libdir" = "X/usr/local/$acl_libdirstem2" \
+                         || test "X$dependency_libdir" = "X/usr/local/$acl_libdirstem3"; then
                         if test -n "$GCC"; then
                           case $host_os in
                             linux* | gnu* | k*bsd*-gnu) haveit=yes;;
@@ -548,29 +572,29 @@ AC_DEFUN([AC_LIB_LINKFLAGS_BODY],
                         haveit=
                         for x in $LDFLAGS $LIB[]NAME; do
                           AC_LIB_WITH_FINAL_PREFIX([eval x=\"$x\"])
-                          if test "X$x" = "X-L$additional_libdir"; then
+                          if test "X$x" = "X-L$dependency_libdir"; then
                             haveit=yes
                             break
                           fi
                         done
                         if test -z "$haveit"; then
-                          if test -d "$additional_libdir"; then
-                            dnl Really add $additional_libdir to $LIBNAME.
-                            LIB[]NAME="${LIB[]NAME}${LIB[]NAME:+ }-L$additional_libdir"
+                          if test -d "$dependency_libdir"; then
+                            dnl Really add $dependency_libdir to $LIBNAME.
+                            LIB[]NAME="${LIB[]NAME}${LIB[]NAME:+ }-L$dependency_libdir"
                           fi
                         fi
                         haveit=
                         for x in $LDFLAGS $LTLIB[]NAME; do
                           AC_LIB_WITH_FINAL_PREFIX([eval x=\"$x\"])
-                          if test "X$x" = "X-L$additional_libdir"; then
+                          if test "X$x" = "X-L$dependency_libdir"; then
                             haveit=yes
                             break
                           fi
                         done
                         if test -z "$haveit"; then
-                          if test -d "$additional_libdir"; then
-                            dnl Really add $additional_libdir to $LTLIBNAME.
-                            LTLIB[]NAME="${LTLIB[]NAME}${LTLIB[]NAME:+ }-L$additional_libdir"
+                          if test -d "$dependency_libdir"; then
+                            dnl Really add $dependency_libdir to $LTLIBNAME.
+                            LTLIB[]NAME="${LTLIB[]NAME}${LTLIB[]NAME:+ }-L$dependency_libdir"
                           fi
                         fi
                       fi
@@ -718,7 +742,8 @@ AC_DEFUN([AC_LIB_LINKFLAGS_FROM_LIBS],
           dir="$next"
           dnl No need to hardcode the standard /usr/lib.
           if test "X$dir" != "X/usr/$acl_libdirstem" \
-             && test "X$dir" != "X/usr/$acl_libdirstem2"; then
+             && test "X$dir" != "X/usr/$acl_libdirstem2" \
+             && test "X$dir" != "X/usr/$acl_libdirstem3"; then
             rpathdirs="$rpathdirs $dir"
           fi
           next=
@@ -728,7 +753,8 @@ AC_DEFUN([AC_LIB_LINKFLAGS_FROM_LIBS],
             -L*) dir=`echo "X$opt" | sed -e 's,^X-L,,'`
                  dnl No need to hardcode the standard /usr/lib.
                  if test "X$dir" != "X/usr/$acl_libdirstem" \
-                    && test "X$dir" != "X/usr/$acl_libdirstem2"; then
+                    && test "X$dir" != "X/usr/$acl_libdirstem2" \
+                    && test "X$dir" != "X/usr/$acl_libdirstem3"; then
                    rpathdirs="$rpathdirs $dir"
                  fi
                  next= ;;
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/lib-prefix.m4 b/meta/recipes-core/gettext/gettext-minimal-0.20.2/aclocal/lib-prefix.m4
similarity index 54%
rename from meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/lib-prefix.m4
rename to meta/recipes-core/gettext/gettext-minimal-0.20.2/aclocal/lib-prefix.m4
index 8adb17bb91..c8a0b464c2 100644
--- a/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/lib-prefix.m4
+++ b/meta/recipes-core/gettext/gettext-minimal-0.20.2/aclocal/lib-prefix.m4
@@ -1,5 +1,5 @@
-# lib-prefix.m4 serial 14
-dnl Copyright (C) 2001-2005, 2008-2019 Free Software Foundation, Inc.
+# lib-prefix.m4 serial 17
+dnl Copyright (C) 2001-2005, 2008-2020 Free Software Foundation, Inc.
 dnl This file is free software; the Free Software Foundation
 dnl gives unlimited permission to copy and/or distribute it,
 dnl with or without modifications, as long as this notice is preserved.
@@ -147,21 +147,24 @@ AC_DEFUN([AC_LIB_WITH_FINAL_PREFIX],
 ])
 
 dnl AC_LIB_PREPARE_MULTILIB creates
-dnl - a variable acl_libdirstem, containing the basename of the libdir, either
-dnl   "lib" or "lib64" or "lib/64",
-dnl - a variable acl_libdirstem2, as a secondary possible value for
-dnl   acl_libdirstem, either the same as acl_libdirstem or "lib/sparcv9" or
-dnl   "lib/amd64".
+dnl - a function acl_is_expected_elfclass, that tests whether standard input
+dn;   has a 32-bit or 64-bit ELF header, depending on the host CPU ABI,
+dnl - 3 variables acl_libdirstem, acl_libdirstem2, acl_libdirstem3, containing
+dnl   the basename of the libdir to try in turn, either "lib" or "lib64" or
+dnl   "lib/64" or "lib32" or "lib/sparcv9" or "lib/amd64" or similar.
 AC_DEFUN([AC_LIB_PREPARE_MULTILIB],
 [
-  dnl There is no formal standard regarding lib and lib64.
-  dnl On glibc systems, the current practice is that on a system supporting
+  dnl There is no formal standard regarding lib, lib32, and lib64.
+  dnl On most glibc systems, the current practice is that on a system supporting
   dnl 32-bit and 64-bit instruction sets or ABIs, 64-bit libraries go under
-  dnl $prefix/lib64 and 32-bit libraries go under $prefix/lib. We determine
-  dnl the compiler's default mode by looking at the compiler's library search
-  dnl path. If at least one of its elements ends in /lib64 or points to a
-  dnl directory whose absolute pathname ends in /lib64, we assume a 64-bit ABI.
-  dnl Otherwise we use the default, namely "lib".
+  dnl $prefix/lib64 and 32-bit libraries go under $prefix/lib. However, on
+  dnl Arch Linux based distributions, it's the opposite: 32-bit libraries go
+  dnl under $prefix/lib32 and 64-bit libraries go under $prefix/lib.
+  dnl We determine the compiler's default mode by looking at the compiler's
+  dnl library search path. If at least one of its elements ends in /lib64 or
+  dnl points to a directory whose absolute pathname ends in /lib64, we use that
+  dnl for 64-bit ABIs. Similarly for 32-bit ABIs. Otherwise we use the default,
+  dnl namely "lib".
   dnl On Solaris systems, the current practice is that on a system supporting
   dnl 32-bit and 64-bit instruction sets or ABIs, 64-bit libraries go under
   dnl $prefix/lib/64 (which is a symlink to either $prefix/lib/sparcv9 or
@@ -169,27 +172,72 @@ AC_DEFUN([AC_LIB_PREPARE_MULTILIB],
   AC_REQUIRE([AC_CANONICAL_HOST])
   AC_REQUIRE([gl_HOST_CPU_C_ABI_32BIT])
 
-  case "$host_os" in
-    solaris*)
-      AC_CACHE_CHECK([for 64-bit host], [gl_cv_solaris_64bit],
-        [AC_COMPILE_IFELSE(
-           [AC_LANG_SOURCE(
-              [[#ifdef _LP64
-                 int ok;
-                #else
-                 error fail
-                #endif
-              ]])],
-           [gl_cv_solaris_64bit=yes],
-           [gl_cv_solaris_64bit=no])
-        ]);;
-  esac
+  AC_CACHE_CHECK([for ELF binary format], [gl_cv_elf],
+    [AC_EGREP_CPP([Extensible Linking Format],
+       [#ifdef __ELF__
+        Extensible Linking Format
+        #endif
+       ],
+       [gl_cv_elf=yes],
+       [gl_cv_elf=no])
+     ])
+  if test $gl_cv_elf; then
+    # Extract the ELF class of a file (5th byte) in decimal.
+    # Cf. https://en.wikipedia.org/wiki/Executable_and_Linkable_Format#File_header
+    if od -A x < /dev/null >/dev/null 2>/dev/null; then
+      # Use POSIX od.
+      func_elfclass ()
+      {
+        od -A n -t d1 -j 4 -N 1
+      }
+    else
+      # Use BSD hexdump.
+      func_elfclass ()
+      {
+        dd bs=1 count=1 skip=4 2>/dev/null | hexdump -e '1/1 "%3d "'
+        echo
+      }
+    fi
+changequote(,)dnl
+    case $HOST_CPU_C_ABI_32BIT in
+      yes)
+        # 32-bit ABI.
+        acl_is_expected_elfclass ()
+        {
+          test "`func_elfclass | sed -e 's/[ 	]//g'`" = 1
+        }
+        ;;
+      no)
+        # 64-bit ABI.
+        acl_is_expected_elfclass ()
+        {
+          test "`func_elfclass | sed -e 's/[ 	]//g'`" = 2
+        }
+        ;;
+      *)
+        # Unknown.
+        acl_is_expected_elfclass ()
+        {
+          :
+        }
+        ;;
+    esac
+changequote([,])dnl
+  else
+    acl_is_expected_elfclass ()
+    {
+      :
+    }
+  fi
 
   dnl Allow the user to override the result by setting acl_cv_libdirstems.
   AC_CACHE_CHECK([for the common suffixes of directories in the library search path],
     [acl_cv_libdirstems],
-    [acl_libdirstem=lib
+    [dnl Try 'lib' first, because that's the default for libdir in GNU, see
+     dnl <https://www.gnu.org/prep/standards/html_node/Directory-Variables.html>.
+     acl_libdirstem=lib
      acl_libdirstem2=
+     acl_libdirstem3=
      case "$host_os" in
        solaris*)
          dnl See Solaris 10 Software Developer Collection > Solaris 64-bit Developer's Guide > The Development Environment
@@ -197,53 +245,76 @@ AC_DEFUN([AC_LIB_PREPARE_MULTILIB],
          dnl "Portable Makefiles should refer to any library directories using the 64 symbolic link."
          dnl But we want to recognize the sparcv9 or amd64 subdirectory also if the
          dnl symlink is missing, so we set acl_libdirstem2 too.
-         if test $gl_cv_solaris_64bit = yes; then
-           acl_libdirstem=lib/64
+         if test $HOST_CPU_C_ABI_32BIT = no; then
+           acl_libdirstem2=lib/64
            case "$host_cpu" in
-             sparc*)        acl_libdirstem2=lib/sparcv9 ;;
-             i*86 | x86_64) acl_libdirstem2=lib/amd64 ;;
+             sparc*)        acl_libdirstem3=lib/sparcv9 ;;
+             i*86 | x86_64) acl_libdirstem3=lib/amd64 ;;
            esac
          fi
          ;;
        *)
          dnl If $CC generates code for a 32-bit ABI, the libraries are
-         dnl surely under $prefix/lib, not $prefix/lib64.
-         if test "$HOST_CPU_C_ABI_32BIT" != yes; then
-           dnl The result is a property of the system. However, non-system
-           dnl compilers sometimes have odd library search paths. Therefore
-           dnl prefer asking /usr/bin/gcc, if available, rather than $CC.
-           searchpath=`(if test -f /usr/bin/gcc \
-                           && LC_ALL=C /usr/bin/gcc -print-search-dirs >/dev/null 2>/dev/null; then \
-                          LC_ALL=C /usr/bin/gcc -print-search-dirs; \
-                        else \
-                          LC_ALL=C $CC -print-search-dirs; \
-                        fi) 2>/dev/null \
-                       | sed -n -e 's,^libraries: ,,p' | sed -e 's,^=,,'`
-           if test -n "$searchpath"; then
-             acl_save_IFS="${IFS= 	}"; IFS=":"
-             for searchdir in $searchpath; do
-               if test -d "$searchdir"; then
-                 case "$searchdir" in
-                   */lib64/ | */lib64 ) acl_libdirstem=lib64 ;;
-                   */../ | */.. )
-                     # Better ignore directories of this form. They are misleading.
-                     ;;
-                   *) searchdir=`cd "$searchdir" && pwd`
-                      case "$searchdir" in
-                        */lib64 ) acl_libdirstem=lib64 ;;
-                      esac ;;
-                 esac
-               fi
-             done
-             IFS="$acl_save_IFS"
+         dnl surely under $prefix/lib or $prefix/lib32, not $prefix/lib64.
+         dnl Similarly, if $CC generates code for a 64-bit ABI, the libraries
+         dnl are surely under $prefix/lib or $prefix/lib64, not $prefix/lib32.
+         dnl Find the compiler's search path. However, non-system compilers
+         dnl sometimes have odd library search paths. But we can't simply invoke
+         dnl '/usr/bin/gcc -print-search-dirs' because that would not take into
+         dnl account the -m32/-m31 or -m64 options from the $CC or $CFLAGS.
+         searchpath=`(LC_ALL=C $CC $CPPFLAGS $CFLAGS -print-search-dirs) 2>/dev/null \
+                     | sed -n -e 's,^libraries: ,,p' | sed -e 's,^=,,'`
+         if test $HOST_CPU_C_ABI_32BIT != no; then
+           # 32-bit or unknown ABI.
+           if test -d /usr/lib32; then
+             acl_libdirstem2=lib32
+           fi
+         fi
+         if test $HOST_CPU_C_ABI_32BIT != yes; then
+           # 64-bit or unknown ABI.
+           if test -d /usr/lib64; then
+             acl_libdirstem3=lib64
+           fi
+         fi
+         if test -n "$searchpath"; then
+           acl_save_IFS="${IFS= 	}"; IFS=":"
+           for searchdir in $searchpath; do
+             if test -d "$searchdir"; then
+               case "$searchdir" in
+                 */lib32/ | */lib32 ) acl_libdirstem2=lib32 ;;
+                 */lib64/ | */lib64 ) acl_libdirstem3=lib64 ;;
+                 */../ | */.. )
+                   # Better ignore directories of this form. They are misleading.
+                   ;;
+                 *) searchdir=`cd "$searchdir" && pwd`
+                    case "$searchdir" in
+                      */lib32 ) acl_libdirstem2=lib32 ;;
+                      */lib64 ) acl_libdirstem3=lib64 ;;
+                    esac ;;
+               esac
+             fi
+           done
+           IFS="$acl_save_IFS"
+           if test $HOST_CPU_C_ABI_32BIT = yes; then
+             # 32-bit ABI.
+             acl_libdirstem3=
+           fi
+           if test $HOST_CPU_C_ABI_32BIT = no; then
+             # 64-bit ABI.
+             acl_libdirstem2=
            fi
          fi
          ;;
      esac
      test -n "$acl_libdirstem2" || acl_libdirstem2="$acl_libdirstem"
-     acl_cv_libdirstems="$acl_libdirstem,$acl_libdirstem2"
+     test -n "$acl_libdirstem3" || acl_libdirstem3="$acl_libdirstem"
+     acl_cv_libdirstems="$acl_libdirstem,$acl_libdirstem2,$acl_libdirstem3"
     ])
-  # Decompose acl_cv_libdirstems into acl_libdirstem and acl_libdirstem2.
+  dnl Decompose acl_cv_libdirstems into acl_libdirstem, acl_libdirstem2, and
+  dnl acl_libdirstem3.
+changequote(,)dnl
   acl_libdirstem=`echo "$acl_cv_libdirstems" | sed -e 's/,.*//'`
-  acl_libdirstem2=`echo "$acl_cv_libdirstems" | sed -e '/,/s/.*,//'`
+  acl_libdirstem2=`echo "$acl_cv_libdirstems" | sed -e 's/^[^,]*,//' -e 's/,.*//'`
+  acl_libdirstem3=`echo "$acl_cv_libdirstems" | sed -e 's/^[^,]*,[^,]*,//' -e 's/,.*//'`
+changequote([,])dnl
 ])
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/nls.m4 b/meta/recipes-core/gettext/gettext-minimal-0.20.2/aclocal/nls.m4
similarity index 77%
rename from meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/nls.m4
rename to meta/recipes-core/gettext/gettext-minimal-0.20.2/aclocal/nls.m4
index b62f614857..5a506fc4b5 100644
--- a/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/nls.m4
+++ b/meta/recipes-core/gettext/gettext-minimal-0.20.2/aclocal/nls.m4
@@ -1,16 +1,16 @@
-# nls.m4 serial 5 (gettext-0.18)
-dnl Copyright (C) 1995-2003, 2005-2006, 2008-2014, 2016, 2019 Free Software
-dnl Foundation, Inc.
+# nls.m4 serial 6 (gettext-0.20.2)
+dnl Copyright (C) 1995-2003, 2005-2006, 2008-2014, 2016, 2019-2020 Free
+dnl Software Foundation, Inc.
 dnl This file is free software; the Free Software Foundation
 dnl gives unlimited permission to copy and/or distribute it,
 dnl with or without modifications, as long as this notice is preserved.
 dnl
 dnl This file can be used in projects which are not available under
-dnl the GNU General Public License or the GNU Library General Public
+dnl the GNU General Public License or the GNU Lesser General Public
 dnl License but which still want to provide support for the GNU gettext
 dnl functionality.
 dnl Please note that the actual code of the GNU gettext library is covered
-dnl by the GNU Library General Public License, and the rest of the GNU
+dnl by the GNU Lesser General Public License, and the rest of the GNU
 dnl gettext package is covered by the GNU General Public License.
 dnl They are *not* in the public domain.
 
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/po.m4 b/meta/recipes-core/gettext/gettext-minimal-0.20.2/aclocal/po.m4
similarity index 98%
rename from meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/po.m4
rename to meta/recipes-core/gettext/gettext-minimal-0.20.2/aclocal/po.m4
index 143792dba5..3778fd7aac 100644
--- a/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/po.m4
+++ b/meta/recipes-core/gettext/gettext-minimal-0.20.2/aclocal/po.m4
@@ -1,15 +1,15 @@
-# po.m4 serial 30 (gettext-0.20)
-dnl Copyright (C) 1995-2014, 2016, 2018-2019 Free Software Foundation, Inc.
+# po.m4 serial 31 (gettext-0.20.2)
+dnl Copyright (C) 1995-2014, 2016, 2018-2020 Free Software Foundation, Inc.
 dnl This file is free software; the Free Software Foundation
 dnl gives unlimited permission to copy and/or distribute it,
 dnl with or without modifications, as long as this notice is preserved.
 dnl
 dnl This file can be used in projects which are not available under
-dnl the GNU General Public License or the GNU Library General Public
+dnl the GNU General Public License or the GNU Lesser General Public
 dnl License but which still want to provide support for the GNU gettext
 dnl functionality.
 dnl Please note that the actual code of the GNU gettext library is covered
-dnl by the GNU Library General Public License, and the rest of the GNU
+dnl by the GNU Lesser General Public License, and the rest of the GNU
 dnl gettext package is covered by the GNU General Public License.
 dnl They are *not* in the public domain.
 
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/progtest.m4 b/meta/recipes-core/gettext/gettext-minimal-0.20.2/aclocal/progtest.m4
similarity index 92%
rename from meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/progtest.m4
rename to meta/recipes-core/gettext/gettext-minimal-0.20.2/aclocal/progtest.m4
index 5f186b1490..f28010aed1 100644
--- a/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/progtest.m4
+++ b/meta/recipes-core/gettext/gettext-minimal-0.20.2/aclocal/progtest.m4
@@ -1,15 +1,15 @@
-# progtest.m4 serial 7 (gettext-0.18.2)
-dnl Copyright (C) 1996-2003, 2005, 2008-2019 Free Software Foundation, Inc.
+# progtest.m4 serial 8 (gettext-0.20.2)
+dnl Copyright (C) 1996-2003, 2005, 2008-2020 Free Software Foundation, Inc.
 dnl This file is free software; the Free Software Foundation
 dnl gives unlimited permission to copy and/or distribute it,
 dnl with or without modifications, as long as this notice is preserved.
 dnl
 dnl This file can be used in projects which are not available under
-dnl the GNU General Public License or the GNU Library General Public
+dnl the GNU General Public License or the GNU Lesser General Public
 dnl License but which still want to provide support for the GNU gettext
 dnl functionality.
 dnl Please note that the actual code of the GNU gettext library is covered
-dnl by the GNU Library General Public License, and the rest of the GNU
+dnl by the GNU Lesser General Public License, and the rest of the GNU
 dnl gettext package is covered by the GNU General Public License.
 dnl They are *not* in the public domain.
 
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.20.1/config.rpath b/meta/recipes-core/gettext/gettext-minimal-0.20.2/config.rpath
similarity index 99%
rename from meta/recipes-core/gettext/gettext-minimal-0.20.1/config.rpath
rename to meta/recipes-core/gettext/gettext-minimal-0.20.2/config.rpath
index be202c1a9e..24be79cfb6 100755
--- a/meta/recipes-core/gettext/gettext-minimal-0.20.1/config.rpath
+++ b/meta/recipes-core/gettext/gettext-minimal-0.20.2/config.rpath
@@ -2,7 +2,7 @@
 # Output a system dependent set of variables, describing how to set the
 # run time search path of shared libraries in an executable.
 #
-#   Copyright 1996-2019 Free Software Foundation, Inc.
+#   Copyright 1996-2020 Free Software Foundation, Inc.
 #   Taken from GNU libtool, 2001
 #   Originally by Gordon Matzigkeit <gord@gnu.ai.mit.edu>, 1996
 #
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.20.1/remove-potcdate.sin b/meta/recipes-core/gettext/gettext-minimal-0.20.2/remove-potcdate.sin
similarity index 100%
rename from meta/recipes-core/gettext/gettext-minimal-0.20.1/remove-potcdate.sin
rename to meta/recipes-core/gettext/gettext-minimal-0.20.2/remove-potcdate.sin
diff --git a/meta/recipes-core/gettext/gettext-minimal-native_0.20.1.bb b/meta/recipes-core/gettext/gettext-minimal-native_0.20.2.bb
similarity index 100%
rename from meta/recipes-core/gettext/gettext-minimal-native_0.20.1.bb
rename to meta/recipes-core/gettext/gettext-minimal-native_0.20.2.bb
diff --git a/meta/recipes-core/gettext/gettext_0.20.1.bb b/meta/recipes-core/gettext/gettext_0.20.2.bb
similarity index 96%
rename from meta/recipes-core/gettext/gettext_0.20.1.bb
rename to meta/recipes-core/gettext/gettext_0.20.2.bb
index 85493e7595..fda11c44cc 100644
--- a/meta/recipes-core/gettext/gettext_0.20.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.20.2.bb
@@ -19,16 +19,14 @@ RCONFLICTS_${PN} = "proxy-libintl"
 SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \
            file://parallel.patch \
            file://add-with-bisonlocaledir.patch \
-           file://cr-statement.c-timsort.h-fix-formatting-issues.patch \
            file://use-pkgconfig.patch \
            file://run-ptest \
            file://serial-tests-config.patch \
-           file://0001-msgmerge-Fix-behaviour-of-for-msgfmt-on-PO-files-wit.patch \
            file://0001-tests-autopoint-3-unset-MAKEFLAGS.patch \
            file://0001-init-env.in-do-not-add-C-CXX-parameters.patch \
            "
-SRC_URI[md5sum] = "bb5b0c0caa028105f3ca1905ddc306e2"
-SRC_URI[sha256sum] = "66415634c6e8c3fa8b71362879ec7575e27da43da562c798a8a2f223e6e47f5c"
+SRC_URI[md5sum] = "30fec34a895fab4c02584449c500aac2"
+SRC_URI[sha256sum] = "ecb9d0908ca41d5ca5fef974323b3bba6bec19eebba0b44f396de98cfcc089f1"
 
 inherit autotools texinfo pkgconfig ptest
 
@@ -132,7 +130,7 @@ do_install_append_class-native () {
 	rm ${D}${datadir}/gettext/po/remove-potcdate.sin
 
         create_wrapper ${D}${bindir}/msgfmt \
-                GETTEXTDATADIR="${STAGING_DATADIR_NATIVE}/gettext-0.20/"
+                GETTEXTDATADIR="${STAGING_DATADIR_NATIVE}/gettext-0.20.2/"
 
 }
 
-- 
2.26.2

