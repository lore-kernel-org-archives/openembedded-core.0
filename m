Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web08.7777.1624360901566163607
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jun 2021 04:21:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QiRHC8uf;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id m14so6434867edp.9
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Jun 2021 04:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zEo5aw7n/xk65zhnqEHbEaH6zBdLl/WIspu9Yoqzn4E=;
        b=QiRHC8uf0aswaixY7qa/wEiXfDo6eNf6L0sKUFNEB6O9SC22axHX6cNAy7n5FR0hIx
         rDz5uJMU1M9XuhYIwq085oF/bffW65jHSvfLs7FWYdkIrgdFtRACQ1XOXtmY+tkDL9xY
         Em2HLWdmM/CHFrMC/zsgIIWOZsO1+NwrfJihhgH4pG5RCwz9y+SvZhs7r+XJwt3HgXhs
         D3Zkj12GAsBIpYH8pBlMNiy4udBOQY5Vg4bj7LEosxZq7fpHH6Yd1Hv+j9D/z64VJO+d
         iO0OA1zJ9KmNRydw7NHVe5yg5LDd+QzHeNJDILYlLajISk3fPmeVakML8fsvr6S4DYi6
         pHNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zEo5aw7n/xk65zhnqEHbEaH6zBdLl/WIspu9Yoqzn4E=;
        b=IHEkWuTM3ZnjjiCxxUiWmr9h+6bjFPDHoBvlVqOukTL4U4c1OekHQhxmuAOyPwEOAs
         6T/kY74MV+Koa2gp5V0ktvmO5ImNm3cWig/PufFoQjStDcKnWrt83+goNKFcrgW37sOl
         nr7m2Jkq/RzwjC7OLod7Tv906IIdtKoN1gIsbTXHl66p+eoCcCdO6EJPuhH8Dcg+ouwD
         KBzuo6A8xl7YAr5w4tbJrWfktdN8YNP80UToii+ZylCGoiXWQMtVVvDCHCgsDtKaQqkD
         o/oMRFXI0FPFtH7NOOC1h/Opgrk7HQn+l7pRibhjiBX1cepwEOfIQ8nuwpPq3u+k9Q96
         2nqw==
X-Gm-Message-State: AOAM533E6riIVqIpDCVu3ZZCEFDZ7KvGwb1AP2yu/GL3ybvnf/R6wPte
	P39mKaKnlnMvADzPwcFNY6rtHEuzsD4IuQ==
X-Google-Smtp-Source: ABdhPJxJPN+CdiImmZRzUygTx32S0OMt3K2oqDK+yPe5HBftY++1tBm8mkcB1dZWy32YT6wuFH0FMA==
X-Received: by 2002:a05:6402:31a9:: with SMTP id dj9mr4230970edb.164.1624360900228;
        Tue, 22 Jun 2021 04:21:40 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id n2sm11987416edi.32.2021.06.22.04.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 04:21:39 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 15/19] python3-git: upgrade 3.1.17 -> 3.1.18
Date: Tue, 22 Jun 2021 13:21:22 +0200
Message-Id: <20210622112126.2026646-15-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210622112126.2026646-1-alex.kanavin@gmail.com>
References: <20210622112126.2026646-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../python/{python3-git_3.1.17.bb => python3-git_3.1.18.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-git_3.1.17.bb => python3-git_3.1.18.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-git_3.1.17.bb b/meta/recipes-devtools/python/python3-git_3.1.18.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-git_3.1.17.bb
rename to meta/recipes-devtools/python/python3-git_3.1.18.bb
index 009cac6609..955418c0e4 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.17.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.18.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "GitPython"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "ee24bdc93dce357630764db659edaf6b8d664d4ff5447ccfeedd2dc5c253f41e"
+SRC_URI[sha256sum] = "b838a895977b45ab6f0cc926a9045c8d1c44e2b653c1fcc39fe91f42c6e8f05b"
 
 DEPENDS += " ${PYTHON_PN}-gitdb"
 
-- 
2.31.1

