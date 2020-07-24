Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web11.7538.1595601794482988997
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jul 2020 07:43:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HvgU76Od;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: dbaryshkov@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id q6so10226324ljp.4
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2020 07:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Svt+u72/Nh3heTl6k0YoPR6cVcZ00OfDn2ptnTx/ooM=;
        b=HvgU76Od+coSMIc9tyLDAFht0c2PsT+bhIdrai5akkKM38P4DxnhCLuc1Fpv+n23YE
         tcYZ8wd2YwhzWwt6zRXwgdGlNLMVkaoyf0pcOi8gpwEyc+ldIxBqxrUtRjgSmQV1Vkez
         43ZVWMAgaErFIdaAo27r2rgOexyJyBE2bQ2Jy8W8cSdQuYd487mw2NAJPO78uMh2OLJ0
         oBhauuc3cvA8TAT986Q0IFWx22nGzVDKOel6eokxZLSzk80kGdluQQ1gQnowUFrDE3Uy
         58jQn6baiY34sE6zXfg3a2+rcethSVF+I3+RpLyaj1a+yMnOXbRcl87xaaCkMWC0CAeV
         PK+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Svt+u72/Nh3heTl6k0YoPR6cVcZ00OfDn2ptnTx/ooM=;
        b=OERZ6qAP0eSZfDA3Oc5GzmxdhvptOiyEnvbnl4vBedZ9RjBFH5DMpZuN8wk8YaKKMv
         6eUijIPS30jZyUyAw7GfhgEQV53laqH+Q/ys1i5lWhhHOSp0is2GXqS8mgjhKko9INQS
         kTcASO267xuvBpg92rojeFw3vf6Nr8k9uZMjzeMvcP42dET4eoO6lWI03UE3Wa4Dql5F
         arLZUrMRkuGaQvXmuvawmnixYU6ViZfa4DntJivMHJfL9vMKqxb6o5BEKZ9KA5CgWK+G
         Y+QJ8f2XPqF6KroxAn/Q71ZZeCzoYQOWfqcX028hfkIu2QQ6mrR5oA+4U866x/c4ZcPK
         oEtw==
X-Gm-Message-State: AOAM532fbtB1I6JQtPs5OMHbcUz9qwqCP+53Jc1Yje55A5UNfwBifWDL
	EeTIHw9VRALBhE3P6U3sJwxZDIgy83M=
X-Google-Smtp-Source: ABdhPJyW7PHTES2LrAir+OGBc5AqIKxCs243O9EhBj56pRiV10+3qx7ijMxYjXdJ7L6fta4HZNq5Eg==
X-Received: by 2002:a05:651c:1057:: with SMTP id x23mr4150903ljm.116.1595601792245;
        Fri, 24 Jul 2020 07:43:12 -0700 (PDT)
Return-Path: <dbaryshkov@gmail.com>
Received: from eriador.lan ([188.162.65.229])
        by smtp.gmail.com with ESMTPSA id h21sm290851ljk.31.2020.07.24.07.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2020 07:43:10 -0700 (PDT)
From: "Dmitry Baryshkov" <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 2/2] tune-cortexa55.inc: switch to using armv8.2a include file
Date: Fri, 24 Jul 2020 17:43:06 +0300
Message-Id: <20200724144306.4031060-2-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200724144306.4031060-1-dbaryshkov@gmail.com>
References: <20200724144306.4031060-1-dbaryshkov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Since Cortex-A55 is an ARMv8.2 core, switch to using arch-armv8-2a.inc
file.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 meta/conf/machine/include/tune-cortexa55.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/tune-cortexa55.inc b/meta/conf/machine/include/tune-cortexa55.inc
index 89032b59ecdc..b383eb733b72 100644
--- a/meta/conf/machine/include/tune-cortexa55.inc
+++ b/meta/conf/machine/include/tune-cortexa55.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "cortexa55"
 TUNEVALID[cortexa55] = "Enable Cortex-A55 specific processor optimizations"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa55', ' -mcpu=cortex-a55', '', d)}"
 
-require conf/machine/include/arm/arch-armv8a.inc
+require conf/machine/include/arm/arch-armv8-2a.inc
 
 # Little Endian base configs
 AVAILTUNES += "cortexa55"
-- 
2.27.0

