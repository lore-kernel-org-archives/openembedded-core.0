Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.9836.1620227942444724902
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 08:19:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DGC3nVvf;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id u21so3414278ejo.13
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 08:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Mjxorz6nx+ypOr0CdTVTEbtALfmXI0+Gen++8bKjWFQ=;
        b=DGC3nVvfHiILlBGaVv5ErCcs3Tmvr7bHrqCOKjHAYc1lWgwLn6Hxgj+QMIskGhzXY3
         LrHFDY5vYkFmk5dQoLDZ0dzuZ6hBPk7SykGSciYkd79fXqcnWwT9qJqhXoFCHmMh23ay
         5e6ImDjWS/MelFBrmo3iErXP0FTtWYnmpjb01mC5xDLxe+hIrjPH+ZS+0asEt3Qblr/X
         WaqLb1mvvI6M3AUt10zargNaVnoQTVcKuRljSLLiekzHaB/dtC0lTNF8rRNvXPA6JikQ
         0qs4KQk6nUMle/dAi859p0I/QWFzLrghOKjMexrH5RtXuyfdx2uDpROL7RcHhYv2U27z
         nZKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Mjxorz6nx+ypOr0CdTVTEbtALfmXI0+Gen++8bKjWFQ=;
        b=CdDC3cg0L7cZogIzdvgjpQIllXit95Mn7NvI46Turr61Qru4EGLCpFvKLK85Penlb/
         mxsuffSs0k7tJexDosEDj7IW2aLMN9AVfYGzoMAo/VBV39DFeUmg99G9kf29yGTmUs4Y
         rQgnnSLTtMDVhBt9a/4qYit5KbCbnOzcFVzWUOC/U8D/t5OwfWQs7N6yjkkdM0YYLb77
         Io3NFOuYhOuGWvpYqUBSK5Z8DLpt0UxFPxoBQF/hdp3yxfGAc3pNQQCl92HgEN/cPUXw
         szdGPbgXaSyidSkWK2L2GHX5zSGQRwsH5wDvtPWCTrFcRsp+Oa2aZbNudegDRQpfCpv0
         9Rcg==
X-Gm-Message-State: AOAM532bsRKF0qxhpnvmoGzuYbz4rowlyDRl5Ci31dYKwm7A5dAYljKT
	f0Cc8o2QVDnQBm5hPca+/5ZgEs1ILKlpyQ==
X-Google-Smtp-Source: ABdhPJz8wZSEJtyNOeSw4Jg3YXaHPYNmDQjGjnmODQIpPHtj7qt7VG8P2MiMyZd7wP6SO1HZELk2nw==
X-Received: by 2002:a17:906:5ad5:: with SMTP id x21mr28172123ejs.422.1620227941058;
        Wed, 05 May 2021 08:19:01 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id y11sm3018479ejj.55.2021.05.05.08.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 08:19:00 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 06/61] expat: upgrade 2.2.10 -> 2.3.0
Date: Wed,  5 May 2021 17:17:55 +0200
Message-Id: <20210505151850.660512-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505151850.660512-1-alex.kanavin@gmail.com>
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop 0001-Add-output-of-tests-result.patch
(difficult to rebase).

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../0001-Add-output-of-tests-result.patch     | 83 -------------------
 .../expat/{expat_2.2.10.bb => expat_2.3.0.bb} |  7 +-
 2 files changed, 3 insertions(+), 87 deletions(-)
 delete mode 100644 meta/recipes-core/expat/expat/0001-Add-output-of-tests-result.patch
 rename meta/recipes-core/expat/{expat_2.2.10.bb => expat_2.3.0.bb} (81%)

