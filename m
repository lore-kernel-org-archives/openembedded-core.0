Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.2798.1593155955034129810
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2020 00:19:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Oi4kyRIj;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id e15so6137508edr.2
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2020 00:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=37N83w78kgFZPjL7tNmwJRn37NVL5qGBPLHG5612aLw=;
        b=Oi4kyRIj0br2eQ2nqAOy4jKD9zgn/Dkcv3twH6vujm45luoVKJGnwlyMD6OGfb557C
         /lj7CjCvfrb/b/6N+MxA+B6gahRDITdKMVF8LW3bdnAp63ruT49iGDIzn9a1xFJ6b+eo
         6GMvQw6YRZP1fwXb/xtWduPGU0SPhJuup+ElD/0knyW1nSxaa76DiW+4qVShCPyRROZ+
         M8LZ8JpmjVlA+9li3Rx69degNbGTTlqCxHJQ3EyN4R17TjsnsLyhebnYqTjhlC1Xjylm
         noTH7c1Gq5rLHjLIw0LSmX7K+1GcVUcc6IYX7PVzysbc0ZVQCs1Ujac7ZTV6A8RduRma
         n61Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=37N83w78kgFZPjL7tNmwJRn37NVL5qGBPLHG5612aLw=;
        b=Br4+8kqlafBwr2g9iXk9NOLQ7gmuZaRt3xb+uHvx9uH38Q+MqPQgtDaCzBx5K8r6ez
         LzbacAZKzS4STnElNv3sR9hbtQ45JesBohEMQMQ2/SfMYMX2hZFX7ieYilQtdoteIQ0U
         2XViZZ53bVi/Khjs1n67q2dhSFpDdlenysVRBL1WLKCRFBzJShhtpXGBvSlz3WIRM8wD
         FQL9Y/yUcQOIk/nZvRUgvPPC6lZ1ATR2dY6BqjK7x/1+v1T6KwT5lpn0GaELYD+k3JlD
         NKig0yrzxthEkma+r7Fho8qWPcW9obcBgzC+2F0tTZGTdzlXRW7PCe0U2IhbEve2EX6j
         S7wA==
X-Gm-Message-State: AOAM533X6sxAB2FRCymxQSwuitO2UE4Znd7xAm5+bPHxjVsjDr++9ACp
	En6WHLr3dR1DJ0L7aCdaD2iXV6Dn6fs=
X-Google-Smtp-Source: ABdhPJyqKbCdQ0ykvbKFeDQcCOTZdVJtqMNwhJoAvJdUhHkqZ503dWtdEocRkac8kTT1Op9HXbp4dw==
X-Received: by 2002:a50:a68f:: with SMTP id e15mr2006847edc.285.1593155953367;
        Fri, 26 Jun 2020 00:19:13 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:b652:c378:b428:fdf])
        by smtp.gmail.com with ESMTPSA id p4sm20826194edj.64.2020.06.26.00.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 00:19:12 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 12/30] python3-cython: upgrade 0.29.19 -> 0.29.20
Date: Fri, 26 Jun 2020 09:18:26 +0200
Message-Id: <20200626071844.29134-12-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200626071844.29134-1-alex.kanavin@gmail.com>
References: <20200626071844.29134-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/python/python-cython.inc                  | 2 +-
 .../{python3-cython_0.29.19.bb => python3-cython_0.29.20.bb}    | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-cython_0.29.19.bb => python3-cython_0.29.20.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-cython.inc b/meta/recipes-devtools/python/python-cython.inc
index eee567ed2c..a0cd2a5fb4 100644
--- a/meta/recipes-devtools/python/python-cython.inc
+++ b/meta/recipes-devtools/python/python-cython.inc
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
 PYPI_PACKAGE = "Cython"
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[sha256sum] = "97f98a7dc0d58ea833dc1f8f8b3ce07adf4c0f030d1886c5399a2135ed415258"
+SRC_URI[sha256sum] = "22d91af5fc2253f717a1b80b8bb45acb655f643611983fd6f782b9423f8171c7"
 UPSTREAM_CHECK_REGEX = "Cython-(?P<pver>.*)\.tar"
 
 inherit pypi
diff --git a/meta/recipes-devtools/python/python3-cython_0.29.19.bb b/meta/recipes-devtools/python/python3-cython_0.29.20.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-cython_0.29.19.bb
rename to meta/recipes-devtools/python/python3-cython_0.29.20.bb
-- 
2.27.0

