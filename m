Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E39E2C3DA71
	for <webhook@archiver.kernel.org>; Tue, 13 Dec 2022 11:11:36 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.70918.1670929888100924406
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Dec 2022 03:11:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ppA5Kqwd;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id o5so15237027wrm.1
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Dec 2022 03:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zUHErhR4Run4pONEud2bnOX1DdAcXVPLAo7NqZpwtz0=;
        b=ppA5KqwdkUGKHldDc2PXqEc3OlOGtnmcKzjRxBD7nEK6Hv+5ckpn3IDIZEAeZ3+2Oq
         LuCvSQ8850fo+NuMmc3Taa/gth80VsKZUJ9Go4LperQTZ0ciPSNElkHuinjVLjb7tMyl
         YNXjPl/2OmIS23l/S/ZuOUFGr/TI3pMs2cwsQptlvC/gVoLiGfWUzsd9PyXnhgYs6P06
         if+pFZVfVPSbjP5U332o9wuRzuvsfWiyTuUiQumZsPhBenhjo+lYrsNiCyuTmqsHyhay
         IEBadrqQI9ZMXyx7im7p3X4kT/UFfj/j08G3HDUT3gkb07ThYxdfHuwVIUvhRaaD+T4Q
         pumg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zUHErhR4Run4pONEud2bnOX1DdAcXVPLAo7NqZpwtz0=;
        b=Ra7xeu0aijLXWZRHphoG6QqwrLAuKqSaA0iLeSc5f1yfhVstp01HXRSS3Pcp808Ky7
         8KMNhaxKCu1u4Im5Vixgb0wxn2ZVgP9rTWCNdafIcxlNOdIfFYdT1TLrAqY2NgA1/Snd
         FmR6ABW3wJxKcEUAgLc7Aixk51ZVr6GdNPe3Rmu3BSHsj7lB8dUGa5yP0Ip73ixLQHMF
         buhvbho1RqReohiDini6lJdoRxL46yCa5Wj9czvgjwx0kdWRgh65mbTcYF2AC20bmqbD
         zcldmaY29eKbQ5ljQjXNL/GRBvVCeNEf9FKxEga5jnUYbkN4Pv5OzHBR1en4e0wLro/T
         mBVQ==
X-Gm-Message-State: ANoB5pl4OJK1ZYfyDhHF80wNW3MfnbICu7Xun5u7TkLcPZrtNXIqCp/C
	R091v/z2SYrhiCWgr8H1VSagiPb0t58=
X-Google-Smtp-Source: AA0mqf4thWfJQqBORa5DfMLlobctz9ja3/JmB5mwaKbHc8UxhTdQ/CjQO1YS5UWxVqlmUhR0gH/VJA==
X-Received: by 2002:adf:e801:0:b0:242:4d2c:fe15 with SMTP id o1-20020adfe801000000b002424d2cfe15mr13167301wrm.31.1670929886334;
        Tue, 13 Dec 2022 03:11:26 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m8-20020a056000008800b002366c3eefccsm11362665wrx.109.2022.12.13.03.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 03:11:25 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 06/24] python3-poetry-core: update 1.3.2 -> 1.4.0
Date: Tue, 13 Dec 2022 12:11:00 +0100
Message-Id: <20221213111118.149697-6-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221213111118.149697-1-alex@linutronix.de>
References: <20221213111118.149697-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Dec 2022 11:11:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174516

Upstream has changed the tarball and the dir inside it to poetry_core
(with underscore).

License-Update: formatting, copyright years.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...-poetry-core_1.3.2.bb => python3-poetry-core_1.4.0.bb} | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-poetry-core_1.3.2.bb => python3-poetry-core_1.4.0.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-poetry-core_1.3.2.bb b/meta/recipes-devtools/python/python3-poetry-core_1.4.0.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-poetry-core_1.3.2.bb
rename to meta/recipes-devtools/python/python3-poetry-core_1.4.0.bb
index 1b6c76323b..22a6a2a477 100644
--- a/meta/recipes-devtools/python/python3-poetry-core_1.3.2.bb
+++ b/meta/recipes-devtools/python/python3-poetry-core_1.4.0.bb
@@ -10,19 +10,21 @@ LIC_FILES_CHKSUM = "\
     file://src/poetry/core/_vendor/attr/_version_info.py;beginline=1;endline=1;md5=b2dccaa94b3629a08bfb4f983cad6f89 \
     file://src/poetry/core/_vendor/attrs/LICENSE;md5=5e55731824cf9205cfabeab9a0600887 \
     file://src/poetry/core/_vendor/jsonschema/COPYING;md5=7a60a81c146ec25599a3e1dabb8610a8 \
-    file://src/poetry/core/_vendor/lark/LICENSE;md5=b37b83a9cf129d92ee65aaa71c01ce72 \
+    file://src/poetry/core/_vendor/lark/LICENSE;md5=fcfbf1e2ecc0f37acbb5871aa0267500 \
     file://src/poetry/core/_vendor/packaging/LICENSE;md5=faadaedca9251a90b205c9167578ce91 \
     file://src/poetry/core/_vendor/packaging/LICENSE.APACHE;md5=2ee41112a44fe7014dce33e26468ba93 \
     file://src/poetry/core/_vendor/packaging/LICENSE.BSD;md5=7bef9bf4a8e4263634d0597e7ba100b8 \
     file://src/poetry/core/_vendor/pyparsing/LICENSE;md5=657a566233888513e1f07ba13e2f47f1 \
     file://src/poetry/core/_vendor/pyrsistent/LICENSE.mit;md5=b695eb9c6e7a6fb1b1bc2d193c42776e \
     file://src/poetry/core/_vendor/tomlkit/LICENSE;md5=31aac0dbc1babd278d5386dadb7f8e82 \
-    file://src/poetry/core/_vendor/typing_extensions.LICENSE;md5=64fc2b30b67d0a8423c250e0386ed72f \
+    file://src/poetry/core/_vendor/typing_extensions.LICENSE;md5=f16b323917992e0f8a6f0071bc9913e2 \
 "
 
-SRC_URI[sha256sum] = "0ab006a40cb38d6a38b97264f6835da2f08a96912f2728ce668e9ac6a34f686f"
+SRC_URI[sha256sum] = "514bd33c30e0bf56b0ed44ee15e120d7e47b61ad908b2b1011da68c48a84ada9"
 
 inherit python_poetry_core pypi
+PYPI_ARCHIVE_NAME = "poetry_core-${PV}.${PYPI_PACKAGE_EXT}"
+S = "${WORKDIR}/poetry_core-${PV}"
 
 RDEPENDS:${PN}:append:class-target = "\
     python3-compression \
-- 
2.30.2


