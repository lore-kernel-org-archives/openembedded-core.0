Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12243.1794896161479758891
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2026 22:16:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=qDEZUL6J;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: ragaprasanth@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b3a9a4a765so448591a91.0
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 22:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794896161; x=1795500961; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=k/EAIliGbknkVIj+0g1uc01cVWvzoKdSPfYfMD1PzRI=;
        b=qDEZUL6J1P0P7w6DCR2DDeY78S96MSXMx8UyGy3IW+enSI2EfRZ6/Hjq5R3DRgv4y2
         1ZNtCP1h7KTNpABouFZ0qCXCnLCp1XI6Pt73MrhByADCq1AHZw7ePOXtAMpfJldi1tcn
         Z41KwNMLY4MhYOq1RnszRqXpsGhto4N2JoOzvqJYb6rxUT2iWhN5keOuGPHB5ZO69cki
         4M8Vo6XulArENK5I3xmY+TiqH/UVOiKI2Hkk1XUWktth6IAJhXj9hKrAfkrccxNPPY+G
         adVqCjnjeJVWM6I1knvDuiczLnX2UZSEFzth46QPE1H73qbUa1j4ltrWndT9hy9+204g
         SMZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794896161; x=1795500961;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k/EAIliGbknkVIj+0g1uc01cVWvzoKdSPfYfMD1PzRI=;
        b=ZHStJtGWwjOXxgfjItLEyTacd7GjeUfvOcyRfwHEIezSqw9pAKXST5fe2ApSYtZwMt
         M+WCkEBA4XVNGb0RwsdnoVyX8+M9kpBef6PdXui+yJCXHoLnNSY45Ecc4OjDdmQJsoNU
         fSOpGsuFQg92FD+8BpGcKCnbfceqDGGruklnriGxCpjZqCvB60pbMayP0cqgVJqxxS9N
         ky4iRGRGQEN0HHsga6OD1+nhrR51UnppOxYB6PQODEiTl+fW9jIl/5XAmb+BAUQqyqOw
         sH9qB5pYiPEksDDhrmU89s7YIF+7XeiGPlt1WuxIqwBfyZ0oFymyxJ1l6/+68STTWZ5U
         G6Fw==
X-Gm-Message-State: APuU4Z+zASQ+bUqVHS0VMVPb+MffWdugJtnuZKnFg5C34xYFeUgMJBWu
	L5s74Ss4b63DklE2P/RLh4xKe7XxcPVtZdro86k88xYHFo/2vbwFHbzojo8c7J9z
X-Gm-Gg: AZFdTZfVmnFzP3M9b7s6mkAOqh93eUXZlE+82BVIv1Uno1504kKx96ULoO8wrO5RxW7
	eqrMfTCEjlcUITCsCHR2pmFUGFyIMrfx+bfxbIDNduRf4XX1pn1beNEg8VT9z+vYUZ4FvLc/8Ha
	CpNPJJNZWZ0LBoutH4C5eo7us9J0p3XgOTAgaeIuzMJsNeBN6cycxj6C5Wq2nx7tMxQxLaccmHo
	T+QNPtQTSssT1oRRY4PaHFxNrbj07taNTWPcKli8r5YZD2iYC++NifEZGIOl/JpMLa1MD3b7U0q
	uQ9xpWfxtEnYnlUGussGsaSHTPUuJD2RmvIgukNIVsmJI8893wj+POW7mSuWgCGebUXlAAhFfk7
	bmMgCTknHW9vwBomwtvWUKZirw8kuNf/7SXlMox41fah2CsbrxaD43KZ3ACrUZNbiAQQLDE2qOb
	vL2HRFKQFngBlclVQaojkf9lAJoJCXy73LuxWEGvcdD+Tp2PMVIMooMNd7udw2T8WaWRLPLJ7uJ
	2fQTqaiWnqp11ioSz7NtTMIqt0rRJl/NM0Z8H93fXYnw9MezHEbpy7D9xo6Gjb4/hlrznJBFeY1
	I5yHAXknoGLmapwvfjXxsl5/UosR/nMRvLxNmBab5+tC7qyoMiIq517qko2bbldX
X-Received: by 2002:a17:90b:2b43:b0:3b3:b71e:b2ef with SMTP id 98e67ed59e1d1-3b3b71eb3b7mr680787a91.50.1794896160575;
        Mon, 16 Nov 2026 22:16:00 -0800 (PST)
