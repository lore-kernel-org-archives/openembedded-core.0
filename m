Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.23497.1612721115245222025
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Feb 2021 10:05:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=L0vsPpne;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id u14so11110980wmq.4
        for <openembedded-core@lists.openembedded.org>; Sun, 07 Feb 2021 10:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mTexGQZoOSEpJ8G3iyqpDFQr85O71xGj6CWqwWo0AIw=;
        b=L0vsPpne6i1yXNyxCvRdk2esfAvm2uATE7u0LpM0diW2U86DlDUWQIAxVRAcix8UTD
         2cSv/vsB1IHdnYRYBumCRC0beWZlfORFbvUtcwCWNKMLtjXCKyP0Q9ud4rL4I6YqPsxP
         97uFog2AFfLu35kgvyprkz7QGdGX5EYVTK1sLzMs0MsdDjaJ9JL/d3D7F3h5jZilg49c
         D02UshHCZhdgIs2NdudBNsdxNruler1dI20ZY35N/ZBu9vsbjPBWwjN7o4VZK+1aGded
         7wXCUGKqeU2sHSe5iB9u2aMw94OcAooNDk2QpOIoreL7CKKaG8+sTw/qLHK7dofUlzo+
         G4Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mTexGQZoOSEpJ8G3iyqpDFQr85O71xGj6CWqwWo0AIw=;
        b=C1H6XRBK7ZepcT9PjtfqfMnZtkRzjsEzoacNfZYrFbJ8K9JGLaBSgEG+697GNG1Tit
         OWUGb+b+3kQceagMRMH8Uef4DfgSsElzGUHzCXSgwpuYba37oYnjjgAfLUUaOn8FLX8r
         s1h097fXNt8KI5tkfl506ii07fEy89SxtJTh+RMIsSaF3/FnvMdvNP2YL7j7UsTNmZPs
         svIbFw93stBAvrOqkZ5RumZQRfuGqD+OYTEKqe9sEMHcW3c/BoFiHZjhqmdr/NK4LorT
         xSnKo6bCcsmDaQMSSGPHmoEXq5hokxcJNGDIQaqsev8Y1/gWpIR1OlGMvic4rYLKAzGk
         j8sg==
X-Gm-Message-State: AOAM533nQJWvR+AeS+aoD5FR3TUUPZUM9b47zk1PA1DcvdE/K+wwuFIt
	w0gCwtOSR0q9Hxdy/JX0k1UZeXrejHc98w==
X-Google-Smtp-Source: ABdhPJx0x9U1CLI7Q/9sdfMlkIG0U3FkwUkGCbc1RJ5WBVmi/AUNZl809qrEw1Pp0CO61LM7/3HRfA==
X-Received: by 2002:a1c:8157:: with SMTP id c84mr11851899wmd.24.1612721113837;
        Sun, 07 Feb 2021 10:05:13 -0800 (PST)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id n9sm24045112wrq.41.2021.02.07.10.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Feb 2021 10:05:13 -0800 (PST)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v2 3/3] shaderc: remove the glslang-native from dependencies
Date: Sun,  7 Feb 2021 18:05:04 +0000
Message-Id: <20210207180504.1552900-3-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210207180504.1552900-1-quaresma.jose@gmail.com>
References: <20210207180504.1552900-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- glslang now provides pkg-config, so use it

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta/recipes-graphics/shaderc/shaderc_2020.4.bb | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-graphics/shaderc/shaderc_2020.4.bb b/meta/recipes-graphics/shaderc/shaderc_2020.4.bb
index c7982dd815..94a6b081f4 100644
--- a/meta/recipes-graphics/shaderc/shaderc_2020.4.bb
+++ b/meta/recipes-graphics/shaderc/shaderc_2020.4.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://github.com/google/shaderc.git;protocol=https;branch=main \
 UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+)$"
 S = "${WORKDIR}/git"
 
-inherit cmake python3native
+inherit cmake python3native pkgconfig
 
 DEPENDS = "spirv-headers spirv-tools glslang"
 
@@ -25,17 +25,12 @@ EXTRA_OECMAKE = " \
     -DSHADERC_SKIP_EXAMPLES=ON \
 "
 
-BBCLASSEXTEND = "native nativesdk"
-
-# TODO: probably there is better solution for this.
-# I don't know any method for get the version of a receipe in DEPENDS,
-# so do this ugly hack
-inherit pkgconfig
-DEPENDS += "glslang-native"
 do_configure_prepend() {
     cat <<- EOF > ${S}/glslc/src/build-version.inc
 "${PV}\\n"
 "$(pkg-config --modversion SPIRV-Tools)\\n"
-"$(glslangValidator --version | head -1 | cut -d' ' -f3)\\n"
+"$(pkg-config --modversion glslang)\\n"
 EOF
 }
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.30.0

