Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3730.1793405750962603153
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 17:15:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=GtpZBSdK;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so7348275e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 17:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793405749; x=1794010549; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=S/n3F9sX0ygnVK6Nll3SWRtJ9EH2eCLVPl93dFAOOTM=;
        b=GtpZBSdKE4afFd8T8AWYDLhGxXoLjcDaZ7OsrSLfvCN59N/yMduaNcIKWt31DoEpXM
         458eSprIlBvAu/f2H/EnhR56lNwFl1zwMkyekJ6pP6ywqcp+Ub9/HAyR5FK3J9HEbcJ7
         iTpVf4eJMDZa3zkWTRbCkbs89JzhlFZ+s/dELpJwR60cDZLB1brIJ1vqCj0Pnps5z5K8
         Edh+w593c5Vw8EkzoE4xdhlg189+rBJiKTRCbMuBIXGh/8txXsiAiFry0V7OcFiA72GK
         hLv7g5BnggYUKWfuGhqvxaNNkEU3I8D//CiOKU4PZn3olM+mX66PIli29Apoc/hX3+8M
         8BUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793405749; x=1794010549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=S/n3F9sX0ygnVK6Nll3SWRtJ9EH2eCLVPl93dFAOOTM=;
        b=bZtBK9w1gVsEErJLbpaFqvJZHPhI1TDmQxk4pdWE2we+nPgqn1zVSRnJwZxI/ApcQX
         +2wkaJ3zxr6XC9PpVpO+h6KvXAr4olsmEAHMPQ78PL5QOku6d3gJRZ+cy4Dd88Sdy/L5
         vp4xz3uBcZJ0CowLFPC/xjN3/tNOCNg6yaBh18L7jbgblH6D1F1CL/TX4w15ihgB55Ge
         YnzoMb1/pKcM23/UcXP/Q6pklOU/1Q/AVnQQGU8EhNtGPnG8WjQNuP6TakBjTLH5m1fz
         VoC2qfvKrQZrOc9HoXaRfar7O3eaCksT9nNwjChvrCLzJ5TAGsq/lmcDIo8xhNxvkDVV
         xJeQ==
X-Gm-Message-State: AFq9FYJsTdj8l8F7U4z53pNwQ8Y31GihAmlZBNLwnlTU2BvbK9Z1CC+C
	XXbzFFARibnknxoeJ7FbxKXLufabblNplrvKg++7+XFrpXLlEd1sLhhFkEOg5vV6vKphxwgZJWX
	llp3vPSg=
X-Gm-Gg: AYBFou1LWvdI//dpMFdW6yvukDgloW/CMX1zoSFvjplL+7y+Ae7/z46RsaJr6U1veBK
	FqkG/M1JUPw4+7zy0bNxatH5hZ4Wkdyrc3Kkyehn29RUXY/9yGBjvM2YXkmi9g6BgnM0zlEtQxh
	hFE3ucNQEP54sPjQVKB9KPwOZNX8eaauugteBAwpmuPNctRLbXXgm7qa+Kzrj+q5Fi3+lviEkPF
	XlCVb3UnjOKR/mhXevLb1jIYDeV12T6z5HT/SV8ml06jA7EuNGhcdTyYimkd6I9xOWPJ6lYlrwy
	Xg3z5k7Dl2xEqxao12hFtUZlRTqX52bw1rXfoP8Q85iozpaWupEHsyLFay0hfNsTJbyelEkkr3g
	huTF71XrzZ+90q/iq2lgXsszshN9hcwJ+y2TZNWWVi2dH9xI1YuHy4s5nHf2hnH4xDnq2HdhqYA
	DrBjkZKGTQxa9U47gWhRmrooJ8cnxdmkmewwb8n3Jrpilmevz3oWu5BNL9evIG7SXcTDOs7Ztmh
	FLOLsjXhtNBoUUJ2gb5sWWA1Y6ivKeH2ax1hUrc/qzYEbW6+2V9fIi3Yki3ROkoYwsBoU2XC9so
	5vO6M0Rcwe3Gjv3rMxbmC6/MMJYkAV4a+7LeykD113RyzgnjJ2CrgrR2VbI/8RIpyz11bCWsU90
	hERKhAvvpoQ1VAepiqw1zaS52TianxQ==
X-Received: by 2002:a05:600c:a4e:b0:4a1:e57b:667c with SMTP id 5b1f17b1804b1-4ac183d1edamr87825695e9.26.1793405749112;
        Fri, 30 Oct 2026 17:15:49 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab61d8b9f4sm130350635e9.12.2026.10.30.17.15.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 17:15:48 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 10/55] expat: patch CVE-2026-102633
