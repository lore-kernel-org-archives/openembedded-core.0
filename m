Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
 by mx.groups.io with SMTP id smtpd.web10.1836.1592375351218351424
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2020 23:29:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XYUl0FAG;
 spf=pass (domain: gmail.com, ip: 209.85.208.196, mailfrom: jacob.kroon@gmail.com)
Received: by mail-lj1-f196.google.com with SMTP id x18so1457371lji.1
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2020 23:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=79rbivT95vBLo56JnEbj3+dGA/QNL5pDYApz5JMPvlE=;
        b=XYUl0FAGwu9XlDAl5+YaV59rthX6Wz17GMbXyZgMthSRdDJOT4ZwAZHeXsF+miA1Sw
         vurSfBEgKe11NiZInQ0c4MmjOWTI2fP6zp34ov0wssNqw9iBqJCzSTsKrS+2DzppqxDb
         ccvP/hC8uDCl/5VMtd1cSvJqHOgZ6wHiteKvmhhCdeSpEJVHfWZhgLFcUxnNiAp9ldAb
         75nI8oz7kwOKH4iSc1U4UGLo+NAxAP4Po0TtI2NOJKebD53hmkuXqwx/eIPwWwCCpjKZ
         63gJqdjb2rmNyS24YVWkYVC3J1gr9unvR687Iqaxx2ruBCfGR4ITSU7qrXbx3Yvb164y
         umFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=79rbivT95vBLo56JnEbj3+dGA/QNL5pDYApz5JMPvlE=;
        b=Gk7G/R7yRTOutb/kOceUU4gMrmqdqim/xEx6ikPZgWiqlDsajJSQE1OYRzzytJdqJ7
         88bsCCkHB0Cd7BCGdfy8iOw6CgKmpWmbaPJ1DP0U/lSflIkq9pW/AHUrJoL/17+V7ZX6
         pOTjLQ2Vbcer5sfFaeVOJiAhAfEdyohvMT2LiQZ6Kfp0lQ6COXgcsorNL82lD62cB4TO
         oLytvh9MgNtGJA4eTqTeEIh7yU2pZioGteThjDYPwItrmvLGInZtM+wVIWjlWNjP+xFu
         WxVDFMVF9agJPTj7qOvYoz/KzsHjhtkLU6iKGsCcrDjTLSZWq+AzFO/1qBEDcaTZKG99
         1Muw==
X-Gm-Message-State: AOAM530msPIbOnBEL6XCCBzeG14CQTL17m+Cpb0sxY1pujOgoIrvcYcc
	oHD0ZuCMGITJW/k/k1WsC3/MRiFG
X-Google-Smtp-Source: ABdhPJwFx1s/sse94FeQ1KSq3MrfeNMKtnPkwhSprgq12mnKG2gsMP8g1VweNe4uGM5HOgCIYj+VCA==
X-Received: by 2002:a2e:8903:: with SMTP id d3mr2934516lji.298.1592375349017;
        Tue, 16 Jun 2020 23:29:09 -0700 (PDT)
Return-Path: <jacob.kroon@gmail.com>
Received: from localhost.localdomain ([213.185.29.22])
        by smtp.gmail.com with ESMTPSA id c3sm22800lfi.91.2020.06.16.23.29.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 23:29:08 -0700 (PDT)
From: "Jacob Kroon" <jacob.kroon@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] bitbake.conf: Remove TERM from default BB_HASHBASE_WHITELIST
Date: Wed, 17 Jun 2020 08:28:55 +0200
Message-Id: <20200617062855.251308-1-jacob.kroon@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since BitBake commit 0d5cdd0c0d65f2f81c3af0f3767fee86c4142c3a
TERM is no longer preserved in the environment by BitBake, so there
should be no need to whitelist it by default.

Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index f7700f1191..89717a7134 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -875,7 +875,7 @@ BB_CONSOLELOG ?= "${LOG_DIR}/cooker/${MACHINE}/${DATETIME}.log"
 # Setup our default hash policy
 BB_SIGNATURE_HANDLER ?= "OEBasicHash"
 BB_HASHBASE_WHITELIST ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH BBSERVER DL_DIR \
-    SSTATE_DIR THISDIR FILESEXTRAPATHS FILE_DIRNAME HOME LOGNAME SHELL TERM \
+    SSTATE_DIR THISDIR FILESEXTRAPATHS FILE_DIRNAME HOME LOGNAME SHELL \
     USER FILESPATH STAGING_DIR_HOST STAGING_DIR_TARGET COREBASE PRSERV_HOST \
     STAMPS_DIR PRSERV_DUMPDIR PRSERV_DUMPFILE PRSERV_LOCKDOWN PARALLEL_MAKE \
     CCACHE_DIR EXTERNAL_TOOLCHAIN CCACHE CCACHE_NOHASHDIR LICENSE_PATH SDKPKGSUFFIX \
