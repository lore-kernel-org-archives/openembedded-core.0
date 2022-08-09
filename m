Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EDA6C19F2D
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 21:28:06 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web11.415.1660080484790885598
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Aug 2022 14:28:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=T7Uydfhi;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.170,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f170.google.com with SMTP id h132so12518259pgc.10
        for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Aug 2022 14:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=B4/b/2GbiUPld4dJNl4AY747q4XLOU34akujaX7rQU8=;
        b=T7Uydfhi8kXKb+Mlq7ixTBxJpdc9mQXoqm8ve6bDeHfeAn2EAZLOhw/J1WTwR2bW1N
         nBUVO7R7I3GifoRkapx+yynPFisPe4LqMdldb67Wke066ek1wrDhcM1AbIuZzPDVynuv
         7h3feoTyTcj7jDDukkaQ3CBS9+eCrUFYtlQyQabIWWAArucap5ZKDnm95wOYu9xj7/Cy
         VjTio4iGHRSY3XVTKpK0UjOWopwy4hgjsu+CqixXd5OltkKSC6PthcH3e3kLDCavrvU9
         BjBwHj89j9VRLWFZzSWFqLhyijsvUQPB8MS3no7sGcisARWNP1NyuQseeuNfBUaKqvbN
         Zskg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B4/b/2GbiUPld4dJNl4AY747q4XLOU34akujaX7rQU8=;
        b=sO7++1HRZ0jIAIfxPHaSWJ3J7hlRnRNNFYbNmcYwokercy71Osow1i+KcoUSTTZGmZ
         43UcWTY5garQH3REQ5yuUwYYfbnHl85AZui3Ue6+VdpoRLqofvJk44O10kA67esuyg61
         iHgRIkMh7U5T/+FuagcP1C/ghk48sF8Hkkw7+CEiruNmIhLFKUKRuLcnswYLSfouHOs2
         obaZB+YI2U/ok77ECAuRd9NS+Mgsktjx2m/QuRuD3HisDPEcbvGPTzXnICoI6at12pdW
         iqD/T+SHoPtLwQL2qaswF8oQGjPaYpqJOHekgFi0641jYQcv+kNdAo+/j3Tl2onBD2wn
         rILw==
X-Gm-Message-State: ACgBeo1IpNo8df1f5ovwQaG8A/I/U5sspezOAwvn7fEZRJcw0q9uYmie
	TKksFp0vK3Pwiu7WVWWqkI2UQq4ELhgo7MH6
X-Google-Smtp-Source: 
 AA6agR46NIlBB1d5qpEzCfH5q5k8nuZdqpnR7hkDT/YhepPB1ETdQVoSYlrH0oP87EHylc2fYhhS4w==
X-Received: by 2002:a62:7bd6:0:b0:52d:4773:a3de with SMTP id
 w205-20020a627bd6000000b0052d4773a3demr24407385pfc.70.1660080483661;
        Tue, 09 Aug 2022 14:28:03 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 g12-20020a17090a4b0c00b001f4d711e165sm62273pjh.11.2022.08.09.14.28.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 14:28:03 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 1/8] glibc : stable 2.35 branch updates
Date: Tue,  9 Aug 2022 11:27:35 -1000
Message-Id: 
 <ec5de254e40d188cd0cce75568851b0c130533e6.1660080350.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1660080350.git.steve@sakoman.com>
References: <cover.1660080350.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Aug 2022 21:28:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169164

From: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>

Below commits on glibc-2.35 development branch are updated.

glibc:
0e5b239f45 malloc: Simplify implementation of __malloc_assert
dc2d843045 Update syscall-names.list for Linux 5.18
d56c7e0965 Apply asm redirections in stdio.h before first use [BZ #27087]
c4050b2552 x86: Add missing IS_IN (libc) check to strncmp-sse4_2.S
fdf699edea x86: Move mem{p}{mov|cpy}_{chk_}erms to its own file
de6f7bb873 x86: Move and slightly improve memset_erms
210e9728ff x86: Add definition for __wmemset_chk AVX2 RTM in ifunc impl list
c77cde8172 x86: Put wcs{n}len-sse4.1 in the sse4.1 text section
3eb17048c4 x86: Align entry for memrchr to 64-bytes.
dd3b6857ee x86: Add BMI1/BMI2 checks for ISA_V3 check
ce32ad91eb x86: Cleanup bounds checking in large memcpy case
863987a6ef x86: Add bounds `x86_non_temporal_threshold`
232b7adb14 x86: Add sse42 implementation to strcmp's ifunc
7f7a728b71 x86: Fix misordered logic for setting `rep_movsb_stop_threshold`
6b4a2ab7e0 x86: Align varshift table to 32-bytes
e74385736c x86: ZERO_UPPER_VEC_REGISTERS_RETURN_XTEST expect no transactions
b4744d4414 x86: Shrink code size of memchr-evex.S
5321a217cf x86: Shrink code size of memchr-avx2.S
c536b318f0 x86: Optimize memrchr-avx2.S
f8ba0e0452 x86: Optimize memrchr-evex.S
7001d558a0 x86: Optimize memrchr-sse2.S
54486f520a x86: Add COND_VZEROUPPER that can replace vzeroupper if no `ret`
82560fe43e x86: Create header for VEC classes in x86 strings library
b1f23b6128 x86_64: Add strstr function with 512-bit EVEX
f9f0fbbf7b x86-64: Ignore r_addend for R_X86_64_GLOB_DAT/R_X86_64_JUMP_SLOT
650bf51c78 x86_64: Implement evex512 version of strlen, strnlen, wcslen and wcsnlen
e0cb101d1b x86_64: Remove bzero optimization
51e2d3b53b nptl: Fix ___pthread_unregister_cancel_restore asynchronous restore
cd4f43be3d linux: Fix mq_timereceive check for 32 bit fallback code (BZ 29304)

Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7d70ccb320459faf356b51d38e62c5dc3955393b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 99017ce1d4..ccb41e5af6 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.35/master"
 PV = "2.35"
-SRCREV_glibc ?= "b6aade18a7e5719c942aa2da6cf3157aca993fa4"
+SRCREV_glibc ?= "0e5b239f45992e4b54c6f946ecb0c410afc8bb08"
 SRCREV_localedef ?= "794da69788cbf9bf57b59a852f9f11307663fa87"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
-- 
2.25.1


