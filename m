Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 293EAEB64D9
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 04:16:54 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.5823.1687839411826494754
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jun 2023 21:16:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=hrY3L3lO;
 spf=pass (domain: mvista.com, ip: 209.85.214.169, mailfrom: sdoshi@mvista.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1b7e66ff65fso23627155ad.0
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Jun 2023 21:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1687839411; x=1690431411;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mArSRhjVmH1RtW29jRocDxMz/LF8ttKNyiWhQLtHy7E=;
        b=hrY3L3lO5ljbzMHlNEkRKoaLKw3dDsbvOjfIp75Rjk8QILNa0Ycp4xtpqexWCZSVEr
         MO2vV9diraWG37QMpnvwOQxqgirXudpRXsNsk6UMVY8T35kPI66xLDvLWZ5gu4He4Bl6
         C6yaLHetvCa4KHObncB56zuHrR8/68Sat+smE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687839411; x=1690431411;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mArSRhjVmH1RtW29jRocDxMz/LF8ttKNyiWhQLtHy7E=;
        b=CfOLt3I3LvvMJiKHAXdXbJ+/aOttSW9KESH9Ez8ihPEDaABNi6rw3uFh2YuW/Xwals
         2p/uQyUK2JzNkuTJoCLe43eUZAYzEBwsmu148WkBDV70ScTFkzdQGrMV+LrTo0iFip0b
         rp4bta99MwUFM1RzHjQhqCdPPTlLo6NKlfQyBVBRBRWCN9uH+Avcds30IDdLur7v2StW
         50Yq/W7nCoHCkShbtFn9In5WdfAumFZ/cZtJEt6HC0K6aN3IGJzgJHLrA9O3uGVEk6Zs
         zd4JnNtBQa2h7hMiqKUa49EaHPuTk+yGnpg1cJnllTVQEO83Hrg/PH/13jpkv5kbzO/q
         ZB1Q==
X-Gm-Message-State: AC+VfDwaBHzdHD274tKaUb7WnkSGNpaxmZWUVHoe5Y2RALp2xtOXtm+p
	q/N/bfnrVyWU+IEQyBWcN0ffJAe8ZpQLBp2ILkU=
X-Google-Smtp-Source: ACHHUZ74uK9kICmsF/JhibBGDKIDulUGeFGS1kvAb5arxHakTzlsCR04+uBrot6VOJWHYvQFPzHmpQ==
X-Received: by 2002:a17:902:aa83:b0:1b7:d4a0:639 with SMTP id d3-20020a170902aa8300b001b7d4a00639mr8391899plr.31.1687839410664;
        Mon, 26 Jun 2023 21:16:50 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:8008:b89f:4bda:ef56:a8da:8124])
        by smtp.gmail.com with ESMTPSA id bj8-20020a170902850800b001b7fa81b145sm3234718plb.265.2023.06.26.21.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 21:16:50 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][master][PATCHv2] Upgrade flac 1.4.2 -> 1.4.3
Date: Tue, 27 Jun 2023 09:46:43 +0530
Message-Id: <20230627041643.7011-1-sdoshi@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 04:16:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183437

From: Siddharth Doshi <sdoshi@mvista.com>

License-Update: URL fix

Remove PowerPC related options no longer supported upstream.

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 .../flac/{flac_1.4.2.bb => flac_1.4.3.bb}              | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)
 rename meta/recipes-multimedia/flac/{flac_1.4.2.bb => flac_1.4.3.bb} (80%)

diff --git a/meta/recipes-multimedia/flac/flac_1.4.2.bb b/meta/recipes-multimedia/flac/flac_1.4.3.bb
similarity index 80%
rename from meta/recipes-multimedia/flac/flac_1.4.2.bb
rename to meta/recipes-multimedia/flac/flac_1.4.3.bb
index d3ece3f3cf..9ef9ca75ef 100644
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
 
@@ -28,8 +28,6 @@ PACKAGECONFIG ??= " \
     ${@bb.utils.filter("TUNE_FEATURES", "altivec vsx", d)} \
     ogg \
 "
-PACKAGECONFIG[altivec] = "--enable-altivec,--disable-altivec"
-PACKAGECONFIG[vsx] = "--enable-vsx,--disable-vsx"
 PACKAGECONFIG[avx] = "--enable-avx,--disable-avx"
 PACKAGECONFIG[ogg] = "--enable-ogg --with-ogg-libraries=${STAGING_LIBDIR} --with-ogg-includes=${STAGING_INCDIR},--disable-ogg,libogg"
 
-- 
2.25.1


