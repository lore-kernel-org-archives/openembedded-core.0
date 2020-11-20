Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.638.1605893394455575894
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2020 09:29:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Y/2HIN88;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id q10so8526360pfn.0
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2020 09:29:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2EIy7Q6FfxeCeX9jyB0TBbB96yGIoMqahs6K6cfFftE=;
        b=Y/2HIN88A5/B61ErbSXZzXic1dc+canVRyQKLJ5x1VlCpCMbz4MYG5sijxZSQiZkOl
         oh9Xv2cnbPYK4tChqMTXZ+UFiHdu4ngnD+Ka+BXFgKttiTw4plIZmHiz+L97L84Sdshr
         leOCO5Xh1oXSeTrQS0YTBOjyBWH6bVDtJb+0XxqHRBvVPhPKtWZUydCsNvxU7Ynv/Wbl
         lRw1l9jweGA7KhSiyVZF47n2G2R1BnzcB+3+QZ4kRrkpqPy+E2y9zcuyEGYr8uzh/QIs
         fenDYAtIhv/Z36gQ5Y7lwkLee7SK6w+ZW1zEEzx4IAPo+8dMM0oHLfqavF/WEZPQ69r6
         mVkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2EIy7Q6FfxeCeX9jyB0TBbB96yGIoMqahs6K6cfFftE=;
        b=EWTaCQKs0xJXmKOODSX7vdwJKttkvRq368YL8BbfyHyzFCEiWH8BW/mHqrVgkgvGhf
         OEzYWT/ZyideA5ccdkPu2W5Hw5f7xrbRpAU+eYqbcdEcd4wH88UdGZFn5ycqgrECUhkT
         ot0uDVmApB88i2Q4PWJW+1cfiRpjugPaLL6yzOHOKyq/rww9cMNaTpFdUxyUK0kU+N1d
         e+bkWMpwvIBpZwEu+3X3etVsnDWQDJAPYm8B/Xy4QckECeRus1gUuK74LB9zA0v6c6AS
         Nlxgo17CY+inmXkidDl4u8wnHO6HtNK0pcjSbOu4dfBGZc3ODnLI1vXn1ZcfjgBYm01h
         mtwA==
X-Gm-Message-State: AOAM532Tg92t7Q/yk86nedLqBITH4fCOUEDcqWBwBlwHCmgh37DWERIi
	6duzYvHfz+V5cPRSpSozJWu+w5lXC4tFWA==
X-Google-Smtp-Source: ABdhPJyoqTHA9TDWWDFrL05sE88BCdzgtxTlzjVCCGQqwDnNw4A6AfKTbYkcF4Eu+6MzLKxx3udn7g==
X-Received: by 2002:aa7:86c3:0:b029:197:cad7:918 with SMTP id h3-20020aa786c30000b0290197cad70918mr6616043pfo.28.1605893393597;
        Fri, 20 Nov 2020 09:29:53 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::b756])
        by smtp.gmail.com with ESMTPSA id x61sm4855684pjj.4.2020.11.20.09.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 09:29:52 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 1/8] python3-numpy: Upgrade to 1.19.4
Date: Fri, 20 Nov 2020 09:29:43 -0800
Message-Id: <20201120172950.1619754-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Unify inc file into single recipe, py2 is gone

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/python-numpy/python3-numpy_1.19.3.bb  | 3 ---
 .../{python-numpy.inc => python3-numpy_1.19.4.bb}           | 6 ++++--
 2 files changed, 4 insertions(+), 5 deletions(-)
 delete mode 100644 meta/recipes-devtools/python-numpy/python3-numpy_1.19.3.bb
 rename meta/recipes-devtools/python-numpy/{python-numpy.inc => python3-numpy_1.19.4.bb} (94%)

diff --git a/meta/recipes-devtools/python-numpy/python3-numpy_1.19.3.bb b/meta/recipes-devtools/python-numpy/python3-numpy_1.19.3.bb
deleted file mode 100644
index d388e88d25..0000000000
--- a/meta/recipes-devtools/python-numpy/python3-numpy_1.19.3.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-inherit setuptools3
-require python-numpy.inc
-
diff --git a/meta/recipes-devtools/python-numpy/python-numpy.inc b/meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb
similarity index 94%
rename from meta/recipes-devtools/python-numpy/python-numpy.inc
rename to meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb
index 40f81046ee..d54f2f6c18 100644
--- a/meta/recipes-devtools/python-numpy/python-numpy.inc
+++ b/meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb
@@ -8,14 +8,16 @@ SRCNAME = "numpy"
 SRC_URI = "https://github.com/${SRCNAME}/${SRCNAME}/releases/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch \
            file://0001-numpy-core-Define-RISCV-32-support.patch \
-           "
-SRC_URI[sha256sum] = "9179d259a9bc53ed7b153d31fc3156d1ca560d61079f53191cf177c3efc4a498"
+"
+SRC_URI[sha256sum] = "fe836a685d6838dbb3f603caef01183ea98e88febf4ce956a2ea484a75378413"
 
 UPSTREAM_CHECK_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
 
 DEPENDS += "python3-cython-native"
 
+inherit setuptools3
+
 S = "${WORKDIR}/numpy-${PV}"
 
 CLEANBROKEN = "1"
-- 
2.29.2

