Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29805.1793868226091115899
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 00:43:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=T9O1JZvE;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4918c2d727fso183070f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 00:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793868224; x=1794473024; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KvCQp1JMKQZTry6Dz7lIRtlr4AfIQGbtEu+4lyGCqI4=;
        b=T9O1JZvEvSm+zNwwNKz7RcKxbqCqj9Za340osEE0FMFUtf5S6Al7Zv6cFqs09VDgBM
         orvNd3F/WRRf3pMJrnZ9x8Aw+LbWCz8d7HKAHpq873KmMYS9EhmXxhejKni6A989Lu3S
         2lQ3758Z2rpxRNHkUwas9pGieQKHGmZQSi9kcAUkup6YAmD7lIcJmO5sWEnFk7Sc6+5I
         DkzFvt+xhj5S7s9qmxhJmXL/kHLhkL2NEMjmgj3ufyt5eXTLyJtc7SH7STC61tgl+G2t
         HklLj7iK1YfxV4eyTxmznplo7NAF2M5FBtezOBt5DRZiKSMJp226BSych/P/gDXyhunw
         jkRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868224; x=1794473024;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KvCQp1JMKQZTry6Dz7lIRtlr4AfIQGbtEu+4lyGCqI4=;
        b=Ue2RvbsToU4X+R5L2ZWeAvhNYLTAewryWS2KM/irI8FW9hz80UI7x28zKTOhyZNp21
         7MrObVqDLaIjf0wrHgqYaZFpYYscHa5SBYVHkRqDhrYs9L95yswxAtjZHVe2qbZu63YF
         8fMwx0v6TTRpX4gn6i2kAiak98lQCHbXq/XAZZffmsDWx45rEL62C3bx6Kx8ygGDUlGk
         z7YlpVHR3HoXd/DFiNHZKRr0O/oEWthLCSDwvEIsp847grJXWU8zfMzYLWj3BuI15XI0
         LyzPxeoLl3qHbtkcLZlT772Ic2g7c8lHpVV3gbgv/0hZdrPVk4IhM9RMzuKAk880DC5l
         8ePQ==
X-Gm-Message-State: APuU4Z8h109aCb1qaBhUOAAPWdAgfq1I6sY+cKcV0O7z6SJAfnAnAeFq
	ZsMwa2ppTyZCSvbPN0EOh7yUuzYr2kAQSMCFwRF5/ZeC8GXJqVVUMr9AlJ4Nn2MWfS8j835TOX8
	Uuq7TO1U=
X-Gm-Gg: AYBFou1/lwM5ZU7A4ine3b9jZa41BYf2xT/4FeZH0Z/J4kL4I1qnEh2Dk3dOBrXr+pq
	316Cm3r3r/HDO3vJL8V4OzCo2L/Pb/zAH+h29Wr73ytagF9lBibVre4CFTudwpi+X6efKwYdR7/
	O4kk/YLNksiv1Ydhm3mGsADsLgl/afGb/knqxBQOsCD120COHQH43pxJPGZiokOKfNCv3TFegcZ
	rEukEftXGBAvWVYCYiJrXNB0ul2lDZVS5pRVQ81w/fnpRFP5z8xRYBMfV+igHRKuJxORyWzAdDx
	Ol77xe3AhUH6nFzMUVWkatYyskdCwHbwjq3xbtZ2QJWagwkVb4o7aZV1Mcty8A96qqGjQpnInKG
	hXtVUsr2e4KYwfJfBR5mnirMXpGBYBoTRXSmqqMrBulpV9KUtySKl/JlQos67bwoAd0m8i2/vmo
	sKxk/GiKHGQQF/X6f264oledFCpain+nTvaPxge4sXR9g7ytVVlvTbS7PslUy2QTbcqDIW0EGIh
	P0mQQQHvoEZFZIRtgau27DmvZ5bsnmWOqtfC/O0y+CKTiGLkh/A8yIo36OMXEy5qAtg4rbgqicV
	ynf8e8Vudl6nLBavVepp7VDvRD/YVD73WLbzaPF/Q77G3NXGcY+8vm0PUMOl5zXz8t56z2Dd7Jx
	nm5AklxZT48eFyv1GhGZjPR8d4bMjpG/lJmKzE9ThfJAsVGOCDy4=
X-Received: by 2002:a5d:5f83:0:b0:491:9128:5720 with SMTP id ffacd0b85a97d-491912859camr1718322f8f.6.1793868224148;
        Thu, 05 Nov 2026 00:43:44 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d8e29sm9200620f8f.19.2026.11.05.00.43.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:43:43 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 12/60] bison: Fix CVE-2026-56390
Date: Thu,  5 Nov 2026 09:42:31 +0100
Message-ID: <12c98a048cbe34833c371d5b1edc346b31bbdf3b.1793867929.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793867929.git.yoann.congal@smile.fr>
References: <cover.1793867929.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 08:43:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249471
Content-Type: text/plain; charset="utf-8"

From: Yogita Urade <yurade@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://cgit.git.savannah.gnu.org/cgit/bison.git/commit/?id=8d101c19d4d9aaedf83a448c925513742d4efcf0
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-56390

Signed-off-by: Yogita Urade <yurade@cisco.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: eefec9cde464081f5943f4ad5c3cb688a87eff1f)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../bison/bison/CVE-2026-56390.patch          | 236 ++++++++++++++++++
 meta/recipes-devtools/bison/bison_3.8.2.bb    |   1 +
 2 files changed, 237 insertions(+)
 create mode 100644 meta/recipes-devtools/bison/bison/CVE-2026-56390.patch

diff --git a/meta/recipes-devtools/bison/bison/CVE-2026-56390.patch b/meta/recipes-devtools/bison/bison/CVE-2026-56390.patch
new file mode 100644
index 00000000000..a63f3952e31
--- /dev/null
+++ b/meta/recipes-devtools/bison/bison/CVE-2026-56390.patch
@@ -0,0 +1,236 @@
+From 8d101c19d4d9aaedf83a448c925513742d4efcf0 Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Thu, 23 Apr 2026 12:41:25 -0700
+Subject: [PATCH] bison: tighten up output file names
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
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
+  src/parse-gram.h-only metadata changes while retaining the
+  security-relevant parser changes.
+
+(cherry picked from commit 8d101c19d4d9aaedf83a448c925513742d4efcf0)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ THANKS           |  1 +
+ doc/bison.texi   |  2 ++
+ src/parse-gram.y | 31 ++++++++++++++++++++++-----
+ src/parse-gram.c | 56 ++++++++++++++++++++++++++++++++----------------
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
+index 3c1d8229..7f6deb33 100644
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
+-- 
+2.44.4
+
diff --git a/meta/recipes-devtools/bison/bison_3.8.2.bb b/meta/recipes-devtools/bison/bison_3.8.2.bb
index 03d3cffe2ae..339a9d13364 100644
--- a/meta/recipes-devtools/bison/bison_3.8.2.bb
+++ b/meta/recipes-devtools/bison/bison_3.8.2.bb
@@ -13,6 +13,7 @@ SRC_URI = "${GNU_MIRROR}/bison/bison-${PV}.tar.xz \
            file://autoconf-2.73.patch \
            file://add-with-bisonlocaledir.patch \
            file://CVE-2026-56389.patch \
+           file://CVE-2026-56390.patch \
            "
 SRC_URI[sha256sum] = "9bba0214ccf7f1079c5d59210045227bcf619519840ebfa80cd3849cff5a5bf2"
 
