Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
 by mx.groups.io with SMTP id smtpd.web10.54080.1600060765905310570
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Sep 2020 22:19:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GUl7ifet;
 spf=pass (domain: gmail.com, ip: 209.85.210.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f195.google.com with SMTP id v196so11733674pfc.1
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Sep 2020 22:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=90lsw4oVDD+g/GNS+CBYsXFrufVsfaXdaLUgLrWEFcc=;
        b=GUl7ifet8KdCLa7/AwXrSkQBeq6B3+d8twuRD1Bt0sA9z3SsvD2GZsVtWeK68OCDLG
         mBFg0i22kAtV2XpaSQGDhlGLTJ1gM0w+xvv8wbkYfp58jeH4KZop/yV/Zif8q0jCvL1B
         gdwRrkePIs9TFbGvI9eq/NOkA7EnBWcS+588dOjyblD7Aq3TUIB4tlm+1496yp5fxUpA
         sbzoH9CGyRCGrPbXKVOHlT8Hkvc2jCl0GaJB+Nfoo+rnmVqo4D6dksp1vIUJafKiuhTO
         yOxKlSg9FX5gs1gHOmkieO3AasD0AQ3CKmG4b2Cm2yqLv6IWTTHpRS7X0WfhuBAYPRFI
         v6Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=90lsw4oVDD+g/GNS+CBYsXFrufVsfaXdaLUgLrWEFcc=;
        b=Xo2Zi15oSK5YCIoMa10HebKV3r1KfzQ9npmM9xGrlvnRUIsT69ZZ7ua4Oiy4VGcHOj
         C9ESCI9qt8JHn46sjCSk6niQYtiA1Zy+goWEu8cDO4yS0w+7P1a+LQoxJpzrgLkF1A7a
         /WtijePuCDuNk6N+EwZ3LeImgIW1tNeeAiqWj/k2AGJo6KCw4IqyK3JJ7mQERTkqco44
         xd/4+Rh3dBndnu9k8ygtaxk67b3AN4ESUA4bCpenwSIT7Td8Ld7DpzQNUcmrNdm5yj8Q
         Xf6QWPThZbC9vDl0XRdDQwyXZ9aTiK0yUtHElDLA4FyTiFKELGFa7M7XiI/wdRPLPVfC
         Yzmg==
X-Gm-Message-State: AOAM531C31U+zAdi1hrUzpv82K6BqFx0UX7lSlghA6gCVX3HAjToKmqo
	FvXG3IeJSMpc5F1bFzRnqJgJK9rAdwn4Cw==
X-Google-Smtp-Source: ABdhPJznOtHE3rq4Jc02DA4DRS0FroiPAmHmk5YlxROkEIPitNXX73dRWtZK9kJy7JmOtOYW3EyygA==
X-Received: by 2002:a63:413:: with SMTP id 19mr9855738pge.310.1600060764871;
        Sun, 13 Sep 2020 22:19:24 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::1759])
        by smtp.gmail.com with ESMTPSA id kf10sm7680187pjb.2.2020.09.13.22.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2020 22:19:24 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] go: Update to 1.15.2 minor release
Date: Sun, 13 Sep 2020 22:19:21 -0700
Message-Id: <20200914051921.3913331-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is bug fix release on 1.15 stable version

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/go/go-1.15.inc                          | 4 ++--
 ...{go-binary-native_1.15.1.bb => go-binary-native_1.15.2.bb} | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-binary-native_1.15.1.bb => go-binary-native_1.15.2.bb} (83%)

diff --git a/meta/recipes-devtools/go/go-1.15.inc b/meta/recipes-devtools/go/go-1.15.inc
index 48f523bb50..97d748b922 100644
--- a/meta/recipes-devtools/go/go-1.15.inc
+++ b/meta/recipes-devtools/go/go-1.15.inc
@@ -1,7 +1,7 @@
 require go-common.inc
 
 GO_BASEVERSION = "1.15"
-GO_MINOR = ".1"
+GO_MINOR = ".2"
 PV .= "${GO_MINOR}"
 FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
 
@@ -17,4 +17,4 @@ SRC_URI += "\
     file://0007-cmd-go-make-GOROOT-precious-by-default.patch \
     file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
 "
-SRC_URI[main.sha256sum] = "d3743752a421881b5cc007c76b4b68becc3ad053e61275567edab1c99e154d30"
+SRC_URI[main.sha256sum] = "28bf9d0bcde251011caae230a4a05d917b172ea203f2a62f2c2f9533589d4b4d"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.15.1.bb b/meta/recipes-devtools/go/go-binary-native_1.15.2.bb
similarity index 83%
rename from meta/recipes-devtools/go/go-binary-native_1.15.1.bb
rename to meta/recipes-devtools/go/go-binary-native_1.15.2.bb
index a4eca7f4c1..ccd2d5ebad 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.15.1.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.15.2.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
 PROVIDES = "go-native"
 
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "70ac0dbf60a8ee9236f337ed0daa7a4c3b98f6186d4497826f68e97c0c0413f6"
-SRC_URI[go_linux_arm64.sha256sum] = "ca21c771d906fbba8840b3a4831b1aa118f6e09b5d028323592faba382787a03"
+SRC_URI[go_linux_amd64.sha256sum] = "b49fda1ca29a1946d6bb2a5a6982cf07ccd2aba849289508ee0f9918f6bb4552"
+SRC_URI[go_linux_arm64.sha256sum] = "c8ec460cc82d61604b048f9439c06bd591722efce5cd48f49e19b5f6226bd36d"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
-- 
2.28.0

