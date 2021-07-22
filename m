Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web12.1168.1626993915118786475
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jul 2021 15:45:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Bhneu+zr;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id l4so361209wrs.4
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jul 2021 15:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a+DprsjLoby2OyZclkOxjnfQgDpfNXdsjD0Dmxx6lxc=;
        b=Bhneu+zrW8O9rSYaJbVYpWcDVM2bZO2DmpOhoi3cywT8sKgjrrtj+fMD3Dx6domvWC
         W0HbIaNtd710sMzcRMtEQNJ84LaK/7x11wgd2agr+BHqem1rXhA2s/AMw/GxCaVNeREA
         snUA89NAG+ez8WFG23aUwNkZcLw4vTsCZ1l1NIsiKb6apBNtn4aCDxOZNv2xJxiKjExD
         TBA/FT3Z9ciIqSB58wIKArvgglH0hJdllcCiKFKebexHbZkqE9D1mlN+qk9HGY5gtAld
         MAfCleMh47/ESY5UIxPIigEwD8RFQrrvp/pn44+OFOoy9Gl5Q6POb0+25Vp/4RSmciad
         5y8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a+DprsjLoby2OyZclkOxjnfQgDpfNXdsjD0Dmxx6lxc=;
        b=SLSeY6xLxo+seDv4zjzQVuwPqwtUu/Q6Z0RsLhpH/cIE5eHC6OGqwkWKxzprVeb02D
         9UqhMFWkCqy2ZxhG9PNb/Pucpl2X7oj7Rltn3bCC44XgWQ+TLwGNHyPF8/LlBtiUS0ys
         U8Bu+sT0Izfyv3DYSSjcDDMT1O5wl4e607o06wjIx9MiSWhZIQwSmwngKO6dtGYN7KB9
         C6ul1zXBRkNiV/KH5NWp2oKMV1DrfxMCCMzPX8s8PUaYaKqt23o4qQrsMlLdxd7/STcQ
         ng8dzWKN7W6jWkI31oZ+LTgHLye5D1UJOPAAOB9aT8ZIRnUBezxTnzyvXMQt7pwtmiUW
         Uzsg==
X-Gm-Message-State: AOAM531EayeAwAIyEdZwyDx6kvjNA8XuYskJXdW3D+TuP30P39MIyCbk
	lm05KjIBbfke+BuY/GroAQ28sF1w3c1CpQ==
X-Google-Smtp-Source: ABdhPJwDkq2qA0GmLA8PX1g97qWvvudg88l+7YCcL4A+tLTEr0VNtk1pcfBK9WJA1Mwgcumj9x2Kbw==
X-Received: by 2002:a5d:4a0b:: with SMTP id m11mr2196182wrq.210.1626993913593;
        Thu, 22 Jul 2021 15:45:13 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id n5sm24337739wrp.80.2021.07.22.15.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jul 2021 15:45:13 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 1/8] llvm: update 12.0.0 -> 12.0.1
Date: Fri, 23 Jul 2021 00:45:01 +0200
Message-Id: <20210722224508.51967-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Other than the tcmode tweak, this was done by devtool \0/

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc | 2 +-
 meta/recipes-devtools/llvm/llvm_git.bb      | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 68e5d848ba..1d4aa1e11f 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -26,7 +26,7 @@ QEMUVERSION ?= "6.0%"
 GOVERSION ?= "1.16%"
 # This can not use wildcards like 8.0.% since it is also used in mesa to denote
 # llvm version being used, so always bump it with llvm recipe version bump
-LLVMVERSION ?= "12.0.0"
+LLVMVERSION ?= "12.0.1"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
 PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?= "${GCCVERSION}"
diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index de79adc410..4554b752eb 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -19,7 +19,7 @@ inherit cmake pkgconfig
 
 PROVIDES += "llvm${PV}"
 
-PV = "12.0.0"
+PV = "12.0.1"
 
 MAJOR_VERSION = "${@oe.utils.trim_version("${PV}", 1)}"
 
@@ -27,7 +27,7 @@ LLVM_RELEASE = "${PV}"
 LLVM_DIR = "llvm${LLVM_RELEASE}"
 
 BRANCH = "release/${MAJOR_VERSION}.x"
-SRCREV = "fa0971b87fb2c9d14d1bba2551e61f02f18f329b"
+SRCREV = "fed41342a82f5a3a9201819a82bf7a48313e296b"
 SRC_URI = "git://github.com/llvm/llvm-project.git;branch=${BRANCH} \
            file://0006-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch;striplevel=2 \
            file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
-- 
2.31.1

