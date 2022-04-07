Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE098C35295
	for <webhook@archiver.kernel.org>; Thu,  7 Apr 2022 20:36:08 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web12.1087.1649350854481196849
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Apr 2022 10:00:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KfFed/Qt;
 spf=pass (domain: gmail.com, ip: 209.85.218.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id k23so12178980ejd.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Apr 2022 10:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gTREi6SOnTOc6twV9Km6pA3kKA/9Ro4+OggKj1XGPC0=;
        b=KfFed/Qtx5oLJID96mMDq79ga1Rp3xAik/mg9m9OnzJaKNWwHrGaLKnSVQiiDfcVbL
         soYrJqc/5qkTIhVoYHZt6Z1DTpDFAqeNxsar7bTjEVA2H3u4xfOEaMOxjeyImGzT5pgq
         zOeGo95txpNMtBiwe6yJ6rlfHmUOLMYEqcMDACUT4ge7OGtxglANKtFGO1aP5Wp0EjMH
         6JoOSEydkTE88pdjHioiJutdaTOKe1g1N+K6B8JarMjNgR520VXOtAbQ5EslbRUMIYsw
         9oEHbF/RVf7PPGZWQ2UbPkDyiN4oGYPNrNWkiT/Zo/eSdx0BDWkWkYRkOaEkd6inj2Yu
         /Cew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gTREi6SOnTOc6twV9Km6pA3kKA/9Ro4+OggKj1XGPC0=;
        b=11oPRmAgM5BPjMMGIigstVsYmkfD42KpjvWP4hTcevGi2peAbNTuAVjnCR9SG8utTC
         Td3oL7hB6yKwlbxS1NrihA+PRfsRlOeVRL2Hvu1Ee7rVWvE7BjoVVLVOMN3NYTZdlFeJ
         kV1Jn76y0AHf0u7iSMs4Z9P0/1VKgZ/EcDitUmXrz19hynZ8DuXMdNNhBD2/vVsymjG5
         biwjOV9lLfqjvKz4e2bnABOHrQ/EGLQJ/n0qBF8eCgOXlHckknMPCD8KtTvkL2UG7grB
         m0iISjLLy4s0DnB4m0OpERkE1LvOXpFgdQ0opABihlGZzkyjuSQ88SsZlWGAIq3PUseE
         eOQw==
X-Gm-Message-State: AOAM530KgzbQ8qMKQiJuU/n2frQWcOCHbDr3CMnILe+Xt6yloc5WnZxU
	x1SHUDQOQdJYMxVUX3hi/YlhZG7R2EM=
X-Google-Smtp-Source: 
 ABdhPJwFrM8gYV1nqCuXMbLsA43j3M+0kx9sBUwQLiX7r9GyhOgFh/krVY0wapObkbTBsvsA/m6kZQ==
X-Received: by 2002:a17:907:7da7:b0:6e8:3d87:7f1f with SMTP id
 oz39-20020a1709077da700b006e83d877f1fmr3069197ejc.410.1649350853060;
        Thu, 07 Apr 2022 10:00:53 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 gt34-20020a1709072da200b006df6bb3db69sm7796879ejc.158.2022.04.07.10.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Apr 2022 10:00:51 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 12/17] cmake: update 3.22.3 -> 3.23.0
Date: Thu,  7 Apr 2022 19:00:24 +0200
Message-Id: <20220407170029.3500874-12-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220407170029.3500874-1-alex@linutronix.de>
References: <20220407170029.3500874-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Apr 2022 20:36:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164128

License-Update: copyright years, contributors.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../cmake/{cmake-native_3.22.3.bb => cmake-native_3.23.0.bb}  | 0
 meta/recipes-devtools/cmake/cmake.inc                         | 4 ++--
 .../cmake/{cmake_3.22.3.bb => cmake_3.23.0.bb}                | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.22.3.bb => cmake-native_3.23.0.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.22.3.bb => cmake_3.23.0.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.22.3.bb b/meta/recipes-devtools/cmake/cmake-native_3.23.0.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_3.22.3.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.23.0.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index d500321138..6f6fa61cdb 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -10,7 +10,7 @@ HOMEPAGE = "http://www.cmake.org/"
 BUGTRACKER = "http://public.kitware.com/Bug/my_view_page.php"
 SECTION = "console/utils"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://Copyright.txt;md5=31023e1d3f51ca90a58f55bcee8e2339 \
+LIC_FILES_CHKSUM = "file://Copyright.txt;md5=f2102a52df7aa592cf072180e7ebc8c7 \
                     file://Source/cmake.h;beginline=1;endline=2;md5=a5f70e1fef8614734eae0d62b4f5891b \
                     "
 
@@ -21,7 +21,7 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://0004-Fail-silently-if-system-Qt-installation-is-broken.patch \
 "
 
-SRC_URI[sha256sum] = "9f8469166f94553b6978a16ee29227ec49a2eb5ceb608275dec40d8ae0d1b5a0"
+SRC_URI[sha256sum] = "5ab0a12f702f44013be7e19534cd9094d65cc9fe7b2cd0f8c9e5318e0fe4ac82"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake_3.22.3.bb b/meta/recipes-devtools/cmake/cmake_3.23.0.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.22.3.bb
rename to meta/recipes-devtools/cmake/cmake_3.23.0.bb
-- 
2.30.2


