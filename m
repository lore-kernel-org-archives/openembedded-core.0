Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web12.8236.1630503950133823940
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Sep 2021 06:45:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FeBmxGgW;
 spf=pass (domain: gmail.com, ip: 209.85.167.177, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f177.google.com with SMTP id s20so3801877oiw.3
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Sep 2021 06:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3POJ+Y/zgsP1435MI/hpVlmTBWDzmRfHI7+1zEo46fY=;
        b=FeBmxGgW8q5mxI7Rpg+LlV28icTdQKlkFmkHauwJHmNjz0zQDC9i81xsRmun52m1dj
         NZA19hWvh4UJnaxDItzsvxKpo4qDcS0TrqqXAUwtLsaPfZj3cmK251gWJBX0YCckrzGD
         4lk0Yad3DUX3moJUiH7SPHlM9ndSzGyCWPZGPRbFU5//8DHR7u4EFcNv7huXD8f7VOac
         pkTPGuBTH7y1rrXLz6j8QbaPr9X2pU4hlZQVs1WT83E8lQO6xN2HA3JWv8WIxvrld3T0
         oQjT06FNYfpL9Fkv+3zTeFPi1Bb0ZOZjUZyhlQlywDFrVGOsxfnPgHX4EUn/HmpG1zAy
         iwPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3POJ+Y/zgsP1435MI/hpVlmTBWDzmRfHI7+1zEo46fY=;
        b=BNkWgVD1tOYtCpPmFqsvTTl8tMdhuj0/OlDwFNHI1L5A6aLSpRyPW470rJb30yu8Km
         UErdHQApJtxhxiA9vgcvWbuva1u7KyQrFQwpUYK9RqRkS2fW3Nj6QqnOTpj2MjRwByNb
         vnX8w2bmfJLJW2i00pG6t2gdNjbSgfzxm83VvExaosUFfgD2oED6SsiXkGN+UfIDs8es
         RtnXMEWOgE84iCiZVa+SAZFbn+LQc9TyVJaU/0uuuWmMCwajGnR+nnlI0jwT5TopC3K7
         3zfAbvSA3ybyH9WLszGdirA6+dW6BajIFVziHBkFaq9BLuVB1MoVaZev+0E68u8Dp9d0
         UkGQ==
X-Gm-Message-State: AOAM530fyObZzuUGBTs+9frttfQLZ8g4oIXYCpKomZzfF0aNMV6zpPEp
	Vkm1q6o4mnPNXyRlRVODV7WdA9gH+xI=
X-Google-Smtp-Source: ABdhPJzi4mPzaZY7PsGLbiKQm+zePkzq4ggcEwIwxZEkE6JWKzUdSha0jGApCHSPcYolUuFqVWXr+Q==
X-Received: by 2002:a05:6808:8d5:: with SMTP id k21mr7555467oij.74.1630503949155;
        Wed, 01 Sep 2021 06:45:49 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id c75sm4283772oob.47.2021.09.01.06.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 06:45:48 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com,
	saul.wold@windriver.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 31/31] swig: Use specific BSD license variant
Date: Wed,  1 Sep 2021 08:45:10 -0500
Message-Id: <20210901134510.29561-32-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210901134510.29561-1-JPEWhacker@gmail.com>
References: <20210901134510.29561-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make the license more accurate by specifying the specific variant of BSD
license instead of the generic one. This helps with SPDX license
attribution as "BSD" is not a valid SPDX license.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-devtools/swig/swig.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/swig/swig.inc b/meta/recipes-devtools/swig/swig.inc
index eb8d723158..e8562a91bb 100644
--- a/meta/recipes-devtools/swig/swig.inc
+++ b/meta/recipes-devtools/swig/swig.inc
@@ -3,7 +3,7 @@ DESCRIPTION = "SWIG is a compiler that makes it easy to integrate C and C++ \
 code with other languages including Perl, Tcl, Ruby, Python, Java, Guile, \
 Mzscheme, Chicken, OCaml, Pike, and C#."
 HOMEPAGE = "http://swig.sourceforge.net/"
-LICENSE = "BSD & GPLv3"
+LICENSE = "BSD-3-Clause & GPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e7807a6282784a7dde4c846626b08fc6 \
                     file://LICENSE-GPL;md5=d32239bcb673463ab874e80d47fae504 \
                     file://LICENSE-UNIVERSITIES;md5=8ce9dcc8f7c994de4a408b205c72ba08"
-- 
2.32.0

