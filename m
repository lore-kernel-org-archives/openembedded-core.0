Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
 by mx.groups.io with SMTP id smtpd.web10.19666.1622285895262075172
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 May 2021 03:58:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RNs4crwx;
 spf=pass (domain: gmail.com, ip: 209.85.166.49, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-io1-f49.google.com with SMTP id b25so6879237iot.5
        for <openembedded-core@lists.openembedded.org>; Sat, 29 May 2021 03:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=d7B6fQbuVDDt8CMYtDgIclnQanGfSSTluca8SKK0Yu8=;
        b=RNs4crwxl/rvi89HwjAs/6l6W+23Vwwg0aniCD3wQLBd2oYqCHwPZMHBrlfvUFQw77
         YHPjQk107bcGTMBj2IEN621V98h2DliueewQ6N8YSGS27QWNW3TU64BGgPZvfxzSPUVX
         UcrlVxu5YbGkdFYT3kg9J2+UY7bXKNsAvJUo9n6oAR2AoJlf66Aw0TC6r7PZdCdPY9zA
         NW3l7OtsndrD/uEjx9hTIH8EuqyMQkDXBtGhxoxoZuuA2fMaPl2Z7BMyFB9Y0tPKfum6
         wLTGqgoyB8mkhLHfOaejoEjYS3lkRuOI4x7qaVIepo14RPdk267S53UQpmGLLUfUd0FC
         2mwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=d7B6fQbuVDDt8CMYtDgIclnQanGfSSTluca8SKK0Yu8=;
        b=pBr4Qm0K+W+XYEPPcksH0f2fU2p5ZL8A7cKMhqdL/m8p5ebL/q19Uu5D85B6FRkQ42
         V2zEv8E+tkp+jjqVgeT3d4otsjSFHHOaMJZqaagimaWXQ2pdiv6QYNc/aOc2LNr8xISn
         XDcLHm0RwBikIGLvRSR432Vrgn0TsjJi3p2uZJm0MBF2p7veRI0kW9vf6VUt+2VKTmVb
         sBZ2n4eQn4eb0eD7O6rCqSoJdUDVVtZ8LGLTETFvH/OX747WTw7mAZJuHBWbQadymLkL
         nVlpWPfuaiNjWjb7yGCxYk7mdYY4MJ+2Hgj+DIZ2Bo1Gr3CV2vUwMOlWLf7aNml+Mkme
         RAmw==
X-Gm-Message-State: AOAM5328f4ZYsqrdsbW4JZ0AWEdHI+ReZr5L0KPOjwur0TUYQ3US5/9c
	B1NvAXwDM6Vi1yhageb+PM9ppBD9r/PXWWve
X-Google-Smtp-Source: ABdhPJwoA9ceZfbe+dN9fPSRI+If4joMaJR/28H85wDBOTNFw7Btp6yyS50gl0LcD4peO4P/kYvC2Q==
X-Received: by 2002:a6b:7948:: with SMTP id j8mr10201148iop.32.1622285894227;
        Sat, 29 May 2021 03:58:14 -0700 (PDT)
Return-Path: <vinay.m.engg@gmail.com>
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com. [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id o5sm4441174ilm.78.2021.05.29.03.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 May 2021 03:58:13 -0700 (PDT)
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
To: openembedded-core@lists.openembedded.org,
	alex.kanavin@gmail.com
Cc: richard.purdie@linuxfoundation.org,
	kweihmann@outlook.com,
	rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	vinay.kumar@blackfigtech.com,
	Vinay Kumar <vinay.m.engg@gmail.com>
Subject: [PATCH v8 3/5] rust.inc : Changed target cpu for powerpc to "7400"
Date: Sat, 29 May 2021 03:57:47 -0700
Message-Id: <20210529105749.3017489-3-vinay.m.engg@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210529105749.3017489-1-vinay.m.engg@gmail.com>
References: <CANNYZj8i1D15ePeor45k2Mpec3vq7y6PSU8+ynLvSzRdnfL1Hg@mail.gmail.com>
 <20210529105749.3017489-1-vinay.m.engg@gmail.com>

While executing rust-testing observed some ui testfailures due to
below warning message.

'powerpc' is not a recognized processor for this target in rust

So renamed target cpu for "powerpc" in "llvm_cpu" to "7400" as per
default tune for qemuppc.

Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
---
 meta/recipes-devtools/rust/rust.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rust/rust.inc b/meta/recipes-devtools/rust/rust.inc
index a1223f45e7..ee3176b559 100644
--- a/meta/recipes-devtools/rust/rust.inc
+++ b/meta/recipes-devtools/rust/rust.inc
@@ -290,7 +290,7 @@ def llvm_cpu(d):
     trans['x86-64'] = "x86-64"
     trans['i686'] = "i686"
     trans['i586'] = "i586"
-    trans['powerpc'] = "powerpc"
+    trans['powerpc'] = "7400"
     trans['mips64'] = "mips64"
     trans['mips64el'] = "mips64"
     trans['riscv64'] = "generic-rv64"
-- 
2.17.1

