Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10045.1794193927321062671
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Nov 2026 19:12:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=c5z6jLUw;
 spf=pass (domain: gmail.com, ip: 74.125.82.181, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so865466eec.0
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Nov 2026 19:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794193927; x=1794798727; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=l5qMXA4x/zEM/zMdeduXAkTLDh1k9zYewjwGhAe5x4I=;
        b=c5z6jLUwXaFtZo837d7DG27ZrTN5gMydRpAkjRH8cO54ajnul/5dWuuL4mVA9sZOd3
         0/IhrHl7MzC9c2sSUVGpYnJN38m7BAIE1Rz9PsHt5jL06Y/sFoTnhmyUht8PL4uFO4I9
         q77vISgKiG1Kx4DsYvmSDJvkZlKU9izWUpJO9xn4s5JAYXGd6+YrCoNof74HCQLc3dPs
         IBLbtJYHE8i46TPp+mYd9Q+KEYsfj675Wa0osbR3FrvIZxnsfyhNwjRS71moB6TBm/iX
         IMORhWr+/PF0Tb4x9vdGmM2yVyugLNdGoiDUGzPmBceDqNm87nMhzcfdnzgHjuWS9gGV
         9+JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794193927; x=1794798727;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l5qMXA4x/zEM/zMdeduXAkTLDh1k9zYewjwGhAe5x4I=;
        b=1/oqdeTKLMsn/RIV0qGivStQAU3SJt38QjDuAhzfZHfvo0uLn37ANLcz4r78WEzJFq
         NprKREjbfiCmdKx+z52AQ6OVA5LIwMDtszLkmTyZQ+RCEEBlxsaF8mDsDm6Rgjo7/K7j
         l5YZmIge0aZrMA51OYQe3ol6KlRaKcMaJNbEl46CuM7w7xrurwX/eKdwowsdUD1NCAc3
         LAdq1DYwtfeEFSrbw0hocYI0C2WsvzYI8qfNn4y2BmMoBAFlR0idgYbTZ6flygHadDE0
         2F8UpVJM65fsoMrTBpxnJV3WpF7v1FXewH6NK3daVVimi9Yq3xxfGeCoMzDcCc0DpgbU
         XppQ==
X-Gm-Message-State: APuU4Z/fkgqGrdo+VxQhcaFZwGiSbpgfXWdY5t4JM9mYmg+PSD1cAJD5
	guSVpUvKo//mUvRe9RPauNxMsfn3KUQS+8QU9uJQR+TzuyUlutuU6plAqq2sX1iGU48=
X-Gm-Gg: AYBFou0YvMlp1HIAt8/lOOGCvT41MgH/nBFFxH56HduDGg3Ou3R0oA4Oh1SqGg4iPVN
	Gw/6XHwWYmn6vOXFhz6SXe8MmpUes/9xq7iCqZw1hX60epJ9SMMIdBXjmfr5dWZ/kRQ+/sKiz7y
	omnmOGIiVMVmCbXQNzbNjCKDQnRcCfDiIlG4EuQMwmSSa56uAuFhLNEXDyPI/KHuxnUJnxhwJxE
	Ak5a1dZ9waLvPk6QOUy/OTqlTEI82fnOXRpl4Q3hO+oE+63hoiL1CMzAs2+s9femJxxnkkw7aix
	k/DidIH1Be//9J/w9X3x1TuTcysaa2uVLMpXy8WDywXFs2s04vFTL1iTWDLXGhz66AQfbidm+xn
	U1cGzsNJC5nIDfDHaTww9eu2uEvMtKc2e+e2MU0kwQ1Un7cn6rpmqrMj4Oq86cooa6zeh49V0pl
	9xnOe4VicrCyHgtP32+wXlCpwEY3nhk+Onm81ifiy16nIkNldrp2CQDxNe6J6pSHVESUWjfU7Nn
	9tBeaIR1/r+dxPy2bxXYvXfrIpZZbwNlnSk4dWphuJNv/CGlPkLN0ifEO4uMhkFsrQxQHeDMecH
	mDSJMPIFQswxzAttrseDXPOfjRCyM2TBYi7YHWl0UloVH/bFB1nV5Lla7eEuwIxwQ3/JldEt+5N
	GWP/oyUrRsVaSELVGVQ3eZWL4/F0fVV95FBkD9Cv9EIzcd92Nur7ozBsnkDFxbZq0y7cThzxym6
	ivL7/yZuR8qCupuLGMzj3P633mwV1ZkiD+n4lvzP9Xjw3+5Y4Tgb664Pzbv8AHpmtiKFF7+Pp6h
	6g/URGkZKaKgxno5OwiSqKeCNb1+Rd3Kr4e2A9EHd3vzRIgMApGXE7zAK+EgBwE9JRfnXT8UP6Q
	IdmS2A4wKSnpurAWyiC60AwoRQ==
X-Received: by 2002:a05:7300:6822:b0:366:83dd:46f7 with SMTP id 5a478bee46e88-37256becc67mr6240838eec.17.1794193926412;
        Sun, 08 Nov 2026 19:12:06 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265a16c49sm8749346eec.10.2026.11.08.19.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 19:12:05 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH] elfutils: Fix intermittent run-stackprof-system-gprof.sh ptest failure
Date: Sun,  8 Nov 2026 19:12:03 -0800
Message-ID: <20261109031203.101959-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 03:12:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249783
Content-Type: text/plain; charset="utf-8"

GNU timeout sends SIGTERM to the command and then again to its
process group. stackprof exits with _exit(1) on a second signal, so
when its handler runs between the two kill() calls it quits before
printing the sample counts and the test fails:

Fixes

  + grep -E '^buildid [0-9a-f]+' test.out
  FAIL: run-stackprof-system-gprof.sh

