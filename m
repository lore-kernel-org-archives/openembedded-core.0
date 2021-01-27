Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.930.1611706273947662363
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jan 2021 16:11:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hrM02tVj;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: dorindabassey@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id e15so86934wme.0
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Jan 2021 16:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=5bZJ/puGzLbkuYE49nPSJwLkRokwgHt8Xg8+l4L5X94=;
        b=hrM02tVj9fqSQz6/DHSpiMw+ExYVkr1tyJdQ1pRD/B5Aua5M7wFI0Zo69MJtVeqw8K
         IfN24J2yscBMPZ2W3tOpgntRpW/ppV2SUAFFK2Ec7b2lr+eycdDnZjJZFoZ89IHJOT0w
         Js60pELy6un4vxVwEfoKdYicFO6O3fi0he504iUsFH04qC5q8mmUQIneZgfv84vJrb6Y
         XRxEZmop9ClraaJ+eTb59vG1odG0PwL3xk6w1yuk1OC83PJcDTyrwp25zqiFUZtoJLAi
         PvuWeiDh4tSC36D77qkOnnlSL1Rco958w2z9y+TSAQp3K0+d4Q796hmzDJuk4IG3AAnd
         DHcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=5bZJ/puGzLbkuYE49nPSJwLkRokwgHt8Xg8+l4L5X94=;
        b=HfmggH1dqERVo8ebTpPEePcbfYAniUahpaaUke001Lvm/eXYA6rAy+QKPWzE1yepiO
         kIgqfVvU8EXRiXjsHwuqVT54xYLAmqGDEx6lKCdEcw+CrFCo+hKd5Vxq6lbkmT7DE+/8
         ls8xhfwQ3eql3xtW0SdArc0wwITfOuRZn2AaMIGaVfIWA8VGk73g4RClr2eToeZVKlDt
         6qtv7NbkJ+mbpavrdZxIsjIoTyTFK4M00qwqPGrgw0TzSketu0coml+PWdYUZhvzGDGV
         UlmVL5Ku0jw73g+jqhHMISrMm00tWinkTH9Z5vyH3VRk59GPKJv44B2+LcLQSeJNKr/l
         VV4Q==
X-Gm-Message-State: AOAM531e0Pt/DS1OX1DjF4+WevKsmVWm17ODO283U/pULRWmMTev8vg9
	PsIgDUDkYytIXP8B759RCw0UBSOZWzwSyA==
X-Google-Smtp-Source: ABdhPJxyZUluOk5nZfPacPBLFC78jZaoSF1zBbZIn4X7LGLyqRX6yx54ZUcsbKiz8M55wxuSpED9wA==
X-Received: by 2002:a1c:cc19:: with SMTP id h25mr1738594wmb.124.1611706272360;
        Tue, 26 Jan 2021 16:11:12 -0800 (PST)
Return-Path: <dorindabassey@gmail.com>
Received: from localhost.localdomain ([105.112.33.220])
        by smtp.gmail.com with ESMTPSA id b13sm509208wrt.31.2021.01.26.16.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 16:11:11 -0800 (PST)
From: "Dorinda" <dorindabassey@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: dorindabassey <dorindabassey@gmail.com>
Subject: [PATCH v3 2/3] elfutils: add PACKAGECONFIG for debuginfod
Date: Wed, 27 Jan 2021 01:10:44 +0100
Message-Id: <20210127001045.6686-2-dorindabassey@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210127001045.6686-1-dorindabassey@gmail.com>
References: <20210127001045.6686-1-dorindabassey@gmail.com>

removed the config option that disabled debuginfod and enabled it with PACKAGECONFIG

[YOCTO #13807]

Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
---
 meta/recipes-devtools/elfutils/elfutils_0.182.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.182.bb b/meta/recipes-devtools/elfutils/elfutils_0.182.bb
index 823f0cab98..79cd84a8a2 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.182.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.182.bb
@@ -34,7 +34,7 @@ SRC_URI[sha256sum] = "ecc406914edf335f0b7fc084ebe6c460c4d6d5175bfdd6688c1c78d914
 
 inherit autotools gettext ptest pkgconfig
 
-EXTRA_OECONF = "--program-prefix=eu- --disable-debuginfod"
+EXTRA_OECONF = "--program-prefix=eu-"
 
 DEPENDS_BZIP2 = "bzip2-replacement-native"
 DEPENDS_BZIP2_class-target = "bzip2"
@@ -43,6 +43,7 @@ PACKAGECONFIG ??= ""
 PACKAGECONFIG[bzip2] = "--with-bzlib,--without-bzlib,${DEPENDS_BZIP2}"
 PACKAGECONFIG[xz] = "--with-lzma,--without-lzma,xz"
 PACKAGECONFIG[libdebuginfod] = "--enable-libdebuginfod,--disable-libdebuginfod,curl"
+PACKAGECONFIG[debuginfod] = "--enable-debuginfod,--disable-debuginfod,libarchive sqlite3 libmicrohttpd"
 
 RDEPENDS_${PN}-ptest += "libasm libelf bash make coreutils ${PN}-binutils"
 
-- 
2.17.1

