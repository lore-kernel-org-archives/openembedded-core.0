Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web09.217.1626973848695953500
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jul 2021 10:10:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=OAVRtPFG;
 spf=pass (domain: linaro.org, ip: 209.85.222.170, mailfrom: ralph.siemsen@linaro.org)
Received: by mail-qk1-f170.google.com with SMTP id bm6so6114555qkb.1
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jul 2021 10:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UaL6StRNu9TKxKjvconRLqKdmTqMXHnax3Gvo4t/qsQ=;
        b=OAVRtPFGyarsVekjfvT20iTPAX6q5l5/S8rupYrKdTt2czGL1SKp0tozZtWsjEbWd9
         f0JN5wx183XdbGXkO08KUB3RGDxU6PEndleClRd2QbfxWIvgbHDVgRlqFmKDFIK1ZTHt
         ms2NZDh4Ga2S2ulSqJsHupb/OdCTK2zJ02zJtuX5SXcclds6N0+NR/TOYzCKgIBCcjxk
         sFGqew0/w7LAQJk/naMtvyvQldoPhWhGBGmwBTTutdqoO6o8rQYAPwr8y6Hxmdmwvskf
         gteJjqi9W/wYx4DHKQPNmkfLMbtp0GyvLk4Vavgv1eVt9Jvx01alzQ5NlFPrNpXmFQvQ
         bBLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UaL6StRNu9TKxKjvconRLqKdmTqMXHnax3Gvo4t/qsQ=;
        b=iWTkoAYZO7gtqHeHaTrD/yokRYqb2bXn3UAivYKobGsz+memIej0Kyr7E/EiRBi+dR
         B0u3Cx1p1T31hAOuKXrPmeKPj5LxoTL+EqPzOmR4r89DBX6jzdsLmJGh2aX47GM9X0ns
         PresDdg4l9dQ1dtpVd1au4Pe6GLH8CdPcsnrIHb1fobVGc/9MzSdj0OOCD3IkB4gfCNh
         Z+u24I9uYIbc72a9ycABf4BsUNzLVNsEJwy/LYjbHXr6QIjRW4xX3s4njtQFkxTCrB0J
         xXze3Ie5GWYXk9rkWCM31YB3ljpP+NdU93nP7zSzAGdMo0Uu6zZs7W6ZDE0Vxs8Z8pFx
         Sbew==
X-Gm-Message-State: AOAM532Wewh6jx6tO4AZcm0h9K5EByg97+J9FRlgiC9ma3YS0BT4OOnQ
	NQnHO/yqRzogRnVgXxtuuj2AngL6M9hFdw==
X-Google-Smtp-Source: ABdhPJwWJetbMvio8NOhNKVSyZR0Jf0FwCTIYN1nww/mNYdqfrNaSwBiudsWYxJEFIodB6h1XphOlQ==
X-Received: by 2002:a05:620a:1fc:: with SMTP id x28mr723547qkn.84.1626973847841;
        Thu, 22 Jul 2021 10:10:47 -0700 (PDT)
Return-Path: <ralph.siemsen@linaro.org>
Received: from maple.netwinder.org (rfs.netwinder.org. [206.248.184.2])
        by smtp.gmail.com with ESMTPSA id f11sm10610298qtp.85.2021.07.22.10.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jul 2021 10:10:47 -0700 (PDT)
From: "Ralph Siemsen" <ralph.siemsen@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Ralph Siemsen <ralph.siemsen@linaro.org>
Subject: [PATCH] oeqa/manual/toaster: fix small typo
Date: Thu, 22 Jul 2021 13:10:37 -0400
Message-Id: <20210722171037.3743744-1-ralph.siemsen@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PACKAGE_CLASES should be PACKAGE_CLASSES.

Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
---
 meta/lib/oeqa/manual/toaster-managed-mode.json | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/manual/toaster-managed-mode.json b/meta/lib/oeqa/manual/toaster-managed-mode.json
index 12374c7c64..6a63d146a3 100644
--- a/meta/lib/oeqa/manual/toaster-managed-mode.json
+++ b/meta/lib/oeqa/manual/toaster-managed-mode.json
@@ -136,7 +136,7 @@
           "expected_results": ""
         },
         "3": {
-          "action": "Check that default values are as follows: \n\tDISTRO - poky \n\tIMAGE_FSTYPES - ext3 jffs2 tar.bz2 \n\tIMAGE_INSTALL_append - \"Not set\" \n\tPACKAGE_CLASES - package_rpm \n        SSTATE_DIR  - /homeDirectory/poky/sstate-cache \n\n",
+          "action": "Check that default values are as follows: \n\tDISTRO - poky \n\tIMAGE_FSTYPES - ext3 jffs2 tar.bz2 \n\tIMAGE_INSTALL_append - \"Not set\" \n\tPACKAGE_CLASSES - package_rpm \n        SSTATE_DIR  - /homeDirectory/poky/sstate-cache \n\n",
           "expected_results": ""
         },
         "4": {
-- 
2.25.1

