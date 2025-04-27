Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7890EC369AB
	for <webhook@archiver.kernel.org>; Sun, 27 Apr 2025 03:18:35 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.20821.1745723823899444775
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Apr 2025 20:17:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QSdSaIod;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-30828fc17adso3517577a91.1
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Apr 2025 20:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745723823; x=1746328623; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GfG9KvC0Yi0ZfpFQDCzV+4Qiz1nxJ1wMHdo1gjxCHNc=;
        b=QSdSaIodTRrCGPB+UBpPjQUyAaA2HoK1y3bdPSyNXevWMM6hQte0jK5jDx61qPWzos
         HcsOQogizqz/mp5wJDULZEkR8PemHYYU1ll9igX/oZD9aBB48OwLd57yVak6UBcIW+zn
         yF3rtiN1sC0VbRpmGyZsv92K8fgBKhwwht6GYVTBQnWs/F9LmcBVwpzzvnsgqElR+sPT
         0goVjmAOT5SH6KkUYlZhlO5dNi6Li+B9PXVrAw0njAzSBR2byJEVN2rB8OLznWyYVpps
         vcJ422cPM5SmgcF765LdOZIc6Fg5/6ee37FZ9OLCCXBbrJWNZJaTVjdVT3aBrcdY9Ao2
         +CFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745723823; x=1746328623;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GfG9KvC0Yi0ZfpFQDCzV+4Qiz1nxJ1wMHdo1gjxCHNc=;
        b=bOA0Xsnw3SQmG/a7oJJRhYx4PSRGuSEGVdPU1zwBwKuAOC2C5/QeRWt3DYJBcax7QR
         rsuBm1KHi2k8KEVsVcIbtklVnCO6K0R7HGjf4LEVG5BFrrbWrxSNLcYSW2o4d8wYy/Fd
         XFJy3uECe95YVD7b5qcIVRo9yHl8yfEYdFWTy6Af7Ibv1XonRcXRibOPOlPja/p/kHTr
         Ig4uXmEIE13d2Ppd5VaVXIWfxLBhbYt1iavZwmRkPD5STbe+KIpGnSTmbRZZCZ2TsDnX
         d56fpv9QGMevvkJj2hdrkuHiE539LPNkT+MNktmT5ZazLrjSPuEYc/qDq78/otFmcDyU
         Pjiw==
X-Gm-Message-State: AOJu0Yz36KTOrLR8HFH9SqkPKPoKuben6qAEvzWU0zJxzZwv+x+tbcK5
	fcgyGJwcAEiXKYhpLwCB4JUBtemHv8e8R+wzAgn4ikiBgVrvY/lB1G9ieF2/
X-Gm-Gg: ASbGnctIIpuMHYsyUxzlTHatuAOjWah9BPrB0kjYaM2Z8fW6A+MQSETdJwO5g0RNqII
	irAWEQ3354XYiOXHNtJhe2+Oh4JeH6Bz+r/ku8K9cyR4qIktOlRPNifXBaxVsqCdRgD/keNOwm2
	73v0jZWtX3EfnP5Vj9uK6f4a+Ht1wCZ63ESJu98TV6YChnTL7WuwAdMX/koAOy1z4q7KBNY8/A6
	qwL7q735JYoHy9bNeLzJ/oEIlJfjKEsEd53u3A5DrXBEgM//+cXdsqtI5khBdmQNjz8JDGR6sr1
	KIVja2teOEIH9RIBtmd7Ulv5QKfjOOjH
X-Google-Smtp-Source: AGHT+IEZUmYpn51UNv+zb2aj/8qEhU++Lcmr9Zf/wsZBFt8H7G9wBHU/BbJCIXGDQESW56KG2fJ7bQ==
X-Received: by 2002:a17:90b:5490:b0:309:f5c6:4c5c with SMTP id 98e67ed59e1d1-30a01398884mr6820927a91.25.1745723823229;
        Sat, 26 Apr 2025 20:17:03 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ed40])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309f774e4ffsm4362452a91.12.2025.04.26.20.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 20:17:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 26 Apr 2025 20:16:47 -0700
Subject: [PATCH v4 08/10] mesa: Pass needed clang flags via
 BINDGEN_EXTRA_CLANG_ARGS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250426-clang-merge-v4-8-42d205904261@gmail.com>
References: <20250426-clang-merge-v4-0-42d205904261@gmail.com>
In-Reply-To: <20250426-clang-merge-v4-0-42d205904261@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Apr 2025 03:18:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215539

This is needed for clang to find the c++ headers when invoked via
bindgen

Fixes
| /mnt/b/yoe/master/sources/poky/build/tmp/work/cortexa57-poky-linux/mesa/25.0.2/recipe-sysroot/usr/include/llvm/ADT/DenseMapInfo.h:17:10: fatal error: 'cassert' file not found
| Unable to generate bindings: clang diagnosed error: /mnt/b/yoe/master/sources/poky/build/tmp/work/cortexa57-poky-linux/mesa/25.0.2/recipe-sysroot/usr/include/llvm/ADT/DenseMapInfo.h:17:10: fatal error: 'cassert' file not found
|

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index cd0f02c6d7b7c8de37bdb1695abc70d95f99a919..c477b774628eb49dacae8b64244d3e98bfcc2588 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -266,6 +266,10 @@ PACKAGES =+ "libegl-mesa libegl-mesa-dev \
              mesa-vdpau-drivers mesa-tools \
             "
 
+do_compile:prepend:class-target() {
+    export BINDGEN_EXTRA_CLANG_ARGS="${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} --target=${TARGET_SYS}"
+}
+
 do_install:append () {
     # libwayland-egl has been moved to wayland 1.15+
     rm -f ${D}${libdir}/libwayland-egl*

-- 
2.49.0


