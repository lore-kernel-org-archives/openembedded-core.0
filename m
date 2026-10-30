Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11505.1793366952955944809
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 06:29:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=nlWGXpGV;
 spf=pass (domain: baylibre.com, ip: 209.85.219.51, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-91c63449320so9045766d6.1
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 06:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793366952; x=1793971752; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uxTr2x53qdjxXR75sd1FfiPlRU7ZWnh4q0YQvusHYFc=;
        b=nlWGXpGV4So5DB4rwyzxC3hQZs/cQCgkpMewjHJ73dfBC+oH5DGvGfuy813MD17606
         oI9qvHqWFz8Or8I6opMObpJ7VonBH7aOvw+nVGi7/KpGOuEpep/6FziYnmwlK2IQVTLX
         pFXlkZ/+8QddRbguTPtPw+V3u6qqHkJthpwj5zLXp+928+QprqiL25M4Y7aAUo9xE1FN
         RKYN3qE3boT0UuTx2NMfx070W79hoqZZZS/UItTb6Yk9nR/p7Tu9YSSCQ8kxbNOl6rWG
         T7H0cgVWMTXHkdgXspAWxvMXEH/vWzyfn3TwVOuogcTCyZqrilkfjzoi4N4cmtB8bRbT
         Qa3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793366952; x=1793971752;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uxTr2x53qdjxXR75sd1FfiPlRU7ZWnh4q0YQvusHYFc=;
        b=XE0+vXr7KBXM1Lx3zqaU2wKcMZ2f71k6PB14fr0bhFvT+t5/Lspt1D399CHFTSn8gI
         6wyUh4UeUzrcWII9FOI/49rc0ewtTohRT19Kw6fRfXbUyHEGI6Zw+yOkS51O5kV86kJt
         aRy15t1eDBd1bdUKeE6PF507NJF98Qg4X8jKAyfPk6Qrqe9UczST4pD15epRMTa5DU5i
         4au1+84tLaJfX3/5n8G4RaErE/wjOwB2SZanLk+jJq8JENdAfy+RFxeYAl18GEyPT7xK
         2rqnD+hTyUgj2V1Yx9emwOpeO8B4OSmySfjesS9b2C9/bDcdDRRwKDh1Hk7xa2md/1/z
         xk3Q==
X-Gm-Message-State: AFq9FYK22f+q07UlGUnVgk5YUxtO4TM/LVGy81QppGFLy5Q8EbNXsCMn
	ilUJ9f3wxNIE5nIIYsp5z2v8WgRHwXtH0iK4ZC2uBiBOhIt0QSVgmmZiWvzIwrecSfS8J1dd+pR
	zQTpq
X-Gm-Gg: AYBFou2HaAnbcYeN5MhvfSFApOb7KLCqy3p3Bj8QPLXs8DeNSZvNxvf6L1zsp10GVr0
	BkXEL2XInWUJ9yFYOdDfyePpNYizXk3EwHID7+ToeVCtlJJfLRL2/Xw00xx5Pz6By89hWVNJpFd
	Kc15jpsGH1n8//b1hxpjHDiEEAj4kon29a3+jtdxtEG/pqrlasWXkKtj/f/Vv9f9OmjDLn3OiAT
	Alq3IM51DoxMPNOnHDexfl0VBRD7Hwew3woE8278r5bgHfg4DMKNP35FvjNgfSPQoKh8IkJO9YM
	ZM01ZwYjwZxGKUDHIF0TgYJ/nBXfJSQqNNSbQiHK0RUDDo9VOTuXB221whqGyUzOQale5fVJfT/
	4dlWpw5QkM3q+Z0OWYIk1oM4C6i/IyN/xel558emqDfDRlQ5Xt+wsZGcS9aqhBy4lq4WkqZpEGf
	Srf/qaEEmlMmczIUbWzzOnOJkyPztEPOaSK6zlvN/07iXfkxkYyu8/2YbIlUPF8PN6saVjILHkE
	BQ5y4Y9cuP0eUmtigNXpjcoNPzxF6Wf9YwP0q+DsJ8XQgz/7DPs5PNyNnlQOGY3qvTpE2/juiQP
	tLhnDlqKTCxO3DguknJu3zUtnqLR8dNdW9qCB6OOnIdZiK5c+/krviBMWnn2LjWpykcBtgGRIXZ
	SweZFUIJADg==
X-Received: by 2002:a05:620a:4686:b0:93e:d051:8f19 with SMTP id af79cd13be357-944217999e9mr350512685a.40.1793366951437;
        Fri, 30 Oct 2026 06:29:11 -0700 (PDT)
Return-Path: <tgamblin@baylibre.com>
Received: from megalith.oryx-coho.ts.net ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94425ac5322sm141264785a.39.2026.10.30.06.29.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 06:29:10 -0700 (PDT)
From: "Trevor Gamblin" <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] python3: skip TimerfdTests class
Date: Fri, 30 Oct 2026 09:29:07 -0400
Message-ID: <20261030132907.2617042-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 14:10:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249043
Content-Type: text/plain; charset="utf-8"

