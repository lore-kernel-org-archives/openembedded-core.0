Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.3310.1621149670434248794
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 May 2021 00:21:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EghC+H0E;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id n2so3193557wrm.0
        for <openembedded-core@lists.openembedded.org>; Sun, 16 May 2021 00:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=jNFp91b4byUPUln9IR9m25WvaprXR3w39J/ObrsVEU0=;
        b=EghC+H0Eog7HpWoRx5VpoLZSOX7V8NcFZiS/cn3Ht30FFf0JIkXZqpK9K5DmlF61eg
         eezwECwIVqJcmNhfMfLko7yzqqUvzl9bMZud4JSnK8nWTCL/qUbhaSNKcAU43VOcH2iL
         oszTzB7T+j9jIihWMU39l04xul6boVGiNob3E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jNFp91b4byUPUln9IR9m25WvaprXR3w39J/ObrsVEU0=;
        b=Fi4jFIJx80eN3ifRTMlnbMAJUGLSHWBmgKyXXdCXUBcfndJtGlhSZkhWNDFnusgYYI
         xkq+5MY0NCkQODemz5bhqjDua/kU9WOsMDc+XhJRfFli7Y83N1KdEQd2a5EkJf5Kiy+U
         RIZYyJ9Mo1p3KrUYRAM0yKg9CYA/2wIPkc+6slWl94LBo9rhB8Wr1eNS5v6QcL1trAKF
         i7GSXFlaakPHAKGllfLZjpwYItxush6asjLMd8+3STvHJCisuUrOG/g7htE/kXkesw2Y
         D9ViDRjVQIzxs8fQ+KauZ6OAOO4Wap0ZLa/uLZ+KKbT6dKGRq2njxYagOKH9wFWcdM/3
         ZM+A==
X-Gm-Message-State: AOAM532zl9v3L59mRUwkGJxYBQoWXAOQLxmARyyzV/CMRKdAiRjXa3ym
	mcSYaX9dYrWvueKzRnYAxVKTsBHnrtsZsA==
X-Google-Smtp-Source: ABdhPJwYcvB9oM0fXZzMr747Fiony/Eioq8/eQIX5D+EClGcxyBI/KfO/2wbS5P5R93sD5MEdeEa4g==
X-Received: by 2002:a5d:6b91:: with SMTP id n17mr15148095wrx.67.1621149668867;
        Sun, 16 May 2021 00:21:08 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:22d7:8af4:80b5:c062])
        by smtp.gmail.com with ESMTPSA id t7sm5718810wrs.87.2021.05.16.00.21.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 May 2021 00:21:08 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] python3-jinja2: Upgrade 2.11.3 -> 3.0.0
Date: Sun, 16 May 2021 08:21:05 +0100
Message-Id: <20210516072106.2379894-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210516072106.2379894-1-richard.purdie@linuxfoundation.org>
References: <20210516072106.2379894-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{python3-jinja2_2.11.3.bb => python3-jinja2_3.0.0.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-jinja2_2.11.3.bb => python3-jinja2_3.0.0.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-jinja2_2.11.3.bb b/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-jinja2_2.11.3.bb
rename to meta/recipes-devtools/python/python3-jinja2_3.0.0.bb
index 11a4d5432ca..5ae8d49b530 100644
--- a/meta/recipes-devtools/python/python3-jinja2_2.11.3.bb
+++ b/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/Jinja/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=5dc88300786f1c214c1e9827a5229462"
 
-SRC_URI[sha256sum] = "a6d58433de0ae800347cab1fa3043cebbabe8baa9d29e668f1c768cb87a333c6"
+SRC_URI[sha256sum] = "ea8d7dd814ce9df6de6a761ec7f1cac98afe305b8cdc4aaae4e114b8d8ce24c5"
 
 PYPI_PACKAGE = "Jinja2"
 
-- 
2.30.2

