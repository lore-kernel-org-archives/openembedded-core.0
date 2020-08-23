Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web12.180997.1598214072768900715
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2020 13:21:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GYJ57tl3;
 spf=pass (domain: gmail.com, ip: 209.85.218.68, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f68.google.com with SMTP id d11so9078115ejt.13
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Aug 2020 13:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oEhrTuIry8hufsBp32Qu7zpkIcQutMBPDzwyhnBiDwA=;
        b=GYJ57tl322EL28FeGXlUGromfEclqMQltf0pA2Id9pkvdykI3hEoqA0xMKspyVoGpM
         2DkZ5h4Jisb8xbmBXKxy37GLWLVi08oXMvMov7fMSBpU9cPyloyThwB/dW1FzcnmIBXG
         hcR6vR0hRZlAPyb1tQl81GxOmXKv5YhxzjeC6xRWtIKFoIq2BHrz8tmCgA7BeogUAXn0
         94pfhORPmJ1f81665eKMSavjF3kLQnHHydWkGaDBnhaw7j5tej400hiMXeRiy5HYEyb0
         5UH3Hk52l40AZG3pYC5n5Lyf1WhqBoZZNDbpsm1COEJKPzpdYQqdtMuanBBEYQXXj7wK
         eseA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oEhrTuIry8hufsBp32Qu7zpkIcQutMBPDzwyhnBiDwA=;
        b=au5Ze1aaQ+wfNSsRpCBDCBLdnOv1skwOnv5O6ZjTJuQjQunAe5UzAXOXaKbwcbJ/9y
         P+8/K5/qGSMj/v3JdxY1O0N0kEpSlYpbi5NykTwc8pWqJ+t6RWL0Hu7I2uc6p7V2MnTA
         181DfMd9dGvMDj9Lt4H/e7fmN04P7tma4kekVeRAcj982tVRhlXBI1jB8pMZLjZsbFi3
         LtuTQtRfC1fQxTZf+uEWNL2G1MLWp9lHsT1cDxCBxPRqBUpKWtmATN72seUcu3k12EHK
         3+CuZE8tbi/4Kfd3MvpKhD3r807IFmULYKgtonswT3gn5szlQBq2ZUxcSajY1bNs20JY
         Zdqw==
X-Gm-Message-State: AOAM532ICtqaCs5Lbp3OtjylEGwQzNyGU90/DSkAuN5S9sClKe0dEr6S
	7lkIAkKlcGzji3mP6L9GZndYkvIQm70=
X-Google-Smtp-Source: ABdhPJwvh3figbltaSzsRYYr9HUhpyZYRVHii1J2jKeXRJOr9UggmC3Lq6axJ2cvCZ+L4/uz13pUQQ==
X-Received: by 2002:a17:906:98c1:: with SMTP id zd1mr2784078ejb.410.1598214070968;
        Sun, 23 Aug 2020 13:21:10 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box (cable-95-168-130-13.cust.telecolumbus.net. [95.168.130.13])
        by smtp.gmail.com with ESMTPSA id sd17sm7342480ejb.93.2020.08.23.13.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2020 13:21:10 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 07/37] acpica: upgrade 20200528 -> 20200717
Date: Sun, 23 Aug 2020 22:20:01 +0200
Message-Id: <20200823202031.24686-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200823202031.24686-1-alex.kanavin@gmail.com>
References: <20200823202031.24686-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../acpica/{acpica_20200528.bb => acpica_20200717.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/acpica/{acpica_20200528.bb => acpica_20200717.bb} (94%)

diff --git a/meta/recipes-extended/acpica/acpica_20200528.bb b/meta/recipes-extended/acpica/acpica_20200717.bb
similarity index 94%
rename from meta/recipes-extended/acpica/acpica_20200528.bb
rename to meta/recipes-extended/acpica/acpica_20200717.bb
index d68afd8158..d1d06c0c24 100644
--- a/meta/recipes-extended/acpica/acpica_20200528.bb
+++ b/meta/recipes-extended/acpica/acpica_20200717.bb
@@ -17,7 +17,7 @@ COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 DEPENDS = "m4-native flex-native bison-native"
 
 SRC_URI = "https://acpica.org/sites/acpica/files/acpica-unix-${PV}.tar.gz"
-SRC_URI[sha256sum] = "e69f81c6924c8d30f9b9005bb002307f07b5a1538e13c909bea2f8a44e0d8610"
+SRC_URI[sha256sum] = "cb99903ef240732f395af40c23b9b19c7899033f48840743544eebb6da72a828"
 
 UPSTREAM_CHECK_URI = "https://acpica.org/downloads"
 
-- 
2.28.0