test_timerfd_ns_TFD_TIME() recently failed on riscv64, but 15743 saw
another part of the suite fail for x86-64. There are other tests in the
same TimerfdTests that look prone to load timeouts. Instead of
individually skipping tests and/or for certain architectures, skip the
class, putting the skip below the general list with a new comment.
Remove the original comment for 15743, since it's mentioned in the
TimerfdTests skip note.

New results (x86-64):

|Total duration: 3 min 20 sec
|Total tests: run=48,083 (filtered) skipped=2,507
|Total test files: run=529/538 (filtered) skipped=76 resource_denied=9
|Result: SUCCESS
|DURATION: 202
|END: /usr/lib/python3/ptest
|2026-10-30T13:18
|STOP: ptest-runner
|TOTAL: 1 FAIL: 0
|root@qemux86-64:~#

[YOCTO #16470]

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/recipes-devtools/python/python3_3.14.10.bb | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3_3.14.10.bb b/meta/recipes-devtools/python/python3_3.14.10.bb
index b062b4e7c5..e59a155487 100644
--- a/meta/recipes-devtools/python/python3_3.14.10.bb
+++ b/meta/recipes-devtools/python/python3_3.14.10.bb
@@ -255,7 +255,6 @@ do_install:append:class-nativesdk () {
 # 15120 (test_input_no_stdout_fileno)
 # 15131 (*TestBarrier.test_timeout)
 # 15177 (test_thread_time)
-# 15743 (test.test_os.test_os.TimerfdTests.test_timerfd_TFD_TIMER_ABSTIME)
 # 15885 (test_default_timeout)
 SKIPPED_TESTS = " \
     --ignore *TestBarrier.test_timeout \
@@ -263,7 +262,6 @@ SKIPPED_TESTS = " \
     --ignore ExecutorShutdownTest \
     --ignore ProcessPoolShutdownTest \
     --ignore ThreadPoolShutdownTest \
-    --ignore test.test_os.test_os.TimerfdTests.test_timerfd_TFD_TIMER_ABSTIME \
     --ignore test_active_children \
     --ignore test_default_timeout \
     --ignore test_input_no_stdout_fileno \
@@ -330,6 +328,15 @@ SKIPPED_TESTS += " \
     --ignore test_shutdown_no_wait_max_tasks_gh119592 \
 "
 
+# Intermittent failure under load - these are all timer tests.
+# test_timerfd_TFD_TIMER_ABSTIME was observed failing in Bugzilla YP 15743.
+# test_timerfd_ns_TFS_TIMER_ABSTIME was observed failing in Bugzilla YP 16470.
+# There are actually several other tests in the suite that all look prone to
+# load variability, so skip the whole test class.
+SKIPPED_TESTS:append = " \
+    --ignore TimerfdTests \
+"
+
 # https://github.com/python/cpython/issues/159424
 SKIPPED_TESTS:append:libc-musl = " \
     --ignore test.test_readline.TestHistoryManipulation.test_append_limited_history \
-- 
2.56.0

