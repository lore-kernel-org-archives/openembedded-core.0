Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F799FCD0D6
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 08:27:18 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8864.1773820660196515101
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 00:57:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nn9F+xZc;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: careers.myinfo@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-89a14be4733so82597386d6.2
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 00:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773820659; x=1774425459; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5YArFggO68vnv92RS21pyFlqMERmSGCtGtdPETjpwhg=;
        b=nn9F+xZcNfejwgr2ACZFlOUoRETfloUQVTaz0h9q3txtCIwrjU/R25mWt2jHpforlS
         szMlXQ+nWN3jJ6ogaVDzVeOSqANP3owDhylmnneBJbdQSsfr6s9glGESkjPedNURLx3Y
         HkzJAeSGij5oKz8qedQJ/P3S3jcO4sO/evc9re4FaH919ueBG3Jm44FkRTWxJKPjDXEC
         wB99BtNdTcfNYpnnN4UAuSQ9LkXO5OU6E6YCVKmjG29wjmt0oSjNY9q6qOQzIrCCOi+6
         y8f5bCitokDse0I2HczgdSRcE7eii00iAtVSlHPbC/sk4G1R4hTKXlB33fRDCPgrQk+W
         id8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773820659; x=1774425459;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5YArFggO68vnv92RS21pyFlqMERmSGCtGtdPETjpwhg=;
        b=RYv6tJG02EVi/9VJN2TsdOPQ2u49JNhBNiH/kOoZHC8iIVcwJFoT42Xz5STr6ATZEK
         I+1j3guIrfqf4e8CRX/WoB0OXb/IRRnofMfvCN1bZDoHBcFi8Dw9IiJ/TtKMECMhk6f7
         DzYJ1D4hQ7kBcKE0M8gxzQBckLXXlNGzIkTX55ZfqmX3zjGM4OcXT/pzxnfiIKoBHj0i
         R++nSy9c9ORvZhyfYEAi8kKOm+HPmqPYQMmARJtYlmohCRdBJ+AHHagQ7661JsZ2ngei
         ufbYdiZ1SinAeuDjy5C821erfdp9CQ4nFkIPYNgeJPtxWkXialoH2Naamfb7zidSCNRO
         FYIw==
X-Gm-Message-State: AOJu0YySUjnhRG1YRza9fBFZKeyUb3bAgT6cBmb74vtQGeZ/uUnhsp+1
	6R+tlLJf0pXumKZfC0u9UrvLBN0EwXPH/DIki8ND5Rw80XLnvA6+Jt3Pe/k9pg==
X-Gm-Gg: ATEYQzxh9pHZI/2+ZbXgrK8nlRO0GBTz4+Rup0V01/ozO9hSzVW0Onwp0jgY/FuUqLW
	YIw8IkBeOZdfaoHtJuZCEb/rty57lgOotUze1+aaNsFyOLaKiJ4pnjutYi9opqym4JcpYZ4oZPM
	SPZ2UYUnwF1r0JQxFfePWNg+R1wg841BhW6nSGacPzcoWZs/biEbf43N89nk9xB9+YULfWQnWNQ
	MY1dHnGX3AfY13WMvm0MkrW9/DlfW7iOh67Q/CTJHF2Jp+OFhCf9BqRjh0nNGjEQ+tV3pqRf5TN
	CkFvj7h9gM1qfqhrVaiMzDO+Icr2G5TI94KaB2QVaPiSlXs94IKB18rNfbG4SrrQnk6yrhG1K6W
	Us+MJF/2QYiqw5RutzZJ2xvrhQa682EdL5ZaytzwA+4dNoQzXw8d5WDcPFjb+ZJJHPOlIjdP+s9
	hbsI3ltlAl7OTYV8doi54ECoeMnh5d2utZ
X-Received: by 2002:a17:902:d4c5:b0:2b0:6ba2:3d3a with SMTP id d9443c01a7336-2b06e30a339mr24261925ad.14.1773820226649;
        Wed, 18 Mar 2026 00:50:26 -0700 (PDT)
