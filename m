Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.7204.1620485319901938948
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 May 2021 07:48:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=otdPMfBo;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id b15so505044plh.10
        for <openembedded-core@lists.openembedded.org>; Sat, 08 May 2021 07:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=luPK8SYrrUnALjL7hNC+p8IILQ5eaPSuEtsp/FCUzCA=;
        b=otdPMfBoxnU+cyzpFazYJC2Vg4+HGT4n3nPxp52iwUt16BIwRgZd403WT05TFoRhWN
         cYs/0zQyBnq3OkCnyvsFQDprw7n4Q7OP5B06nl9kLzwob7CKdGBH8JIQ4Cz+WCwNSgNL
         gDfhTVqJ+ho4Skr933l/7fDa29r5KZSlDjRibWWIoMnexDD/Shn15BasYEdTRBMfz8xY
         K2T9lYEj4jy6UMfKAGIDFoI7Mp5Nupr1JSzgUnrUbyK4P6ZY8VNKodTxyswku5HReC0D
         PoR9h7kft3jsdXWVGGIilLgIRD5VtHJSNtB6+o/l70w7yuoGo1BCcBrPX4R39W0vVWYG
         u8mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=luPK8SYrrUnALjL7hNC+p8IILQ5eaPSuEtsp/FCUzCA=;
        b=FBDsPn4MiUryUzSYNDvV74zrjqeZcIIZieB3Wt1y1sW/JOCugeXpYMOZpjge4b/b7C
         ymnz+G/z93wAskhxyiOYy/08we6xsS70kJOVQIgEWpZ81nIEoXOHvpvwQBPnqG3jFvuN
         tzDg+tOWKsWzT66hMauTmrgRK+kIBNvEpaAp+wv88CSEthgBrhzRQWyhaU4j489fLxrK
         VSdQyDZr0L14jeD7FVHijMaW3PRfZHI/N2K4HTG9Bp7lbzCMn/OU2l6/43grdtGSMrSE
         TxRNBwf7/b6KfK8bXcXWDqKwZBFtnNHhmQA35fgcprO729PwsSym4YCGNc0RUja8VeXq
         zHhg==
X-Gm-Message-State: AOAM530nrcTYj5uUDl5HXXD1bSb23cUPl25qCuveyFbSX7X62i7oOE/W
	DofUBzKae2+y8u5NkomyZ76F4pLC7148WQ==
X-Google-Smtp-Source: ABdhPJye9B8dmBdVX/rDIFhb/72DE/dBRf8HySGENHAF2C1OyqPPP9gWEsIaxSsWjCvjhLfpBVX9Vw==
X-Received: by 2002:a17:90b:310c:: with SMTP id gc12mr16614297pjb.217.1620485318981;
        Sat, 08 May 2021 07:48:38 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::308d])
        by smtp.gmail.com with ESMTPSA id b21sm6928446pfl.82.2021.05.08.07.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 May 2021 07:48:38 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] python3-markdown: Upgrade to 3.3.4
Date: Sat,  8 May 2021 07:48:36 -0700
Message-Id: <20210508144836.2045090-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

meta-python is carrying 3.3.4, once we upgrade it in core
we can safely drop it from meta-python, helps with layer-compatibility
checks

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{python3-markdown_3.3.3.bb => python3-markdown_3.3.4.bb}   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-markdown_3.3.3.bb => python3-markdown_3.3.4.bb} (71%)

diff --git a/meta/recipes-devtools/python/python3-markdown_3.3.3.bb b/meta/recipes-devtools/python/python3-markdown_3.3.4.bb
similarity index 71%
rename from meta/recipes-devtools/python/python3-markdown_3.3.3.bb
rename to meta/recipes-devtools/python/python3-markdown_3.3.4.bb
index c456f05541..47cccbe5bd 100644
--- a/meta/recipes-devtools/python/python3-markdown_3.3.3.bb
+++ b/meta/recipes-devtools/python/python3-markdown_3.3.4.bb
@@ -6,8 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=745aaad0c69c60039e638bff9ffc59ed"
 inherit pypi setuptools3
 
 PYPI_PACKAGE = "Markdown"
-SRC_URI[md5sum] = "034e3bccfde211d44b4a7a69cb290ba0"
-SRC_URI[sha256sum] = "5d9f2b5ca24bc4c7a390d22323ca4bad200368612b5aaa7796babf971d2b2f18"
+SRC_URI[sha256sum] = "31b5b491868dcc87d6c24b7e3d19a0d730d59d3e46f4eea6430a321bed387a49"
 
 BBCLASSEXTEND = "native"
 
-- 
2.31.1

