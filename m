Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.14022.1602945013817346530
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Oct 2020 07:30:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HSdayJSe;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id i1so6653259wro.1
        for <openembedded-core@lists.openembedded.org>; Sat, 17 Oct 2020 07:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Jf2giIiqGi4e8WPDrfWQOM2WAMsQdRiLRXWnblElVF8=;
        b=HSdayJSemFBqmdn1GKsGeq2jnW9CGJ+mvTH4UNVQSIGtSSU9IHZU9N2awgQhdMY3FO
         4wVZyTmr3+2tNoEUjEU6Id5VTF4cZMS42629Kv3IyAhk+sdPIF4ckNbi017F/0wsvrx9
         n76rEzb4OqTZdytvHG3ZyL/iWmdaEdBLAJu6eeSvYmr6hjWNksiz7nRlZw/nlVFtU9UC
         nGdGbzsC7E1tGv/cjNo7+zX5HjDxb47OzCixmsJf4z/q+iqkHiazRcvdcwCRQ8R2g24a
         iymEqJJ7lgLDhguDtiu6LVHfUgAudnE5Vz+KeYFvrkVJx2/csLvB/p696bweZ+zoYIrF
         TN5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Jf2giIiqGi4e8WPDrfWQOM2WAMsQdRiLRXWnblElVF8=;
        b=JaVggbbWYB6eAHMc87hT9vMz6bX8fm4bzAoqrOjS1553k4md7n80x8NX1ohVs49yoc
         1duv8IBJ722pB0G+I2MN3X2UVIFa2W+ONF1xKTt4Fps6xhHnx1Na5YJjK/vl8NTsDdFL
         x1Kn6tinUOVmbfLNZ4nG5ZehNyGqXw9Et4bzAJGP3E+bLGnMo79Ngd1TisbHiEO0qQlH
         q4GiniwT+s9bnfNinnlLcx97HGNtZWXM+S5d81lVJ9ENyYSlw8mrmy+FF4Sizp+VtmQ3
         AMYUibzFK+B76KbraMItz5+pJEvtvphyi2W2tRM60Rznn04CdjnIOt5SOXjuwhCiZRot
         j0Wg==
X-Gm-Message-State: AOAM530hV0v8B28cLvXJ70qhclsXt/FqlQrzNe6QmjuPPaU1g0JAZXg3
	w0QVoRFhahr0wGp4/7g54LXx5rjbzbKFKA==
X-Google-Smtp-Source: ABdhPJxISqur9+Jyn2s0W42Aj2S/UlUG3K7dIWgdmkegZMdtUVu3XfzSRcg87Kv1xgAPldWpH69C1A==
X-Received: by 2002:adf:bc0f:: with SMTP id s15mr10155467wrg.83.1602945012211;
        Sat, 17 Oct 2020 07:30:12 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id c18sm8816700wrq.5.2020.10.17.07.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2020 07:30:11 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v3 5/5] spirv-tools: fix identation
Date: Sat, 17 Oct 2020 15:29:35 +0100
Message-Id: <20201017142935.3605756-5-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201017142935.3605756-1-quaresma.jose@gmail.com>
References: <20201017142935.3605756-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

replace tabs with spaces and remove extra spaces

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta/recipes-graphics/spir/spirv-tools_git.bb | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-graphics/spir/spirv-tools_git.bb b/meta/recipes-graphics/spir/spirv-tools_git.bb
index d1c2436cd9..8c4d4299ed 100644
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
@@ -27,10 +27,10 @@ inherit cmake python3native
 EXTRA_OECMAKE += "-DSPIRV_WERROR=OFF"
 
 do_install_append() {
-	install -d ${D}/${includedir}/spirv
-	install -m 0644 ${DEST_DIR}/spirv-headers/include/spirv/1.2/* ${D}/${includedir}/spirv	
-	install -d ${D}/${includedir}/spirv/unified1
-	install -m 0644 ${DEST_DIR}/spirv-headers/include/spirv/unified1/* ${D}/${includedir}/spirv/unified1
+    install -d ${D}/${includedir}/spirv
+    install -m 0644 ${DEST_DIR}/spirv-headers/include/spirv/1.2/* ${D}/${includedir}/spirv
+    install -d ${D}/${includedir}/spirv/unified1
+    install -m 0644 ${DEST_DIR}/spirv-headers/include/spirv/unified1/* ${D}/${includedir}/spirv/unified1
 }
 
 FILES_SOLIBSDEV = ""
-- 
2.28.0

