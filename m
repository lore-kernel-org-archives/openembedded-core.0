Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7B07C43217
	for <webhook@archiver.kernel.org>; Sun,  6 Feb 2022 21:53:25 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web09.14364.1644184404484068360
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Feb 2022 13:53:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fytxugYe;
 spf=pass (domain: gmail.com, ip: 209.85.208.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id cz16so7664461edb.8
        for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Feb 2022 13:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bGJuodjA8v4dDLiMdV5+f4n+JdNhtoj0NwYzxyKQVm0=;
        b=fytxugYeoA3MihhGwkdwgD3dK3fNWTqFIig1AMMyyHwnaGKpgJU6MwPPDFb9i4Tt2y
         ZxMzKGTFcgNT8RPuyPPozqKAs6HKVGCLMWLa/fneKpY2ogECWOwXn416GhiRxNz1Yjj9
         aAY9ABuLCtHwdLpULP2551rjuNGkQ8vAuaYKpVxdbkz7pVrTZtmRT6e0le6mX1aQJQV7
         l/trtlNSt08bKKAUyDfREq4pvNFvXR6u8E1AhHd5cfgk1Fc7lrypUh/ai6gpCrJcaZy/
         OhBmfIjrxz5Qjft5q6WVTrO2CbdY7hzFC6TDZXqAsatoC4k8kXmYp21koNM/VH77yUM8
         wDOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bGJuodjA8v4dDLiMdV5+f4n+JdNhtoj0NwYzxyKQVm0=;
        b=xEP7e/cLffepy/7N37PMnuSJRQXkQxi5CJ5ivu5cbTLdL5IID4HSeGHc+0aPw3BN9f
         2UBn1l6AJypwTPLSzKoHPIkOJt7BSikHiORg6bHtCTu1EXjIIuB9KkbSGzGBOKRF6MWn
         GFRhkErEMcBet/AXEm+/t3FRPxPZIwRbjZgbvssbx063p8M0ePjsm1hQtT5c9M7cC0n0
         zA7wfecX6K63j8yDR5zU+lE58lOVtlS/tg87r1emZnUgC7Zuk4P76RP9uF5SZ8ORM4wX
         YOPqcDspgRsEXGqSQa5uINDHDpUq1/+X+jGiD/KwMAhYEPzKKrUiHK9MxLHjuvh0KNo4
         b39w==
X-Gm-Message-State: AOAM532cuJsPz9MXIxx3CCsAaNinJ/tpWIfzbea0vsEp/nN5Y6Un+ecj
	lGjhD4L3uYivXXJckDdRJHFd1yBNFcA=
X-Google-Smtp-Source: 
 ABdhPJyYS/p9YAEZDV7eH1n7tNqby0yqG1M2eR3tGOD5tUr/Y7lJeBFrmlQIuFRnTYrxAglWRMTffA==
X-Received: by 2002:a05:6402:2747:: with SMTP id
 z7mr10620186edd.227.1644184403124;
        Sun, 06 Feb 2022 13:53:23 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 j11sm1191927ejb.110.2022.02.06.13.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Feb 2022 13:53:22 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 5/8] python3-numpy: update 1.22.1 -> 1.22.2
Date: Sun,  6 Feb 2022 22:53:13 +0100
Message-Id: <20220206215316.367469-5-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220206215316.367469-1-alex@linutronix.de>
References: <20220206215316.367469-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Feb 2022 21:53:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161417

Replace an ad hoc fix via patch with an upstream one.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...y-core-setup.py-disable-svml-for-now.patch | 29 -------------------
 ...umpy_1.22.1.bb => python3-numpy_1.22.2.bb} |  7 +++--
 2 files changed, 5 insertions(+), 31 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-numpy/0001-numpy-core-setup.py-disable-svml-for-now.patch
 rename meta/recipes-devtools/python/{python3-numpy_1.22.1.bb => python3-numpy_1.22.2.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-numpy/0001-numpy-core-setup.py-disable-svml-for-now.patch b/meta/recipes-devtools/python/python3-numpy/0001-numpy-core-setup.py-disable-svml-for-now.patch
deleted file mode 100644
index 66e322116a..0000000000
--- a/meta/recipes-devtools/python/python3-numpy/0001-numpy-core-setup.py-disable-svml-for-now.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 0f0601e79f9ce7614d157284523e6cd8af2259d5 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Wed, 5 Jan 2022 12:12:47 +0100
-Subject: [PATCH] numpy/core/setup.py: disable svml for now
-
-The check really doesn't work in cross compiling,
-as it is using host python to see what arch we're
-building on. Issue reported upstream:
-https://github.com/numpy/numpy/issues/20736
-
-Upstream-Status: Inappropriate [needs upstream fix]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- numpy/core/setup.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/numpy/core/setup.py b/numpy/core/setup.py
-index a5f423d..945f2dd 100644
---- a/numpy/core/setup.py
-+++ b/numpy/core/setup.py
-@@ -70,7 +70,7 @@ def can_link_svml():
-     """
-     machine = platform.machine()
-     system = platform.system()
--    return "x86_64" in machine and system == "Linux"
-+    return False
- 
- def check_svml_submodule(svmlpath):
-     if not os.path.exists(svmlpath + "/README.md"):
diff --git a/meta/recipes-devtools/python/python3-numpy_1.22.1.bb b/meta/recipes-devtools/python/python3-numpy_1.22.2.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-numpy_1.22.1.bb
rename to meta/recipes-devtools/python/python3-numpy_1.22.2.bb
index b79ce61fbf..ba0a777551 100644
--- a/meta/recipes-devtools/python/python3-numpy_1.22.1.bb
+++ b/meta/recipes-devtools/python/python3-numpy_1.22.2.bb
@@ -11,9 +11,8 @@ SRC_URI = "https://github.com/${SRCNAME}/${SRCNAME}/releases/download/v${PV}/${S
            file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch \
            file://0001-numpy-core-Define-RISCV-32-support.patch \
            file://run-ptest \
-           file://0001-numpy-core-setup.py-disable-svml-for-now.patch \
            "
-SRC_URI[sha256sum] = "dd1968402ae20dfd59b34acd799b494be340c774f6295e9bf1c2b9842a5e416d"
+SRC_URI[sha256sum] = "093d513a460fd94f94c16193c3ef29b2d69a33e482071e3d6d6e561a700587a6"
 
 UPSTREAM_CHECK_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
@@ -26,6 +25,10 @@ S = "${WORKDIR}/numpy-${PV}"
 
 CLEANBROKEN = "1"
 
+do_compile:prepend() {
+    export NPY_DISABLE_SVML=1
+}
+
 FILES:${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/numpy/core/lib/*.a ${PYTHON_SITEPACKAGES_DIR}/numpy/random/lib/*.a"
 
 # install what is needed for numpy.test()
-- 
2.20.1


