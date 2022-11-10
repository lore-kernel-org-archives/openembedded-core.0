Return-Path: <sundeep.kokkonda@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9374FC433FE
	for <webhook@archiver.kernel.org>; Thu, 10 Nov 2022 03:09:37 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web12.2647.1668049775176909203
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Nov 2022 19:09:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RXfLZxez;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: sundeep.kokkonda@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id k22so643195pfd.3
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Nov 2022 19:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yg9DhGR0TvdD5xFdXLaCQgxmM6YIqDBEwYYTOVW+Qz4=;
        b=RXfLZxezrwwVcDF6mXas4lY5F1qInMnYaNR05igvRyRFkJj4uEdAIjdLANbZ/qHk03
         rruGyMNIpRmSypK+4RTpiAW37IRHAv7ma2gHE7aab1vQPfR8vuRnluT5tY1Uf1C2szJ2
         ITSQmQa8YMCb3UdX1Qjv3W7C33+ViDCkgiol8Omwy1SKzE4LRPNMfJZv3I/TDqiGzeEH
         nFRC9GXE0SCEqxdMlOTHk1qhM6Ak+BqcMqfPBxoXvoP8CDJAA5b4Dv2xL2NOd0t0cjpm
         Cuue6FlVgb7gyB2zXxohBg661MUPn8pkHK4PJ4Wnql34La99FriYDLX68J0aLah4k3pQ
         +r8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yg9DhGR0TvdD5xFdXLaCQgxmM6YIqDBEwYYTOVW+Qz4=;
        b=l0421Y2QPlp5FXJ4CmR/LA2ctd+yowCQU+X2rpsbcbHiS9p61AQj2IKnJkze4We4QU
         85p1fazgJsXmaippxqlGrZ8wyx077A2Ipx0J1CbwciOZb2fz+u/Dzn/PyQKfWKOVG0b3
         eqtqaL6Yq8BOfTEeEHp3wv7kDhHXsd/wsvzHNsPnTgRQFQI0J2WXbvJYgYjLk6YQYuZq
         siN8zwyaQNn81CD1kHyfolJ7Ak3jg5FEistGhyTfeMRJBokxAKE8/Fs79aPHSzGLove3
         W02Cq6Izv4KT7LfIBKC669SJy3jY/yPgheFfTIv3pKXh+4p1vq8O46uhvnitR+0108dS
         MeAQ==
X-Gm-Message-State: ACrzQf2Q4v8sP7whiznva0kuEnIEFvulcucvwpfSVOM5DgDe9VGMhKD0
	FYZsMn6FtBGevjRF/o3/85yxu33q7/ZmWw==
X-Google-Smtp-Source: AMsMyM6gR0pcpvZxGd/G7kg2SZb+7JFs9FEmLm6OaDqD4eE9SgnyMP6I/jIVm9BMs7KjHBXd+PP8VQ==
X-Received: by 2002:a63:ec4c:0:b0:434:aa27:d8e8 with SMTP id r12-20020a63ec4c000000b00434aa27d8e8mr1660318pgj.275.1668049774213;
        Wed, 09 Nov 2022 19:09:34 -0800 (PST)
Received: from localhost.localdomain ([49.204.85.206])
        by smtp.gmail.com with ESMTPSA id n63-20020a17090a5ac500b00200461cfa99sm1940964pji.11.2022.11.09.19.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 19:09:33 -0800 (PST)
From: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	pgowda.cve@gmail.com,
	shivams@gmail.com,
	Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
Subject: [dunfell] glibc : stable 2.31 branch updates.
Date: Thu, 10 Nov 2022 08:39:13 +0530
Message-Id: <20221110030913.1054846-1-sundeep.kokkonda@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 03:09:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173065

