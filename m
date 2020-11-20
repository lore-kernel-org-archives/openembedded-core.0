Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.622.1605893266937309338
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2020 09:27:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PCjzwJ1a;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id b63so8480251pfg.12
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2020 09:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2EIy7Q6FfxeCeX9jyB0TBbB96yGIoMqahs6K6cfFftE=;
        b=PCjzwJ1aayImU+o8lcWFaN91cXsACLdW/Y/Z4PgDo7p1UP1SMUOYLSImBVJw6EzhxY
         ruwSzoCppIHY3g0bUzP4M0MiNcrNJaMuCruJROjfCNXzFxKcqGz2D1rk2LtWFJqECpt3
         OeB+MbW83RQ9kyV3oqU+0KV6qsc2meyzD8BTfUkfsy+2qCMrtsi7U9xgvhujArTUM5a6
         7WVXrhNmKIvk52fEUcdsOUyvVvnqu3GJfOc3fNPR13m1OjPLASU+tD2vO7hSIdC/dUKP
         tCD3vb6zPaVoMCrbC25UMzlQpAE8JigxTzNx9Xu39mDXsF/LPyHTkN5vbZk5dQW1JiGC
         Z6xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2EIy7Q6FfxeCeX9jyB0TBbB96yGIoMqahs6K6cfFftE=;
        b=P1yiKCM73DBEB/OJ2phut9ZZVkQJcPm6Ith4jVgx7TbXN8u61chO+KPlUBjq9Bw/j0
         iD5ZXVyunSjVQ1+m+U044ZKOYpc8nZWDFnjGWOOgVaEk8s5QxJ9Hjwu4O1B8ILzu71qC
         GRRz21X4yhjYq30a1uQ2NmR0GVjyIbnMRC8BqNeK/zF2mcoibvvwMYrX2SopcaVJgo/P
         Cm7RhEpq2VrQ5LFQrTCQ8PWL4I11dMj+G4DIBLjaQY1H8Kr6PkDRlm8sA2EJuH0DIOhI
         o68Lm1HcvBVBdZ0SXi9U2G752OQxCgKMpaOC4vWtPSJeYT43sDPnQKvKhRQJHBi2A040
         TzOg==
X-Gm-Message-State: AOAM531YsltydyYIJ2EztZH93Uj0QfIskpc1qc3+YEmgEn2O7iFTE1ED
	zqXdeDNXnaid6vtXJUDYundqh5MWuPrleA==
X-Google-Smtp-Source: ABdhPJw+dF6rl6NpnAWYhjaxv7czqdo7u3m7JinVRuAZCM42Zvm0cnfyWDfaMa+OmwwqUtQ77r28+g==
X-Received: by 2002:a63:f24f:: with SMTP id d15mr17735826pgk.276.1605893265846;
        Fri, 20 Nov 2020 09:27:45 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::b756])
        by smtp.gmail.com with ESMTPSA id a23sm4398696pfl.29.2020.11.20.09.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 09:27:45 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 1/7] python3-numpy: Upgrade to 1.19.4
Date: Fri, 20 Nov 2020 09:27:36 -0800
Message-Id: <20201120172742.1594854-1-raj.khem@gmail.com>
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

