Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.42906.1606636086238636560
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Nov 2020 23:48:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=W/Ga+OqH;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id s2so4746515plr.9
        for <openembedded-core@lists.openembedded.org>; Sat, 28 Nov 2020 23:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8dJ7+AetwbDlhZvui1KZsqBxI1i1KJsxUscJSm+x6r8=;
        b=W/Ga+OqHLLt6obJycFMdxEXccjCdSkwxbtFNZidOm5VBGMswUwHbbpeiuvUk7vk5+T
         BoCmSrwor1GWlKulVBRhBksRd/zr+CZhXZ+bTQ5GyQAlNpw6uaQg2WXkXtm6IuEWU6BF
         zMCa7DCfdnSvwUnkBAb07sCrkmi6xkCYQJma/+DHTom9xt84TGLrYXhJa34m1EHxeQlY
         MgN9Bi4jCZgifUV5bjc2b1KpcOfwPCPdNIsi2JbwZrTGnB3U3JJ9Fo4QWXyPc93j2Ur+
         ltJ/wN4xMWYqC/aWeMODt7WSxxnevrb/dYH2+XUVIWtzW09OgFj+u5dMnalKS+ITo04v
         TxmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8dJ7+AetwbDlhZvui1KZsqBxI1i1KJsxUscJSm+x6r8=;
        b=W4qVQPFRZsBQR+tkCv6sXmM1uPmJc8vglnryKfteEcFRzFLJlIiixRyOa/x3yMG+4c
         pJnVAbOSFpT3L+9e48vHMarbqKmAz2oqrZjrPxzCJME2vhzswtqKULd6DhEs6Zppyp0J
         2+FaMR1AzZgzwdKtAc/3YtWwDKNYKexNU8rDwHfCkdcrQvFsK5Ns87mkdNSmvkC1i87K
         OYhy8Lo7NC/mwGK9OTQShvAMwvrSXuKMgfIOY9mo9G2NzRDRVwKjXsmk21nyeGGR4LDS
         OuWB3oeWtoAPRgD5kSBN4iJe/chYw9JDXkVRaKs6NzmaUSNTDHumG46TTk+vwlD2PA6a
         eXeA==
X-Gm-Message-State: AOAM5323lOcxRa3pmZ7epuQRNwIKym5iFNLOyX7MTBuwf0eEsRJBwmIp
	94rBnoHN3VMUvC354UzURpdfkSU4qPrY9w==
X-Google-Smtp-Source: ABdhPJy5YpzWPqKrlhI6/tScxui+djwdYvrHep+dibs9xWuvymZlhwcQtGw+nMfC68jr2BPtHkoiwA==
X-Received: by 2002:a17:902:ab98:b029:d8:c5e8:978a with SMTP id f24-20020a170902ab98b02900d8c5e8978amr13698721plr.56.1606636085521;
        Sat, 28 Nov 2020 23:48:05 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::49d7])
        by smtp.gmail.com with ESMTPSA id z20sm12905267pjq.16.2020.11.28.23.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2020 23:48:05 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v5 2/5] python3-numpy: Add ptest
Date: Sat, 28 Nov 2020 23:47:59 -0800
Message-Id: <20201129074802.1493537-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201129074802.1493537-1-raj.khem@gmail.com>
References: <20201129074802.1493537-1-raj.khem@gmail.com>
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

