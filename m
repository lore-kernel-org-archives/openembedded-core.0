Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27D97C43217
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 21:15:59 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.30665.1668892558089087293
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Nov 2022 13:15:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=nxUqCNpm;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id b29so8015341pfp.13
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 13:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xTb1Epe2VB2+P5HwpRPliqKQwxRLHUzgAPrCcQm1ZuQ=;
        b=nxUqCNpmXPzeM0qyP0tVZRg62YGpSPZRATcuwI7XmrDI3Rd6sPBd39n+UPapf0bl0t
         rwVUlRK6NZUv9o9JT7NuOAgbUS9ZFlGDr+U1S6jEpNlSJLGwBk15LQvWm4Y/JXlwYmVM
         z9tW/mxvdPoYOccN0OlELJ1kplp6HQnJuXEDRrt0kpBJSVE9EIN6IisCNHFbYnffS+1q
         fJGV08FBmrtoHkr3JAGI8zOnTqOTit6M06EE/Uc8S9ayKTiIQ5bVRBP9o5LKSA9MN1+i
         uq17LMzdegRb1eBjXJFenL3BBEw55pwXlN9KDgGbJMQUxV1z8LruMs7rye0GSi6vmr36
         iCOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xTb1Epe2VB2+P5HwpRPliqKQwxRLHUzgAPrCcQm1ZuQ=;
        b=07cZx9erF7Jwzev2UIehOEFlxQ97xBovQjNPEl/P+L0KBaH1qjcq3oRdMsVtUuWWH9
         x0rbx+4qdoYHOyLOJN2/smHnRkAkENSMf6l4yW4cEHJ0uj5uAZdfx4aM0FozM6YnCz9D
         CW21wsw4oboCO3eNrdXHhHIYr32YBoFvwloiA4wwPTq/5TWnWjYHJmj3sQM3+l4GYHPR
         oSENQHju8xCAxfJCjiIvTPsOgvQG3r8R+jrszizPt5uBwDsy1s3MFB/GI2cag1NOZYJp
         enJL2/MRndOhK5QcL4MMYrpLUtLrSLSnKB2aG+oR8BL1EBvlvfBZ+dThrdOGfg3zCoqP
         FiTg==
X-Gm-Message-State: ANoB5plSndG69m/p36rszWjoNEdN3DOdEQDo6BT+1vtDh2XSH5FoeuLx
	961u8F5zxwTS+LFXt+3OP84UoG3YDH6rk/Z8AS0=
X-Google-Smtp-Source: AA0mqf5hkBUecDu1ndccj0lsc9G8BwY42ZNuKf62TBNXYPr3At3U3yeAbbisvdgwyK7tR/tKjmbEjA==
X-Received: by 2002:a63:5853:0:b0:477:4a83:8b75 with SMTP id i19-20020a635853000000b004774a838b75mr2223405pgm.519.1668892557023;
        Sat, 19 Nov 2022 13:15:57 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id s16-20020a170902a51000b001869f2120a5sm6197735plq.34.2022.11.19.13.15.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 13:15:56 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 18/35] ovmf: correct patches status
Date: Sat, 19 Nov 2022 11:14:57 -1000
Message-Id: <91371976a71a2433597dd1921ff17212c1fe93ce.1668892398.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668892398.git.steve@sakoman.com>
References: <cover.1668892398.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 21:15:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173558

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0f758719ad26fd7b23bbf21a37375f8de7068f0e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ovmf/0001-ovmf-update-path-to-native-BaseTools.patch   | 2 +-
 ...seTools-makefile-adjust-to-build-in-under-bitbake.patch | 7 ++++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/ovmf/ovmf/0001-ovmf-update-path-to-native-BaseTools.patch b/meta/recipes-core/ovmf/ovmf/0001-ovmf-update-path-to-native-BaseTools.patch
index 89d9ffab5e..0c3df4fc44 100644
--- a/meta/recipes-core/ovmf/ovmf/0001-ovmf-update-path-to-native-BaseTools.patch
+++ b/meta/recipes-core/ovmf/ovmf/0001-ovmf-update-path-to-native-BaseTools.patch
@@ -10,7 +10,7 @@ tools. The BBAKE_EDK_TOOLS_PATH string is used as a pattern to be replaced
 with the appropriate location before building.
 
 Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [oe-core cross compile specific]
 ---
  OvmfPkg/build.sh | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta/recipes-core/ovmf/ovmf/0002-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch b/meta/recipes-core/ovmf/ovmf/0002-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch
index f6141c8af5..2293d7e938 100644
--- a/meta/recipes-core/ovmf/ovmf/0002-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch
+++ b/meta/recipes-core/ovmf/ovmf/0002-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch
@@ -6,8 +6,13 @@ Subject: [PATCH 2/6] BaseTools: makefile: adjust to build in under bitbake
 Prepend the build flags with those of bitbake. This is to build
 using the bitbake native sysroot include and library directories.
 
+Note from Alex: this is not appropriate for upstream submission as
+the recipe already does lots of similar in-place fixups elsewhere, so
+this patch shold be converted to follow that pattern. We're not going
+to fight against how upstream wants to configure the build.
+
 Signed-off-by: Ricardo Neri <ricardo.neri@linux.intel.com>
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [needs to be converted to in-recipe fixups]
 ---
  BaseTools/Source/C/Makefiles/header.makefile | 17 +++++++++--------
  1 file changed, 9 insertions(+), 8 deletions(-)
-- 
2.25.1


