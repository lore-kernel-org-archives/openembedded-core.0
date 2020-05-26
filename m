Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web12.46504.1590480767675593543
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2020 01:12:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@googlemail.com header.s=20161025 header.b=XlXgBbvi;
 spf=pass (domain: googlemail.com, ip: 209.85.218.66, mailfrom: matthias.schoepfer@googlemail.com)
Received: by mail-ej1-f66.google.com with SMTP id l27so700681ejc.1
        for <openembedded-core@lists.openembedded.org>; Tue, 26 May 2020 01:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lSUi3bAJFBh/33MwSM1Mr3sjWaQ+5geBH4scITX1AQ4=;
        b=XlXgBbvidlFav01YtngeVMsY3k8Z0JzzyVhGPaToDbZUSNNYiSGMs6bzegVP2e3cl/
         3p62kF2hnSlCePl00G0ytyM9a8yZmfqkr2w676NiBdw2D52geQs1ZN9uJClTQ+W8oWKB
         LT2FFu5kvMg1MBAbPl/952gW+wZwf1D5YMydJd4giFvXpRVfNTVk9MWrYZdsECszHjNj
         pm6l7p3QdlAVnFz/eEu64hZfuA1aRwIqZJg4FR5RJmYJwl6xscqp+yPaBLqHyPHF7gY7
         RG23FVyxeJPrFiqzUQ+3sSml/9+FFZssH0upiS9JEa8ZBrpTzG9pmm0pLtKfIrL05bzG
         tlOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lSUi3bAJFBh/33MwSM1Mr3sjWaQ+5geBH4scITX1AQ4=;
        b=CFEE7XpGPvY1yYaW8IMeWkVRBg86eNb7K6ZArMuqjhWGZFYL/xYgQIETgT7a2pcOUt
         vgB2TSQ7ddrwx0VUPbS919/tHuxvRLGO1+wdjNhcGm6jT/IYAIgvmzzENX3hFp3c0hn+
         XYmY3/uMytq8uWg/z3WNW4tNmBdWZAcEc8F4EpUa4zNsImmTy5y8K+nT/Y/AMrypz73V
         OS8qx9hzqHALZBFKBkhUTg4nntkZUnOoKhy8kmVphI6Yx0Ij/LzFUbbTdl1bv+13TRC/
         YhTGGxHUbprf1dMkgCXil4YOsFhfzhkcuThfQG7/1F8fj2EdGWiCM5dU2E5W0jKYjGFp
         pJdA==
X-Gm-Message-State: AOAM531W/TU7h1P9QyGBbRlyquTmOAcZuqvnZGXME+2GsLNknCexVqR2
	docogZiWCTTT2Wqzc+vJzyf7WA8CNcU=
X-Google-Smtp-Source: ABdhPJz2tHzqPuwqZr5VRyjmgdZD08IFlQ9F5sNiZ9htOYjtnEKQDwkhEdBCPGPtuonSl7o5Bg4ebg==
X-Received: by 2002:a17:906:57d6:: with SMTP id u22mr95288ejr.49.1590480765903;
        Tue, 26 May 2020 01:12:45 -0700 (PDT)
Return-Path: <matthias.schoepfer@googlemail.com>
Received: from michelle.fritz.box (p200300f85702e800eba7f57533fa7a37.dip0.t-ipconnect.de. [2003:f8:5702:e800:eba7:f575:33fa:7a37])
        by smtp.gmail.com with ESMTPSA id w10sm16944519eju.106.2020.05.26.01.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2020 01:12:45 -0700 (PDT)
From: "Matthias Schoepfer" <matthias.schoepfer@googlemail.com>
To: openembedded-core@lists.openembedded.org
Cc: Matthias Schoepfer <matthias.schoepfer@ithinx.io>
Subject: [meta-oe][PATCH 3/4] libgcrypt: made libgcrypt-lic license "GPLv2+ & LGPLv2.1+"
Date: Tue, 26 May 2020 10:12:32 +0200
Message-Id: <20200526081233.62413-3-matthias.schoepfer@googlemail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200526081233.62413-1-matthias.schoepfer@googlemail.com>
References: <20200526081233.62413-1-matthias.schoepfer@googlemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Matthias Schoepfer <matthias.schoepfer@ithinx.io>

With the exception of dumpsexp.c, which is GPLv3, all other parts
of libgcrypt are GPLv2+ & LGPLv2.1+, BSD or MIT or other "permissive"
licenses.

If libgcrypt-lic is not set to "GPLv2+ & LGPLv2.1+", image creation will
fail with settings like

INCOMPATIBLE_LICENSE = "GPLv3 LGPLv3 GPLv3+ LGPLv3+ GPL-3.0 LGPL-3.0 AGPL-3.0"
COPY_LIC_MANIFEST = "1"
COPY_LIC_DIRS = "1"
LICENSE_CREATE_PACKAGE = "1"

Signed-off-by: Matthias Schoepfer <matthias.schoepfer@ithinx.io>
---
 meta/recipes-support/libgcrypt/libgcrypt_1.8.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.8.5.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.8.5.bb
index 4e0eb0a169..fd40cdcf83 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.8.5.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.8.5.bb
@@ -7,6 +7,7 @@ SECTION = "libs"
 LICENSE = "GPLv2+ & LGPLv2.1+ & GPLv3+"
 LICENSE_${PN} = "LGPLv2.1+"
 LICENSE_${PN}-dev = "GPLv2+ & LGPLv2.1+"
+LICENSE_${PN}-lic = "GPLv2+ & LGPLv2.1+"
 LICENSE_dumpsexp-dev = "GPLv3+"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
-- 
2.26.2

