Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DBDDC433F5
	for <webhook@archiver.kernel.org>; Sun, 14 Nov 2021 20:27:29 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web09.13735.1636921648199963569
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Nov 2021 12:27:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XwAQgOiD;
 spf=pass (domain: gmail.com, ip: 209.85.128.45,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id
 c71-20020a1c9a4a000000b0032cdcc8cbafso10817501wme.3
        for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Nov 2021 12:27:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DYDLi0J19FQlKdBJFnH2+6mhgEmT7hC/2YNi5mOc0I4=;
        b=XwAQgOiDoAkT6Aso9Jyz1ruSI8BAv668lUPq8pKENliSm8VDB8KUTdyp8vyo/T6exk
         4tGMS2nI1wKCL8zPOjqRynxPIIkFnyZsFe1NvWoY3bpMNmgIOkK54X64f16X/o5ehWFl
         rshKL/g3bATh2Xjwnl9ksh3lSgqwzKoVhqE7dTRCSEq64tPkVTur6fzM4/QqBixKAE/t
         65bHFk1JSISV6Oc5GVwYrXlW5UxrNvmlvuWIhf8IFz7UIIsNdDmWndvsntF9JEIvYWR+
         CpajhR0cySa+c/QBuH91x5TpIjL7Xfr6aD+EE7Fhm2pAG5pdWHtaDQkPX107b+WCZlzA
         EHrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DYDLi0J19FQlKdBJFnH2+6mhgEmT7hC/2YNi5mOc0I4=;
        b=mQgFMNorV6k2r6Mxk5SpVtPOEXl6kFYVCQX1aQgL+EWa3LI6FssZtwVnrWJ8PQ1Ucv
         r0XwjT4AWdsz2B5msiiBe1am68JStR3Qume52n87UcQNyXxin2tSZ9HT5fT3TJhM54dx
         dBeIpouDNBMZRWOgTC0j3g+msi8nd6fz04Yzi1DtXIXsKScmrREMsFmlha1aVTZ9uT5J
         g90jB3t86OVSzACwA19NcT84mVv415sHgIMIQXD1zhLLRPvPZd39XIt3YEiwqkC/sDSJ
         AJE9QIQD3Kqlt3yKgpg51G15rKWz+NLlTc6XRSEVzpW3+WyiRk+dW7wXv2eZUXnarkht
         Vm0w==
X-Gm-Message-State: AOAM533PuNAg4tDba7bB8dAeZ4ACXuJ1lTSoiwAl8k72VzcfgEapTWvR
	bdwESO89oSI1iwkjm3VbW4Y23dVLDpc=
X-Google-Smtp-Source: 
 ABdhPJz+QuRPKkpESk00pDIiEI3950nIEhmye0DkzJrcX/llOXb5fn+g4+g80EjVRMSuSL+P+7HqHA==
X-Received: by 2002:a05:600c:3586:: with SMTP id
 p6mr54431442wmq.34.1636921646475;
        Sun, 14 Nov 2021 12:27:26 -0800 (PST)
Received: from localhost.localdomain (176.57.115.89.rev.vodafone.pt.
 [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 r15sm12733295wru.9.2021.11.14.12.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Nov 2021 12:27:26 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 5/5] shaderc: upgrade 2021.2 -> 2021.3
Date: Sun, 14 Nov 2021 20:26:48 +0000
Message-Id: <20211114202648.316923-5-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211114202648.316923-1-quaresma.jose@gmail.com>
References: <20211114202648.316923-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Nov 2021 20:27:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158271

- SHADERC_SKIP_COPYRIGHT_CHECK is a new cmake option to skip
the copyright check and as we don't needs it we can avoid the check.
https://github.com/google/shaderc/commit/f6d6dddfabfec1041c0dfb8e7ff3608a5f82227c

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../shaderc/{shaderc_2021.2.bb => shaderc_2021.3.bb}           | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta/recipes-graphics/shaderc/{shaderc_2021.2.bb => shaderc_2021.3.bb} (91%)

diff --git a/meta/recipes-graphics/shaderc/shaderc_2021.2.bb b/meta/recipes-graphics/shaderc/shaderc_2021.3.bb
similarity index 91%
rename from meta/recipes-graphics/shaderc/shaderc_2021.2.bb
rename to meta/recipes-graphics/shaderc/shaderc_2021.3.bb
index eee9817d65..cc2cfc18a8 100644
--- a/meta/recipes-graphics/shaderc/shaderc_2021.2.bb
+++ b/meta/recipes-graphics/shaderc/shaderc_2021.3.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/google/shaderc"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRCREV = "2c5ef1b8f8b1fdcbe1b22764e82d5caaa1d04ef9"
+SRCREV = "6fabc36fbebacfcef8cf82463df2a8247120ebf0"
 SRC_URI = "git://github.com/google/shaderc.git;protocol=https;branch=main \
            file://0001-cmake-disable-building-external-dependencies.patch \
            file://0002-libshaderc_util-fix-glslang-header-file-location.patch \
@@ -23,6 +23,7 @@ EXTRA_OECMAKE = " \
     -DBUILD_EXTERNAL=OFF \
     -DSHADERC_SKIP_TESTS=ON \
     -DSHADERC_SKIP_EXAMPLES=ON \
+    -DSHADERC_SKIP_COPYRIGHT_CHECK=ON \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.33.1


