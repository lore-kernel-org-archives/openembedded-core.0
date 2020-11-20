Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.641.1605893399116398511
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2020 09:29:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jUjYQAdp;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id v21so3940730plo.12
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2020 09:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8dJ7+AetwbDlhZvui1KZsqBxI1i1KJsxUscJSm+x6r8=;
        b=jUjYQAdpas2yl64RqR6tfaujqOhDqxPnDQULbpnUr2t9EYizEDNOVGW6mViiU/MrTI
         Do9a/Yne2uW4fVOuzglslhroBL5AricRypzsYz1ct4EPpxEOIU1yZAFI9Vj2aCI+iBWZ
         s1WULKMpEOv8pV3RmTWh4VWBLXUxnv++ArxFx1AyVCOihSWAv1DX4WEc4gPxt6rgSApn
         xVpPHkGGGjC4C2v8g5yABIirVk+uInoA0/+KndnAg1rdt6tWplCh2cRYioW6bOM7joDO
         m4uKPcFW0onjnBOTKL4dehK7VxJWhPVTS9Us5arY7L7N8alF2MkgzLrpJ3ngo/1NvQ15
         YGiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8dJ7+AetwbDlhZvui1KZsqBxI1i1KJsxUscJSm+x6r8=;
        b=iwl9VQamZIHyQ1m/pGXmAGAxBZI504f1ODRLuWWvn72TfE4EK33mZotLynJvdSS+BP
         w2/rxWD7R/vFjtN1g0h4peV0W8OGLRaQF6PkKijLstAoDfMfy7ZHw3gMLEt+aZC00bat
         vjmiuLaa39vbO47NU9C0OwfoODH/ZOFsuJEgvYIPVpXL/Igql6hA0a1451InO+b4dFKE
         HnyAR8/ReDO1RmH+sheXIkz1tGHjlYDFzNGMX3LMnCp6MHhVH/ZqObVjNz6cMb2MBscB
         cwYYf2mARVAXds+HtYs/hwXgZH6nPdHFRAdWL0e7goiru6WfWaXOB0k/TmXO0/GekJ+1
         kB/g==
X-Gm-Message-State: AOAM5316LJMlo5nsy7+Q5tX3lgHRh9KqW/hwMscYd94s1Cozsgo5BAxI
	ITjIroBA4nTr0iEaUWDCZ7PxREP+D+9CRg==
X-Google-Smtp-Source: ABdhPJwVz3ob8SSUt3sNDBygm9k4e6+WxGeq4ikQ9kjXXbA9IzAl67FCNkRghB6s54iTcrMdWbBECg==
X-Received: by 2002:a17:902:9a4c:b029:d6:1f21:8021 with SMTP id x12-20020a1709029a4cb02900d61f218021mr14444244plv.58.1605893398332;
        Fri, 20 Nov 2020 09:29:58 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::b756])
        by smtp.gmail.com with ESMTPSA id x61sm4855684pjj.4.2020.11.20.09.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 09:29:57 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 4/8] python-numpy: Add ptest
Date: Fri, 20 Nov 2020 09:29:46 -0800
Message-Id: <20201120172950.1619754-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201120172950.1619754-1-raj.khem@gmail.com>
References: <20201120172950.1619754-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since 1.15, numpy have replaced nose with pytest testing framework
it additionally needs hypothesis and sortedcontainers modules

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/python-numpy/files/run-ptest         | 5 +++++
 meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb | 7 +++++--
 2 files changed, 10 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/python-numpy/files/run-ptest

diff --git a/meta/recipes-devtools/python-numpy/files/run-ptest b/meta/recipes-devtools/python-numpy/files/run-ptest
new file mode 100644
index 0000000000..9a1c72aeb1
--- /dev/null
+++ b/meta/recipes-devtools/python-numpy/files/run-ptest
@@ -0,0 +1,5 @@
+#!/usr/bin/env python3
+
+import numpy
+numpy.test(label='full', verbose=2)
+
diff --git a/meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb b/meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb
index d54f2f6c18..b484e7cddc 100644
--- a/meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb
+++ b/meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb
@@ -8,6 +8,7 @@ SRCNAME = "numpy"
 SRC_URI = "https://github.com/${SRCNAME}/${SRCNAME}/releases/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch \
            file://0001-numpy-core-Define-RISCV-32-support.patch \
+           file://run-ptest \
 "
 SRC_URI[sha256sum] = "fe836a685d6838dbb3f603caef01183ea98e88febf4ce956a2ea484a75378413"
 
@@ -16,7 +17,7 @@ UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
 
 DEPENDS += "python3-cython-native"
 
-inherit setuptools3
+inherit ptest setuptools3
 
 S = "${WORKDIR}/numpy-${PV}"
 
@@ -30,7 +31,6 @@ RDEPENDS_${PN} = "${PYTHON_PN}-unittest \
                   ${PYTHON_PN}-pprint \
                   ${PYTHON_PN}-pickle \
                   ${PYTHON_PN}-shell \
-                  ${PYTHON_PN}-nose \
                   ${PYTHON_PN}-doctest \
                   ${PYTHON_PN}-datetime \
                   ${PYTHON_PN}-distutils \
@@ -39,6 +39,9 @@ RDEPENDS_${PN} = "${PYTHON_PN}-unittest \
                   ${PYTHON_PN}-netclient \
                   ${PYTHON_PN}-numbers \
                   ${PYTHON_PN}-pydoc \
+                  ${PYTHON_PN}-pytest \
+                  ${PYTHON_PN}-hypothesis \
+                  ${PYTHON_PN}-sortedcontainers \
                   ${PYTHON_PN}-pkgutil \
                   ${PYTHON_PN}-email \
                   ${PYTHON_PN}-compression \
-- 
2.29.2

