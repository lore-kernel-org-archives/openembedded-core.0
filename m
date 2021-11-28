Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFDBDC433FE
	for <webhook@archiver.kernel.org>; Sun, 28 Nov 2021 21:59:40 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web09.53262.1638136780388024026
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 13:59:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=nORkgjqA;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id m15so13879929pgu.11
        for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 13:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=w8fgUs+IXEbCJuMmVG5zh+89eFDszViBxNkiyJD2ZGo=;
        b=nORkgjqAlMxRpFa3pRXKBXC7UVHTWlkcFOnn3FznWfyEl+MjeJsU7GlE6xVb8Ki3oB
         SEePcqk+aHXZNIrUjkyNA5+ZwNoH8u8eoj2xH7NTtqUqTGWShHitVBafr5Vw6FdAHtST
         eT+Xt2xdCTxO0r+Jy2kJioUOMeWSuD6em+FrrupL8ztsqFOI3sC+QwUrpnKh0vivBE9D
         IbQe7mTs1J5GzZIsz8Vpi0O+QujiOZt8KgKKO6hry+azPD0nK9lp8EBOjf7hJOrbZZF9
         EMfmRRwjMM5X2f5Tm7iwCtMeQjwlKHGPqc3aQZbgfBh1+JSyzegnZtqlfHjm2l4Gg/7X
         tPoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=w8fgUs+IXEbCJuMmVG5zh+89eFDszViBxNkiyJD2ZGo=;
        b=ruZQcQd+RMSUMZ+dVsumzAp8Ca6TKiYDX6zL6qlCPjrbWOfhFvvjOwQk6EhdCJVkua
         WpzfJtFioIDrbs/Qo9TD8hMWMkQiMzQB1Vz9/WL0pQTVz9qeSRrVGi4johJ7DQJ1aEkp
         qPTvWH1x8X2gDv4Yrt2OqKwX2RgnYytU7MdDOtSW0aRGrmsMYrNWnNzkgklRp7SbkhnD
         4+jIbxdtIHr9C3Sf/eeFqn+S2OIFcHI8+A/vcKF0b/xVH5p1dBZ0Kpla5ulk6hya56th
         pvPIt8iN29jnuyUUytCSkz6LLVu771xTyxdjdUSRqbn7ja2GufTFRfVHDVFXVW3Iq4KC
         lbbg==
X-Gm-Message-State: AOAM5327q/Wx+J4U31a79VNPoAiXmPh6nB2ENd/z+BMKGkT3q8BmMI8x
	F71zGUifDH+Sc0CrsWvnDLTvZStZz+JK0r54Vd4=
X-Google-Smtp-Source: 
 ABdhPJy2hI671842oytBVSQKE14MEUul3hJ3Qwbi8JlH1ab+5BZngP7TlTipBx741dqSQ/rzBpaVXA==
X-Received: by 2002:a05:6a00:1412:b0:4a7:ec46:29d1 with SMTP id
 l18-20020a056a00141200b004a7ec4629d1mr28152713pfu.16.1638136779276;
        Sun, 28 Nov 2021 13:59:39 -0800 (PST)
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 y32sm14769050pfa.145.2021.11.28.13.59.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 13:59:38 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 32/42] db: mark all patches as non-upstreamable
Date: Sun, 28 Nov 2021 11:57:44 -1000
Message-Id: 
 <c97d63b0c5dca0badf69f34e1a33012127afc3e9.1638136329.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1638136329.git.steve@sakoman.com>
References: <cover.1638136329.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Nov 2021 21:59:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158914

From: Alexander Kanavin <alex.kanavin@gmail.com>

Since Oracle relicensed bdb, the open source community
is slowly but surely replacing bdb with supported and
open source friendly alternatives.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b30d3a3243ac9ca2fa0f10337373eac96fdb2602)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...001-Fix-libc-compatibility-by-renaming-atomic_init-API.patch | 2 +-
 ...1-atomic-Rename-local-__atomic_compare_exchange-to-avo.patch | 2 +-
 .../db/db/0001-clock-Do-not-define-own-timespec.patch           | 2 +-
 ...1-configure-Add-explicit-tag-options-to-libtool-invoca.patch | 2 +-
 meta/recipes-support/db/db/fix-parallel-build.patch             | 2 +-
 meta/recipes-support/db/db/sequence-type.patch                  | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-support/db/db/0001-Fix-libc-compatibility-by-renaming-atomic_init-API.patch b/meta/recipes-support/db/db/0001-Fix-libc-compatibility-by-renaming-atomic_init-API.patch
