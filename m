Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E62CC433FE
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 01:27:59 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web12.5659.1645406878203380748
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Feb 2022 17:27:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NKLH+cXa;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id
 q11-20020a17090a304b00b001b94d25eaecso13975504pjl.4
        for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Feb 2022 17:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=093y63bB3YtgqKbIKttkCteNoSK7hltsyxc9FyW4ZE0=;
        b=NKLH+cXaTmE/RyIAHdNhvWqIeHiY+XZwx8L783uCfn0Xote/Fa56EECJYBFlgS0nUy
         t1LDAoiR9uoUvFBb21TQ57W3NpL5Cf9ZOjw62o8HIdAEy4jvoBvjGdO44fhY50buQ3E3
         qwXnwd8bKOrqjf+WXhhb1Eaq5bH68sGnHQHDn39sHZU5Lra3ynNF6bKDY2ru9QfIoCW8
         RzSKbtajg3taEgQ2N/qoY/RPW3mlTnlXEY08YwuhTM/azZT7oFhsRtUwOtxRjoA/xzVV
         VlXmwu53HsgH1EA5HKgR+pho39bStnu5eZ++sFNjz0bLW0X4JXKFwfXGKTvtd8JR76Qe
         pWLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=093y63bB3YtgqKbIKttkCteNoSK7hltsyxc9FyW4ZE0=;
        b=h+iiRQZR5GkoePjSds280dfbV6hnsp7ydXLq8N35dfOqMR5j2EZ2UqkO9v7EnSTNdZ
         1PpEzTYMNh6bwQSwliv04L6J8FLWOdbVamHBBlXuTuEtkGkMhtqQTANWewCT2tqDlQQz
         Fa9/Gf60dFgQsT+TpD/RjYedbOpYiS6e29LpADsg3cYMp9wtbYPLJAhJTSx+6YmBtac4
         +o9fsDj6YrP5uNAx1lBgwoZcC2vXQjxQ+0MZoAn1kvz3IZGYxW8SH9HPKTGEDkwF6yV9
         vYQ5CADTZgnCsc1pNKoz1VEBiiEefm7/I41YaaKraK1svoDL/8jTGDEgdaMaZ72gwE40
         2LWg==
X-Gm-Message-State: AOAM5314o9J8TRTkijdR1mLrZRyjr2WIPbw+XG3yD76BCX2wEudQd2J0
	1UJg7mVbPADoS3lkC+x+gSxXltIvKS2VpA==
X-Google-Smtp-Source: 
 ABdhPJwgYSOEqB0zpD8Lar+O+xW4qOzq1vrmlXXFRzOBiKKwGY77y+1uK+44CYXuV3VZaCarb8ZtcA==
X-Received: by 2002:a17:90b:3eca:b0:1b9:b85e:87f6 with SMTP id
 rm10-20020a17090b3eca00b001b9b85e87f6mr23354282pjb.132.1645406877246;
        Sun, 20 Feb 2022 17:27:57 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:f2b0:3951:ce8:8dfd])
        by smtp.gmail.com with ESMTPSA id
 e20sm10252937pfn.4.2022.02.20.17.27.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Feb 2022 17:27:56 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 02/19] python3-flit-core: add recipe for 3.6.0
Date: Sun, 20 Feb 2022 17:27:31 -0800
Message-Id: 
 <479b42fec238a94ac1a4f8b903071667847f6bb1.1645405471.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1645405471.git.tim.orling@konsulko.com>
References: <cover.1645405471.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 01:27:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161994

This is the core of one of the "new build system" tools, although not
officially part of the pypa (Python Packaging Authority) repositories,
it is an increasingly common build tool (e.g. typing_extensions and
tomli) as declared in pyproject.toml for said packages.

This package provides a very simple bootstrapping method that builds
the source tarball (build_sdist) and a wheel (build_wheel).

Wheels are the official vehicle for delivering Python packages now.
Eggs (egg-info) are deprecated and will increasingly go away.

[YOCTO #14638]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/python3-flit-core_3.6.0.bb         | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-flit-core_3.6.0.bb

diff --git a/meta/recipes-devtools/python/python3-flit-core_3.6.0.bb b/meta/recipes-devtools/python/python3-flit-core_3.6.0.bb
new file mode 100644
index 00000000000..4221076bc73
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-flit-core_3.6.0.bb
@@ -0,0 +1,35 @@
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=41eb78fa8a872983a882c694a8305f08"
+
+SRC_URI[sha256sum] = "b1464e006df4df4c8eeb37671c0e0ce66e1d04e4a36d91b702f180a25fde3c11"
+
+inherit python3native python3-dir pypi
+
+DEPENDS += "python3 python3-pip-native"
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
+    nativepython3 -m pip install -vvvv --no-index --target ${D}${PYTHON_SITEPACKAGES_DIR} ./flit_core/dist/flit_core-${PV}-py3-none-any.whl
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


