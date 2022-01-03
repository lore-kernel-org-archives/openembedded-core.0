Return-Path: <otavio.salvador@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3A9BC433F5
	for <webhook@archiver.kernel.org>; Mon,  3 Jan 2022 16:19:49 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web08.30358.1641226789349007359
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jan 2022 08:19:49 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: otavio.salvador@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id ke6so31425499qvb.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jan 2022 08:19:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:organization:content-transfer-encoding;
        bh=rw2whpNQz5sERVUGQTM475Pz71iadJ40UczM6FK/iY8=;
        b=OgnMwP+GDS5XPC4ciotjXha/KzUgNvxI7RO0BSnGC4I18qFnAJ5pLqiSPiV695G4NJ
         AytbW/ya0SzUPFG65PAUZ29x1Ex8lG5VGa+h9V/7kx4ElE+tTOOr2IgOhwJ0GrRJSRLe
         B9BB4r5q3Sr4BT+FlOIa/jKKx9701QF5l7KEZFEVTlhLShjV89ptPuzogu4Lm1hFQ+J6
         GyOIBD+mBG8ZBLh4XbX0y337HCFnl7ZRvoQXrn02eiB9LdISQccPwhDRLyQluJDL22AB
         kcThDqTLA59hZwYfZJqvGcmNHS8Hem93ZoJLAHx9VwAfY5NYtBnc7ABtILTPyfysv5PB
         5yFg==
X-Gm-Message-State: AOAM530ZVfV/CIp/dxJ0OFinfUXcsRzWgv8D3vZEatazl9YorZevTZbi
	MerGGCP+FPEjULtTY3ONV104sK0xWzIdNCct
X-Google-Smtp-Source: 
 ABdhPJytcS3wsCzXsfJVI6N8EMMRm3bzYSIXn+gygPvnxLFwjwkgFzfrOU6qW42i+LgdWa+PL9KaPA==
X-Received: by 2002:a05:6214:29c7:: with SMTP id
 gh7mr41210209qvb.69.1641226788238;
        Mon, 03 Jan 2022 08:19:48 -0800 (PST)
Received: from localhost (201-34-65-230.user3p.brasiltelecom.net.br.
 [201.34.65.230])
        by smtp.gmail.com with ESMTPSA id
 bq36sm29440292qkb.6.2022.01.03.08.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 08:19:47 -0800 (PST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 14/24] python3-cython: upgrade 0.29.25 -> 0.29.26
Date: Mon,  3 Jan 2022 13:18:44 -0300
Message-Id: <20220103161854.301148-14-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220103161854.301148-1-otavio@ossystems.com.br>
References: <20220103161854.301148-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jan 2022 16:19:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160131

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-devtools/python/python-cython.inc                  | 2 +-
 .../{python3-cython_0.29.25.bb => python3-cython_0.29.26.bb}    | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-cython_0.29.25.bb => python3-cython_0.29.26.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-cython.inc b/meta/recipes-devtools/python/python-cython.inc
index 93d6fdf13b..278da5ea72 100644
--- a/meta/recipes-devtools/python/python-cython.inc
+++ b/meta/recipes-devtools/python/python-cython.inc
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
 PYPI_PACKAGE = "Cython"
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[sha256sum] = "a87cbe3756e7c464acf3e9420d8741e62d3b2eace0846cb39f664ad378aab284"
+SRC_URI[sha256sum] = "af377d543a762867da11fcf6e558f7a4a535ff8693f30cce123fab10c00fa312"
 UPSTREAM_CHECK_REGEX = "Cython-(?P<pver>.*)\.tar"
 
 inherit pypi
diff --git a/meta/recipes-devtools/python/python3-cython_0.29.25.bb b/meta/recipes-devtools/python/python3-cython_0.29.26.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-cython_0.29.25.bb
rename to meta/recipes-devtools/python/python3-cython_0.29.26.bb
-- 
2.34.0


