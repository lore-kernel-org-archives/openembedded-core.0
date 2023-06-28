Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E93CEB64D7
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 07:58:46 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.11074.1687939122601601028
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jun 2023 00:58:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=UfkCozet;
 spf=pass (domain: mvista.com, ip: 209.85.214.175, mailfrom: sdoshi@mvista.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1b80ddce748so18880675ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 00:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1687939121; x=1690531121;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6Vv4QU8CwQiVtNEGiuE9tGLQhXEiHPSdvF3BchMXYF0=;
        b=UfkCozet8tnG0gmbwnZ9hDYXuULs8fNtPs25kn9a5AAMuWbfjSjPhXzovxHh4NIGua
         XSOmZ/LEn8oTWYoDVCSOBAJdLiHoDDLCdMLOo+JFGRMLxrIZQw1JyMg6eeOSOV6cbT/g
         /HNwggx4yn4IBVeuMtztXkBUoQFsUiKKRNoyY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687939121; x=1690531121;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Vv4QU8CwQiVtNEGiuE9tGLQhXEiHPSdvF3BchMXYF0=;
        b=UZfBQYds2OPoy6qE2ikIdbnqg+gDcDXx1skLBcsECtncMkschckOJ0pPRpxpz4r1gt
         ZMqVDz8sygUGva6tmKIlIUX4guSw3FfVX7R6YeEaryA+uw9UKFYyH5aQh9eoypZRa9EK
         bxw3d0QRytPXggklfCIjalowoaDChiLNYLoMOkG/d8oGuIw6r57yLnYBSdYog02Fxofe
         r1MX669jfvAf0DImO51nb80o6tj9d1OICOJinsqkoOH25bzRDOiffFh4Bsy8/UQV4Opi
         JE+tFD2XpkKRNnkzm9T1fYgIR/GjroCHKbLR5yBA1ffaHveGHgS3CPKNHaxNA4rfV3HY
         f6WQ==
X-Gm-Message-State: AC+VfDys9HhY+jFh2TcCZPHNQMCXCuil+6RXdcLtHKT4+MJr4jDppwfS
	ZOcs/YMJuzzyVv5uCVcD0QDbBUw8w/OhOCio2x4=
X-Google-Smtp-Source: ACHHUZ6hlBRm5h42DTVQOXhFUYfLpT2xfG6aohqVchCAIAq+0jREK9xxslyapuxYylGbyFUenSjWMA==
X-Received: by 2002:a17:902:c20c:b0:1a9:86ca:38cd with SMTP id 12-20020a170902c20c00b001a986ca38cdmr6976521pll.2.1687939121299;
        Wed, 28 Jun 2023 00:58:41 -0700 (PDT)
Received: from siddharth-latitude-3420.mvista.com ([49.34.247.12])
        by smtp.gmail.com with ESMTPSA id 3-20020a170902c10300b0019aaab3f9d7sm7137178pli.113.2023.06.28.00.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 00:58:40 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][master][PATCHv3] Flac: upgrade 1.4.2 -> 1.4.3
Date: Wed, 28 Jun 2023 13:26:28 +0530
Message-Id: <20230628075628.146803-1-sdoshi@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 07:58:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183547

From: Siddharth Doshi <sdoshi@mvista.com>

License-Update: URL fix

Remove PowerPC related options no longer supported upstream.

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 .../flac/{flac_1.4.2.bb => flac_1.4.3.bb}            | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)
 rename meta/recipes-multimedia/flac/{flac_1.4.2.bb => flac_1.4.3.bb} (76%)

diff --git a/meta/recipes-multimedia/flac/flac_1.4.2.bb b/meta/recipes-multimedia/flac/flac_1.4.3.bb
similarity index 76%
rename from meta/recipes-multimedia/flac/flac_1.4.2.bb
rename to meta/recipes-multimedia/flac/flac_1.4.3.bb
index d3ece3f3cf..badb43db89 100644
--- a/meta/recipes-multimedia/flac/flac_1.4.2.bb
+++ b/meta/recipes-multimedia/flac/flac_1.4.3.bb
@@ -5,15 +5,15 @@ BUGTRACKER = "https://github.com/xiph/flac/issues"
 SECTION = "libs"
 LICENSE = "GFDL-1.2 & GPL-2.0-or-later & LGPL-2.1-or-later & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.FDL;md5=ad1419ecc56e060eccf8184a87c4285f \
-                    file://src/Makefile.am;beginline=1;endline=17;md5=146d2c8c2fd287545cc1bd81f31e8758 \
+                    file://src/Makefile.am;beginline=1;endline=17;md5=b1dab2704be7f01bfbd9b7f6d5f000a9 \
                     file://COPYING.GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://src/flac/main.c;beginline=1;endline=18;md5=893456854ce6bf14a1a7ea77266eebab \
+                    file://src/flac/main.c;beginline=1;endline=18;md5=23099119c034d894bd1bf7ef5bd22101 \
                     file://COPYING.LGPL;md5=fbc093901857fcd118f065f900982c24 \
-                    file://COPYING.Xiph;md5=3d6da238b5b57a0965d6730291119f65 \
+                    file://COPYING.Xiph;md5=0c90e41ab2fa7e69ca9391330d870221 \
                     file://include/FLAC/all.h;beginline=65;endline=70;md5=39aaf5e03c7364363884c8b8ddda8eea"
 
 SRC_URI = "http://downloads.xiph.org/releases/flac/${BP}.tar.xz"
-SRC_URI[sha256sum] = "e322d58a1f48d23d9dd38f432672865f6f79e73a6f9cc5a5f57fcaa83eb5a8e4"
+SRC_URI[sha256sum] = "6c58e69cd22348f441b861092b825e591d0b822e106de6eb0ee4d05d27205b70"
 
 CVE_PRODUCT = "libflac flac"
 
@@ -25,11 +25,9 @@ EXTRA_OECONF = "--disable-oggtest \
                 "
 
 PACKAGECONFIG ??= " \
-    ${@bb.utils.filter("TUNE_FEATURES", "altivec vsx", d)} \
+    ${@bb.utils.filter("TUNE_FEATURES", " ", d)} \
     ogg \
 "
-PACKAGECONFIG[altivec] = "--enable-altivec,--disable-altivec"
-PACKAGECONFIG[vsx] = "--enable-vsx,--disable-vsx"
 PACKAGECONFIG[avx] = "--enable-avx,--disable-avx"
 PACKAGECONFIG[ogg] = "--enable-ogg --with-ogg-libraries=${STAGING_LIBDIR} --with-ogg-includes=${STAGING_INCDIR},--disable-ogg,libogg"
 
-- 
2.25.1


