Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F20CAC4332F
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 14:00:34 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web12.27901.1653314421269082582
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 May 2022 07:00:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=UOCO5LOI;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id g184so13772795pgc.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 23 May 2022 07:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=PUeRVe1wGCzVNo2OzeM1GczPeLXvUEDSM1PocY4hr/Q=;
        b=UOCO5LOI9r1lV+9G2XA6yFZtIGubm8d/Yn2LCbDLaiTbETOOsCp2QfwCsjUpPWEuTR
         3C8/XaxL+bZUG3MkQ2DGZkpPHG9M3GGvbCHYX8MI65ckIoxxNwpo9BzjEgXLLWl+7QCS
         6v2LHPIapyx+Ba84+I8tQeM5vKpIMIQrXGcTikdANMYOXLdXZMN0/++ar/FJCkryenl6
         vOCJ3EmXo1bS+wlBxp01pnK/qnOZNt70Zr14JyTUF2OrxHwNmzwiofGyuTzBFJWKR4Hp
         VyZKDO5itAFFjNwyI1vggKVNfcsq6e9j79D+1ToJMUYk5sXl0DxRn1H17uh9tGOZjfZr
         6Uyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PUeRVe1wGCzVNo2OzeM1GczPeLXvUEDSM1PocY4hr/Q=;
        b=5Qj06Lviru58KSRHQ0tl8CqslWrj5pnUG/flREDw0PRNB+yHd2OggrMnDRWIsKkjKS
         iFwsqFtYJZdkqiHzGe6GpVQpKumrP6PLQoBWNaRUWn+QHHozjwrM/cBhRweYGiVinwGZ
         vhCEvpjY2IP28j0N/NVLrdC4kMsluv+99VsBGQmcZWMQ5ViNm4F5NPGme8e2WwzjDd7C
         orqmO43WI1Va0ULduZC2xUi5Hr/UKamoeQ8CBXxFLKxSKCB08v3sXr022tjvf/Kfn+wi
         t3nMGPtERwf+cbv0JIFrS7/u7zbZSSl961JXI3YYwZheaesZf5auAUTub+QnjwxOw/ug
         lcDw==
X-Gm-Message-State: AOAM530h5b+yNxJcN87u45RJWwvqSNMhI9EtVZ0R5h+WU9HSKj1E+3Zh
	CqyVHLEHCJvrKoEjb1muUV9mI0Mb4lBrksNZ
X-Google-Smtp-Source: 
 ABdhPJwO2+icwJhTOn0WKIf9CvbpEjtdODGajvQ/S8BNguCjzhtBWBlR2kpjiM7yw8P16FXQH75w9Q==
X-Received: by 2002:a05:6a00:1952:b0:518:9fbd:ff7a with SMTP id
 s18-20020a056a00195200b005189fbdff7amr5300957pfk.77.1653314431505;
        Mon, 23 May 2022 07:00:31 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 m10-20020a637d4a000000b003c14af505fcsm4778952pgn.20.2022.05.23.07.00.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 May 2022 07:00:29 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 6/9] binutils: Bump to latest 2.38 release branch
Date: Mon, 23 May 2022 03:59:45 -1000
Message-Id: 
 <cefc45625535972d20b252ed0a2f497dff7d5fe5.1653313955.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1653313955.git.steve@sakoman.com>
References: <cover.1653313955.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 May 2022 14:00:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166029

From: Samuli Piippo <samuli.piippo@gmail.com>

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
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c007a7251e697836a29bd1aebe49d4f2433a5e6e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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


