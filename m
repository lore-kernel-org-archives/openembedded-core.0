Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2452C197A0
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 21:02:44 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web10.13072.1700514162112745223
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Nov 2023 13:02:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O5J6sDSX;
 spf=pass (domain: gmail.com, ip: 209.85.167.171, mailfrom: ticotimo@gmail.com)
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3b83398cfc7so11656b6e.3
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 13:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700514161; x=1701118961; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=olTaCGyDdw1CmLcWH4bTkwu2HVtIt8qfgdEMGX63Uxg=;
        b=O5J6sDSXiiC9V91t2zvRol6HuWPEKD3CPZR+Fr50C6s4o6k3nZ964NISYBjiN3kr9m
         1nKiw9GJXooVkj+nwG2Id5NbxP0BPDgy1qhUUVDkqf1ijq1viPrK4yhUxXshpZyjy63c
         I/FIeA9PwZi+wRrmyJgbZQz9idTKCcX5xBnhDn/zmMNgC8Tkjm4YqtC5ThmK7rWMqbvJ
         t8yPNR+ZI65uKk543JDQwXAVKcKeKkeAuECQL9xRu2zjsfoE/1XIcLxb9M331j6ND9yT
         UsCBqWHT47ToEytD82N92lqKAZCBVx+JLBc3qWTapBHxPymRB8jzb1ltJeXx5Rkah/7B
         QS/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700514161; x=1701118961;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=olTaCGyDdw1CmLcWH4bTkwu2HVtIt8qfgdEMGX63Uxg=;
        b=YugfQCNS2ijlbsMDH90gDXLwLCePzqKSCg7r7siWTuiCK6t26z0K+7cZeJH/BsJj9m
         6ddNTAJf2lv11WePo5heLeVIzXCwM7CgDmCRJDW169z6+W/IsUtqX/IF1fRfK2Rg8cUx
         SflpHWKTtGv+2wr2PmJNUvXI4w4ikq2q/L3YD9JRDkI6dcwSLvb2HanWiAJLDl7WWojK
         B3DDDbYf2FmLo3q7po9x8dM4/J1DwJm2kyLg/SziVFyPFkheaGWp1FJWVBWZVcP43VhA
         aX1XkbJGGS4DNPdI5U2C6ek369EKw/hjyxnz5F0YMUYWr9/aMXMxfuL/ozf5iAOAVN6Q
         3Iqg==
X-Gm-Message-State: AOJu0YwkyI3CqUop+aZ6X21P5tJi6zelidvYuHXhHeDhN/6qDE+58z+D
	DY8PKRNfKQVWH5jKiXochN0gzJ2LZs51dw==
X-Google-Smtp-Source: AGHT+IHJDHpHS778L1O6lFNOg8NChtF+vyDLYpEpyQLyFVbyAgDQP+a1xfX8J0E0HzKuN7kV8edmmg==
X-Received: by 2002:a05:6808:10d0:b0:3b2:ef9e:45af with SMTP id s16-20020a05680810d000b003b2ef9e45afmr12426756ois.13.1700514160772;
        Mon, 20 Nov 2023 13:02:40 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0::b328])
        by smtp.gmail.com with ESMTPSA id s11-20020a65644b000000b005bcebc93d7asm5556484pgv.47.2023.11.20.13.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 13:02:40 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-poetry-core: upgrade 1.7.0 -> 1.8.1
Date: Mon, 20 Nov 2023 13:01:41 -0800
Message-Id: <20231120210140.3203077-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 21:02:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190929

https://github.com/python-poetry/poetry-core/blob/1.8.1/CHANGELOG.md#181---2023-10-31
https://github.com/python-poetry/poetry-core/blob/1.8.1/CHANGELOG.md#180---2023-10-31

License-Update: add vendored fastjsonschema (BSD-3-Clause)
License-Update: drop vendored attr,attrs,jsonschema,pyrsistent

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---

Tested by building python3-rdflib and python3-iso8601 for qemux86-64

 ...3-poetry-core_1.7.0.bb => python3-poetry-core_1.8.1.bb} | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/python/{python3-poetry-core_1.7.0.bb => python3-poetry-core_1.8.1.bb} (73%)

diff --git a/meta/recipes-devtools/python/python3-poetry-core_1.7.0.bb b/meta/recipes-devtools/python/python3-poetry-core_1.8.1.bb
similarity index 73%
rename from meta/recipes-devtools/python/python3-poetry-core_1.7.0.bb
rename to meta/recipes-devtools/python/python3-poetry-core_1.8.1.bb
index 40b6355f4b7..ccfa3312747 100644
--- a/meta/recipes-devtools/python/python3-poetry-core_1.7.0.bb
+++ b/meta/recipes-devtools/python/python3-poetry-core_1.8.1.bb
@@ -7,18 +7,15 @@ CHANGELOG = "https://github.com/python-poetry/poetry-core/blob/master/CHANGELOG.
 LICENSE = "Apache-2.0 & BSD-2-Clause & MIT"
 LIC_FILES_CHKSUM = "\
     file://LICENSE;md5=78c39cfd009863ae44237a7ab1f9cedc \
-    file://src/poetry/core/_vendor/attr/_version_info.py;beginline=1;endline=1;md5=b2dccaa94b3629a08bfb4f983cad6f89 \
-    file://src/poetry/core/_vendor/attrs/LICENSE;md5=5e55731824cf9205cfabeab9a0600887 \
-    file://src/poetry/core/_vendor/jsonschema/COPYING;md5=7a60a81c146ec25599a3e1dabb8610a8 \
+    file://src/poetry/core/_vendor/fastjsonschema/LICENSE;md5=18950e8362b69c0c617b42b8bd8e7532 \
     file://src/poetry/core/_vendor/lark/LICENSE;md5=fcfbf1e2ecc0f37acbb5871aa0267500 \
     file://src/poetry/core/_vendor/packaging/LICENSE;md5=faadaedca9251a90b205c9167578ce91 \
     file://src/poetry/core/_vendor/packaging/LICENSE.APACHE;md5=2ee41112a44fe7014dce33e26468ba93 \
     file://src/poetry/core/_vendor/packaging/LICENSE.BSD;md5=7bef9bf4a8e4263634d0597e7ba100b8 \
-    file://src/poetry/core/_vendor/pyrsistent/LICENSE.mit;md5=b695eb9c6e7a6fb1b1bc2d193c42776e \
     file://src/poetry/core/_vendor/tomli/LICENSE;md5=aaaaf0879d17df0110d1aa8c8c9f46f5 \
 "
 
-SRC_URI[sha256sum] = "8f679b83bd9c820082637beca1204124d5d2a786e4818da47ec8acefd0353b74"
+SRC_URI[sha256sum] = "67a76c671da2a70e55047cddda83566035b701f7e463b32a2abfeac6e2a16376"
 
 inherit python_poetry_core pypi
 PYPI_ARCHIVE_NAME = "poetry_core-${PV}.${PYPI_PACKAGE_EXT}"
-- 
2.34.1