Received: from L-15597L.kpit.com ([49.205.102.75])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e608a66sm17042865ad.61.2026.03.18.00.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 00:50:26 -0700 (PDT)
From: Shaik Moin <careers.myinfo@gmail.com>
X-Google-Original-From: Shaik Moin <moins@kpit.com>
To: openembedded-core@lists.openembedded.org
Cc: careers.myinfo@gmail.com
Subject: [OE-core][master][PATCH v2] libpcre2: Enabling Ptest support
Date: Wed, 18 Mar 2026 13:19:31 +0530
Message-Id: <20260318074931.343318-1-moins@kpit.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 08:27:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233371

Install libpcre2 test suite and run it as ptest.

Add tests for POSIX wrapper (pcre2posix_test), core PCRE2 engine (RunTest), and grep utility (RunGrepTest).

pcre2posix_test: Verifies the POSIX wrapper API
RunTest: Executes the core PCRE2 test suite through pcre2test
RunGrepTest: Checks pcre2grep to ensure its grepping style matching works as expected with various patterns and input files.

Signed-off-by: Shaik Moin <moins@kpit.com>
---
 .../libpcre/libpcre2/run-ptest                | 32 +++++++++++++++++++
 .../recipes-support/libpcre/libpcre2_10.47.bb | 18 +++++++++--
 2 files changed, 48 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/libpcre/libpcre2/run-ptest

diff --git a/meta/recipes-support/libpcre/libpcre2/run-ptest b/meta/recipes-support/libpcre/libpcre2/run-ptest
new file mode 100644
index 0000000000..2acfd17b17
--- /dev/null
+++ b/meta/recipes-support/libpcre/libpcre2/run-ptest
@@ -0,0 +1,32 @@
+#!/bin/sh
+
+TESTS="RunGrepTest RunTest"
+total=0
+pass=0
+fail=0
+
+for T in $TESTS; do
+    if [ -x "./$T" ]; then
+        echo "Running $T"
+        total=$((total + 1))
+        if "./$T"; then
+            echo "PASS: $T"
+            pass=$((pass + 1))
+        else
+            echo "FAIL: $T"
+            fail=$((fail + 1))
+        fi
+    else
+        echo "SKIP: $T (not found or not executable)"
+    fi
+done
+
+# Summary
+echo "============================================================================"
+echo "# TOTAL: $total"
+echo "# PASS:  $pass"
+echo "# FAIL:  $fail"
+echo "============================================================================"
+
+# Exit code based on failures
+[ "$fail" -eq 0 ] && exit 0 || exit 1
diff --git a/meta/recipes-support/libpcre/libpcre2_10.47.bb b/meta/recipes-support/libpcre/libpcre2_10.47.bb
index 217a60aae9..70079e0b65 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.47.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.47.bb
@@ -12,7 +12,9 @@ LIC_FILES_CHKSUM = "file://LICENCE.md;md5=6720bf3bcff57543b915c2b22e526df0 \
                     file://deps/sljit/LICENSE;md5=97268427d235c41c0be238ce8e5fda17 \
                     "
 
-SRC_URI = "${GITHUB_BASE_URI}/download/pcre2-${PV}/pcre2-${PV}.tar.bz2"
+SRC_URI = "${GITHUB_BASE_URI}/download/pcre2-${PV}/pcre2-${PV}.tar.bz2 \
+           file://run-ptest \
+"
 
 GITHUB_BASE_URI = "https://github.com/PCRE2Project/pcre2/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/pcre2-(?P<pver>\d+(\.\d+)+)$"
@@ -28,7 +30,7 @@ DEPENDS += "bzip2 zlib"
 
 BINCONFIG = "${bindir}/pcre2-config"
 
-inherit autotools binconfig-disabled github-releases
+inherit autotools binconfig-disabled github-releases ptest
 
 EXTRA_OECONF = "\
     --enable-newline-is-lf \
@@ -57,3 +59,15 @@ FILES:pcre2test = "${bindir}/pcre2test"
 FILES:pcre2test-doc = "${mandir}/man1/pcre2test.1"
 
 BBCLASSEXTEND = "native nativesdk"
+
+do_install_ptest() {
+    t=${D}${PTEST_PATH}
+    cp -r ${S}/testdata $t
+
+    for i in pcre2posix_test pcre2grep pcre2test; do
+        "${B}/libtool" --mode=install install "${B}/$i" "$t"
+    done
+    for i in RunTest RunGrepTest test-driver; \
+      do cp ${S}/$i $t; \
+    done
+}
-- 
2.34.1


