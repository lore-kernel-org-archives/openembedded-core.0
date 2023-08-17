Return-Path: <ppjadhav456@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED5A8EB64DD
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 08:11:47 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.182143.1692259898925661980
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Aug 2023 01:11:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=XPzmuX0Q;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: ppjadhav456@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1bf0b24d925so5793025ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 01:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692259898; x=1692864698;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4rBrqa/uShzMj/JCfOodBOKG31TvBx5ZtSxLO97ny9M=;
        b=XPzmuX0QNGT8MehnWvgcxFB//aXNtdG2YAdcHY9jbIZwwMaGe7ORGW8MgdZN4REY69
         xQ61x9sxGi3GJD80bBpy56btX2vtO9DhNssd5Ne6Au9EyA++8CT2Z7mhJqxmMj/P/wND
         EY+NT40XL8yC71eL9txp2zphlA02sEDhTXl3hwnTO4vtmGSykKvNxrxfH82BTgttb1Bw
         dL3yTLjvp438Ook3cq9z2sit4XnOcW1B1tRNsl73TQnARywzfwxkZu+JrNxu/hCDF3xG
         QtdGV1oKdnSmCRdUWuJv2+eLE9VvZ9dJei/qp/AAX0oYH+1hmkQWYSfEfbDyTazGiQS8
         5evg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692259898; x=1692864698;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4rBrqa/uShzMj/JCfOodBOKG31TvBx5ZtSxLO97ny9M=;
        b=mBp9eXfyugm2j2GxYBnzBxjhc4NSeiNzjpPO8+L2feSYwIP0Kteb1gZr6zI30KUrBA
         Bqk6mC/ATb91f6avIPP/gm1MEAN3q/UWj/qyWlcMOrw3hfYZKnIe55DR08UT1s9/EDj+
         pBxEgQXj2jnlZT/Afajt/tnuQUvjYmmuxZGfx7Zre1Ge0VC/wYCrfkenbr3iR5IN0g2n
         ILB10UPwWIRnb/15MbTlfuBqwltHt0rH/y+F3wpOpLYKVAYjHfWDEq4kCQCfcrjDIGGh
         8tv0BlRWS5c2wcPu7kxBG0TUYYgTTSgzJe85aVnKn6y1Ne5Bjq/07QB3FSxh0gaOunyn
         OpsA==
X-Gm-Message-State: AOJu0Yz+QQW7c4SaGf//TB8bRJMHyQKspVOQHL4gA7PgTPeL0eZ17qwu
	ZlIJqUvZonTDpHt0WI6Ks08tWQSraUM=
X-Google-Smtp-Source: AGHT+IFpBj4pDIivvtEZh2BIYdRTWvO2l3Fowu61AKc6o+GholYXhUr7G6D90kIn/8OQ3O0RWgb+4Q==
X-Received: by 2002:a17:903:1206:b0:1bd:b8c0:b58f with SMTP id l6-20020a170903120600b001bdb8c0b58fmr5260597plh.50.1692259897766;
        Thu, 17 Aug 2023 01:11:37 -0700 (PDT)
Received: from localhost.localdomain ([2409:40c2:3a:12c1:821b:c7bf:f1e8:d61b])
        by smtp.gmail.com with ESMTPSA id kx14-20020a170902f94e00b001b8a3dd5a4asm4607732plb.283.2023.08.17.01.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 01:11:37 -0700 (PDT)
From: Poonam Jadhav <ppjadhav456@gmail.com>
X-Google-Original-From: Poonam Jadhav <poonam.jadhav@kpit.com>
To: openembedded-core@lists.openembedded.org,
	poonam.jadhav@kpit.com
Cc: ranjitsinh.rathod@kpit.com
Subject: [OE-core][kirkstone][PATCH] pixman: Remove duplication of license MIT
Date: Thu, 17 Aug 2023 13:41:20 +0530
Message-Id: <20230817081120.42223-1-poonam.jadhav@kpit.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 08:11:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186296

Remove duplication of license MIT from pixman bbfile.

Signed-off-by: Poonam Jadhav <poonam.jadhav@kpit.com>
---
 meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb b/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb
index c56733eefd..63fd6d2978 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb
@@ -19,7 +19,7 @@ UPSTREAM_CHECK_REGEX = "pixman-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)"
 
 PE = "1"
 
-LICENSE = "MIT & MIT & PD"
+LICENSE = "MIT & PD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=14096c769ae0cbb5fcb94ec468be11b3 \
                     file://pixman/pixman-matrix.c;endline=21;md5=4a018dff3e4e25302724c88ff95c2456 \
                     file://pixman/pixman-arm-neon-asm.h;endline=24;md5=9a9cc1e51abbf1da58f4d9528ec9d49b \
-- 
2.25.1


