Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web12.7897.1615812063825175753
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Mar 2021 05:41:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pJrP3gZJ;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: dorindabassey@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id e9so5615295wrw.10
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Mar 2021 05:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=SJCc4A96kUc8AV8hgd7dzlpyL5TFXx5YInCKRFZf69I=;
        b=pJrP3gZJSM/gIDc4c594jfHh9MWDUxhNoyjGpYs9GHD8sG7KVo23pfQgKp0X4WYGtJ
         qavdPLaVnJR7XiV4oSmdFCL/b89AqffvXsjO3ObeQLQ+29guldl3xk5K7oIAr+3sxS9p
         l41XmXagmyNFk/PydSQieykaFyGCPfMUT/bfVmlOJXIRXUz8OcMeO8jGD++tsbs8F785
         JbRfiGCKn4RYsZnLYaEkvi9BN91YzsN9jVZx7DYK+H+bc6eD2XXVhm3F9vbVsK2ZteI6
         8P+TO8xSaglbNOVV/lasLeaDG4JtIbyb2iXTVOPzCIMfsifKSFuu4rq5Rg6eVoz8PIi1
         fQwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=SJCc4A96kUc8AV8hgd7dzlpyL5TFXx5YInCKRFZf69I=;
        b=ZR9ItAeVNuYkYDRBFNpcpIAAgcN8SljIw50mrwQsgm+QhJiNbMGI/Evl/zJo9jQEAn
         U4hj7WD+o/qMcXve1ES+0yl/syvEcWeJWEDEgYoXorScVbH00DSDBD/XVA2YYF0INYDh
         q7fg2bGur/+eqyTh3Gy9I2tBzCx57v8u7c29rVS2FvZ+CfcMci3PQsLLL0NNuOvYqEVH
         7o4gCjRutHG+jzVxQ5Co5EQUABXkrs7w+s3JX+d0emYlRht5fcdBxj6EdCejit++P9Lf
         gdfgkt4BZTuLMZwefLXn9DH76YW1+rmtFKHyEgA4AccuIoNsDo1GDy3d4P3ki9gxqmPo
         OySQ==
X-Gm-Message-State: AOAM531l3ob5pzVxCLynqf/x8SBd589nh6Uihdz80ucV9nQJUkfD1XXA
	sMDQQLTofhj1U2HrAV8oCToPwf1T8KcUvA==
X-Google-Smtp-Source: ABdhPJzZ1LzlX7MLDbY7tYGfuc4VdJ0Ut3y+gzuFggnNQmUofhZHnrf9wenmlqksuXSO7HeWy6ochQ==
X-Received: by 2002:adf:fcc9:: with SMTP id f9mr27074858wrs.420.1615812061926;
        Mon, 15 Mar 2021 05:41:01 -0700 (PDT)
Return-Path: <dorindabassey@gmail.com>
Received: from smtp.gmail.com. ([105.112.37.111])
        by smtp.gmail.com with ESMTPSA id q17sm13499076wrv.25.2021.03.15.05.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 05:41:01 -0700 (PDT)
From: "Dorinda" <dorindabassey@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Dorinda Bassey <dorindabassey@gmail.com>
Subject: [PATCH] meta-selftest: Add HOMEPAGE / DESCRIPTION
Date: Mon, 15 Mar 2021 13:40:54 +0100
Message-Id: <20210315124054.2731-1-dorindabassey@gmail.com>
X-Mailer: git-send-email 2.17.1

From: Dorinda Bassey <dorindabassey@gmail.com>

Added HOMEPAGE and DESCRIPTION for recipes with missing
descriptions or homepage.

Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
---
 meta-selftest/recipes-test/aspell/aspell_0.0.0.1.bb              | 1 +
 .../recipes-test/git-submodule-test/git-submodule-test.bb        | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta-selftest/recipes-test/aspell/aspell_0.0.0.1.bb b/meta-selftest/recipes-test/aspell/aspell_0.0.0.1.bb
index 9f905a5198..dcf6c8ba63 100644
--- a/meta-selftest/recipes-test/aspell/aspell_0.0.0.1.bb
+++ b/meta-selftest/recipes-test/aspell/aspell_0.0.0.1.bb
@@ -4,6 +4,7 @@
 
 SUMMARY = "GNU Aspell spell-checker"
 SECTION = "console/utils"
+HOMEPAGE = "https://ftp.gnu.org/gnu/aspell/"
 
 LICENSE = "LGPLv2 | LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
diff --git a/meta-selftest/recipes-test/git-submodule-test/git-submodule-test.bb b/meta-selftest/recipes-test/git-submodule-test/git-submodule-test.bb
index 08089b4186..9429564df4 100644
--- a/meta-selftest/recipes-test/git-submodule-test/git-submodule-test.bb
+++ b/meta-selftest/recipes-test/git-submodule-test/git-submodule-test.bb
@@ -1,4 +1,5 @@
 SUMMARY = "Test recipe for fetching git submodules"
+HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/git-submodule-test/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
-- 
2.17.1

