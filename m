Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCE9CC4707A
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:11 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web10.13914.1650769556877999557
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Apr 2022 20:05:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TO8SVbAr;
 spf=pass (domain: gmail.com, ip: 209.85.215.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id bg9so10559846pgb.9
        for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Apr 2022 20:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aYTthZabQxbvYSfO7lzzU7LNtkScx7ufSx2XzpWlX0A=;
        b=TO8SVbArIBQISfP44j/35Qn1We1auQFM1sAI0J++PE+XZMJ03iFQPhF1kuajS8XzKF
         D2axb3F+gCaSkaaisUNaRBsvUqiOL2VMEl/UdeutDso+kKCcBnU8LfHpCKCN4NjDGdEb
         DGD9623ZZSG/uOafh1/8Q2jkqevqPKJTZLtAfIBBvfJh2JOTEaGBI3kfPx46BPwyVrCC
         /QWbXdltK3VsNsHJK6MQWzXxlMVN2HKvkT4/RRbpvn/xh3Er+UD+9J3YybPCGHZmQbNk
         sGtxJ9ufZXnd/tkGWKOod4trHhPQL4bhNltIvCJD3VtQzxj5byJzA2XlveIKZb2/9Anh
         hDTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aYTthZabQxbvYSfO7lzzU7LNtkScx7ufSx2XzpWlX0A=;
        b=v85iE/942mkRuM9DXzFnumqH71VNEf2uEYeUMsMvDUNeJ9h5GPMkXk2oQXEDMNMWfB
         K/PYbY63iCUPzMguOsprkvBpVOs60vCej0slrCAoVlOcva1QaUJZ0Rb4Wzx7bzAWWvwQ
         8O6zuKJ4oYChEJPm6lzmFZle585Kq/YAZnC3hjpBhYsIpsgqZ+SNut9wuva27KKTuRnP
         ISbwCD0Ss1sp7LWK40Dz95Nh0SAUj51GfKtAzpY+fRQsXFSq2oT62tD6hSJXN2cjIBDj
         29/GklcbVXn0m0jtaX+m87Yalm/Jy5lcNVWJgcpwx2mLeYqb6YWHpVwvpx2T7LImYAiL
         VdvQ==
X-Gm-Message-State: AOAM531krcJHCb3dKanEAXxNEm5z05FvBz7XL0rmdckiWQmNacMY2cbC
	YgqBCEahRPjsqbc1AhpEA12ZxZVhwayEgg==
X-Google-Smtp-Source: 
 ABdhPJyf1qfTNqauzVLRBavn7VJhf+cuwua5OvIpb/TFzWdfzCiKqYPAn5kdOzVwOcOaEZOm5gewIA==
X-Received: by 2002:a63:1b20:0:b0:382:70f9:dc24 with SMTP id
 b32-20020a631b20000000b0038270f9dc24mr9723875pgb.485.1650769556110;
        Sat, 23 Apr 2022 20:05:56 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2ca3])
        by smtp.gmail.com with ESMTPSA id
 t18-20020aa79472000000b0050ad180a4bbsm7033157pfq.1.2022.04.23.20.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Apr 2022 20:05:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] glibc: Update to latest 2.35 tip
Date: Sat, 23 Apr 2022 20:05:53 -0700
Message-Id: <20220424030553.3015919-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Apr 2022 19:26:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164801

Brings in below changes

* 499a601796 Default to --with-default-link=no (bug 25812)
* 70f1eecdc1 scripts: Add glibcelf.py module
* d3feff2232 m68k: Handle fewer relocations for RTLD_BOOTSTRAP (#BZ29071)
* 68d3a9a696 nptl: Fix pthread_cancel cancelhandling atomic operations
* 8e8d46d598 mips: Fix mips64n32 64 bit time_t stat support (BZ#29069)
* bd415684df hurd: Fix arbitrary error code
* ba9c42ac0e nptl: Handle spurious EINTR when thread cancellation is disabled (BZ#29029)
* 6583d53445 S390: Add new s390 platform z16.
* cc9a4a664f elf: Fix memory leak in _dl_find_object_update (bug 29062)
* db03235895 NEWS: Move PLT tracking slowdown to glibc 2.35.
* 9be62976af hppa: Use END instead of PSEUDO_END in swapcontext.S
* 01d5214bb4 hppa: Implement swapcontext in assembler (bug 28960)
* 123bd1ec66 nss: Protect against errno changes in function lookup (bug 28953)
* c54c5cd8e3 nss: Do not mention NSS test modules in <gnu/lib-names.h>
* 3149f47b80 io: Add fsync call in tst-stat
* e30c1c73da nptl: Fix cleanups for stack grows up [BZ# 28899]
* ca0570fee3 hppa: Fix warnings from _dl_lookup_address
* d82d9cdff4 hppa: Revise gettext trampoline design
* 2631d3b3a6 hppa: Fix swapcontext
* 1f77081178 Fix elf/tst-audit2 on hppa
* c60e6a458b hppa: Fix bind-now audit (BZ #28857)
* 90797f4972 localedef: Handle symbolic links when generating locale-archive
* 732dd3a63d localedata: Do not generate output if warnings were present.
* 3feecd8001 localedef: Update LC_MONETARY handling (Bug 28845)
* a787325e83 NEWS: Add a bug fix entry for BZ #28688
* 264ad5d7d6 resolv: Fix tst-resolv tests for 2.35 ABIs and later
* e247a3b118 elf: Replace tst-audit24bmod2.so with tst-audit24bmod2
* 1dd783fafd elf: Check invalid hole in PT_LOAD segments [BZ #28838]
* 3226ffde07 NEWS: Add a bug fix entry for BZ #28896
* 676f85759c x86: Fix TEST_NAME to make it a string in tst-strncmp-rtm.c
* d001088e22 x86: Test wcscmp RTM in the wcsncmp overflow case [BZ #28896]
* fd412fff6d x86: Fallback {str|wcs}cmp RTM in the ncmp overflow case [BZ #28896]
* a30807b7db string: Add a testcase for wcsncmp with SIZE_MAX [BZ #28755]
* f055faf801 linux: Use socket-constants-time64.h on tst-socket-timestamp-compat
* 491f2ef1f0 linux: fix accuracy of get_nprocs and get_nprocs_conf [BZ #28865]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 080e905b6e1..5fea8b33ef6 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.35/master"
 PV = "2.35"
-SRCREV_glibc ?= "24962427071fa532c3c48c918e9d64d719cc8a6c"
+SRCREV_glibc ?= "499a60179657d2945c6ad01bdac90e8427a6310e"
 SRCREV_localedef ?= "794da69788cbf9bf57b59a852f9f11307663fa87"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
-- 
2.36.0


