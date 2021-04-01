Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web09.2569.1617246470907929192
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Mar 2021 20:07:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hVNZ/i1S;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id v8so268263plz.10
        for <openembedded-core@lists.openembedded.org>; Wed, 31 Mar 2021 20:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rQc0bQ1d+6dERMLVegR1aEB+PXGxV/2nPRUvQZnSRas=;
        b=hVNZ/i1SBtOVts1x+kBQeLk207+IcUsoKaZIrQ7p16iv9uZO0Mi9c+IEWq5BSBXwsV
         /HFXhQA0aAA8Zc4jvSpt3dOD/cBpj23N7jmD+rROKMotmWo2qnuOekRHO8KV+z2E1JCZ
         0tuJABIX4OrQssa6oPP8ZbAlf4qZPFBoxqBDZCJhikfjCfIfdwqGmTJTDubkySobnYVt
         jZwd598iMjGpsy/9Uzh9tHMr5LLsZG+PaXZ3gyNSnwV5hcJ9ZysOT8YQ42xUD+n8i931
         X7+ozmag0jh+NCdCn/Ky36vIol5GbuZ4ehSavXPHWlwvqK4JvuWTxh0eED3YfOtv3Lev
         2OXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rQc0bQ1d+6dERMLVegR1aEB+PXGxV/2nPRUvQZnSRas=;
        b=UuivSpXPaM4hWfLLS9WXi++IHw87+UA9ndENvR9ML45Qozm4mvutkRuxbr/NqDD53c
         YNm90fr9lTfaEBZcDlAapcy+w9NyDjFltgXjF2vKbEj5tiaXnA42DA0qX3wzoPWbf10m
         ZotyNr35gLQ+oyYiMJn6x8eG/ltv7v6I1nbkxWaEkRJo802NWaM4ASFThi/SZ3NlR4Js
         PjEswCl/bWrMfHh1P8QwZkOCELdIhtsYwZ2LOhNHhYcSnH3lNN+9ryJpExERF9+mjG8B
         4NpA1JhTplorj5LsnbnLOiNRiyYl3i2aGguSu0ePQiYqkq662+PpZ/ioUYUskyszqO3l
         S2Vw==
X-Gm-Message-State: AOAM533xKjo10NgEstdhp4TwTwn/4J8wo77DTOlCP6BFVZRyt537rdsa
	awLC4BrnP39bhyGUwvURSJa04UGx24LGpg==
X-Google-Smtp-Source: ABdhPJynYpwNv8uvXizTXL45k1S/b4GXF1uCpI3y7a0wcwkmW4Wvf+Leyeh9NQTdKB9/GPjGrLi9LA==
X-Received: by 2002:a17:90a:ab09:: with SMTP id m9mr6886677pjq.122.1617246469983;
        Wed, 31 Mar 2021 20:07:49 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ae20])
        by smtp.gmail.com with ESMTPSA id q15sm4010683pje.28.2021.03.31.20.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 20:07:49 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] binutils: Fix a missing break in case statement
Date: Wed, 31 Mar 2021 20:07:47 -0700
Message-Id: <20210401030747.2316666-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This was missed during patch forward porting
its only effective when printing options

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-system-directories-when-cross-linki.patch | 23 ++++++++++---------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-devtools/binutils/binutils/0008-warn-for-uses-of-system-directories-when-cross-linki.patch b/meta/recipes-devtools/binutils/binutils/0008-warn-for-uses-of-system-directories-when-cross-linki.patch
index 3f83d48f62..5c148eaa95 100644
--- a/meta/recipes-devtools/binutils/binutils/0008-warn-for-uses-of-system-directories-when-cross-linki.patch
+++ b/meta/recipes-devtools/binutils/binutils/0008-warn-for-uses-of-system-directories-when-cross-linki.patch
@@ -1,4 +1,4 @@
-From a1d0ca24d3bbdf4cb37537cd84d04a17bf0f813b Mon Sep 17 00:00:00 2001
+From bb48edf1a87bbc711e8978dd1e9112fe953dc1bf Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 15 Jan 2016 06:31:09 +0000
 Subject: [PATCH] warn for uses of system directories when cross linking
@@ -59,8 +59,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  ld/ldfile.c     | 17 +++++++++++++++++
  ld/ldlex.h      |  2 ++
  ld/ldmain.c     |  2 ++
- ld/lexsup.c     | 15 +++++++++++++++
- 9 files changed, 85 insertions(+)
+ ld/lexsup.c     | 16 ++++++++++++++++
+ 9 files changed, 86 insertions(+)
 
 diff --git a/ld/config.in b/ld/config.in
 index 7b60d778587..37b8e9b6f6c 100644
@@ -77,7 +77,7 @@ index 7b60d778587..37b8e9b6f6c 100644
  #undef EXTRA_SHLIB_EXTENSION
  
 diff --git a/ld/configure b/ld/configure
-index d399d08d0c4..8355c433c76 100755
+index b0969791959..50bb04ce6a8 100755
 --- a/ld/configure
 +++ b/ld/configure
 @@ -828,6 +828,7 @@ with_lib_path
@@ -235,7 +235,7 @@ index 080b1c4c6c2..78d8a2df278 100644
    /* We initialize DEMANGLING based on the environment variable
       COLLECT_NO_DEMANGLE.  The gcc collect2 program will demangle the
 diff --git a/ld/lexsup.c b/ld/lexsup.c
-index f005a58a045..c83292a9427 100644
+index f005a58a045..5eb8439fef7 100644
 --- a/ld/lexsup.c
 +++ b/ld/lexsup.c
 @@ -591,6 +591,14 @@ static const struct ld_option ld_options[] =
@@ -253,17 +253,18 @@ index f005a58a045..c83292a9427 100644
  };
  
  #define OPTION_COUNT ARRAY_SIZE (ld_options)
-@@ -1674,6 +1682,13 @@ parse_args (unsigned argc, char **argv)
- 
- 	case OPTION_PRINT_MAP_DISCARDED:
+@@ -1676,6 +1684,14 @@ parse_args (unsigned argc, char **argv)
  	  config.print_map_discarded = TRUE;
-+
+ 	  break;
+ 
 +	case OPTION_NO_POISON_SYSTEM_DIRECTORIES:
 +	  command_line.poison_system_directories = FALSE;
 +	  break;
 +
 +	case OPTION_ERROR_POISON_SYSTEM_DIRECTORIES:
 +	  command_line.error_poison_system_directories = TRUE;
- 	  break;
- 
++	  break;
++
  	case OPTION_DEPENDENCY_FILE:
+ 	  config.dependency_file = optarg;
+ 	  break;
-- 
2.31.1

