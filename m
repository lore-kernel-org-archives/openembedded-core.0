Return-Path: <deepadeepthi98@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 110D5C77B60
	for <webhook@archiver.kernel.org>; Fri, 28 Apr 2023 08:30:07 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.14558.1682670596835179027
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Apr 2023 01:29:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=iYHa7Vhq;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: deepadeepthi98@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1a667067275so73886145ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Apr 2023 01:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682670596; x=1685262596;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4fx/sFeFXZdqmXyFmYDfMYn5s5T9OK3B7/8mrx7bP3g=;
        b=iYHa7Vhq3ruyt+e/YEZUsK3fYgBQbceLuCkJF26+aOeVpocGP5DKnaGAMoK95wzj66
         UYmEm+dm7eIAZ5S4Nl9gHcsVLgU49J63hnrgWrFZkRBPxxIYtuiRbG2QKPVe9hxN75K4
         pXAzON0HeQI9qLRRQXuoRAYdr58EXxIV+H0x5vl1auOi6s+/qFBOOFgHrW3zjD/huKcZ
         jnlRILLqpW0Qtmub+OCAnByXV/5GqZNhb13IpPhYC7dCuiA+fnIL3NTkQ+LFUMOlrs6+
         Bq08Us84ruQzg4b5Z9PGG9Qg2MW1FIpjKarojr97NL31G3Owt28rWaFjrPilX4DfS/lQ
         vRhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682670596; x=1685262596;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4fx/sFeFXZdqmXyFmYDfMYn5s5T9OK3B7/8mrx7bP3g=;
        b=JkhHAweG1ucpu7Uh/tgwCX6uagHQkoVHjPKgNchmDhS8E7OCnD8AyFUofnlu6rzk4F
         et+iX1KujzZuekBkk8AgUqiTd0sj+h/Jn8hQ7Jpa8FObcOv5lyy0ZQ8jwfUHqmFrg5yM
         66DDkESby5tIdA6f2aVX6pzuSPkZBNj3RtQIHuvv6LzuYR1cZXJEnwcx5elZSSMgAs/0
         LpqoWjvbrg6THPPkSJ7+Qf/NTsM7F2D044xm5d16m3/ir5yEhHxiK98mb9AFouXcBI3x
         H0t+Uls/JG/bm/AL5cArquZNMlTFArPtO3bNU9yH+3menZMH+zmwhn8WX7l4EO1MW4CD
         tEwA==
X-Gm-Message-State: AC+VfDya4xwsSgH/8oQJhsUKA/yAdLg7vhQ2l5WafQg4NXV7llOa0VwY
	/2YKKYr7UycuBn2WPSWDQ2HZmIZQ6F+2+oeJ
X-Google-Smtp-Source: ACHHUZ4mVskPOqxhVOZBVJM9k+UgaA8bsbR0eWSbUMGTtlZq2pQOp+CqXMG2N1iB/IUvfDm3YI0TDw==
X-Received: by 2002:a17:902:d482:b0:1a9:a672:12b8 with SMTP id c2-20020a170902d48200b001a9a67212b8mr4446285plg.68.1682670595998;
        Fri, 28 Apr 2023 01:29:55 -0700 (PDT)
Received: from bft-PowerEdge-R620.. ([49.204.85.206])
        by smtp.gmail.com with ESMTPSA id 4-20020a170902c14400b001a64011899asm12814543plj.25.2023.04.28.01.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Apr 2023 01:29:55 -0700 (PDT)
From: Deepthi Hemraj <deepadeepthi98@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	pgowda.cve@gmail.com,
	shivams@gmail.com,
	sundeep.kokkonda@gmail.com
Subject: [kirkstone][PATCH] glibc: stable 2.35 branch updates.
Date: Fri, 28 Apr 2023 13:59:47 +0530
Message-Id: <20230428082947.4091975-1-deepadeepthi98@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Apr 2023 08:30:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180510

Below commits on glibc-2.35 stable branch are updated.
1c7f51c75a x86_64: Fix asm constraints in feraiseexcept (bug 30305)
8d07e65d15 gshadow: Matching sgetsgent, sgetsgent_r ERANGE handling (bug 30151)
b7cc55a24e x86: Check minimum/maximum of non_temporal_threshold [BZ #29953]
3f63f9dfe1 stdlib: Undo post review change to 16adc58e73f3 [BZ #27749]
757d9a6306 elf: Smoke-test ldconfig -p against system /etc/ld.so.cache
416bd20b3f Use 64-bit time_t interfaces in strftime and strptime (bug 30053)
ae045ed16b cdefs: Limit definition of fortification macros
6bcd5d8e36 x86: Prevent SIGSEGV in memcmp-sse2 when data is concurrently modified [BZ #29863]
82663d3c03 time: Set daylight to 1 for matching DST/offset change (bug 29951)
d9923235f0 elf/tst-tlsopt-powerpc fails when compiled with -mcpu=power10 (BZ# 29776)

Signed-off-by: Deepthi Hemraj <deepadeepthi98@gmail.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index d36da0ce3f..4d8d96cefb 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.35/master"
 PV = "2.35"
-SRCREV_glibc ?= "293211b6fddf60fc407d21fcba0326dd2148f76b"
+SRCREV_glibc ?= "1c7f51c75ae300fe52ccb636e71b8e28cb20824c"
 SRCREV_localedef ?= "794da69788cbf9bf57b59a852f9f11307663fa87"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
-- 
2.34.1


