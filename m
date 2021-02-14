Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.14667.1613292548504143578
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Feb 2021 00:49:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rfP2UcGu;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id x136so2371445pfc.2
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Feb 2021 00:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QPGT80F/OFuvnntLDNl6+eEF1CcCOGZn+ZcTwuxxzbU=;
        b=rfP2UcGu5bXwAa2YlwVf0kWQlHp3b77pRTbLlj+YdsQpSjV0mI4PP5ZdxuOGKJb/hk
         gWrG+ALDkIlPx8EszCaGp+m6vr+vQ5PNyrZ2HaiYPdsi3cGj3dZ3ixj4zqCPqUs4tk4+
         f99kpbgJEjvezXu1dDi9VIbryTFg0ZUkKUlOeBKH1payrb23jsM+mnf8IHwrM/6/xXWb
         s1HJs/Ixu5MUKRnBDYkuOL98p2TQzz672XlZ07WOMlxTUKirpeH4aXBfolx7c0iPA+X4
         uONfWIN0igXOTmcGyBuCLWW26e9fNxOTZTwGe561NC1tysQoKhdl/u5Dmc5kiIc22Yyz
         jOpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QPGT80F/OFuvnntLDNl6+eEF1CcCOGZn+ZcTwuxxzbU=;
        b=qiUJH6XEsxzk1FBtGqi/GII0vv0jwFyW2GvPUgSMjTlWCbF40U1dxyGCa2FUDFgHAV
         UUB4xaLDRlT+HwSftC1Q8Iext/iER/KgyNi/NCQJ3Wz6Ixfug8X1ZUos+A5hyA/IJv91
         hXOk+PVPbmbePwZ/+FEVsf3mL2FOH01Y1Cbv9mcj6f7B6dKx/ukbEhII5h11052mHxmD
         V/fy3Kqcko61AfkaBwzYfwXrQOWzkkUPRidI114AD+3/gyy9DKQ4VhVHa2gotkUViaWb
         pOGgusBqNX5P/n55oHwweX7BBjwngi3jfgCkH+mjwUmnLJU3LIKNDx/k4H0iMnsvEj4R
         1WKg==
X-Gm-Message-State: AOAM531GCwXRbGIU7aoE29sfv5972q6LsNRALOk2BKxczqvQ4dOKr5tP
	YOcIiOoO40opdBwtNCBULdYLHAYiSYvycw==
X-Google-Smtp-Source: ABdhPJxQheQ4D+yGHiz3mdCKrN/RiwUPk7/7UcSrJ9poSh+miBF6DsIpjivzkZunkFdyrU4WWxMoJg==
X-Received: by 2002:aa7:93b2:0:b029:1eb:cc3d:786b with SMTP id x18-20020aa793b20000b02901ebcc3d786bmr3031518pff.14.1613292547790;
        Sun, 14 Feb 2021 00:49:07 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::3857])
        by smtp.gmail.com with ESMTPSA id n1sm14296445pfd.212.2021.02.14.00.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Feb 2021 00:49:07 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] go: Update to 1.15.8
Date: Sun, 14 Feb 2021 00:49:05 -0800
Message-Id: <20210214084905.3353606-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/go/go-1.15.inc                          | 4 ++--
 ...{go-binary-native_1.15.6.bb => go-binary-native_1.15.8.bb} | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-binary-native_1.15.6.bb => go-binary-native_1.15.8.bb} (83%)

diff --git a/meta/recipes-devtools/go/go-1.15.inc b/meta/recipes-devtools/go/go-1.15.inc
index abe74e5eb7..7c8190f68c 100644
--- a/meta/recipes-devtools/go/go-1.15.inc
+++ b/meta/recipes-devtools/go/go-1.15.inc
@@ -1,7 +1,7 @@
 require go-common.inc
 
 GO_BASEVERSION = "1.15"
-PV = "1.15.6"
+PV = "1.15.8"
 FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
@@ -16,4 +16,4 @@ SRC_URI += "\
     file://0007-cmd-go-make-GOROOT-precious-by-default.patch \
     file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
 "
-SRC_URI[main.sha256sum] = "890bba73c5e2b19ffb1180e385ea225059eb008eb91b694875dd86ea48675817"
+SRC_URI[main.sha256sum] = "540c0ab7781084d124991321ed1458e479982de94454a98afab6acadf38497c2"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.15.6.bb b/meta/recipes-devtools/go/go-binary-native_1.15.8.bb
similarity index 83%
rename from meta/recipes-devtools/go/go-binary-native_1.15.6.bb
rename to meta/recipes-devtools/go/go-binary-native_1.15.8.bb
index 622557ad2b..df697e2781 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.15.6.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.15.8.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
 PROVIDES = "go-native"
 
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "3918e6cc85e7eaaa6f859f1bdbaac772e7a825b0eb423c63d3ae68b21f84b844"
-SRC_URI[go_linux_arm64.sha256sum] = "f87515b9744154ffe31182da9341d0a61eb0795551173d242c8cad209239e492"
+SRC_URI[go_linux_amd64.sha256sum] = "d3379c32a90fdf9382166f8f48034c459a8cc433730bc9476d39d9082c94583b"
+SRC_URI[go_linux_arm64.sha256sum] = "0e31ea4bf53496b0f0809730520dee98c0ae5c530f3701a19df0ba0a327bf3d2"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
-- 
2.30.1

