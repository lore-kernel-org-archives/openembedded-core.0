Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.5947.1609856726237236424
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jan 2021 06:25:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=DFeJbacn;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id j13so1782018pjz.3
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Jan 2021 06:25:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=5ogsIf8AG8oCGCqcBjHR7WcNOlj8o72Pue8jDSVW4zc=;
        b=DFeJbacn0rjpnNxsBX7g7JiOZ6OF7n5f85laBlJPivqEnuxT8ERhaKS0ZbAQQcdfJK
         ra5R74TOm1jHui5yImMBF7zdPAYriJuXTgB1VrXuhriQ8Xof/Kz1j4c1kOVFzkKzEnjV
         TQHlUTuutwqdSZBcexFhkvIB5xMBE6Yi6Av1N7ZQCdDXpZSZqfSbEAB00ipJ8byBN2C9
         ZxN6t0cTT8GI2W2Ht6FAibfmjFtfXtkl4+NulQ94JvOwRE9m2feN3RFI6+11muo298Yb
         1TbQK4oE42xdY6v73sEoABbWLcd6GI1/YW2n1raQA0Ii5qgH2lcjPEwzdVCmr067qjIg
         mZAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=5ogsIf8AG8oCGCqcBjHR7WcNOlj8o72Pue8jDSVW4zc=;
        b=dAtQ7um9sTS6EGNEmttv9qb3qIr2nZ7bLnVOEVhZcSRAzi2HyNJZR/v84fE1Ib8442
         ed6asZ9fJkCCOqPW4ETywX8yxznE7XARyWkngXLuCNsP6cnwhiVXx2usqFyKL3syMDj1
         sIdG6z6LMhRv7s41+dpuKkLTbXprOimN7Q8/PCV75hjtGMYi6kAiTPkVvLLZJ/EI4qHV
         naZ9xNnMMieomhfaG6zYuxpJFFHzrh3pPxlpb0cuSt2hEjSTPy4KrhC6VoLZtK8EYcf8
         mmVnEWeRpu9fYBH1WHtmqjjXeQ93gHEmudHB3QtkQi04h4f+V5khjFFrdAzGGRughpLj
         QQpg==
X-Gm-Message-State: AOAM531QxZneIUVsOPmvb0hD70K6V/Y5ZhugcAsOt8LC0tOrHw5FEGAC
	+2WSW6Nn8iXRZofZ9EAmQPTFaPmCLq+o/X3f/XE=
X-Google-Smtp-Source: ABdhPJwOgSWb2RPNeKVdzFG3gY31U9f4CaNNM1dHgmNQgLPXAQH1KsQdlyMxeNnNLDEZ9lQ1rS0Sjw==
X-Received: by 2002:a17:90a:fcc:: with SMTP id 70mr4212619pjz.168.1609856725435;
        Tue, 05 Jan 2021 06:25:25 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id i130sm57552465pfe.94.2021.01.05.06.25.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 06:25:24 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 14/30] valgrind: exclude bar_bad/bar_bad_xml from ptests
Date: Tue,  5 Jan 2021 04:23:39 -1000
Message-Id: <c29662d34afe653e08516898324f73182957aa30.1609856435.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1609856435.git.steve@sakoman.com>
References: <cover.1609856435.git.steve@sakoman.com>

From: Alexander Kanavin <alex.kanavin@gmail.com>

The tests' output is non-deterministic and sometimes
doesn't match the sample output. This has been reported at
https://bugs.kde.org/show_bug.cgi?id=430321
(see also an earlier related bug https://bugs.kde.org/show_bug.cgi?id=358213)

Until upstream figures out how to fix this, let's not run the tests.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7f7d2fa18267090891754d976cbc3e628324d3dd)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../valgrind/valgrind/remove-for-aarch64               |  2 --
 meta/recipes-devtools/valgrind/valgrind/remove-for-all |  2 ++
 meta/recipes-devtools/valgrind/valgrind/run-ptest      | 10 ++++++++++
 meta/recipes-devtools/valgrind/valgrind_3.15.0.bb      |  2 ++
 4 files changed, 14 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/remove-for-all

diff --git a/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64 b/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64
index a3a0c6e50f..93bfd45a4e 100644
--- a/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64
+++ b/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64
@@ -31,8 +31,6 @@ drd/tests/annotate_static
 drd/tests/annotate_trace_memory
 drd/tests/annotate_trace_memory_xml
 drd/tests/atomic_var
-drd/tests/bar_bad
-drd/tests/bar_bad_xml
 drd/tests/bar_trivial
 drd/tests/bug-235681
 drd/tests/bug322621
diff --git a/meta/recipes-devtools/valgrind/valgrind/remove-for-all b/meta/recipes-devtools/valgrind/valgrind/remove-for-all
new file mode 100644
index 0000000000..d6a85c4735
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/remove-for-all
@@ -0,0 +1,2 @@
+drd/tests/bar_bad
+drd/tests/bar_bad_xml
diff --git a/meta/recipes-devtools/valgrind/valgrind/run-ptest b/meta/recipes-devtools/valgrind/valgrind/run-ptest
index 97b0a85dbf..7217dfca5d 100755
--- a/meta/recipes-devtools/valgrind/valgrind/run-ptest
+++ b/meta/recipes-devtools/valgrind/valgrind/run-ptest
@@ -17,6 +17,12 @@ EXP_TOOLS="exp-bbv exp-dhat exp-sgcheck"
 GDB_BIN=@bindir@/gdb
 cd ${VALGRIND_LIB}/ptest && ./gdbserver_tests/make_local_links ${GDB_BIN}
 
+echo "Hide valgrind tests that are non-deterministic"
+echo "Reported at https://bugs.kde.org/show_bug.cgi?id=430321"
+for i in `cat remove-for-all`; do
+   mv $i.vgtest $i.IGNORE;
+done
+
 arch=`arch`
 if [ "$arch" = "aarch64" ]; then
    echo "Aarch64: Hide valgrind tests that result in defunct process and then out of memory"
@@ -44,6 +50,10 @@ if [ "$arch" = "aarch64" ]; then
    done
 fi
 
+echo "Restore valgrind tests that are non-deterministc"
+for i in `cat remove-for-all`; do
+   mv $i.IGNORE $i.vgtest;
+done
 
 passed=`grep PASS: ${LOG}|wc -l`
 failed=`grep FAIL: ${LOG}|wc -l`
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
index a764d18177..e16a58fc62 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
@@ -16,6 +16,7 @@ SRC_URI = "https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
            file://Added-support-for-PPC-instructions-mfatbu-mfatbl.patch \
            file://run-ptest \
            file://remove-for-aarch64 \
+           file://remove-for-all \
            file://0004-Fix-out-of-tree-builds.patch \
            file://0005-Modify-vg_test-wrapper-to-support-PTEST-formats.patch \
            file://0001-Remove-tests-that-fail-to-build-on-some-PPC32-config.patch \
@@ -171,6 +172,7 @@ do_install_ptest() {
     # The scripts reference config.h so add it to the top ptest dir.
     cp ${B}/config.h ${D}${PTEST_PATH}
     install -D ${WORKDIR}/remove-for-aarch64 ${D}${PTEST_PATH}
+    install -D ${WORKDIR}/remove-for-all ${D}${PTEST_PATH}
 
     # Add an executable need by none/tests/bigcode
     mkdir ${D}${PTEST_PATH}/perf
-- 
2.17.1

