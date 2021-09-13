Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web12.191.1631554521976835468
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Sep 2021 10:35:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GzdR43ob;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: pgowda.cve@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id f65so9525819pfb.10
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Sep 2021 10:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8/bmZtqTNU6jfkgXsJUTdX9+NzoMwbffAIoA3XY/VbE=;
        b=GzdR43obUorWsBr7ziS54Lv6isDYO3BvPjXYgH5H7APFOuqkOui+Jn9PLt7DnrKJOa
         C3CzwN6Hw+tX4a3nV9en6ZAs5wQ082N1IYJr5/t5DFNKVePuYqUZfOo0S9+cnIkKVumI
         Vy2BqI74FND2TWJdBvaQZhoCDMa97GZI8r2i5hXAUOzVFVdYbMNTHgJP+1YU+X4d+Ip9
         6FpFNWQMutu5fcKTyLqguNmJbUvbPc6p5PtXK7G4UbWWo0r/fkeN9ejYWTXL66bfP4eC
         uHUAXs9cEVvXF/0oD5pbH+N2qJ2umzeueObBZnMrm8FilJRS2BeMfVJIGc/qwbiiGv5M
         64cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8/bmZtqTNU6jfkgXsJUTdX9+NzoMwbffAIoA3XY/VbE=;
        b=viUwRAb5sZwE702WQYcEM+s8s8AoDfqnoekOdUUSG9IngzCnf8/eH+Nz0+z+kca5PL
         WxyXmy2rZSgjU3vRUiOUG9WLz/yqKBCcxwW8IZ1otKz+7t51UghdDMvr4Olk3U+AlbrX
         Ar9QOwLEzIYjaXdnd8OP+LPCDwnPdss+TTf67isLsRq4k+4OGJiqkP/octLt2M9J4p0m
         ytjyeouHRAD3yxJoN2nx0OK52XGQkEA0+/LcmIO8fbh6qpUzaBe5+WOvYZBPtj8guUh4
         7BtGcM+eQNt1jBmy9DqSdl9XbkTC87Pw+IyDy15g7X2VvfC6K1swAqYZlIMUlCiVHiaj
         N6Tw==
X-Gm-Message-State: AOAM532lLBJ88lbFSMY8i5WKpqAKvpqQYhg8caI30G9QWETd1ieA94jr
	SDK+G9qCgYmGsQFrRWHBRxrz4L4+Ie3hkQ==
X-Google-Smtp-Source: ABdhPJwwheQquh7HEbfayavDYOlJj/AE3CuSBvCBjVnM4OT2PcR+q0GWqFPZshLEYSWLYB54ALZMrg==
X-Received: by 2002:a05:6a00:2129:b0:434:ab92:5af4 with SMTP id n9-20020a056a00212900b00434ab925af4mr617608pfj.3.1631554521356;
        Mon, 13 Sep 2021 10:35:21 -0700 (PDT)
Return-Path: <pgowda.cve@gmail.com>
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com. [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id t68sm8988337pgc.59.2021.09.13.10.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 10:35:21 -0700 (PDT)
From: "Pgowda" <pgowda.cve@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	vinay.m.engg@gmail.com,
	alex.kanavin@gmail.com,
	Pgowda <pgowda.cve@gmail.com>
Subject: [PATCH 4/4] Modify target cpu for powerpc to "7400"
Date: Mon, 13 Sep 2021 10:35:13 -0700
Message-Id: <20210913173513.176653-4-pgowda.cve@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210913173513.176653-1-pgowda.cve@gmail.com>
References: <20210913173513.176653-1-pgowda.cve@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During rust testing, some ui test failed due to following message.
'powerpc' is not a recognized processor for this target in rust

Hence the target cpu was renamed to "7400" in "llvm_cpu" as per
default tune for qemuppc.

Signed-off-by: Pgowda <pgowda.cve@gmail.com>
---
 meta/recipes-devtools/rust/rust-common.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rust/rust-common.inc b/meta/recipes-devtools/rust/rust-common.inc
index 153fa3aa97..aece1247a4 100644
--- a/meta/recipes-devtools/rust/rust-common.inc
+++ b/meta/recipes-devtools/rust/rust-common.inc
@@ -265,7 +265,7 @@ def llvm_cpu(d):
     trans['x86-64'] = "x86-64"
     trans['i686'] = "i686"
     trans['i586'] = "i586"
-    trans['powerpc'] = "powerpc"
+    trans['powerpc'] = "7400"
     trans['mips64'] = "mips64"
     trans['mips64el'] = "mips64"
     trans['riscv64'] = "generic-rv64"
-- 
2.31.1

