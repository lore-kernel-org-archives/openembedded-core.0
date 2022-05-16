Return-Path: <samuli.piippo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9729C433F5
	for <webhook@archiver.kernel.org>; Mon, 16 May 2022 07:11:47 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web12.25936.1652685105350241753
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 May 2022 00:11:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UPv4uGAE;
 spf=pass (domain: gmail.com, ip: 209.85.167.53,
 mailfrom: samuli.piippo@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id t25so24151285lfg.7
        for <openembedded-core@lists.openembedded.org>;
 Mon, 16 May 2022 00:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D8rMKMrOEEh/k3hF2Mcat+Cwfz9sYU4NELshPvmPyjs=;
        b=UPv4uGAE6HLp5NudlA9ziFS6yDgRWFNrgcmEUFobsuIft6xLARVxWkJMCkwZoshdv8
         Bgd7MZadtg21IZw0z79z6O/5one7rR/MJxXJ4PYHQ4sl/HcU+RVPmfeESOfmL1hZbBfa
         Z8R8qgFQVMhqNUvBD8vaqve+kSSDeZKMCvgyiW/4qAUsaRmIDthtSKRbrQJ8IEg+zEUf
         89XKqN0kOCFE1gHH21j1QkvQZ1lz2M0hUe2acVkAaDTdlwVQ4GVli/0HcyvRFOWmYwA3
         CkTTCUszXvCiRicBBmm40u/2UQebLmdxNI+sbQTEIaOrVVaPpHoQFj1ToavOJpiQBFp2
         0QMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D8rMKMrOEEh/k3hF2Mcat+Cwfz9sYU4NELshPvmPyjs=;
        b=LEaSPiD7LNDU5z8rtF2ZReBv6VCQEcLyaLpZ2Lk/FOp6hpR3rasqY4j2JEwC46jg22
         QqflI4zNENXFdjubmqmY+MZiC3jcqyCMLg9PsUkJeXF3fkbIrtn7zCE46AjuoB5G13Rk
         Q2NY1YG6Q3qG/g4CPstpKIzNzaZ7xwiTXeG82zqbidkm6b+1pBNpPjdox4237labyRpk
         loeaYfmglAmgWauEGOyaL6/0wwPaK05LyqeWPihRMQgtE2KEE/FwgldeTF+vhYawHYXn
         Kv7VNUHGAStUgdFY+OBZE7fezCD+CXzDMYwvgv3XLx/hYAJ1w3vZJj0AIRI/Xex3uNW1
         XAHA==
X-Gm-Message-State: AOAM530Ijn/MAStzISp/G3k9xVq83a0ip39dnJJBT+8uZhIhUelxawRw
	aWtxt17TAY0sgL/gC+6g8p32N3xco48=
X-Google-Smtp-Source: 
 ABdhPJzFk1JInDebcw4ZNsEoswEKj8gcKqsQrW90c+qTc7ozpZDKEa6RnbJOiN2VMJ20rFLA7SLCeg==
X-Received: by 2002:a05:6512:3d15:b0:477:65d7:7635 with SMTP id
 d21-20020a0565123d1500b0047765d77635mr8040314lfv.656.1652685102808;
        Mon, 16 May 2022 00:11:42 -0700 (PDT)
Received: from dcbuildsrv.ci.qt.io ([192.89.120.62])
        by smtp.gmail.com with ESMTPSA id
 q18-20020a2e9152000000b0024f3d1daee5sm1397661ljg.109.2022.05.16.00.11.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 00:11:42 -0700 (PDT)
From: Samuli Piippo <samuli.piippo@gmail.com>
X-Google-Original-From: Samuli Piippo <samuli.piippo@qt.io>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] binutils: Bump to latest 2.38 release branch
Date: Mon, 16 May 2022 07:11:18 +0000
Message-Id: <20220516071118.496613-1-samuli.piippo@qt.io>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 May 2022 07:11:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165664

Fixes Qt build with GCC 12.1.

Brings following fixes

 * 3d549e5ccc0 PR29142, segv in ar with empty archive and libdeps specified
 * c473aa1b9d8 M68K: avoid quadratic slowdlow in label alignment check
 * 8d1187516e3 Adjust ld ctf test for 32-bit targets
 * 9c67f6382ac x86: Properly handle function pointer reference
 * 9a01457e02e s390: Add DT_JMPREL pointing to .rela.[i]plt with static-pie
 * 82a5bb730a1 s390: Avoid dynamic TLS relocs in PIE
 * d54081c642a LoongArch: Update ABI eflag in elf header.
 * fb4d148004f IBM zSystems: Add support for z16 as CPU name.
 * 975b5540232 libctf, ld: diagnose corrupted CTF header cth_strlen
 * 99852365513 dlltool: Use the output name as basis for deterministic temp prefixes
 * 210bf1d6225 Updated Serbian (for binutils/) and Russian (for gprof/) translations
 * fcf60fe8482 PR28959, obdump doesn't disassemble mftb instruction
 * e4a35c73196 PowerPC64 DT_RELR relative reloc addresses
 * 7183434818e Work around gcc-4 warnings in elf64-ppc.c

Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
---
 meta/recipes-devtools/binutils/binutils-2.38.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index 3544c0c7e7..dc0a2a4054 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -18,7 +18,7 @@ SRCBRANCH ?= "binutils-2_38-branch"
 
 UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
-SRCREV ?= "6938a3aca19044aeb9bc4b9564e04f9092a701ed"
+SRCREV ?= "134f17ef688ba4c72a6c4e57af7382882cc1a705"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=git"
 SRC_URI = "\
      ${BINUTILS_GIT_URI} \
-- 
2.25.1


