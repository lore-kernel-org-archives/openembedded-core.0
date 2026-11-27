Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1528.1795801776549511229
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 09:49:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=Uskgk/GD;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4ac08f4a0b2so5934543f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 09:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795801775; x=1796406575; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=226+VZ+Xi4o1/6UhU+6S+ZPwJLhLZNVKLCJvdOa7zxQ=;
        b=Uskgk/GDc89j+pcQGQmEJHZTGQ1d58SvxrqCl+ezIuMvRHSGVnCOhFcxiTGhTs1o1r
         QtKxjFJLouSTTKXW/1k1gLgTkMo/DyiR0kgHFVlulf+gACSyjAH00PTkqVWe40q1PhDN
         rBLSxOdaxlXuH29f6inE6PII9HUFr0Q/i01im03HHbEsfPpZIPZVxQH4xjl0omDfi2Uc
         JDIIGbERFR4KYKrdzfbytBqF/GZ/sGzxVb/Z+U+HmiFU+dV99obrr6xPEcK8Zei08QM9
         OJxbpuVG0S/GbZ6i6gJOKAmTATE5DQ0UGep1UvthhPRdX4fnXrnEZttqt95Ad8zahF8J
         vMzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795801775; x=1796406575;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=226+VZ+Xi4o1/6UhU+6S+ZPwJLhLZNVKLCJvdOa7zxQ=;
        b=MPAddixXf5IDGLWGPyZpRVdl+WTt+28lUUPK+ozXLjM4CGtI9JSwx3x1gpCYyeX6Z1
         Mdm8He8XloR1D5DNTAUWHaVUHAcG62771UmwxD4Xju/FHHftvQMYSSbmyQ3fTQMSNAHP
         So5Pz3HfQsloRi/7HzlDTz7RPo0DzWj7X0HQfIJG6vBQvtFH7kOylEAlmt8y7hgD1CDn
         qMaPnjW/1N0jRs7DPB5hJlKahTsj7NqF1x1o2PkyrwrTzd1PSAlGvH6xCwYFI1EBTIp+
         jY7OwZxKH2kAZGpxnYvEsZLq9JNqG4n7LWFPuJlauOqbmeWTf+qIygKlA29UVXzUWwt/
         4F9w==
X-Gm-Message-State: APuU4Z+IfHL1csF5MnIv/ec6k/LM6k+mr8pfyj0DzlGJV0k9Bd12IYJX
	80Hzo2g9dQ805xzx2BKK62wRToC7Cyw3p4OGQsdmoW3oMkcBCPydCZxTOx/AgzrVIxRYZYkc7I4
	mAQXeHUQ=
X-Gm-Gg: AZFdTZffdGUZMB+op9HXR1O5jeV7ab1KjoAhLS00J4JqWT6g33SiRCgZkmZMO6E5W/F
	bzK/pRVPj8rP9EPZMXgq1c1ceXLtNh7IL+2R07PPk7eQSVv1aCkN811Xi5nJLBSb356zFdX1PlJ
	sfibsRT7Bmt54zBYffwOe7jcQtIHz1PWF1hDs8Ddbj3ZbLc6v+UGNKMY+f4GHtzqtrmBIQu5Yqb
	ZqbW8CJv5YM/mSOgoRcsScaDnDA2IyTCzNmef38QmI/daS5/3t2yOlhPIuovR95GzjoA7sHrbJv
	tqteMQ1ZKndr1n9bNLvtKp/SB2mWnBY4XTEjmPQQlwloE7PyouEoYWCFrVHH+TRyAtBKIXa3RgG
	UQUYElEiCwgONsl8mPsw6Fm9i/laW212hrRofCxXvAPV3nHqy04WGmxHZHdtUOtVTWPleFz9QEj
	oMvAVFvaTooQZdUEJnlSBoYw/+0DmGr6O42LnU6H4QNGP3Vwon8XevNAXei0OECWKzgwBt9y7mJ
	UWHqo07KQEeR1W+qkcR9EQBUXoaE4sBqIgwr5jIxUK02EgxLH8DJQszFUam2m2Vng5zAaApOJaE
	1k67aONh2erercW20+66KCD/z65R0NFXzl28p61DUmTzBajLvaAR4RvLYdUnYZLDMoLAgvpe4FQ
	fmTPFNpdOdf7WAvlRuweMadLc8Z3b
