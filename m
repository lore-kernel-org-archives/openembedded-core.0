Return-Path: <iwanicki92@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78234C5DF97
	for <webhook@archiver.kernel.org>; Sat, 22 Aug 2026 20:56:55 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4071.1787432205124147273
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Aug 2026 13:56:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=A1hPfKCk;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: iwanicki92@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6983d3dae7aso5385500a12.0
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Aug 2026 13:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787432203; x=1788037003; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ymR/2ieTCIpVhxcq6WgDK8d4BXYVc4wlNO2xWAkpglA=;
        b=A1hPfKCkHf/HU928Nq8am20c76BgCKAzcl8ymw4/GaGXesVWkdRr+M55ZTdB6d+Sg6
         eYXrP2aVRgK0VIBSf+l98tuRBziUeLD2Lczri+wxrWLFhek+4XhkckA7XbG7t/3IfZSP
         a3hWxG1dkyvHQza4i2tfmdFNKdUKUNoUOLLrH8MtYYcnnhXZkqDs1YkFdUoyAHhvqsoC
         m8lMLIbEhWi6lx6fJ8Wsf7RXZumhys4IIi4E8hlATdoH0yPHfQNPOpkh12wfWmvxRF5K
         IXKjb5bzTY5jxfHRPuIKiGrMdcT2+B5k9Cfk9gEH8Jsu4kWbtHiGgR5DMJrfzaI3FIva
         DqcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787432203; x=1788037003;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ymR/2ieTCIpVhxcq6WgDK8d4BXYVc4wlNO2xWAkpglA=;
        b=XUOp+EQxtSAlsu7l/hDVnb3RoAYvZVYP7Za15s2fdt0QtuIjhu+vyDZyfqD6JsyEO0
         DqMHfwLSMBHHHmMUDBmwHW+OAiB1s7Ihv5It4jP5m7FK/jwwBCmA1c72G2RGdMBGOodo
         U+fKVFK0bDICrGjnaWsgk9PvQsaPk6Q+9zVM2VyhBciZ+RZrP5FIzyMqp1D31rNKtr/q
         OidOmp5TPaByu5pMu2aKazot26BdrP+M0/wzpRgbrmGAO39ZNmxua5++9Y4ZzN/DL5ag
         O+th5yYKYS1Mk1QWneBI724tuPx0GzqOsXpZt60e/E35Y7vV86o5CSUjtOhAqnEVHUYe
         e6IA==
X-Gm-Message-State: AFuF++lGbfK+wKdBnAhVQNUKpShdhZR6Rc+4sSbgY1j0qkiYLR7rBo3a
	TQnLxMupRQoK2UZabO7rUh+NjQoHUOa/SvOS0zZVL7Er9w5Xf3c3VsSTEi+bJ277
X-Gm-Gg: AR+sD11eLf+67CLDsXhM5GiYlPDf94NCt54SP4/xtNtpvem6iaaFjL59dHm/MXTe3TT
	YYo8916Hy9TOaCE9l8RqQNpFR+98J0Qfrq282GM315EPzOz9bR72bYxCgVD8OUsLIa4MzH/B0D5
	zn13y3vUqiZjaMfck03jCnTWHmx1ONmOFQmLRMgsycscIvqOyI9xaDSXnXxa9xbQCanXSN2j0ZQ
	a3itDl/aqKV2+zdCcrwZq4aRwkAAhuARq0LUFkOQEcwyPhmb76dfczPGgFz0Dw+p+UAp3/sycxp
	uAL21tzOWAPoqyW4e3Nin8jt9PSR7i3XwhBUfOeR1tkBrUPpzfwjXstY8fN2mUnL8LeFCKH0edR
	7VVYcCPDhLQh46/NwoX9SSQqZH4Do7SpazsLWmOFqa/wPbLuWHwNp8ApnWNARiRerqRxtI0LERe
	I5x3ceSEoBhABixAAB7NUGRGMf4j/KYxsuhcECZKf4/FjYdUWVAnopDp9X5W6tWw+NEuE=
X-Received: by 2002:a17:907:7ba6:b0:c21:42af:4cb with SMTP id a640c23a62f3a-c244d63f5c8mr1823949466b.6.1787432202668;
        Sat, 22 Aug 2026 13:56:42 -0700 (PDT)
