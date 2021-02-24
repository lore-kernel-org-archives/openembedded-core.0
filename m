Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web10.2661.1614140006400443441
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Feb 2021 20:13:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sh/gHI2v;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id o63so633967pgo.6
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Feb 2021 20:13:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=P4x3KSQwgsAPdAhj+WvIKPxaIg5EAIUAlicYAMpIoRI=;
        b=sh/gHI2v/P5ZxGZI/OmVSt3/KZf4KKKQszENnpvDhLBSf/suoc5x1vezLqHKhPY2TD
         ZyOEem48ZThWZmIj5js1Tb+EXKqALwNJ0EOFvmJSs0zqFs42KN0lU7BPNZndvYe7yiUQ
         iDZe8f07RXylnJiTfgEC/dr6obk4jTGNdesa2n5bJzFCcWbebzD0cQkoL2zXqsYBbSZq
         AcA897Z25HE2GBMFMsgiloJUsFL1vpXDXIIJGiwxAShP74AMvyyUqRZbTdU0BJuOeSRk
         r1+H+szTDX/C9JPaqA6W+qVxM3KsmsAiN63zCl3q/eClUyuS+5eo8OFZuy26l2bBFPuC
         gJEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P4x3KSQwgsAPdAhj+WvIKPxaIg5EAIUAlicYAMpIoRI=;
        b=s8MOOWeF6N4IBhaJDm69HeJ2Q+ACuZCnETZJMMk4ktoH2bRyK17MSx+/tnsryLPmM1
         FurM06Fwc8INKPqQogigDy5Lzx8p+jfMnZbCjMt3Zma5UQk5Qr/mXLjD+mhoIZquvUz5
         DbFS1A8kT9OsqA1736ra49zv+SMjxHkJgCYcwtSN5Q81G9nV8/ENLQs221/416M3he1M
         2oH14pu/rdZbbir/h1G5GECQFjx/DQQ6km3I33k4r+u9WafNAc4eUSsanrj6HAgy77Oj
         rYMudcEoaj0zZbv/UPPvh4qowo/3HnjDUYoF1ypQ/YqJzKR42gT6e/IJce5ccSH+IAWB
         uD0Q==
X-Gm-Message-State: AOAM530NEjeC7bWu1w7HpWgezP6rG32Wv9Mxfu3Bkf/99zw8xadlKxx2
	IhQTyk8+qswELeOO4lqvMuIpQg7+CPtETg==
X-Google-Smtp-Source: ABdhPJwXPzhfZc8jvPBEB5b+PN5nuZcWC4+7rc4bw3yNKwiZOiHcDJEUqliOAS/G3b7GoCoCIezRiA==
X-Received: by 2002:a63:c702:: with SMTP id n2mr26630430pgg.382.1614140005558;
        Tue, 23 Feb 2021 20:13:25 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0:db81:2f56:60e4:2c64])
        by smtp.gmail.com with ESMTPSA id jx20sm640681pjb.30.2021.02.23.20.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Feb 2021 20:13:25 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 3/3] go-helloworld: Turn into a go module enabled build
Date: Tue, 23 Feb 2021 20:13:20 -0800
Message-Id: <20210224041320.3968776-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210224041320.3968776-1-raj.khem@gmail.com>
References: <20210224041320.3968776-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/go-examples/go-helloworld_0.1.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/go-examples/go-helloworld_0.1.bb b/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
index ab70ea98a3..d3f7525dc9 100644
--- a/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
+++ b/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
@@ -6,13 +6,14 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
 SRC_URI = "git://${GO_IMPORT}"
-SRCREV = "46695d81d1fae905a270fb7db8a4d11a334562fe"
+SRCREV = "bcf50bfd7dcd8020c90965747d857ae42802e0c5"
 UPSTREAM_CHECK_COMMITS = "1"
 
 GO_IMPORT = "github.com/golang/example"
 GO_INSTALL = "${GO_IMPORT}/hello"
+GO_WORKDIR = "${GO_INSTALL}"
 
-inherit go
+inherit go-mod
 
 # This is just to make clear where this example is
 do_install_append() {
-- 
2.30.1

