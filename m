Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web12.4221.1632003539833064803
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Sep 2021 15:19:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com header.s=20210112 header.b=WFxJEzC8;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.167.45, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f45.google.com with SMTP id e15so10681734lfr.10
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Sep 2021 15:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mm7AgiHZY7reAJEou0YMI/S6V2LAW25svuyAk6zSzyI=;
        b=WFxJEzC8Lw7LpVru+6sS+KnQJEsRngFN4aGQzV5ZTiCj+njFDUiW8jqAujmu780r2i
         CIqD5jZM+CqczIzoZFchIx/8V9fE1ElLwT9Y81pmqo7f3M0fmJ/jGLu8MzXFJXGIbmeY
         8E999V5QwvlMrCelQuhpzc7ZhIAfGBQCxCTIA8bVHpqnqCVAOLSqiUhZJ5sgX69+bAfN
         bod5GQd6NRH2IUdlOm9ntltNczpOMV7hi1oCXkEVaG9SBusLCqtqhxSEf6swDL71LVF/
         olKyoo0xWfax3rG0I/m1Yms9L0Y9+Py4nb/+9z50FRelYUZpk/Z8xu9mnOHi6C6doBZr
         5Z2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mm7AgiHZY7reAJEou0YMI/S6V2LAW25svuyAk6zSzyI=;
        b=RRge62f9EDueUvMxfb2/46UysuvOWJdIzP4DnJ/YcaFhjdrnhoghMybSCQ4YolOKQH
         +tWVtTX3/YddMBfL44wDBuF3oy3Txxd9dtXDIS0MEvMNJHtCPOwPvVTGyxBP/8ErGZue
         f3VxJF5wqftglKJKTto5C4kb2wNrpjWOZszM+jhT8sDUeqiCbyeMlg6drXnNB9DKQgpa
         29pVqz5myukQ4YHf5QWmckCy+/KrlqjAYWttHs5qV7rzLBHxAFZI0R7OeFuXsBRlGLk4
         Rx0ZT11BHCx57NrUT+/93+yqFRcRIAcn6BN249msrEgEXJHlrtYhTX7ws83vEQuQkoTe
         WmtQ==
X-Gm-Message-State: AOAM531wkqvmtgZ7s6p6jCwF4HJbySxl0Oy1KYux3QipJiMe1LXp4h/t
	XSjb3y28rrifUALXg/xT5speCFKS8fLEb2lp
X-Google-Smtp-Source: ABdhPJz+MGR4nW2gIrMtYPyswfVIVyDMQjXtoW2poRrj46ya8thLBVGoJw5ikrsQvjvdBpQO3vkAdw==
X-Received: by 2002:ac2:4e6b:: with SMTP id y11mr66824lfs.439.1632003537784;
        Sat, 18 Sep 2021 15:18:57 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id r200sm866917lff.115.2021.09.18.15.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Sep 2021 15:18:57 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH 2/2] python3-setuptools: minor cleanup
Date: Sun, 19 Sep 2021 00:18:52 +0200
Message-Id: <20210918221852.2284913-2-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210918221852.2284913-1-open.source@oleksandr-kravchuk.com>
References: <20210918221852.2284913-1-open.source@oleksandr-kravchuk.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../python/python3-setuptools_58.0.4.bb       | 46 +++++++++----------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-setuptools_58.0.4.bb b/meta/recipes-devtools/python/python3-setuptools_58.0.4.bb
index 2000d355a9..8df69ce920 100644
--- a/meta/recipes-devtools/python/python3-setuptools_58.0.4.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_58.0.4.bb
@@ -15,25 +15,25 @@ SRC_URI[sha256sum] = "f10059f0152e0b7fb6b2edd77bcb1ecd4c9ed7048a826eb2d79f72fd2e
 DEPENDS += "${PYTHON_PN}"
 
 RDEPENDS:${PN} = "\
-  ${PYTHON_PN}-2to3 \
-  ${PYTHON_PN}-compile \
-  ${PYTHON_PN}-compression \
-  ${PYTHON_PN}-ctypes \
-  ${PYTHON_PN}-distutils \
-  ${PYTHON_PN}-email \
-  ${PYTHON_PN}-html \
-  ${PYTHON_PN}-json \
-  ${PYTHON_PN}-netserver \
-  ${PYTHON_PN}-numbers \
-  ${PYTHON_PN}-pickle \
-  ${PYTHON_PN}-pkg-resources \
-  ${PYTHON_PN}-pkgutil \
-  ${PYTHON_PN}-plistlib \
-  ${PYTHON_PN}-shell \
-  ${PYTHON_PN}-stringold \
-  ${PYTHON_PN}-threading \
-  ${PYTHON_PN}-unittest \
-  ${PYTHON_PN}-xml \
+    ${PYTHON_PN}-2to3 \
+    ${PYTHON_PN}-compile \
+    ${PYTHON_PN}-compression \
+    ${PYTHON_PN}-ctypes \
+    ${PYTHON_PN}-distutils \
+    ${PYTHON_PN}-email \
+    ${PYTHON_PN}-html \
+    ${PYTHON_PN}-json \
+    ${PYTHON_PN}-netserver \
+    ${PYTHON_PN}-numbers \
+    ${PYTHON_PN}-pickle \
+    ${PYTHON_PN}-pkg-resources \
+    ${PYTHON_PN}-pkgutil \
+    ${PYTHON_PN}-plistlib \
+    ${PYTHON_PN}-shell \
+    ${PYTHON_PN}-stringold \
+    ${PYTHON_PN}-threading \
+    ${PYTHON_PN}-unittest \
+    ${PYTHON_PN}-xml \
 "
 
 do_install:prepend() {
@@ -48,8 +48,8 @@ BBCLASSEXTEND = "native nativesdk"
 PACKAGES =+ "${PYTHON_PN}-pkg-resources "
 FILES:${PYTHON_PN}-pkg-resources = "${PYTHON_SITEPACKAGES_DIR}/pkg_resources/*"
 RDEPENDS:${PYTHON_PN}-pkg-resources = "\
-  ${PYTHON_PN}-compression \
-  ${PYTHON_PN}-email \
-  ${PYTHON_PN}-plistlib \
-  ${PYTHON_PN}-pprint \
+    ${PYTHON_PN}-compression \
+    ${PYTHON_PN}-email \
+    ${PYTHON_PN}-plistlib \
+    ${PYTHON_PN}-pprint \
 "
-- 
2.25.1

