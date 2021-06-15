Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.6424.1623744783563084933
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jun 2021 01:13:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=S9V7Pvvj;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id b11so49894766edy.4
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Jun 2021 01:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MdQczHd556rcwhx6HUsj5SDriTsdmVzgTcqeol6xoOw=;
        b=S9V7Pvvjd3rw0NNaOnA0M+CQc5Rv0AAT1U7aujdMQV4GNmOvYM0uD15y6s1/ez0hyV
         bvJjcUZrUT8q18fpBXyi95JNqPJgqz5gpjPkJQB9VzsRok75GNGIBfUDMgXHs6pxkKxm
         QSbcwKaqDJCX/YRKk4wbcd3oSFMUa02RoR+ZqWZStaKEl2EhX2m9AByoPzWpWlp0Ondg
         onfx3CvzlQ8xB9EYERaLuaMiwUbsSZ8/szH6w0KXkqbNOtGqdQWdbEcyGUGA8mXxrFiV
         Iub4W3MUG4Dir0xZ3FwTxz++Xmp+qpYTSclmZAife/HKqgxeEZMz60LAdfljhyTRvypY
         aRYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MdQczHd556rcwhx6HUsj5SDriTsdmVzgTcqeol6xoOw=;
        b=Fp3HU0+6QsBYG90aJM2srPuL6gY5eSNolzjRRwIitw8bp6v8+phrTDF5fYNrMgXnvF
         fjp67i4rpg1N3bkdUVbQMcymWm7wyC8lXh5mXw7dBByMFwfbvlhdB0M/d4SeyMTeFh27
         kNqJIiYt1ybYwapDGJWCx2YdLqn9iC2qIjF0jg/MUTfDSzwc64WdcJ8mDdl2CEKfhN2d
         YI9H2VGrcRGT7le6JMEXPQzWnMt3BHX4DZ8xh/PnSn1Huw1mRMHIJD2A6p9at67B6QBh
         n5spZRI/OhQwak0S5cnj//sg9KC74sNrbjtzbjyJIZCl1+7neV7gj3zlb3XwI9jIBfYE
         BL0Q==
X-Gm-Message-State: AOAM531yVWQ2edEzz/MD+6R/2OnFHedXQEntJV/sQqtm7uWTBOdXJIaZ
	XSgRO+2X81sk1IA6re8pq+hVmn/1UanEkA==
X-Google-Smtp-Source: ABdhPJyMmyxJkxwtAPEh+Jg8ZzWs3ieClgnFi6yM+ezgWAMLErq2dRABTfMyiZW6/EqccH2XJgHaZw==
X-Received: by 2002:a50:8dc6:: with SMTP id s6mr21923487edh.50.1623744782221;
        Tue, 15 Jun 2021 01:13:02 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id d2sm9118602ejo.13.2021.06.15.01.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 01:13:01 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 25/31] python3-hypothesis: upgrade 6.13.14 -> 6.14.0
Date: Tue, 15 Jun 2021 10:12:34 +0200
Message-Id: <20210615081240.1734087-25-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615081240.1734087-1-alex.kanavin@gmail.com>
References: <20210615081240.1734087-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...thon3-hypothesis_6.13.14.bb => python3-hypothesis_6.14.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.13.14.bb => python3-hypothesis_6.14.0.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.13.14.bb b/meta/recipes-devtools/python/python3-hypothesis_6.14.0.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-hypothesis_6.13.14.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.14.0.bb
index 150dc8a5d6..16afd699e6 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.13.14.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.14.0.bb
@@ -7,7 +7,7 @@ PYPI_PACKAGE = "hypothesis"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "36ef2d58f600be2973f694f45a55a5502de705d7594f9cf841276aec9082c414"
+SRC_URI[sha256sum] = "9bdee01ae260329b16117e9b0229a839b4a77747a985922653f595bd2a6a541a"
 
 RDEPENDS_${PN} += "python3-attrs python3-core python3-sortedcontainers python3-unittest"
 
-- 
2.31.1

