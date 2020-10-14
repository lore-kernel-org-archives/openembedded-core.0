Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web10.7191.1602664143356931099
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2020 01:29:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BXJ86DCq;
 spf=pass (domain: gmail.com, ip: 209.85.218.67, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f67.google.com with SMTP id u8so3649598ejg.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2020 01:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hWgbxvZiwhcQUz/3NE2d72NLRHXmCYLSS5wTMcr/sUo=;
        b=BXJ86DCqstu3Ctky7SyToC1KUkX27c+XgWhTtlUkyjaZtCF+GqyxMdxC76b2j8jIuy
         GxlQSDE8C+8Hv3R+PaLLAqVMSwQ721Ts8YW7AmUlLWpJu/44wbLm9n7fSK7gxh4s/+fl
         5H6vf88ByUnGNyzP6yx5fAMc+9P6w8D7Q1VYqujGMTJJecujOBIBVpXZWhKB8y9gN0qN
         VBuC6wckEqHCcWcgpn/Jam+ZOJuNGsyEm2RbrXbPot0l+RdmPHzBs4At6ijcTUhPRo92
         0MEhXYre16jM5ak2jPBSe57XtyxQ7ydWU9+j4OaUduOT0HB9b6Z7bRsZ+/X+SqJLOEsQ
         NnkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hWgbxvZiwhcQUz/3NE2d72NLRHXmCYLSS5wTMcr/sUo=;
        b=ZVj7Fl33yX8WvjLS2zQ0p4m05G11dvzkeGFEJ57J8Xi4oiBrqjDNazJA+b/mZuxVBL
         FfP9YmfSUcPBoLyA0s3/NKAV10aOOOhoeGEF+TmHjQDVnLPnepjh2vqP/H91ZzgIfanT
         xPS0CylhVyQtcNQWFluamLDu5lw9a+eFT6MdBKKt+HAt7VVIj8XOeQNfcmNzbPqmqDav
         F/DqtM5AuB/OMmkY04x95dbZCcYAXXzcPjLPd2TnI/336p4DJooC5pl1Ned0S1yfzOkg
         dcbLM8nKcklrlO9gAKy73dSfSb0ZP5xF3Gr+ZuNqUN1grx+hermS5YS8T1kaw3/ViWI7
         4Jyg==
X-Gm-Message-State: AOAM531dULPbjzoDl6F3nIJsVVW6dCmpnY9GLYi1Xx9P+TnSZoz7FOAG
	LGfbI94R1FWEyRKEqwoP4mJY+rwGn5Q=
X-Google-Smtp-Source: ABdhPJyMHuul5pSysRi4pyMGh19Cw+9TFQcnzRS1hFsI0RC5N9LW+sTMMxdfO+OquUlDvigm8v+Vtg==
X-Received: by 2002:a17:906:bc42:: with SMTP id s2mr3979260ejv.251.1602664141577;
        Wed, 14 Oct 2020 01:29:01 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id sb29sm1270024ejb.76.2020.10.14.01.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2020 01:29:00 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] tune-cortexa76ae.inc: Correct TUNE_FEATURES
Date: Wed, 14 Oct 2020 10:28:58 +0200
Message-Id: <20201014082858.42516-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* as shown by sanity checker:
    Toolchain tunings invalid:
    Tuning 'cortexa76ae' has no defined features, and cannot be used.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/machine/include/arm/armv8-2a/tune-cortexa76ae.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa76ae.inc b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa76ae.inc
index d368aa104d..8d5a0ef5e2 100644
--- a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa76ae.inc
+++ b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa76ae.inc
@@ -11,6 +11,6 @@ require conf/machine/include/arm/arch-armv8-2a.inc
 # Little Endian base configs
 AVAILTUNES                                         += "cortexa76ae"
 ARMPKGARCH_tune-cortexa76ae                         = "cortexa76ae"
-TUNE_FEATURES_tune-cortexa65ae                      = "${TUNE_FEATURES_tune-armv8-2a-crypto} cortexa76ae"
+TUNE_FEATURES_tune-cortexa76ae                      = "${TUNE_FEATURES_tune-armv8-2a-crypto} cortexa76ae"
 PACKAGE_EXTRA_ARCHS_tune-cortexa76ae                = "${PACKAGE_EXTRA_ARCHS_tune-armv8-2a-crypto} cortexa76ae"
 BASE_LIB_tune-cortexa76ae                           = "lib64"
-- 
2.25.1

