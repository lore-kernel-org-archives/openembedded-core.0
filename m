Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F652C001DF
	for <webhook@archiver.kernel.org>; Sun, 30 Jul 2023 19:21:02 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.79831.1690744854743682685
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jul 2023 12:20:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Rtd/yrIO;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1bba04b9df3so30579375ad.0
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 12:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690744854; x=1691349654;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TcDYISTBHKi9nC5rkaj6CK3gvb+KHQNvFoXmRBI0VB4=;
        b=Rtd/yrIOG8NMDZ6R4lQT4GOLDosVl6WDztubPHrp4BhhveBQqHn+EcZzowbHQhEPE8
         V5jfA5b6kG8GaNdpF8d83iZ+I6G3PRagAQzO0YlShP65+Mlv8BWQYMfGfEOLOD2otqtd
         bfq0AJUiL+dHKfVz4REfWYBV8AHcZRPJSj8hSkHN6SaHCAOCwwxwFDpDCFfU96BiPTeE
         ay0N8PWtCG0akBWZSc5w2Ouzvhc5ppJpMN+wDYyhO6ZMW97TkstBZehIw1YVekmpvh8g
         VfK0mo1nCyqp4UP8kxaO8HfanyptjdZChSmejx8DtuMoVEHXBrGsC+818mDc6mpzjJT9
         V1uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690744854; x=1691349654;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TcDYISTBHKi9nC5rkaj6CK3gvb+KHQNvFoXmRBI0VB4=;
        b=LpbSZX8MsiGNT8Mg7aabuoAB/4J0Go4UK15irKege7QVweNzC2XvoS9Vd5t05G9VZZ
         O3OUivnWZvT8PNmxh5gfxNB3FQNuv+HKjHsTmrcQzWvGIeFdPiWD6GmbFmaYF5VmG8vX
         /1AvVsNwCJCNvPMHS22jPXR9EO+/5KzMZ7JlOMtxBsxAcX/BowJd8Q0Pfo2r6D8aS3Yf
         UOjDddN1vK30U3zqRRB4mETny0yhnb8RNiGoaZNAGiVMvjviY2z2DPxMnBV8w1qZLRK9
         qjvizVkVICjKG2q54jkLEzLOMUSEslEJFSwPutytIdOzMym1izsF5IIz3GjNlkNA7gak
         HniA==
X-Gm-Message-State: ABy/qLaAWHl4YJzchbPOQesYkdH2+9fGudH9aXBWPk/sWhUNE4IfQiIv
	DlpNf4iDmyiVM5AjxUNAofBC1Eiwss0=
X-Google-Smtp-Source: APBJJlG+fFFuJnjYMKm5BOBHXECwrBO9ebUG6O/cDumdLpQINr/76Ku9UkeCznCtowmW8NCCv1yZig==
X-Received: by 2002:a17:902:ea10:b0:1ac:5717:fd5 with SMTP id s16-20020a170902ea1000b001ac57170fd5mr8920114plg.60.1690744853755;
        Sun, 30 Jul 2023 12:20:53 -0700 (PDT)
Received: from chiron.. ([2601:1c0:ca00:cea0:6031:b260:43bc:b5ef])
        by smtp.gmail.com with ESMTPSA id e16-20020a17090301d000b001bb381b8260sm6971294plh.100.2023.07.30.12.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jul 2023 12:20:53 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-wheel: upgrade 0.40.0 -> 0.41.0
Date: Sun, 30 Jul 2023 12:20:50 -0700
Message-Id: <20230730192050.2701042-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 19:21:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185112

https://wheel.readthedocs.io/en/stable/news.html

0.41.0 (2023-07-22)
* Added full support of the build tag syntax to wheel tags (you can now
  set a build tag like 123mytag)
* Fixed warning on Python 3.12 about onerror deprecation. (PR by Henry
  Schreiner)
* Support testing on Python 3.12 betas (PR by Ewout ter Hoeven)

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/{python3-wheel_0.40.0.bb => python3-wheel_0.41.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-wheel_0.40.0.bb => python3-wheel_0.41.0.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-wheel_0.40.0.bb b/meta/recipes-devtools/python/python3-wheel_0.41.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-wheel_0.40.0.bb
rename to meta/recipes-devtools/python/python3-wheel_0.41.0.bb
index 2b8111d544b..2d8742545da 100644
--- a/meta/recipes-devtools/python/python3-wheel_0.40.0.bb
+++ b/meta/recipes-devtools/python/python3-wheel_0.41.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7ffb0db04527cfe380e4f2726bd05ebf"
 
-SRC_URI[sha256sum] = "cd1196f3faee2b31968d626e1731c94f99cbdb67cf5a46e4f5656cbee7738873"
+SRC_URI[sha256sum] = "55a0f0a5a84869bce5ba775abfd9c462e3a6b1b7b7ec69d72c0b83d673a5114d"
 
 inherit python_flit_core pypi
 
-- 
2.34.1


