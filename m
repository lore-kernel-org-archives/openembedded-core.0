Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EE76CCA482
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 08:45:15 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.51615.1658306699694263100
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:45:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DJwqwVf2;
 spf=pass (domain: gmail.com, ip: 209.85.208.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id m13so12682820edc.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5vAum4WlgCUHyFHJtr9Gt3Hz3VtCq1O9tCPdSxcw+UA=;
        b=DJwqwVf2X7WWs9CDG3z+zmeqG3TAM7KCnLhiA61BAvAxnn+1Na8/0NGSNBgnlV0xY3
         3jBFEoTdHTPWn4oTJ7IfCDAcMy95lm2DXB6nBc1gfWpN/cWMD56K9hBMieh/nB82jZ2h
         VVusVYNwoR4T+KjTTBsl1Gxf1jlHv43TR4r3xIgg6lH1rBEvWe2s1EtfglOAsrgiQVdm
         nYXkmFeZtbL/weC0fDTnG6iho54Y8t1XywQ3RZtaRdVq8ErrNs4kZWv7E/X9Zg+AShqA
         uIOOH3L+rFGNUlZp9rHyjKkDL2A+l1RvJvu+SOlfwdLLmAD9UPzDSJVWk2JKZ0LvrwVe
         egWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5vAum4WlgCUHyFHJtr9Gt3Hz3VtCq1O9tCPdSxcw+UA=;
        b=Q2KOH6lW2cK05Aa8CKlS6ply1wTOThooyZSwpgZ1PD50ztFtxyp1dP/rQrORKvLH2j
         kAtgDfueRIUHUYE9Gsc1VukSC3j9xFHpehWeBRR99WLykyq4g74kPvAZjS+I0Fd5Q0PE
         i045JOoCwhGnhwNjySTGXMeK/2RIViKVGhfdorj0UgjiWM2o2clniFcTk5gOKuksb4/Z
         3HLJJMXOxWixnhtktRDiWBIXoesw/gluCxOklgf9tUlItQNYVqXMdCR11m/wcVkTZgIH
         dXvavrA6xzZ9/Mhjg4Op3c/Fn4jUayuOP15SsLNZXS09LJfeZNXRuSE9gv8O3Ns1XE/h
         ofhQ==
X-Gm-Message-State: AJIora/fxbHIgOdC8RauYItbSAIcllpgdbEVcx1Gf216FSVkGLB+Ojla
	25QDS9l3mDvMFWAr4GAo1Zx54Htop/s=
X-Google-Smtp-Source: 
 AGRyM1vttkdGzxowvMogCJkneOuLLKbO3smnEuGE2+2LLZoTDsmrseZ1A0Ro64/tHnExz22M+1Puug==
X-Received: by 2002:a05:6402:214e:b0:43b:6bd9:319 with SMTP id
 bq14-20020a056402214e00b0043b6bd90319mr16061118edb.308.1658306708416;
        Wed, 20 Jul 2022 01:45:08 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 s9-20020a170906a18900b00722e5b234basm7781784ejy.179.2022.07.20.01.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 01:45:07 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 19/51] go: update 1.18.3 -> 1.18.4
Date: Wed, 20 Jul 2022 10:44:10 +0200
Message-Id: <20220720084442.2940187-19-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220720084442.2940187-1-alex@linutronix.de>
References: <20220720084442.2940187-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Jul 2022 08:45:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168313

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/go/{go-1.18.3.inc => go-1.18.4.inc}     | 2 +-
 ...{go-binary-native_1.18.3.bb => go-binary-native_1.18.4.bb} | 4 ++--
 ...o-cross-canadian_1.18.3.bb => go-cross-canadian_1.18.4.bb} | 0
 .../go/{go-cross_1.18.3.bb => go-cross_1.18.4.bb}             | 0
 .../go/{go-crosssdk_1.18.3.bb => go-crosssdk_1.18.4.bb}       | 0
 .../go/{go-native_1.18.3.bb => go-native_1.18.4.bb}           | 0
 .../go/{go-runtime_1.18.3.bb => go-runtime_1.18.4.bb}         | 0
 meta/recipes-devtools/go/{go_1.18.3.bb => go_1.18.4.bb}       | 0
 8 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/go/{go-1.18.3.inc => go-1.18.4.inc} (89%)
 rename meta/recipes-devtools/go/{go-binary-native_1.18.3.bb => go-binary-native_1.18.4.bb} (83%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.18.3.bb => go-cross-canadian_1.18.4.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.18.3.bb => go-cross_1.18.4.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.18.3.bb => go-crosssdk_1.18.4.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.18.3.bb => go-native_1.18.4.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.18.3.bb => go-runtime_1.18.4.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.18.3.bb => go_1.18.4.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.18.3.inc b/meta/recipes-devtools/go/go-1.18.4.inc
similarity index 89%
rename from meta/recipes-devtools/go/go-1.18.3.inc
rename to meta/recipes-devtools/go/go-1.18.4.inc
index 693b045e8f..bfda15c54f 100644
--- a/meta/recipes-devtools/go/go-1.18.3.inc
+++ b/meta/recipes-devtools/go/go-1.18.4.inc
@@ -15,4 +15,4 @@ SRC_URI += "\
     file://0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
     file://filter-build-paths.patch \
 "
-SRC_URI[main.sha256sum] = "0012386ddcbb5f3350e407c679923811dbd283fcdc421724931614a842ecbc2d"
+SRC_URI[main.sha256sum] = "4525aa6b0e3cecb57845f4060a7075aafc9ab752bb7b6b4cf8a212d43078e1e4"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.18.3.bb b/meta/recipes-devtools/go/go-binary-native_1.18.4.bb
similarity index 83%
rename from meta/recipes-devtools/go/go-binary-native_1.18.3.bb
rename to meta/recipes-devtools/go/go-binary-native_1.18.4.bb
index f207a47e90..252c467a00 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.18.3.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.18.4.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
 PROVIDES = "go-native"
 
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "956f8507b302ab0bb747613695cdae10af99bbd39a90cae522b7c0302cc27245"
-SRC_URI[go_linux_arm64.sha256sum] = "beacbe1441bee4d7978b900136d1d6a71d150f0a9bb77e9d50c822065623a35a"
+SRC_URI[go_linux_amd64.sha256sum] = "c9b099b68d93f5c5c8a8844a89f8db07eaa58270e3a1e01804f17f4cf8df02f5"
+SRC_URI[go_linux_arm64.sha256sum] = "35014d92b50d97da41dade965df7ebeb9a715da600206aa59ce1b2d05527421f"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.18.3.bb b/meta/recipes-devtools/go/go-cross-canadian_1.18.4.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.18.3.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.18.4.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.18.3.bb b/meta/recipes-devtools/go/go-cross_1.18.4.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.18.3.bb
rename to meta/recipes-devtools/go/go-cross_1.18.4.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.18.3.bb b/meta/recipes-devtools/go/go-crosssdk_1.18.4.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.18.3.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.18.4.bb
diff --git a/meta/recipes-devtools/go/go-native_1.18.3.bb b/meta/recipes-devtools/go/go-native_1.18.4.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-native_1.18.3.bb
rename to meta/recipes-devtools/go/go-native_1.18.4.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.18.3.bb b/meta/recipes-devtools/go/go-runtime_1.18.4.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.18.3.bb
rename to meta/recipes-devtools/go/go-runtime_1.18.4.bb
diff --git a/meta/recipes-devtools/go/go_1.18.3.bb b/meta/recipes-devtools/go/go_1.18.4.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.18.3.bb
rename to meta/recipes-devtools/go/go_1.18.4.bb
-- 
2.30.2


