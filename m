Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
 by mx.groups.io with SMTP id smtpd.web10.20187.1597561698987705594
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2020 00:08:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=elWjNSc1;
 spf=pass (domain: gmail.com, ip: 209.85.216.65, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f65.google.com with SMTP id d4so6176280pjx.5
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2020 00:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BJ/gH5uWAUiXeblyQ1PopYqRTHtRmJQhvjZQLHjo3EA=;
        b=elWjNSc1Z71CvWV6Dp/Ma62oiQTEwpBZHYP0oq6T9i2NOx5q6mXOToGKiXzQAPwEif
         pd9B2QoKJ7tjLrib5KnwioDboTesfXIWAWFQQwMFygfMa/ufka/xr9vIGPb3OwOyfJoh
         fsMy7NXaN7VnVSFL+NEJU03IZNIzunVNeSXLhnuccPYZc6sM4FfIOfTJdYfoegwsgZ5p
         +FP1r4fBFeSYf5+xxfHaRPCNMIw9uT61dqJ0PMUnDxq10yoEpwlRIATL3mJm16HlfeJ6
         2pTNVDpf204b2XVN0M7qE9/zsQr1s3Y/XsM/7z2zUvbHDV+Je9nKaZuK5jz57s+O1sjd
         19Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BJ/gH5uWAUiXeblyQ1PopYqRTHtRmJQhvjZQLHjo3EA=;
        b=JlzbcE01rQy53QjSaml3x3PejlJXFl6wWLASUnxZl4TVhwvjlKibTOSUtNSZMEnKuU
         LapByRhIjyn/3nyAXUtQi83tsRyEGMQGmnxHrC2EJZWxUEbN+/5ErliQUgrcCi2SiKet
         v6wxTyoJNGaD5RQTPbSVa+s8QEaxAzqEpEKKZa5h/ZXpdU4wGOkncJEePJM/GpGr+HR6
         qyn04I0Z1pGhKrG+zC+XPKfLdzoVRu1zLGHvmipAR6os9rfk5Hqa9Eb0nHQCPAuAjHnL
         NaT5mv7iLpUM1pS4xUCtESb33WsGYM7oWGeF3iF1yvNTkHrvQwK5WDFhBSKDg9u/nPi8
         zGWA==
X-Gm-Message-State: AOAM532kN/DADLiyRM/oANLxJhghVgdIqJTJxn3Qfs5JQoe7c7hQ8zsi
	39tkTSFt6of/zh1RgTIgJ7BCRm4+ALl4Uw==
X-Google-Smtp-Source: ABdhPJw6VYzrSdPyK8IdIO8sVVRCzOCjGq/KKVFsRQC00N95b9xWFLcs0Te3mYtIusRT1eKAl7JlYA==
X-Received: by 2002:a17:90b:390d:: with SMTP id ob13mr8537100pjb.122.1597561698102;
        Sun, 16 Aug 2020 00:08:18 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net (c-73-63-224-124.hsd1.ca.comcast.net. [73.63.224.124])
        by smtp.gmail.com with ESMTPSA id em20sm12646873pjb.37.2020.08.16.00.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2020 00:08:17 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/3] Revert "gcc10: Default back to -fcommon"
Date: Sun, 16 Aug 2020 00:08:12 -0700
Message-Id: <20200816070814.1303004-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit 951e859b1e8297970278c539e989b8a6d06a9cb3.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-configure-common.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
index 6cb40fcb74..a64c4caf00 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
@@ -34,7 +34,6 @@ EXTRA_OECONF = "\
     --program-prefix=${TARGET_PREFIX} \
     --without-local-prefix \
     --disable-install-libiberty \
-    --with-specs=%{!fno-common:%{!fcommon:-fcommon}} \
     ${EXTRA_OECONF_BASE} \
     ${EXTRA_OECONF_GCC_FLOAT} \
     ${EXTRA_OECONF_PATHS} \
-- 
2.28.0

