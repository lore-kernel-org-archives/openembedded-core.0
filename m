Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3C52EB64D7
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 13:29:17 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web10.16239.1687958953430315990
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jun 2023 06:29:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=EZBJD3+E;
 spf=pass (domain: gmail.com, ip: 209.85.160.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-19a427d7b57so3889394fac.2
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 06:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687958952; x=1690550952;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6CKsKrrHQ6WRdpzQtb3kDODHRzFcXrDhJXgqiD+qi8I=;
        b=EZBJD3+ENb9Q63Ue+uTvYp0D+1X2CCJ1HKXG1QuQza7id0XxMNyphgZqB/k5w05Tcp
         H9n6Fn0ZxMbYt24Z0Xrv7syXt/DQLsAvtYvi2gNujFFiOy5lfEmUyFB6r2A2F7HSEuTg
         EdshmYKu01GE5wVcQqLxnaXu1uSnvi5wkZl2tilkJvBVBQcFoGQR/oC1gxbkQTSqzJgG
         iWagR9aCu//2xbvOCM4kMGn3o/WzDMxhvPthzOiv2kEm+mOKg3uhs/OBLx9lEO4w3qLs
         VGhxWfqvln0CukgjBYb3EScIW3fNeVmowt3LBECHJj4zQdY3YvsXFOxegu2Q97keBO8c
         Stbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687958952; x=1690550952;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6CKsKrrHQ6WRdpzQtb3kDODHRzFcXrDhJXgqiD+qi8I=;
        b=N9wS5z7TVvzeyicxFABNqGu0VAS3VsgDtOZ9QmCE6t0knh7VKWVbLQvA134sTJ6p1o
         vnYOeuD9DTCK347J5C5QihpfBmfnNNNQd8reePKfBpdqq/LlWg0lhzHBolHA23GYVM2i
         IHkiLDTPgmqt158R3A9I9iwkCfoCUDFAkQPrDX9zfjYSm04oTIhZ6Bmqktt8Zw48zYNM
         stBqRqyBTB+uzbF3SYjEkMhSEoGmWzuUE0oRFvFNasc6OjPnM6Q4ypjLjru5caECdquN
         I7H3fsyMi2XlxVspz1vNAIYapM1zusnaItqOG1OCKzxxZVGR8HK52GcgYQ+nLOsd1nhM
         8gkA==
X-Gm-Message-State: AC+VfDzYg4HzIxEHCER0Rwxevxrzase54t76QxnpSqU7dkKLW1Gh8OqN
	wPo6oRKxbnQIsESpfyYViRV2zvpgUV1aY35e0TKDbOguYzhHJQ==
X-Google-Smtp-Source: ACHHUZ7ruuRTLftPugY8AulqsxMmFk/Tp9WYCahV0JQ7y0dVsWG0dKEg84Y5oj9SzsaEf//OBvW88QqEe/kgmJrca/Y=
X-Received: by 2002:a05:6870:e742:b0:18e:e0bc:829 with SMTP id
 t2-20020a056870e74200b0018ee0bc0829mr21117160oak.17.1687958952372; Wed, 28
 Jun 2023 06:29:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230625212241.915739-1-alex@linutronix.de> <20230625212241.915739-2-alex@linutronix.de>
In-Reply-To: <20230625212241.915739-2-alex@linutronix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 28 Jun 2023 15:28:46 +0200
Message-ID: <CAMKF1sp_7DzMEJZDk5vviBHZ_DYzWv+tDW9TfzJ3aqPcfeNBvA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 02/21] libxml2: update 2.10.4 -> 2.11.4
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 13:29:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183553

I wonder if this is the cause of failure for raptor2 and pidgin-sipe
as seen here

https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/2856/step=
s/14/logs/stdio

