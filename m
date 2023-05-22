Return-Path: <ranjitsinhrathod1991@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DD94C77B73
	for <webhook@archiver.kernel.org>; Mon, 22 May 2023 09:04:28 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.17605.1684746262654293884
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 May 2023 02:04:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=mlxkAKaT;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: ranjitsinhrathod1991@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-64d24136685so2284688b3a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 22 May 2023 02:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684746261; x=1687338261;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ziBNr0rFUW5xqy1hn8UKQw9VRYzgS4d+I5utoDru0sk=;
        b=mlxkAKaTVjSxcvsecV6vgbONOHLl/evjTy3TADdXKArASSze8W/LYq6a2A2+QfwTLi
         fl/WZinQGm3rX36V1i1ze/tOQe6zsPz1hyX0Mq+jHXF15+yX0RL6VpNo4zcXAjnFkSOV
         QT1JRbFbwYAx4Nvgm7AzuWqS/iGjvmsdqR66zGjar/8X7LnWiNS3uj5y55z4Ku2nsJI+
         57xzvf1MKQ9JMYeCWQ+n8K75Xk4OgI0OJjarFhGT67YJB3PMSDdskFU9PTgap6cuYP9b
         jDV3BfA3kngIUhbFS0RtynrefGMZ3pGjgNi90TAGGEp5JrhH+CCF7hSFRJ/E17r56TQA
         peyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684746261; x=1687338261;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ziBNr0rFUW5xqy1hn8UKQw9VRYzgS4d+I5utoDru0sk=;
        b=RxF9IBikcD6Wo6q+fkD/Epwy1qsrZldtMnJweUCKIpCxS+I58WJE0BJhtY4K3h1SRu
         OGgs9Dn5ma1MAbhIae7utqx6I4vDHn4Ly3SFIccOwCXOY7n37MHENVVLyhpLEqofGigM
         Gs41zvtYeAiInquQvJDyModtxu5vTFPvLU7PM/XMSn3CNrLCOlx9KyCpMR55YiF3aOEo
         s5t9YKFtzVFb7PC9id6Lgh+YED1OjNRRwlHh0HZz/2ABmQr0WsHsCi5BywwCcUVl7rAb
         qdx6TSj8YpmCbApEmrOtQoig7rDNf8HveO8FgMB3xqsHPdi+XPvgL0Lgd3U1QuJTS4e2
         pIyA==
X-Gm-Message-State: AC+VfDwmnI0d3Xmjht5c3R9/Ff5zoHNsIRvbZ4txqAWsGbPEG1FR9BXk
	82VoSfH1DGuYzkC/dTg524bDT0oRCxg=
X-Google-Smtp-Source: ACHHUZ6v3cdUss26+GFJEGldTNKJG3UV5QTe9Gpwaplnw/AHdN7kDzpK2zgP7m4y9BQNaT39PK0T3w==
X-Received: by 2002:a05:6a20:938e:b0:10b:60c1:2999 with SMTP id x14-20020a056a20938e00b0010b60c12999mr3803510pzh.22.1684746261428;
        Mon, 22 May 2023 02:04:21 -0700 (PDT)
Received: from localhost.localdomain ([2409:40c1:2a:7776:2ef5:ea00:de82:aa0a])
        by smtp.gmail.com with ESMTPSA id 5-20020a631945000000b0053b9bb98331sm1335006pgz.20.2023.05.22.02.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 02:04:20 -0700 (PDT)
From: ranjitsinhrathod1991@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Subject: [OE-Core][master][mickledore][langdale][kirkstone][PATCH] kmscube: Correct DEPENDS to avoid overwrite
Date: Mon, 22 May 2023 14:34:05 +0530
Message-Id: <20230522090405.35316-1-ranjitsinhrathod1991@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 May 2023 09:04:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181586

From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>

As part of the below commit, DEPENDS gets overwrite which is wrong
Link: https://git.yoctoproject.org/poky/commit/?id=bd947d3343dcd96e79fc8157f32a2a087cd710a7

So correct the DEPENDS varibales

Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
---
 meta/recipes-graphics/kmscube/kmscube_git.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/kmscube/kmscube_git.bb b/meta/recipes-graphics/kmscube/kmscube_git.bb
index b2c10e09fb..67ac97b963 100644
--- a/meta/recipes-graphics/kmscube/kmscube_git.bb
+++ b/meta/recipes-graphics/kmscube/kmscube_git.bb
@@ -6,7 +6,7 @@ OpenGL or OpenGL ES."
 HOMEPAGE = "https://cgit.freedesktop.org/mesa/kmscube/"
 LICENSE = "MIT"
 SECTION = "graphics"
-DEPENDS = "virtual/libgles3 virtual/libgles2 virtual/egl libdrm"
+DEPENDS = "virtual/libgles3 virtual/libgles2 virtual/egl libdrm virtual/libgbm"
 
 LIC_FILES_CHKSUM = "file://kmscube.c;beginline=1;endline=23;md5=8b309d4ee67b7315ff7381270dd631fb"
 
@@ -19,7 +19,6 @@ S = "${WORKDIR}/git"
 inherit meson pkgconfig features_check
 
 REQUIRED_DISTRO_FEATURES = "opengl"
-DEPENDS = "virtual/libgbm"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[gstreamer] = "-Dgstreamer=enabled,-Dgstreamer=disabled,gstreamer1.0 gstreamer1.0-plugins-base"
-- 
2.25.1


