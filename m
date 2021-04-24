Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web12.6799.1619272314327394296
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Apr 2021 06:51:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=S8XQb8t3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id s7so51100467wru.6
        for <openembedded-core@lists.openembedded.org>; Sat, 24 Apr 2021 06:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=f2yfpChtGKaK2zOfSMbwsbZCpaAe2k2r0LeM6psFrlA=;
        b=S8XQb8t34QRYOY8R7Yn9fz9I8BE7AYrKD2v8H38Jg+fGZa72G1MCFwo6y7pGiavxDZ
         1EbSshKomaYroCvv5oizTmTzLhnduHq2NBS6a0waHBVOTto3Fhr5avLagKQvEIy0FWUr
         eW9IwJex2AJE7jD+6D8PZ8/uZalSAhlo/+WnI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=f2yfpChtGKaK2zOfSMbwsbZCpaAe2k2r0LeM6psFrlA=;
        b=WixDRde/XRI4j3xd6ZfU1jwHsWCHyVceanSkzFOCz2UJ71Pl75sw50d5X/TvjmAx/z
         549+N6q9Un3NR9Gust+YB5EZlKzADIZ9TdgcSQ18PeATeVXkTVk+7QS65Z+qeABBqwJ+
         WuEXlM/xZcmS4/TBUyZ4CcA0uxG4tBAQOJMFwAyoy1MO+88RSqGh9b3InIk10z6tac37
         gF49eMcDPmMC6XXeywKQTmZ6ev7eKj4VZ1z0SaGH5uWHIeO6cf0v5YkR23M9JethgYOp
         ivU1FoE0bnDx8ukd8btsJ3vIrOXSUz5huHcKdhVSJgXqNoCYYzGhvfX9Cq4kQNRDqPzG
         6Juw==
X-Gm-Message-State: AOAM532Qk3rr0sBY3dw4AF+OBbmRyblewNmNs9IqlL5rRXRxfYkDGELA
	NaFxrXZlG79ayOEkxnIKDZH751W+62lCSQ==
X-Google-Smtp-Source: ABdhPJxbKopulGKj8dQmwUbZnccCbt5Xr6flMXkZs9uoWDHr4sTvMMFrVjTEwOIrHukz1inQj/RDjg==
X-Received: by 2002:a5d:6c6e:: with SMTP id r14mr11015894wrz.403.1619272312926;
        Sat, 24 Apr 2021 06:51:52 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:5c62:6d9d:139d:d68c])
        by smtp.gmail.com with ESMTPSA id t184sm13997146wmf.26.2021.04.24.06.51.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 06:51:52 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] pyyaml: Add missing HOMEPAGE
Date: Sat, 24 Apr 2021 14:51:52 +0100
Message-Id: <20210424135152.1645643-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a HOMEPAGE to the new recipe to avoid sanity test failures.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/python/python3-pyyaml_5.4.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-pyyaml_5.4.1.bb b/meta/recipes-devtools/python/python3-pyyaml_5.4.1.bb
index c3025fdc662..dce1ad57d3f 100644
--- a/meta/recipes-devtools/python/python3-pyyaml_5.4.1.bb
+++ b/meta/recipes-devtools/python/python3-pyyaml_5.4.1.bb
@@ -1,5 +1,6 @@
 SUMMARY = "Python support for YAML"
 DEPENDS += "libyaml ${PYTHON_PN}-cython-native"
+HOMEPAGE = "https://pyyaml.org/"
 
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6d8242660a8371add5fe547adf083079"
-- 
2.30.2

