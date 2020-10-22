Received: from mail-oo1-f66.google.com (mail-oo1-f66.google.com [209.85.161.66])
 by mx.groups.io with SMTP id smtpd.web08.7471.1603355547806845468
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2020 01:32:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.161.66, mailfrom: aehs29@gmail.com)
Received: by mail-oo1-f66.google.com with SMTP id x1so160324ooo.12
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2020 01:32:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OHqwgqHD7+t9240a/lK8xkwGH3UHLJp1eWJ/35HKAhk=;
        b=bTu+ZN2dq0bpNF5sfHdh57N+gNroo4chVd/FGl3Eps+3nLeH3nwtKIXNPBRMPbctDQ
         eA01aK2mPZXORhOgHhiKhtpQLJ3guN4gZRGlJAGPeL8fqAWDCHOAyZZGBuGQyeycgeAq
         N2Fke3Gmr3Q2hkNAHNRPehrxV3T1FU031nK0k4MiF+kDPqNkBDKVIL7EDXSlmycLAdkm
         nFS570ZmhAvftL4jAcADySnITAq/ib/6zqBrdnkddXIcEdVTtiFoY8okQq4KwIpHm1KV
         JvuVU/yaH/3WQrQaO+idxkdppN70djtRkDBu+1M2DjWgclaI5qjREh39bT93jFcP1eAs
         /zFw==
X-Gm-Message-State: AOAM5328K2L/HPL6YhWKMHf6X9/hLp9WLhKr6VielfnF3S6CcYN1K5/j
	WEyLM3uvCZc/XieBIvFgxx4MvvK9CrWjfQ==
X-Google-Smtp-Source: ABdhPJxV2gkL+XkJwjQeLCWDbXPw/smPltcO7Fo3F+z3JV/rf0I+FCI3JnEikQKP9Zl4yU4QqRkFJQ==
X-Received: by 2002:a4a:e93a:: with SMTP id a26mr1203776ooe.58.1603355546696;
        Thu, 22 Oct 2020 01:32:26 -0700 (PDT)
Return-Path: <aehs29@gmail.com>
Received: from alsamon-xub.lan ([2605:6000:1306:9479:11c5:a222:ef1f:ef8d])
        by smtp.gmail.com with ESMTPSA id e91sm254267ote.1.2020.10.22.01.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2020 01:32:26 -0700 (PDT)
From: "Alejandro Hernandez Samaniego" <alejandro@enedino.org>
To: openembedded-core@lists.openembedded.org
Cc: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Subject: [PATCH] baremetal-helloworld: Fix install path since S doesnt have a trailing slash
Date: Thu, 22 Oct 2020 02:32:22 -0600
Message-Id: <20201022083222.1506844-1-alejandro@enedino.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
---
 .../baremetal-examples/baremetal-helloworld_git.bb            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-skeleton/recipes-baremetal/baremetal-examples/baremetal-helloworld_git.bb b/meta-skeleton/recipes-baremetal/baremetal-examples/baremetal-helloworld_git.bb
index 7a580bd885..946a12d0a5 100644
--- a/meta-skeleton/recipes-baremetal/baremetal-examples/baremetal-helloworld_git.bb
+++ b/meta-skeleton/recipes-baremetal/baremetal-examples/baremetal-helloworld_git.bb
@@ -40,8 +40,8 @@ EXTRA_OEMAKE_append = " QEMUARCH=${BAREMETAL_QEMUARCH} V=1"
 # Install binaries on the proper location for baremetal-image to fetch and deploy
 do_install(){
     install -d ${D}/${base_libdir}/firmware
-    install -m 755 ${B}build/hello_baremetal_${BAREMETAL_QEMUARCH}.bin ${D}/${base_libdir}/firmware/${BAREMETAL_BINNAME}.bin
-    install -m 755 ${B}build/hello_baremetal_${BAREMETAL_QEMUARCH}.elf ${D}/${base_libdir}/firmware/${BAREMETAL_BINNAME}.elf
+    install -m 755 ${B}/build/hello_baremetal_${BAREMETAL_QEMUARCH}.bin ${D}/${base_libdir}/firmware/${BAREMETAL_BINNAME}.bin
+    install -m 755 ${B}/build/hello_baremetal_${BAREMETAL_QEMUARCH}.elf ${D}/${base_libdir}/firmware/${BAREMETAL_BINNAME}.elf
 }
 
 FILES_${PN} += " \
-- 
2.25.1

