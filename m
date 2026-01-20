Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBD8FD2ECF9
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 07:46:32 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1772.1768894968865838608
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jan 2026 23:42:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kAakdqgC;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: careers.myinfo@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-8c537a42b53so787229585a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 23:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768894967; x=1769499767; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TjrSJkFcgYLuyHRA4LrY2nqgW++lIkmXJ/7+jigF1P4=;
        b=kAakdqgCBMc3izqqsxuUiVSqNpPfFtRF6QA1+CtCZztD96K9eqpomFv+wDELuNpyYL
         wsyyu4SCvXV1RGkTkWb2egDGVKFoCLaOBM7Kyn5AJcJVrErWbGFIq92JDT1gyY6ascJg
         uOrFiESA+iZeqzxxLQrWxsmEDGT9W8ZaqNOjkoXsiCR3mMpXf90NnN9gcL9aVuK0c+0C
         Cqq7N+gZFSlSpncEfxe+cpzsLCZKtp6UPk8RL41RRI5uOAnCB3Awm79Rz+3hbpVndlVA
         4RaM2FQgAtSPFN2WGPOpKjpSDr4Ve5yVZjGMBqiUhENXwiotBLs4zBFjPk1riYMcVTMP
         xp0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768894967; x=1769499767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TjrSJkFcgYLuyHRA4LrY2nqgW++lIkmXJ/7+jigF1P4=;
        b=B6ZwGe7ks85VXLcdCdELdAP8gfs9PqJJ7SXYGyzUIvqAzo0HoXEuWbwgOh/vOvzk88
         Knf0abehEcu26X1bqoLUI9oNAezZdKOPdvKNfLePEZx1VwuhwFRSvgQnj+TNdrFxfvC7
         UW6RcjKu9edhTg8AqVWxdN8fuw7bwYDZWIVGVJAf5v7iZAFDx7UfUyylkU5h+DVSNJWn
         +wYi3KjI8LR6JDmtIxpeegsHclJG9yF3s/+M/qEBKJBcbMkJr3Mjs9jsGgSdw4E9ZCEU
         u749c3fNlH+hlqdIvp8ay+wc3JaHzTaK4r5wPzBTSenn0INbevHzPFJ/TTB0Gl32WF+N
         ib0g==
X-Gm-Message-State: AOJu0YxZXD/O9mSQeKxDu/TVI4pHWwtsX1t+4Bl8orlCnCGk6RCK3/9n
	q9rfrPnOm2NsuflB5SXNArpKm8C3raHnDdKccXmbIKr36KBe2Gs5vcLYfymKRQ==
X-Gm-Gg: AY/fxX6WI6cg5u/zek/5K3MKjBq88BcqISTVZg6wxUOab75o2t5XEdhi1QdGn8hv7ks
	7y2yF7dWo4naatwYRsP/jfLqkaF7tnmMYlZJ1GgEvfh9KFgl1zrnp93bQnVa5AdFYfAMmXDqnyw
	7DIweCOaTWPFSiFez2n8NNp0rJpeV0Z415RCRIEtWhWnMatn2DL+L2ePw90sSQ1/4ODZEPAI2kJ
	X6tz/NTxj2eNXxo+4svjHk063hYkGyCh1XxcOMh+RhUUZ5fsUgQsjy4yZpu5jYUjmszWLUWE6zu
	ENsLyM9p9S2LOHHTHSBJBGfir+yKiMAj9LqGmgVAQCeyHHK1s6ZQINTw4vfzKn+pTTlfM87EN32
	b7t6q0xI1gAmsM4fPJPtiaIHesL0IFROR+MiBZFBc6z6e75kPbkSgW1TFjw0o5ezEuYm3/Hsfpy
	QnN5828m0jSQ==
X-Received: by 2002:a05:6a00:13a4:b0:81f:3cd5:2066 with SMTP id d2e1a72fcca58-81fa178148amr10804543b3a.12.1768894638924;
        Mon, 19 Jan 2026 23:37:18 -0800 (PST)
