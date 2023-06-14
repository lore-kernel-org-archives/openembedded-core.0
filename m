Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0F9EC001DD
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 09:28:13 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.7327.1686734888622149961
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 02:28:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=AgVMo4k3;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-9788554a8c9so83244166b.2
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 02:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686734887; x=1689326887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bMBjKpv5zJcLfV5NUlmf6Q0X22O3EJGEC6ZcWT/EtJY=;
        b=AgVMo4k3bxdvf2BOrTz4+bzQbQbgH0Njjkhsiucut4W0VejScjBnF+PHyfNSBfY/B0
         599vai7Zk5hrdi1RRyC7zXu131iHfEsxBizVr9/kNoCMgDBTbJ8ASEf6KypvOwwZkO7V
         dVyasU2HqG22rKAhjmoQwDz4S9/Y4ubiqM0wbpmtw1RV+HlIA1P6MASqIGZSY8VwDtd+
         BIUoiAhTyZ/4ImMh1NUQIeY80GxQWGe1cZ6inuGn2JWpnOECqk2bYGpI9vQF3JhSeYGH
         BtR4sngLR96Q1+EOCVrEU8ykFXQD6cL7LOWfUFS/wuZWQvoUPTozJk6RcrKUzF0d6zgz
         yuaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686734887; x=1689326887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bMBjKpv5zJcLfV5NUlmf6Q0X22O3EJGEC6ZcWT/EtJY=;
        b=YvAsao+pVVicICE1k97GBkGuWkk9lrcPUf3kJcYVc+DHucnu7D/BvZTc50vD4+Bakm
         Gy538paO1IXJcfjX9dGyZVKQH9JK4uA44JGECtElLh5Wx3yu7JOnRjh+q66S4/GX5SzJ
         63676NFV/ItCTkwbvaMaW68waso+aBGYWYvBUHB5BpscpPuuRx9GEhTWOKxZF0CjDzsP
         T3vXnv8AKoaSpvR+m3T0ArVaB59dsgWw+J8bVWziZuxjrEErt5LCnrS2x3GP7uzU8XEV
         FVv+3hatlybAPKq1O9HdCOJvr6V3rpBfxHl3bRbjUnAAqnBtrihFox/+76r4qf+TBDmk
         86tg==
X-Gm-Message-State: AC+VfDxuDVJNdt63dLy5/gGv8dm2Fur7882PBzoK7CgHEr01gTBFfxBy
	qUMQS/bdX7jc/ISxaLre35MzUh4PStg=
X-Google-Smtp-Source: ACHHUZ6JJwtqLdqKeLUzUqWqBr8STsX/UwNLf0KwEAEylgn2vOqrLP2oKRIZCcrr5wiuA0vaR+3/2A==
X-Received: by 2002:a17:907:1c91:b0:96a:43b9:95b1 with SMTP id nb17-20020a1709071c9100b0096a43b995b1mr18757996ejc.59.1686734886946;
        Wed, 14 Jun 2023 02:28:06 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id x9-20020a170906148900b0094edfbd475csm7765252ejc.127.2023.06.14.02.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 02:28:06 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 5/5] maintainers.inc: unassign Ricardo Neri from ovmf
Date: Wed, 14 Jun 2023 11:28:00 +0200
Message-Id: <20230614092800.4065279-5-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230614092800.4065279-1-alex@linutronix.de>
References: <20230614092800.4065279-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 09:28:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182745

We were not able to get a response about availability over email, and so the recipe
has to be unassigned.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/maintainers.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 927908eac76..9bb5c5205c2 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -563,8 +563,8 @@ RECIPE_MAINTAINER:pn-opkg-keyrings = "Alex Stewart <alex.stewart@ni.com>"
 RECIPE_MAINTAINER:pn-opkg-utils = "Alex Stewart <alex.stewart@ni.com>"
 RECIPE_MAINTAINER:pn-orc = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-os-release = "Ross Burton <ross.burton@arm.com>"
-RECIPE_MAINTAINER:pn-ovmf = "Ricardo Neri <ricardo.neri-calderon@linux.intel.com>"
-RECIPE_MAINTAINER:pn-ovmf-shell-image = "Ricardo Neri <ricardo.neri-calderon@linux.intel.com>"
+RECIPE_MAINTAINER:pn-ovmf = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-ovmf-shell-image = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-p11-kit = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-package-index = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-pango = "Ross Burton <ross.burton@arm.com>"
-- 
2.30.2