diff --git a/meta/recipes-core/expat/expat/0001-Add-output-of-tests-result.patch b/meta/recipes-core/expat/expat/0001-Add-output-of-tests-result.patch
deleted file mode 100644
index c5c18ead74..0000000000
--- a/meta/recipes-core/expat/expat/0001-Add-output-of-tests-result.patch
+++ /dev/null
@@ -1,83 +0,0 @@
-From aa84835a00bfd65e784d58411e76f60658e939dc Mon Sep 17 00:00:00 2001
-From: Oleksandr Popovych <oleksandr.s.popovych@globallogic.com>
-Date: Tue, 18 Feb 2020 19:04:55 +0200
-Subject: [PATCH] Add output of tests result
-
-Added console output of testing results in form 'RESULT: TEST_NAME'.
-
-Changed verbose mode of test application set by '-v' ('--verbose')
-argument to CK_NORMAL.
-Added new supported argument '-vv' ('--extra-verbose') that changes
-verbose mode of test application to CK_VERBOSE. Results of each test
-are shown in output only if this mode is set.
-
-Upstream-Status: Denied
-
-This patch changes potentially deprecated feature that shoud be changed
-in upstream. [https://github.com/libexpat/libexpat/issues/382]
-
-Signed-off-by: Oleksandr Popovych <oleksandr.s.popovych@globallogic.com>
----
- tests/minicheck.c | 10 +++++++++-
- tests/runtests.c  |  4 +++-
- 2 files changed, 12 insertions(+), 2 deletions(-)
-
-diff --git a/expat/tests/minicheck.c b/expat/tests/minicheck.c
-index a5a1efb..94fa412 100644
---- a/tests/minicheck.c
-+++ b/tests/minicheck.c
-@@ -164,6 +164,8 @@ srunner_run_all(SRunner *runner, int verbosity) {
-       if (tc->setup != NULL) {
-         /* setup */
-         if (setjmp(env)) {
-+          if (verbosity >= CK_VERBOSE)
-+            printf("SKIP: %s\n", _check_current_function);
-           add_failure(runner, verbosity);
-           continue;
-         }
-@@ -171,6 +173,8 @@ srunner_run_all(SRunner *runner, int verbosity) {
-       }
-       /* test */
-       if (setjmp(env)) {
-+        if (verbosity >= CK_VERBOSE)
-+          printf("FAIL: %s\n", _check_current_function);
-         add_failure(runner, verbosity);
-         continue;
-       }
-@@ -178,12 +182,16 @@ srunner_run_all(SRunner *runner, int verbosity) {
-
-       /* teardown */
-       if (tc->teardown != NULL) {
--        if (setjmp(env)) {
-+        if (setjmp(env)) {
-+          if (verbosity >= CK_VERBOSE)
-+           printf("PASS: %s\n", _check_current_function);
-           add_failure(runner, verbosity);
-           continue;
-         }
-         tc->teardown();
-       }
-+      if (verbosity >= CK_VERBOSE)
-+        printf("PASS: %s\n", _check_current_function);
-     }
-     tc = tc->next_tcase;
-   }
-diff --git a/tests/runtests.c b/expat/tests/runtests.c
-index 7791fe0..75724e5 100644
---- a/tests/runtests.c
-+++ b/tests/runtests.c
-@@ -11619,9 +11619,11 @@ main(int argc, char *argv[]) {
-   for (i = 1; i < argc; ++i) {
-     char *opt = argv[i];
-     if (strcmp(opt, "-v") == 0 || strcmp(opt, "--verbose") == 0)
--      verbosity = CK_VERBOSE;
-+      verbosity = CK_NORMAL;
-     else if (strcmp(opt, "-q") == 0 || strcmp(opt, "--quiet") == 0)
-       verbosity = CK_SILENT;
-+    else if (strcmp(opt, "-vv") == 0 || strcmp(opt, "--extra-verbose") == 0)
-+	verbosity = CK_VERBOSE;
-     else {
-       fprintf(stderr, "runtests: unknown option '%s'\n", opt);
-       return 2;
---
-2.17.1
diff --git a/meta/recipes-core/expat/expat_2.2.10.bb b/meta/recipes-core/expat/expat_2.3.0.bb
similarity index 81%
rename from meta/recipes-core/expat/expat_2.2.10.bb
rename to meta/recipes-core/expat/expat_2.3.0.bb
index fa263775b3..14d2855df3 100644
--- a/meta/recipes-core/expat/expat_2.2.10.bb
+++ b/meta/recipes-core/expat/expat_2.3.0.bb
@@ -8,11 +8,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=9e2ce3b3c4c0f2670883a23bbd7c37a9"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/expat/expat-${PV}.tar.bz2 \
            file://libtool-tag.patch \
-	   file://run-ptest \
-	   file://0001-Add-output-of-tests-result.patch \
-	  "
+           file://run-ptest \
+           "
 
-SRC_URI[sha256sum] = "b2c160f1b60e92da69de8e12333096aeb0c3bf692d41c60794de278af72135a5"
+SRC_URI[sha256sum] = "f122a20eada303f904d5e0513326c5b821248f2d4d2afbf5c6f1339e511c0586"
 
 EXTRA_OECMAKE_class-native += "-DEXPAT_BUILD_DOCS=OFF"
 
-- 
2.31.1

