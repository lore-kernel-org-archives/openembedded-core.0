Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30053.1793868220788720075
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 00:43:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=PlTENd2V;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so9500905e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 00:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793868219; x=1794473019; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=16krOLcsLGpWm/P+sah0OSe9C3WXPBpZo5xYV567BGk=;
        b=PlTENd2VDroaN/qoQkiMEr74uf9Db1lRR6rGtH4yQ+0ooEyHU527VjDksoyzjQEkC3
         z+OHp+mmLzGwpBTPH+ngBiuqBzArww1zcLwU9QK3K+y0V9u11EyKvw+lhKKPtAtf3GPL
         CDm68w7CCWIfv6RrqiyQSrcp76/UO83B5R0dMiA1139UeNx+tZ7d4mbYZ+JwdLVq8+Qg
         L+Q3a0EekutmZpUkz8zhhynjzfmL0HfG/1LcL2gdJw8720enmPe97pw5S2DS62LSHVqw
         +Hrf+YB9OdfVOFwXCPZyOMzEHIgoeOIImkkUQ5oL+yrNYTdKJQBwSowM+hUMfCe6JXXG
         Pdaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868219; x=1794473019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=16krOLcsLGpWm/P+sah0OSe9C3WXPBpZo5xYV567BGk=;
        b=LiSI07QhNXaHcjsML77xsKqU4UWT4ZUAlvRQLUNMWnoGo4XJ2boD2YWVKPhH1V0Z4I
         9nwmMTMx3oTwqLheKPmHn8q8aWAhYRlu8pnCj1nrN3C/fZM8XqClU0zQXENMPFhd95jz
         wMGDkEUkXQEvob6fXMm6z1mNcvp8umFMuIEGPgN1PN8+ecXCRIDRW/S8fHl4LyG+k1NY
         Wt/xp9qp6qBhhl/FlQEpH5W0EUwTIUVOqagBPNwo14RfFizHmt7DkGk7f9gFGWla5VzF
         mwpuFQbPFEeNrcwbeIDm8WCeh7RDFw/ZLOmG8Q6mdG5LbpAHZaDFBWyk01rqGXt3/3aC
         qwXQ==
X-Gm-Message-State: APuU4Z+211/JI4Kess2hl6SZfbUdzJqF5Upki3fdrmcy9IZs/eYyT+/m
	JrzX7fm57uvsKeJ37ZhCZjhbnyiOVG7294tcJ/SbMXkD7uK187IVa2CXWwWaD/CanXojQKr+Ec6
	oq9Emxqc=
X-Gm-Gg: AYBFou0lsUQLG5gsAPO+SixEvWo/y9fsjwB+5yVrvojHGY9Y46Y/R3AAyEzdPBAqyMW
	ORCgdxELx1Ipj26wq3nNkJn2ALb0uMZyJ7NCYZMrFRykwJXUDr8ujBxHkFrmrtlEfnJKIGgJRdV
	PD+aW3FwXllBxu1o3IYmS/77weR1a8wi9Q1BdqF5T4DOCI9reoTZSXp4Yfw4Wij6tuVSJ0YlJ+w
	kR7OIjs7RjoFeR2X6nidbW4AcUVfVPO372uIn+ILTmpEBiMc4qRJR4B1JI+MmqkrV7FVD2RfVXF
	EtlEtIvnvYUFxcS/zlNp08AyO/+QlpD1U+46gwxBAS6MNdAPY/+B6cvTIlu+FBdchhToE9l801c
	dyTulBMDrNZeJvfhy/GT49s2g9ERIzbKXwVLP6Obae/JNnPPVnJrTxad2psjGt4bm1lb29fGfWe
	V5hsrtvrBC1jetuf0XV6bhlSRtTK/Lf0lUbUyR4TOj4Q8eM7+X1wn457AndHR8hzH87wzgBEUer
	GcxPRv04DEuzw+jZAjk+tFlj+XOdGyInnsDy8QY4bmIpz3FBjwphNV0C57W1ssydaIFkCSPKUsi
	lpIJrkh4uyWQLeeS3OEuyusHI0GhcOAP2o2fAVCnNRTutowOVgLYWf5ymhzFm92zKAsDdiyXrkO
	yLNijpxrcOO32j+o+SRqzDl1vFG6s
X-Received: by 2002:a05:600c:871a:b0:4a6:44b:2593 with SMTP id 5b1f17b1804b1-4ac18d68babmr379329365e9.29.1793868218985;
        Thu, 05 Nov 2026 00:43:38 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d8e29sm9200620f8f.19.2026.11.05.00.43.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:43:38 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 04/60] go: upgrade 1.27.2 -> 1.27.3
Date: Thu,  5 Nov 2026 09:42:23 +0100
Message-ID: <d4d316ec72638bfe9549cb2dfaf019ba1d22f8f2.1793867929.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793867929.git.yoann.congal@smile.fr>
References: <cover.1793867929.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 08:43:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249463
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Upgrade to latest 1.27.x release [1]:

