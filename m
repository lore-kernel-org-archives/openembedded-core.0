Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C414DCAC592
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 18:58:10 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.14274.1758282832091740912
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Sep 2025 04:53:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f9OMxbu0;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: nmjain23@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-24c8ef94e5dso17178145ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 04:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758282831; x=1758887631; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tb6hl4QkbyvespAayywYGJTEJTfhUd7CURz21M/nvi8=;
        b=f9OMxbu0PR41BMEzHMJXGGKRuhjMsTlIf7+AQWpzJtiYDni4wPPGkSAx7zhJWkPjOY
         KHfnWPoHB5HTZkmcuPBQlKIDtB8G7mtX7WakyXHIq8rwSjQT9S6Amr1TX4LU4Hh5UTeL
         AIyI/X11aa1nZJFmEfNHUfL277UGuUk7xAtdglsVrXaGsr9Yc/36RsHPNlN6xdHpVtCS
         HkPpDp2Vx7CXwEVv/L2crcIMXZjFhYz4ixO+vj2fSiJsXlkZ7/FTrImw6RxKLuN6F7hY
         R6wnHPBR40QYjvdumbgp9502SPZAWTusVIN0+z1706XKabRmwNiZwYVieDlU6sPMlqGo
         qWxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758282831; x=1758887631;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tb6hl4QkbyvespAayywYGJTEJTfhUd7CURz21M/nvi8=;
        b=TrOzac0wxUIGRWLVFZOj+ZCfnnlVnlpF2mc4wFPXSMcIrmWnGtJwga6RHVWf4P9UC5
         ZaTbcI3X1rGt8f4uCmWgiEGG4H/zKWxVb90EY/3vwknfsxziXVNUHDVTllnGAHAuxjSJ
         b4Fj8bOYgdpshv/Tl1fWp1UlOuNcxPblQhUllA+thfO3bk44kDmafYx6UtT5b8X3ismi
         06t4Jx2r2X9omGBUX6ce6ifcZZWBYNjz+y2uR+jUjY7sho5PH3GqMYKBWhEWQjBtiWRE
         gDOTPOSLaLqrH8trFvGYmySJaVIbBDIRvl2wXziQsJGmb6l+OP/jR5vr3szFPt6Bqdmh
         YjnQ==
X-Gm-Message-State: AOJu0YwCsm6BvR5h+dhFxIA+ICn1pWC/nz21Rg1UR6WT//caHb8GUNRF
	TLPGnxbSP/Ie31Ioh6vHVaKQClhSJnZMBJj7kj4OOVRKrF1Vncw67yGeAgqG4A==
X-Gm-Gg: ASbGncvc+mburFzdieowCbBZYCY6q4E9A0mfptREqvLVSzWUhpQ1EBoh+m/1FGye23g
	ruUU9ZkX+KjNeVnBR5w8Ej4mEttJcg3sDShQ6FcJukDDLsTaKVgwMEdzub0gYqL58Iq9BnF+1PG
	yP+nJbS0mE8kra39ZH69k/rHbYB24QIfYIk20dYsPH++S5d1PltoJf7Oi/cIW+WKfU3YH/OlPYn
	1T08p9YxtWdlEFBGTVJIx0rrqF/N6hqHeTXgaxmKV2EKJB0Ws6cXajPIGP2m98Grob4kgf0+ck4
	QR2hGOdHXV87meOZMOlM5h1Kwd7RvmrmMquvTPeazyS2k9buNJufjHCVG+Yu3aX1PqvUB3LAyaX
	9csWs6Odvqa8cv3lCSU58MF4UgBz5
X-Google-Smtp-Source: AGHT+IFw/Wb+pRKUN8yuEn2B7vBTmDwWgPAExLa0rSBJYcCz1QKzhixxgNnYyKCtYX0LEJuSf5yDqA==
X-Received: by 2002:a17:903:1212:b0:267:d7f8:405b with SMTP id d9443c01a7336-2697c6afddamr108093805ad.0.1758282831128;
        Fri, 19 Sep 2025 04:53:51 -0700 (PDT)
Received: from LL-3450LLL.kpit.com ([103.133.67.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2698030ee20sm53360325ad.109.2025.09.19.04.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 04:53:50 -0700 (PDT)
From: Naman Jain <nmjain23@gmail.com>
X-Google-Original-From: Naman Jain <namanj1@kpit.com>
To: openembedded-core@lists.openembedded.org
Cc: Virendra.Thakur@kpit.com
Subject: [PATCH] libmd: add ptest for 'libmd'
Date: Fri, 19 Sep 2025 17:23:31 +0530
Message-Id: <20250919115331.1507683-1-namanj1@kpit.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 18:58:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223771

Adapt the compile 'test' phony target from Makefile and deploy as
ptest for libmd.
It takes less than 30seconds for ptest completion

Signed-off-by: Naman Jain <namanj1@kpit.com>
---
 meta/recipes-support/libmd/files/run-ptest | 18 ++++++++++++++++++
 meta/recipes-support/libmd/libmd_1.1.0.bb  | 17 ++++++++++++++++-
 2 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libmd/files/run-ptest

diff --git a/meta/recipes-support/libmd/files/run-ptest b/meta/recipes-support/libmd/files/run-ptest
new file mode 100644
index 0000000000..0c4a5f64ec
--- /dev/null
+++ b/meta/recipes-support/libmd/files/run-ptest
@@ -0,0 +1,18 @@
+#!/bin/sh
+
+cd test
+status = 0
+
+for testbin in *; do
+    if [ -x "$testbin" ] && [ ! -d "$testbin" ]; then
+        if "./$testbin"; then
+            echo "PASS: $testbin"
+        else
+            echo "FAIL: $testbin"
+            status=1
+        fi
+    fi
+done
+
+return $status
+
diff --git a/meta/recipes-support/libmd/libmd_1.1.0.bb b/meta/recipes-support/libmd/libmd_1.1.0.bb
index dc588a0f95..a39a5ec65b 100644
--- a/meta/recipes-support/libmd/libmd_1.1.0.bb
+++ b/meta/recipes-support/libmd/libmd_1.1.0.bb
@@ -11,6 +11,21 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0436d4fb62a71f661d6e8b7812f9e1df"
 SRC_URI = "https://archive.hadrons.org/software/libmd/libmd-${PV}.tar.xz"
 SRC_URI[sha256sum] = "1bd6aa42275313af3141c7cf2e5b964e8b1fd488025caf2f971f43b00776b332"
 
-inherit autotools
+inherit autotools ptest
+
+do_compile_ptest() {
+    sed -i "/\$(MAKE) \$(AM_MAKEFLAGS) check-TESTS/d" test/Makefile
+    oe_runmake check
+}
+
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/test
+    for bin in ${B}/test/*; do
+        if [ -x "$bin" ]; then
+            libtool --mode=install install "$bin" ${D}${PTEST_PATH}/test/$(basename "$bin")
+        fi
+    done
+}
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


