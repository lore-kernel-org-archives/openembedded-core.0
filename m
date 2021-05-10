Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web08.31265.1620651680311646971
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 May 2021 06:01:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ari62yyA;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id di13so18606615edb.2
        for <openembedded-core@lists.openembedded.org>; Mon, 10 May 2021 06:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=exLzS5Q8nInc3lJMfiXrueZlLUY3R7I2wetunvm7SvE=;
        b=Ari62yyAEDW+uCMfTbk2MfyxM+/ZWjrQBJIRcjurNthDy3r7kOxUFqIxlBflvdYmuL
         nlmCv3Evy/egNEwZFf3oyqHOCVr8yZCqRgDCHZGEj0Y1pJWq7crccik0ElWOh20hoMNM
         ajSaXOCKAdqkc/KsrWOJAaAuTIeUh1BnmaYHvYCrtXsHcDKwTBIcgF6uHnitn0vl11lZ
         nAKP8mUDe3JBa4/20AuvG1vsxc/AJ46Amqx0maNHLk1lFWS3FitNAGyRLsNE8Kaf6oVg
         /kGtZWar06jlhw90XNGgBK28NnHhTsFsJCuiyw5n+LD4YYm+gH/PL/QkN02toJoBkv7a
         MuhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=exLzS5Q8nInc3lJMfiXrueZlLUY3R7I2wetunvm7SvE=;
        b=qeCG6bfozgmsqSgGBVjm1Yj7XlMONL7XQ0XlMPt9dGHNKxSgtGoK3c3kjSjFJr9qwp
         N82rbrQIs7KtNfsRdF0UIViA/ajBm6VJLsbHj7lAfUCNzz9uOQRtP41irA8jOqpBNmcD
         YxrIItbHydRcb2kBEtbViEDpmZB8Wc7xUTkJfsHpWUkWQ+XlvmHQD2rE3AEaGiM5axUf
         m9oY7RyTVPDYfkD1t1yoHW99XOeDw3tf19BNkhRYDNc2xdMlPIhE2Avm7MYaRkhwYyAa
         78e+Cxa2HgnJFX43I8fOdqFVYFEdWMdkXwluFR5y5KQXAP9l05ab9tSkoo8mONiWimH8
         HF9g==
X-Gm-Message-State: AOAM532xYUxcmUrfQHU0gI2Qd23ZrKKA5CdigkL79S+Izngj+yn0XiW4
	InFmft2DktAEiAhdZGiAOuVhg1AO1jc=
X-Google-Smtp-Source: ABdhPJzFyAcsW8FyU7sUFriXTUrEFkdxcnbHb2LRIwlbhdisAx71ofLD3f6wsLFSeQ5JsilPWGOrmQ==
X-Received: by 2002:a50:bec1:: with SMTP id e1mr29285974edk.116.1620651678883;
        Mon, 10 May 2021 06:01:18 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id pw11sm9057361ejb.88.2021.05.10.06.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 06:01:18 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 3/8] expat: upgrade 2.2.10 -> 2.3.0
Date: Mon, 10 May 2021 15:01:05 +0200
Message-Id: <20210510130110.939820-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210510130110.939820-1-alex.kanavin@gmail.com>
References: <20210510130110.939820-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop 0001-Add-output-of-tests-result.patch
(difficult to rebase). I have verified that ptests
still pass, and print PASS for every test. If they
start failing we can revisit what kind of output would
be beneficial.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../0001-Add-output-of-tests-result.patch     | 83 -------------------
 meta/recipes-core/expat/expat/run-ptest       |  4 +-
 .../expat/{expat_2.2.10.bb => expat_2.3.0.bb} |  7 +-
 3 files changed, 5 insertions(+), 89 deletions(-)
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
diff --git a/meta/recipes-core/expat/expat/run-ptest b/meta/recipes-core/expat/expat/run-ptest
index 1b39cec8e5..59d8ab57e3 100644
--- a/meta/recipes-core/expat/expat/run-ptest
+++ b/meta/recipes-core/expat/expat/run-ptest
@@ -18,6 +18,6 @@ TIME=$(which time)
 
 echo "Architecture: $(uname -m)" > ${output}
 echo "Image: $(uname -sr)" >> ${output}
-${TIME} -f 'Execution time: %e s' bash -c "testCheck runtests -vv" |& tee -a ${output}
-${TIME} -f 'Execution time: %e s' bash -c "testCheck runtestspp -vv" |& tee -a ${output}
+${TIME} -f 'Execution time: %e s' bash -c "testCheck runtests -v" |& tee -a ${output}
+${TIME} -f 'Execution time: %e s' bash -c "testCheck runtestspp -v" |& tee -a ${output}
 echo
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

