Return-Path: <pdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86654EB64DD
	for <webhook@archiver.kernel.org>; Thu, 13 Jul 2023 06:24:41 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.2632.1689229478258471277
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jul 2023 23:24:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=hhz7BVB9;
 spf=pass (domain: mvista.com, ip: 209.85.215.177, mailfrom: pdoshi@mvista.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-5440e98616cso1088386a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 23:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1689229477; x=1691821477;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0VLUD1MFzu5mGqprGeHOzeAPf5RdzNFV0ycAziu1dOA=;
        b=hhz7BVB9MN5+VXh3TsiN/qPnTeY/DBwQTxaCsjp3r5PmuafPZAc+x72qw749MQqaW0
         bB6sxaVFNg6wuVntqXJnj74553gG7N+RiTyOs90D/lU8MdIkKEZpui8Ou3gIyVP6bLZ5
         WzLu3hqF8sL7UAW7KXx/UfgM9P403XrC9wbV0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689229477; x=1691821477;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0VLUD1MFzu5mGqprGeHOzeAPf5RdzNFV0ycAziu1dOA=;
        b=KuC4pfvX9Y54oyiIMMFz5k3Pl8AAMnKr8t3hdrerNfRFkDsVOH+e3EhXzi5v9RCEsJ
         UwU5mMpz0k8YwgA6ZHurmyFxl9/48TMNzsfT0X93DmjEnyu/SOWCqosipv0jm9B1Ktd5
         KYNy2RvGdsq/Ddcr6s0PHGT4wopufL8dhyOJce4TNTx4enSsi9dswUVNkWYO3mX+v5M3
         FfIyV+iEdm7OCQBU3rADUrOM2OyaMeKP4WPqLVPdInoU+Od25cvZoikTB962OUyFvKk8
         suIUahYq+8P9Uwwz8e+umx2NJN3nWD9quOVvrYk/CMKu18aDBfsyQdqxIhOOXMwT5zNW
         qJNg==
X-Gm-Message-State: ABy/qLYVFYAaYTEHi0khJ9v6/arYLQWsAlyWM8RkwtNP2TVYrlSZM9E9
	ao91JC24V03aTX37KHbuyF1cSkEHXQHI1CERNCw=
X-Google-Smtp-Source: APBJJlE+48XZCq432d8yb/mtx86YkP7K+KRqGj4WJ1EYp6Jlbft90lEvaBfeY75kjLaPRK4WfW2PAA==
X-Received: by 2002:a17:902:9898:b0:1b8:76d1:f1e8 with SMTP id s24-20020a170902989800b001b876d1f1e8mr962219plp.28.1689229477233;
        Wed, 12 Jul 2023 23:24:37 -0700 (PDT)
Received: from localhost.localdomain ([182.74.28.237])
        by smtp.gmail.com with ESMTPSA id x21-20020a170902ea9500b001b03f208323sm5017418plb.64.2023.07.12.23.24.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Jul 2023 23:24:36 -0700 (PDT)
From: pdoshi@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Priyal Doshi <pdoshi@mvista.com>
Subject: [OE-core][dunfell][PATCH] tzdata: upgrade to 2023c
Date: Thu, 13 Jul 2023 11:54:14 +0530
Message-Id: <1689229454-25537-1-git-send-email-pdoshi@mvista.com>
X-Mailer: git-send-email 2.7.4
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jul 2023 06:24:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184232

From: Priyal Doshi <pdoshi@mvista.com>

Signed-off-by: Priyal Doshi <pdoshi@mvista.com>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index 1834665..2960bfe 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2022g"
+PV = "2023c"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata \
@@ -14,5 +14,5 @@ SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "9610bb0b9656ff404c361a41f3286da53064b5469d84f00c9cb2314c8614da74"
-SRC_URI[tzdata.sha256sum] = "4491db8281ae94a84d939e427bdd83dc389f26764d27d9a5c52d782c16764478"
+SRC_URI[tzcode.sha256sum] = "46d17f2bb19ad73290f03a203006152e0fa0d7b11e5b71467c4a823811b214e7"
+SRC_URI[tzdata.sha256sum] = "3f510b5d1b4ae9bb38e485aa302a776b317fb3637bdb6404c4adf7b6cadd965c"
-- 
2.7.4


