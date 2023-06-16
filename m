Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDEAFEB64D8
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 08:31:21 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.3940.1686904276853061721
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jun 2023 01:31:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=SLZZAlJK;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-666afc1e7e7so451701b3a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 01:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686904276; x=1689496276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MObgp43fBryTr+HXO5OoxPqX0owW/+iKAUjdc02gs6E=;
        b=SLZZAlJKsFTFwfaXaH9nuhEZHGUfSxWLwWa5/Rbtxth6Q6qj1iUoNsZ3rM1t8pL60I
         LlFrulMPKuFiRSbwo2UW9SqcYNS47QzOkxYyQKBEDO402tKuaV81p75ec8+jSJL/rWZn
         znFOFpTsct9axYULDrCQ1x8w2q3kIhFsXWswUoW9sn1082UbyHMSDHwQiDHZutXzTNoQ
         jm706AE55sWHNQRrRFdXOS/D5u2HzC+cUav+P85NG+wSgj/cRXoRdiji2VqhfgL14TI1
         KyPq25oeEi8wOpJLwAm+IuOgF0ViTqEm5qbDhgXTEddZ9BXzjWGr3Y/nZPzedpO2dM0p
         5HUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686904276; x=1689496276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MObgp43fBryTr+HXO5OoxPqX0owW/+iKAUjdc02gs6E=;
        b=OhCBLm0KK2zjb0eF++jA04XnwgDxz5EcIU+YUfIscnLiVAXAfp8AoLiJG72mBjtvun
         oI1sijAtPEIZnKVAsXPt2iLxCwo9FNFO7Q5pZEaeXfsoNGaik1eTXODvzxHylAQiX1c4
         ZswJLdDU+GAhd3w+hIfBOXHLJz+LlwiRbxUMWHffabkPa7229MfYngYjYkhO35UUhLvY
         LGMm0cQu5HNRgCZA0SFqFK4ylTK0Y+HPwaoTSUknOG7rW0rOc+eMtTPKsIFjLpRWaDWc
         PrNTwECzXMusoW+qNzOGmaGfPvM7aBWENBPEbSX3ucA4j9K1fPefNVCKAjtL23lvFF6J
         v4xw==
X-Gm-Message-State: AC+VfDyGbFrpU1GlOKE7bKlWJ4PLFNymR39LYTCDrNv1AkXOILPQ1kvB
	fwYstlcYqpS20kFnpXSJ+S7KkzW4zn4=
X-Google-Smtp-Source: ACHHUZ7frb3BSq9guQZyxMONBFq+daQOyUyKCa+30IEMolWFKqGf2cSRCxM1TbwqeFtOg/TAFER6dw==
X-Received: by 2002:a05:6a00:238c:b0:658:7f40:652 with SMTP id f12-20020a056a00238c00b006587f400652mr1753445pfc.20.1686904275787;
        Fri, 16 Jun 2023 01:31:15 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::eb87])
        by smtp.gmail.com with ESMTPSA id s18-20020aa78d52000000b00653dc27acadsm12969145pfe.205.2023.06.16.01.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jun 2023 01:31:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/5] llvm: Bump to 16.0.6
Date: Fri, 16 Jun 2023 01:31:09 -0700
Message-ID: <20230616083111.3007680-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230616083111.3007680-1-raj.khem@gmail.com>
References: <20230616083111.3007680-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 08:31:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183003

Brings a single change
[lld][WebAssembly] Fix stub library parsing with windows line endings

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/llvm/llvm_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index 8b0ab11b612..f3d6f24bd2d 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -14,14 +14,14 @@ RDEPENDS:${PN}:append:class-target = " ncurses-terminfo"
 
 inherit cmake pkgconfig
 
-PV = "16.0.5"
+PV = "16.0.6"
 
 MAJOR_VERSION = "${@oe.utils.trim_version("${PV}", 1)}"
 
 LLVM_RELEASE = "${PV}"
 
 BRANCH = "release/${MAJOR_VERSION}.x"
-SRCREV = "185b81e034ba60081023b6e59504dfffb560f3e3"
+SRCREV = "7cbf1a2591520c2491aa35339f227775f4d3adf6"
 SRC_URI = "git://github.com/llvm/llvm-project.git;branch=${BRANCH};protocol=https \
            file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
-- 
2.41.0


