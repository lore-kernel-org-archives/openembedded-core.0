Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web08.13823.1629891512198575682
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Aug 2021 04:38:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TWng8GyV;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id m25-20020a7bcb99000000b002e751bcb5dbso4340954wmi.5
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Aug 2021 04:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bXelDJ4N4lvayGSYcV5dlRaOQhRjlSRQt1dSxJybeWU=;
        b=TWng8GyVrfhfCKHv4/688+J7XJ3jbULd4v8BvvUOlQlBgKm0I3qrz6ZF0h0MuWI/jO
         Oat7W6nGJUbMOTIAIiibayVgEPpOdAOLOuffSSpoL7zySfXZSbxIKjP2HpJLdC5DAA1f
         BxLKLv2ekQ8bW6HQcBvg55q86B4RMZRXZnnLI3oSJ7kIdaxPgMLfrB3w8txsbNYPszhw
         gQvpeD+q0FDldZfCL/yw61Ehdpy7Num/zQlXXaqdphKkIdg+662DS0E0y7QN89ZA+D/y
         T0U1Y5+xzZbJYNm99MQns3mnmICOGb0W4QYXv64jgynSQLdK64gwxHnx2ylImVQeTDCt
         vvWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bXelDJ4N4lvayGSYcV5dlRaOQhRjlSRQt1dSxJybeWU=;
        b=TWWcCUf64OGJHv4FLR7OWx7RZS4Ef30u4MLC8LXYYNM4bbF3hockx6I1jygRWBE4XO
         SGYCSchissWV+vtCBNaJ/9kH2eC5axZgsC/0wluPfvQ97EQhDwR+JD9/qhJakBkAhbnc
         sJp9fc74x6p5MgmdD7aHjjpyQ9uMGd84gZHyEhMIW7C+sh41xDRzMmjMosFFAzHv/Uln
         /+xS0KGENM5qe9AVjio5WTp9PclVmQRd0KMM6VmoeOisP/uAOVAMRFdyYjmGNJkWxuFU
         U1xlcDv3ffQkv5aqH+vTCWBRajM4MF2PHSFun3dkjgow83A9rvJoQnm4Khnw/u1aSB+N
         aAzA==
X-Gm-Message-State: AOAM531bWOeTOm0L3Gbon6gubjF9TJnWqpCObm1CVbxdI2hKoYB7pzbo
	HwUhw4/lnIIGw1QGgiCY3RqqHrcrYrI0yw==
X-Google-Smtp-Source: ABdhPJw4eYEvo2UlRJ5037kNPH1nM7AkHcxIUgpjX35nrnAFLUrg/UYcPyVFeCE7zWNcdaL+pPcGRw==
X-Received: by 2002:a05:600c:428a:: with SMTP id v10mr8730723wmc.25.1629891510853;
        Wed, 25 Aug 2021 04:38:30 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a1:9900:5e06:8d90:670b:86c8])
        by smtp.gmail.com with ESMTPSA id z17sm20790217wrr.66.2021.08.25.04.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 04:38:30 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 10/16] ell: upgrade 0.42 -> 0.43
Date: Wed, 25 Aug 2021 13:37:58 +0200
Message-Id: <20210825113804.779395-10-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210825113804.779395-1-alex.kanavin@gmail.com>
References: <20210825113804.779395-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-core/ell/{ell_0.42.bb => ell_0.43.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ell/{ell_0.42.bb => ell_0.43.bb} (90%)

diff --git a/meta/recipes-core/ell/ell_0.42.bb b/meta/recipes-core/ell/ell_0.43.bb
similarity index 90%
rename from meta/recipes-core/ell/ell_0.42.bb
rename to meta/recipes-core/ell/ell_0.43.bb
index 7d021c5e3c..3d3ef82668 100644
--- a/meta/recipes-core/ell/ell_0.42.bb
+++ b/meta/recipes-core/ell/ell_0.43.bb
@@ -17,7 +17,7 @@ inherit autotools pkgconfig
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz \
            file://0001-pem.c-do-not-use-rawmemchr.patch \
            "
-SRC_URI[sha256sum] = "8b926eebb053f545a03349c0e3d02be586f5aa041f5660b6ced85b55fc531bb7"
+SRC_URI[sha256sum] = "b6c75895ad64bf78f5b5c464de871048d02f9403be518084e0d64b58f508c9fc"
 
 do_configure:prepend () {
     mkdir -p ${S}/build-aux
-- 
2.31.1

