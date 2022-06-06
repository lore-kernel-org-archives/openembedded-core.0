Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F52BCCA481
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 14:39:05 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web10.32817.1654526334092913265
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 07:38:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Vadi13Br;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id d129so13047473pgc.9
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 07:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=fZSaPmhm08ZXUBnvAlddUjXPOGdK4wfbx6/k2n1q7IE=;
        b=Vadi13Br1tlRs2zK+QtSBnmUV7bg1z+D2EVMChUmRTAVlq87koav5s1yXMAzOE17Q+
         R1TBeONVUCkA9+hcHNeULRZhQVD4JSNRzYvHaSeqCISbFRSvF0fek9MSYI6XwCgBd+WZ
         wd4k2xoRC3VpFV7b+sPhS8dVfKkal2qEylYfm9UOVxmhrEVIqjeMSUIXH3Jx6zUgNTlC
         3879HVXrbK2/L8n4+JQlMohguWK/RZ9+ZHDlEztgQKEMB0n6sAOdssFcmDL2X4ap+qMp
         vhNhbDsChSh+KZaLCdI1qgpQL8SehT3gY/FH7ep7E6L6HD4RqnkPLKN/lR5hhqPV/hvq
         CQow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fZSaPmhm08ZXUBnvAlddUjXPOGdK4wfbx6/k2n1q7IE=;
        b=HyyqRGovET3XmAojbKF4AwB29GzhHX4n2LKOXx4xks/zgegWTHGx9XFeJS/7eqlxpp
         PydFtVRhzYgME8869myPUBZwwfEwPTvjcpayxqcnWc0uXaIfsTMawROAVHOARpq0hST2
         Lbll0PT0rqZBXg7gsBrQLsO8ZOu2lYGvjExLaQH7ill9BIHB7GkDIMpZVD3msNZWzbPP
         UHzk7Uwk0cZbdqOUMYadK5dAwmdzJwlQNDzwA2gL2SZ7Vv0ZBjPTIBndejl5cPHSoBB0
         SWsZvKEAIXDhjkTwaFOpvXqkvk1nfgcHMFym6Ii/TI7M/rx+vMt8IJGupD06EueVvFBx
         6kaw==
X-Gm-Message-State: AOAM5328QuTh/mPHeHv4pcHS68YOfr5J177vrqQJkj70MZ6ajuVoWhhl
	nb9Ivy2Wr49qwJdYh0nMJ2120PQKNbwAgUnZ
X-Google-Smtp-Source: 
 ABdhPJz699IMsDQpkdUmgFoGNUUg0/qevKc4f5QNRN6QeV031ZDL00G8UCq9ODV4ld4ACZIV9q97ew==
X-Received: by 2002:a65:580f:0:b0:3fc:ffa7:9a66 with SMTP id
 g15-20020a65580f000000b003fcffa79a66mr17700931pgr.332.1654526338423;
        Mon, 06 Jun 2022 07:38:58 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 a5-20020a1709027d8500b0015ea3a491a1sm10544112plm.191.2022.06.06.07.38.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 07:38:57 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/13] systemd: Update patch status
Date: Mon,  6 Jun 2022 04:38:22 -1000
Message-Id: 
 <06c8bdec050e791b7eb4be0f13b8e91fdc193253.1654526060.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654526060.git.steve@sakoman.com>
References: <cover.1654526060.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jun 2022 14:39:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166637

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2cdfc505ce4e00ae9b4abd962c60c9fec6c3db6c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../systemd/systemd/0002-Add-sys-stat.h-for-S_IFDIR.patch       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd/0002-Add-sys-stat.h-for-S_IFDIR.patch b/meta/recipes-core/systemd/systemd/0002-Add-sys-stat.h-for-S_IFDIR.patch
index 15413d7a0b..8cf0546450 100644
--- a/meta/recipes-core/systemd/systemd/0002-Add-sys-stat.h-for-S_IFDIR.patch
+++ b/meta/recipes-core/systemd/systemd/0002-Add-sys-stat.h-for-S_IFDIR.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] Add sys/stat.h for S_IFDIR
 ../git/src/shared/mkdir-label.c:13:61: error: use of undeclared identifier 'S_IFDIR'
         r = mac_selinux_create_file_prepare_at(dirfd, path, S_IFDIR);
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://github.com/systemd/systemd/pull/23441]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 ---
-- 
2.25.1


