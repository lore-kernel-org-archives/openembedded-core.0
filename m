Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.6493.1601503974931737840
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2020 15:12:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=EcYHIlX1;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id e18so2123612pgd.4
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2020 15:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=GinehB622PuIybEIzo2bL7wmTAuP12JC3WUjK+mZwOs=;
        b=EcYHIlX1VVJQkM7n9ymIUeJbywk96dSAXxfD4O7lOkyuDFA1e0SHGK8rbxa03Pk/f4
         OGFIXTCmWA5v+7V7aMhOPBalwKjQo5mg8olM/j52L6JcNEQuJci0OgXhBn1Tw4cpzYRR
         SmK0Xv8iL2ZnQGN9e8OZkdm2B9e698YghMh5msZfsp9L882EDkvMylpsm0KGDHWe4Kbz
         BMzyprH9Ic2xkvl5TuLl1UAST8MkburGDoOkenUjhNKHw7cgNmi04rnQQJ6Z9Kcbcl1v
         tFyvZy7xeNzAA2xZlElYKojPdZJr0WZxnTOLJDixp50Cj3fk54+M+QNlPDTqnrMPhsEO
         mXyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=GinehB622PuIybEIzo2bL7wmTAuP12JC3WUjK+mZwOs=;
        b=tAsmxwRON0Cqzsj5hvKRs3MYY5OUmmG92sN4FYYeJK5DstnMSmnxIk2HpRny/bPaYt
         +thm/kKTGYF64KmNimUwf1TAEoOXPGlRTdR7wmxq/QgWvMHSKVI8pwNslpt1KypWcUtg
         Cfj18kJqmVWlbk60JMiS6Tbzaww4HhhCLFQCnMncQdQIZNWihxwwXUbiG90SrWColCOG
         qzQFqm+as6QvouKbdcRUh7Woz3XtSUH7HIK7JfYz49w5OmndasPi2fMve174dM0dkPKU
         Xbf744mgefidSx2jKCwvGnqobg/u2X83D2q8zxKHkQFqCOCulWUgyw7BMNynSx9uBfUX
         FS7w==
X-Gm-Message-State: AOAM530PdXn0K+AJjHV74RVMqFORZAuGU07A3icw+lw7tbJGOHu4FPG+
	KABVkXFVb8ETcezvMctWyvux+zj1EXJn/e2EPXY=
X-Google-Smtp-Source: ABdhPJyyg5EXr0Fx1P5M/SUhXuY02sfsLObzuqmMHieKUuE1murDqODVwiPQNccZ559qxAxebk8Nrw==
X-Received: by 2002:a63:a546:: with SMTP id r6mr3665688pgu.160.1601503974030;
        Wed, 30 Sep 2020 15:12:54 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id k6sm3488799pfh.92.2020.09.30.15.12.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 15:12:53 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 21/41] meta: add/fix invalid Upstream-Status tags
Date: Wed, 30 Sep 2020 12:11:23 -1000
Message-Id: <4dbae5c7c28a2cd6ebb601f984a54ca33d19afaf.1601502610.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1601502610.git.steve@sakoman.com>
References: <cover.1601502610.git.steve@sakoman.com>

From: Ross Burton <ross@burtonini.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 630ce8130598e2bca7231ac28a7cc18b5b942544)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...1-setup.py-pass-missing-libraries-to-Extension-for-mul.patch | 2 +-
 .../qemu/qemu/0001-qemu-Do-not-include-file-if-not-exists.patch | 2 +-
 .../ltp/ltp/0004-guard-mallocopt-with-__GLIBC__.patch           | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/python/python3/0001-setup.py-pass-missing-libraries-to-Extension-for-mul.patch b/meta/recipes-devtools/python/python3/0001-setup.py-pass-missing-libraries-to-Extension-for-mul.patch
index d38ed61dd7..ea0af02e72 100644
--- a/meta/recipes-devtools/python/python3/0001-setup.py-pass-missing-libraries-to-Extension-for-mul.patch
+++ b/meta/recipes-devtools/python/python3/0001-setup.py-pass-missing-libraries-to-Extension-for-mul.patch
@@ -46,7 +46,7 @@ ValueError: semaphore or lock released too many times
 
 And the semaphore issue also caused multiprocessing.Queue().put() hung.
 
-Upstream-Status: Pensing
+Upstream-Status: Pending
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
diff --git a/meta/recipes-devtools/qemu/qemu/0001-qemu-Do-not-include-file-if-not-exists.patch b/meta/recipes-devtools/qemu/qemu/0001-qemu-Do-not-include-file-if-not-exists.patch
index eccac0509c..22f97c696e 100644
--- a/meta/recipes-devtools/qemu/qemu/0001-qemu-Do-not-include-file-if-not-exists.patch
+++ b/meta/recipes-devtools/qemu/qemu/0001-qemu-Do-not-include-file-if-not-exists.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] qemu: Do not include file if not exists
 Script configure checks for if_alg.h and check failed but
 if_alg.h still included.
 
-Upstream-status: Submitted [https://lists.gnu.org/archive/html/qemu-devel/2020-03/msg07188.html]
+Upstream-Status: Submitted [https://lists.gnu.org/archive/html/qemu-devel/2020-03/msg07188.html]
 Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
 ---
  linux-user/syscall.c | 2 ++
diff --git a/meta/recipes-extended/ltp/ltp/0004-guard-mallocopt-with-__GLIBC__.patch b/meta/recipes-extended/ltp/ltp/0004-guard-mallocopt-with-__GLIBC__.patch
index 5622a64d43..d77990e0e2 100644
--- a/meta/recipes-extended/ltp/ltp/0004-guard-mallocopt-with-__GLIBC__.patch
+++ b/meta/recipes-extended/ltp/ltp/0004-guard-mallocopt-with-__GLIBC__.patch
@@ -5,7 +5,7 @@ Subject: [PATCH] guard mallocopt() with __GLIBC__
 
 mallocopt is not available on non glibc implementations
 
-Upstream-Status: Pending
+Upstream-Status: Accepted [967612c454aea66770b64f69287671037fe895b3]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
-- 
2.17.1

