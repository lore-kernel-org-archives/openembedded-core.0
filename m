Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web12.1891.1597171742617344235
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2020 11:49:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=furNuE8c;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 128so7140930pgd.5
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2020 11:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=i2bK+IPYs6zl1vf4GKqqoZ7ZTRu6uxVfnkDBYUm5pH8=;
        b=furNuE8c2qbRTtZ8bZg9rS3sXtGjcIdFHgq09lM5Xgjg0ohB6vmzNmR4uKziX6ondd
         S2TK3hGND2GDZl3r9cAAMMiWZkptBQ80kGijbhOM2eeezcGc2W5UZDTDKxxl1dvUH+s/
         7l2umUFSaSP7y7fiXXrlQFdwLhwwrFjggEZqH2Sbn9AiTTQCCrKzS46zu3m9JHceHd/z
         TAr1D735q86XpfOkXJQUf7JVoflhAHfGXbtE3dGlRj3s7d1LSyoiOLlh/Ye3Uvoxph+X
         rtwL8f2HtvVSlpckBXQsZolTo449ktkQRP6y9cgFqMie/Jt4lEjC6mX92wv57w1iaCDX
         xVyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=i2bK+IPYs6zl1vf4GKqqoZ7ZTRu6uxVfnkDBYUm5pH8=;
        b=VE+9ogq4FBCQeZRdF4LvlKYX7yb9Xd5kbNNQNpPw2AdC++UO+xTaBqEJrGon6OwbiI
         OUvHpLnxhM4UFEEppVrrP1vxe1PftUDcGTtwMPqShwf1qd8QZHog9lqRoBg062CjOs0U
         nAzJK57iK1v1AeWHVieH1pqUVbinJ/VLwDeK1LIbNlgwgGLwTFk/S/jrp+YCIHND7gZ0
         qOK2mHfBnTxkxvSB31eNPwVe2sWEGCx7QOa0Hk65vceyKAhb1/FNT78vDg/jeXI56xAf
         j946nl411soffWWdaIDjda3ikV8+8xbtl4tHhWApVxFWhRhUzUWzXu9P6fY7JGNymmRP
         RifQ==
X-Gm-Message-State: AOAM533XeW3jJDiG/7jUKmk8zB1ldVWlgfmJRcT9u+Ps3dZ3qBaVLjvp
	BIEw3LyDRekJQylRPFh2IN0NScpBkaI=
X-Google-Smtp-Source: ABdhPJxC+CwakzgcNgIoWAnxmPqatC6FQTtwIuOFUbs3Mj8OcjiZHGEqgz7qZwuANzmQ4zpQeVPmUg==
X-Received: by 2002:a63:b349:: with SMTP id x9mr1999130pgt.184.1597171741722;
        Tue, 11 Aug 2020 11:49:01 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id g14sm21448127pgi.46.2020.08.11.11.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2020 11:49:01 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Li Zhou <li.zhou@windriver.com>
Subject: [PATCH] go: Upgrade to 1.14.7
Date: Tue, 11 Aug 2020 11:48:58 -0700
Message-Id: <20200811184858.2654767-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CVE_CHECK_WHITELIST += "CVE-2020-16845"

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Li Zhou <li.zhou@windriver.com>
---
 meta/recipes-devtools/go/go-1.14.inc                          | 4 ++--
 ...{go-binary-native_1.14.6.bb => go-binary-native_1.14.7.bb} | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-binary-native_1.14.6.bb => go-binary-native_1.14.7.bb} (83%)

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index 64c2768f7e..8f8ed89de8 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -1,7 +1,7 @@
 require go-common.inc
 
 GO_BASEVERSION = "1.14"
-GO_MINOR = ".6"
+GO_MINOR = ".7"
 PV .= "${GO_MINOR}"
 FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
 
@@ -18,4 +18,4 @@ SRC_URI += "\
     file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
 "
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
-SRC_URI[main.sha256sum] = "73fc9d781815d411928eccb92bf20d5b4264797be69410eac854babe44c94c09"
+SRC_URI[main.sha256sum] = "064392433563660c73186991c0a315787688e7c38a561e26647686f89b6c30e3"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.14.6.bb b/meta/recipes-devtools/go/go-binary-native_1.14.7.bb
similarity index 83%
rename from meta/recipes-devtools/go/go-binary-native_1.14.6.bb
rename to meta/recipes-devtools/go/go-binary-native_1.14.7.bb
index 694c597a72..3452ca46d4 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.14.6.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.14.7.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
 PROVIDES = "go-native"
 
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "5c566ddc2e0bcfc25c26a5dc44a440fcc0177f7350c1f01952b34d5989a0d287"
-SRC_URI[go_linux_arm64.sha256sum] = "291bccfd7d7f1915599bbcc90e49d9fccfcb0004b7c62a2f5cdf0f96a09d6a3e"
+SRC_URI[go_linux_amd64.sha256sum] = "4a7fa60f323ee1416a4b1425aefc37ea359e9d64df19c326a58953a97ad41ea5"
+SRC_URI[go_linux_arm64.sha256sum] = "fe5b6f6e441f3cb7b53ebf1a010bbebcb720ac98124984cfe2e51d72b8a58c71"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
-- 
2.28.0

