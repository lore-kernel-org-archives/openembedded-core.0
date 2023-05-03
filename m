Return-Path: <sudipm.mukherjee@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E7DBC77B75
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 14:56:50 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.21709.1683125809567647483
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 May 2023 07:56:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=RZeo9LLF;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: sudipm.mukherjee@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-3f4000ec6ecso5724415e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 07:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683125808; x=1685717808;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iJ/Z74lr1mDkwL7xP9opbjEVThlUGsAmbmYyR9UeNWY=;
        b=RZeo9LLF7IprxHftWE156gP4FqmNo8zK6pClsmj0yU22Nc2j7+N+I+ZGMrDnHugT4o
         OTiFKeSYXCf9J3KucYpJHHuxyWmIroikE1E2WyMyX41RGPJ7JnWduYZpoowJMVeJgKxO
         H9PZseIz4QkQUePZx0rkUI+52F4ceGau3eltl0jw0sK+Wifm03RiLkBIpeIQBOuCCSGb
         selAwWD/b3tx1GzuNt7u6nS9zs9tJWGDpHFP1W3Vnpvig/yF2PVEZT+paVE9qhcLU0KO
         fBWsXdf6Y0vyqUAA3Ur/aCSUnsXXyNo9dQ+j217FAmj4hw/7ZiiYWuNf0YcqP7qtlJ2n
         7ydw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683125808; x=1685717808;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iJ/Z74lr1mDkwL7xP9opbjEVThlUGsAmbmYyR9UeNWY=;
        b=Z+0XOdj3ry9HYYNimNy6SI24R52EmH0Cjpt3Cx9KvdpmsRc71nBu0/lx7LLFHL3TvX
         BRKxo6maqmWallQSHm8oCNlJNXazbkpHLe3eGZWLoacpBhC/gD7QVdKWfjTCs2Y1J/Jj
         qeL0YzUQCS4wLHuAR33N5WuwI7J3aEteCCV1fvLMOgPBIIa5kKQINtz38pEDOkMq43TF
         eJB5g74FmeVPwABWEihuyutwGAi27GETMXpcdcqWuH3pxYS0k00fS2/cwOR8KCCSZ0Je
         hCJTQQkLHJiNKztqNhMAJCn3/194Ks31kPaSKpRdrS9S7AiLVT1QnWHg2GzK8A/Wyo1X
         4p9g==
X-Gm-Message-State: AC+VfDwTbqAfz/R6Q6W2eGZHJwMBKgLuw6ggUXosMyz/a5GU5x5BLGyU
	Az8wHozr3zQrKvE/92j1nDQXYgRBIeM=
X-Google-Smtp-Source: ACHHUZ6GCvcNHLd0NOp7FrYIsd/vsUVGbXtdDem3Bn2gwq9UODpKkuw9+uLUu90FpH0HCSlaKVaQUQ==
X-Received: by 2002:a05:600c:b41:b0:3dc:4fd7:31e9 with SMTP id k1-20020a05600c0b4100b003dc4fd731e9mr15033912wmr.7.1683125807632;
        Wed, 03 May 2023 07:56:47 -0700 (PDT)
Received: from debian.office.codethink.co.uk ([167.98.27.226])
        by smtp.gmail.com with ESMTPSA id n15-20020a1c720f000000b003f339b2d06fsm2153524wmc.4.2023.05.03.07.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 07:56:47 -0700 (PDT)
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH] xinput: upgrade to v1.6.4
Date: Wed,  3 May 2023 15:56:44 +0100
Message-Id: <20230503145644.15332-1-sudipm.mukherjee@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 14:56:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180830

Changes:
Use xz: upstream has not released bz2.
Update sha256sum and md5sum for new version.

Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
---
 .../xorg-app/{xinput_1.6.3.bb => xinput_1.6.4.bb}            | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xinput_1.6.3.bb => xinput_1.6.4.bb} (64%)

diff --git a/meta/recipes-graphics/xorg-app/xinput_1.6.3.bb b/meta/recipes-graphics/xorg-app/xinput_1.6.4.bb
similarity index 64%
rename from meta/recipes-graphics/xorg-app/xinput_1.6.3.bb
rename to meta/recipes-graphics/xorg-app/xinput_1.6.4.bb
index ff1f1c9148..f5e3f5da12 100644
--- a/meta/recipes-graphics/xorg-app/xinput_1.6.3.bb
+++ b/meta/recipes-graphics/xorg-app/xinput_1.6.4.bb
@@ -8,5 +8,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=881525f89f99cad39c9832bcb72e6fa5"
 
 DEPENDS += " libxi libxrandr libxinerama"
 
-SRC_URI[md5sum] = "ac6b7432726008b2f50eba82b0e2dbe4"
-SRC_URI[sha256sum] = "35a281dd3b9b22ea85e39869bb7670ba78955d5fec17c6ef7165d61e5aeb66ed"
+SRC_URI_EXT = "xz"
+SRC_URI[md5sum] = "8e4d14823b7cbefe1581c398c6ab0035"
+SRC_URI[sha256sum] = "ad04d00d656884d133110eeddc34e9c69e626ebebbbab04dc95791c2907057c8"
-- 
2.30.2


