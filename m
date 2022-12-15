Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C335C25B04
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 19:21:44 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.143581.1671132098465755670
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 11:21:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=lihsM8NP;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d3so7872455plr.10
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 11:21:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FjSIlZTWHqrBPLRPNG+6wri2pyMlcob3Ap8PPLJ5D6A=;
        b=lihsM8NPZl3bHKSJK2BYA1oDoyJPpBfh/tjZ5FHSshW47oMjtfKBCqXljI2sE3fv/8
         AvXOLMcb9SAwMS2qd+1eos9DLJv04To2nJITQuC70k9gr4KP0yBOSsXIXIwiyBFqqsku
         pkBnienGTo8+daqOeE/oYOdRzcgUNVixB/jvo3Ec+FlmjoAEfnfVM/YhUirHRsNv3kj2
         GLqc6ZrPML6Ty7tgaIIxR4Hls8BmR3/2Gfm0mVGWjtSPfFK5p4UYfNnDYHlT2NyReDzi
         NuD4KoGu92AaFcmkhJlIzhghjiOKPq5szeZhDWZMJ/0oUk1h+Dodw4XMvtrP3rjODqtK
         9u5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FjSIlZTWHqrBPLRPNG+6wri2pyMlcob3Ap8PPLJ5D6A=;
        b=u/KpP8G4Q+9iJoHL0LmJlSDULKI5Zao6nVynVKQN+4MrmcuhrNSRvwOco9MD750TOD
         f1+SrsemjHc3S61Ud2sJJbL769XAZSxNwQyxaOxOTZPpYRxMQGUJ/rEnyztpbZySH2lD
         hDxBEsdoR6FB9rl8vF19Ug6bznn5E3jYjAogJySluq8IuN8S74/ymiYdzRS1MkEZy9yC
         op3ktRb3PotN925T6dmW7zRW1IjahoU6pXvgGjYZyPxRJLQC7NHlpPwEuidl5cLBvZtf
         zBsbQciiGRPfuDFvLmekZZCjFMf57Ausj3C29/nz2+uIt37XztEkZ69TC9iRuIvMGCKc
         wLug==
X-Gm-Message-State: ANoB5pmyQTnafd80o1cDKQeE5gFSQalETxObz926xCkBiR9DVDtX8E4T
	C99ol7GsEEIwN/DRPI9S75R2yCgWz+yS6YWsBv4=
X-Google-Smtp-Source: AA0mqf7SR6hliZJevxqmik/KsfEcnY20Q/iv7MP3lZX9AkiJ2F339nWNPUDbHr5bOeO5p/DVUgUe0Q==
X-Received: by 2002:a17:902:be04:b0:186:8238:bc9 with SMTP id r4-20020a170902be0400b0018682380bc9mr28374842pls.2.1671132097477;
        Thu, 15 Dec 2022 11:21:37 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id r19-20020a170902c61300b001869b988d93sm4167095plr.187.2022.12.15.11.21.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 11:21:37 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 21/30] libdrm: Remove libdrm-kms package
Date: Thu, 15 Dec 2022 09:20:45 -1000
Message-Id: <14556a98203f9480357f970d257fb2641381c94c.1671122751.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1671122751.git.steve@sakoman.com>
References: <cover.1671122751.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 19:21:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174613

From: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>

libkms library is deprecated in 2.4.111 version. Hence remove
libdrm-kms package.

Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 3c250b743bce6cc63ff2949deea0adefe82d933c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/drm/libdrm_2.4.113.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.113.bb b/meta/recipes-graphics/drm/libdrm_2.4.113.bb
index 959ef68032..613d3430ce 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.113.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.113.bb
@@ -39,7 +39,7 @@ PACKAGECONFIG[manpages] = "-Dman-pages=enabled,-Dman-pages=disabled,libxslt-nati
 
 ALLOW_EMPTY:${PN}-drivers = "1"
 PACKAGES =+ "${PN}-tests ${PN}-drivers ${PN}-radeon ${PN}-nouveau ${PN}-omap \
-             ${PN}-intel ${PN}-exynos ${PN}-kms ${PN}-freedreno ${PN}-amdgpu \
+             ${PN}-intel ${PN}-exynos ${PN}-freedreno ${PN}-amdgpu \
              ${PN}-etnaviv"
 
 RRECOMMENDS:${PN}-drivers = "${PN}-radeon ${PN}-nouveau ${PN}-omap ${PN}-intel \
@@ -52,7 +52,6 @@ FILES:${PN}-nouveau = "${libdir}/libdrm_nouveau.so.*"
 FILES:${PN}-omap = "${libdir}/libdrm_omap.so.*"
 FILES:${PN}-intel = "${libdir}/libdrm_intel.so.*"
 FILES:${PN}-exynos = "${libdir}/libdrm_exynos.so.*"
-FILES:${PN}-kms = "${libdir}/libkms*.so.*"
 FILES:${PN}-freedreno = "${libdir}/libdrm_freedreno.so.*"
 FILES:${PN}-amdgpu = "${libdir}/libdrm_amdgpu.so.* ${datadir}/${PN}/amdgpu.ids"
 FILES:${PN}-etnaviv = "${libdir}/libdrm_etnaviv.so.*"
-- 
2.25.1


