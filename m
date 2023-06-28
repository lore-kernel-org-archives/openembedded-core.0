Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C95F0EB64D7
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 13:17:37 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.15912.1687958254441868459
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jun 2023 06:17:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=cInvjHS4;
 spf=pass (domain: mvista.com, ip: 209.85.216.53, mailfrom: sdoshi@mvista.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-263121cd04eso1308839a91.2
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 06:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1687958253; x=1690550253;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gcX9fosNfJW3Io3pd1AucvdjVH6zkGOxV8I45R21bwE=;
        b=cInvjHS4jPx7qGq4tC5Iw77qRTMl/3mkyeFoTvm3X/hWJzSZ8NiNEXPdWlrb89oXAw
         3x+TkFlgYSJJfN0B2n1SFxXqMWf1iMF6Qhvx8n/pDNOwsUlPqJKfIB1CJq7eQR1s51bv
         JKPKQdJOXQTF62DIALLY+sAe+9w9MI6X70y/E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687958253; x=1690550253;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gcX9fosNfJW3Io3pd1AucvdjVH6zkGOxV8I45R21bwE=;
        b=HG4c5lR5WYg4ZYhL0QFK0knbOrLyNWmmWuOFiYIcmC4+NVQc1+5zFQXlSLbwmg/Iia
         1I7Y3KLqY59KHZIgPUaJMW8Bd4WPcYBzRB2mFFc+LWAejMJhHKLdg04CPIJC2aH9zip9
         V0V4qWko2N+3MaqpLUjAncPWIZhEownqT4wRlhDzvMX0YM/tqD7hmeAx4x2EIoCQ/SBd
         4YTuUqC9UsuAMaf5Sj35uFaXA1qhfB9V3ZGC++0RdE2VoG5psiOCPuLL4VCizN1bn9D4
         RljNPDHWL5ZrfKOJz2IgOmnMycDZtJamCeOyjRHT4z3WnosrtrW/olTF9zf2saG8vahg
         V1ow==
X-Gm-Message-State: AC+VfDw3HUGEIpCayWm6dHneOLiGogFWEjDJM/mHVpaEqXXkRuAyXuST
	sY0f0MMleeBi8o86gTABDQ9WfRiAcjlYlr2jXbI=
X-Google-Smtp-Source: ACHHUZ4D0h184OasByCS5YhcA7hbAxVOv8V+YNtFzq16TlykQHD2c7lO8BFUAgZQVl5MvCv5wks6mQ==
X-Received: by 2002:a17:90a:728e:b0:262:dfcc:fd47 with SMTP id e14-20020a17090a728e00b00262dfccfd47mr6927148pjg.29.1687958253444;
        Wed, 28 Jun 2023 06:17:33 -0700 (PDT)
Received: from localhost.localdomain ([49.34.230.143])
        by smtp.gmail.com with ESMTPSA id x2-20020a17090a294200b00262ca945cecsm8119123pjf.54.2023.06.28.06.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 06:17:33 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][master][PATCHv4] Flac: upgrade 1.4.2 -> 1.4.3
Date: Wed, 28 Jun 2023 18:45:25 +0530
Message-Id: <20230628131525.153334-1-sdoshi@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 13:17:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183552

From: Siddharth Doshi <sdoshi@mvista.com>

License-Update: URL fix

Remove PowerPC related options no longer supported upstream.

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 .../flac/{flac_1.4.2.bb => flac_1.4.3.bb}             | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)
 rename meta/recipes-multimedia/flac/{flac_1.4.2.bb => flac_1.4.3.bb} (76%)

diff --git a/meta/recipes-multimedia/flac/flac_1.4.2.bb b/meta/recipes-multimedia/flac/flac_1.4.3.bb
similarity index 76%
rename from meta/recipes-multimedia/flac/flac_1.4.2.bb
rename to meta/recipes-multimedia/flac/flac_1.4.3.bb
index d3ece3f3cf..d4e463cda5 100644
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
 
@@ -25,11 +25,8 @@ EXTRA_OECONF = "--disable-oggtest \
                 "
 
 PACKAGECONFIG ??= " \
-    ${@bb.utils.filter("TUNE_FEATURES", "altivec vsx", d)} \
     ogg \
 "
-PACKAGECONFIG[altivec] = "--enable-altivec,--disable-altivec"
-PACKAGECONFIG[vsx] = "--enable-vsx,--disable-vsx"
 PACKAGECONFIG[avx] = "--enable-avx,--disable-avx"
 PACKAGECONFIG[ogg] = "--enable-ogg --with-ogg-libraries=${STAGING_LIBDIR} --with-ogg-includes=${STAGING_INCDIR},--disable-ogg,libogg"
 
-- 
2.25.1


