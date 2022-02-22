Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6070CC433FE
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 19:17:06 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web12.1857.1645557425787358924
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 11:17:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dNaL9zOS;
 spf=pass (domain: gmail.com, ip: 209.85.210.178,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id y11so13061355pfa.6
        for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 11:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=mpwwhqXqkzlqacdHpK5rV/x2IN4b9I44GIVlmd98dKM=;
        b=dNaL9zOSmV6lwP45Dz0ZPCNZdqyfIcgeXdajsXBXFy8wnMvCFRgp07PgZ1IoW05Pr9
         e4GLkx1mYMeDdbTuzH/dhH801YHpgGcuDw9QbExOKdiEqg4dE6Qv3kngap8xHNtKQWvM
         /r5+Jtvd3EoWG73zdH0NMgm19VA6T2zIfuXcie3M4w4/IEBsZ1xKC7ru3Nd4/k5J0O1D
         aFZx0cyn+3WYZDhRvkTYRLV5F5jYnbXBYuogB52LBlowghSzxGFazd2cl+pocrTvq3K9
         OBcdTXRp/tFWcf4gKzlNzx5x6JAHNnt0arpPokyM7c5bI2nRMSnjJc/b6DkyWxwR9pzb
         /voA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mpwwhqXqkzlqacdHpK5rV/x2IN4b9I44GIVlmd98dKM=;
        b=N/+JUfXrEN+YzZgXw8Bu/9iriwSM4+1qwmU4YPJwgWKcHzXpt5T5/3e3axrHire+3i
         +FAzxgmaxx+sm5+cBXDptq4sTM8VFKMg5FlmnmMsbdhCqAssqMDMvZu9743+fcS9pl4S
         gWe+eAlBG5O5aJDteFoWnEfnBf7LTdEa85LXuYiHPApS2opjkwN4NWsDgdyNsqSR03aO
         aiid1NAT8TxM+nbQYglkuw0qHbqeiAXIpOmnczQoL3ZIQhXgOPS4yeZjtE0l8Ak7a8HH
         3DQOcukRdyV6QR7Xgyjw5ldo5nzbF4VZF8O3kcjTUHt3WvMTgvEJlxKiiXo8Kx8jmQcu
         g7ug==
X-Gm-Message-State: AOAM5338cdJWuaQcMqZE2ZWZdaqe6U8CLXMPIJgGPNDflotCBagf15yq
	aW8PJSXnRr6IZ/qd4r8UKY+uBUTp8l1K9w==
X-Google-Smtp-Source: 
 ABdhPJwUW/jss0r5s70gGGYLFVcQN0Yx5xcZdoubyP6Md2stKYguMx9Lhmhh8Fe306NKFA93dWPMdA==
X-Received: by 2002:a65:4d4f:0:b0:372:a6e1:f675 with SMTP id
 j15-20020a654d4f000000b00372a6e1f675mr20922723pgt.112.1645557424862;
        Tue, 22 Feb 2022 11:17:04 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d208:bddf:2b06:2b5a])
        by smtp.gmail.com with ESMTPSA id
 z13sm18402700pfe.20.2022.02.22.11.17.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 11:17:04 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 02/32] python3-flit-core: add recipe for 3.6.0
Date: Tue, 22 Feb 2022 11:16:28 -0800
Message-Id: 
 <bffca70cfbf50d5bfc63e617115dfa6a460a6ac3.1645557032.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1645557032.git.tim.orling@konsulko.com>
References: <cover.1645557032.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 19:17:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162193

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