X-Received: by 2002:a05:600c:5487:b0:4bb:5de1:e92c with SMTP id 5b1f17b1804b1-4bb88813157mr513539725e9.26.1795801774582;
        Fri, 27 Nov 2026 09:49:34 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf630esm49374624f8f.16.2026.11.27.09.49.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 09:49:34 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 01/37] bison: fix CVE-2026-56390
Date: Fri, 27 Nov 2026 18:48:44 +0100
Message-ID: <e9dcdc289a794812d1a6c1f19aebd7abfc28b1ee.1795798718.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1795798718.git.yoann.congal@smile.fr>
References: <cover.1795798718.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 17:49:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251407
Content-Type: text/plain; charset="utf-8"

From: Yogita Urade <yurade@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://cgit.git.savannah.gnu.org/cgit/bison.git/commit/?id=8d101c19d4d9aaedf83a448c925513742d4efcf0
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-56390

Signed-off-by: Yogita Urade <yurade@cisco.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit eefec9cde464081f5943f4ad5c3cb688a87eff1f)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../bison/bison/CVE-2026-56390.patch          | 230 ++++++++++++++++++
 meta/recipes-devtools/bison/bison_3.8.2.bb    |   1 +
 2 files changed, 231 insertions(+)
 create mode 100644 meta/recipes-devtools/bison/bison/CVE-2026-56390.patch

