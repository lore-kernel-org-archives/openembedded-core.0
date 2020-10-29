Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.3075.1604001817667990530
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2020 13:03:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sXXnDlh2;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id m13so4114057wrj.7
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2020 13:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=As/A/NimAzUb/Am5BVa6wR90IV5K2PNPaHD7aKdaSJQ=;
        b=sXXnDlh2m2yvfoQCLiQFELl20J7kzOsYWpoDnx7mP5t7GFaEM9SHdGfSmYUeLTVWO+
         n6eGkffxnYEan6UiXjur2En5hfhC7vsJIXTI0NMNc8mETjPGmwQHdTriF0xh2iZaZP9D
         8AApBKx4mR6vu3X0MBPENiv4DG5l0AXo65SvmqJ3Dy2MdV+d4tY55WgUoril4Zf1cACs
         bPJy0d++GYhdJJ9hJQx2n5ZhkvF8iDaCfUnuPao1EdnguDiLNEs91MS3Y6XwB/WzdVXB
         nUf9/zNlc/S7JHu/6/rFr0dL/EIO00srciIuTvuXx+K/bJjUcJaJ3DVOYMFF7YKnPO+j
         EY8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=As/A/NimAzUb/Am5BVa6wR90IV5K2PNPaHD7aKdaSJQ=;
        b=NTfxWRDONY9zh5jULRoiRGM4skV/k7rN2sxjQ+3FjcRnO1pZxyQuDV9XF+erC8fFHd
         NQbWIlf1EjcFbJ5w125BrDV4qeOX2MIw2G21Y7C9KcvGB910ecJ2zwhUPQjSrGZ79fxk
         dKE2AftHSAtjCq+tYrZagZuEcHBeNEIy8lg7Gkh/unm2HSEXtj3Iuw8WtVmo+d9uQ+cT
         O9Ge9KAA8QtzF24cURFAFg/57hOvQaft8kIbOWqVbSu9ydqXIt3kstUF2ecvsse8KMm1
         rfDrFaUZVutDZQY1D/P7hjzvTC7u4YSQW4IkLAyp7N23Ii3+DQ5cgiRkskX5EodbLANk
         I7XQ==
X-Gm-Message-State: AOAM532OqOS+b5xbVejBz89CNZwNjCbXwm9bHDatpgShWEVqngZq3kbb
	+AoTl1aN90CKRJvKDXzXxVJa7nk04MsGlg==
X-Google-Smtp-Source: ABdhPJyIOLu7mwt35GSN00nYx83UsonCDkswrwNnVYYal+vippgm+DN5JklLcMEmTBzfNMMz6zoxtQ==
X-Received: by 2002:adf:8462:: with SMTP id 89mr7714794wrf.389.1604001816078;
        Thu, 29 Oct 2020 13:03:36 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id b63sm1519422wme.9.2020.10.29.13.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 13:03:35 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v5 5/6] spirv-tools: fix identation and cleanup install append
Date: Thu, 29 Oct 2020 20:03:20 +0000
Message-Id: <20201029200321.1886511-5-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201029200321.1886511-1-quaresma.jose@gmail.com>
References: <20201029200321.1886511-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- replace tabs with spaces and remove extra spaces
- remove extra slash from '${D}/' on install append

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta/recipes-graphics/spir/spirv-tools_git.bb | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-graphics/spir/spirv-tools_git.bb b/meta/recipes-graphics/spir/spirv-tools_git.bb
index d1c2436cd9..0b54706974 100644
--- a/meta/recipes-graphics/spir/spirv-tools_git.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_git.bb
@@ -9,12 +9,12 @@ SECTION = "graphics"
 S = "${WORKDIR}/git"
 DEST_DIR = "${S}/external" 
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;name=spirv-tools \
-	git://github.com/KhronosGroup/SPIRV-Headers.git;name=spirv-headers;destsuffix=${DEST_DIR}/spirv-headers \
-	git://github.com/google/effcee.git;name=effcee;destsuffix=${DEST_DIR}/effcee \
-	git://github.com/google/re2.git;name=re2;destsuffix=${DEST_DIR}/re2 \
-	git://github.com/google/googletest.git;name=googletest;destsuffix=${DEST_DIR}/googletest \
-        file://0001-Respect-CMAKE_INSTALL_LIBDIR-in-installed-CMake-file.patch \
-        file://0001-Avoid-pessimizing-std-move-3124.patch \
+           git://github.com/KhronosGroup/SPIRV-Headers.git;name=spirv-headers;destsuffix=${DEST_DIR}/spirv-headers \
+           git://github.com/google/effcee.git;name=effcee;destsuffix=${DEST_DIR}/effcee \
+           git://github.com/google/re2.git;name=re2;destsuffix=${DEST_DIR}/re2 \
+           git://github.com/google/googletest.git;name=googletest;destsuffix=${DEST_DIR}/googletest \
+           file://0001-Respect-CMAKE_INSTALL_LIBDIR-in-installed-CMake-file.patch;destsuffix=${DEST_DIR}/effcee \
+           file://0001-Avoid-pessimizing-std-move-3124.patch \
 "
 SRCREV_spirv-tools = "c413b982c316b14e784f50d941814fc737b55b4a"
 SRCREV_spirv-headers = "af64a9e826bf5bb5fcd2434dd71be1e41e922563"
@@ -28,9 +28,9 @@ EXTRA_OECMAKE += "-DSPIRV_WERROR=OFF"
 
 do_install_append() {
 	install -d ${D}/${includedir}/spirv
-	install -m 0644 ${DEST_DIR}/spirv-headers/include/spirv/1.2/* ${D}/${includedir}/spirv	
+	install -m 0644 ${DEST_DIR}/spirv-headers/include/spirv/1.2/* ${D}${includedir}/spirv
 	install -d ${D}/${includedir}/spirv/unified1
-	install -m 0644 ${DEST_DIR}/spirv-headers/include/spirv/unified1/* ${D}/${includedir}/spirv/unified1
+	install -m 0644 ${DEST_DIR}/spirv-headers/include/spirv/unified1/* ${D}${includedir}/spirv/unified1
 }
 
 FILES_SOLIBSDEV = ""
-- 
2.29.1

