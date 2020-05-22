Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.13953.1590157589685705626
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 May 2020 07:26:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=buIKGMxB;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id q8so5274872pfu.5
        for <openembedded-core@lists.openembedded.org>; Fri, 22 May 2020 07:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=thxnS9Zeqa747Rl+ILaAzc+2QXun4oQODwkO3gWaHgY=;
        b=buIKGMxBFI+A941xlfDu6LGpxLQUG0MaOd5AVX/+zgXSpV+0VXSb+OFUdpSDHBmFjC
         6bKebkel0ucdrhakxfzhxSkYmDtoXlFiHt7+Ao0E7Iszh7phGB/poGrDOSPXk2R99WxY
         txAn7/usiV3OyBfxLcFp4dkdsRgBuPWdJ3mNZkYMwUt/ZZ1C2wUiuOYQOQ38UftIMR9v
         3tkvcxh/X24Fd0pVb5HDdy1fo9iQcF30HcQsTr1L0JdLgr9lqw0U2BRMW2OuJGhsJKNr
         EhFkDkNTBBuTwU5IbBWvBRACkwdAsNiXr8mOnYFN2qaN0HGxsZ4r448naWVup5wU/qxH
         cbcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=thxnS9Zeqa747Rl+ILaAzc+2QXun4oQODwkO3gWaHgY=;
        b=Hc7Ygc3gHMbcWDgK9/+T7g+4FmC5CM4mlUMdkV8ViTis/D7tSeZEOrDPM1Ztpuxncl
         pA1tLm7HnhTOda+I7ziX9n/5+O5DdUDmMgQ1gDMankuBqxVJfpwP6utJncrJOMj6t9Mo
         h7TAgC9U6Iuk/f0at2Sv4sqOZJPXygh9MH8SGdT/xQKV2hgyePruprusS/tS67v+KsBs
         Rz8Kq2LvpEKNL8d5OWmsHWsgKPcdzYx/6Z7fbBc8yRSPoHrHwvlur6NQR3YHiZ0jyO/B
         4oXOraEJQvfxbXqJubsKYZoUFbY92oOOwR3oTSw8rc0rmgZTnhroUk1i6yq/CDtTq9dA
         BOTw==
X-Gm-Message-State: AOAM530bnougynAG2XMDjMM5IUn8FWnOwZDM5IWgv5IdpOw+zfCE8kU3
	deO3vfH3sID2URcNaY//3uACp7l/
X-Google-Smtp-Source: ABdhPJxXgqOtmwzCjDPjImpx/ifD9SgUfn2uoUlWYRsd7XzFnuJ43MvO81V2xnJV3Iym4tpYAV/07Q==
X-Received: by 2002:a63:de0c:: with SMTP id f12mr13545588pgg.172.1590157588742;
        Fri, 22 May 2020 07:26:28 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:2019:1800:ef81:a76f])
        by smtp.gmail.com with ESMTPSA id v75sm7347763pjb.35.2020.05.22.07.26.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2020 07:26:28 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [warrior 6/8] openssl: update to 1.1.1f
Date: Fri, 22 May 2020 07:26:15 -0700
Message-Id: <c74958fe05db584289ee560584190b3a0b25155d.1590157490.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1590157490.git.akuster808@gmail.com>
References: <cover.1590157490.git.akuster808@gmail.com>

From: Alexander Kanavin <alex.kanavin@gmail.com>

This also un-breaks python3 ptest which got broken
with 1.1.1e update.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b4ddf5b9d8cd769b7026663f93c8bc69b55d8cbf)
[AK: bugfix only update]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../openssl/{openssl_1.1.1e.bb => openssl_1.1.1f.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1e.bb => openssl_1.1.1f.bb} (98%)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1e.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1f.bb
similarity index 98%
rename from meta/recipes-connectivity/openssl/openssl_1.1.1e.bb
rename to meta/recipes-connectivity/openssl/openssl_1.1.1f.bb
index d016bb67e7..204dc7c6fe 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1e.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1f.bb
@@ -23,7 +23,7 @@ SRC_URI_append_class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "694f61ac11cb51c9bf73f54e771ff6022b0327a43bbdfa1b2f19de1662a6dcbe"
+SRC_URI[sha256sum] = "186c6bfe6ecfba7a5b48c47f8a1673d0f3b0e5ba2e25602dd23b629975da3f35"
 
 inherit lib_package multilib_header ptest
 
-- 
2.17.1

