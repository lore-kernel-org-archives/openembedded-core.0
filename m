Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D564C48260
	for <webhook@archiver.kernel.org>; Fri, 16 Feb 2024 18:55:11 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.5064.1708109710383116324
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Feb 2024 10:55:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Mljn3zRU;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6d9f94b9186so1980862b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 10:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708109709; x=1708714509; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iiZLzbA12JTtjP+vrWfuVgD1hQoKEz0htovxlsAS+CM=;
        b=Mljn3zRUdBN+634Uhf5uHcDWW9klFg98bjLciLF7kqLlLdBO5IheeN8yNrLRyTKAcB
         NgqJ+WS+QeITNnL2P8pkWug6bt73ydXkeNTEm1K6XsBIMkel+ev11Qbx7fSz8abcui2m
         GJVdKZj1cBIHazf/LGFBxEY4BRRZvKza99Ls7HBR35SuDiASr99n1l06BIkrFs2WbCOc
         LFQ+J3TBgTCtNqUqHRTX3wJZWDXfikl8wlQ42VR/skksJ/UW0Eumy1YH/wd/PhQtlYz0
         ci3ERQqrSn3I7ECY/PvBFsU101yQiFHUOymuNLosPjHV50hqUP6nuSKPsEhz6Hhb1HU8
         yAwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708109709; x=1708714509;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iiZLzbA12JTtjP+vrWfuVgD1hQoKEz0htovxlsAS+CM=;
        b=wTqu8gM6P36pX64hIifMSqHpxXoVL/IHTeRkVxZ4y7I+D3tWlVBXVEs+T85EwyEj8X
         jVXv9V/Jhmm9D+k0Zy/MnI8d7qzXyD/pQO/Gl56iRhD3OKIpPHDL2C244QdLSJ2xwGkL
         dGh7d70zSjXFiajGfambawPrJktwswLMdqGhs+LrgqB9s7/w8ToW5q1eVEYvpvgzilTj
         eBudpV7k+SCpJ3tta9WX2YcowKCbd+BqLjve95dbfNsowJAr75HcgO2mATjPkWrAf6Tv
         D7yKAATOVnAi19y+Iq8UTlvxysd34BCvyI15OhZRODNt3hNMNN/iv4CNCd9H8QlkvOen
         NemA==
X-Gm-Message-State: AOJu0YxY4ezWQf0EqUHS9f0FdGB8WTMyZefYEiI5WgJksSzIp1q1Weqj
	p4MeM0CE3BxINU9S9ZkBf3Q4tYS3J+NJVySm72DkxhmTx6BabtIulH+UALpXAc0=
X-Google-Smtp-Source: AGHT+IHDsJ5Y5k4Rsk+qwXodlrSOSRVCMvAv8xzNaSSvOGmjgjipUY21cw72C5g/SMbyqpgCZpfRHA==
X-Received: by 2002:a05:6a00:92a5:b0:6e1:e4c:7741 with SMTP id jw37-20020a056a0092a500b006e10e4c7741mr7961131pfb.26.1708109709414;
        Fri, 16 Feb 2024 10:55:09 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::fffa])
        by smtp.gmail.com with ESMTPSA id kr22-20020a056a004b5600b006dbe42b8f75sm271866pfb.220.2024.02.16.10.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 10:55:09 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] binutils: Update to tip of 2.42 release branch
Date: Fri, 16 Feb 2024 10:55:07 -0800
Message-ID: <20240216185507.551956-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 18:55:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195792

Brings following fixes.

* 553c7f61b74 x86: Display -msse-check= default as none
* 4f7d1d2d5ec PowerPC: Add support for Power11 options
* 3c1f1c35784 x86-64: Add R_X86_64_CODE_6_GOTTPOFF
* c426c8e307a x86/APX: VROUND{P,S}{S,D} encodings require AVX512{F,VL}
* 78f9e9faaa4 PR31208, strip can break ELF alignment requirements
* e19278f72bd PR 31283 windmc: Parse input correctly on big endian hosts
* b76b8983116 Link x86-64 mark-plt-1.so with --no-as-needed
* e92e2d654bf LoongArch: gas: Fix the types of symbols referred with %le_*_r in the symtab

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/binutils/binutils-2.42.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index f48a1eb2494..b6c275af46d 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -18,7 +18,7 @@ SRCBRANCH ?= "binutils-2_42-branch"
 
 UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
-SRCREV ?= "42cde237366398f6e318232f4ce080bef42f0371"
+SRCREV ?= "553c7f61b74badf91df484450944675efd9cd485"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=https"
 SRC_URI = "\
      ${BINUTILS_GIT_URI} \
-- 
2.43.2


