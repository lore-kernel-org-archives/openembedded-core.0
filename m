Return-Path: <sundeep.kokkonda@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA880C00144
	for <webhook@archiver.kernel.org>; Thu,  4 Aug 2022 04:11:52 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web12.1061.1659586310723868829
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Aug 2022 21:11:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ic3d8554;
 spf=pass (domain: gmail.com, ip: 209.85.210.169,
 mailfrom: sundeep.kokkonda@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id h28so11940950pfq.11
        for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Aug 2022 21:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=DiOK7TWHpOTi7djsHbbVYaMP+WgWLRXVnvIECqT8hSI=;
        b=ic3d8554z+kKH/teWDaG809itmJQ+NxJAwO8ct+atVrxvByZfRixc6gxgXw57Y3BiW
         tmzOQLubMTVuH3mzawRs6MzS6v0VrMBkwS3IR0Ek6y0oRx6NHuQqBMwo/hqlAQS2zkv2
         omVG7oOLmVaUGERiCQcqXsJwSjLgbhoHpU4EN/AXJ2qYIAxC9HpWvRvF4PFwv2oNgoHN
         Sb89ZIO+W5JILH/oE2+vKoi387wDF55vj7wDKGOC5f7y8DVtYBfNY+lGtmH46/atuTmk
         /9XxzSrah6qEW5lOoZ72tVC+zvJCG6ZmPKIn/8JEWc/cSnvU6ODEF46G9kuLS88e4WDn
         I/9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=DiOK7TWHpOTi7djsHbbVYaMP+WgWLRXVnvIECqT8hSI=;
        b=OjQoO95sjvrCDa0/kfQNMxDmLAsgEuyPiiV+70JMJAa4uANsLPC3qhhocY+bM5zUob
         k0xf233tmzmkJtzvXIp5lyG/Py7ijS7DgV0EnDnIsTt4t/FLHm6zdDdzDfNmSgNuJ6ED
         juJW3Wq9SNqK+qLL3xGDP6fWirgpGKqxIyCsMMnwMvhVKd4+8u2NmP51A+vnz5TISAyG
         4EFh0E5D8bpEGOWHDA2IJydi11dqr7czO2dQhgMyl5beQZU3tjzBX9t6XmuDSQvcSKr6
         9Sr7AUVW11vXgAP8q0n1IQPUcDEkMFNT/sXvZzhhthLlpbS99ciOYFx0CmbQ1I5juhwP
         eGAQ==
X-Gm-Message-State: ACgBeo0ahcW4ZRCZNeRCw2pCeJlEhS99Qjrl8p7zSPBSM2ThlUZVbZcO
	U++/PGXFi4kuZogXMrq9lETQFrITW1TXpIkN
X-Google-Smtp-Source: 
 AA6agR76hGhNbHq1cwHWaP2iyCzpq1A1QSTK9DaU9hEOAwTeWGV5/P/D1WCkgLC7U8Hqy5T1L/+CHA==
X-Received: by 2002:a05:6a00:430d:b0:52e:2c15:bf21 with SMTP id
 cb13-20020a056a00430d00b0052e2c15bf21mr6106320pfb.68.1659586309524;
        Wed, 03 Aug 2022 21:11:49 -0700 (PDT)
Received: from localhost.localdomain ([49.204.85.206])
        by smtp.gmail.com with ESMTPSA id
 o4-20020a170902d4c400b0016d22e6ed57sm2861727plg.293.2022.08.03.21.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Aug 2022 21:11:48 -0700 (PDT)
From: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	pgowda.cve@gmail.com,
	shivams@gmail.com,
	Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
Subject: [kirkstone] glibc : stable 2.35 branch updates
Date: Thu,  4 Aug 2022 09:41:21 +0530
Message-Id: <20220804041121.5672-1-sundeep.kokkonda@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Aug 2022 04:11:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168835

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


