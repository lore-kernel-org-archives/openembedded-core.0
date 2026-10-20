Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4731.1792538576453277124
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 16:22:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20251104.gappssmtp.com header.s=20251104 header.b=0ly/EPu+;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48dc202a60eso49146f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 16:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20251104.gappssmtp.com; s=20251104; t=1792538574; x=1793143374; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=S/n3F9sX0ygnVK6Nll3SWRtJ9EH2eCLVPl93dFAOOTM=;
        b=0ly/EPu+1VQJRji7nnmCvNmgQvgmjLUNcFHMs364o+aipzhG2h8iJXJt92Q2/8G0+6
         gxi5Sf+rGCPC9ip377diYEbWuR+csPn0p3xuYg9DPMUKMSZbkXvRGwuWP+CkIW4ncbBf
         zS1w1i8PiDr+KT8DNDiYL6Uif9EYRGjeKEwQ0SurvSfv62uVBmeFsu6hl/AHGE27i4h2
         Pv4Oki1ZzcfLrt7CFBzCFTQiwoGm5D5RQdO8F9Sfo2YI1jow9Jeoht8LqJgNgECZw1Bm
         CUnHZNH6bNqbZSYriicrofOqv/PJ9JhMwZ6x8loNNIuzMBhBwRiAtbsiNsG0xiKf51mM
         Xi2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792538574; x=1793143374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=S/n3F9sX0ygnVK6Nll3SWRtJ9EH2eCLVPl93dFAOOTM=;
        b=L5NlzIJxvLf8lNoPDwN/4kKSuSuEgbHSx1p//Q14dlemjjjoGE6KSDOROLvDRHp23G
         m7CphNebf/n52jMr6ZB6Z2chfy0GjiDw77YgVCvOAKHm5ZCtVY7zyl1++9NApFymB2s4
         muMjQpq9NZ7EcYYQ1GYIl8ODBVCqNwJFRz+1rCossMzl2EzO1HhCZ6j3OsyNJbiW+cVh
         KgmYiGgERZ7pgT25J9Q2uYkvQvXzYNqOuZiePb3QyJmbJ3Oj+ZxRikM5selAf73+tTDR
         Ulx4cPe89j2pU36H35cVPag9//wGZ1r7oZaEju9GX1n/s1GIZZ19fzZXYMhlYx5YMTXw
         L9nw==
X-Gm-Message-State: AFq9FYK8tlkdblfzt2REaQ5lGGU+so3hNVBkAUlJe98megmssIqntupT
	VuJPKe9JkhKS/1lorNsWDHHXE5Z1y2pHNIFpqDkvEm87WR4CnGJvQjXd+al4g4l7xfVJx7ntf0k
	3LcZZRRw=
X-Gm-Gg: AYBFou3BH7GMvrfXyhhEl1wSDnslRhmHGXjfE0PSQ6mdUI/rSH8ABSd8ROjDK/dFxL1
	7af4VjcUQnN//LcEoDPGWgWmftKZ37DcCWAepZJj0nh1RjxmbE/fBFCwRHav1WvDovFt27LrBo4
	ig8sQJUS+W0H+DVnO2Rqc2FyIFmTc8zt6TQ+ZZEyHf1s8085jPhVf0plEQ1PYU0mBTa5GRnLEH3
	k9pVQZxXZx+MOyi9A4kY+RBmqlxILWWOCW7tkEm7RPYAZ4P4AIMfXSRXxLREEJLiX7PIbW/vbtg
	hz085rG6rO4yA76HPoPmrI3PyoMO1EeBAMJ83+/lDien0WmPPbpIGHKEhqJ8IzYTHwbUdPU/jpD
	sBcZp5qxdjJbaDbuxzvpTJ3BZlX1P5dCJ3y1f1YzUcywGDhh5r4zXqU1MYZgmNuGt97ezPbdjMh
	uGwJokwef9D+A1XJbt9xAS+SibNaEvWBWBpA+tyHCHioHBP9rtx0NPWZNhitXe508W9fBlSQh1z
	IetTnCuW+X1x+30BsO5eVRgaq7oOw0U9IOp10oE/9873ooV1Whvthe2TxnFvtTrS2FUoCSEYQ==
X-Received: by 2002:a05:6000:400f:b0:488:8ad2:e169 with SMTP id ffacd0b85a97d-48e264fbb47mr358866f8f.56.1792538574539;
        Tue, 20 Oct 2026 16:22:54 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2583523asm1436615f8f.37.2026.10.20.16.22.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 16:22:54 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 05/25] expat: patch CVE-2026-102633
Date: Wed, 21 Oct 2026 01:22:15 +0200
Message-ID: <d0164b77536710575cff82e977cd295d6a61ae2b.1792537664.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792537664.git.yoann.congal@smile.fr>
References: <cover.1792537664.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 23:22:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248323
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
