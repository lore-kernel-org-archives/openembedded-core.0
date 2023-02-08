Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D3A7C64EC6
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 07:21:54 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.3137.1675840910086201632
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Feb 2023 23:21:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pK1kEwr3;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id n28-20020a05600c3b9c00b003ddca7a2bcbso741361wms.3
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 23:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EqRIgaUUksQUbq8QU5rr+giC30E5CjucfP5c8j1QcGI=;
        b=pK1kEwr3vi5f3/AahUDWWkRsjhl8llj/33ytKkIMBmJ/QNGz3G4bSIod1myLF1XA+m
         6fvqqKvgPnSmKvvjzH7uEdL9pfR6tFhGo9lC1hlPpPGnRbHQSqsG5QBCTcVXJXbuHN3k
         JqnJB4OykdMaO7eJnGLno3R3rwLRxJFr04ndC+dgcp7tnkT9/Icztc4TI+1zNbvZiDZO
         LR3iA3gBblHxfpbMYgcJ9OYJrXMoltEovNMc7Vi3OavPDAyrggmX2AS/SzP11eYDLKEM
         rfnrCwPD6zOS6ZhpFPBaUSNKzGLSRuj993DBcQ7bl661kkIp/Y6dcv9Ne7K1/0EOaiHr
         lvEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EqRIgaUUksQUbq8QU5rr+giC30E5CjucfP5c8j1QcGI=;
        b=pkABvl5lGKNyVLa/HtfoSOXjS2+AsavjYmEQjABWWrWmEFeZNhDdfnVaXgUoq9pYpv
         6KTS6cYASnHwWKUcpWZC9nn9c00lPGEMVgkmyMKcHdh4oTTCbWt1WQoIx4g1MdR9fFiH
         e6u4SvmDOAamEevWdLnzoQfHcFBgAnKdq2v3E1hiRIbvvrOLzDiHM+b3TkhpWo2+cgMi
         hkqTcHSsNZX3C10zh9NBpsWvRt5kP/gS1N2T2eG3vs5BNb5U7NzqpOKCBxczCJnuqztU
         LlPmZG0RwlUZlYXzZeLvwjznaVKm6bEbSSl3uAEUAqCWozaz+x1Aqmp/fRK0EQO5BBgL
         2wNQ==
X-Gm-Message-State: AO0yUKWnU0DYieKpJFBZpYO8WhN+BlLckXfZrY7uPQxHrnUl4JvJsSdF
	k/FK6UF7F8RIiqtbbFh5bYPAEegDYJ4=
X-Google-Smtp-Source: AK7set/8Yhsfb4cR8fjjl+Sne7w+IL2/lX6z+9Gx3/1V8oMhJdKdW03JaIT+7pccWGn67VHHghS+dw==
X-Received: by 2002:a05:600c:3416:b0:3df:85d2:c768 with SMTP id y22-20020a05600c341600b003df85d2c768mr5476344wmp.26.1675840908573;
        Tue, 07 Feb 2023 23:21:48 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l16-20020a05600c2cd000b003daffc2ecdesm1087926wmc.13.2023.02.07.23.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 23:21:48 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 02/52] python3-pip: update 22.3.1 -> 23.0
Date: Wed,  8 Feb 2023 08:20:53 +0100
Message-Id: <20230208072143.2930292-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230208072143.2930292-1-alex@linutronix.de>
References: <20230208072143.2930292-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 07:21:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176842

License-Update: formatting, pep517 replaced by pyproject_hooks with same license.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../python/{python3-pip_22.3.1.bb => python3-pip_23.0.bb}   | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-pip_22.3.1.bb => python3-pip_23.0.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-pip_22.3.1.bb b/meta/recipes-devtools/python/python3-pip_23.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-pip_22.3.1.bb
rename to meta/recipes-devtools/python/python3-pip_23.0.bb
index cb9f68679f..8b956932c3 100644
--- a/meta/recipes-devtools/python/python3-pip_22.3.1.bb
+++ b/meta/recipes-devtools/python/python3-pip_23.0.bb
@@ -13,11 +13,11 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=63ec52baf95163b597008bb46db68030 \
                     file://src/pip/_vendor/msgpack/COPYING;md5=cd9523181d9d4fbf7ffca52eaa2a5751 \
                     file://src/pip/_vendor/packaging/LICENSE;md5=faadaedca9251a90b205c9167578ce91 \
                     file://src/pip/_vendor/packaging/LICENSE.APACHE;md5=2ee41112a44fe7014dce33e26468ba93 \
-                    file://src/pip/_vendor/pep517/LICENSE;md5=aad69c93f605003e3342b174d9b0708c \
                     file://src/pip/_vendor/pkg_resources/LICENSE;md5=9a33897f1bca1160d7aad3835152e158 \
-                    file://src/pip/_vendor/platformdirs/LICENSE.txt;md5=282c970bb844954c8535dd6e9733db7f \
+                    file://src/pip/_vendor/platformdirs/LICENSE;md5=ea4f5a41454746a9ed111e3d8723d17a \
                     file://src/pip/_vendor/pygments/LICENSE;md5=36a13c90514e2899f1eba7f41c3ee592 \
                     file://src/pip/_vendor/pyparsing/LICENSE;md5=657a566233888513e1f07ba13e2f47f1 \
+                    file://src/pip/_vendor/pyproject_hooks/LICENSE;md5=aad69c93f605003e3342b174d9b0708c \
                     file://src/pip/_vendor/requests/LICENSE;md5=34400b68072d710fecd0a2940a0d1658 \
                     file://src/pip/_vendor/resolvelib/LICENSE;md5=78e1c0248051c32a38a7f820c30bd7a5 \
                     file://src/pip/_vendor/rich/LICENSE;md5=b5f0b94fbc94f5ad9ae4efcf8a778303 \
@@ -33,7 +33,7 @@ inherit pypi python_setuptools_build_meta
 
 SRC_URI += "file://no_shebang_mangling.patch"
 
-SRC_URI[sha256sum] = "65fd48317359f3af8e593943e6ae1506b66325085ea64b706a998c6e83eeaf38"
+SRC_URI[sha256sum] = "aee438284e82c8def684b0bcc50b1f6ed5e941af97fa940e83e2e8ef1a59da9b"
 
 do_install:append() {
     rm -f ${D}/${bindir}/pip
-- 
2.30.2


