Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33B0FC433FE
	for <webhook@archiver.kernel.org>; Thu, 17 Nov 2022 15:23:34 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web10.18667.1668698608222499825
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Nov 2022 07:23:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Zid0Y0A1;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id z6so1255250qtv.5
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 07:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=t8QZxjDEugkeTWfCAVvCVJapNTl5VuuppStAphS/aGM=;
        b=Zid0Y0A1Gxd2v6q8v/NYOZN3gcEtJ3ZVUALKF4AGNywLxzUXIkFLd2XmIfhf7JITZY
         o7RVU7blcdtekm7DPPwHpWnWCXfBH217bitGc058Q9aWrO1gjufKocPldw/Y6osWQUEg
         RJ+n7tGVs7qHyc0WB+eLoGyoz7XMp5Wi+aAEdi050ei0BhiDg5UBRAClnKCTgEQ6ElLv
         EJNrrFULuRo+LLCC86PQT7gY3kqUGB5ODIvm8gHy1parybtLro2ta75w4jHI1E+MAaY3
         lbsZK6lrf/QiZHku+Ahco0Y5MiMFLYbsEz8y96hTOglIVFiPhOd8a2KoBWQfxpsFb3cM
         F2JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t8QZxjDEugkeTWfCAVvCVJapNTl5VuuppStAphS/aGM=;
        b=eegvZcPL1k8+GrUCOLvxE3eqcl+Ot26bx765jRdKeTriIGWgNkqgpT70xmE32ior0D
         B5jgJEp6/oVVPFwqbZcjlBKclp5IqkY/NhbvbXrNBxWXE6pSbnydJaRjotI5QNUrBQ3D
         kMaPT2bAEu6jhiOexgQHHwESphF5gTvN1aEQlgZB3rJWL6evvRr/ndX/njawbWXxOofz
         gbvz6myrQsQafGn4jpl0fxVUIisD9X3k0FsKzUVsOUa4SEFJ8NYms9U1D90WGUvHK8ML
         1DuPWELsxFhhG5N0SN468DVrN9QARYBlvNF3xRbF9NZlBZRd3hz/Uz4HAXzYML9TD8so
         0HhQ==
X-Gm-Message-State: ANoB5pnWD2c8fvrZ9FSb7sk0haETPf2WcHyut/7sbjJ2LZAEZ2ZFW8IQ
	P+cz0UElocBDB9NnIAEUO13keWta8AI=
X-Google-Smtp-Source: AA0mqf5XSTNRopqE0ARjOxdiqANxGQM6rGSLvxhD+SRDwfFsbohIoOvTClpl2NA3og2LlCFo4rvt4g==
X-Received: by 2002:ac8:728e:0:b0:397:67d6:3425 with SMTP id v14-20020ac8728e000000b0039767d63425mr2613128qto.203.1668698606967;
        Thu, 17 Nov 2022 07:23:26 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id i23-20020ac87657000000b0038d9555b580sm502254qtr.44.2022.11.17.07.23.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 07:23:26 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] local.conf.sample: update bbclass locations
Date: Thu, 17 Nov 2022 10:23:24 -0500
Message-Id: <20221117152324.14271-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.36.0.rc2.17.g4027e30c53
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 15:23:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173430

Update comments indicating where to find various bbclass files.

fixes: f5c1280083 (classes: Update classes to match new bitbake class scope
functionality, 2022-08-10)

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/conf/templates/default/local.conf.sample | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/conf/templates/default/local.conf.sample b/meta/conf/templates/default/local.conf.sample
index f6be0a59d1..be43d1aafd 100644
--- a/meta/conf/templates/default/local.conf.sample
+++ b/meta/conf/templates/default/local.conf.sample
@@ -121,7 +121,8 @@ PACKAGE_CLASSES ?= "package_ipk"
 #  "debug-tweaks"   - make an image suitable for development
 #                     e.g. ssh root access has a blank password
 # There are other application targets that can be used here too, see
-# meta/classes/image.bbclass and meta/classes/core-image.bbclass for more details.
+# meta/classes-recipe/image.bbclass and
+# meta/classes-recipe/core-image.bbclass for more details.
 # We default to enabling the debugging tweaks.
 EXTRA_IMAGE_FEATURES ?= "debug-tweaks"
 
@@ -141,7 +142,7 @@ USER_CLASSES ?= "buildstats"
 # The build system can test booting virtual machine images under qemu (an emulator)
 # after any root filesystems are created and run tests against those images. It can also
 # run tests against any SDK that are built. To enable this uncomment these lines.
-# See classes/test{image,sdk}.bbclass for further details.
+# See meta/classes-recipe/test{image,sdk}.bbclass for further details.
 #IMAGE_CLASSES += "testimage testsdk"
 #TESTIMAGE_AUTO:qemuall = "1"
 
-- 
2.36.0.rc2.17.g4027e30c53


