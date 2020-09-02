Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.919.1599081254253253975
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2020 14:14:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=P0+wPzq9;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id n13so427619edo.10
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2020 14:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+yCK9l8Da8s+MqJ4AJfoVeWPux49/xNVfNkDsP/sW3s=;
        b=P0+wPzq9EM2XSkpu2nFrU7LkRmKvvAw+Q4+slPbs5h4DjWQguhE9oxkLX01TEL/Er4
         TrmuXmt/dus+qEKet5pnNzOJEzj9DsL96msMYIVz4haDHwyKUSajzoRjyk+OCtKtCFvj
         0ihHJY3NEFgn5mD9g/kA/0NtFNmDdfMrItv1IDb0RAAmPRMYuZr/PA1/bRU6fsaYbVJY
         I4BTYbhXN3p0P77ejxYRuSA4y0bhaEBK2KoXoYg8/MYRD05O2hghWbV/3XI2FHdb5ez0
         EsAxEnNJ5I3ttXxH4XviDR3yK8GNS3oLdSi+rZjLdkf0arQG5lIR38lE5rMbAnlSRtHX
         FqHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+yCK9l8Da8s+MqJ4AJfoVeWPux49/xNVfNkDsP/sW3s=;
        b=cfdE/Z/SuV44lwICOTMjm5ozpYWCYh+A4cSHhm0kHPRtcIvLVGNuUll2DyEjfY3wuK
         tj3RlHk+KSST7dn04kzvj/soQUZduSD+Ljiquv34x67EOpKjyryZWT/MXO+ePaJdpG4l
         /aIdLzcZMHC+EBHBF6YXmdmrKYA1XmJXgX9mkt5zcaspcDIb4OTPZCRta4Wtx0KajWpM
         sE4EOBiz/OMCcVezwMvtrKwA2/8l5nfuJXQWo6NNOWFnq8B5bjJT/dGmVhN4lSPkgcZm
         2XNZoluyEcsPt9kkfYsu7vwjgsd/dKjvGZlBHnVmC0A5cQ9GfRKHuHEmPihts6kv/t7/
         Rv2Q==
X-Gm-Message-State: AOAM531dMwCey4zFyPL25Y3uuo36VQL76VrbvPZ2PD1uCXK+sTxVXL4y
	pLgDFCisjim0sda81G7mKgEGrNCQrlo=
X-Google-Smtp-Source: ABdhPJybojiDlWA9xsUvrpHzzjWtTv7or0ljd4cB9Ry2A3o5yEAA5kCvfge5h/UPXbtr2vAGJZXANg==
X-Received: by 2002:a05:6402:1151:: with SMTP id g17mr2066476edw.227.1599081252450;
        Wed, 02 Sep 2020 14:14:12 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:b652:c378:b428:fdf])
        by smtp.gmail.com with ESMTPSA id ch29sm631607edb.74.2020.09.02.14.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 14:14:11 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 18/23] nasm: update 2.15.03 -> 2.15.05
Date: Wed,  2 Sep 2020 23:13:25 +0200
Message-Id: <20200902211330.4853-18-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200902211330.4853-1-alex.kanavin@gmail.com>
References: <20200902211330.4853-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use autotools-brokensep as new version needs that.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../0002-Add-debug-prefix-map-option.patch    | 42 +++++++++----------
 .../nasm/{nasm_2.15.03.bb => nasm_2.15.05.bb} |  4 +-
 2 files changed, 22 insertions(+), 24 deletions(-)
 rename meta/recipes-devtools/nasm/{nasm_2.15.03.bb => nasm_2.15.05.bb} (81%)

diff --git a/meta/recipes-devtools/nasm/nasm/0002-Add-debug-prefix-map-option.patch b/meta/recipes-devtools/nasm/nasm/0002-Add-debug-prefix-map-option.patch
index f788e0fd43..9f4c8dc0bd 100644
--- a/meta/recipes-devtools/nasm/nasm/0002-Add-debug-prefix-map-option.patch
+++ b/meta/recipes-devtools/nasm/nasm/0002-Add-debug-prefix-map-option.patch
@@ -1,4 +1,4 @@
-From bb4e42ad3a0cdd23a1d1797e6299c76b474867c0 Mon Sep 17 00:00:00 2001
+From 81d6519499dcfebe7d21e65e002a8885a4e8d852 Mon Sep 17 00:00:00 2001
 From: Joshua Watt <JPEWhacker@gmail.com>
 Date: Tue, 19 Nov 2019 13:12:17 -0600
 Subject: [PATCH] Add --debug-prefix-map option
