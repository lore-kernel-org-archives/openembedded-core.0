Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 150F9C433EF
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 19:38:21 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web09.2431.1646681893122092395
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 11:38:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RonCNh2A;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id e24so12020013wrc.10
        for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 11:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SzZPwNwnRuLkyfF21c/sv4/si4gtvwUKTInjuSh5seE=;
        b=RonCNh2ANV2IYB7AGYuQBBtTGiWbf5GXc233ZcuoVXkDMpcX4E7cGtheFCocQ6aOuG
         x3D/XHL/YiQz6ncGLZW7JH5cN0DPvdIIDXgwBsMyIIX4YBMPaBXvZf4PjN0HhxFKiQm7
         ZjPUNeGb5v3u+csFRx79UBQZ7gqtFm+2WVkgo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SzZPwNwnRuLkyfF21c/sv4/si4gtvwUKTInjuSh5seE=;
        b=ODZGRnKU1G+lKOZBrrZUxUIbH/XIfWpYR0gAMHQF3dtuFMXlR7rC4aqbPgt4nUL0XO
         6yoJ0LbT2vu1L4yRM+NN5JBjHyfbggxN5qvB9Oe7GrHdskeneTp9KbckF718GsLsJVBK
         VsFaUaTn1T9APf8HnNPFR47P3AHz6Hj8+cKA8qAlgTH3Q/G8rwIog+bJ6Nr+eWDCHjg3
         jIaL5AhndS3RLa6Rue6JtBWGTPNGpQTJjTBkUqaH96cURw1zSjoSXui1YqB6qZiz+SxT
         rPYHpRmrGYxh6CWKCng5vrfenACB+HpG6ugvKwjMwdiLNH4915HjV3VoIF8jOifR7hIM
         qgSg==
X-Gm-Message-State: AOAM530LvsxkNnJramu8HEXU21Urku7c+tU9qp+pI1EIXSYztkVcsGNY
	/7iH48HA0d7rWd/F04S/IrgesBfHuEQESA==
X-Google-Smtp-Source: 
 ABdhPJzlq77ka4tyR3a83kY/t4M15J0Zx0hwQ1KJzzf/7IqqFNDJI5pdMbJFlu3IPJynDtYgfahXOQ==
X-Received: by 2002:a5d:6c6f:0:b0:1f1:f90e:73e1 with SMTP id
 r15-20020a5d6c6f000000b001f1f90e73e1mr4290972wrz.312.1646681891184;
        Mon, 07 Mar 2022 11:38:11 -0800 (PST)
Received: from hex.config (5751ab90.skybroadband.com. [87.81.171.144])
        by smtp.gmail.com with ESMTPSA id
 i8-20020a7bc948000000b003898dfd7990sm233146wml.29.2022.03.07.11.38.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 11:38:10 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] vim: Update to 8.2.4524 for further CVE fixes
Date: Mon,  7 Mar 2022 19:38:09 +0000
Message-Id: <20220307193809.488354-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Mar 2022 19:38:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162859

Includes CVE-2022-0696, CVE-2022-0714, CVE-2022-0729.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 68051f9b923..905ba3f9c61 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -21,8 +21,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://racefix.patch \
            "
 
-PV .= ".4424"
-SRCREV = "cdf717283ca70b18f20b8a2cefe7957083280c6f"
+PV .= ".4524"
+SRCREV = "d8f8629b1bf566e1dada7515e9b146c69e5d9757"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.32.0


