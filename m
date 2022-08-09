Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B5C5C25B06
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 21:51:01 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.20.1660081857806072903
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Aug 2022 14:50:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=L7fJ7CJA;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id q19so11982051pfg.8
        for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Aug 2022 14:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=B4/b/2GbiUPld4dJNl4AY747q4XLOU34akujaX7rQU8=;
        b=L7fJ7CJArf+DNCjoXmL7WRkN54lnEOJsds8eU/lZLOMXBv28zwa2IlMRycX+f9S6QW
         xDAMcAa90D8756bV3kDv5MbLdG52tAAEGAB9jT8l24Kt+FTCpkv4r7GGUzaiK69I1jZJ
         /jAA+atJQoGhmSg9ceocViNzQHCJRc1jA0OVdjKfhZbDNiMo6hT1Xl4XEPYhef5GGGtW
         JjX15uFalricDrlSp6BzkM4MgGbCQj9mcay5YagdCirWriI5hWDI7mb/UNwbcHtQ/u1t
         0eLhuTf8a1kEiyjD3fOPKyApFDDUxHadCXsrbVtAi7e9QffCceVrEBFtOmIuxk+59d7J
         +RVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B4/b/2GbiUPld4dJNl4AY747q4XLOU34akujaX7rQU8=;
        b=MRPZN6qkZJAiYrVr7QpPAIDFaz2YoO+rGq47vlPCs/Bbzj4pATY+IUy+BsWgYoZwhj
         uYPtv6I6HDZVscHfIInFQcQArLElI0B27l4dlv1gwH6uEJF5Yowe+TXDjbwmWbuokS7O
         vE25yygDVDSVLHvxa5RdPscWRM6MoSBjrz7ErpeP1iK+fgbO2hJsCxjIIX1Ik9kWm3On
         M7+Ctni09RmyhaZR34PlUbmb3NwKOYIleGycqefHhTjRnyWiCZyALHvXj1c9DkWBOUK7
         sKEWad7mRBS823cfc9z4QbHedqoNfrb3YYMrqUMPW4OEByRn+vbiS8xYzIIhpdhgoJ+z
         JrAA==
X-Gm-Message-State: ACgBeo0BFq+i5dKVR4ym/WCw0PXu7fkZquOpA4dFalWa+4sIrREmjVkx
	8hsDkUpS8VqK26l6IkpkDD4Ba/yW09z8mTeL
X-Google-Smtp-Source: 
 AA6agR5bzFW3rgIUPYf4uctSgUTj8VEX/mF84igPAEgUokQRqsB2zld9xBwCmtQrcf4L0XOE6801Eg==
X-Received: by 2002:a63:8a4a:0:b0:41b:d658:ee4b with SMTP id
 y71-20020a638a4a000000b0041bd658ee4bmr20096898pgd.348.1660081856734;
        Tue, 09 Aug 2022 14:50:56 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 u125-20020a626083000000b0052c7ff2ac74sm402219pfb.17.2022.08.09.14.50.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 14:50:56 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 1/9] glibc : stable 2.35 branch updates
Date: Tue,  9 Aug 2022 11:50:31 -1000
Message-Id: 
 <ec5de254e40d188cd0cce75568851b0c130533e6.1660081510.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1660081510.git.steve@sakoman.com>
References: <cover.1660081510.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Aug 2022 21:51:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169173

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


