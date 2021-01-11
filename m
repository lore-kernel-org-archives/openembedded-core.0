Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web12.27431.1610325991410661480
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Jan 2021 16:46:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=1aOJmgWH;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id i5so11554304pgo.1
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Jan 2021 16:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=eujROhNt7ULLTb6qzYAFTtP4pfT2vxo8fW8XCYelwhM=;
        b=1aOJmgWH4R6PA9oNQePci8tD74RvrpRbN55XPaCnHb1uRcY4AegPXhINR9XnSbqV0s
         tn3ha3QFaQ8WTUu+dpLiC9MoSmwutKiKZTrqJS+u8Iq2JI/4b/PtWbxDKPrxZWv4+06v
         5qYmKnmXzP9ZN7DvOb7nhYkz6mw7goBo85KasRUie2m0WU6f9m3Z4I0RizV3ywL+2aX5
         IVhi6grU9kLqu6GCx0rnclI57/Mw97wkn/88v8B014bCkGT7y75ACUP2oKrJCrxba/3b
         P2zGRAeKj0rY8BMbcs+uhuUvlevvC9WN2Cnn/9TbjBRz5M+QAQpGCdn+AvR8+J+Z/nM9
         nUBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=eujROhNt7ULLTb6qzYAFTtP4pfT2vxo8fW8XCYelwhM=;
        b=amoCZUf3u/13nPv5UA7Gs/jokC/eqqscwQvOOmpKZbj63eWxdEvzTc6uAbyT5zm2kK
         ++IdopDw+yrS+jieqaTGJOsQjMh+OR17Bh0Y6v7APPKBbdg2L11B0PG/+ziPLcTDJNR6
         l2tSB+WrzimILfJSVvSGdv3bQr6JzgW8fTflJUVwrcC0JoCkCWA/CYO+IVMMu/WFtdPl
         plOj5rgqGgsIj5GcBVDKeFdzWKh9baoi8yyzYuMJPeqcWBFXLCxlHr7QQzY1o6s4scgx
         U60RXuHBOlOHG0yxekEECDVYOjoQOFDszkNnhRnoaIE/PyjwBf/xrzR6Z022hWQCULr2
         ntVA==
X-Gm-Message-State: AOAM532vBZMix20Sqqpszry/pRgL1svVMrh3M0ashfa5YQfl2PKvad8Y
	46EZl6N4R+MpaXkwsV07JrwyVYTEBQBf/WsAXTY=
X-Google-Smtp-Source: ABdhPJx7FPdJ2+4OcTw5VjsZoGvdvh3g+U7+JZFtnzoDi5WXy4+4mKhdgcNEnJh6I1VwdKEo1GHx/g==
X-Received: by 2002:a62:1506:0:b029:19e:aca2:4ed8 with SMTP id 6-20020a6215060000b029019eaca24ed8mr13918802pfv.27.1610325990510;
        Sun, 10 Jan 2021 16:46:30 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id v125sm17729079pgv.6.2021.01.10.16.46.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jan 2021 16:46:29 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/12] glibc: update to 2.31 stable tree head
Date: Sun, 10 Jan 2021 14:45:47 -1000
Message-Id: <66c3133fa83fc8fdbe7c48a5ec8b3df592010f43.1610325804.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1610325804.git.steve@sakoman.com>
References: <cover.1610325804.git.steve@sakoman.com>

From: Mikko Rapeli <mikko.rapeli@bmw.de>

Includes fixes:

$ git log --format="%h %s" 6fdf971c9dbf7dac9bea552113fe4694015bbc4d..df31c7ca927242d5d4eee97f93a01e23ff47e332
df31c7ca92 iconv: Accept redundant shift sequences in IBM1364 [BZ #26224]
7df507808c sh: Add sh4 fpu Implies folder
8dc7605665 aarch64: Fix DT_AARCH64_VARIANT_PCS handling [BZ #26798]
48cf525f4b x86: Optimizing memcpy for AMD Zen architecture.
8d730cb25a Reversing calculation of __x86_shared_non_temporal_threshold
4bc9918c99 AArch64: Use __memcpy_simd on Neoverse N2/V1
4722d1fb9d [AArch64] Improve integer memcpy
bea507a3f5 AArch64: Rename IS_ARES to IS_NEOVERSE_N1
d0a5b76902 AArch64: Improve backwards memmove performance
24a30c5959 AArch64: Add optimized Q-register memcpy
88db98fa6e AArch64: Align ENTRY to a cacheline
32965a46ce intl: Handle translation output codesets with suffixes [BZ #26383]

Tested on aarch64 target with CI and long running tests.

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 3bcd336de4..5f726537ff 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.31/master"
 PV = "2.31+git${SRCPV}"
-SRCREV_glibc ?= "6fdf971c9dbf7dac9bea552113fe4694015bbc4d"
+SRCREV_glibc ?= "df31c7ca927242d5d4eee97f93a01e23ff47e332"
 SRCREV_localedef ?= "cd9f958c4c94a638fa7b2b4e21627364f1a1a655"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
-- 
2.17.1

