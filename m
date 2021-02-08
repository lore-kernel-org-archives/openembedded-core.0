Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web12.33493.1612781981557741769
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Feb 2021 02:59:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KgrZOzYX;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id f14so23877070ejc.8
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Feb 2021 02:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=snEnaQ9QHWvIOlvtQQIJ+y9rfDVa20nb65rsZwq7LnI=;
        b=KgrZOzYX5yoksBvkKDN8yYir1GSvhGOW2TqrxDIUK82hlxu3TF0w1yCZ6S1uuZGQUH
         x7MmrP2C/Hj/y/3NRMmwD7N3AiIreWnQ9dgHExHBBqjkTZZpEBa0P2hujc0cC5Arnigc
         QV0c3Q52mMSd5qNKjvTl3rSy4P3WuXa9UvQEk3Xdlf7xqeloeenkBjp8t0PtRQDfe0Jl
         IfkTAzecr8gDtd5o0SwMJ1oUdvOGNW9SKigcheoTvPmy8YA1/qfOw6Io5AeCISE+zMDy
         CvEeWF21A+ETju9og2ica/p2VFLxxdG40Tm3sq50mhffntEN1aUsCwoe9GVsbculnyz7
         FDfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=snEnaQ9QHWvIOlvtQQIJ+y9rfDVa20nb65rsZwq7LnI=;
        b=H/ADfY6c3ZsRGDtm//wV4nge1jRBiWfg+dpG/k7fbJdTluEIn9LwE3foF+b7k5AQdz
         VfxNgwCCnzAqe5Cx0wImxxneMBvYz+rG130TIsCfxO16/TwEmI8jec5SV4pzf0lQwwe4
         3lHOvC01DxByK3vzs05tHze3tDhS2BTECEaCYFegjN2u0f33cfR7qR627uh48rqlLTrz
         8MkJbHbVkznssb+fkRg8R1ITxjb1aRn01zMspbw0bRqE6S5FMg0JaBBc8fohygLiNkOE
         M/CYla4kGw9BZzKvJ9JC3q/XugX4FvofK4Vvj9Vr0paXB4QbpxpVRJdW5E1KvNHspe6c
         F3hg==
X-Gm-Message-State: AOAM531CA5D2vLcJ36uCDWGkIcJT3Bg2ygxP1u4A+oZvywAMEnEqDH4v
	dHSIQ3d6BMRoU8xMhS3rJhChpxGga+/IRg==
X-Google-Smtp-Source: ABdhPJzr51ZgRaWc9wL6MPWmQpZUnTMNo20TwZsysyZnIE9b0jDz9VVY85mRO7XTPlAGzGT5rrTsoQ==
X-Received: by 2002:a17:906:3006:: with SMTP id 6mr6952492ejz.448.1612781980177;
        Mon, 08 Feb 2021 02:59:40 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2450:1011:512:45a5:1b3d:84d2:e7fc])
        by smtp.gmail.com with ESMTPSA id t19sm8382226ejc.62.2021.02.08.02.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 02:59:39 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 03/12] python3-setuptools: update 51.0.0 -> 52.0.0
Date: Mon,  8 Feb 2021 11:59:23 +0100
Message-Id: <20210208105932.347925-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210208105932.347925-1-alex.kanavin@gmail.com>
References: <20210208105932.347925-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

easy_install script removed upstream:
https://github.com/pypa/setuptools/blob/v52.0.0/CHANGES.rst

Tarballs are now provided instead of zip files.

License-Update: formatting

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...tuptools_51.0.0.bb => python3-setuptools_52.0.0.bb} | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_51.0.0.bb => python3-setuptools_52.0.0.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-setuptools_51.0.0.bb b/meta/recipes-devtools/python/python3-setuptools_52.0.0.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-setuptools_51.0.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_52.0.0.bb
index dc09c13846..118f416657 100644
--- a/meta/recipes-devtools/python/python3-setuptools_51.0.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_52.0.0.bb
@@ -2,9 +2,7 @@ SUMMARY = "Download, build, install, upgrade, and uninstall Python packages"
 HOMEPAGE = "https://pypi.org/project/setuptools"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;beginline=1;endline=19;md5=9a33897f1bca1160d7aad3835152e158"
-
-PYPI_PACKAGE_EXT = "zip"
+LIC_FILES_CHKSUM = "file://LICENSE;beginline=1;endline=19;md5=7a7126e068206290f3fe9f8d6c713ea6"
 
 inherit pypi setuptools3
 
@@ -12,7 +10,7 @@ SRC_URI_append_class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 
 SRC_URI += "file://0001-change-shebang-to-python3.patch"
 
-SRC_URI[sha256sum] = "029c49fd713e9230f6a41c0298e6e1f5839f2cde7104c0ad5e053a37777e7688"
+SRC_URI[sha256sum] = "fb3a1ee622509550dbf1d419f241296169d7f09cb1eb5b1736f2f10965932b96"
 
 DEPENDS += "${PYTHON_PN}"
 
@@ -42,10 +40,6 @@ do_install_prepend() {
     install -d ${D}${PYTHON_SITEPACKAGES_DIR}
 }
 
-do_install_append() {
-    mv ${D}${bindir}/easy_install ${D}${bindir}/easy3_install
-}
-
 BBCLASSEXTEND = "native nativesdk"
 
 # The pkg-resources module can be used by itself, without the package downloader
-- 
2.29.2

