Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web09.4788.1615530072415303275
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Mar 2021 22:21:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Nw+J+xlm;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id 16so1157829pfn.5
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Mar 2021 22:21:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ACbt3h/IJWtEQvA1x+7RqS9quptpJJ+r54PpVMaWaYo=;
        b=Nw+J+xlmisU0rnQ7JX2aG+Ac4zhISObjoU4xEec5BdPK+XwW7gHKQciw7Lv1gCfvh5
         vZnczl1WWJSK7Soiet3FK2D4VuxPR30iW0nbF9sXsMfaDlTIVMzRlRbl7/DTDkJ8/mNA
         M61rDxzmamrLg2REjJhkoubpVdLrocD7Gk1A2fuFfC237t/mS9UUR4Tlq2pI9OC/jTYM
         zBe4xvbIcSAN8P1wg/Z1EkYN+HRlyj/IafKqKzOx+yWzSNHGenxgfdmSmYjyNRwfuvgi
         Uv5lzuJtRo3CMhm76dx7JXIMosNttCiUsrECGGIrGi3xzu6lBfQ6v7YPS0wXl7bM6MaD
         8vxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ACbt3h/IJWtEQvA1x+7RqS9quptpJJ+r54PpVMaWaYo=;
        b=VaIlP8TpNN7BFSHW8Kbbspy1e98z4mrMuLqa4xNavyoaWZ9l6XaIeQy2i6XAQBri/b
         xcwajZJJ0RjM2rgS5ZT1fGYKz4vdWgF2rKc1PVM4P2vTwvvEPVt8of+iglyW6TJA9toX
         XUbz7KQurSAEnV7MyUtukVMwk6egFiVjumGm0OVNsekNt1NgvIsomsCjsj8ED1e0tg3J
         TrkKq2zXzSSieuHoGjKUK2WgfI9Mp9jGQ/RWIOypPeiKBBYwrQICrEmb9/+TPUsdBdbd
         2UKGNcRfdHNWSEzZnq4dmt3j3i3Lma52W5uZqQ0URMFLD+q7YbOYvHBnC5vinH5FtCMn
         V+ZA==
X-Gm-Message-State: AOAM533tNZQVy+xukZYHCwFGmn/+UL9JukvO/rZxwEdpnHf3BdybjXvS
	1el6XK0VtAM44q8ofMX/eiMSjaZqT4z91g==
X-Google-Smtp-Source: ABdhPJzPXkZuh7gs45vmWLfmPjf7GnvQzdFuAo2DD+mabVK36Chm7wa0TlWycIY52fJ9346AnQ8H5g==
X-Received: by 2002:a63:4460:: with SMTP id t32mr8751042pgk.139.1615530071666;
        Thu, 11 Mar 2021 22:21:11 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::c2dd])
        by smtp.gmail.com with ESMTPSA id e1sm4180378pfi.175.2021.03.11.22.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 22:21:11 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/4] go: Update to 1.16.2
Date: Thu, 11 Mar 2021 22:21:06 -0800
Message-Id: <20210312062107.1549935-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210312062107.1549935-1-raj.khem@gmail.com>
References: <20210312062107.1549935-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is bugfix release in 1.16 series [1]

[1] https://golang.org/doc/devel/release.html#go1.16.minor

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/go/{go-1.16.inc => go-1.16.2.inc}       | 4 ++--
 .../{go-binary-native_1.16.bb => go-binary-native_1.16.2.bb}  | 4 ++--
 ...{go-cross-canadian_1.16.bb => go-cross-canadian_1.16.2.bb} | 0
 .../go/{go-cross_1.16.bb => go-cross_1.16.2.bb}               | 0
 .../go/{go-crosssdk_1.16.bb => go-crosssdk_1.16.2.bb}         | 0
 .../go/{go-native_1.16.bb => go-native_1.16.2.bb}             | 0
 .../go/{go-runtime_1.16.bb => go-runtime_1.16.2.bb}           | 0
 meta/recipes-devtools/go/{go_1.16.bb => go_1.16.2.bb}         | 0
 8 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.16.inc => go-1.16.2.inc} (88%)
 rename meta/recipes-devtools/go/{go-binary-native_1.16.bb => go-binary-native_1.16.2.bb} (83%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.16.bb => go-cross-canadian_1.16.2.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.16.bb => go-cross_1.16.2.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.16.bb => go-crosssdk_1.16.2.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.16.bb => go-native_1.16.2.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.16.bb => go-runtime_1.16.2.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.16.bb => go_1.16.2.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.16.inc b/meta/recipes-devtools/go/go-1.16.2.inc
similarity index 88%
rename from meta/recipes-devtools/go/go-1.16.inc
rename to meta/recipes-devtools/go/go-1.16.2.inc
index 1ebbbef833..e65caf8197 100644
--- a/meta/recipes-devtools/go/go-1.16.inc
+++ b/meta/recipes-devtools/go/go-1.16.2.inc
@@ -1,7 +1,7 @@
 require go-common.inc
 
 GO_BASEVERSION = "1.16"
-PV = "1.16"
+PV = "1.16.2"
 FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
@@ -17,4 +17,4 @@ SRC_URI += "\
     file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
     file://0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch \
 "
-SRC_URI[main.sha256sum] = "7688063d55656105898f323d90a79a39c378d86fe89ae192eb3b7fc46347c95a"
+SRC_URI[main.sha256sum] = "37ca14287a23cb8ba2ac3f5c3dd8adbc1f7a54b9701a57824bf19a0b271f83ea"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.16.bb b/meta/recipes-devtools/go/go-binary-native_1.16.2.bb
similarity index 83%
rename from meta/recipes-devtools/go/go-binary-native_1.16.bb
rename to meta/recipes-devtools/go/go-binary-native_1.16.2.bb
index 155a475c95..4fb060173c 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.16.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.16.2.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
 PROVIDES = "go-native"
 
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "013a489ebb3e24ef3d915abe5b94c3286c070dfe0818d5bca8108f1d6e8440d2"
-SRC_URI[go_linux_arm64.sha256sum] = "3770f7eb22d05e25fbee8fb53c2a4e897da043eb83c69b9a14f8d98562cd8098"
+SRC_URI[go_linux_amd64.sha256sum] = "542e936b19542e62679766194364f45141fde55169db2d8d01046555ca9eb4b8"
+SRC_URI[go_linux_arm64.sha256sum] = "6924601d998a0917694fd14261347e3798bd2ad6b13c4d7f2edd70c9d57f62ab"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.16.bb b/meta/recipes-devtools/go/go-cross-canadian_1.16.2.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.16.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.16.2.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.16.bb b/meta/recipes-devtools/go/go-cross_1.16.2.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.16.bb
rename to meta/recipes-devtools/go/go-cross_1.16.2.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.16.bb b/meta/recipes-devtools/go/go-crosssdk_1.16.2.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.16.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.16.2.bb
diff --git a/meta/recipes-devtools/go/go-native_1.16.bb b/meta/recipes-devtools/go/go-native_1.16.2.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-native_1.16.bb
rename to meta/recipes-devtools/go/go-native_1.16.2.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.16.bb b/meta/recipes-devtools/go/go-runtime_1.16.2.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.16.bb
rename to meta/recipes-devtools/go/go-runtime_1.16.2.bb
diff --git a/meta/recipes-devtools/go/go_1.16.bb b/meta/recipes-devtools/go/go_1.16.2.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.16.bb
rename to meta/recipes-devtools/go/go_1.16.2.bb
-- 
2.30.2

