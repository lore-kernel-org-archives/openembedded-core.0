Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD955C433F5
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 15:52:56 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.9746.1646754775930843321
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 07:52:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=C4KL19IG;
 spf=pass (domain: gmail.com, ip: 209.85.214.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id e2so17436571pls.10
        for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 07:52:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gacJYWfQolFkwFjmVIDNQAGjDbrqdZ7MkPnFNjL4LyA=;
        b=C4KL19IGARIYOYKNqlLD6ni9gtrklldX3U0AMCiKKsL3ScmDvEODTe/da8tag3ceE2
         YunRRunH3Nf10HsGJkuDLuzNqTwaT4dJTNDaLMy5iybk/W8+1zd0UjeI4rijYQz6IF8w
         Tw8vViWgxkMlmrdcA2/EBqtgLCKVR5xm3M1LpHGhIJ5rXos28q1OIdGTkyHo/aldwCME
         ixIKYj076DpdJr18+VuPlagV+OLYJu756uV+lbhrcQNhxgAUsiK138ZanXMhTJZ9qE3E
         c+MVHsO111kf299CzSkzZZMELqWzqtuDbLiJRimHDHqDvSKymc8QX7VgFc7s5j+3e/yx
         RraQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gacJYWfQolFkwFjmVIDNQAGjDbrqdZ7MkPnFNjL4LyA=;
        b=cXMuPgg1S5pwQlKIuKG7EkLSCVWXGHV/aVO9zC1RR3w+WtgE1qiIcvBMmkKUzJgJTM
         IHEPN3EzbqyRZH/PFMeBkdtMSqNaqU6kw0mXtEfunO81VSP3mLkDTmqrZwfcqtNt6ZCD
         a5qFO+X12yTHtP+BxPU/9g3Ls+l9inNk+kmxBQFKf+RzGO1ovHOH2FsyydZRyiVLo7rz
         YZKJoacLTS52vkOT26spcknwOmnX/z0TIQKemPJeGL8vmkTHnA+JVnqF7WmFXxy/3M5N
         n+iY6JbnCVnuyoSQKYxO4o1Y0cw15g68sXQe3igEXsr+WLKfiCV9E4RYiu9R06hy/e9s
         T4rQ==
X-Gm-Message-State: AOAM532IHYjREGxgTmSZPCutzCG7Wuasn682fiMmbY3IfuaaNAyHMy/z
	bexUQ2OvRtoe0Cp+gD/Pd8nTYWroskm0SA==
X-Google-Smtp-Source: 
 ABdhPJwSQ9I0Hs6dkPg/JmdxEDh5fcQS+2nhGZRf8ILYuNLpVM1r13RU1MkNwEHKqmxssC6of4jr7A==
X-Received: by 2002:a17:903:191:b0:152:384:117c with SMTP id
 z17-20020a170903019100b001520384117cmr2742935plg.123.1646754774995;
        Tue, 08 Mar 2022 07:52:54 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ff3d])
        by smtp.gmail.com with ESMTPSA id
 o1-20020a637e41000000b003804d0e2c9esm6559106pgn.35.2022.03.08.07.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 07:52:54 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/5] qemu: Depend on virtual/egl
Date: Tue,  8 Mar 2022 07:52:48 -0800
Message-Id: <20220308155252.2454464-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Mar 2022 15:52:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162929

This abstracts on GL/GLES implementations

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index cbbb99f611d..86bf2c1016f 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -163,7 +163,7 @@ PACKAGECONFIG[nettle] = "--enable-nettle,--disable-nettle,nettle"
 PACKAGECONFIG[libusb] = "--enable-libusb,--disable-libusb,libusb1"
 PACKAGECONFIG[fdt] = "--enable-fdt,--disable-fdt,dtc"
 PACKAGECONFIG[alsa] = "--audio-drv-list=default,,alsa-lib"
-PACKAGECONFIG[glx] = "--enable-opengl,--disable-opengl,virtual/libgl"
+PACKAGECONFIG[glx] = "--enable-opengl,--disable-opengl,virtual/egl"
 PACKAGECONFIG[lzo] = "--enable-lzo,--disable-lzo,lzo"
 PACKAGECONFIG[numa] = "--enable-numa,--disable-numa,numactl"
 PACKAGECONFIG[gnutls] = "--enable-gnutls,--disable-gnutls,gnutls"
-- 
2.35.1