diff --git a/meta/recipes-devtools/bison/bison/CVE-2026-56390.patch b/meta/recipes-devtools/bison/bison/CVE-2026-56390.patch
new file mode 100644
index 00000000000..f0c895c5d48
--- /dev/null
+++ b/meta/recipes-devtools/bison/bison/CVE-2026-56390.patch
@@ -0,0 +1,230 @@
+From 7172ade933921ccaac7403750c90756b0db8ada4 Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Thu, 23 Apr 2026 12:41:25 -0700
+Subject: [PATCH] bison: tighten up output file names
+
+Problem reported by Michał Majchrowicz.
+* src/parse-gram.y: Do not allow '/' in %header and %output directives.
+
+CVE: CVE-2026-56390
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/bison.git/commit/?id=8d101c19d4d9aaedf83a448c925513742d4efcf0]
+
+Backport Changes:
+- Adapted generated src/parse-gram.c to the Bison 3.8.2 source tree.
+- omitted upstream generator-version/copyright metadata and
+  src/parse-gram.h-only metadata while retaining the
+  security-relevant parser changes.
+
+(cherry picked from commit 8d101c19d4d9aaedf83a448c925513742d4efcf0)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ THANKS           |  1 +
+ doc/bison.texi   |  2 ++
+ src/parse-gram.c | 56 ++++++++++++++++++++++++++++++++----------------
+ src/parse-gram.y | 31 ++++++++++++++++++++++-----
+ 4 files changed, 67 insertions(+), 23 deletions(-)
+
+diff --git a/THANKS b/THANKS
+index be743a23..0e481561 100644
+--- a/THANKS
++++ b/THANKS
+@@ -128,6 +128,7 @@ Michael Catanzaro         mcatanzaro@gnome.org
+ Michael Felt              mamfelt@gmail.com
+ Michael Hayes             m.hayes@elec.canterbury.ac.nz
+ Michael Raskin            7c6f434c@mail.ru
++Michał Majchrowicz        mmajchrowicz@afine.com
+ Michel d'Hooge            michel.dhooge@gmail.com
+ Michiel De Wilde          mdewilde.agilent@gmail.com
+ Mickael Labau             labau_m@epita.fr
+diff --git a/doc/bison.texi b/doc/bison.texi
+index a559649c..44a4e159 100644
+--- a/doc/bison.texi
++++ b/doc/bison.texi
+@@ -5973,6 +5973,7 @@ Introduced in Bison 3.8.
+ 
+ @deffn {Directive} %header @var{header-file}
+ Same as above, but save in the file @file{@var{header-file}}.
++The @var{header-file} name should not contain slashes.
+ @end deffn
+ 
+ @deffn {Directive} %language "@var{language}"
+@@ -6026,6 +6027,7 @@ file, treating it as an independent source file in its own right.
+ 
+ @deffn {Directive} %output "@var{file}"
+ Generate the parser implementation in @file{@var{file}}.
++The @var{file} name should not contain slashes.
+ @end deffn
+ 
+ @deffn {Directive} %pure-parser
+diff --git a/src/parse-gram.y b/src/parse-gram.y
+index 15180cb5..114c5c44 100644
+--- a/src/parse-gram.y
++++ b/src/parse-gram.y
+@@ -95,8 +95,11 @@
+      string from the scanner (should be CODE). */
+   static char const *translate_code_braceless (char *code, location loc);
+ 
++  /* Is FILE a valid output file name?  */
++  static bool valid_output_file_name (char const *file);
++
+   /* Handle a %header directive.  */
+-  static void handle_header (char const *value);
++  static void handle_header (location const *loc, char const *value);
+ 
+   /* Handle a %error-verbose directive.  */
+   static void handle_error_verbose (location const *loc, char const *directive);
+@@ -337,7 +340,7 @@ prologue_declaration:
+       muscle_percent_define_insert ($2, @$, $3.kind, $3.chars,
+                                     MUSCLE_PERCENT_DEFINE_GRAMMAR_FILE);
+     }
+-| "%header" string.opt             { handle_header ($2); }
++| "%header" string.opt             { handle_header (&@2, $2); }
+ | "%error-verbose"                 { handle_error_verbose (&@$, $1); }
+ | "%expect" INT_LITERAL            { expected_sr_conflicts = $2; }
+ | "%expect-rr" INT_LITERAL         { expected_rr_conflicts = $2; }
+@@ -356,7 +359,15 @@ prologue_declaration:
+ | "%name-prefix" STRING         { handle_name_prefix (&@$, $1, $2); }
+ | "%no-lines"                   { no_lines_flag = true; }
+ | "%nondeterministic-parser"    { nondeterministic_parser = true; }
+-| "%output" STRING              { spec_outfile = unquote ($2); gram_scanner_last_string_free (); }
++| "%output" STRING
++    {
++      char *file = unquote ($2);
++      if (valid_output_file_name (file))
++        spec_outfile = file;
++      else
++        complain (&@2, complaint, _("invalid %%output file name ignored"));
++      gram_scanner_last_string_free ();
++    }
+ | "%param" { current_param = $1; } params { current_param = param_none; }
+ | "%pure-parser"                { handle_pure_parser (&@$, $1); }
+ | "%require" STRING             { handle_require (&@2, $2); }
+@@ -952,14 +963,24 @@ add_param (param_type type, char *decl, location loc)
+ }
+ 
+ 
++static bool
++valid_output_file_name (char const *file)
++{
++  return !strchr (file, '/');
++}
++
++
+ static void
+-handle_header (char const *value)
++handle_header (location const *loc, char const *value)
+ {
+   header_flag = true;
+   if (value)
+     {
+       char *file = unquote (value);
+-      spec_header_file = xstrdup (file);
++      if (valid_output_file_name (file))
++        spec_header_file = xstrdup (file);
++      else
++        complain (loc, complaint, _("invalid %%header file name ignored"));
+       gram_scanner_last_string_free ();
+       unquote_free (file);
+     }
+diff --git a/src/parse-gram.c b/src/parse-gram.c
+index 3c1d8229..a62f2d6c 100644
+--- a/src/parse-gram.c
++++ b/src/parse-gram.c
+@@ -276,8 +276,11 @@ typedef enum yysymbol_kind_t yysymbol_kind_t;
+      string from the scanner (should be CODE). */
+   static char const *translate_code_braceless (char *code, location loc);
+ 
++  /* Is FILE a valid output file name?  */
++  static bool valid_output_file_name (char const *file);
++
+   /* Handle a %header directive.  */
+-  static void handle_header (char const *value);
++  static void handle_header (location const *loc, char const *value);
+ 
+   /* Handle a %error-verbose directive.  */
+   static void handle_error_verbose (location const *loc, char const *directive);
+@@ -663,19 +666,19 @@ union yyalloc
+ /* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
+ static const yytype_int16 yyrline[] =
+ {
+-       0,   310,   310,   319,   320,   324,   325,   331,   335,   340,
+-     341,   342,   343,   344,   345,   350,   355,   356,   357,   358,
+-     359,   360,   360,   361,   362,   363,   364,   365,   366,   367,
+-     368,   372,   373,   382,   383,   387,   398,   402,   406,   414,
+-     424,   425,   435,   436,   442,   455,   455,   460,   460,   465,
+-     465,   470,   480,   481,   482,   483,   488,   489,   493,   494,
+-     499,   500,   504,   505,   509,   510,   511,   524,   533,   537,
+-     541,   549,   550,   554,   567,   568,   573,   574,   575,   593,
+-     597,   601,   609,   611,   616,   623,   633,   637,   641,   649,
+-     655,   668,   669,   675,   676,   677,   684,   684,   692,   693,
+-     694,   699,   702,   704,   706,   708,   710,   712,   714,   716,
+-     718,   723,   724,   733,   757,   758,   759,   760,   772,   774,
+-     798,   803,   804,   809,   817,   818
++       0,   314,   314,   323,   324,   328,   329,   335,   339,   344,
++     345,   346,   347,   348,   349,   354,   359,   360,   361,   362,
++     363,   372,   372,   373,   374,   375,   376,   377,   378,   379,
++     380,   384,   385,   394,   395,   399,   410,   414,   418,   426,
++     436,   437,   447,   448,   454,   467,   467,   472,   472,   477,
++     477,   482,   492,   493,   494,   495,   500,   501,   505,   506,
++     511,   512,   516,   517,   521,   522,   523,   536,   545,   549,
++     553,   561,   562,   566,   579,   580,   585,   586,   587,   605,
++     609,   613,   621,   623,   628,   635,   645,   649,   653,   661,
++     667,   680,   681,   687,   688,   689,   696,   696,   704,   705,
++     706,   711,   714,   716,   718,   720,   722,   724,   726,   728,
++     730,   735,   736,   745,   769,   770,   771,   772,   784,   786,
++     810,   815,   816,   821,   829,   830
+ };
+ #endif
+ 
+@@ -2217,7 +2220,7 @@ yyreduce:
+ 
+   case 9: /* prologue_declaration: "%header" string.opt  */
+ #line 340 "src/parse-gram.y"
+-                                   { handle_header ((yyvsp[0].yykind_75)); }
++                                   { handle_header (&(yylsp[0]), (yyvsp[0].yykind_75)); }
+ #line 2222 "src/parse-gram.c"
+     break;
+ 
+@@ -2289,7 +2292,14 @@ yyreduce:
+ 
+   case 20: /* prologue_declaration: "%output" "string"  */
+ #line 359 "src/parse-gram.y"
+-                                { spec_outfile = unquote ((yyvsp[0].STRING)); gram_scanner_last_string_free (); }
++    {
++      char *file = unquote ((yyvsp[0].STRING));
++      if (valid_output_file_name (file))
++        spec_outfile = file;
++      else
++        complain (&(yylsp[0]), complaint, _("invalid %%output file name ignored"));
++      gram_scanner_last_string_free ();
++    }                           
+ #line 2294 "src/parse-gram.c"
+     break;
+ 
+@@ -3290,14 +3300,24 @@ add_param (param_type type, char *decl, location loc)
+ }
+ 
+ 
++static bool
++valid_output_file_name (char const *file)
++{
++  return !strchr (file, '/');
++}
++
++
+ static void
+-handle_header (char const *value)
++handle_header (location const *loc, char const *value)
+ {
+   header_flag = true;
+   if (value)
+     {
+       char *file = unquote (value);
+-      spec_header_file = xstrdup (file);
++      if (valid_output_file_name (file))
++        spec_header_file = xstrdup (file);
++      else
++        complain (loc, complaint, _("invalid %%header file name ignored"));
+       gram_scanner_last_string_free ();
+       unquote_free (file);
+     }
diff --git a/meta/recipes-devtools/bison/bison_3.8.2.bb b/meta/recipes-devtools/bison/bison_3.8.2.bb
index 9808a96e993..08962ae1336 100644
--- a/meta/recipes-devtools/bison/bison_3.8.2.bb
+++ b/meta/recipes-devtools/bison/bison_3.8.2.bb
@@ -13,6 +13,7 @@ SRC_URI = "${GNU_MIRROR}/bison/bison-${PV}.tar.xz \
            file://autoconf-2.73.patch \
            file://add-with-bisonlocaledir.patch \
            file://CVE-2026-56389.patch \
+           file://CVE-2026-56390.patch \
            "
 SRC_URI[sha256sum] = "9bba0214ccf7f1079c5d59210045227bcf619519840ebfa80cd3849cff5a5bf2"
 
