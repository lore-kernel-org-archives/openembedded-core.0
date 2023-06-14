Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2E01EB64D9
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 09:28:13 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.7325.1686734886538383249
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 02:28:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=kjIwrWJ9;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-98276e2a4bbso44155466b.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 02:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686734885; x=1689326885;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=20ELAH27SgPG44OohzdyfqSbjf4SCA6igvdUDe450w8=;
        b=kjIwrWJ9mSpUsTUm0YePcDxG15ia9NBOPRJwL4pHPqbjyLFrcISdHPsiVg/d5PZSt9
         BSt5EJ81fcLl/7WHBMl6btsCP0ZIh7rkLa344q2cr+YaeQYVBeZjuZVL+vMu09Oo/jf9
         5hFiCEEocT5u+7aJkBHjzVErpVKcfGpqQVfYRz7o5rEsyuBU8c8xaCDwdyPwLAbKb+vJ
         A2EZzpzgHkoa9kLJS91ZR9kRVZql15hIyE4g5QLpuw7RRqRbzEcOSpiWVFDc/hlL4vnt
         GRPXSvDquaPg4g/rGmPwAYRnfXKK/P4egrLFXIiTwOBwJWn33ZMVcO2GZMyVWjUwsjAh
         6WLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686734885; x=1689326885;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=20ELAH27SgPG44OohzdyfqSbjf4SCA6igvdUDe450w8=;
        b=gdCYlPSjG0l7QDQ3pXESij/EGs9JRzvIm0hVf7jvr7lj+eE0gBdZDF+8grYSEpjz7t
         93K5e6t1mBMGYF4e4bKfE5xnfqOFftfjIwHUNZKd6uuvSaNZGCTsEhSfOAarp2Sx/6Di
         lGUv394PdNCluJr0FHFiawsnNRO3NxRv0Ni08tbB41wJe09LAFu+T6UE1aCncPE8I7B9
         uOQzukZXeYZW3RUboWhb3XecvQPxOrx9USfPu5ykr0bC85XFzFqSsnFE75TH013E3NtR
         Cgt9dkoV5QR/n5LlolKfSVBVPl7ZFxiv7n1bO38WNT6n0iMevpVdHuzFBGsJO1CShD5L
         cVbA==
X-Gm-Message-State: AC+VfDyCmsne4Dcp9GpazLmDJr0GjLrvv9ppw/Cew+krk4KW8GraIf45
	XQulBl7dHlSHC5/Q0hSb8PAfN5aDDPg=
X-Google-Smtp-Source: ACHHUZ6JK9EyiVWX+HmjCSzw7liMLV8wyqUURAzyowFpPDIUL9j1iTZv9IL/RluhK6wkwlpEppyoVQ==
X-Received: by 2002:a17:906:7951:b0:94e:e97b:c65 with SMTP id l17-20020a170906795100b0094ee97b0c65mr16880341ejo.60.1686734884733;
        Wed, 14 Jun 2023 02:28:04 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id x9-20020a170906148900b0094edfbd475csm7765252ejc.127.2023.06.14.02.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 02:28:04 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/5] maintainers.inc: unassign Adrian Bunk from wireless-regdb
Date: Wed, 14 Jun 2023 11:27:56 +0200
Message-Id: <20230614092800.4065279-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 09:28:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182741

We were not able to get a response about availability over email, and so the recipe
has to be unassigned.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/maintainers.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 823fb5b9001..c0f6ec8d526 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -839,7 +839,7 @@ RECIPE_MAINTAINER:pn-weston-init = "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER:pn-wget = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-which = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-wic-tools = "Anuj Mittal <anuj.mittal@intel.com>"
-RECIPE_MAINTAINER:pn-wireless-regdb = "Adrian Bunk <bunk@kernel.org>"
+RECIPE_MAINTAINER:pn-wireless-regdb = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-wpa-supplicant = "Changhyeok Bae <changhyeok.bae@gmail.com>"
 RECIPE_MAINTAINER:pn-wpebackend-fdo = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-x11perf = "Unassigned <unassigned@yoctoproject.org>"
-- 
2.30.2


