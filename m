Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2E29EB64DA
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 09:28:13 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.7449.1686734887058181875
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 02:28:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=koLNTxPP;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-978863fb00fso87491366b.3
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 02:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686734885; x=1689326885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZDKVvwKE0FQN0GrJOsviM3Hh/LAVG3k60TZghVRq2uw=;
        b=koLNTxPP9WP1qcY8vwpco4yfRVge8F0fIMvnSwS6FcWEOE6cD5CUcg6ihyTVp+Dcd3
         jaFxDLKovC7LLWH1cP9CmvGKGTIG/4xJ7ZQWEAsAmA44XkKl4+HMQsajS9ph3hJFUcEX
         4wD/1PilAlc6cpdMyGRpmenIbOQalmGuqIEEoCJ/+AL4ndQQrSZr8TWZ52EHHwcdB/GT
         jJyQKODnbJg1NAt/0oFtVe3kBvH/fwTs3qJK77LsLOo9nOvdC9v8wdzUSNRb3IL6hdz2
         9VX+TRSKlpXPbkAeOiUKhMy+sBQTyE3g5hLVxZA4ssGSc9AOnYCPx64ZM/3b8E2EtgNh
         iIJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686734885; x=1689326885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZDKVvwKE0FQN0GrJOsviM3Hh/LAVG3k60TZghVRq2uw=;
        b=ZhP0TlqKs9581CVdlFK0m1LoSpb/jAWC3A2dBmBRB9uw0js0OIsA9lMg5ZH+x6f+we
         vEeLgF0cdnu6tzRtU1hPR31EeamBWUu/CfMltQsgJnLN1o5F2iBkt5BkrKfgXNq9B2T5
         BvwLf+kovOvizjvGzA1S1YtzrVk4SOObty91tNSV6J6JmUnRxbMOQu7gdW0/2Bm3Wpcf
         7pYuyx6JmOb3Lv1eGrcdiw5a4hsNDjj2hrasEca70+ErwpMhL7dvB6rYEaLUlp2byYFE
         GjUM19iauTvJHIU4N0SF7vUdTnJuHrg+28FmRvsie598tmJAeuqewvTXPf1tY5vy8qvi
         9GtA==
X-Gm-Message-State: AC+VfDwfgm/ZRsYnxQ970H9wzAGoIfefASPG3XFKcYzDZj1w7SpbnR5T
	qQidTn5p7ip5c6rz/8HZl/6UEM3SwKs=
X-Google-Smtp-Source: ACHHUZ4Sge7t3q2OYyweoA5ft9eJ2nWJQv4teZjVz1xebEK1DJyOp7l747Wxyxq9v1vrcpE167CSFg==
X-Received: by 2002:a17:907:3607:b0:8b1:7de3:cfaa with SMTP id bk7-20020a170907360700b008b17de3cfaamr14389104ejc.3.1686734885337;
        Wed, 14 Jun 2023 02:28:05 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id x9-20020a170906148900b0094edfbd475csm7765252ejc.127.2023.06.14.02.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 02:28:05 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/5] maintainers.inc: unassign Alistair Francis from opensbi
Date: Wed, 14 Jun 2023 11:27:57 +0200
Message-Id: <20230614092800.4065279-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230614092800.4065279-1-alex@linutronix.de>
References: <20230614092800.4065279-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 09:28:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182742

We were not able to get a response about availability over email, and so the recipe
has to be unassigned.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/maintainers.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index c0f6ec8d526..dd0c6faca88 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -554,7 +554,7 @@ RECIPE_MAINTAINER:pn-npth = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-nss-myhostname = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-numactl = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-ofono = "Ross Burton <ross.burton@arm.com>"
-RECIPE_MAINTAINER:pn-opensbi = "Alistair Francis <alistair.francis@wdc.com>"
+RECIPE_MAINTAINER:pn-opensbi = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-openssh = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-openssl = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-opkg = "Alex Stewart <alex.stewart@ni.com>"
-- 
2.30.2


