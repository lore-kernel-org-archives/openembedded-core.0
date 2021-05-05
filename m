Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web12.9841.1620227973724826111
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 08:19:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nqof2PiS;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id i24so2485271edy.8
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 08:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ntXeVaGGMWHYOJMAoVB3Hd6nV/flr/CWumxvpTcTlvo=;
        b=nqof2PiSBf51gb+6kXw+Mw1hZuuZWx5aPUDqUm33ZO5ajVVx1c2Jz2+Bm1LMk6/tUJ
         mTFaKUjCAGeI3MZGQgZoKXCLogtWsKdxQH/OkoBPFGZI2sR/hOWOIou/P+cgAIlLcvNV
         ETGJb42e6J2Y3gDbcH06CGnt/SrIp8RbC2kBGcs3rPyegC01WdC+mBqGffnHf5+0QKJ6
         PB6yv+WhS5Y5mP80Cpq26F21FL4Aj73s3qguTwz6yW0OZBI0Qax+QoObGh24+R/b34cd
         sumVcNOyLtNd7B19ck1seyqsQJlxZS5PyJD6CO23M6JiirCdOEwhr+sXncpXTRkSVHg5
         qLyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ntXeVaGGMWHYOJMAoVB3Hd6nV/flr/CWumxvpTcTlvo=;
        b=YjoWD2+HV1etrYaJLqvQ+yG5T057r+lXY1fP/G2WO1ZG009HKMijQ3qrQOxYefOeKu
         gEbZsFln0tOg2wHnFYT3xPrnv2D5WqqDrKzPbDQgaQXJcMUyftTVCJwjHyynQgy0DtIl
         7lagohuK1i13R/ijG5fRbXyCHdPS8gYZKsBQ513/2VVxefgCXi4KW3cz1hRiPRtPO/d2
         hrMdaJ3apjatD/XTiC0JYeh4yGKGOswulZfpqX9nanGN81+MKIiEJD8JSFf0jgeM6k4R
         +HbW6hiafdRscbBkrBfx7u02jwpsOPxB2wSc4K+kbOMIzxrGc9od9n4Z1MDzlSB6gzC8
         332g==
X-Gm-Message-State: AOAM532BpEONzD0RcrIZeFLOD0ooRJd3N/P2GZthH3YkvnDKEkzUtQo9
	35ylMe2biLXDDtk5DbS5YHaRSFcW/a1r8Q==
X-Google-Smtp-Source: ABdhPJwJuQUBalXJrKrNxQwMbtoyDXBfpdEUzaoVvhqJJsMomijGvr+h8RY4P+QE+pyYI746OsWqiA==
X-Received: by 2002:aa7:cf86:: with SMTP id z6mr32756556edx.120.1620227972348;
        Wed, 05 May 2021 08:19:32 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id y11sm3018479ejj.55.2021.05.05.08.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 08:19:31 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 46/61] python3-hypothesis: upgrade 6.2.0 -> 6.9.1
Date: Wed,  5 May 2021 17:18:35 +0200
Message-Id: <20210505151850.660512-46-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505151850.660512-1-alex.kanavin@gmail.com>
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...{python3-hypothesis_6.2.0.bb => python3-hypothesis_6.9.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.2.0.bb => python3-hypothesis_6.9.1.bb} (81%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.2.0.bb b/meta/recipes-devtools/python/python3-hypothesis_6.9.1.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-hypothesis_6.2.0.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.9.1.bb
index be9418386f..4532998bdc 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.2.0.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.9.1.bb
@@ -7,7 +7,7 @@ PYPI_PACKAGE = "hypothesis"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "c16fbde26b65c98a2464c48209b066c2f6dab5e8e38acd9d959021eb8d58b6c0"
+SRC_URI[sha256sum] = "5e25a0be23b1ff81ecf07e87d82e2e39a79c83c1458178af202ffe4b0183bcca"
 
 RDEPENDS_${PN} += "python3-attrs python3-core python3-sortedcontainers"
 
-- 
2.31.1

