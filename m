Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web09.8315.1619070233719203922
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Apr 2021 22:43:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=g3FVJoRP;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id m11so30916718pfc.11
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Apr 2021 22:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vaDMk99ZbXCjpYLF63N5MXBQCbYXsln8RdvXNqmQXWU=;
        b=g3FVJoRPiyyEoXZrApoBZ3lz2+HerYesGDCR8cshiq5gdqqrRLOrPTfjvTHpP+nqqZ
         ilIfL+N1nipWZE0a6UqwPBl/Wsb+ioPxQKqpXCFzNPFYHXTe+S5jFVpkvyiGPCTgJYD7
         cfhA0MNvUwyirWoOAOy86fGY+EHGKBuA/xZMCu/qSlU0XpWY40S5ARHHNObghniOAuk3
         j+gvwJIqi8nNrolkoj+JcCcHXCNRfTXxyjt+fKA8H0OgU16xTziObYJh7/V4Lb2MMUrj
         7QsX0Un1DYlHBV2QdH8L/D4War/a0/FMmA5WF2G24btVHoOFQrokOFiI08tlybx+24Pj
         n/EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vaDMk99ZbXCjpYLF63N5MXBQCbYXsln8RdvXNqmQXWU=;
        b=HqMkdH4qmgYlkTlix0EFABI2nE7PMfldns7MwzC+qrjmK5Xd09PAVC1qAoHopOE8fI
         4+hfvV7oqOJ/RS1ldipY6W3Pj16c0Tc8lKXmDWnvl2IOmd1KZugd+v1jsX8m6Zo6GFLa
         MObPw9lgk1K53d2CAWE/G5Y4FrPezn0EBjvK6j1cSeTTRDXW+fCjzTDm4F501nYH7eiq
         IfY7oiFHN8Pg8wkODoEEClYoz69AVZucNtarfkXzx47cE+HwAJGz/GT5K0IDsMrBdh6t
         SmhOmSJvYaCPfk12Yq2CWJHMR5i99jU8XMecjnx2GZURw88TzoJmP7KURoycvIPPAxkr
         Qa2g==
X-Gm-Message-State: AOAM5335iyU74/ivU1iMSy6EVsP7LnwAmsxwzo/lssxzcJCsRzQsRi6w
	E3tW5VszwvpO3GN97Q8fA2ryLDC0fd0Bkw==
X-Google-Smtp-Source: ABdhPJx2VTxRDbe0nzjbl5QnvrdlRuPVKko1OiFAIrKoblNtdmjlKz03MHGFJAwm/bKKZE16lZzNCg==
X-Received: by 2002:a65:5888:: with SMTP id d8mr1773411pgu.23.1619070231977;
        Wed, 21 Apr 2021 22:43:51 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bc1b])
        by smtp.gmail.com with ESMTPSA id r1sm984254pfh.153.2021.04.21.22.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Apr 2021 22:43:51 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] musl: Update to latest master
Date: Wed, 21 Apr 2021 22:43:49 -0700
Message-Id: <20210422054349.3448084-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

changelog [1]

* aad50fcd fix regression in dl_iterate_phdr reporting of modules with no TLS
* 0ea78a64 nscd: fall back gracefully on kernels without AF_UNIX support
* 95a540e1 mallocng/aligned_alloc: check for malloc failure
* 2c00f95c make epoll_[p]wait a cancellation point
* 521b4d27 fix dl_iterate_phdr dlpi_tls_data reporting to match spec
* 122002f0 remove no-longer-needed special case handling in popen
* 8ef9d46f use internal malloc for posix_spawn file actions objects
* cfdfd5ea don't fail to map library/executable with zero-length segment maps
* e48e99c1 suppress isascii() macro for C++
* b129cd86 guard against compilers failing to handle setjmp specially by default
* 3309e2d7 aarch64/bits/mman.h: add PROT_MTE from linux v5.10
* 44331150 aarch64/bits/hwcap.h: add HWCAP2_MTE from linux v5.10
* 42aa19a0 add aarch64/bits/mman.h with PROT_BTI from linux v5.8
* b7554b5e aarch64/bits/hwcap.h: add HWCAP2_BTI from linux v5.8
* 87b8f148 signal.h: add MTE specific SIGSEGV codes from linux v5.10
* 19239cde sys/prctl.h: add MTE related constants from linux v5.10
* 8b29f023 elf.h: add NT_ARM_TAGGED_ADDR_CTRL from linux v5.10
* d7210f0c sys/mman.h: add MAP_HUGE_16KB from linux v5.10
* a7456524 sys/mount.h: add MS_NOSYMFOLLOW from linux v5.10
* 54ca1cc7 sys/membarrier.h: add new constants from linux v5.10
* fd285f9d bits/syscall.h: add process_madvise from linux v5.10
* 49b6df3d fix error return value for cuserid
* cc577d0e fix misuse of getpwuid_r in cuserid
* a75283d7 cuserid: don't return truncated results
* ef137da6 cuserid: support invocation with a null pointer argument

[1] https://git.musl-libc.org/cgit/musl/log/\?qt\=range\&q\=e5d2823631bbfebacf48e1a34ed28f28d7cb2570..aad50fcd791e009961621ddfbe3d4c245fd689a3

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index e6f9e2441e..ef8bc2eec3 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -4,7 +4,7 @@
 require musl.inc
 inherit linuxloader
 
-SRCREV = "e5d2823631bbfebacf48e1a34ed28f28d7cb2570"
+SRCREV = "aad50fcd791e009961621ddfbe3d4c245fd689a3"
 
 BASEVER = "1.2.2"
 
-- 
2.31.1

