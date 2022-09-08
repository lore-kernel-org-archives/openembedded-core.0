Return-Path: <rak3033@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7627AECAAD5
	for <webhook@archiver.kernel.org>; Thu,  8 Sep 2022 06:58:29 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web09.2390.1662620302124813607
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 23:58:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZQI+ygC/;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: rak3033@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id t65so4901523pgt.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 23:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=DvYFEQA4w2CVJGVIWnnjXLZ7axtabunO3TOb1N9OTzA=;
        b=ZQI+ygC/vCPAzRF2gkOxurGqz4O8ylPl9Buv1o+MrJ5vT/tslKwVMMXiDl3Xw9XKdb
         WyivwQ1/9kN8BM620JgiafRQ5kZvMYIicase95fMcEZEeiH4z4ot+c774r3vdRkYTYm8
         Hgc/4jEzDla8PpcOwcp2+FbCRnCSS3TkYwRJQ8LDQgbAI9a5vKyF+F0UXw/OIbRmjFDB
         RoPKb/G7k1gpcbOdVhzrkDEx3dh6aJrZXMlFUEJMgsMMF6vMia6fSP0mb8rHob1Y6YOP
         sP3L4oSVg45gVXdatMNn0SkOEyirYoiftubAu80CLDXBsjC5iQKx1+zueDKpHwy1v5Um
         kh7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=DvYFEQA4w2CVJGVIWnnjXLZ7axtabunO3TOb1N9OTzA=;
        b=tefZD61IQzdKJBag5jTPQ9asBTUtjcO7xCgPxt55jemjzLl34AW5VCucXRjYYtaZKu
         G5pD0kXr1JMe3Wi3mSzojqPo5XfzfdEs/uVnxgT7BpZIXFU98UcvgJcZBjW/3SODNSBw
         i4ontfotT/2cYtncYv5aKThc6FBjpWNFVb/VtSHTv1mHsSN71+DddAwW1o80DSozvry2
         0AdD+w6wVKsdltEn5xjj7tBMeY3czZr76fPV8yP4KfeVKy4gtvxmbJsgeWXYszraxQkR
         g2d2UdsbNsg5A6irtiChW2D14rHsZAam3cxAlmtXrqZPBYF67VYuc/qh6KtWWADry1v4
         2gvg==
X-Gm-Message-State: ACgBeo3bzWWkzywgr1lwYkGve250s6934tdg7tFovXh/HNEnPxvjYX1D
	RnFIJ3n/Fmj3f+uR7bXBOoO17HFwvgLWcQ==
X-Google-Smtp-Source: 
 AA6agR4XHTooHCloLBBxN2KYFIQgtpKMweoe0VG8r0Vdxzy2WMWDPLlsOT0UNoAWzrZFDiJkrWr2ow==
X-Received: by 2002:a63:5b16:0:b0:42a:8c1b:819a with SMTP id
 p22-20020a635b16000000b0042a8c1b819amr6504243pgb.424.1662620301154;
        Wed, 07 Sep 2022 23:58:21 -0700 (PDT)
Received: from localhost.localdomain
 ([2401:4900:33c3:2e02:685a:a9a:ac71:934b])
        by smtp.gmail.com with ESMTPSA id
 ay6-20020a17090b030600b00200b12f2bf3sm909154pjb.51.2022.09.07.23.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 23:58:20 -0700 (PDT)
From: Riyaz Khan <rak3033@gmail.com>
To: openembedded-core@lists.openembedded.org,
	rak3033@gmail.com
Cc: ranjitsinh.rathod@kpit.com,
	riyaz.khan@kpit.com,
	Riyaz Khan <Riyaz.Khan@kpit.com>
Subject: [meta][dunfell][PATCH 1/2] sdbus-c++: Upgrade sdbus-c++ 1.1.0 to
 1.2.0
Date: Thu,  8 Sep 2022 12:27:56 +0530
Message-Id: <20220908065757.27272-1-rak3033@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Sep 2022 06:58:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170451

From: Riyaz Khan <Riyaz.Khan@kpit.com>

Add SHA value in SRCREV and remove
7f437a6e06d2ec3abd3e2fd1101ab6aab386bc44.patch as this this patch is
already part of 1.2.0 Source.

Reference link:
https://github.com/Kistler-Group/sdbus-cpp/releases/tag/v1.2.0

Signed-off-by: Riyaz Khan <rak3033@gmail.com>
---
 ...7a6e06d2ec3abd3e2fd1101ab6aab386bc44.patch | 54 -------------------
 .../run-ptest                                 |  0
 ...{sdbus-c++_1.1.0.bb => sdbus-c++_1.2.0.bb} |  5 +-
 3 files changed, 2 insertions(+), 57 deletions(-)
 delete mode 100644 meta-oe/recipes-core/sdbus-c++/sdbus-c++-1.1.0/7f437a6e06d2ec3abd3e2fd1101ab6aab386bc44.patch
 rename meta-oe/recipes-core/sdbus-c++/{sdbus-c++-1.1.0 => sdbus-c++-1.2.0}/run-ptest (100%)
 rename meta-oe/recipes-core/sdbus-c++/{sdbus-c++_1.1.0.bb => sdbus-c++_1.2.0.bb} (91%)

diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-1.1.0/7f437a6e06d2ec3abd3e2fd1101ab6aab386bc44.patch b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-1.1.0/7f437a6e06d2ec3abd3e2fd1101ab6aab386bc44.patch
deleted file mode 100644
index 641935f68..000000000
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-1.1.0/7f437a6e06d2ec3abd3e2fd1101ab6aab386bc44.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-commit 7f437a6e06d2ec3abd3e2fd1101ab6aab386bc44
-Author: Stanislav Angelovic <stanislav.angelovic@siemens.com>
-Date:   Thu Jan 27 13:38:19 2022 +0100
-
-    fix(tests): printer for std::chrono in googletest v1.11.0
-
-diff --git a/tests/CMakeLists.txt b/tests/CMakeLists.txt
-index fbf198c..ec42e55 100644
---- a/tests/CMakeLists.txt
-+++ b/tests/CMakeLists.txt
-@@ -19,7 +19,7 @@ if (NOT TARGET GTest::gmock)
-     if (NOT TARGET GTest::gmock)
-         include(FetchContent)
- 
--        message("Fetching googletest...")
-+        message("Fetching googletest v${GOOGLETEST_VERSION}...")
-         FetchContent_Declare(googletest
-                             GIT_REPOSITORY ${GOOGLETEST_GIT_REPO}
-                             GIT_TAG        release-${GOOGLETEST_VERSION}
-diff --git a/tests/integrationtests/Defs.h b/tests/integrationtests/Defs.h
-index 2f129a4..2bfc7c9 100644
---- a/tests/integrationtests/Defs.h
-+++ b/tests/integrationtests/Defs.h
-@@ -56,20 +56,18 @@ const bool DEFAULT_BLOCKING_VALUE{true};
- 
- constexpr const double DOUBLE_VALUE{3.24L};
- 
--/** Duration stream operator for human readable gtest value output.
-- *
-- * Note that the conversion to double is lossy if the input type has 64 or more bits.
-- * This is ok for our integration tests because they don't have very
-- * accurate timing requirements.
-- *
-- * @return human readable duration in seconds
-- */
-+}}
-+
-+namespace testing::internal {
-+
-+// Printer for std::chrono::duration types.
-+// This is a workaround, since it's not a good thing to add this to std namespace.
- template< class Rep, class Period >
--static std::ostream& operator<<(std::ostream& os, const std::chrono::duration<Rep, Period>& d)
--{
-+void PrintTo(const ::std::chrono::duration<Rep, Period>& d, ::std::ostream* os) {
-     auto seconds = std::chrono::duration_cast<std::chrono::duration<double>>(d);
--    return os << seconds.count() << " s";
-+    *os << seconds.count() << "s";
-+}
-+
- }
--}}
- 
- #endif /* SDBUS_CPP_INTEGRATIONTESTS_DEFS_H_ */
diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-1.1.0/run-ptest b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-1.2.0/run-ptest
similarity index 100%
rename from meta-oe/recipes-core/sdbus-c++/sdbus-c++-1.1.0/run-ptest
rename to meta-oe/recipes-core/sdbus-c++/sdbus-c++-1.2.0/run-ptest
diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_1.1.0.bb b/meta-oe/recipes-core/sdbus-c++/sdbus-c++_1.2.0.bb
similarity index 91%
rename from meta-oe/recipes-core/sdbus-c++/sdbus-c++_1.1.0.bb
rename to meta-oe/recipes-core/sdbus-c++/sdbus-c++_1.2.0.bb
index 107dbc6c9..75cd81553 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_1.1.0.bb
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++_1.2.0.bb
@@ -16,11 +16,10 @@ PACKAGECONFIG[with-tests] = "-DBUILD_TESTS=ON -DTESTS_INSTALL_PATH=${libdir}/${B
 
 DEPENDS += "expat"
 
-SRCREV = "bca8e81037766a0454740c40307eea32831c101f"
+SRCREV = "751c1addc4fd2f949a466f488c1b7de2ca3b76dc"
 
 SRC_URI = "git://github.com/Kistler-Group/sdbus-cpp.git;protocol=https;branch=master"
-SRC_URI += "file://run-ptest \
-            file://7f437a6e06d2ec3abd3e2fd1101ab6aab386bc44.patch "
+SRC_URI += "file://run-ptest"
 
 EXTRA_OECMAKE = "-DBUILD_CODE_GEN=OFF \
                  -DBUILD_DOC=ON \
-- 
2.17.1