index a4ff2ecb0c..c82e7c375f 100644
--- a/meta/recipes-support/db/db/0001-Fix-libc-compatibility-by-renaming-atomic_init-API.patch
+++ b/meta/recipes-support/db/db/0001-Fix-libc-compatibility-by-renaming-atomic_init-API.patch
@@ -7,7 +7,7 @@ db5 does not build because it is redefining a C++11 standard
 library identifier, atomic_init().  Therefore prefix all
 its internal defines with '__db_', to avoid collisions.
 
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [as far as open source community is concerned, upstream is dead]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
diff --git a/meta/recipes-support/db/db/0001-atomic-Rename-local-__atomic_compare_exchange-to-avo.patch b/meta/recipes-support/db/db/0001-atomic-Rename-local-__atomic_compare_exchange-to-avo.patch
index 571708e03e..2374885e77 100644
--- a/meta/recipes-support/db/db/0001-atomic-Rename-local-__atomic_compare_exchange-to-avo.patch
+++ b/meta/recipes-support/db/db/0001-atomic-Rename-local-__atomic_compare_exchange-to-avo.patch
@@ -11,7 +11,7 @@ Fixes
 ../db-5.3.28/src/dbinc/atomic.h:179:19: error: definition of builtin function '__atomic_compare_exchange'
 static inline int __atomic_compare_exchange(
 
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [as far as open source community is concerned, upstream is dead]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
diff --git a/meta/recipes-support/db/db/0001-clock-Do-not-define-own-timespec.patch b/meta/recipes-support/db/db/0001-clock-Do-not-define-own-timespec.patch
index 9d51a44a26..d238b0f063 100644
--- a/meta/recipes-support/db/db/0001-clock-Do-not-define-own-timespec.patch
+++ b/meta/recipes-support/db/db/0001-clock-Do-not-define-own-timespec.patch
@@ -10,7 +10,7 @@ its 12-bytes here and libc has 16-bytes
 
 This can cause problems especially with 64bit time_t
 
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [as far as open source community is concerned, upstream is dead]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  src/dbinc/clock.h | 17 +----------------
diff --git a/meta/recipes-support/db/db/0001-configure-Add-explicit-tag-options-to-libtool-invoca.patch b/meta/recipes-support/db/db/0001-configure-Add-explicit-tag-options-to-libtool-invoca.patch
index cb28db1343..a574cf67b9 100644
--- a/meta/recipes-support/db/db/0001-configure-Add-explicit-tag-options-to-libtool-invoca.patch
+++ b/meta/recipes-support/db/db/0001-configure-Add-explicit-tag-options-to-libtool-invoca.patch
@@ -7,7 +7,7 @@ This helps cross compile when tag inference via heuristics
 fail because CC variable is having -fPIE -pie and libtool
 smartly removes it when building libraries
 
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [as far as open source community is concerned, upstream is dead]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
diff --git a/meta/recipes-support/db/db/fix-parallel-build.patch b/meta/recipes-support/db/db/fix-parallel-build.patch
index 27632e1ddb..42c2407cf2 100644
--- a/meta/recipes-support/db/db/fix-parallel-build.patch
+++ b/meta/recipes-support/db/db/fix-parallel-build.patch
@@ -2,7 +2,7 @@ With higher paralelism it sometimes fails with:
 libtool: link: `util_log.lo' is not a valid libtool object
 make: *** [db_replicate] Error 1
 
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [as far as open source community is concerned, upstream is dead]
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 
diff --git a/meta/recipes-support/db/db/sequence-type.patch b/meta/recipes-support/db/db/sequence-type.patch
index a6fe3d62a0..fc9f7f0113 100644
--- a/meta/recipes-support/db/db/sequence-type.patch
+++ b/meta/recipes-support/db/db/sequence-type.patch
@@ -6,7 +6,7 @@ in stdint.h.
 This then breaks the overly complicated type check but as we know that int64_t
 exists and works, we can just delete that.
 
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [as far as open source community is concerned, upstream is dead]
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 
 --- a/dist/aclocal/sequence.m4~	2013-09-09 16:35:02.000000000 +0100
-- 
2.25.1


