Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA092C433FE
	for <webhook@archiver.kernel.org>; Sat,  8 Oct 2022 23:55:25 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web08.9224.1665273316641668940
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Oct 2022 16:55:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GUzdU2QF;
 spf=pass (domain: gmail.com, ip: 209.85.215.178,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id u71so63483pgd.2
        for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Oct 2022 16:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q2JGyhvCw6zKxu6/Kt2S0iQ6nr/+WFn+PHhoSHOM1WY=;
        b=GUzdU2QFICG887Ttbxj0ahxKFN2mfxzI6haMOB5p3bp8NsDibi29Y35usriii8+v3w
         DHsbbSNaaFcxlHQNxDrPzCqvsOa3NxY3/ub1TEnkVqja9KylGHUxTFU8ItcfxUDAJzlf
         mEEptepD8HdpfHw11cJkBuhBJ1a2/rNS/vaeiEQtWOUiOIuupXUzaF5iiV0Z0wLq1DYI
         5OnsKaNeM+2aMFJuRbgI0uKYLvaNl1X37pA99qusj+b33nq98Ml/7szMk0UtlyhM2DAx
         C3yuAJq0WN4uWBFoOxWYKb8eDV3nTzXJzHJPY3j5PGVruFz8rWoako4X06lmMqSLvOxo
         mGuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q2JGyhvCw6zKxu6/Kt2S0iQ6nr/+WFn+PHhoSHOM1WY=;
        b=RBXpVYvGzvlspIYPSBvOEWIods9mXI7oFKM5bCm/EGQ2LgeDgaH5FKzJ/YxP6UlQ4N
         nhN2dPfiMkClsMiHjgA0wuNpDgWf5Nt7GQflgQYWBoxZ9UK9/sQGa148q+bSlh4SE1dl
         fllGRJG0utjnx/waTWNvRv504rZ8wCgyzrQxksb4M82KUA10nf6fw9AsTPn9V+iLlAIf
         XMVERVd4hLx5OO4c9KPrJSwBNmz+nDbFcJgibIIB4nsUNXIlCF73Jt1D105PncS8xsoZ
         +smBoO5q8LC3+54U1b+WgyFG5DlDRJo4GGm+Zn7VwCShZjyMAy5kvqG4ZX9ppMr1uUZS
         /Z3Q==
X-Gm-Message-State: ACrzQf25IeLuuScgXBX0V1fYh1PEdCBK+67Fm1oP2YeiyAej++j52M7F
	bc3tbeuc12bMgbIqAkQJKYr5vrJX0nU=
X-Google-Smtp-Source: 
 AMsMyM7m+BCY/Bo2tuTgxV7A3DDPPyNP3BsWcH1DJdUuC20ZaSMASdD4wwbggwcV6hgu+HQhgaACuQ==
X-Received: by 2002:a63:590a:0:b0:439:6e0c:6381 with SMTP id
 n10-20020a63590a000000b004396e0c6381mr10503282pgb.141.1665273315682;
        Sat, 08 Oct 2022 16:55:15 -0700 (PDT)
Received: from chiron.hsd1.or.comcast.net
 ([2601:1c0:ca00:cea0:170:23ea:e88e:bfb7])
        by smtp.gmail.com with ESMTPSA id
 k11-20020a170902ce0b00b0017f57787a4asm3814710plg.229.2022.10.08.16.55.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Oct 2022 16:55:15 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 03/10] python3-certifi: upgrade 2022.9.14 -> 2022.9.24
Date: Sat,  8 Oct 2022 16:54:47 -0700
Message-Id: 
 <89b49dfe74b0ed5be1ef2fa46d07a5ff98d99e9f.1665270768.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1665270768.git.tim.orling@konsulko.com>
References: <cover.1665270768.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Oct 2022 23:55:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171541

The following certificate was removed:
OU=Serveis Publics de Certificacio/Vegeu
https://www.catcert.net/verarrel (c)03/Jerarquia Entitats de
Certificacio Catalanes

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...ython3-certifi_2022.9.14.bb => python3-certifi_2022.9.24.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-certifi_2022.9.14.bb => python3-certifi_2022.9.24.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-certifi_2022.9.14.bb b/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-certifi_2022.9.14.bb
rename to meta/recipes-devtools/python/python3-certifi_2022.9.24.bb
index 117a32b1d45..a6b7467052f 100644
--- a/meta/recipes-devtools/python/python3-certifi_2022.9.14.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb
@@ -7,7 +7,7 @@ HOMEPAGE = " http://certifi.io/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3c2b7404369c587c3559afb604fce2f2"
 
-SRC_URI[sha256sum] = "36973885b9542e6bd01dea287b2b4b3b21236307c56324fcc3f1160f2d655ed5"
+SRC_URI[sha256sum] = "0d9c601124e5a6ba9712dbc60d9c53c21e34f5f641fe83002317394311bdce14"
 
 inherit pypi setuptools3
 
-- 
2.34.1


