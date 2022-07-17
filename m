Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DEE7C43334
	for <webhook@archiver.kernel.org>; Sun, 17 Jul 2022 08:30:14 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.13788.1658046610945961419
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jul 2022 01:30:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=chhDg82g;
 spf=pass (domain: gmail.com, ip: 209.85.218.52,
 mailfrom: jan.vermaete@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id l23so16213093ejr.5
        for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jul 2022 01:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TZ2Zzt108gOcLHpmsSfBaNNpq28Xj7nbobImOJN65rE=;
        b=chhDg82gFnJEeOG0uACU+FasRAvFBc2EdJ5KKXUkoRbM67AXWBsN++muUpf2a676N5
         oSuGOWHVTRnjjMTbB9wboj3M4hYLshYQO50GdiD8kXxYHMFBU/BD3wo3Ujaa8RNzFYY2
         R2M7jp6sGv3HbcWaZ4sJtjuHzEWVAQq9nC5urWbLLf8BdH8Ut0VHiE0ct0ILxFVrDBAY
         NYd9fcuZ02HAW6NG5uYKg3KC8fmz2xNRQWtY74+611DAxFu6oPY8njcLdJrw+MSnaErb
         9+i88v3/q/5U172LEaF/4fp56zCPBxDsBItBfKV8Iqe6kaF32nOM7ctZ3KxiKHOZGnMX
         e9qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TZ2Zzt108gOcLHpmsSfBaNNpq28Xj7nbobImOJN65rE=;
        b=NDgw2I4W3PWoGATHXQsFCIQrLmKDzbSiuHqcOC5stSXwu/i9n2K+9xYRCZbSjNBnIX
         wb45ZHxPaANiV4eFugHGNLSHzL0U3ATq1TMjJ3seAagGUxPvENN8ux0m4IcFCTsHrbKL
         i81K8PbYWxcX53ivLIhkbDE+z2GiCviBcJJb1U4AXWaLen/2v3WEkYXABPlh1GI1sN1m
         NdukHlcPLW4InPhEltx/FXYNnXCtC6s8K4kq4HIHtj78/G+4TZY1zeR2gB2kPW98j9tk
         8QnNM6jVmy6uuaQPG3ukbncG6UeOfR/tdnfaCoStdp489HK5jEI4noLlFcjCDH6ALCa9
         no+w==
X-Gm-Message-State: AJIora9E2AOwTVX6m551cbtP4Wqgv3bMrrxQDn1IB+EuMAHQ1WMHOb87
	MCHics+K6U6u3vg4MvVyp/wj2ZDMpLg=
X-Google-Smtp-Source: 
 AGRyM1ua7+QnBpali+qx+cStCc78DX+3Ukw1j0Q6a/UgYwuLIHC+hNB+Fqm/RjlHb8xhuWoJFRybYQ==
X-Received: by 2002:a17:906:93fa:b0:72b:146f:71b7 with SMTP id
 yl26-20020a17090693fa00b0072b146f71b7mr20803716ejb.413.1658046609074;
        Sun, 17 Jul 2022 01:30:09 -0700 (PDT)
Received: from localhost.localdomain
 (ptr-fij45qxieo2wjdwi378.18120a2.ip6.access.telenet.be.
 [2a02:1812:512:2c00:4c17:e8d:6153:84b4])
        by smtp.gmail.com with ESMTPSA id
 j17-20020a17090623f100b0072b1cb2818csm4158673ejg.158.2022.07.17.01.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jul 2022 01:30:08 -0700 (PDT)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [PATCH] python3-jsonschema: 4.7.1 -> 4.7.2 + fixed the rdepends
Date: Sun, 17 Jul 2022 10:29:53 +0200
Message-Id: <20220717082953.2651021-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Jul 2022 08:30:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168144

And spitted the files for the tests into a -test package

buildhistory:
  images/raspberrypi4_64/glibc/core-image-base: IMAGESIZE changed from 208024 to 183660 (-12%)
  Changes to images/raspberrypi4_64/glibc/core-image-base (installed-package-names.txt):
    python3-pyparsing was removed
    python3-pip was removed
    python3-setuptools-scm was removed
    python3-packaging was removed
    python3-typing-extensions was removed
    python3-pkg-resources was removed
    python3-tomli was removed
    python3-setuptools was removed

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 ...onschema_4.7.1.bb => python3-jsonschema_4.7.2.bb} | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/python/{python3-jsonschema_4.7.1.bb => python3-jsonschema_4.7.2.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-jsonschema_4.7.1.bb b/meta/recipes-devtools/python/python3-jsonschema_4.7.2.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-jsonschema_4.7.1.bb
rename to meta/recipes-devtools/python/python3-jsonschema_4.7.2.bb
index f17f28a57f..af728ab2d6 100644
--- a/meta/recipes-devtools/python/python3-jsonschema_4.7.1.bb
+++ b/meta/recipes-devtools/python/python3-jsonschema_4.7.2.bb
@@ -4,10 +4,13 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7a60a81c146ec25599a3e1dabb8610a8 \
                     file://json/LICENSE;md5=9d4de43111d33570c8fe49b4cb0e01af"
 
-SRC_URI[sha256sum] = "25203dbebd62a1179f810f14339f7a638baaf279b5cc3b738a58c3744af56d65"
+SRC_URI[sha256sum] = "73764f461d61eb97a057c929368610a134d1d1fffd858acfe88864ee94f1f1d3"
 
 inherit pypi python_hatchling
 
+PACKAGES =+ "${PN}-tests"
+FILES:${PN}-tests = "${libdir}/${PYTHON_DIR}/site-packages/jsonschema/tests"
+
 DEPENDS += "${PYTHON_PN}-hatch-vcs-native"
 
 PACKAGECONFIG ??= "format"
@@ -35,14 +38,11 @@ RDEPENDS:${PN} += " \
     ${PYTHON_PN}-json \
     ${PYTHON_PN}-netclient \
     ${PYTHON_PN}-numbers \
-    ${PYTHON_PN}-pkgutil \
     ${PYTHON_PN}-pprint \
     ${PYTHON_PN}-pyrsistent \
-    ${PYTHON_PN}-shell \
-    ${PYTHON_PN}-six \
-    ${PYTHON_PN}-unittest \
-    ${PYTHON_PN}-setuptools-scm \
     ${PYTHON_PN}-zipp \
 "
 
+RDEPENDS:${PN}-tests = "${PN}"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