$ git --no-pager log --oneline go1.27.2..go1.27.3
2aae1000ea (tag: go1.27.3) [release-branch.go1.27] go1.27.3
90617fb7ce [release-branch.go1.27] crypto/x509: distrust a handful of intermediates

Fixes CVE-2026-111943

Release information: [2]

[1] https://github.com/golang/go/compare/go1.27.2...go1.27.3
[2] https://groups.google.com/g/golang-announce/c/66pojueaQek

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: c21ed25472ea3b29dc10d4c5500d880c36477c3e)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/go/{go-1.27.2.inc => go-1.27.3.inc}   | 2 +-
 ...o-binary-native_1.27.2.bb => go-binary-native_1.27.3.bb} | 6 +++---
 ...cross-canadian_1.27.2.bb => go-cross-canadian_1.27.3.bb} | 0
 .../go/{go-cross_1.27.2.bb => go-cross_1.27.3.bb}           | 0
 .../go/{go-crosssdk_1.27.2.bb => go-crosssdk_1.27.3.bb}     | 0
 .../go/{go-runtime_1.27.2.bb => go-runtime_1.27.3.bb}       | 0
 meta/recipes-devtools/go/{go_1.27.2.bb => go_1.27.3.bb}     | 0
 7 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.27.2.inc => go-1.27.3.inc} (91%)
 rename meta/recipes-devtools/go/{go-binary-native_1.27.2.bb => go-binary-native_1.27.3.bb} (80%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.27.2.bb => go-cross-canadian_1.27.3.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.27.2.bb => go-cross_1.27.3.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.27.2.bb => go-crosssdk_1.27.3.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.27.2.bb => go-runtime_1.27.3.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.27.2.bb => go_1.27.3.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.27.2.inc b/meta/recipes-devtools/go/go-1.27.3.inc
similarity index 91%
rename from meta/recipes-devtools/go/go-1.27.2.inc
rename to meta/recipes-devtools/go/go-1.27.3.inc
index 86598ad22f7..7c906e8b5a8 100644
--- a/meta/recipes-devtools/go/go-1.27.2.inc
+++ b/meta/recipes-devtools/go/go-1.27.3.inc
@@ -17,4 +17,4 @@ SRC_URI += "\
     file://0010-cmd-go-clear-GOROOT-for-func-ldShared-when-trimpath-.patch \
     file://0011-internal-cgrouptest-skip-when-cpu.max-is-not-availab.patch \
 "
-SRC_URI[main.sha256sum] = "03495da2ba64894d40f5c4992e49454fa78b50690604ff92b6afff5081b76e62"
+SRC_URI[main.sha256sum] = "6e7749035cf360f06b2575d162ea79df9fda8ef671889e5c375f8e50777f26bb"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.27.2.bb b/meta/recipes-devtools/go/go-binary-native_1.27.3.bb
similarity index 80%
rename from meta/recipes-devtools/go/go-binary-native_1.27.2.bb
rename to meta/recipes-devtools/go/go-binary-native_1.27.3.bb
index 19482f79c4b..c245af8fb80 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.27.2.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.27.3.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "ecbadb99091a3f46e31f5f934b068b1864eafa7995211b39eaddf76996045fe5"
-SRC_URI[go_linux_arm64.sha256sum] = "94f3e30b8e374bc285e7dadc11e0865726b9bc6e85b841ccceaabc0214c6b7c8"
-SRC_URI[go_linux_ppc64le.sha256sum] = "059d5f01b1607a724ea5ae87c5589041a51c577a6f3f20099e49d00f31c803fa"
+SRC_URI[go_linux_amd64.sha256sum] = "65efbc80fdc1fa2cd2631cad5b481777a68e8725f34e89f50fc6ac714e379b40"
+SRC_URI[go_linux_arm64.sha256sum] = "a06e99309dbcbdca1a8ccd2282c3ee146e55930886e26b4f1193269587165f49"
+SRC_URI[go_linux_ppc64le.sha256sum] = "f180f01943865b7942ab3b4acbab6da6f0f669b61da999d004d16c537a49f7b5"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.27.2.bb b/meta/recipes-devtools/go/go-cross-canadian_1.27.3.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.27.2.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.27.3.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.27.2.bb b/meta/recipes-devtools/go/go-cross_1.27.3.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.27.2.bb
rename to meta/recipes-devtools/go/go-cross_1.27.3.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.27.2.bb b/meta/recipes-devtools/go/go-crosssdk_1.27.3.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.27.2.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.27.3.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.27.2.bb b/meta/recipes-devtools/go/go-runtime_1.27.3.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.27.2.bb
rename to meta/recipes-devtools/go/go-runtime_1.27.3.bb
diff --git a/meta/recipes-devtools/go/go_1.27.2.bb b/meta/recipes-devtools/go/go_1.27.3.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.27.2.bb
rename to meta/recipes-devtools/go/go_1.27.3.bb
