Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.11569.1621204376440358398
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 May 2021 15:32:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FiIZWo/e;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id q5so4466374wrs.4
        for <openembedded-core@lists.openembedded.org>; Sun, 16 May 2021 15:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=s5daLoKcUwbv2RCzNeFNMfneTNPghS8yqGGnVJOgkdI=;
        b=FiIZWo/eJVQ0k71i7I92O6mZwmij/xUY5hxYbyRZjd5Pr2QS6AX0wT6Ptzn4SgN4uy
         4j3CUWNZAsIMwCGe2BNTr9ZuGC4yZieAB36N5/WD54gIl6/OYapPnmBMc0u5vxFFovIM
         xECJ+mB2FrSWXcMgVXdjiN9bL9B59KEBqUX+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=s5daLoKcUwbv2RCzNeFNMfneTNPghS8yqGGnVJOgkdI=;
        b=ny+h8PDET8V97gQQsr5guZs3cP1Y5+1Sz7qtHTeK4LORECkneBY0Q2ROp5kG8KYdwi
         5FbFWpMv8026FbAERWP9l/D+SuF0L+HBMXCWJ0qAjNxXx/s1Q8nnxZBXyPBMw3J4vhST
         vPB9BrtZh4LIE1+Y0M7Nnx6x0zFt2KCdjF6G/vUrI7tdYeVv4YhZQ8ue2F0WCXZZwDcI
         UqvsMeh5m0cHwiAnOTimZunN5Ao4cyjr0EEkWz0QiN05xEvj4hBiTzImo3cdMbzbvl+B
         2ukeEgc6g9VkrGKN+UTPYWMbBSdki1idUJ6MO9frjb7+qfZ399DVUygXWniTSmcQgBRG
         A3tQ==
X-Gm-Message-State: AOAM531JyuguB+klV+uf2v47Uf/rwybpbXXMxg0Iy82SZ0Mte16BVE2e
	U09vuu6UrlOSK7tQ8DwFoER+g44BUmLwHg==
X-Google-Smtp-Source: ABdhPJymhKK+0mIdncGWRz2RwXtUADW1LZ68kBorCfUP7BC+0Yce5qluq6dlNN5MGfisRL7+3hhdVw==
X-Received: by 2002:a05:6000:cb:: with SMTP id q11mr71299227wrx.13.1621204374986;
        Sun, 16 May 2021 15:32:54 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:1b39:2a3f:a2c2:a4fc])
        by smtp.gmail.com with ESMTPSA id f8sm11621759wmg.43.2021.05.16.15.32.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 May 2021 15:32:54 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 11/27] python3-setuptools: upgrade 56.0.0 -> 56.2.0
Date: Sun, 16 May 2021 23:32:31 +0100
Message-Id: <20210516223247.2401235-11-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210516223247.2401235-1-richard.purdie@linuxfoundation.org>
References: <20210516223247.2401235-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...0001-conditionally-do-not-fetch-code-by-easy_install.patch | 4 ++--
 ...hon3-setuptools_56.0.0.bb => python3-setuptools_56.2.0.bb} | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_56.0.0.bb => python3-setuptools_56.2.0.bb} (94%)

diff --git a/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
index 680edbe704b..59e278d1aed 100644
--- a/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
+++ b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
@@ -1,4 +1,4 @@
-From 6380cc63f79abe8b8404c9be5ed5f213a70c8c6a Mon Sep 17 00:00:00 2001
+From d6339e6b3de0f3be5ca50541d82f99d827700f45 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 17 Jul 2018 10:13:38 +0800
 Subject: [PATCH] conditionally do not fetch code by easy_install
@@ -15,7 +15,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 5 insertions(+)
 
 diff --git a/setuptools/command/easy_install.py b/setuptools/command/easy_install.py
-index eeb21b5..eca1edd 100644
+index 45adb6a..9ac3342 100644
 --- a/setuptools/command/easy_install.py
 +++ b/setuptools/command/easy_install.py
 @@ -636,6 +636,11 @@ class easy_install(Command):
diff --git a/meta/recipes-devtools/python/python3-setuptools_56.0.0.bb b/meta/recipes-devtools/python/python3-setuptools_56.2.0.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-setuptools_56.0.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_56.2.0.bb
index 07a82ad21be..bb852d06522 100644
--- a/meta/recipes-devtools/python/python3-setuptools_56.0.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_56.2.0.bb
@@ -10,7 +10,7 @@ SRC_URI_append_class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 
 SRC_URI += "file://0001-change-shebang-to-python3.patch"
 
-SRC_URI[sha256sum] = "08a1c0f99455307c48690f00d5c2ac2c1ccfab04df00454fef854ec145b81302"
+SRC_URI[sha256sum] = "7bb5652625e94e73b9358b7ed8c6431b732e80cf31f4e0972294c64f0e5b849e"
 
 DEPENDS += "${PYTHON_PN}"
 
-- 
2.30.2

