Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BACDDC3DA40
	for <webhook@archiver.kernel.org>; Fri, 30 Jun 2023 02:29:44 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web11.3847.1688092177866781159
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jun 2023 19:29:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=4bYidA6B;
 spf=softfail (domain: sakoman.com, ip: 209.85.222.182, mailfrom: steve@sakoman.com)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-765a651a3b6so125180285a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 19:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688092176; x=1690684176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SCKgp8uQbekHHDmIbz33yUTTMlnWKFwaOJlDwPQn1pk=;
        b=4bYidA6Bkvt7yrZt/owzJ67THpuAu7Q1c4BWa9IrB0A4WttuH7d27f4osTcpsF3ToD
         giJANbGSVIHc6Y17PrY58f7yFEoXK56CeiT4OarVGG3DQa4LOU/DF28YYa+CEGCclew+
         n8yqxc2c0/x8CABOEO9s+32V0uKIuFhKaiaizdzETWA3cYfyVnKfQawZDqpA8pXNWuaP
         ++dfCthlNf3xCjhqI7C1Ef03cfdvph8vBqN9IYKw9/yf5VqSLiowsfQ3YixOLU3W1B6v
         ja1Axwu11hdMrKgiXBjVLm0UhlGxi0DftmH1OIafhgqUOV/aGf4QFaKXf1Cd94FaGMi/
         zyrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688092176; x=1690684176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SCKgp8uQbekHHDmIbz33yUTTMlnWKFwaOJlDwPQn1pk=;
        b=Nq5EpKb5xPS7k+qm6F8EHkny6u9XQR1gznJB7GfZ2xGmVqlZoo81GrcitMNhS67m1J
         855wRsCfcwsqBiaQ3mcICx7w8DoLxvUdJ65YlvHrPY59zOLyW/XzOcW5j+GVPwrkzkCg
         Q/M3iuXsnfzLLBlF/F83BoXDpoHBSHcFmZfXGlvTJ+ALkZBdczZVgqJ4p6KACqOxqIAg
         UUwn2pGGzyLpFMu1GIlaUfoXPCt9h1rY5Ad1naNkWKM/jLxOxvlNvXk+Lbu1T6BkqOAt
         vTHrgT/LzMDjir3r0xtllEsw0sKgAiUwO0sLAExypy9MORcUJPrXEZ9q+I2pvlDdeSZw
         ZTuQ==
X-Gm-Message-State: AC+VfDxiwvmgR65e3Z9CfAp1YuupbBOlYy0jrEHgA9khPTZvZxpHvOjT
	JnD4bPRQuNCz5BAA0dABkh173QJT8K6pAOg/t2PGVA==
X-Google-Smtp-Source: ACHHUZ67D1P+5YsD/c1B65q2n7PJojX2oyj3wbSr1POYLBbJRc+TdtChlv1Tw0geryZ1DFMctAUafw==
X-Received: by 2002:a05:620a:1720:b0:765:4ddb:4ff2 with SMTP id az32-20020a05620a172000b007654ddb4ff2mr1392737qkb.30.1688092176687;
        Thu, 29 Jun 2023 19:29:36 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id g7-20020a62e307000000b0065016fffc81sm3132030pfh.216.2023.06.29.19.29.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 19:29:36 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 15/30] useradd-example: package typo correction
Date: Thu, 29 Jun 2023 16:28:51 -1000
Message-Id: <00a62ec3b5eb0e46f765162e43a04c758fb9dc08.1688092011.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688092011.git.steve@sakoman.com>
References: <cover.1688092011.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 02:29:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183655

From: Fabien Mahot <fabien.mahot@smile.fr>

Fixes [YOCTO #15143]

Signed-off-by: Fabien Mahot <fabien.mahot@smile.fr>
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9adffbb9b5fcd67d9c4e98d97bc459cbcc1b9c05)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta-skeleton/recipes-skeleton/useradd/useradd-example.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-skeleton/recipes-skeleton/useradd/useradd-example.bb b/meta-skeleton/recipes-skeleton/useradd/useradd-example.bb
index cff624e2f9..d7a5a95bac 100644
--- a/meta-skeleton/recipes-skeleton/useradd/useradd-example.bb
+++ b/meta-skeleton/recipes-skeleton/useradd/useradd-example.bb
@@ -32,7 +32,7 @@ USERADD_PACKAGES = "${PN} ${PN}-user3"
 # user1 and user2:
 USERADD_PARAM:${PN} = "-u 1200 -d /home/user1 -r -s /bin/bash user1; -u 1201 -d /home/user2 -r -s /bin/bash user2"
 
-# user3 will be managed in the useradd-example-user3 pacakge:
+# user3 will be managed in the useradd-example-user3 package:
 # As an example, we use the -p option to set password ('user3') for user3
 USERADD_PARAM:${PN}-user3 = "-u 1202 -d /home/user3 -r -s /bin/bash -p '\$6\$XAWr.8nc\$bUE4pYYaVb8n6BbnBitU0zeJMtfhTpFpiOBLL9zRl4e4YQo88UU4r/1kjRzmTimCy.BvDh4xoFwVqcO.pihLa1' user3"
 
-- 
2.34.1


