Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web10.14922.1602253151063011500
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Oct 2020 07:19:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=hMS02Yiq;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id u24so7309551pgi.1
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Oct 2020 07:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=rLb+ZEEqYkNq9hAQ+zlgwXWCCOC/FmK+RisWXX4nlF4=;
        b=hMS02YiqBq38/2guV43dVZFzlSjJJUjW/39RaZ738ZA+vwLH2aD2plK3Sz6OBVmWGN
         J9B6gTPQR/DBC+AZ5eMMD9rU7rqHee5RNFAGb2CwMGmKdpiCc1opaStbeHYyNJ9QzaPt
         3IQfLWO4tROItTPFU90lXisFscC0+hQX3F9izyEGTVZ2vElOJnwXHa7gsZTqtYQDJm4a
         Qh0QJchyZhg9eFdl/Ql8s6sQA44oQY/6rdn8mgpb/DyeEHP2oBD2E6wFHSYI6yGXOsUT
         SZSUS20arPFHQlcmQrCiNQ7TmnffkMD3RefraLBn+xVRcXsyfs3toLh97hUVaCkoQwgJ
         Ehkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=rLb+ZEEqYkNq9hAQ+zlgwXWCCOC/FmK+RisWXX4nlF4=;
        b=hUPWpyThQfMu6frb2VThaFh6OdmeOKUU8+muFIw9QzZxHNfWOD4dwU03u6NMX6MVEl
         MjF/Y+5bwqHvpJ+tB3paGtxEGJpnCpXx0ygHf4ibCjmi7ZG1+7qA6q0YutDlwnhsMwbZ
         WddHoQYe+LsjiQ3yuMu0ohnSClvKOsGOpEirznQ3NXb1WwQzDFZzWNFPT1mUIXaiUO6b
         6CjVduhryXKYOE8GYbnyAqMoNmNeHjGsQQMwe+BuG5Of2JbgJWVts4Ty+xxYXErO6mjy
         zLuyazJfVRZ+lF0h6n42E6Ye15DKGs/9s9ODmWZsWV7gzsoVH/NlD/5F6ISoPvb+veJX
         sr9g==
X-Gm-Message-State: AOAM531ksgUEFzQkSao56MZLSeZ/hSLjBd2G6/QTMmuy44edhluAo8H8
	T2fvwnVECEbyP0qooOFT263VIFVWccs6JzZy
X-Google-Smtp-Source: ABdhPJxhVtsu/B611k5MOWDsrErlTlsU9I7B9kOwVAM28VLxOfsN4D5Gm/RSmqobv9AWOW1J8U+jNw==
X-Received: by 2002:a17:90a:4e47:: with SMTP id t7mr4712572pjl.26.1602253150046;
        Fri, 09 Oct 2020 07:19:10 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id n127sm10736116pfn.155.2020.10.09.07.19.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2020 07:19:09 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/14] lttng-modules: update to 2.11.6
Date: Fri,  9 Oct 2020 04:18:37 -1000
Message-Id: <3ba57b15b1eeb0756ab9bc6b317ead1a7a08d226.1602253014.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1602253014.git.steve@sakoman.com>
References: <cover.1602253014.git.steve@sakoman.com>

From: Marek Vasut <marex@denx.de>

Update to latest available.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{lttng-modules_2.11.2.bb => lttng-modules_2.11.6.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-modules_2.11.2.bb => lttng-modules_2.11.6.bb} (92%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.11.2.bb b/meta/recipes-kernel/lttng/lttng-modules_2.11.6.bb
similarity index 92%
rename from meta/recipes-kernel/lttng/lttng-modules_2.11.2.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.11.6.bb
index 6fff096a37..a38d8afb7a 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.11.2.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.11.6.bb
@@ -13,8 +13,8 @@ SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
            "
 
-SRC_URI[md5sum] = "2e3bc8cfb264fa13f374618b46f170e7"
-SRC_URI[sha256sum] = "8a42240813b8fd1d001835cd6f5ec687f7d7f3b26070d4e21604c35a51a6441d"
+SRC_URI[md5sum] = "8ef09fdfcdec669d33f7fc1c1c80f2c4"
+SRC_URI[sha256sum] = "23372811cdcd2ac28ba8c9d09484ed5f9238cfbd0043f8c663ff3875ba9c8566"
 
 export INSTALL_MOD_DIR="kernel/lttng-modules"
 
-- 
2.17.1

