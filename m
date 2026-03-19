Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 429D31091910
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 19:00:14 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2958.1773944653215791916
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 11:24:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AK5lAcXc;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: careers.myinfo@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2b06d33e84cso7842525ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 11:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773944652; x=1774549452; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/vEHcksuQAnvi/q6R7PVYHGdFjR594cbicbojCX2Jus=;
        b=AK5lAcXcOBnOBTuxoWeJOSv6iLJiNE7qsZKRPBag5Ip1KrLfaO3110K3ofQqP4Y5Yf
         tdJaCMZpffFXArixNxyj0yNEdPYMjle/cpGMJLrZohUqmYgsfT5SfOrwZjghgTP7O8XL
         VtYvGDM/bN7CLGZBMAyUv6z4ZOyO/4fa1faiOxjRQ6T1FakFyNAuYsG6FzAA1btGp3LA
         TJwY1CbHclPZmztm3MkaNPXz2kiUxtxYfp7x+wdRYA4gC3SenU4jikWsykl46M1fjDDh
         7maP4SLkwS0cG/AlrOm1CfkNgEJWxQGyZe76lh0+wy8/IaSqz+djOZ7KKTP4A2DtdEKn
         pcsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773944652; x=1774549452;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/vEHcksuQAnvi/q6R7PVYHGdFjR594cbicbojCX2Jus=;
        b=tDVyRgyVRl0ZxKnZPgDl8afIIF2oS3erxMuhg5axFYe0Y4nrWq35hRzfBd4FkPItGF
         k5F9XkNnl+8lfgmPBdKKxsaK1a0e9cLlTyXIkJg3rRXyvSyaC1SaVYLSJycQ1cv7HZLI
         RtVzJVBf6ENCDVxShcvpUKUIYHqXzFCIar4AsR0AmyxWnm6xGWAaW55FgSZ+Sv2DYiEB
         LXKTA0VIlXtZS9grZT+wLnkSVLXnlwn0uFKn1qvxFCevUqyJsc7ktLmDhL9D7yaDkJNd
         f6D2uU5F0MAMLn8Y8FJPoR8SBn5DKw7tM7fgSiW1c7/mds1eAuAlAMtPwtWM0xqbzkqi
         I6lA==
X-Gm-Message-State: AOJu0YxQjnttiFc4q/d834E8TzbmZaFmhnjvw8NW70V4hYSShWCsZwf8
	0mvR/Ow39u+m0kGM5D3Bww2/v8jDqbLeknHj6DPAaLnn9ZDkKeYs4/p/ovq11w==
X-Gm-Gg: ATEYQzzzPOhcdPIKFji2oS+HJcblbFyywds4Z6hRRsrGLgne35lPJLJY6rAb+8YBmez
	Vm5q+rgQLA1aGwpiY9XUZFyN6ocehU+7Bc5Y7zvMJtbiP98PUZ9BZ29af5klrOX4AIhu0kCawaM
	ycS8mCxnVE7w0Uz/Fuj0i+sGeqKf8mcZ7UbtNQ42z3iNImt7WpNUi4kAy/RnZxeTuU4FIai0DjL
	GzObCRlVN96wzV2lQIA7ThvKy1/IWm/YHi9r+VrH1nPjJUE5aGq1h+Jj33vgxR7SmpE2H2/wd45
	h2acYvAgCgNEJI2DuUiPjnHy7iBVxb8zWOV6uieoO+2Rz4u30b8rbXR3Z7ONxVxgN+Zh9x3vX3r
	7D2+6POS6Z6Hc629SlWRhZAaDL0tsEwRBurCbS7FkDt9jJ04PCiU+Oik8Pc3UoaYWQ9DrA4midE
	zmI2fC5wy0U0Om8XlUQh7YnRpXrXsCVMIyYw==
X-Received: by 2002:a17:902:f709:b0:2b0:4eeb:f80a with SMTP id d9443c01a7336-2b082769c57mr2164145ad.29.1773944651845;
        Thu, 19 Mar 2026 11:24:11 -0700 (PDT)
Received: from L-15597L.kpit.com ([49.205.103.188])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e43141esm65299515ad.20.2026.03.19.11.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 11:24:11 -0700 (PDT)
From: Shaik Moin <careers.myinfo@gmail.com>
X-Google-Original-From: Shaik Moin <moins@kpit.com>
To: openembedded-core@lists.openembedded.org
Cc: careers.myinfo@gmail.com
Subject: [OE-core][master][PATCH -v2] libpcre2: Enabling Ptest support
Date: Thu, 19 Mar 2026 23:53:17 +0530
Message-Id: <20260319182317.1694132-1-moins@kpit.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 19:00:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233550

Install libpcre2 test suite and run it as ptest.

Add tests for POSIX wrapper (pcre2posix_test), core PCRE2 engine (RunTest), and grep utility (RunGrepTest).

pcre2posix_test: Verifies the POSIX wrapper API
RunTest: Executes the core PCRE2 test suite through pcre2test
RunGrepTest: Checks pcre2grep to ensure its grepping style matching works as expected with various patterns and input files.

Signed-off-by: Shaik Moin <moins@kpit.com>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../libpcre/libpcre2/run-ptest                | 32 +++++++++++++++++++
 .../recipes-support/libpcre/libpcre2_10.47.bb | 18 +++++++++--
 3 files changed, 49 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/libpcre/libpcre2/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index d0c2c2816c..a2d7a56e79 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -39,6 +39,7 @@ PTESTS_FAST = "\
     libmd \
     libnl \
     libpcre \
+    libpcre2 \
     librsvg \
     libsolv \
     libssh2 \
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


