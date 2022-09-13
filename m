Return-Path: <ecordonnier@snapchat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2F30C54EE9
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 12:39:19 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web12.4170.1663072757181187282
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 05:39:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snapchat.com header.s=google header.b=C1AaPSmA;
 spf=pass (domain: snapchat.com, ip: 209.85.210.171,
 mailfrom: ecordonnier@snapchat.com)
Received: by mail-pf1-f171.google.com with SMTP id j12so11618266pfi.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 05:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snapchat.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=BaODi1lbudpJq9stft4x2FTOJE6F2jauMCs0K+LzpTo=;
        b=C1AaPSmA5xbYbbWgaEY/RZ6KJHJg/6edMthhdkNjmYY+Syc3IgfjVf/s8AxB2fD791
         216HdfIECSQt9q9bjTZ4DFTXyNuhvsUTkRQZaZBwlnH6QBFPDsVquAwEKKj2yITOo6os
         3f28NBArBx6NvyRPmBfjMerE+1oeDCRRbQU+s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=BaODi1lbudpJq9stft4x2FTOJE6F2jauMCs0K+LzpTo=;
        b=3Dp2GfhQKbyc94o6d9m33WmN6WNK8klm5Z9pmOnN5rPa98xm8RG6hcZIncYiKxOzz3
         BgPZykWwRu9KvPpjB3mmTyx/F7mIvUP04ZIMUbqG8hp9Eu+nAj8/sOPVFf5ab63aPYgD
         NWd9jnMn5+EaEoGbkJJ/Ylljb4ML78KwTbbA8MvQBRNK1TEtgocRXO62rBj6rqy9AO7a
         IsyVXqcvpj8rfdkyXBOCyyswfwnOfmMAf/Bk72L0ee1z0GS1a35U8jV+bcNgnY73kT6u
         KFWkimldew3z0zmKDGNrcrM9CZcIGldorbD0m4DZrJjEySt/PJ0XLGfJyZkHFKYNGRl7
         Px3Q==
X-Gm-Message-State: ACgBeo1bvZ0t4L+d28UkSTD8NYpAiKy56WZzxyAsoKY3lTMTV2cJgQUn
	EUsx3+ZQmL31fC/2+7CkGQZFKNz8omlXyXWc
X-Google-Smtp-Source: 
 AA6agR7jbGpHGtce4fGtb4VAYjhvqKaPdJ5Xsv/A4GT662dmlGVHjMF6jSUVqIyXs3OI95LW3HvdRA==
X-Received: by 2002:a63:44:0:b0:42d:706a:b57a with SMTP id
 65-20020a630044000000b0042d706ab57amr27372339pga.108.1663072756327;
        Tue, 13 Sep 2022 05:39:16 -0700 (PDT)
Received: from lj8k2dq3.sc-core.net ([213.86.25.14])
        by smtp.gmail.com with ESMTPSA id
 ik24-20020a170902ab1800b00172eb493487sm8239132plb.167.2022.09.13.05.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 05:39:15 -0700 (PDT)
From: Etienne Cordonnier <ecordonnier@snapchat.com>
X-Google-Original-From: Etienne Cordonnier <ecordonnier@snap.com>
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [PATCH] python3: add PACKAGECONFIG[editline]
Date: Tue, 13 Sep 2022 14:39:10 +0200
Message-Id: <20220913123910.3428647-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.36.1.vfs.0.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Sep 2022 12:39:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170576

editline is a BSD alternative for readline which is GPLv3.

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 meta/recipes-devtools/python/python3_3.10.6.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3_3.10.6.bb b/meta/recipes-devtools/python/python3_3.10.6.bb
index 1b28728732..6c4ef5c7d1 100644
--- a/meta/recipes-devtools/python/python3_3.10.6.bb
+++ b/meta/recipes-devtools/python/python3_3.10.6.bb
@@ -105,6 +105,7 @@ PACKAGECONFIG:class-target ??= "readline gdbm ${@bb.utils.filter('DISTRO_FEATURE
 PACKAGECONFIG:class-native ??= "readline gdbm"
 PACKAGECONFIG:class-nativesdk ??= "readline gdbm"
 PACKAGECONFIG[readline] = ",,readline"
+PACKAGECONFIG[editline] = "--with-readline=editline,,libedit"
 # Use profile guided optimisation by running PyBench inside qemu-user
 PACKAGECONFIG[pgo] = "--enable-optimizations,,qemu-native"
 PACKAGECONFIG[tk] = ",,tk"
-- 
2.36.1.vfs.0.0


