Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web11.6421.1623744776766706624
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jun 2021 01:12:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OJuX/5ic;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id t3so49929595edc.7
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Jun 2021 01:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jkMEmgiuqkfLKPs8SQg/5aD0WhGjsbh8ezqxxKn2VhY=;
        b=OJuX/5icD2Y+B87XNrzh7vWr+SuwPnBAEp7KIYZLc7m61Dm5Y/xznmp2NGM2f2xux/
         9oT5mjfECYnIVfbMd91oEubEexqBXQVkZH7k9w1virY1tsGW3MzLjsmLd9o4iHTncYPs
         1mj0rhBl9dHtHEoIfhsVSB5CizSOytYzD8j15FcgzNylqYxhQ/B7Ll9vGfT3K4aNmTM2
         yP5Ja8DwJnE0oe4MMtnW8irUwO9ubnXKRE8hNv3L/oDAfKf4NoQi7XeTQa6SGS16kLVZ
         iFcC41lbHbWC7Q61Pou1ms0LUaCRKdHMXWNx8oTABk2v/8B7wGrVlyECC32DoO2/12bC
         4iRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jkMEmgiuqkfLKPs8SQg/5aD0WhGjsbh8ezqxxKn2VhY=;
        b=lF1k+BT3fSUkykqcgmvRifFnUPOQNM6sLslRLZ9L6wXO/fA6NNcQAKb6CQALNUx53K
         YYr75OFbOZpE7Gp5fKLkYfi+aRSlSiiLFGd0ZsV8R2h/6kl6FV9xE00sNFv7pWXIAQPQ
         nADPBBgGIfQnts3RdRLcWZPA7cTRiN1im/m+YC0hR9Ppf5WWML3Csuz/jI57u8C8zs0p
         JqvYmpR7jK+qrG4llAAU1OPsSqfPRX3qpFgGjXnE2LcPL/uNP+kNXvTWBZy156HPUMqZ
         ZFZCvTmTsSfmaXLrs+QAg5X8YqVipXPbI69vLo14PAcOTsDiRSdzCwc/raKWaPH/8IEb
         pfng==
X-Gm-Message-State: AOAM531mRKLiBZCrQiWIIwkx+SJmTbyJxjPbh+rDxVe+iUQgLx1jJ4Gn
	3aakrM6/9LxqGC5mPUZWQxj4lmWcI67Psg==
X-Google-Smtp-Source: ABdhPJybfL9JX/p281HuwNEJ8XFDEJ3dNHmq0a/MoZrRLqxpDagTMDHtRRxOIuQT9HyCbgIF3XpWlQ==
X-Received: by 2002:a05:6402:101a:: with SMTP id c26mr816711edu.317.1623744775405;
        Tue, 15 Jun 2021 01:12:55 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id d2sm9118602ejo.13.2021.06.15.01.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 01:12:55 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 15/31] erofs-utils: upgrade 1.2.1 -> 1.3
Date: Tue, 15 Jun 2021 10:12:24 +0200
Message-Id: <20210615081240.1734087-15-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615081240.1734087-1-alex.kanavin@gmail.com>
References: <20210615081240.1734087-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../erofs-utils/{erofs-utils_1.2.1.bb => erofs-utils_1.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/erofs-utils/{erofs-utils_1.2.1.bb => erofs-utils_1.3.bb} (92%)

diff --git a/meta/recipes-devtools/erofs-utils/erofs-utils_1.2.1.bb b/meta/recipes-devtools/erofs-utils/erofs-utils_1.3.bb
similarity index 92%
rename from meta/recipes-devtools/erofs-utils/erofs-utils_1.2.1.bb
rename to meta/recipes-devtools/erofs-utils/erofs-utils_1.3.bb
index 5ab4bf2816..d07d5c4360 100644
--- a/meta/recipes-devtools/erofs-utils/erofs-utils_1.2.1.bb
+++ b/meta/recipes-devtools/erofs-utils/erofs-utils_1.3.bb
@@ -4,7 +4,7 @@ SECTION = "base"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94fa01670a2a8f2d3ab2de15004e0848"
 HOMEPAGE = "https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/tree/README"
 
-SRCREV = "d1f4953edfcf4f51c71ba91586e21fc6ce9f6db9"
+SRCREV = "2cd522105ea771ec30b269cd4c57e2265a4d6349"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>(\d+(\.\d+)+))"
-- 
2.31.1

