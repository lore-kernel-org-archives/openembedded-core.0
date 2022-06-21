Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89ED4CCA47E
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 20:17:06 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web12.48354.1655842616604057683
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 13:16:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=H0voNW1f;
 spf=pass (domain: gmail.com, ip: 209.85.208.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id eq6so13574749edb.6
        for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 13:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eE2t4hGrkGJifTHjmcLA3zqse20uLdz0JPEz7sUQHfQ=;
        b=H0voNW1fvX8kmeK44LKi6gxeNB2AwxkiQwSPPQKfb0L1NhYkihv/Sl7A0/xd5oTzAb
         KShlE9QUXs5jW4I3sOgPkvtMYEEC0P9dc+2W1Km6zzfl+ErS56C2CPahm5IVyI7AdqIa
         ZrxNFGNsec6F/EBGhzoVJhhS2ImXFo+TAAxL5dNrmrb+g9JZixEpNOZ7DYSawFT/hk30
         MXyy7M2uiE+Oi6wF/JKlGU3PljccJuWVUtTl287HN9ar+kMVyW5iCOT+JuTiI2GNVI1A
         9ZLm7IqOwWngydXggB+AO4wlWItb4ICArr+Fk++HdmKKkR3mEtk1oEU9mXI9Huw9ugL0
         YULQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eE2t4hGrkGJifTHjmcLA3zqse20uLdz0JPEz7sUQHfQ=;
        b=0qcro6bq7STqhhP9fS/9mgV0wyHpxc3f0gjxcthySRBSQahGaBsJ6V6qrBr6kfodkL
         Fye6khMdLGSIcAdASZm/gZg9stCD6+VfhHiHsDBOY1W2NQJ+n1oYyIbk65ZK1/UcRYD4
         B2slH/Maz43Hs2t9ef+ukqNi5B0Nfhkx8blTYXiWJ52jsdod6d41/LJOiSdVAhItCchZ
         9hvwRrwiGiYnHgIBH/xTqWY1ulKxZ3iwp35Svq2mOtfv3f4SCwJai9UYyfDw1sVY+F/i
         X3F23l0246NoyoViWKs7wfarvQD8M2Po3tkv2EA1WYSfqNvQysan7acHnaBZ18FECe65
         /l1Q==
X-Gm-Message-State: AJIora+cNmvOSu3vbzenmUy0c/u60+dQvsHR/J7DIV0QgO86mNL1wPzL
	JJY948CjtXLKtYN6CNL2NnYCCl2hN2K63w==
X-Google-Smtp-Source: 
 AGRyM1t1hlzdRGxp7TAMLf7FiehK3edVu1B/LR0TX7I2o+CwtZ9EIILhYY1BcpqT+YB+VhYtilucjA==
X-Received: by 2002:aa7:cb83:0:b0:435:9170:8e3b with SMTP id
 r3-20020aa7cb83000000b0043591708e3bmr7768956edt.144.1655842615238;
        Tue, 21 Jun 2022 13:16:55 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 j8-20020a056402238800b0043590660f16sm3420890eda.35.2022.06.21.13.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 13:16:54 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 10/18] libdrm: update 2.4.110 -> 2.4.111
Date: Tue, 21 Jun 2022 22:16:29 +0200
Message-Id: <20220621201637.1378306-10-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220621201637.1378306-1-alex@linutronix.de>
References: <20220621201637.1378306-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jun 2022 20:17:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167178

libkms option dropped by upstream.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../drm/{libdrm_2.4.110.bb => libdrm_2.4.111.bb}             | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.110.bb => libdrm_2.4.111.bb} (91%)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.110.bb b/meta/recipes-graphics/drm/libdrm_2.4.111.bb
similarity index 91%
rename from meta/recipes-graphics/drm/libdrm_2.4.110.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.111.bb
index dd775939a5..17b737c556 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.110.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.111.bb
@@ -13,12 +13,11 @@ DEPENDS = "libpthread-stubs"
 SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.xz \
           "
 
-SRC_URI[sha256sum] = "eecee4c4b47ed6d6ce1a9be3d6d92102548ea35e442282216d47d05293cf9737"
+SRC_URI[sha256sum] = "1ad7164f77424de6f4ecba7c262bde196a214c6e19a6fbf497f0815f4d7ab2a9"
 
 inherit meson pkgconfig manpages
 
-PACKAGECONFIG ??= "libkms intel radeon amdgpu nouveau vmwgfx omap freedreno vc4 etnaviv install-test-programs"
-PACKAGECONFIG[libkms] = "-Dlibkms=true,-Dlibkms=false"
+PACKAGECONFIG ??= "intel radeon amdgpu nouveau vmwgfx omap freedreno vc4 etnaviv install-test-programs"
 PACKAGECONFIG[intel] = "-Dintel=true,-Dintel=false,libpciaccess"
 PACKAGECONFIG[radeon] = "-Dradeon=true,-Dradeon=false"
 PACKAGECONFIG[amdgpu] = "-Damdgpu=true,-Damdgpu=false"
-- 
2.30.2