Return-Path: <ragaprasanth@gmail.com>
Received: from prasanth.alps.lineo.co.jp (vpn1.lineo.co.jp. [203.141.200.204])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3f09b92sm9703902a91.4.2026.11.16.22.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 22:16:00 -0800 (PST)
From: Prasanth R <ragaprasanth@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Prasanth R <ragaprasanth@gmail.com>
Subject: [PATCH] cmake,cmake-native: upgrade 4.4.5 -> 4.5.0
Date: Tue, 17 Nov 2026 15:15:49 +0900
Message-Id: <20261117061549.1066408-1-ragaprasanth@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 06:16:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250406
Content-Type: text/plain; charset="utf-8"

CMake 4.5 now bundles rapidhash (MIT), so add its license file.

Release notes:
https://cmake.org/cmake/help/v4.5/release/4.5.html

AI-Generated: Uses Claude
Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
---
AUH reported a do_compile failure, but it builds here:
cmake-native, nativesdk-cmake, and cmake for qemux86-64 and qemuarm.
Rebuilt and tested expat, json-c, libjpeg-turbo, fmt, libzip, libcheck, nghttp2,
taglib, opkg and libubootenv with it.

 .../cmake/{cmake-native_4.4.5.bb => cmake-native_4.5.0.bb}      | 1 +
 meta/recipes-devtools/cmake/cmake.inc                           | 2 +-
 meta/recipes-devtools/cmake/{cmake_4.4.5.bb => cmake_4.5.0.bb}  | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)
 rename meta/recipes-devtools/cmake/{cmake-native_4.4.5.bb => cmake-native_4.5.0.bb} (97%)
 rename meta/recipes-devtools/cmake/{cmake_4.4.5.bb => cmake_4.5.0.bb} (96%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_4.4.5.bb b/meta/recipes-devtools/cmake/cmake-native_4.5.0.bb
similarity index 97%
rename from meta/recipes-devtools/cmake/cmake-native_4.4.5.bb
rename to meta/recipes-devtools/cmake/cmake-native_4.5.0.bb
index aed38b7ed1..5f52489cbf 100644
--- a/meta/recipes-devtools/cmake/cmake-native_4.4.5.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_4.5.0.bb
@@ -17,6 +17,7 @@ LIC_FILES_CHKSUM:append = " \
     file://Utilities/cmcurl/COPYING;md5=0515352b285b9c3f66464b135c9c0fdc \
     file://Utilities/cmnghttp2/COPYING;md5=764abdf30b2eadd37ce47dcbce0ea1ec \
     file://Utilities/cmcppdap/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57 \
+    file://Utilities/cmrapidhash/LICENSE;md5=4ba32c08f2e0fce0078296c3d100fb93 \
 "
 
 B = "${WORKDIR}/build"
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 30294fd9b8..01fe71c119 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -19,7 +19,7 @@ CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            "
 
-SRC_URI[sha256sum] = "a0c54c88abb8078dd8eccadb717fc6bb194bf18e7d44c86309910288886e04e2"
+SRC_URI[sha256sum] = "424352d6133e8455e020da787008e8dc67abb18820af3532572ab35657e49213"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake_4.4.5.bb b/meta/recipes-devtools/cmake/cmake_4.5.0.bb
similarity index 96%
rename from meta/recipes-devtools/cmake/cmake_4.4.5.bb
rename to meta/recipes-devtools/cmake/cmake_4.5.0.bb
index 6265316fd9..9cfd4434f0 100644
--- a/meta/recipes-devtools/cmake/cmake_4.4.5.bb
+++ b/meta/recipes-devtools/cmake/cmake_4.5.0.bb
@@ -15,6 +15,7 @@ LICENSE:append = " AND BSD-1-Clause AND MIT"
 LIC_FILES_CHKSUM:append = " \
     file://Utilities/cmjsoncpp/LICENSE;md5=5d73c165a0f9e86a1342f32d19ec5926 \
     file://Utilities/cmlibrhash/COPYING;md5=a8c2a557a5c53b1c12cddbee98c099af \
+    file://Utilities/cmrapidhash/LICENSE;md5=4ba32c08f2e0fce0078296c3d100fb93 \
 "
 
 # Strip ${prefix} from ${docdir}, set result into docdir_stripped
-- 
2.34.1

