Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67730C4332F
	for <webhook@archiver.kernel.org>; Thu, 21 Oct 2021 08:41:05 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.6736.1634805664315290820
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Oct 2021 01:41:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ksBkxMfd;
 spf=pass (domain: gmail.com, ip: 209.85.221.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id e12so127420wra.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Oct 2021 01:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TBFXLQuhjjlOeNZqPu65PQQCg61QjZe1LqRD+EW9JY4=;
        b=ksBkxMfdCf8EuWRAvShCDqJ3C8co0T4/uzhIZbMJ75BC3VC8L1qyAw9BHFHGTyuMWf
         aDHlvhIBofVxz9VM0Nci54SCeIjeOGlhgbIhYe33J4aMwyEuYSLPFP9wMNdjARARNkwF
         g09c4ec9d5J+TMDq8CPWHopUIgBlrfx+dZSOwmKeDC58tkvx9AccvVKYn9hKSCH497zX
         sQYKus0cjAce2RDKoshBiHCgWyBMuWtr+FbobZ6GPZrCgSzAt0Al0epKHb+o0kxod3gD
         VjbyKOo7arOndg0D+S5RcK8aWGzXyq0l/scG7HkiIwUekHLwVKspuvlyGCiuSdEYVgOK
         z49w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TBFXLQuhjjlOeNZqPu65PQQCg61QjZe1LqRD+EW9JY4=;
        b=YEBNK9hUQMbzVVC1hxQ8obEECYabCuR5QmGe7gYEisGeEPTPssROoBBXoarLUjp/+C
         /YHeUh6i+WkE03tLMX79sjX/wWlRMpu+Ser6LO7Mn/EjX/3+7JCv/W6S3j3X8HSDVQHh
         0TrIwy2FVDDcnq2iCoKbtJUpab7MDpnrvefU8pJAFzoqr5GajDpqRTPR91ZcZV5pmUpn
         1VQd825qZPi6IARLyU4rGeipcM3PyLSI2en+KsxUOrzZjSwwrZ05EiaNb23SP4vGIIoW
         0fFj2FHmC8SX/CRYQEFzk3hC5XUZdN/Ekwd+ggxpleFK4/nk7eoAsmBtSbaKt+En3VsL
         DAnQ==
X-Gm-Message-State: AOAM532rf5UQRX/pkHY6UPeFDq0HeufMXZdoe3jP+lZ+9CIFgpgE6ds/
	RGkxyuXVvDfCGNQC3mZ/SO6gk0PKgOY=
X-Google-Smtp-Source: 
 ABdhPJxCKYIhO3k25iqXohwEZPOKoPd0hx6CWBckjQUIV0lPaJAZNd45V0wwViQvMjF2r43y4Gc7uA==
X-Received: by 2002:adf:f10c:: with SMTP id r12mr5708246wro.298.1634805662359;
        Thu, 21 Oct 2021 01:41:02 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 25sm7384126wmo.18.2021.10.21.01.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 01:41:02 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/2] waffle: convert to git, website is down
Date: Thu, 21 Oct 2021 10:40:58 +0200
Message-Id: <20211021084059.977697-1-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Oct 2021 08:41:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157278

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-graphics/waffle/waffle_1.6.1.bb | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-graphics/waffle/waffle_1.6.1.bb b/meta/recipes-graphics/waffle/waffle_1.6.1.bb
index 395494018a..161bbb0d26 100644
--- a/meta/recipes-graphics/waffle/waffle_1.6.1.bb
+++ b/meta/recipes-graphics/waffle/waffle_1.6.1.bb
@@ -3,17 +3,15 @@ DESCRIPTION = "A cross-platform C library that allows one to defer selection \
 of an OpenGL API and window system until runtime. For example, on Linux, Waffle \
 enables an application to select X11/EGL with an OpenGL 3.3 core profile, \
 Wayland with OpenGL ES2, and other window system / API combinations."
-HOMEPAGE = "http://www.waffle-gl.org/"
+HOMEPAGE = "https://gitlab.freedesktop.org/mesa/waffle"
 BUGTRACKER = "https://gitlab.freedesktop.org/mesa/waffle"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4c5154407c2490750dd461c50ad94797 \
                     file://include/waffle/waffle.h;endline=24;md5=61dbf8697f61c78645e75a93c585b1bf"
 
-SRC_URI = "http://waffle-gl.org/files/release/${BPN}-${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "c91529e579483f44fb330052872b9c73"
-SRC_URI[sha256sum] = "31565649ff0e2d8dff1b8f7f2264ab7a78452063c7e04adfc4ce03e64b655080"
-
-UPSTREAM_CHECK_URI = "http://www.waffle-gl.org/releases.html"
+SRC_URI = "git://gitlab.freedesktop.org/mesa/waffle.git;protocol=https;branch=maint-1.6"
+SRCREV = "d7e8c4759704b3c571fa3697c716279c26fd05eb"
+S = "${WORKDIR}/git"
 
 inherit meson features_check lib_package bash-completion pkgconfig
 
-- 
2.20.1


