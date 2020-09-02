Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web12.967.1599081258671070732
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2020 14:14:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VrdHoG1/;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id j11so767226ejk.0
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2020 14:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dGI/d7ub97xCCt1v0No0bLmYRPl6+0soWj4P04WCphw=;
        b=VrdHoG1/CQpadMR4I4SvuPX0qcY24MqYgn5+T+ZOpoWw3TatjUcyy33QzkI8WPjdjD
         izyKvKYd3g7daqgNQzgNAh/0mXoTiAtFPgMOKTbq8ehgR3z1W2ne6Ps5qOtWc06cOLAB
         tYpQrtsQggXtr4ef2rXpeLEhb/6WILq+jvzSjCxTO1H3v4l1W6fTod0aQhH18t0WsH8I
         AxoWDJ6bQWu3VtlHgYszOP4j6fviN30bjXVSkGEThGdaErbWtJKYl6HETpKKGFBMcfad
         SyUA7ZNftnjcCILLMgxOsGmH4YYdJmXXcbtRgSIpkQ2UfLstuxHPmxnsJNRpqRSKftMo
         tYcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dGI/d7ub97xCCt1v0No0bLmYRPl6+0soWj4P04WCphw=;
        b=hQTr+87J8+Pp35t3Cmp7MPTZiwcb7XsLIKr1QBB82YJT4Iu9xGmATmHCbgiEAw47IR
         Jmdr0fXuB9X0SEGBaRo/rj7jt5/zMSxtYAvT8OHYgU3B33IpVzoW1Ir1rveAG2ZBHBY0
         SIcvv2d7k6qluGu/bRrjnBiI3AipBIkisoRAf6hfn950PKu8Z2anGzgLyyJMzAGv/nMu
         6QtAwBF909eRWUduOa6432sx3ZRHd8uOijqhvbTiS9CoGx+BlC10I9sVV1Y8/EV7Rd3r
         GCU/lAng71OYXVJnX6ztKcnrfv7dKzYigleVTNdYFwx7k17c+JHVzlWh6ZgZB8DquGo6
         SNPA==
X-Gm-Message-State: AOAM5313HIbDAMCvkGbUMRLgQB+Mh30lI841yxenAkZylYsLw2bBdzgc
	jCD6Osr1/UkuG2OLG2NcWZMA/MBIgZs=
X-Google-Smtp-Source: ABdhPJyT7FKWo/I+QocDvaOC7BP8b5LVvpzInH9Ni2bIV65PLqQ+UkK7I6/S1iArRBDhQBnyWRH4rA==
X-Received: by 2002:a17:906:28c4:: with SMTP id p4mr17104ejd.345.1599081256953;
        Wed, 02 Sep 2020 14:14:16 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:b652:c378:b428:fdf])
        by smtp.gmail.com with ESMTPSA id ch29sm631607edb.74.2020.09.02.14.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 14:14:16 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 23/23] mesa: update 20.1.5 -> 20.1.6
Date: Wed,  2 Sep 2020 23:13:30 +0200
Message-Id: <20200902211330.4853-23-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200902211330.4853-1-alex.kanavin@gmail.com>
References: <20200902211330.4853-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../mesa/{mesa-gl_20.1.5.bb => mesa-gl_20.1.6.bb}               | 0
 meta/recipes-graphics/mesa/mesa.inc                             | 2 +-
 meta/recipes-graphics/mesa/{mesa_20.1.5.bb => mesa_20.1.6.bb}   | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_20.1.5.bb => mesa-gl_20.1.6.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_20.1.5.bb => mesa_20.1.6.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_20.1.5.bb b/meta/recipes-graphics/mesa/mesa-gl_20.1.6.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_20.1.5.bb
rename to meta/recipes-graphics/mesa/mesa-gl_20.1.6.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 547a3a0b4f..af2a5c0f9b 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -23,7 +23,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
            "
 
-SRC_URI[sha256sum] = "fac1861e6e0bf1aec893f8d86dbfb9d8a0f426ff06b05256df10e3ad7e02c69b"
+SRC_URI[sha256sum] = "23bed40114b03ad640c95bfe72cc879ed2f941d0d481b77b5204a1fc567fa93c"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-graphics/mesa/mesa_20.1.5.bb b/meta/recipes-graphics/mesa/mesa_20.1.6.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_20.1.5.bb
rename to meta/recipes-graphics/mesa/mesa_20.1.6.bb
-- 
2.28.0

