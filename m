Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web08.19191.1608974884200141127
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Dec 2020 01:28:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=biQZ/TAl;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id jx16so8270964ejb.10
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Dec 2020 01:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RWfGTJFPbtr4GWefEgaImyuVR2EWfHveIS87HxM9USk=;
        b=biQZ/TAls3cnfKlZctJoAKVqT2fSFK7jTGr211ZXGSy5iqFSkzTJeOLsYUrCDzkA5m
         z32i8DplJjXMwi+ULgE87b9+Kq/+FGNVC8dTsfJNN/9q7Th7mGg+GaaHD9tQZgQCKcCc
         7mzi8JarbJjP0ix+fPK3aObB4IWyk9Ei45HoZJq1kdpzOommueuciQYhMtvLcF0JSCak
         b8jmUJsfGPCUsd+6bq6XG5SiDdjHTYAwj6eaeTK02pz78PMP5f2Q8Rzo5+M8YavGlHna
         Fle8+JVgz0+okS6TlCYIxYXGQO5PODprM75DHhqyEQ2GOYK0QI58BU7isDxbYCFTscav
         LpLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RWfGTJFPbtr4GWefEgaImyuVR2EWfHveIS87HxM9USk=;
        b=BMTnkK1CtciwbYvpFCzflwsY6Ku4WkkiV1587Eeohy6icJcRUnWhVMx8wlkiz6pVsb
         NaW7nECHU5//XWQfOQSDA49n/s2FzHr3HKxYV3YjpQI2SdB7bjbX6wsT3Mfhs+mnuIvk
         hdbfJ4/JBrKgDyll+x3G2oP4k0+HwoN/WhlULTQSjAVtBvm8iB65/kLmC7jNoZW7Jrja
         rfhLQd8TGsTetTmB+Jc++MsdA4/wFmVoVRD9kWyC01fy3WLzq38KIgjd8qzvfoIUOBva
         6y+6xN3Pf/IFMSmTjRO0/z2QYopK62zi6pNxzgf8LKaGA4JoxwloZ897DKMydAG1N5Y5
         eIsQ==
X-Gm-Message-State: AOAM530eC1zB3/VEl1TwrJG49Cwl3FEnTy+KpU7QZzrW/hZX3rcKIm/o
	EUKiZ49ML8uGA0eeV+YKQxzk4BeZP2w=
X-Google-Smtp-Source: ABdhPJyaKgbCrPIhrseOn2MHdW88Z7E3+ryZgWPkqrpdB6VDTTDLxCfEmDA32HifCGvKt+sXZmjj1A==
X-Received: by 2002:a17:906:d19b:: with SMTP id c27mr35175048ejz.234.1608974882827;
        Sat, 26 Dec 2020 01:28:02 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost-live.fritz.box ([2a02:2450:1011:4f7:a0c9:fd7f:e532:e1ec])
        by smtp.gmail.com with ESMTPSA id u2sm14828406ejb.65.2020.12.26.01.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Dec 2020 01:28:02 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 26/48] stress-ng: upgrade 0.11.24 -> 0.12.00
Date: Sat, 26 Dec 2020 10:27:10 +0100
Message-Id: <20201226092732.52323-26-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201226092732.52323-1-alex.kanavin@gmail.com>
References: <20201226092732.52323-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../stress-ng/{stress-ng_0.11.24.bb => stress-ng_0.12.00.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.11.24.bb => stress-ng_0.12.00.bb} (90%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.11.24.bb b/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb
similarity index 90%
rename from meta/recipes-extended/stress-ng/stress-ng_0.11.24.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb
index 3516c15451..3b38b39893 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.11.24.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb
@@ -9,7 +9,7 @@ SRC_URI = "https://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.xz \
            file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch \
            file://no_daddr_t.patch \
            "
-SRC_URI[sha256sum] = "5b3a724a85eed48743dedf37eab851b617ecf921b7fff427c6d0bbf405534671"
+SRC_URI[sha256sum] = "b2b738f574671926654b1623103a7aa58ee6911894ac78760ee188c4bfa96fe2"
 
 DEPENDS = "coreutils-native"
 
-- 
2.29.2

