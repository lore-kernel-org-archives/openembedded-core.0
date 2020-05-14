Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
 by mx.groups.io with SMTP id smtpd.web12.6779.1589432606955952601
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2020 22:03:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qHIR2bxt;
 spf=pass (domain: gmail.com, ip: 209.85.214.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f195.google.com with SMTP id b12so703016plz.13
        for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2020 22:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eQGbTRUPPoim7uI5KdGd2Zo7LQY/FpzH+LvkBTaESkc=;
        b=qHIR2bxtBNGf2X4Yvmx1RHTFyiuBXOmWyau7Q7c6UEpo/nFosBGdRhZ8v7XNyeTDAX
         BndCeMf/rVDaUyUkRwbnTG2MapRDPAEuuMCpUuCdrgEIEeJ4ftBnVK97vGBqwRIjKeed
         Af53z3Eq32KXWW9s6va6tY5fU5yRHI4QU1kvkk7aa+Lh96roT4q99ELywY7OQdHsYCDD
         kedn0c1q9W7pW6jSzelIRHmZ4UB0288i1fHmSGSO2fHHbnl21mJ26DnqqE3OJ/WS8ATs
         mriUxP41dJUNqZ8+o0ZvNfKPbLbO3gNNeDgwAi4M7AwFjZGy2f/Dy8bh8ZpayJp18t+w
         uZ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eQGbTRUPPoim7uI5KdGd2Zo7LQY/FpzH+LvkBTaESkc=;
        b=Z8sbPg2KgpwRbkuxRmdLuUSMpbQUobGZ1OuNzDpfMblFMhPrhHSypx60Ys1h/TA+Nf
         stST1ykYyyVmgYBvfMWb87sci10BVIWzrBVdruBA/dIWpYjCuE1vyy02RCE9yq9iNcQy
         slsS4jRxZAIhdWHaK8WXoPHV/ddG1W+OsLTl41LhZBMWe0PWu7obb93653vcuxY05KIv
         scoItDg8nQowGq9oCjwf8uBujfUo0mBIezvjWY2tnfM6nUlPf3zrJ4y0nA2EHHMlmsDb
         eB4VFfKnoBY4dgPjeNnaDPCVYVgtIDQJsonHATZIVz2fMedOD/eETUeNGhLTUMRsdmER
         b+Pw==
X-Gm-Message-State: AOAM5329v6ejjJz3JW1wrHXlNMKIMS6UTacrEE3f8VBJPn8Zqahuq+PB
	Jpy+ipJklkIAkIxSzyKOP5NQhGq62cI=
X-Google-Smtp-Source: ABdhPJzzdbyGwKLTjmhX9mLh2puUmPPDw+WvV+a3Msw7dW7umGrrKUgcmlGWAgeDMVjJJGeNsP0puA==
X-Received: by 2002:a17:902:784c:: with SMTP id e12mr2382325pln.191.1589432606004;
        Wed, 13 May 2020 22:03:26 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net (c-73-63-224-124.hsd1.ca.comcast.net. [73.63.224.124])
        by smtp.gmail.com with ESMTPSA id z7sm1067649pff.47.2020.05.13.22.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2020 22:03:25 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/6] tune-cortexa55.inc: crc and crypto extentions are default on cortex-a55
Date: Wed, 13 May 2020 22:03:16 -0700
Message-Id: <20200514050321.1292228-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/machine/include/tune-cortexa55.inc | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/meta/conf/machine/include/tune-cortexa55.inc b/meta/conf/machine/include/tune-cortexa55.inc
index 8242cc9cef..89032b59ec 100644
--- a/meta/conf/machine/include/tune-cortexa55.inc
+++ b/meta/conf/machine/include/tune-cortexa55.inc
@@ -6,12 +6,8 @@ TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa55', ' -mcpu=corte
 require conf/machine/include/arm/arch-armv8a.inc
 
 # Little Endian base configs
-AVAILTUNES += "cortexa55 cortexa55-crypto"
+AVAILTUNES += "cortexa55"
 ARMPKGARCH_tune-cortexa55             = "cortexa55"
-ARMPKGARCH_tune-cortexa55-crypto      = "cortexa55"
-TUNE_FEATURES_tune-cortexa55          = "aarch64 cortexa55 crc"
-TUNE_FEATURES_tune-cortexa55-crypto   = "aarch64 cortexa55 crc crypto"
-PACKAGE_EXTRA_ARCHS_tune-cortexa55             = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa55"
-PACKAGE_EXTRA_ARCHS_tune-cortexa55-crypto      = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa55 cortexa55-crypto"
+TUNE_FEATURES_tune-cortexa55          = "aarch64 cortexa55 crc crypto"
+PACKAGE_EXTRA_ARCHS_tune-cortexa55    = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa55"
 BASE_LIB_tune-cortexa55               = "lib64"
-BASE_LIB_tune-cortexa55-crypto        = "lib64"
-- 
2.26.2

