Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web08.31152.1606112040663455315
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Nov 2020 22:14:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AU2elcUL;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id j19so13266368pgg.5
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Nov 2020 22:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2EIy7Q6FfxeCeX9jyB0TBbB96yGIoMqahs6K6cfFftE=;
        b=AU2elcULOIH0AhNa/rzhBF2OePO9XWn6qfxGPz55/QjSgysEDODfjctU95Gsdxu29w
         vVJvhgvUv1HnECLRoXgHBlpuNNaYMdf00nj8WLkRiCfxF8sxLpZx7MylpW1xwhYsJuq9
         TocQjYxZBstRvXfrFGwn7rJzneaRYv4fZzRyXr10PZSsm45lnHiH7wfOdWDy0bj185Lo
         xU6fShb8pJsHFy8gO+GMPEPEr26tKZ7v7oiEKSjr4g5xY3ddocq9rudYU8BTBUKdUNbo
         997QShKYqnhs7PHNyT9Cskukkit/qm+S1h+DKQH2UARrU0J5pSOXJ8KKGr9fktDF7XCo
         3P1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2EIy7Q6FfxeCeX9jyB0TBbB96yGIoMqahs6K6cfFftE=;
        b=OYmW4v1sr0azJJlODJP4Y7JETiAfDJJkWbkE/YmUoIKMBeX/+yMS48TUUT26o/iABB
         HqdoTtAeBa+/nZb7p0+z3Dj/RKx/HLzMumOSKoJgYQoR8lZsSuWKROLP9DyJ9zB0PIVD
         PqPWsn61zWzAD6n9A9xo7NnnjbQteJ4qc+0ahQkPY0w0z9gsDD5d2WRfMyS+A7Rb+bdh
         Mb3sMczllhnW6Ct3JQ2rkFNTkrd46GDXWhZ2J9nFkbQtQacPpVs8ryJZTU6y1q2ypnoC
         uAErR+mgekkSIXaqW4DWoeLgqHqI6ZzLQmY5wy00fsoHNHaOnhMUpsiNhagyy8xgk07o
         z1bg==
X-Gm-Message-State: AOAM532BD6ZRNL/cSFJ9W++ivS/Rrsgle/e/hHA1w1mFa+zPwFjJWjFI
	dD18qYUGp2i3uwOD301qC4v9LSbQ9ccZRQ==
X-Google-Smtp-Source: ABdhPJxtEeP9xlbTlWrOfNXqvTqB+qdGdHWWYH400B0tB6fQ717FQ1+6NXA6CzYa+i9r2Fq2TbOrqA==
X-Received: by 2002:a63:ff10:: with SMTP id k16mr25761948pgi.328.1606112039714;
        Sun, 22 Nov 2020 22:13:59 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::b756])
        by smtp.gmail.com with ESMTPSA id a3sm10581674pfo.46.2020.11.22.22.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2020 22:13:58 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v4 1/4] python3-numpy: Upgrade to 1.19.4
Date: Sun, 22 Nov 2020 22:13:55 -0800
Message-Id: <20201123061355.2996856-1-raj.khem@gmail.com>
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

