Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web08.50.1620061764844270967
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 May 2021 10:09:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Zf1rDvUs;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id l24-20020a7bc4580000b029014ac3b80020so2094675wmi.1
        for <openembedded-core@lists.openembedded.org>; Mon, 03 May 2021 10:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HTE8Wac/BgKpOF/Dl6yYriPVp5EzsFj6+Ytv9BECkxI=;
        b=Zf1rDvUsOQ74nlqy2BiHHUZR3h20htj2ri/u2vSw0o0nJZxRJ12agFFEK+76cVZbsL
         mqI8ywfUB0exSp7Laq22hBl+8xW6rDk8dkwxbHyUKHVSQFaUXoTEr7g3t0onu0Jkrad+
         OQaPg9INntl8nt03a4rhUD038boysD4nEBDS1g+RwmZtgEqzxJIRpOj1IsxMfwWcadK+
         pi/eQ8cEuNx+uGUS7XBooZKN0lqvdybFV4bp9lISnmw8PtQW/SzeWfwepxgfT8B7RtAP
         oVcJ6d3GlEDch6PWULPWyGQaFEs7t9l0QL7ROQK996Fl+EFtj3uGUsQ7IL1ctEE43qB/
         +V9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HTE8Wac/BgKpOF/Dl6yYriPVp5EzsFj6+Ytv9BECkxI=;
        b=CN/gvkSctueaHPbrG8U7AoLBv2/rCW9Y2BKDl14y7k1m4tdxqzHkD3C51pxWMT+vOM
         BrVe91T2asfSQKUdBCJI8L9GJtYSS9uaLmP1y5zkQPIFoxIf0j49+7ZHHCiyxnYmTmaI
         FinSVIc9EZuLcpodKL+xKxE26pYXJHd9C/u1vt7198D1M/4B+/re2QtsDFcglrj9Nz+3
         oLiuW+5csLIwLa63BGFGmRA804+cQEJa9aaTUz6iq+F1trN54UYj46ygqBNwkmT7DQfb
         yWWCEzX1UuVa3DY4x73213q42kQPjWqEpmzqeGk5dgaHusyssp75C68+A2VfVBzgKn7x
         9f3A==
X-Gm-Message-State: AOAM5318Z0X4rkpqW0RRXoQ2ZlcdM3Q2AYZOFwkURaSU8GTrVaaAXrxv
	lYTtOyFi8Tdzuji1mK1C66QBt6fND5bN4Q==
X-Google-Smtp-Source: ABdhPJy7jmnmgBy66FV6duRb4lrrtCA92b4yzQkrVe0XsAmlEedFuGa59dyclk8Q527WpcZYO4eTMg==
X-Received: by 2002:a05:600c:2154:: with SMTP id v20mr3790982wml.86.1620061763211;
        Mon, 03 May 2021 10:09:23 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from CTW-01195.lan ([213.205.68.220])
        by smtp.gmail.com with ESMTPSA id v17sm12692045wrd.89.2021.05.03.10.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 10:09:22 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v2 2/3] gstreamer1.0: rename patches
Date: Mon,  3 May 2021 18:10:41 +0100
Message-Id: <20210503171042.123645-2-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210503171042.123645-1-quaresma.jose@gmail.com>
References: <20210503171042.123645-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...ests-seek-Don-t-use-too-strict-timeout-for-validati.patch} | 0
 ....patch => 0004-meson-Add-option-for-installed-tests.patch} | 0
 meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb      | 4 ++--
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/gstreamer1.0/{0001-tests-seek-Don-t-use-too-strict-timeout-for-validati.patch => 0003-tests-seek-Don-t-use-too-strict-timeout-for-validati.patch} (100%)
 rename meta/recipes-multimedia/gstreamer/gstreamer1.0/{0003-meson-Add-option-for-installed-tests.patch => 0004-meson-Add-option-for-installed-tests.patch} (100%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-seek-Don-t-use-too-strict-timeout-for-validati.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-seek-Don-t-use-too-strict-timeout-for-validati.patch
similarity index 100%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-seek-Don-t-use-too-strict-timeout-for-validati.patch
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-seek-Don-t-use-too-strict-timeout-for-validati.patch
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-meson-Add-option-for-installed-tests.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-meson-Add-option-for-installed-tests.patch
similarity index 100%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-meson-Add-option-for-installed-tests.patch
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-meson-Add-option-for-installed-tests.patch
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb
index 8562070968..b275a3430b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb
@@ -18,8 +18,8 @@ S = "${WORKDIR}/gstreamer-${PV}"
 SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.xz \
            file://0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch \
            file://0002-Remove-unused-valgrind-detection.patch \
-           file://0003-meson-Add-option-for-installed-tests.patch \
-           file://0001-tests-seek-Don-t-use-too-strict-timeout-for-validati.patch \
+           file://0003-tests-seek-Don-t-use-too-strict-timeout-for-validati.patch \
+           file://0004-meson-Add-option-for-installed-tests.patch \
            "
 SRC_URI[sha256sum] = "9aeec99b38e310817012aa2d1d76573b787af47f8a725a65b833880a094dfbc5"
 
-- 
2.31.1

