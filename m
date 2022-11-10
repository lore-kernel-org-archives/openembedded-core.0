Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E448AC07E9D
	for <webhook@archiver.kernel.org>; Thu, 10 Nov 2022 18:13:15 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web08.4.1668103986801667874
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Nov 2022 10:13:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kHFxuCrn;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id bk15so3420673wrb.13
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 10:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3b2jYnKuDwxYM3xCNO6Ct4s865y3NcKk0wMGwRzCTsg=;
        b=kHFxuCrnKvExH4L712K11xOrNTGJt6GEq0p+nd6NBCul2t0R+7MrMn3QVWEAt0JySD
         XxPcQ2XHyBstvqPUcaU8piw3WmEnVYcIkoG0ov8hsmuJYcgoRZsE5fQNwGJPqXzbE9fl
         jFUBxairmMLzYmQhPfbjD0765ExgJfvFNTHNHfvuaCXhXF60d7oYZA82o7cRn+k/UpfJ
         9nx3Bzun7G45N2L0xWdQyUtRi8Yb8TiKHvFBAdchl9NTnHkuEd6uL6NZiYX+uIuD6x60
         5w70Co3/9eOyfKRG1Uhc6KoI4qZoEZ1UlaMsJh2DkOt99QMIbC66x+XVDgHTtW/QhagZ
         bI/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3b2jYnKuDwxYM3xCNO6Ct4s865y3NcKk0wMGwRzCTsg=;
        b=MccllvJIPY0Vm4IoJTCZmQcyBwFvoPAlUw8WIiqIqxzi9a73iu9IpkSt4C32OsdCnq
         QZd/kF5Dqa94hk1tuMIopXivpa36G8REUc/GnIQsXdNxu+lNY3kX9sY7wZUTufOXy2vd
         bkRZykv2kRkbJyInYjAuNMjOB3ba09nDug/PleAJBBqsvkuGv13Zak1qnP2DKv92Vie4
         WIgyLZB9sgulWmOiz9xCmR2k6MoPIC6WKobl9G63euLUQNn5XOdoNjBhooPA4ibLFSIT
         ioebNpVTISsr7G9617YWpcfMdax05DSriBfl6niaPrQhAu4he4D/Fy829jCRA8E2NwoF
         kKiA==
X-Gm-Message-State: ACrzQf1wl1PVUWICn03QcPYJiqTWf9sPIuKf6iCXSJFbbeJ5xelSetUq
	byKmpz0VvOSvdhWxmrhuObfJ6Is1JEM=
X-Google-Smtp-Source: AMsMyM6+VZynimhsEVUEjsv4CMOOlZlJ0tHhQsq/TZPEJUYzAhbVkD7qpDtjTD+H0CucDuRVR/M/FQ==
X-Received: by 2002:a5d:6ac6:0:b0:236:84b5:6660 with SMTP id u6-20020a5d6ac6000000b0023684b56660mr41969693wrw.555.1668103985315;
        Thu, 10 Nov 2022 10:13:05 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m3-20020a05600c3b0300b003b4ff30e566sm8400477wms.3.2022.11.10.10.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 10:13:04 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 08/19] libxtst: update 1.2.3 -> 1.2.4
Date: Thu, 10 Nov 2022 19:12:38 +0100
Message-Id: <20221110181249.1240200-8-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221110181249.1240200-1-alex@linutronix.de>
References: <20221110181249.1240200-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 18:13:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173091

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../xorg-lib/{libxtst_1.2.3.bb => libxtst_1.2.4.bb}          | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxtst_1.2.3.bb => libxtst_1.2.4.bb} (79%)

diff --git a/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb b/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb
similarity index 79%
rename from meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb
rename to meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb
index ebe9be5b9a..7ed8f3d89d 100644
--- a/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb
@@ -15,8 +15,7 @@ PROVIDES = "xtst"
 PE = "1"
 
 XORG_PN = "libXtst"
-
-SRC_URI[md5sum] = "ef8c2c1d16a00bd95b9fdcef63b8a2ca"
-SRC_URI[sha256sum] = "4655498a1b8e844e3d6f21f3b2c4e2b571effb5fd83199d428a6ba7ea4bf5204"
+XORG_EXT = "tar.xz"
+SRC_URI[sha256sum] = "84f5f30b9254b4ffee14b5b0940e2622153b0d3aed8286a3c5b7eeb340ca33c8"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.30.2