Use timeout --foreground in the system-wide stackprof tests so only
stackprof gets signalled. Reproduced in about 1 in 15 runs on a loaded
4-CPU qemux86-64; no failures in 40 runs with --foreground.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../elfutils/elfutils_0.197.bb                |  1 +
 ...rof-system-.sh-run-stackprof-with-ti.patch | 73 +++++++++++++++++++
 2 files changed, 74 insertions(+)
 create mode 100644 meta/recipes-devtools/elfutils/files/0001-tests-run-stackprof-system-.sh-run-stackprof-with-ti.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.197.bb b/meta/recipes-devtools/elfutils/elfutils_0.197.bb
index ca640517f2..b37f068ac5 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.197.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.197.bb
@@ -19,6 +19,7 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://ptest.patch \
            file://0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch \
            file://0001-config-eu.am-do-not-force-Werror.patch \
+           file://0001-tests-run-stackprof-system-.sh-run-stackprof-with-ti.patch \
            "
 SRC_URI:append:libc-musl = " \
            file://0003-musl-utils.patch \
diff --git a/meta/recipes-devtools/elfutils/files/0001-tests-run-stackprof-system-.sh-run-stackprof-with-ti.patch b/meta/recipes-devtools/elfutils/files/0001-tests-run-stackprof-system-.sh-run-stackprof-with-ti.patch
new file mode 100644
index 0000000000..9be19c8ca7
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/0001-tests-run-stackprof-system-.sh-run-stackprof-with-ti.patch
@@ -0,0 +1,73 @@
+From c2a4fcba9dd949e72826591367aeabbb72d826ef Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Sun, 8 Nov 2026 16:06:40 -0800
+Subject: [PATCH] tests/run-stackprof-system*.sh: run stackprof with timeout
+ --foreground
+
+GNU timeout sends the timeout signal to the command and then again to
+its whole process group. stackprof treats a second SIGINT/SIGTERM as a
+request to exit immediately, now if the handler runs between the two
+kill() calls, the second one makes it _exit(1) before the destructors
+print the summary. The output then lacks the pid/buildid sample counts
+and run-stackprof-system{,-gprof}.sh fail intermittently, more often on
+loaded SMP machines.
+
+stackprof does not spawn children in system-wide mode, so --foreground,
+which signals only the command, is enough.
+
+Changelog:
+
+        * tests/run-stackprof-system.sh: Invoke timeout with --foreground
+          option.
+        * tests/run-stackprof-system-gprof.sh: Invoke timeout with
+          --foreground option.
+
+Upstream-Status: Submitted [https://sourceware.org/pipermail/elfutils-devel/2026q4/009891.html]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ tests/run-stackprof-system-gprof.sh | 4 ++--
+ tests/run-stackprof-system.sh       | 4 ++--
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/tests/run-stackprof-system-gprof.sh b/tests/run-stackprof-system-gprof.sh
+index 980a35be..1c511aaf 100755
+--- a/tests/run-stackprof-system-gprof.sh
++++ b/tests/run-stackprof-system-gprof.sh
+@@ -33,14 +33,14 @@ tempfiles test.out
+ testjob_launch
+
+ # run systemwide scan, no gprof output
+-testrun timeout -p --kill-after=5 10 ${abs_top_builddir}/src/stackprof -v 2>&1 | tee test.out
++testrun timeout -p --foreground --kill-after=5 10 ${abs_top_builddir}/src/stackprof -v 2>&1 | tee test.out
+ grep "^perf_event_attr configuration" test.out
+ grep "Starting stack profile collection systemwide" test.out || (grep "ERROR: Unsupported architecture" test.out && echo "unsupported arch" && exit 77)
+ grep -E "^[0-9]+ " test.out # -- pid / sample counts entries
+
+ # run systemwide scan again, with gprof output
+ # reduce verbosity, bump post-processing timeout compared to the first run
+-testrun timeout -p --kill-after=10 10 ${abs_top_builddir}/src/stackprof -g 2>&1 | tee test.out
++testrun timeout -p --foreground --kill-after=10 10 ${abs_top_builddir}/src/stackprof -g 2>&1 | tee test.out
+ tempfiles gmon.*
+ grep "^perf_event_attr configuration" test.out
+ grep "Starting stack profile collection systemwide" test.out
+diff --git a/tests/run-stackprof-system.sh b/tests/run-stackprof-system.sh
+index af64e7f1..76da8d8f 100755
+--- a/tests/run-stackprof-system.sh
++++ b/tests/run-stackprof-system.sh
+@@ -32,14 +32,14 @@ tempfiles test.out
+ testjob_launch
+
+ # run systemwide scan, no gprof output
+-testrun timeout -p --kill-after=5 10 ${abs_top_builddir}/src/stackprof -v 2>&1 | tee test.out
++testrun timeout -p --foreground --kill-after=5 10 ${abs_top_builddir}/src/stackprof -v 2>&1 | tee test.out
+ grep "^perf_event_attr configuration" test.out
+ grep "Starting stack profile collection systemwide" test.out || (grep "ERROR: Unsupported architecture" test.out && echo "unsupported arch" && exit 77)
+ grep -E "^[0-9]+ " test.out # -- pid / sample counts entries
+
+ # run systemwide scan again, with gprof output
+ # reduce verbosity, bump post-processing timeout compared to the first run
+-testrun timeout -p --kill-after=10 15 ${abs_top_builddir}/src/stackprof -g 2>&1 | tee test.out
++testrun timeout -p --foreground --kill-after=10 15 ${abs_top_builddir}/src/stackprof -g 2>&1 | tee test.out
+ tempfiles gmon.*
+ grep "^perf_event_attr configuration" test.out
+ grep "Starting stack profile collection systemwide" test.out
