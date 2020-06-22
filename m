Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web12.5972.1592864166251037789
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2020 15:16:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=koa1/Ln2;
 spf=pass (domain: gmail.com, ip: 209.85.208.65, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f65.google.com with SMTP id b15so110318edy.7
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2020 15:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=LrjCPqbz9wOQgtR9nLVPSAmv1SN88BFCiMcKECIWicc=;
        b=koa1/Ln2BCQG4V+JjsyYlT6eOZEvO03oh7xEjfejggL8tE9EgTwTlDbNlHfynph667
         2QmJR+yXWHolBS6xCDR3VpQpz4KRM8EHalGGn4hlNRmKewn1sRt0x9651LBfgO76xaje
         i71jhvRk7o0tzHTAin417EUEEy3lZ6HX15ZEh3E8swumvsUZ6t0RtLkO12c0QD8SA0qT
         t5itmm13BNPqiaJUgGBJjC1QAn19PihxF6b4RuWuI8JnrvIIhcxMDi+QnJ5cvRWlTGPR
         iL4tWw8WREqCJhlxvyw2ZNW8E6nha2kNZIGoiVbbXb8MABfagURTPxc9FZSTyFFKnqPL
         6FKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LrjCPqbz9wOQgtR9nLVPSAmv1SN88BFCiMcKECIWicc=;
        b=rF5pIvV+0NKV3Z+dxZM0cP0VVGnI13OqrS1fz7VGn7wJ78yVlrOb/CI7Hd/tEPlCLw
         uSfL4qlxEcBe8zAnHr0qjFogXDdRQenS0KUz8+mBYulLJOr+AH4N89rJtBD33Jjd+rFB
         3ER2EtZ3O5p3y0q7FB2lUv3V2PqrTMsBNxMfnH9RwRcajD0aMWLokD0EivRlt1LGcj/G
         RxyxDF42D7b1FlIRHUwdB3jPEK4Qrigl7RQC8gzO4s/Isx9GF8kFMZKtk8mmXf7FBmRN
         NX+dy5nCEXJlU9d9/kR5Cv9G0kVS1OfJcNCUYjy7U/nPgfu09KMZYgfu+tHUpbWHrZfS
         BcVA==
X-Gm-Message-State: AOAM530pG7vi+Gfj/EVEGkh8GVjGZ+StHMAV9SPYb7Ey49WKBf5tq84a
	p/hGqK3d0sM4NMIeNuBIZaLv9n/Y
X-Google-Smtp-Source: ABdhPJzEbhd/EbFiEnFAZtrBF9KPmFyDHzQ2MmKw7+nrLPY5Dedayk8BDH9uc8eTxwhygEgyAihLaQ==
X-Received: by 2002:aa7:c38f:: with SMTP id k15mr19781345edq.342.1592864164655;
        Mon, 22 Jun 2020 15:16:04 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f481d60137a2e45bfed0e33.dip0.t-ipconnect.de. [2003:f0:7f48:1d60:137a:2e45:bfed:e33])
        by smtp.gmail.com with ESMTPSA id n16sm3703803ejo.54.2020.06.22.15.16.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 15:16:04 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] desktop-file-utils: upgrade 0.24 -> 0.26
Date: Tue, 23 Jun 2020 00:15:49 +0200
Message-Id: <20200622221551.1530869-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200622221551.1530869-1-schnitzeltony@gmail.com>
References: <20200622221551.1530869-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...{desktop-file-utils_0.24.bb => desktop-file-utils_0.26.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/desktop-file-utils/{desktop-file-utils_0.24.bb => desktop-file-utils_0.26.bb} (81%)

diff --git a/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.24.bb b/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb
similarity index 81%
rename from meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.24.bb
rename to meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb
index aecba07235..90c265aed9 100644
--- a/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.24.bb
+++ b/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://src/validator.c;beginline=4;endline=27;md5=281e1114ee6c486a1a0a4295986b9416"
 
 SRC_URI = "http://freedesktop.org/software/${BPN}/releases/${BP}.tar.xz"
-SRC_URI[md5sum] = "9364b82e14cfcad881161aa7ea5257ae"
-SRC_URI[sha256sum] = "a1de5da60cbdbe91e5c9c10ac9afee6c3deb019e0cee5fdb9a99dddc245f83d9"
+SRC_URI[md5sum] = "29739e005f5887cf41639b8450f3c23f"
+SRC_URI[sha256sum] = "b26dbde79ea72c8c84fb7f9d870ffd857381d049a86d25e0038c4cef4c747309"
 
 DEPENDS = "glib-2.0"
 
-- 
2.26.2