@@ -11,7 +11,7 @@ Upstream-Status: Submitted [https://bugzilla.nasm.us/show_bug.cgi?id=3392635]
 Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
 
 ---
- asm/nasm.c              | 26 +++++++++++++++++++++++++-
+ asm/nasm.c              | 24 ++++++++++++++++++++++++
  include/nasmlib.h       |  9 +++++++++
  nasm.txt                |  4 ++++
  nasmlib/filename.c      | 20 ++++++++++++++++++++
@@ -23,34 +23,32 @@ Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
  stdlib/strlcat.c        |  2 +-
  test/elfdebugprefix.asm |  6 ++++++
  test/performtest.pl     | 12 ++++++++++--
- 12 files changed, 83 insertions(+), 10 deletions(-)
+ 12 files changed, 82 insertions(+), 9 deletions(-)
  create mode 100644 test/elfdebugprefix.asm
 
 diff --git a/asm/nasm.c b/asm/nasm.c
-index a0e1719..fc6c62e 100644
+index e5ae89a..7a7f8b4 100644
 --- a/asm/nasm.c
 +++ b/asm/nasm.c
-@@ -938,7 +938,8 @@ enum text_options {
-     OPT_LIMIT,
+@@ -939,6 +939,7 @@ enum text_options {
      OPT_KEEP_ALL,
      OPT_NO_LINE,
--    OPT_DEBUG
-+    OPT_DEBUG,
-+    OPT_DEBUG_PREFIX_MAP
+     OPT_DEBUG,
++    OPT_DEBUG_PREFIX_MAP,
+     OPT_REPRODUCIBLE
  };
  enum need_arg {
-     ARG_NO,
-@@ -970,6 +971,7 @@ static const struct textargs textopts[] = {
+@@ -971,6 +972,7 @@ static const struct textargs textopts[] = {
      {"keep-all", OPT_KEEP_ALL, ARG_NO, 0},
      {"no-line",  OPT_NO_LINE, ARG_NO, 0},
      {"debug",    OPT_DEBUG, ARG_MAYBE, 0},
 +    {"debug-prefix-map", OPT_DEBUG_PREFIX_MAP, true, 0},
+     {"reproducible", OPT_REPRODUCIBLE, ARG_NO, 0},
      {NULL, OPT_BOGUS, ARG_NO, 0}
  };
- 
-@@ -1332,6 +1334,26 @@ static bool process_arg(char *p, char *q, int pass)
-                 case OPT_DEBUG:
-                     debug_nasm = param ? strtoul(param, NULL, 10) : debug_nasm+1;
+@@ -1337,6 +1339,26 @@ static bool process_arg(char *p, char *q, int pass)
+                 case OPT_REPRODUCIBLE:
+                     reproducible = true;
                      break;
 +                case OPT_DEBUG_PREFIX_MAP: {
 +                    struct debug_prefix_list *d;
@@ -75,7 +73,7 @@ index a0e1719..fc6c62e 100644
                  case OPT_HELP:
                      help(stdout);
                      exit(0);
-@@ -2297,6 +2319,8 @@ static void help(FILE *out)
+@@ -2304,6 +2326,8 @@ static void help(FILE *out)
          "    -w-x          disable warning x (also -Wno-x)\n"
          "    -w[+-]error   promote all warnings to errors (also -Werror)\n"
          "    -w[+-]error=x promote warning x to errors (also -Werror=x)\n"
@@ -85,7 +83,7 @@ index a0e1719..fc6c62e 100644
  
      fprintf(out, "       %-20s %s\n",
 diff --git a/include/nasmlib.h b/include/nasmlib.h
-index e9bfbcc..98fc653 100644
+index 438178d..4c3e90d 100644
 --- a/include/nasmlib.h
 +++ b/include/nasmlib.h
 @@ -250,10 +250,19 @@ int64_t readstrnum(char *str, int length, bool *warn);
@@ -181,10 +179,10 @@ index 54b22f8..c4a412c 100644
  
  static void as86_cleanup(void)
 diff --git a/output/outcoff.c b/output/outcoff.c
-index bcd9ff3..15bfcf3 100644
+index 58fa024..14baf7b 100644
 --- a/output/outcoff.c
 +++ b/output/outcoff.c
-@@ -1095,14 +1095,14 @@ static void coff_symbol(char *name, int32_t strpos, int32_t value,
+@@ -1072,14 +1072,14 @@ static void coff_symbol(char *name, int32_t strpos, int32_t value,
  
  static void coff_write_symbols(void)
  {
@@ -215,7 +213,7 @@ index 61af020..1292958 100644
      nsects = sectlen = 0;
      syms = saa_init((int32_t)sizeof(struct elf_symbol));
 diff --git a/output/outieee.c b/output/outieee.c
-index 4cc0f0f..2468724 100644
+index 6d6d4b2..cdb8333 100644
 --- a/output/outieee.c
 +++ b/output/outieee.c
 @@ -207,7 +207,7 @@ static void ieee_unqualified_name(char *, char *);
@@ -228,10 +226,10 @@ index 4cc0f0f..2468724 100644
      fpubhead = NULL;
      fpubtail = &fpubhead;
 diff --git a/output/outobj.c b/output/outobj.c
-index 0d4d311..d8dd6a0 100644
+index 56b43f9..fefea94 100644
 --- a/output/outobj.c
 +++ b/output/outobj.c
-@@ -638,7 +638,7 @@ static enum directive_result obj_directive(enum directive, char *);
+@@ -644,7 +644,7 @@ static enum directive_result obj_directive(enum directive, char *);
  
  static void obj_init(void)
  {
diff --git a/meta/recipes-devtools/nasm/nasm_2.15.03.bb b/meta/recipes-devtools/nasm/nasm_2.15.05.bb
similarity index 81%
rename from meta/recipes-devtools/nasm/nasm_2.15.03.bb
rename to meta/recipes-devtools/nasm/nasm_2.15.05.bb
index 5c4e28de06..6a1294c34f 100644
--- a/meta/recipes-devtools/nasm/nasm_2.15.03.bb
+++ b/meta/recipes-devtools/nasm/nasm_2.15.05.bb
@@ -8,11 +8,11 @@ SRC_URI = "http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.tar.bz2 \
            file://0002-Add-debug-prefix-map-option.patch \
            "
 
-SRC_URI[sha256sum] = "04e7343d9bf112bffa9fda86f6c7c8b120c2ccd700b882e2db9f57484b1bd778"
+SRC_URI[sha256sum] = "3c4b8339e5ab54b1bcb2316101f8985a5da50a3f9e504d43fa6f35668bee2fd0"
 
 EXTRA_AUTORECONF_append = " -I autoconf/m4"
 
-inherit autotools
+inherit autotools-brokensep
 
 BBCLASSEXTEND = "native"
 
-- 
2.28.0

