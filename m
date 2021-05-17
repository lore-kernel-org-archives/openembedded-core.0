Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web08.186.1621289360996538253
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 15:09:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mjNeWaVh;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id p6so3937446plr.11
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 15:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NBjeBHi7DQFT1N0K+11BcHerp8+APJFTx8T0KGy8jlk=;
        b=mjNeWaVh+EM0X2Ztnt7IyuinIH9ftMCNR7wfIAiCuyo768OzZAFmZX5bRN1XfZdbBH
         55YiJ60gsBL0udqtsqE5OD9hudJJ/AuVdiC8aV9CGzKqnLF6+fIg2BdMfiTl59BeSoES
         Scp59q6NfnrEW7jZ7MbkWo4APs4mV6SYb3LbmeNd64ZUk9rhJLX9sVKRkSoxyjkKWhDG
         P1Xr8iYybeGPnOQF44jagTY1NlG9VpyEqI9+GcYWfl2uQXPajrrFuEgMF/HpuM+kfn/U
         0ZD0DA1ebAoToAdJl2O7KHVkf7884TgVZaYBnKVAfI4BHh+A3c9fnsouiucmNuZ+Ujzz
         FJ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NBjeBHi7DQFT1N0K+11BcHerp8+APJFTx8T0KGy8jlk=;
        b=AnHx8N1qALnLXxXt/Vs7ijHNIGJMhpGvHEILhlZIZ+6IlJJi/E6VQn6xD5P+c+IlEO
         ZycAVbHBITiM9fAVaIeR6J1sgIv43yKnvOqPvrOsE2pZEUACnKfgeQ9JjIA+wrQRXeVa
         p8K3Ht7Gsjrluade1n3knwG8zPEEG5uzr40d2ooOpAYC51pv5E0P73kUIHP2Mx5RxHgG
         aoP9vu5oLskV8RO2LJeznpFHw/1uTgYz5a3Yc1TS+dQrs9RxBHRPcnzbuqXKTMyLW+Il
         i3y1oSYAf0c0NjPglknSX0TZM0kahlSoFEJPCsTUr0MpIS41TXcM9Edx6ZTkTgO5KIF2
         LIcA==
X-Gm-Message-State: AOAM533xHlTOJEn7Z1/lqmGsraNnJMqhBN5ybDUas+Pgf4wew5xdW56j
	+9GIZwzBmvap6Ad+/pqOJNJO+PJB7av4ag==
X-Google-Smtp-Source: ABdhPJxGM1evYdKydP1SThF2BoX17YNYFMZJWVji2rgoVfqbaN+oqPK+M9rDDHm2JOo51moSxxs5Cg==
X-Received: by 2002:a17:902:ea03:b029:ef:adb3:a6ab with SMTP id s3-20020a170902ea03b02900efadb3a6abmr659046plg.47.1621289360320;
        Mon, 17 May 2021 15:09:20 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0:db81:2f56:60e4:2c64])
        by smtp.gmail.com with ESMTPSA id s184sm11307010pgc.29.2021.05.17.15.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 15:09:19 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/3] gcc: Refresh patch to fix patch fuzz
Date: Mon, 17 May 2021 15:09:15 -0700
Message-Id: <20210517220915.3760392-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517220915.3760392-1-raj.khem@gmail.com>
References: <20210517220915.3760392-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is due to previous patches editing common files from this patch

Fixes
ERROR: gcc-source-11.1.0-11.1.0-r0 do_patch: Fuzz detected:

Applying patch 0028-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
patching file gcc/config/linux.h
Hunk #1 succeeded at 203 with fuzz 1 (offset 8 lines).
patching file gcc/config/rs6000/linux.h
patching file gcc/config/rs6000/linux64.h

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ..._nonshared-to-link-commandline-for-musl-targe.patch | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc/0028-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch b/meta/recipes-devtools/gcc/gcc/0028-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
index edca9e3ca4..9c616d24d0 100644
--- a/meta/recipes-devtools/gcc/gcc/0028-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
+++ b/meta/recipes-devtools/gcc/gcc/0028-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
@@ -22,12 +22,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  gcc/config/rs6000/linux64.h | 10 ++++++++++
  3 files changed, 27 insertions(+)
 
-diff --git a/gcc/config/linux.h b/gcc/config/linux.h
-index 87efc5f69fe..3c7b7c538b9 100644
 --- a/gcc/config/linux.h
 +++ b/gcc/config/linux.h
-@@ -195,6 +195,13 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
-     { GCC_INCLUDE_DIR, "GCC", 0, 1, 0, 0 },		\
+@@ -203,6 +203,13 @@ see the files COPYING3 and COPYING.RUNTI
+     { GCC_INCLUDE_DIRVAR, "GCC", 0, 1, 0, 0 },		\
      { 0, 0, 0, 0, 0, 0 }				\
    }
 +#ifdef TARGET_LIBC_PROVIDES_SSP
@@ -40,8 +38,6 @@ index 87efc5f69fe..3c7b7c538b9 100644
  #endif
  
  #if (DEFAULT_LIBC == LIBC_UCLIBC) && defined (SINGLE_LIBC) /* uClinux */
-diff --git a/gcc/config/rs6000/linux.h b/gcc/config/rs6000/linux.h
-index 47c9d9ac0b6..d065f88b377 100644
 --- a/gcc/config/rs6000/linux.h
 +++ b/gcc/config/rs6000/linux.h
 @@ -94,6 +94,16 @@
@@ -61,8 +57,6 @@ index 47c9d9ac0b6..d065f88b377 100644
  #undef LINK_OS_LINUX_SPEC
  #define LINK_OS_LINUX_SPEC LINK_OS_LINUX_EMUL " %{!shared: %{!static: \
    %{!static-pie: \
-diff --git a/gcc/config/rs6000/linux64.h b/gcc/config/rs6000/linux64.h
-index a11e01faa3d..ce464f3626b 100644
 --- a/gcc/config/rs6000/linux64.h
 +++ b/gcc/config/rs6000/linux64.h
 @@ -369,6 +369,16 @@ extern int dot_symbols;
-- 
2.31.1

