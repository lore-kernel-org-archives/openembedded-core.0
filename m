Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web10.656.1605893398154080371
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2020 09:29:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RSBNGrJN;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id j19so7849650pgg.5
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2020 09:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1c909Pz8J3NKd+H82C27mQJFSyiCj/LEVJVRj79zpH4=;
        b=RSBNGrJNkR20Hvj0t+2c2pZrp9D/4FI346CnGQJemgNuk2fXLMABbIJcGGBfSft3zU
         bfAOsKzbbMTe+uMqtPRfWr/u+583YL5UF7GcYu6KkWp3wHf6zz0tbLVxyt55htyBQjYy
         zNYJB4CI6pMm4jwNQ/qmBjQD74zHiCiVdyXQVU/jH5a4CfM6TNYJcAaDKRF8wB4Qcai0
         m0iZAWegfcb/DVlAdCNCReadP2likELBN6EuUjf2VmKKFlF1bCDU8KtR8lEGBmTegaI1
         bXrqzmwcMKwEHQXUwYCw8BjgNa61BB9Jmc0OE4cARitiXXruqiD+BSwFUqrMQCG3OWZo
         vKPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1c909Pz8J3NKd+H82C27mQJFSyiCj/LEVJVRj79zpH4=;
        b=H6zT128iTs+hmXJxCvM0lxf0DbHnT00ClvfWLiFDgmQXgVhfIcNrgt9EEyOXRJDg/m
         T5quRAu/GZJ0IIJm+W0oDLXSbpIUom/8ZvpJn+fWFh98Jqkkqyjn5bNUqbBvGpoRfbEh
         TK1OEZw6/dnsMWJGdtc5PxpuHJhCa6kX+N8/KNkI/ZS9i30t/OmkIzDqCjBuSlSf2uVt
         0Tv6/gAaDs1zBcRFG+oPXxmMkrBnlHt3E2H8TetYYqisgv88rXt1gH573XuiJDObSnTO
         P2r0mVkzXm9Ldm8VBBw2E0jdq4//yWxnW+dyDq1Mzs8zK7nhKhZMoek1aEddtL+OKSlJ
         VNJg==
X-Gm-Message-State: AOAM532U4P0BstWYk2W/xVF6c4j9o4/JrZCYM2ChPLIXCFjXhVP5fZGE
	8l/9oqM56SFASypCNAnbeuYSuwT/9efAsQ==
X-Google-Smtp-Source: ABdhPJxNAbEQEigzqKr52huMUcvMNRT0FjCehIUjix6Olz0Tg7dhJrnrJP8uUcEQVubtsX66dYVc3w==
X-Received: by 2002:a63:d543:: with SMTP id v3mr18283341pgi.188.1605893397148;
        Fri, 20 Nov 2020 09:29:57 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::b756])
        by smtp.gmail.com with ESMTPSA id x61sm4855684pjj.4.2020.11.20.09.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 09:29:56 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 3/8] python3-sortedcontainers: Add recipe
Date: Fri, 20 Nov 2020 09:29:45 -0800
Message-Id: <20201120172950.1619754-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201120172950.1619754-1-raj.khem@gmail.com>
References: <20201120172950.1619754-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Used in some python package testing infrastructures

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-sortedcontainers_2.3.0.bb             | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-sortedcontainers_2.3.0.bb

diff --git a/meta/recipes-devtools/python/python3-sortedcontainers_2.3.0.bb b/meta/recipes-devtools/python/python3-sortedcontainers_2.3.0.bb
new file mode 100644
index 0000000000..6060c03723
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-sortedcontainers_2.3.0.bb
@@ -0,0 +1,9 @@
+SUMMARY = "Sorted Containers is an Apache2 licensed sorted collections library, written in pure-Python, and fast as C-extensions."
+HOMEPAGE = "http://www.grantjenks.com/docs/sortedcontainers/"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7c7c6a1a12ec816da16c1839137d53ae"
+
+inherit pypi setuptools3
+SRC_URI[sha256sum] = "59cc937650cf60d677c16775597c89a960658a09cf7c1a668f86e1e4464b10a1"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.29.2

