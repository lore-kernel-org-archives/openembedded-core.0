Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web09.1202.1604335763348720032
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:49:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eI4BvBGU;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id i19so8791517ejx.9
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 08:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BbokR1AXABQLAUE2g0ktbCxlOUVAeVERS80BqwJweZM=;
        b=eI4BvBGUfFf2iSfDkxctUxX7S3ph/sBBAOl0X+BqUHNMeP4NVwF+fI/yIueHYBmi3v
         AJ2k3yG1AURXjUs7Zrw3qB2sVvMKKwBlxPr/Eo3u325f+vK5RStn0Xpw6/Kcy3vKTsdF
         9gL10drd9ZbBPq09AYlmnjSfwsK2EeEha/ZQT/3kxSXTs++3nqjhbs+inFfKh8DiEONx
         2JbFAV6/x3+h97QGKvO7TPrdMnlgL2DC8DdNmEjoWlnbGEQHNbICGuzVwioK2tAp9+Tp
         fqPfZ8VBKV380rCUugITEjhIdlSGZ1k12TJXUhw3jDYG7h/BwZiW4tiV12SJ2eZIXXX/
         MGEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BbokR1AXABQLAUE2g0ktbCxlOUVAeVERS80BqwJweZM=;
        b=VEx1YsnPU5vvF7dKNDZq7pT6rKM3tYxtL4eQ93X7+jYym4EvHKRiGXzK9Dkcp0iRQM
         Uzge3xB8oNn5mxXL0F47Br/R5jGgQb4c3ntp2aRrp13qwp2+/IWgMx2kWO+xOD1zEKKS
         Is5qlcqmqXyUZNtjqjaNQNOMYjg21HJUpGUwE752X1yINnLAAF2qNU4uM7OEAq0lWzoO
         S8lPqATXsKxi7mEvfqQPMkBQ3rYlYgkm8o8l4TLY0nZnrV7VVfGqAPR81T23o0LVRVHC
         noQBFt5ZewQdBU9keJjb3xuQiWHXElU1RVj7+qMNqzGv0bmf6upd80N7GWrzdeGDkslE
         8SBA==
X-Gm-Message-State: AOAM530Rx8peF+XoJ3DjCYzO9GuVDEQQAY1DmxMTLvk6yr+hKgj66mOF
	3DFHaIqkEyo9IDG1TKA3Ig78Z+kzeP6KMA==
X-Google-Smtp-Source: ABdhPJwmzDl97T7VVLJ251NVeQu2kBU6CQeS/KPgmQgYvBcHwb+OFtTA5ui3VdbD9PGkyCRifIeT6A==
X-Received: by 2002:a17:906:b110:: with SMTP id u16mr15923636ejy.55.1604335761675;
        Mon, 02 Nov 2020 08:49:21 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id us11sm9864781ejb.91.2020.11.02.08.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 08:49:21 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 04/80] glslang: upgrade 8.13.3559 -> 8.13.3743
Date: Mon,  2 Nov 2020 17:47:51 +0100
Message-Id: <20201102164907.27572-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201102164907.27572-1-alex.kanavin@gmail.com>
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../glslang/{glslang_8.13.3559.bb => glslang_8.13.3743.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/glslang/{glslang_8.13.3559.bb => glslang_8.13.3743.bb} (93%)

diff --git a/meta/recipes-graphics/glslang/glslang_8.13.3559.bb b/meta/recipes-graphics/glslang/glslang_8.13.3743.bb
similarity index 93%
rename from meta/recipes-graphics/glslang/glslang_8.13.3559.bb
rename to meta/recipes-graphics/glslang/glslang_8.13.3743.bb
index f4014f637b..ddb90d89f2 100644
--- a/meta/recipes-graphics/glslang/glslang_8.13.3559.bb
+++ b/meta/recipes-graphics/glslang/glslang_8.13.3743.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "https://www.khronos.org/opengles/sdk/tools/Reference-Compiler"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=918e668376010a04448a312fb37ae69b"
 
-SRCREV = "8db9eccc0baf30c9d22c496ab28db0fe1e4e97c5"
+SRCREV = "bcf6a2430e99e8fc24f9f266e99316905e6d5134"
 SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https"
 UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+)$"
 S = "${WORKDIR}/git"
-- 
2.29.0

