Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.6024.1615541520415778585
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Mar 2021 01:32:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NnltInfc;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id jt13so52129188ejb.0
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Mar 2021 01:32:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=obV9W1FnnIPC/By1NWPNTeHydNX/FxkZesWTLeM/Z4I=;
        b=NnltInfcpQTRb98LPOk+SuSNONHqu5EZm45guyHQYsTUAoIw0KdNCyoq3fR0dLucmB
         0WJ0x1S2zVBvAZ+vsNw1nUgdPIL4i8KA6DonDjjwt8uQpbfAS/QcclIQ7oyr9a/2fPy+
         qcsXgMvhuqxO4NIod12VtlNJ9/IAv1RyRVxBh/auLtnCjB2RrJNM3Ctk2QMpg7+qvUcu
         BNmhO0czYZwFaVnm1/j/22BhXApLMKwXQNvVUXjZtQaVu6tnmVo1uBAbC7zEjFNe6l8y
         T+WRD1VABv/4Ivyo/qzB4L9HYX2Ke+oM1q1UzyOcfdmp43QkztxL5jeGPGmq8O7bI2LF
         DwQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=obV9W1FnnIPC/By1NWPNTeHydNX/FxkZesWTLeM/Z4I=;
        b=V87bpDmcP0QYQjxIJGr+5Cg3bNxOkWZx3PaXSgxx5ldZVzPOcpE/0CDMLg/BOrh392
         c00x45bvoGocfAmwQ5wzFpyk8Y3TeEQ69UzHzy0F7/yR9OpXAe5YcMvsu1H2Kty8raps
         m4PEWDOBTliOlIYXEwMDWaAWcRYdjpucMx0D05MmvhzPKPuYpcL5MyesVLSnTAObk5Zd
         YUpb0QjXJYaYvpaXn1yy8XAuyM/EP+/1TmNCmKFVu49zq7zyHGnyaL6xvgmCBNKk94bG
         w1V2HRHzRmURja4WB+v0zWqt77n7s5nU/SV4mi3JHL6p+aXJbZl1++5meDdbc13LlH3l
         2PVg==
X-Gm-Message-State: AOAM532wxNHQEMA8KQc8KQxZgsHPAr4FDOTvA84WGolrQIm0kmEuIzvM
	fbxl1tBhHkAIWk2I/1S9WV9XstSeeufJCQ==
X-Google-Smtp-Source: ABdhPJy0FhYW0JO2fT2Rn9sbJoiYqXHyYsaRM2cc4twOEfy55uEKWrYpb9KFTuGB4YPtEkHzkz5qyw==
X-Received: by 2002:a17:906:565a:: with SMTP id v26mr7688400ejr.516.1615541519034;
        Fri, 12 Mar 2021 01:31:59 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id a9sm2635831edt.82.2021.03.12.01.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 01:31:58 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [RFC PATCH 3/7] oeqa/core/tests/test_data.py: use weston image instead of sato
Date: Fri, 12 Mar 2021 10:31:35 +0100
Message-Id: <20210312093139.318889-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210312093139.318889-1-alex.kanavin@gmail.com>
References: <20210312093139.318889-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/lib/oeqa/core/tests/test_data.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/core/tests/test_data.py b/meta/lib/oeqa/core/tests/test_data.py
index ac74098b78..acd726f3a0 100755
--- a/meta/lib/oeqa/core/tests/test_data.py
+++ b/meta/lib/oeqa/core/tests/test_data.py
@@ -33,7 +33,7 @@ class TestData(TestBase):
 
     def test_data_fail_wrong_variable(self):
         expectedError = 'AssertionError'
-        d = {'IMAGE' : 'core-image-sato', 'ARCH' : 'arm'}
+        d = {'IMAGE' : 'core-image-weston', 'ARCH' : 'arm'}
 
         tc = self._testLoader(d=d, modules=self.modules)
         results = tc.runTests()
-- 
2.29.2

