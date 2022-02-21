Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ECD4C433EF
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 21:24:02 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web09.4676.1645478641450818747
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:24:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZnhoOqzY;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id
 q8-20020a17090a178800b001bc299b8de1so399834pja.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:24:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=mpwwhqXqkzlqacdHpK5rV/x2IN4b9I44GIVlmd98dKM=;
        b=ZnhoOqzYurn3MdX5kM1Zm06GQOAEQLA/KRcHCqaHmyovsWQ0Gg0ThS4yu6ZmNhERrS
         Vw2lS17IKS07z0rB7S7ew3O2grfbN6Jn7fFchJqIOeGn1V5Vy/s1DIO2Dob0Br/UqULy
         LEfN0GHDztv5CS3zMn7UUVNDpziX1lA6Xl5FGznOQTUwntAWSA1YX1LW5DWc3/7uMCm0
         fomrXo7dIC5rYrZpSRDrzcy3oQxaK1n9NDrqQvoKcK44zuCzRsXpL53xiXBUwGqXUCy6
         Tl15buSV5iD15FmLORDpaLxMJx06fLPD7YFmmIAXJTTkJYDKokMCGcD22Taxub+q50pg
         BUBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mpwwhqXqkzlqacdHpK5rV/x2IN4b9I44GIVlmd98dKM=;
        b=dCL7mOe0cNtJh9pNgNw1406HQk4q26W5xs/qlV62E57ZKq7SNd/bcG6VfRI2/yJFbh
         dVE9Cd9VSxOO6KlOvPkIwSIKBRTG9WrXfSw3KYt9D6pmZLWISlSSqMYzYFiaeIzAbgya
         hraMlI1m3I3XHwkxIjTlpMxGVtjY+qbbhTeo/3TF7ra/jenWSq+gv3PNWf2revTYrQoF
         B52hjYkvjuAYu7Ac5dnE6Zv7YJF6UhPvUuKXD6B7daCMqj+NmYOwVLsZH5pyFuCEM6Ab
         TOBWX58bTcC+qW1TZpWKOf0t8FefhuuxvGoLzKWKQ9RZpbLMjx88MD+cywt/9a3mQdsk
         5Xwg==
X-Gm-Message-State: AOAM533ok8Xa6cEUbUv1824c/S0r1mEkEmVVWq9Jhb4FN4GlEMPv/hjf
	GkPKOY+50cuve+FUz1QmNY8c8ze3udiMfQ==
X-Google-Smtp-Source: 
 ABdhPJxpje2YUU+t3/Vyh3vQBV8evNOh/NB34C5x3DMmq1jQUKxtz20hGN/sx5dXdDSleTopVzl+VQ==
X-Received: by 2002:a17:90b:23c7:b0:1bc:50bb:56dc with SMTP id
 md7-20020a17090b23c700b001bc50bb56dcmr830156pjb.140.1645478640520;
        Mon, 21 Feb 2022 13:24:00 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d01c:96b7:6393:8c56])
        by smtp.gmail.com with ESMTPSA id
 n85sm14081529pfd.142.2022.02.21.13.23.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 13:24:00 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 02/32] python3-flit-core: add recipe for 3.6.0
Date: Mon, 21 Feb 2022 13:23:17 -0800
Message-Id: 
 <13180631fc6ab4d64fcca8e8458d7f8995b0031a.1645478020.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1645478020.git.tim.orling@konsulko.com>
References: <cover.1645478020.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 21:24:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162078

This is the core of one of the "new build system" tools--hosted
officially as part of the pypa (Python Packaging Authority)
repositories--it is an increasingly common build tool (e.g.
typing_extensions and tomli) as declared in pyproject.toml for
said packages.

This package provides a very simple bootstrapping method that builds
the source tarball (build_sdist) and a wheel (build_wheel).

Bootstrap -native by simply unzipping the wheel to
PYTHON_SITEPACKAGES_DIR.

Use pip to install the wheel for class-target.

Wheels are the official vehicle for delivering Python packages now.
Eggs (egg-info) are deprecated and will increasingly go away.

[YOCTO #14638]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../python/python3-flit-core_3.6.0.bb         | 41 +++++++++++++++++++
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-flit-core_3.6.0.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 72cd0125814..7a65612b7c6 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -599,6 +599,7 @@ RECIPE_MAINTAINER:pn-python3-pycryptodome = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-pycryptodomex = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-pyrsistent = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-extras = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER:pn-python3-flit-core = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-git = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER:pn-python3-gitdb = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER:pn-python3-hypothesis = "Tim Orling <tim.orling@konsulko.com>"
diff --git a/meta/recipes-devtools/python/python3-flit-core_3.6.0.bb b/meta/recipes-devtools/python/python3-flit-core_3.6.0.bb
new file mode 100644
index 00000000000..d0b88c3fa50
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-flit-core_3.6.0.bb
@@ -0,0 +1,41 @@
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=41eb78fa8a872983a882c694a8305f08"
+
+SRC_URI[sha256sum] = "b1464e006df4df4c8eeb37671c0e0ce66e1d04e4a36d91b702f180a25fde3c11"
+
+inherit python3native python3-dir pypi setuptools3-base
+
+DEPENDS:append:class-target = " python3-pip-native"
+DEPENDS:append:class-native = " unzip-native"
+
+# We need the full flit tarball
+PYPI_PACKAGE = "flit"
+
+do_compile () {
+    nativepython3 flit_core/build_dists.py
+}
+
+do_install () {
+    install -d ${D}${PYTHON_SITEPACKAGES_DIR}
+    PYTHONPATH=${D}${PYTHON_SITEPACKAGES_DIR} \
+    nativepython3 -m pip install -vvvv --no-deps --no-index --target ${D}${PYTHON_SITEPACKAGES_DIR} ./flit_core/dist/flit_core-${PV}-py3-none-any.whl
+}
+
+do_install:class-native () {
+    install -d ${D}${PYTHON_SITEPACKAGES_DIR}
+    unzip -d ${D}${PYTHON_SITEPACKAGES_DIR} ./flit_core/dist/flit_core-${PV}-py3-none-any.whl
+}
+
+FILES:${PN} += "\
+    ${PYTHON_SITEPACKAGES_DIR}/flit_core/* \
+    ${PYTHON_SITEPACKAGES_DIR}/flit_core-${PV}.dist-info/* \
+"
+
+PACKAGES =+ "${PN}-tests"
+
+FILES:${PN}-tests += "\
+    ${PYTHON_SITEPACKAGES_DIR}/flit_core/tests/* \
+"
+
+BBCLASSEXTEND = "native nativesdk"
+
-- 
2.30.2


