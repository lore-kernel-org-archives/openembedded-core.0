Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94260C19F2D
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 14:50:48 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.12931.1660056646009133531
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Aug 2022 07:50:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=omC+sYod;
 spf=pass (domain: gmail.com, ip: 209.85.210.171,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d20so11000983pfq.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Aug 2022 07:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=OEMbJAfoJnu7UewYkR8CG1jq+gXXsZkVKg75kkidOAY=;
        b=omC+sYodcHcGVpbpBPZ4E6YoDBZ/HnPCFhNPj1VZ9Z1z5818yJX1DfyTJa8BTxfouW
         H36Mt2kr3dGN8SKz5GvwALrgJ8NvvrpESBMch+wRmxqMYuKZP1w7WCOUvCg9pSUw0Mf6
         uM8NkVeeXTrf98HCJxbSwEnOyRpF/lLHHDaX3vRyxFO3h7Z0WIwHPCV1mc2xW9GRbdCb
         E5NHEg47cp9Ew72O8jxS4K6VwyaDORDVhiscpz4M4FKnsf8cpzC0p/aE4TPR62Czx5Op
         Z/JEra3jrae7vlICshZYXRdsfQt1WqOuJ40ZkKmscwG3BhdmgRAOGPdVa3P5gWEGLG++
         qO8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=OEMbJAfoJnu7UewYkR8CG1jq+gXXsZkVKg75kkidOAY=;
        b=2Y7x3WQtAG7KEhUjlQ6RNtpzjYKt6SdkRaqRZOjUqIpWuM++r+FwM8lxkemEtjr+lu
         CDp83MA89GqcRYQiv+uGG0zX4VN7TQ4sx3vdgfgoqQ/y9CG2SsRmM4EyMF+6m6QLEcIq
         xJxJkSoiz1VkgezDFHOG8iDW5mrxwevSq2R2hid0Icvm560LqzNdCMZz06i8ITFaFGm+
         niqZsuGiHCEpTk6xlcTtOqWZMlMATqoCWZmZfU34Bhs/HXeafOCnvhpFvlg6Umpk0TQQ
         shFgelIOF0IX0nDodHaS93gnfU7rKDw1v7oWWlTx7hYcPuw5Cwkh/rRqC3U5wu5880wS
         H9YQ==
X-Gm-Message-State: ACgBeo0qCUP09bFcBOjDJCQZ9hfIg/lzmbGwaO0XxLCv0jPokaweIpel
	bE4Vcixo2JbYZwDibKghlQqIBDemmHo=
X-Google-Smtp-Source: 
 AA6agR7n6ve5uT8YXrRsey0ECQ7Q5/mHNvOVHB1GFD0z8wuDdM+9jyUesvw4yn21/2c9F5pS+n2y8Q==
X-Received: by 2002:a05:6a00:2a7:b0:52d:7d79:b836 with SMTP id
 q7-20020a056a0002a700b0052d7d79b836mr23528397pfs.52.1660056644800;
        Tue, 09 Aug 2022 07:50:44 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::9f45])
        by smtp.gmail.com with ESMTPSA id
 h184-20020a6283c1000000b0052d481032a7sm2981pfe.26.2022.08.09.07.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 07:50:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] glibc: Update patch status
Date: Tue,  9 Aug 2022 07:50:42 -0700
Message-Id: <20220809145042.1789552-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Aug 2022 14:50:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169155

These patches were appplied in master

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0026-x86-Fix-define-STRCPY-guard-in-strcpy-sse2.S.patch     | 2 +-
 .../0027-elf-Replace-strcpy-call-with-memcpy-BZ-29454.patch     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc/0026-x86-Fix-define-STRCPY-guard-in-strcpy-sse2.S.patch b/meta/recipes-core/glibc/glibc/0026-x86-Fix-define-STRCPY-guard-in-strcpy-sse2.S.patch
index 2d14a4c6196..2caff3a0d53 100644
--- a/meta/recipes-core/glibc/glibc/0026-x86-Fix-define-STRCPY-guard-in-strcpy-sse2.S.patch
+++ b/meta/recipes-core/glibc/glibc/0026-x86-Fix-define-STRCPY-guard-in-strcpy-sse2.S.patch
@@ -7,7 +7,7 @@ Subject: [PATCH] x86: Fix `#define STRCPY` guard in strcpy-sse2.S
 defined.  It doesn't end up mattering as the whole check is
 guarded by `#if IS_IN (libc)` but is incorrect none the less.
 
-Upstream-Status: Submitted [https://sourceware.org/bugzilla/show_bug.cgi?id=29454 https://sourceware.org/pipermail/libc-alpha/2022-August/141289.html]
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=312ded0d6339e8c463d0395397b5825401b14f54]
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
  sysdeps/x86_64/multiarch/strcpy-sse2.S | 2 +-
diff --git a/meta/recipes-core/glibc/glibc/0027-elf-Replace-strcpy-call-with-memcpy-BZ-29454.patch b/meta/recipes-core/glibc/glibc/0027-elf-Replace-strcpy-call-with-memcpy-BZ-29454.patch
index 1b347b33226..a2c951ad936 100644
--- a/meta/recipes-core/glibc/glibc/0027-elf-Replace-strcpy-call-with-memcpy-BZ-29454.patch
+++ b/meta/recipes-core/glibc/glibc/0027-elf-Replace-strcpy-call-with-memcpy-BZ-29454.patch
@@ -8,7 +8,7 @@ strlen_pass::handle_builtin_strcpy but only for optimized
 build. To avoid needing to include strcpy.S in the rtld build to
 support the debug build, just do the optimization by hand.
 
-Upstream-Status: Submitted [https://sourceware.org/bugzilla/show_bug.cgi?id=29454 https://sourceware.org/pipermail/libc-alpha/2022-August/141290.html]
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=483cfe1a6a33d6335b1901581b41040d2d412511]
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
  elf/dl-cache.c | 5 +++--
-- 
2.37.1