On Sun, Jun 25, 2023 at 11:22=E2=80=AFPM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Drop backports.
>
> Drop libxml-64bit.patch
> (no longer necessary).
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  .../libxml/libxml2/fix-tests.patch            | 222 ------------------
>  .../libxml/libxml2/install-tests.patch        |  17 +-
>  .../libxml/libxml2/libxml-64bit.patch         |  28 ---
>  .../libxml2/libxml-m4-use-pkgconfig.patch     | 212 -----------------
>  .../{libxml2_2.10.4.bb =3D> libxml2_2.11.4.bb}  |   5 +-
>  5 files changed, 8 insertions(+), 476 deletions(-)
>  delete mode 100644 meta/recipes-core/libxml/libxml2/fix-tests.patch
>  delete mode 100644 meta/recipes-core/libxml/libxml2/libxml-64bit.patch
>  delete mode 100644 meta/recipes-core/libxml/libxml2/libxml-m4-use-pkgcon=
fig.patch
>  rename meta/recipes-core/libxml/{libxml2_2.10.4.bb =3D> libxml2_2.11.4.b=
b} (95%)
>
> diff --git a/meta/recipes-core/libxml/libxml2/fix-tests.patch b/meta/reci=
pes-core/libxml/libxml2/fix-tests.patch
> deleted file mode 100644
> index 80678efcfee..00000000000
> --- a/meta/recipes-core/libxml/libxml2/fix-tests.patch
> +++ /dev/null
> @@ -1,222 +0,0 @@
> -Backport the following patches to fix the reader2 and runsuite test case=
s:
> -
> -b92768cd tests: Enable "runsuite" test
> -0ac8c15e python/tests/reader2: use absolute paths everywhere
> -b9ba5e1d python/tests/reader2: always exit(1) if a test fails
> -
> -Upstream-Status: Backport
> -Signed-off-by: Ross Burton <ross.burton@arm.com>
> -
> -diff --git a/python/tests/reader2.py b/python/tests/reader2.py
> -index 65cecd47..6e6353b4 100755
> ---- a/python/tests/reader2.py
> -+++ b/python/tests/reader2.py
> -@@ -6,7 +6,6 @@
> - import sys
> - import glob
> - import os
> --import string
> - import libxml2
> - try:
> -     import StringIO
> -@@ -20,103 +19,104 @@ libxml2.debugMemory(1)
> -
> - err =3D ""
> - basedir =3D os.path.dirname(os.path.realpath(__file__))
> --dir_prefix =3D os.path.join(basedir, "../../test/valid/")
> -+dir_prefix =3D os.path.realpath(os.path.join(basedir, "..", "..", "test=
", "valid"))
> -+
> - # This dictionary reflects the contents of the files
> - # ../../test/valid/*.xml.err that are not empty, except that
> - # the file paths in the messages start with ../../test/
> -
> - expect =3D {
> -     '766956':
> --"""../../test/valid/dtds/766956.dtd:2: parser error : PEReference: expe=
cting ';'
> -+"""{0}/dtds/766956.dtd:2: parser error : PEReference: expecting ';'
> - %=C3=A4%ent;
> -    ^
> --../../test/valid/dtds/766956.dtd:2: parser error : Content error in the=
 external subset
> -+{0}/dtds/766956.dtd:2: parser error : Content error in the external sub=
set
> - %=C3=A4%ent;
> -         ^
> - Entity: line 1:
> - value
> - ^
> --""",
> -+""".format(dir_prefix),
> -     '781333':
> --"""../../test/valid/781333.xml:4: element a: validity error : Element a=
 content does not follow the DTD, expecting ( ..., got
> -+"""{0}/781333.xml:4: element a: validity error : Element a content does=
 not follow the DTD, expecting ( ..., got
> - <a/>
> -     ^
> --../../test/valid/781333.xml:5: element a: validity error : Element a co=
ntent does not follow the DTD, Expecting more child
> -+{0}/781333.xml:5: element a: validity error : Element a content does no=
t follow the DTD, Expecting more child
> -
> - ^
> --""",
> -+""".format(dir_prefix),
> -     'cond_sect2':
> --"""../../test/valid/dtds/cond_sect2.dtd:15: parser error : All markup o=
f the conditional section is not in the same entity
> -+"""{0}/dtds/cond_sect2.dtd:15: parser error : All markup of the conditi=
onal section is not in the same entity
> -     %ent;
> -          ^
> - Entity: line 1:
> - ]]>
> - ^
> --../../test/valid/dtds/cond_sect2.dtd:17: parser error : Content error i=
n the external subset
> -+{0}/dtds/cond_sect2.dtd:17: parser error : Content error in the externa=
l subset
> -
> - ^
> --""",
> -+""".format(dir_prefix),
> -     'rss':
> --"""../../test/valid/rss.xml:177: element rss: validity error : Element =
rss does not carry attribute version
> -+"""{0}/rss.xml:177: element rss: validity error : Element rss does not =
carry attribute version
> - </rss>
> -       ^
> --""",
> -+""".format(dir_prefix),
> -     't8':
> --"""../../test/valid/t8.xml:6: parser error : internal error: xmlParseIn=
ternalSubset: error detected in Markup declaration
> -+"""{0}/t8.xml:6: parser error : internal error: xmlParseInternalSubset:=
 error detected in Markup declaration
> -
> - %defroot; %defmiddle; %deftest;
> -          ^
> - Entity: line 1:
> - &lt;!ELEMENT root (middle) >
> - ^
> --../../test/valid/t8.xml:6: parser error : internal error: xmlParseInter=
nalSubset: error detected in Markup declaration
> -+{0}/t8.xml:6: parser error : internal error: xmlParseInternalSubset: er=
ror detected in Markup declaration
> -
> - %defroot; %defmiddle; %deftest;
> -                      ^
> - Entity: line 1:
> - &lt;!ELEMENT middle (test) >
> - ^
> --../../test/valid/t8.xml:6: parser error : internal error: xmlParseInter=
nalSubset: error detected in Markup declaration
> -+{0}/t8.xml:6: parser error : internal error: xmlParseInternalSubset: er=
ror detected in Markup declaration
> -
> - %defroot; %defmiddle; %deftest;
> -                                ^
> - Entity: line 1:
> - &lt;!ELEMENT test (#PCDATA) >
> - ^
> --""",
> -+""".format(dir_prefix),
> -     't8a':
> --"""../../test/valid/t8a.xml:6: parser error : internal error: xmlParseI=
nternalSubset: error detected in Markup declaration
> -+"""{0}/t8a.xml:6: parser error : internal error: xmlParseInternalSubset=
: error detected in Markup declaration
> -
> - %defroot;%defmiddle;%deftest;
> -          ^
> - Entity: line 1:
> - &lt;!ELEMENT root (middle) >
> - ^
> --../../test/valid/t8a.xml:6: parser error : internal error: xmlParseInte=
rnalSubset: error detected in Markup declaration
> -+{0}/t8a.xml:6: parser error : internal error: xmlParseInternalSubset: e=
rror detected in Markup declaration
> -
> - %defroot;%defmiddle;%deftest;
> -                     ^
> - Entity: line 1:
> - &lt;!ELEMENT middle (test) >
> - ^
> --../../test/valid/t8a.xml:6: parser error : internal error: xmlParseInte=
rnalSubset: error detected in Markup declaration
> -+{0}/t8a.xml:6: parser error : internal error: xmlParseInternalSubset: e=
rror detected in Markup declaration
> -
> - %defroot;%defmiddle;%deftest;
> -                              ^
> - Entity: line 1:
> - &lt;!ELEMENT test (#PCDATA) >
> - ^
> --""",
> -+""".format(dir_prefix),
> -     'xlink':
> --"""../../test/valid/xlink.xml:450: element termdef: validity error : ID=
 dt-arc already defined
> -+"""{0}/xlink.xml:450: element termdef: validity error : ID dt-arc alrea=
dy defined
> -       <p><termdef id=3D"dt-arc" term=3D"Arc">An <ter
> -                                         ^
> - validity error : attribute def line 199 references an unknown ID "dt-xl=
g"
> --""",
> -+""".format(dir_prefix),
> - }
> -
> - # Add prefix_dir and extension to the keys
> --expect =3D {"{}{}.xml".format(dir_prefix, key): val for key, val in exp=
ect.items()}
> -+expect =3D {os.path.join(dir_prefix, key + ".xml"): val for key, val in=
 expect.items()}
> -
> - def callback(ctx, str):
> -     global err
> -@@ -124,11 +124,12 @@ def callback(ctx, str):
> - libxml2.registerErrorHandler(callback, "")
> -
> - parsing_error_files =3D ["766956", "cond_sect2", "t8", "t8a"]
> --expect_parsing_error =3D ["{}{}.xml".format(dir_prefix, f) for f in par=
sing_error_files]
> -+expect_parsing_error =3D [os.path.join(dir_prefix, f + ".xml") for f in=
 parsing_error_files]
> -
> --valid_files =3D glob.glob(dir_prefix + "*.x*")
> -+valid_files =3D glob.glob(os.path.join(dir_prefix, "*.x*"))
> - assert valid_files, "found no valid files in '{}'".format(dir_prefix)
> - valid_files.sort()
> -+failures =3D 0
> - for file in valid_files:
> -     err =3D ""
> -     reader =3D libxml2.newTextReaderFilename(file)
> -@@ -142,9 +143,15 @@ for file in valid_files:
> -         #sys.exit(1)
> -     if (err):
> -         if not(file in expect and err =3D=3D expect[file]):
> -+            failures +=3D 1
> -             print("Error: ", err)
> -             if file in expect:
> -                 print("Expected: ", expect[file])
> -+
> -+if failures:
> -+    print("Failed %d tests" % failures)
> -+    sys.exit(1)
> -+
> - #
> - # another separate test based on Stephane Bidoul one
> - #
> -@@ -337,9 +344,11 @@ while reader.Read() =3D=3D 1:
> - if res !=3D expect:
> -     print("test5 failed: unexpected output")
> -     print(res)
> -+    sys.exit(1)
> - if err !=3D "":
> -     print("test5 failed: validation error found")
> -     print(err)
> -+    sys.exit(1)
> -
> - #
> - # cleanup
> -diff --git a/runsuite.c b/runsuite.c
> -index 483490a2..a522d24b 100644
> ---- a/runsuite.c
> -+++ b/runsuite.c
> -@@ -1054,13 +1054,18 @@ main(int argc ATTRIBUTE_UNUSED, char **argv ATTR=
IBUTE_UNUSED) {
> -     old_tests =3D nb_tests;
> -     old_leaks =3D nb_leaks;
> -     xsdTest();
> --    if ((nb_errors =3D=3D old_errors) && (nb_leaks =3D=3D old_leaks))
> --      printf("Ran %d tests, no errors\n", nb_tests - old_tests);
> --    else
> --      printf("Ran %d tests, %d errors, %d leaks\n",
> --             nb_tests - old_tests,
> --             nb_errors - old_errors,
> --             nb_leaks - old_leaks);
> -+    printf("Ran %d tests, %d errors, %d leaks\n",
> -+           nb_tests - old_tests,
> -+           nb_errors - old_errors,
> -+           nb_leaks - old_leaks);
> -+    if (nb_errors - old_errors =3D=3D 10) {
> -+        printf("10 errors were expected\n");
> -+        nb_errors =3D old_errors;
> -+    } else {
> -+        printf("10 errors were expected, got %d errors\n",
> -+               nb_errors - old_errors);
> -+        nb_errors =3D old_errors + 1;
> -+    }
> -     old_errors =3D nb_errors;
> -     old_tests =3D nb_tests;
> -     old_leaks =3D nb_leaks;
> diff --git a/meta/recipes-core/libxml/libxml2/install-tests.patch b/meta/=
recipes-core/libxml/libxml2/install-tests.patch
> index b770afbeb49..14ccce5873b 100644
> --- a/meta/recipes-core/libxml/libxml2/install-tests.patch
> +++ b/meta/recipes-core/libxml/libxml2/install-tests.patch
> @@ -1,19 +1,19 @@
> +From 3fc716357ce1372d9418dc86f24315b34d9808de Mon Sep 17 00:00:00 2001
> +From: Ross Burton <ross.burton@arm.com>
> +Date: Mon, 5 Dec 2022 17:02:32 +0000
> +Subject: [PATCH] add yocto-specific install-ptest target
> +
>  Add a target to install the test suite.
>
>  Upstream-Status: Inappropriate
>  Signed-off-by: Ross Burton <ross.burton@arm.com>
>
> -From c7809dc6947324ea506a0c2bf132ecd37156f211 Mon Sep 17 00:00:00 2001
> -From: Ross Burton <ross.burton@arm.com>
> -Date: Mon, 5 Dec 2022 17:02:32 +0000
> -Subject: [PATCH] add yocto-specific install-ptest target
> -
>  ---
>   Makefile.am | 10 ++++++++++
>   1 file changed, 10 insertions(+)
>
>  diff --git a/Makefile.am b/Makefile.am
> -index 316109b1..15e100be 100644
> +index 5bc4018..57d27af 100644
>  --- a/Makefile.am
>  +++ b/Makefile.am
>  @@ -26,6 +26,16 @@ check_PROGRAMS =3D \
> @@ -32,7 +32,4 @@ index 316109b1..15e100be 100644
>  +
>   bin_PROGRAMS =3D xmllint xmlcatalog
>
> - nodist_bin_SCRIPTS =3D xml2-config
> ---
> -2.34.1
> -
> + bin_SCRIPTS =3D xml2-config
> diff --git a/meta/recipes-core/libxml/libxml2/libxml-64bit.patch b/meta/r=
ecipes-core/libxml/libxml2/libxml-64bit.patch
> deleted file mode 100644
> index fd8e469dd31..00000000000
> --- a/meta/recipes-core/libxml/libxml2/libxml-64bit.patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -From 056b14345b1abd76a761ab14538f1bc21302781a Mon Sep 17 00:00:00 2001
> -From: Hongxu Jia <hongxu.jia@windriver.com>
> -Date: Sat, 11 May 2019 20:26:51 +0800
> -Subject: [PATCH] libxml 64bit
> -
> -Upstream-Status: Backport [from debian: bugs.debian.org/439843]
> -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ----
> - libxml.h | 3 +++
> - 1 file changed, 3 insertions(+)
> -
> -diff --git a/libxml.h b/libxml.h
> -index 64e30f7..4e80d90 100644
> ---- a/libxml.h
> -+++ b/libxml.h
> -@@ -15,6 +15,9 @@
> - #ifndef _LARGEFILE_SOURCE
> - #define _LARGEFILE_SOURCE
> - #endif
> -+#ifndef _LARGEFILE64_SOURCE
> -+#define _LARGEFILE64_SOURCE
> -+#endif
> - #ifndef _FILE_OFFSET_BITS
> - #define _FILE_OFFSET_BITS 64
> - #endif
> ---
> -2.7.4
> -
> diff --git a/meta/recipes-core/libxml/libxml2/libxml-m4-use-pkgconfig.pat=
ch b/meta/recipes-core/libxml/libxml2/libxml-m4-use-pkgconfig.patch
> deleted file mode 100644
> index 639c80bd6ce..00000000000
> --- a/meta/recipes-core/libxml/libxml2/libxml-m4-use-pkgconfig.patch
> +++ /dev/null
> @@ -1,212 +0,0 @@
> -Change the AM_PATH_XML2 macros to use pkg-config instead of xml2-config.
> -
> -Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/comm=
it/d598d8af0913b6e3d4e61ffa62397a275b669dca]
> -Signed-off-by: Ross Burton <ross.burton@arm.com>
> -
> - libxml.m4 | 189 ++----------------------------------------------------
> - 1 file changed, 5 insertions(+), 184 deletions(-)
> -
> -diff --git a/libxml.m4 b/libxml.m4
> -index fc7790c..1c53585 100644
> ---- a/libxml.m4
> -+++ b/libxml.m4
> -@@ -1,191 +1,12 @@
> --# Configure paths for LIBXML2
> --# Simon Josefsson 2020-02-12
> --# Fix autoconf 2.70+ warnings
> --# Mike Hommey 2004-06-19
> --# use CPPFLAGS instead of CFLAGS
> --# Toshio Kuratomi 2001-04-21
> --# Adapted from:
> --# Configure paths for GLIB
> --# Owen Taylor     97-11-3
> --
> - dnl AM_PATH_XML2([MINIMUM-VERSION, [ACTION-IF-FOUND [, ACTION-IF-NOT-FO=
UND]]])
> - dnl Test for XML, and define XML_CPPFLAGS and XML_LIBS
> - dnl
> --AC_DEFUN([AM_PATH_XML2],[
> --AC_ARG_WITH(xml-prefix,
> --            [  --with-xml-prefix=3DPFX   Prefix where libxml is install=
ed (optional)],
> --            xml_config_prefix=3D"$withval", xml_config_prefix=3D"")
> --AC_ARG_WITH(xml-exec-prefix,
> --            [  --with-xml-exec-prefix=3DPFX Exec prefix where libxml is=
 installed (optional)],
> --            xml_config_exec_prefix=3D"$withval", xml_config_exec_prefix=
=3D"")
> --AC_ARG_ENABLE(xmltest,
> --              [  --disable-xmltest       Do not try to compile and run =
a test LIBXML program],,
> --              enable_xmltest=3Dyes)
> --
> --  if test x$xml_config_exec_prefix !=3D x ; then
> --     xml_config_args=3D"$xml_config_args"
> --     if test x${XML2_CONFIG+set} !=3D xset ; then
> --        XML2_CONFIG=3D$xml_config_exec_prefix/bin/xml2-config
> --     fi
> --  fi
> --  if test x$xml_config_prefix !=3D x ; then
> --     xml_config_args=3D"$xml_config_args --prefix=3D$xml_config_prefix"
> --     if test x${XML2_CONFIG+set} !=3D xset ; then
> --        XML2_CONFIG=3D$xml_config_prefix/bin/xml2-config
> --     fi
> --  fi
> --
> --  AC_PATH_PROG(XML2_CONFIG, xml2-config, no)
> --  min_xml_version=3Difelse([$1], ,2.0.0,[$1])
> --  AC_MSG_CHECKING(for libxml - version >=3D $min_xml_version)
> --  no_xml=3D""
> --  if test "$XML2_CONFIG" =3D "no" ; then
> --    no_xml=3Dyes
> --  else
> --    XML_CPPFLAGS=3D`$XML2_CONFIG $xml_config_args --cflags`
> --    XML_LIBS=3D`$XML2_CONFIG $xml_config_args --libs`
> --    xml_config_major_version=3D`$XML2_CONFIG $xml_config_args --version=
 | \
> --           sed 's/\([[0-9]]*\).\([[0-9]]*\).\([[0-9]]*\)/\1/'`
> --    xml_config_minor_version=3D`$XML2_CONFIG $xml_config_args --version=
 | \
> --           sed 's/\([[0-9]]*\).\([[0-9]]*\).\([[0-9]]*\)/\2/'`
> --    xml_config_micro_version=3D`$XML2_CONFIG $xml_config_args --version=
 | \
> --           sed 's/\([[0-9]]*\).\([[0-9]]*\).\([[0-9]]*\)/\3/'`
> --    if test "x$enable_xmltest" =3D "xyes" ; then
> --      ac_save_CPPFLAGS=3D"$CPPFLAGS"
> --      ac_save_LIBS=3D"$LIBS"
> --      CPPFLAGS=3D"$CPPFLAGS $XML_CPPFLAGS"
> --      LIBS=3D"$XML_LIBS $LIBS"
> --dnl
> --dnl Now check if the installed libxml is sufficiently new.
> --dnl (Also sanity checks the results of xml2-config to some extent)
> --dnl
> --      rm -f conf.xmltest
> --      AC_RUN_IFELSE(
> --            [AC_LANG_SOURCE([[
> --#include <stdlib.h>
> --#include <stdio.h>
> --#include <string.h>
> --#include <libxml/xmlversion.h>
> --
> --int
> --main()
> --{
> --  int xml_major_version, xml_minor_version, xml_micro_version;
> --  int major, minor, micro;
> --  char *tmp_version;
> --
> --  system("touch conf.xmltest");
> --
> --  /* Capture xml2-config output via autoconf/configure variables */
> --  /* HP/UX 9 (%@#!) writes to sscanf strings */
> --  tmp_version =3D (char *)strdup("$min_xml_version");
> --  if (sscanf(tmp_version, "%d.%d.%d", &major, &minor, &micro) !=3D 3) {
> --     printf("%s, bad version string from xml2-config\n", "$min_xml_vers=
ion");
> --     exit(1);
> --   }
> --   free(tmp_version);
> --
> --   /* Capture the version information from the header files */
> --   tmp_version =3D (char *)strdup(LIBXML_DOTTED_VERSION);
> --   if (sscanf(tmp_version, "%d.%d.%d", &xml_major_version, &xml_minor_v=
ersion, &xml_micro_version) !=3D 3) {
> --     printf("%s, bad version string from libxml includes\n", "LIBXML_DO=
TTED_VERSION");
> --     exit(1);
> --   }
> --   free(tmp_version);
> --
> -- /* Compare xml2-config output to the libxml headers */
> --  if ((xml_major_version !=3D $xml_config_major_version) ||
> --      (xml_minor_version !=3D $xml_config_minor_version) ||
> --      (xml_micro_version !=3D $xml_config_micro_version))
> --    {
> --      printf("*** libxml header files (version %d.%d.%d) do not match\n=
",
> --         xml_major_version, xml_minor_version, xml_micro_version);
> --      printf("*** xml2-config (version %d.%d.%d)\n",
> --         $xml_config_major_version, $xml_config_minor_version, $xml_con=
fig_micro_version);
> --      return 1;
> --    }
> --/* Compare the headers to the library to make sure we match */
> --  /* Less than ideal -- doesn't provide us with return value feedback,
> --   * only exits if there's a serious mismatch between header and librar=
y.
> --   */
> --    LIBXML_TEST_VERSION;
> --
> --    /* Test that the library is greater than our minimum version */
> --    if ((xml_major_version > major) ||
> --        ((xml_major_version =3D=3D major) && (xml_minor_version > minor=
)) ||
> --        ((xml_major_version =3D=3D major) && (xml_minor_version =3D=3D =
minor) &&
> --        (xml_micro_version >=3D micro)))
> --      {
> --        return 0;
> --       }
> --     else
> --      {
> --        printf("\n*** An old version of libxml (%d.%d.%d) was found.\n"=
,
> --               xml_major_version, xml_minor_version, xml_micro_version)=
;
> --        printf("*** You need a version of libxml newer than %d.%d.%d.\n=
",
> --           major, minor, micro);
> --        printf("***\n");
> --        printf("*** If you have already installed a sufficiently new ve=
rsion, this error\n");
> --        printf("*** probably means that the wrong copy of the xml2-conf=
ig shell script is\n");
> --        printf("*** being found. The easiest way to fix this is to remo=
ve the old version\n");
> --        printf("*** of LIBXML, but you can also set the XML2_CONFIG env=
ironment to point to the\n");
> --        printf("*** correct copy of xml2-config. (In this case, you wil=
l have to\n");
> --        printf("*** modify your LD_LIBRARY_PATH environment variable, o=
r edit /etc/ld.so.conf\n");
> --        printf("*** so that the correct libraries are found at run-time=
))\n");
> --    }
> --  return 1;
> --}
> --]])],, no_xml=3Dyes,[echo $ac_n "cross compiling; assumed OK... $ac_c"]=
)
> --       CPPFLAGS=3D"$ac_save_CPPFLAGS"
> --       LIBS=3D"$ac_save_LIBS"
> --     fi
> --  fi
> -+AC_DEFUN([AM_PATH_XML2],[
> -+  AC_REQUIRE([PKG_PROG_PKG_CONFIG])
> -
> --  if test "x$no_xml" =3D x ; then
> --     AC_MSG_RESULT(yes (version $xml_config_major_version.$xml_config_m=
inor_version.$xml_config_micro_version))
> --     ifelse([$2], , :, [$2])
> --  else
> --     AC_MSG_RESULT(no)
> --     if test "$XML2_CONFIG" =3D "no" ; then
> --       echo "*** The xml2-config script installed by LIBXML could not b=
e found"
> --       echo "*** If libxml was installed in PREFIX, make sure PREFIX/bi=
n is in"
> --       echo "*** your path, or set the XML2_CONFIG environment variable=
 to the"
> --       echo "*** full path to xml2-config."
> --     else
> --       if test -f conf.xmltest ; then
> --        :
> --       else
> --          echo "*** Could not run libxml test program, checking why..."
> --          CPPFLAGS=3D"$CPPFLAGS $XML_CPPFLAGS"
> --          LIBS=3D"$LIBS $XML_LIBS"
> --        AC_LINK_IFELSE(
> --            [AC_LANG_PROGRAM([[
> --#include <libxml/xmlversion.h>
> --#include <stdio.h>
> --]],    [[ LIBXML_TEST_VERSION; return 0;]])],
> --        [ echo "*** The test program compiled, but did not run. This us=
ually means"
> --          echo "*** that the run-time linker is not finding LIBXML or f=
inding the wrong"
> --          echo "*** version of LIBXML. If it is not finding LIBXML, you=
'll need to set your"
> --          echo "*** LD_LIBRARY_PATH environment variable, or edit /etc/=
ld.so.conf to point"
> --          echo "*** to the installed location  Also, make sure you have=
 run ldconfig if that"
> --          echo "*** is required on your system"
> --          echo "***"
> --          echo "*** If you have an old version installed, it is best to=
 remove it, although"
> --          echo "*** you may also be able to get things to work by modif=
ying LD_LIBRARY_PATH" ],
> --        [ echo "*** The test program failed to compile or link. See the=
 file config.log for the"
> --          echo "*** exact error that occurred. This usually means LIBXM=
L was incorrectly installed"
> --          echo "*** or that you have moved LIBXML since it was installe=
d. In the latter case, you"
> --          echo "*** may want to edit the xml2-config script: $XML2_CONF=
IG" ])
> --          CPPFLAGS=3D"$ac_save_CPPFLAGS"
> --          LIBS=3D"$ac_save_LIBS"
> --       fi
> --     fi
> -+  verdep=3Difelse([$1], [], [], [">=3D $1"])
> -+  PKG_CHECK_MODULES(XML, [libxml-2.0 $verdep], [$2], [$3])
> -
> --     XML_CPPFLAGS=3D""
> --     XML_LIBS=3D""
> --     ifelse([$3], , :, [$3])
> --  fi
> -+  XML_CPPFLAGS=3D$XML_CFLAGS
> -   AC_SUBST(XML_CPPFLAGS)
> --  AC_SUBST(XML_LIBS)
> --  rm -f conf.xmltest
> - ])
> ---
> -2.34.1
> -
> diff --git a/meta/recipes-core/libxml/libxml2_2.10.4.bb b/meta/recipes-co=
re/libxml/libxml2_2.11.4.bb
> similarity index 95%
> rename from meta/recipes-core/libxml/libxml2_2.10.4.bb
> rename to meta/recipes-core/libxml/libxml2_2.11.4.bb
> index 4f3b17093e4..713d0baf6cc 100644
> --- a/meta/recipes-core/libxml/libxml2_2.10.4.bb
> +++ b/meta/recipes-core/libxml/libxml2_2.11.4.bb
> @@ -15,13 +15,10 @@ inherit gnomebase
>
>  SRC_URI +=3D "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=3D${BP=
};name=3Dtesttar \
>             file://run-ptest \
> -           file://libxml-64bit.patch \
> -           file://fix-tests.patch \
>             file://install-tests.patch \
> -           file://libxml-m4-use-pkgconfig.patch \
>             "
>
> -SRC_URI[archive.sha256sum] =3D "ed0c91c5845008f1936739e4eee2035531c1c947=
42c6541f44ee66d885948d45"
> +SRC_URI[archive.sha256sum] =3D "737e1d7f8ab3f139729ca13a2494fd17bf30ddb4=
b7a427cf336252cab57f57f7"
>  SRC_URI[testtar.sha256sum] =3D "c6b2d42ee50b8b236e711a97d68e6c4b5c8d83e6=
9a2be4722379f08702ea7273"
>
>  BINCONFIG =3D "${bindir}/xml2-config"
> --
> 2.30.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#183377): https://lists.openembedded.org/g/openembedde=
d-core/message/183377
> Mute This Topic: https://lists.openembedded.org/mt/99776684/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

