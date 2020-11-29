Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.42905.1606636085558547021
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Nov 2020 23:48:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EYZkoMKf;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id q10so8212200pfn.0
        for <openembedded-core@lists.openembedded.org>; Sat, 28 Nov 2020 23:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2EIy7Q6FfxeCeX9jyB0TBbB96yGIoMqahs6K6cfFftE=;
        b=EYZkoMKfNJ8ZN7Km9Ts5zQuwXiGrUUaE4u8RS1BeVv5WJ/Z15tSW4vH8yoJQ7Bx1wQ
         i0oiicgLQKngSQ36B+s2gIF46XqqfkpFftbS5PIVVoR8XxDZx+/Zf0RfHHnE3gOlNkXj
         HgRYBr6BUX6CZfJWGniHNZGI09buQr/XVERqknnxM0OdGEgUVTB6R5UI6ghDyknNuQzy
         /lLg9DUP/qEbYBrN+YUeQ+NypWU96PpKzoqGLWdZe5j1R/lU9Ivwd3QTtIKWXfj5xpl6
         Cjz7EyqS0MiQSjG6Ukg/KEVtNReEfUAck82JaCP4P8Fu2gphG4zsW8bNz85NMQRUSe5O
         L+cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2EIy7Q6FfxeCeX9jyB0TBbB96yGIoMqahs6K6cfFftE=;
        b=AZGVHOQYFf/6Hzg/K634JlIy0bl0ohvpDjcb1MhjUnwFPHG9y5wWUgQA88LmF3cAvL
         PuJf7KCIfiwqhUOYoiFEXh7Y+AxCSxVCJcjjep3hBuceNKAJmG+4U29W9e6EeIRvso9+
         c54SaBO48uJvSfBq3os5Bep0RHYqE6lUF2GGYO0UJA7viiV7+SIXcyA3BfvtFupeInoV
         GfwU/gByuz7TJZr8mdJqtIGJ/z0k/9SofFV08gaqB7T+YwmCMwncq9myJYNRX7rBeDKJ
         KMas+dy/G6awSLIBASw6ftSNNWANhCEmuOv0aufhAxXAxPbyPY5Lix4ecV1VCq06CAyh
         SryQ==
X-Gm-Message-State: AOAM532j194RKY/94iiULSLWWWSzFFH58/GQnMwCiqRZ0Kug6E0pV5px
	tIH3JqZUjqE0P6ZfTTDMdomfsmrIMaPLMw==
X-Google-Smtp-Source: ABdhPJxmcmUpENy5fyG3V5LUMH9c+LnMhF0tMiPcsaKnILd9nGzUOC3LNC2dmX5uGSDnvCYZ1LY8IA==
X-Received: by 2002:a17:90a:5d0a:: with SMTP id s10mr20052826pji.160.1606636084610;
        Sat, 28 Nov 2020 23:48:04 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::49d7])
        by smtp.gmail.com with ESMTPSA id z20sm12905267pjq.16.2020.11.28.23.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2020 23:48:04 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v5 1/5] python3-numpy: Upgrade to 1.19.4
Date: Sat, 28 Nov 2020 23:47:58 -0800
Message-Id: <20201129074802.1493537-1-raj.khem@gmail.com>
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

