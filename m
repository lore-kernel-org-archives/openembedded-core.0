Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0A2AC433FE
	for <webhook@archiver.kernel.org>; Sun, 13 Mar 2022 07:59:37 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web08.13263.1647158376877486972
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Mar 2022 23:59:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XG+Xw1Un;
 spf=pass (domain: gmail.com, ip: 209.85.215.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id t14so11149588pgr.3
        for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Mar 2022 23:59:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2HAHzxvKM7zE4oJmye5WnXVluNoR8gqcz1h5xH5oQuE=;
        b=XG+Xw1UnjcIhDE/SbZ8LBhXdwo21CL5ea2uk7AMR+EBlTiwccXUU9wkBLx3ddNifPl
         /VDAtheMa+w05zp2RPpxCpQTRR3KHvhKR+T9xSAMQLftp5RS/yV85r+8LOPaLARS68RG
         cZ6BgyyMRglr5NM7y8pPN4VzLlPQWzsABfunkK2kYKZXvvz+NbjWi7ue92tTCOoJKFYN
         dL0O4UF/mEr4GYWgXYCopQxMB3OyS7L1Ndjk8IsBiTlRmuVGovT7Dt4DbhFqWNFCPZR+
         rZVb0c9gWZvFYr65l7JlOd4UD06vYswbDB3abf4bnr+zyEorseHuiJfqFxZeMVFUB2iV
         hgkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2HAHzxvKM7zE4oJmye5WnXVluNoR8gqcz1h5xH5oQuE=;
        b=PXpcShHgg54xUT/FM3thlqSyUXO2YGrigVa93Tve+yAhz0ekN7GLLxuvE09SLzbgMN
         krYBRi9tgNb5AGNwjvaxs0SkRWgexWz9ErFSViw+NuSJ1F0nwQ6ZoLbdOSsS77HAsTsy
         zxlWy+ltkOrkwwuYC712LLtDvnxww/PmwzvNZHaY0va28ZTN3GOxeTylZL/PuUZQtbfQ
         LL7KAP+2veLVITJJH3i5xsGGkuXB9ymVFt0+nocoZsffSr1/IiR8gPwrDag74IV913+q
         c5N0CIYEkh+MtCJbNgyEfhLOIadUWw4jxDSDKw5vTqt8y7JXLPc/hZlqGFtSGG60JQRr
         gpKw==
X-Gm-Message-State: AOAM530epXDo+HtVkIwI2liYHg9xcfDJI6KMcN4+iLUp7rNFlQKZg+62
	Vg8X4IIlcixM8RRMmZl79Ae3tLgtFkyP7w==
X-Google-Smtp-Source: 
 ABdhPJwf2q/qQTju0MHnLzhNtrdYM5N71ZcJLq6vhS4wHUB1N77nndK6DdthLgiMuYEjblPiSdcGLA==
X-Received: by 2002:a05:6a00:2405:b0:4e1:5008:adcc with SMTP id
 z5-20020a056a00240500b004e15008adccmr18655968pfh.35.1647158376155;
        Sat, 12 Mar 2022 23:59:36 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 g28-20020a63111c000000b00374646abc42sm12958928pgl.36.2022.03.12.23.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Mar 2022 23:59:35 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/3] binutils: Bump to latest 2.38 release branch
Date: Sat, 12 Mar 2022 23:59:32 -0800
Message-Id: <20220313075932.3031649-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220313075932.3031649-1-raj.khem@gmail.com>
References: <20220313075932.3031649-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Mar 2022 07:59:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163104

Fixes building ppc32 kernels

Brings following fixes

* 2d92604cd30 Revert "Check thin archive element file size against archive header"
  * ed9b2e40ebf binutils 2.38 vs. ppc32 linux kernel
  * 40d32f56f63 Updated Serbian translations for the bfd, gold, ld and opcodes directories
  * 6aa1b7df2fc ld: Keep indirect symbol from IR if referenced from shared object
  * ae1cab7d3f3 i386: Update I386_NEED_DYNAMIC_RELOC_TYPE_P for DT_TEXTREL
  * df9071487a8 PR28882, build failure with gcc-4.2 due to use of 0b literals
  * caa6172de4b x86: Disallow invalid relocation against protected symbol

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/binutils/binutils-2.38.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index 4ce74f94bfa..3544c0c7e7c 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -18,7 +18,7 @@ SRCBRANCH ?= "binutils-2_38-branch"
 
 UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
-SRCREV ?= "a96f7ba94b69b588bf524624ff2410b31420c957"
+SRCREV ?= "6938a3aca19044aeb9bc4b9564e04f9092a701ed"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=git"
 SRC_URI = "\
      ${BINUTILS_GIT_URI} \
-- 
2.35.1


