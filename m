Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web12.3373.1615451454229716060
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Mar 2021 00:30:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GHIFygxC;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id q204so13915913pfq.10
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Mar 2021 00:30:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3C2cM/z+TMWiCTDtmvn1pd47Xy+PjqyrWRU7IOluzN8=;
        b=GHIFygxC3zh++tAVyVLDCrYD3twC7HvfYMa1wlxqxaovrSEoJH3D+2cSqstT11ajZu
         tpLERlvcpAXSfkGWCH5yl1J6T2UrOGkvQK7+zLfhvn0t+6f0mL6aXUrFK1FZg3C1oW8A
         5vrQssQoEicZfHC6+20TgbdBHMvz4grvh8RPTWMxFXGzKtTQ3Y3f7vgsTpWs9dzg6Y3i
         7S4fivnJai4u4YJ46+DmiRHXNMsB3OalY39+RuI8WcEKthvfzQZC0Sy/XuOpDvdtV+sI
         KHZIkxpB2IBvTtcWPfFZsRJPl/2LdkzDEyU5vzYCjMNScPcMta+CiSEtA3h+CYiaow8Q
         EVyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3C2cM/z+TMWiCTDtmvn1pd47Xy+PjqyrWRU7IOluzN8=;
        b=mJR5Esu9RhFR3xa7o73mLXfojFQMdnPD5PWkpY7y7ShPsakO4zfrGU90ZvuZH/Y1u2
         6LwnWhd2Vr1tpMtCl4N3Wly2PxuLF3Y0rr7Wi2ooa9hv1/vsZBjFcK8i01xlZAW63Pd1
         JcS6EqVcH9LDojVTaMeFEYn8BxrNxzlcgxZd8PCFJshYXHyymLRqI7jzTdQfgQ7kTS63
         ehbkEcBjvd8KWgiwa8vW1zKbHJWsn3Bq4qrMC5YB3IJaAHc7cN7n3Zyll2EypCwfUlEI
         /9gpU+L6ttrhTIMeywSsvwWr7SwPVyG316PknbslZH5gWt6fFjbTqFuYPJ+nuJEKHfVf
         506A==
X-Gm-Message-State: AOAM533VhfMXvy8Ebzp+M81q/55Ny7jZTxtM5JytvnBaTkNOGk9FttW2
	Dv9sHkYB7eDhwDTI7UxNlNyteW5HQ6f1zQ==
X-Google-Smtp-Source: ABdhPJw0r5oJ9K/Sj17w2lsRo3gYemrzCkLlucHeCpH8C9449bR2I2Dfr59UlsXiH7LTj7PMaoGxBg==
X-Received: by 2002:a63:f808:: with SMTP id n8mr6348003pgh.115.1615451453349;
        Thu, 11 Mar 2021 00:30:53 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::fde0])
        by smtp.gmail.com with ESMTPSA id q205sm1791444pfc.126.2021.03.11.00.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 00:30:53 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] python3-setuptools: Upgrade 54.1.0 -> 54.1.1
Date: Thu, 11 Mar 2021 00:30:45 -0800
Message-Id: <20210311083045.1923305-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes [1]
[1] https://github.com/pypa/setuptools/commit/d2ae3cd2cfc66c300bc6661ca33f0ba1f651fd56

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ython3-setuptools_54.1.0.bb => python3-setuptools_54.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-setuptools_54.1.0.bb => python3-setuptools_54.1.1.bb} (94%)

diff --git a/meta/recipes-devtools/python/python3-setuptools_54.1.0.bb b/meta/recipes-devtools/python/python3-setuptools_54.1.1.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-setuptools_54.1.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_54.1.1.bb
index 153258d3ec..74264a3814 100644
--- a/meta/recipes-devtools/python/python3-setuptools_54.1.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_54.1.1.bb
@@ -10,7 +10,7 @@ SRC_URI_append_class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 
 SRC_URI += "file://0001-change-shebang-to-python3.patch"
 
-SRC_URI[sha256sum] = "36bc07925c77dd6e30c64c91c2d080212a46910aa79073990c11d4c48a006240"
+SRC_URI[sha256sum] = "1ce82798848a978696465866bb3aaab356003c42d6143e1111fcf069ac838274"
 
 DEPENDS += "${PYTHON_PN}"
 
-- 
2.30.2