Received: from iwans-fedora ([2a02:a312:c8bf:9d80:69ba:755e:25b5:838e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249606b59fsm565454066b.12.2026.08.22.13.56.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 13:56:42 -0700 (PDT)
From: iwanicki92 <iwanicki92@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] classes: spdx-3.0: add missing vardeps
Date: Sat, 22 Aug 2026 22:56:13 +0200
Message-ID: <20260822205612.3522119-2-iwanicki92@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Aug 2026 20:56:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244004

Add "${SPDX_IMAGE_SUPPLIER}_name", "${SPDX_IMAGE_SUPPLIER}_type",
"${SPDX_PACKAGE_SUPPLIER}_name", and "${SPDX_PACKAGE_SUPPLIER}_type" to
respective task vardeps to make sure SPDX is regenerated if those
change.

Tested by building minimal image with:

```
SPDX_PACKAGE_SUPPLIER = "SPDX_PACKAGE_SUPPLIER"
SPDX_PACKAGE_SUPPLIER_name = "AAAA"
SPDX_PACKAGE_SUPPLIER_type = "organization"
```

then rebuilding with `SPDX_PACKAGE_SUPPLIER_name = "BBBB"` and checking
if every instance of AAAA was changed to BBBB in resulting image SBOM.
Same with SPDX_IMAGE_SUPPLIER.

Previous patch only added SPDX_PACKAGE_SUPPLIER to
do_create_package_spdx but this resulted in most of supplier names not
being changed.

Signed-off-by: iwanicki92 <iwanicki92@gmail.com>
---
 meta/classes-recipe/create-spdx-image-3.0.bbclass |  4 +++-
 meta/classes/create-spdx-3.0.bbclass              | 13 ++++++++++---
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/meta/classes-recipe/create-spdx-image-3.0.bbclass b/meta/classes-recipe/create-spdx-image-3.0.bbclass
index cf79ef5b013a..faf4eef8a9a3 100644
--- a/meta/classes-recipe/create-spdx-image-3.0.bbclass
+++ b/meta/classes-recipe/create-spdx-image-3.0.bbclass
@@ -57,7 +57,9 @@ do_create_image_spdx[dirs] = "${SPDXIMAGEWORK}"
 do_create_image_spdx[file-checksums] += "${SPDX3_DEP_FILES}"
 do_create_image_spdx[vardeps] += "\
     SPDX_IMAGE_PURPOSE \
-    "
+    ${@'${SPDX_IMAGE_SUPPLIER}_name' if d.getVar('SPDX_IMAGE_SUPPLIER') else ''} \
+    ${@'${SPDX_IMAGE_SUPPLIER}_type' if d.getVar('SPDX_IMAGE_SUPPLIER') else ''} \
+"
 
 python do_create_image_spdx_setscene() {
     sstate_setscene(d)
diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-spdx-3.0.bbclass
index 56fd01fd533b..35707fddbbb3 100644
--- a/meta/classes/create-spdx-3.0.bbclass
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -231,7 +231,11 @@ do_create_spdx[depends] += " \
     ${PATCHDEPENDENCY} \
     ${@create_spdx_source_deps(d)} \
 "
-do_create_spdx[vardeps] += "${SPDX3_VAR_DEPS}"
+do_create_spdx[vardeps] += " \
+    ${SPDX3_VAR_DEPS} \
+    ${@'${SPDX_PACKAGE_SUPPLIER}_name' if d.getVar('SPDX_PACKAGE_SUPPLIER') else ''} \
+    ${@'${SPDX_PACKAGE_SUPPLIER}_type' if d.getVar('SPDX_PACKAGE_SUPPLIER') else ''} \
+"
 
 python do_create_spdx_setscene () {
     sstate_setscene(d)
@@ -253,7 +257,11 @@ do_create_package_spdx[dirs] = "${SPDXRUNTIMEDEPLOY}"
 do_create_package_spdx[cleandirs] = "${SPDXRUNTIMEDEPLOY}"
 do_create_package_spdx[deptask] = "do_create_spdx"
 do_create_package_spdx[rdeptask] = "do_create_spdx"
-do_create_package_spdx[vardeps] += "${SPDX3_VAR_DEPS}"
+do_create_package_spdx[vardeps] += " \
+    ${SPDX3_VAR_DEPS} \
+    ${@'${SPDX_PACKAGE_SUPPLIER}_name' if d.getVar('SPDX_PACKAGE_SUPPLIER') else ''} \
+    ${@'${SPDX_PACKAGE_SUPPLIER}_type' if d.getVar('SPDX_PACKAGE_SUPPLIER') else ''} \
+"
 
 python do_create_package_spdx_setscene () {
     sstate_setscene(d)
@@ -290,4 +298,3 @@ python spdx30_build_started_handler () {
 
 addhandler spdx30_build_started_handler
 spdx30_build_started_handler[eventmask] = "bb.event.BuildStarted"
-
-- 
2.55.0