Date: Sat, 31 Oct 2026 01:14:31 +0100
Message-ID: <696abeff0f419d8fbbe2ee2f0cef5e2c4a1a36e0.1793405493.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793405493.git.yoann.congal@smile.fr>
References: <cover.1793405493.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2026 00:16:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249085
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

[1] https://security-tracker.debian.org/tracker/CVE-2026-102633

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../expat/expat/CVE-2026-102633.patch         | 68 +++++++++++++++++++
 meta/recipes-core/expat/expat_2.8.3.bb        |  1 +
 2 files changed, 69 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-102633.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-102633.patch b/meta/recipes-core/expat/expat/CVE-2026-102633.patch
new file mode 100644
index 00000000000..17851201267
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-102633.patch
@@ -0,0 +1,68 @@
+From 69edbec09f2cd3e0bd6e0a093b55ea38af902d7d Mon Sep 17 00:00:00 2001
+From: Filippo Tedeschi <filippotedeschi98@gmail.com>
+Date: Thu, 24 Sep 2026 21:14:23 +0200
+Subject: [PATCH] lib|tests: Replace assert with runtime overflow check in
+ expat_realloc
+
+In expat_realloc, the size passed to realloc_fcn is calculated as
+sizeof(size_t) + EXPAT_MALLOC_PADDING + size. Previously, expat_realloc
+relied on an assertion:
+assert(SIZE_MAX - sizeof(size_t) - EXPAT_MALLOC_PADDING >= size);
+under the assumption that preceding accounting checks and parser
+invariants preclude reaching an overflow state in practice.
+
+However, in release builds compiled with NDEBUG, assertions are
+compiled out. Replace the assert with an explicit runtime check:
+if (size > SIZE_MAX - sizeof(size_t) - EXPAT_MALLOC_PADDING) {
+  return NULL;
+}
+immediately preceding the addition, ensuring consistent defensive
+behavior across all build configurations.
+
+Also extend test_alloc_tracker_size_recorded in alloc_tests.c to
+exercise SIZE_MAX and SIZE_MAX / 2 with expat_realloc, verifying
+that the allocation fails and the recorded size remains unchanged.
+
+Signed-off-by: Filippo Tedeschi <filippotedeschi98@gmail.com>
+
+CVE: CVE-2026-102633
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/69edbec09f2cd3e0bd6e0a093b55ea38af902d7d]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/xmlparse.c      | 7 ++++---
+ tests/alloc_tests.c | 4 ++++
+ 2 files changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index dfcfb0c2..67005454 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -1023,9 +1023,10 @@ expat_realloc(XML_Parser parser, void *ptr, size_t size, int sourceLine) {
+     }
+   }
+ 
+-  // NOTE: Integer overflow detection has already been done for us
+-  //       by expat_heap_increase_tolerable(..) above
+-  assert(SIZE_MAX - sizeof(size_t) - EXPAT_MALLOC_PADDING >= size);
++  // Detect and prevent integer overflow
++  if (size > SIZE_MAX - sizeof(size_t) - EXPAT_MALLOC_PADDING) {
++    return NULL;
++  }
+ 
+   // Actually allocate
+   mallocedPtr = parser->m_mem.realloc_fcn(
+diff --git a/tests/alloc_tests.c b/tests/alloc_tests.c
+index 6be0a073..a5cea463 100644
+--- a/tests/alloc_tests.c
++++ b/tests/alloc_tests.c
+@@ -2118,6 +2118,10 @@ START_TEST(test_alloc_tracker_size_recorded) {
+     assert_true(ptr != NULL);
+     assert_true(sizeRecordedFor(ptr) == 10);
+ 
++    assert_true(expat_realloc(parser, ptr, SIZE_MAX, -1) == NULL);
++
++    assert_true(sizeRecordedFor(ptr) == 10); // i.e. unchanged
++
+     assert_true(expat_realloc(parser, ptr, SIZE_MAX / 2, -1) == NULL);
+ 
+     assert_true(sizeRecordedFor(ptr) == 10); // i.e. unchanged
diff --git a/meta/recipes-core/expat/expat_2.8.3.bb b/meta/recipes-core/expat/expat_2.8.3.bb
index 6d08a3fd94b..3a179db62cc 100644
--- a/meta/recipes-core/expat/expat_2.8.3.bb
+++ b/meta/recipes-core/expat/expat_2.8.3.bb
@@ -18,6 +18,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://CVE-2026-76957-02.patch \
            file://CVE-2026-93990-01.patch \
            file://CVE-2026-93990-02.patch \
+           file://CVE-2026-102633.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"
