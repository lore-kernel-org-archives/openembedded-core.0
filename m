Return-Path: <sudipm.mukherjee@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89A9DC7EE23
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 22:13:28 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.63.1685484798638237386
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 May 2023 15:13:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=OUASGa4Z;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: sudipm.mukherjee@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-30ae967ef74so2216395f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 15:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685484797; x=1688076797;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=opdeA8nC6YnovGdqqUxKLnbUvVh7Ql/JEP9GB4hRreI=;
        b=OUASGa4ZmRsRjPFT4aAS69W5kS90V4K/IhFN2JUBap0T2D/HxLwe71UoHBcstXkryU
         64tS+gp5RBXOaZeISyicYakh8MuMPIijtcfOQ5AKQgWET1xb1HbBbod4A7vJY53hjywb
         Q2fAT5Y7jSNG++LbxtdS4kKJD/w7ZInQNWSOGy7znD2EO+ou8nWv30hkV2pmgxUF/wZe
         5YNxloSNdHYHfTIQJG1bFi1DRYUjE9Ti+KdJTVIWxObRASB2WkKZrm0rExeZKdtfFJAA
         0KyED7AFCJZm7oD5hlbkHHZwk1Hb2yGaKYBB5DG7c+h+U8FvLs2fLBoAfZU0oq6PdSSC
         1+xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685484797; x=1688076797;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=opdeA8nC6YnovGdqqUxKLnbUvVh7Ql/JEP9GB4hRreI=;
        b=OaNtp1/pV8nQmlbgSWGugRSs6T22K7fbffNVn23WdwQ9/gxFPqOlG+d9Q3NjhUZc+R
         zJhjjKagpaYgI/wZGoKAnS72zrk3gIYns1BHCSkkIk+aZ4dn7XIzt/TMjC1trg2uPpeP
         SoSCqJvFvPu6Al8B2WBWeSMjV1ITOluTMUaPdvddkT37ceYb85txjnv9KbEiworRNGXa
         ngA9DCDD05gxjlkZGp7keZzxyXmxu4RSN5yHKlZUCFf/zWbfPZreWOdHU6QlPO13su+e
         o+Dxg5UR+xepQ7PkN+lNAzR72BV16wSCElwDBQpZtLISXCQ8jBv+NGFD9M3f3hx4wkuR
         RC8w==
X-Gm-Message-State: AC+VfDxk4H9/rxPZkQ5PNo8cEGcgKOyquwiPYSsFtcYqJV7NQTxZbTar
	BKCTyJvkzJE30pT/gM263jiZ6MzKRfY=
X-Google-Smtp-Source: ACHHUZ6GMVz+Ns5KkL914Abz6pfOsjmZxJ38qf3ZPEZV2EDpV8/RJtIG4wn1LUWfXLQewB5JlLULrA==
X-Received: by 2002:adf:ff85:0:b0:2ee:f77f:3d02 with SMTP id j5-20020adfff85000000b002eef77f3d02mr2617047wrr.0.1685484796597;
        Tue, 30 May 2023 15:13:16 -0700 (PDT)
Received: from localhost.localdomain ([63.135.72.41])
        by smtp.gmail.com with ESMTPSA id m12-20020a7bcb8c000000b003f60faa4612sm18664946wmi.22.2023.05.30.15.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 15:13:16 -0700 (PDT)
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH] apt: Upgrade to v2.6.1
Date: Tue, 30 May 2023 23:13:01 +0100
Message-Id: <20230530221301.23483-1-sudipm.mukherjee@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 22:13:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181958

Changes:
Update sha256sum for new version

Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
---
 meta/recipes-devtools/apt/{apt_2.6.0.bb => apt_2.6.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/apt/{apt_2.6.0.bb => apt_2.6.1.bb} (98%)

diff --git a/meta/recipes-devtools/apt/apt_2.6.0.bb b/meta/recipes-devtools/apt/apt_2.6.1.bb
similarity index 98%
rename from meta/recipes-devtools/apt/apt_2.6.0.bb
rename to meta/recipes-devtools/apt/apt_2.6.1.bb
index b872be8371..fb4ff899d2 100644
--- a/meta/recipes-devtools/apt/apt_2.6.0.bb
+++ b/meta/recipes-devtools/apt/apt_2.6.1.bb
@@ -26,7 +26,7 @@ SRC_URI:append:class-nativesdk = " \
            file://0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch \
            "
 
-SRC_URI[sha256sum] = "43467d1ca7de6c0955fd991925433e22fa66230870e5f66c4498675d01776c2a"
+SRC_URI[sha256sum] = "86b888c901fa2e78f1bf52a2aaa2f400ff82a472b94ff0ac6631939ee68fa6fd"
 LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 # the package is taken from snapshots.debian.org; that source is static and goes stale
-- 
2.30.2


