Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.16044.1618418423391188038
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Apr 2021 09:40:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=D7TmEBKy;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id nm3-20020a17090b19c3b029014e1bbf6c60so6936046pjb.4
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Apr 2021 09:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+VEBngtT7QjE9Io0YjrzcEva3g5sdmBDoffgLVzm8k0=;
        b=D7TmEBKyfTyui0s/rXaKbq3cjerl69gUSukw+SiKub0Y1ILMzK1zXmAnmQL0ny21V6
         O22PTXSSZbM7FwmUBk5eds8fmeHLYrk/NxeIoZ+NSGNCNHlTr33yLYB6R9Xt6u/0OvXh
         J4+Agwp/WH7k0yf5pC6FbrLswoVhBJ2OGBM3mF3F63Gkas7poD7xUVlhNoU5+kIzrg1l
         4j0Oqogg1wBhTIi1tezEQ8DnTLMEhKI1YPyrpJSZkjQiXevszAI6ZuKEjlQEj7CTTA0E
         FXDLwCNwojff/+296DO46RA5Dh9eBN7+2QA542ntpTXxsrIWTRjiMUFo7wC+N7my9TUV
         DapA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+VEBngtT7QjE9Io0YjrzcEva3g5sdmBDoffgLVzm8k0=;
        b=V9zk+/5nBNVPMbIitSUjwodLxIn8nTp8VVEqMAlT61FegqyO7L3HGC3Rgg55w486Ik
         C38Tw/R9BBlytsRJREUPbydE4XcXjGGrB+1rRlRVzEvzaiHrSb4Y+gu15FauDUcLOF7W
         KUKrNIBvV/BVa1XGqKKsGJKHJWz3wV2QxVZyzm6Jwz6oeLytd1Wz9AEzyczQ7UmOuEJI
         5xEZ9dlTNoUdcSJUVzngPOgZAaOPQvDSI3DHLDQ8IuOZoX8R6dVJzTcVRNbypr1qaPuL
         3w6PAtnY841nYSDmLs3zVwy6c+mPPYD3gDCCuJkvQNx8ZIdZGHzPDu0tJIuBFjOT/PdJ
         NFWw==
X-Gm-Message-State: AOAM533SjTFsFxwhRZ6OWc1pChfzjTlfxyenrZ7lW3Y0BE1f/6r5XeWJ
	bR7ZkAZcAVSD21qeWOUWF/9bF53EZ0xoVw==
X-Google-Smtp-Source: ABdhPJwaEs74wxtcWoOTCrFhW9jvEzImAeatPbUMD4zeQ0qhG4cWNKS7R5kqbjXhGZwu+r6MQibkbQ==
X-Received: by 2002:a17:90b:8d6:: with SMTP id ds22mr4492917pjb.220.1618418422795;
        Wed, 14 Apr 2021 09:40:22 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::630])
        by smtp.gmail.com with ESMTPSA id s1sm93832pgc.28.2021.04.14.09.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 09:40:22 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [v2 3/3] valgrind: Add libstdc++ debug symbols for ptest
Date: Wed, 14 Apr 2021 09:40:18 -0700
Message-Id: <20210414164018.2027379-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210414164018.2027379-1-raj.khem@gmail.com>
References: <20210414164018.2027379-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

new/delete symbols are needed by overloaded-new.post test

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/valgrind/valgrind_3.17.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.17.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.17.0.bb
index d8324f1dc6..4eb948f2db 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.17.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.17.0.bb
@@ -136,7 +136,7 @@ RDEPENDS_${PN}-ptest += " bash coreutils file \
    perl-module-file-basename perl-module-file-glob perl-module-getopt-long \
    perl-module-overloading perl-module-cwd perl-module-ipc-open3 \
    perl-module-carp perl-module-symbol \
-   procps sed ${PN}-dbg ${PN}-src ${TCLIBC}-src"
+   procps sed ${PN}-dbg ${PN}-src ${TCLIBC}-src gcc-runtime-dbg"
 RDEPENDS_${PN}-ptest_append_libc-glibc = " glibc-utils"
 
 # One of the tests contains a bogus interpreter path on purpose.
-- 
2.31.1