Received: from L-15597L.kpit.com ([36.255.86.176])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa12b51d9sm11120070b3a.65.2026.01.19.23.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 23:37:18 -0800 (PST)
From: Shaik Moin <careers.myinfo@gmail.com>
X-Google-Original-From: Shaik Moin <moins@kpit.com>
To: openembedded-core@lists.openembedded.org
Cc: careers.myinfo@gmail.com
Subject: [OE-core][scarthgap][PATCH 2/2] libpcre2: fix RunGrepTest Failure on Busybox systems
Date: Tue, 20 Jan 2026 13:06:32 +0530
Message-Id: <20260120073632.508451-2-moins@kpit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260120073632.508451-1-moins@kpit.com>
References: <20260120073632.508451-1-moins@kpit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 07:46:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229647

The PCRE2 RunGrepTest script uses the Gnu Coreutils form:
head -1

Busybox does not support this shorthand option and reports:
head: invalid option --'1'

which cause the grep tests fail when running ptest on yocto.
Replace head -1 with head -n 1 . This makes RunGrepTest work
correctly.

Signed-off-by: Shaik Moin <moins@kpit.com>
---
 .../0001-test-Fix-head-1-Busybox.patch        | 38 +++++++++++++++++++
 .../recipes-support/libpcre/libpcre2_10.43.bb |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-support/libpcre/libpcre2/0001-test-Fix-head-1-Busybox.patch

diff --git a/meta/recipes-support/libpcre/libpcre2/0001-test-Fix-head-1-Busybox.patch b/meta/recipes-support/libpcre/libpcre2/0001-test-Fix-head-1-Busybox.patch
new file mode 100644
index 0000000000..abfc995cee
--- /dev/null
+++ b/meta/recipes-support/libpcre/libpcre2/0001-test-Fix-head-1-Busybox.patch
@@ -0,0 +1,38 @@
+From 1b2c3d4e5f6a7b8c9d0 Mon Sep 17 00:00:00 2001
+From: Shaik Moin <moins@kpit.com>
+Date: Tue, 18 Nov 2025 10:30:00 +0530
+Subject: [PATCH] tests: Fix head options for BusyBox compatibility
+
+BusyBox does not accept the GNU coreutils shorthand forms:
+  head -1
+ 
+It requires:
+  head -n 1
+ 
+This causes RunGrepTest test data to fail on
+Yocto-based systems that use BusyBox.
+ 
+Replace all occurrences of `head -1` â†’ `head -n 1`
+ 
+This aligns the scripts with POSIX syntax and fixes failing
+grep tests in RunGrepTest (including testtrygrep).
+ 
+Upstream-Status: Inappropriate [oe-specific]
+Signed-off-by: Shaik Moin <moins@kpit.com>
+---
+ 
+diff --git a/RunGrepTest b/RunGrepTest
+index 1c7bbd2..ab4f310 100755
+--- a/RunGrepTest
++++ b/RunGrepTest
+@@ -728,7 +728,7 @@ echo "---------------------------- Test
+ echo "RC=$?" >>testtrygrep
+
+ echo "---------------------------- Test 132 -----------------------------" >>testtrygrep
+-(cd $srcdir; exec 3<testdata/grepinput; $valgrind $vjs $pcre2grep -m1 -A3 '^match' <&3; echo '---'; head -1 <&3; exec 3<&-) >>testtrygrep 2>&1
++(cd $srcdir; exec 3<testdata/grepinput; $valgrind $vjs $pcre2grep -m1 -A3 '^match' <&3; echo '---'; head -n 1 <&3; exec 3<&-) >>testtrygrep 2>&1
+ echo "RC=$?" >>testtrygrep
+
+ echo "---------------------------- Test 133 -----------------------------" >>testtrygrep
+-- 
+2.34.1
diff --git a/meta/recipes-support/libpcre/libpcre2_10.43.bb b/meta/recipes-support/libpcre/libpcre2_10.43.bb
index 57c4f0d0e7..f250f35584 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.43.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.43.bb
@@ -12,6 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=321a5eb46acae6b6c1ff2c7a866d836a"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/pcre2-${PV}/pcre2-${PV}.tar.bz2 \
            file://run-ptest \
+           file://0001-test-Fix-head-1-Busybox.patch \
 "
 
 GITHUB_BASE_URI = "https://github.com/PCRE2Project/pcre2/releases"
-- 
2.34.1


