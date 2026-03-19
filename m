Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F05D0109190B
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 18:19:13 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2863.1773944107566777641
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 11:15:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TgCJZfs9;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: careers.myinfo@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2b06d33e84cso7786175ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 11:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773944106; x=1774548906; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5YArFggO68vnv92RS21pyFlqMERmSGCtGtdPETjpwhg=;
        b=TgCJZfs9pGO9cxcL1XK/nrzj2ThEBmFo+55H1f48jnDFgVJ5LRmOx9SmiUU8SM2+Kd
         14TV69hgy+YH64ZWaXCpFwh05GvN8W9KEqFe8Kug7N2Y0uHryz1mDCafS0Ut+/epLY4S
         72JB3XXKdWllY/ac6c8NytUPVjtj1xr07LzXIzp0v4RFCk60TCSF87xa0ApFmxE+a2IO
         yIDxuVZk8FQNaRcSz76jre/nNMmfItYb7BWCPV27B05ooswn+2O3D/X1KuD8m8LP5eKd
         rhR8mYO41aJtJ4Tg4NPp1kBze4Y8eAyf5v5S49DnCXShuDyzI8y2ovht4AODkT9EOtiD
         mqQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773944106; x=1774548906;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5YArFggO68vnv92RS21pyFlqMERmSGCtGtdPETjpwhg=;
        b=Ayl8/0PbL0TZtJQgobyHM4AMIE5R1rJ5f9cbMAomVuwPLvKBJbAL8DY9q+WHNlMFB4
         bI+mYKMkzB4H7tOSVEKxCKOYzLd5rnh7W6EuIC+qQYC0UJZw+mB6r9mqmIuF16MXiJvv
         3u880SvKpjGypi7F43Xq1oFs0nzgcstaz1yiJH7+USPdqlbs78C7sFQdTK4nE+3iF+0E
         +MDHfFSNL9HDSsiIOf/rjMc6bPoAh0ghDZTpUkstuc6l673Gg9aOgUQ8pJmF769JfxWe
         ymrgUkqZGKsOZjSjABPhWHqIRZDscejgmwVn0pHu0wp3rnNeBlLtn3u78fWFbM1QDSjr
         LnrQ==
X-Gm-Message-State: AOJu0YztrcBOPQqZheYRbn9XuV6ZgCPx6FeQBRyfbpmCuWWBlwZtlbg9
	CJsfND0CBGjWOAkSxJILvTDUhDoBJ5Kacg57zYUFXlMvRoxwbWUazEctg1xmyw==
X-Gm-Gg: ATEYQzxy+tI5VBg/b/9aMsvqPZ/R6QfBe9mC4yXDj+OxaBc0fP+q2PAQowa2k+vR8PS
	QUSRejMus7l7ufsJFMh7nFQD35mmCHrN8pCVsQ0tsNspWdcAQ3MPqcPKDd0cW+cqsJkJ+LYYZMo
	ZptYNQ1ai0TwxsssB/9zB30LmiOypjuFPkylwowLf9XApyIiot479pXSNbBiymfFPO8HKUQ+LLT
	2DwYVmd+FcF6NnuZyhp0HGtauc06zv/2ckfQvsW48OjtGbc8gtECp1khcBivYTamOVx+/9wmLwf
	thGV1ijv1Z01ILEGKKFucz9K/HphbhGrymO7j4ynirbyIM/a1eJTd1G5YIKzIlE0qs9rIUpTRUK
	T0gQefKBxVk9SIjETAmxLwcEq5E2VBgKtbHhNe+5QyEQ0pv3fWmTWWudA5vTybsAqWKa+o2bqPf
	R4qIAi9V3OJDpNDUR+Yjq41KM=
X-Received: by 2002:a17:902:d2c1:b0:2a9:616c:1711 with SMTP id d9443c01a7336-2b0827a1b06mr2310385ad.42.1773944106106;
        Thu, 19 Mar 2026 11:15:06 -0700 (PDT)
Received: from L-15597L.kpit.com ([49.205.103.188])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e604e7bsm87687005ad.63.2026.03.19.11.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 11:15:05 -0700 (PDT)
From: Shaik Moin <careers.myinfo@gmail.com>
X-Google-Original-From: Shaik Moin <moins@kpit.com>
To: openembedded-core@lists.openembedded.org
Cc: careers.myinfo@gmail.com
Subject: [OE-core][master][PATCH -v2] libpcre2: Enabling Ptest support
Date: Thu, 19 Mar 2026 23:44:09 +0530
Message-Id: <20260319181409.1689458-1-moins@kpit.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 18:19:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233548

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


