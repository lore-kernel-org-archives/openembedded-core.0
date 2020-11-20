Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web08.599.1605893271081440282
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2020 09:27:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qMzpwRGr;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id q28so7864675pgk.1
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2020 09:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8dJ7+AetwbDlhZvui1KZsqBxI1i1KJsxUscJSm+x6r8=;
        b=qMzpwRGrg8e9r+FS20m4bPtqYQD2boqWsmU5Q28EmOL0Ky0e73PbPcrQ6fkk0oYGbe
         sz2aQsahlg53euc7TWOGSWD90LsnOwpW03kAT3n3H/ymaJmzLYKFgqTrCOH3UcXQxBzR
         iRSqDWtp4i3OcWVSGQF9fKQMuF4NVADDhKo5WPEaJHyIOVOKkaVgpluEpJ3vCLgW3UIU
         33PBdaitNE5BqRVOPGo79raoeExRgFGFccKuLBHIQKKjLxPd5pwNtdqrRZAtrbW4yp8G
         vdl5OehjHzU/ewdd1YiqWhTetXbkYsovEoWG4tfvcfSu6XrpTEVoyR6K1U4FogEFRJzk
         tcQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8dJ7+AetwbDlhZvui1KZsqBxI1i1KJsxUscJSm+x6r8=;
        b=IA8nCFqTE2NEp7ekPPV10zriUN5TWKYXHpvSaIkokRMP62IZ7RkGZ+UpjgyNJIGuxd
         b0K1vI/utvUQDzuH/OLo7geEjV7RCpQ0PpgRp2c6cTU1IOn9U/3GNZsZjejO666Ah6dU
         jUbXjKl6p/5/zq0CCMjlMVI4yAYCe/wX+wK4jWowt/Z2pxae3ACkArYOrf46RGiu/OW7
         RC0k9ze10oZQDv3jjg4qiQOJosz7N8jC1TCjlMPV1efLTWKhAdUzoJg41efYbu5ofAMB
         xHUWaGuEFidzRpeKo/G2rT/qIDRAgtMzB7RcbVBnD7ZrpSQrDbMDd7fEC2CLk1UA5Z5Z
         5qOA==
X-Gm-Message-State: AOAM532+Ibp3wxeeGgkbYdY3Oy1RvahfBYRAFKKelCv6/wk+s4gzA9Hq
	tZKDbnSdUMNbdYk2WT4IWqc3Qk08le0FTw==
X-Google-Smtp-Source: ABdhPJw+LxLgnoqZOfOFshdFQZjLiHOLbCUQaHgpjpQn3RdwxpVYpa6yeM5S+Zcu7h+im2xgQ+FEHw==
X-Received: by 2002:a63:d213:: with SMTP id a19mr18458688pgg.406.1605893270314;
        Fri, 20 Nov 2020 09:27:50 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::b756])
        by smtp.gmail.com with ESMTPSA id a23sm4398696pfl.29.2020.11.20.09.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 09:27:49 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 4/7] python-numpy: Add ptest
Date: Fri, 20 Nov 2020 09:27:39 -0800
Message-Id: <20201120172742.1594854-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201120172742.1594854-1-raj.khem@gmail.com>
References: <20201120172742.1594854-1-raj.khem@gmail.com>
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

