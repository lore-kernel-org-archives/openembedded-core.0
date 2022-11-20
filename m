Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83E9EC4332F
	for <webhook@archiver.kernel.org>; Sun, 20 Nov 2022 14:16:30 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.13227.1668953781022494184
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Nov 2022 06:16:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=C6kmAb0E;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id y14-20020a17090a2b4e00b002189a1b84d4so2673636pjc.2
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 06:16:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xTb1Epe2VB2+P5HwpRPliqKQwxRLHUzgAPrCcQm1ZuQ=;
        b=C6kmAb0EMbuhB2yH0QidalF4pPmR5Dlhex8jJOdmsHLhXx4FQpP375CMskonr5kjQh
         WznhuZ0ucX70P2hr+jooe2SW7Ug9JT2KhuTuIYlOR3bTWsYysbDhfUUz5O1ru3394Ww9
         Wx7OXUWOa7Z3xBkH+l0NoHfEdBRzH5lDMFhGLMqbLqUPznYA/SpB8Qc1zptxY0CwYZyK
         fDCJsMQw6GTucT66yfiUq5fEKcP6B357hXENKLIgtNVuyUg5J3nvh/tty1P9kb0QMfTX
         3Og8jGXDO305ge39QnZ6nAFkAeXvNeAWC1VCxM67pxTxd3thTkHzzCI53DGDfK7m+zHq
         Lqmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xTb1Epe2VB2+P5HwpRPliqKQwxRLHUzgAPrCcQm1ZuQ=;
        b=eJDdntNQupJzeEMUn8WBuwf4qj1+u5qu2YbegzVIdMl/jSonpaKyIhuxtWm55HwhV2
         u5iy9KuFGOjre9Lr6E9JC5XDLKYcNwd1JewE44eK4oHTQJlARPnQsHfRB67kx/UtEmM/
         yC2jGCRyODhaBZtwaMSl8LrSPxBlJyFGjDZzdBomt1u7ymmniemnys7aFgAd3csZdHFu
         ZP4myN5anJ+Pb4YMJuT6ZHXIuNRrn6tecKNoAd8Y35mfzj2T7MmTVtdnWjPQaitWNdnA
         f9RnJFFIGiRpUJsya6fHkbK1VseDpgHSQqFpjibgY3piYDsd63B+KQ7ymuWUoa5ctcW/
         JMqA==
X-Gm-Message-State: ANoB5pkMryh5Re5EM8rMzKXMKGZZtAf74cs5RIKaI6Dglncnhy9gQyWQ
	JBoy2+LkWw2BxkURwj4BLOLc8jtu44mSsPAfqIM=
X-Google-Smtp-Source: AA0mqf5bdIXVotIDtlbhubXjB0nr5Cj7YmVbLD0tccQQMJmTnVJUlZHn8oqP6GhK1lcZrjxhvgeG4A==
X-Received: by 2002:a17:90b:3c0a:b0:213:5de3:13e with SMTP id pb10-20020a17090b3c0a00b002135de3013emr22522875pjb.6.1668953780067;
        Sun, 20 Nov 2022 06:16:20 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id x15-20020aa78f0f000000b0056be4dbd4besm6721379pfr.111.2022.11.20.06.16.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 06:16:19 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 23/35] ovmf: correct patches status
Date: Sun, 20 Nov 2022 04:15:12 -1000
Message-Id: <80280e06923b4adcf56d0726311da8d68f51ac57.1668952942.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668952942.git.steve@sakoman.com>
References: <cover.1668952942.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 14:16:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173623

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