Below commits on glibc-2.31 stable branch are updated.
d4b7559457 x86-64: Require BMI2 for avx2 functions [BZ #29611]
b8bb48a18d x86-64: Require BMI2 for strchr-avx2.S [BZ #29611]
c8f2a3e803 Add test for bug 29530
e6ae5b25cd Fix memmove call in vfprintf-internal.c:group_number
1dbe841a67 Remove most vfprintf width/precision-dependent allocations (bug 14231, bug 26211).
5a802723db stdio: Add tests for printf multibyte convertion leak [BZ#25691]
ae7748e67f stdio: Remove memory leak from multibyte convertion [BZ#25691]
174d0b61c7 Linux: Require properly configured /dev/pts for PTYs
0a167374fd Linux: Detect user namespace support in io/tst-getcwd-smallbuff
4ad1659d8c getcwd: Set errno to ERANGE for size == 1 (CVE-2021-3999)
3319cea99e support: Add helpers to create paths longer than PATH_MAX
f733e291bb support: Fix xclone build failures on ia64 and hppa
43757c70ee support: Add xclone
29d3aeb0e8 Add xchdir to libsupport.
2d7720f316 support: Add create_temp_file_in_dir
183709983d NEWS: Add a bug fix entry for BZ #28896
d385079bd5 x86: Fix TEST_NAME to make it a string in tst-strncmp-rtm.c
7df3ad6560 x86: Test wcscmp RTM in the wcsncmp overflow case [BZ #28896]
fc133fcf49 x86: Fallback {str|wcs}cmp RTM in the ncmp overflow case [BZ #28896]
775c05b28c string: Add a testcase for wcsncmp with SIZE_MAX [BZ #28755]
c6b346ec55 x86-64: Test strlen and wcslen with 0 in the RSI register [BZ #28064]
0675185923 x86: Remove wcsnlen-sse4_1 from wcslen ifunc-impl-list [BZ #28064]
5db3239baf x86: Black list more Intel CPUs for TSX [BZ #27398]
5b99f172b8 x86: Check RTM_ALWAYS_ABORT for RTM [BZ #28033]
70d293a158 NEWS: Add a bug fix entry for BZ #27974
a2be2c0f5d String: Add overflow tests for strnlen, memchr, and strncat [BZ #27974]
489006c3c5 x86: Optimize strlen-evex.S
937f2c783a x86: Fix overflow bug in wcsnlen-sse4_1 and wcsnlen-avx2 [BZ #27974]
0058c73d11 x86-64: Add wcslen optimize for sse4.1
665d0252f1 x86-64: Move strlen.S to multiarch/strlen-vec.S
82ff13e2cc x86-64: Fix an unknown vector operation in memchr-evex.S
539b593a1d x86: Optimize memchr-evex.S
7b37ae60c6 x86: Optimize strlen-avx2.S
0381c1c10d x86: Fix overflow bug with wmemchr-sse2 and wmemchr-avx2 [BZ #27974]
10368cb76b x86: Optimize memchr-avx2.S
66ca40582e test-strnlen.c: Check that strnlen won't go beyond the maximum length
927bcaf892 test-strnlen.c: Initialize wchar_t string with wmemset [BZ #27655]
0d4159c36c x86-64: Require BMI2 for __strlen_evex and __strnlen_evex
c0cbb9345e NEWS: Add a bug fix entry for BZ #27457
e81b975fcc x86-64: Fix ifdef indentation in strlen-evex.S
aa4e48e73c x86-64: Use ZMM16-ZMM31 in AVX512 memmove family functions
ac911d3b57 x86-64: Use ZMM16-ZMM31 in AVX512 memset family functions
20d37de533 x86: Add string/memory function tests in RTM region
fbaa99ed41 x86-64: Add AVX optimized string/memory functions for RTM
096e14f632 x86-64: Add memcmp family functions with 256-bit EVEX
f00fad4e4c x86-64: Add memset family functions with 256-bit EVEX
cf239ddd2e x86-64: Add memmove family functions with 256-bit EVEX
7257ba7bf2 x86-64: Add strcpy family functions with 256-bit EVEX
db9071c0f6 x86-64: Add ifunc-avx2.h functions with 256-bit EVEX
2d612b2c5f x86: Set Prefer_No_VZEROUPPER and add Prefer_AVX2_STRCMP
5b13651085 NEWS: Add a bug fix entry for BZ #28755
5ee8a436ab x86: Fix __wcsncmp_avx2 in strcmp-avx2.S [BZ# 28755]

Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
---
 meta/recipes-core/glibc/glibc-version.inc     |  2 +-
 .../glibc/glibc/CVE-2021-33574_1.patch        | 26 ++++++++-----------
 2 files changed, 12 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 68efd09ece..5414297ba1 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.31/master"
 PV = "2.31+git${SRCPV}"
-SRCREV_glibc ?= "3ef8be9b89ef98300951741f381eb79126ac029f"
+SRCREV_glibc ?= "d4b75594574ab8a9c2c41209cd8c62aac76b5a04"
 SRCREV_localedef ?= "cd9f958c4c94a638fa7b2b4e21627364f1a1a655"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
diff --git a/meta/recipes-core/glibc/glibc/CVE-2021-33574_1.patch b/meta/recipes-core/glibc/glibc/CVE-2021-33574_1.patch
index cef0ce54ed..7561e87121 100644
--- a/meta/recipes-core/glibc/glibc/CVE-2021-33574_1.patch
+++ b/meta/recipes-core/glibc/glibc/CVE-2021-33574_1.patch
@@ -11,14 +11,10 @@ CVE: CVE-2021-33574 patch#1
 Signed-off-by: Armin Kuster <akuster@mvista.com>
 
 ---
- NEWS                                |  4 ++++
- sysdeps/unix/sysv/linux/mq_notify.c | 15 ++++++++++-----
- 2 files changed, 14 insertions(+), 5 deletions(-)
-
-Index: git/NEWS
-===================================================================
---- git.orig/NEWS
-+++ git/NEWS
+diff --git a/NEWS b/NEWS
+index 8a20d3c4e3..be489243ac 100644
+--- a/NEWS
++++ b/NEWS
 @@ -7,6 +7,10 @@ using `glibc' in the "product" field.
  
  Version 2.31.1
@@ -28,12 +24,12 @@ Index: git/NEWS
 +  attribute with a non-default affinity mask.
 +
  The following bugs are resolved with this release:
+   [14231] stdio-common tests memory requirements
    [19519] iconv(1) with -c option hangs on illegal multi-byte sequences
-     (CVE-2016-10228)
-Index: git/sysdeps/unix/sysv/linux/mq_notify.c
-===================================================================
---- git.orig/sysdeps/unix/sysv/linux/mq_notify.c
-+++ git/sysdeps/unix/sysv/linux/mq_notify.c
+diff --git a/sysdeps/unix/sysv/linux/mq_notify.c b/sysdeps/unix/sysv/linux/mq_notify.c
+index f288bac477..dd47f0b777 100644
+--- a/sysdeps/unix/sysv/linux/mq_notify.c
++++ b/sysdeps/unix/sysv/linux/mq_notify.c
 @@ -135,8 +135,11 @@ helper_thread (void *arg)
  	    (void) __pthread_barrier_wait (&notify_barrier);
  	}
@@ -48,7 +44,7 @@ Index: git/sysdeps/unix/sysv/linux/mq_notify.c
      }
    return NULL;
  }
-@@ -257,8 +260,7 @@ mq_notify (mqd_t mqdes, const struct sig
+@@ -257,8 +260,7 @@ mq_notify (mqd_t mqdes, const struct sigevent *notification)
        if (data.attr == NULL)
  	return -1;
  
@@ -58,7 +54,7 @@ Index: git/sysdeps/unix/sysv/linux/mq_notify.c
      }
  
    /* Construct the new request.  */
-@@ -272,7 +274,10 @@ mq_notify (mqd_t mqdes, const struct sig
+@@ -272,7 +274,10 @@ mq_notify (mqd_t mqdes, const struct sigevent *notification)
  
    /* If it failed, free the allocated memory.  */
    if (__glibc_unlikely (retval != 0))
-- 
2.25.1


