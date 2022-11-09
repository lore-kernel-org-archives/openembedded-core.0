Return-Path: <pdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93CD9C4332F
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 13:25:30 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web09.3204.1668000321483456985
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Nov 2022 05:25:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=O0htYgCx;
 spf=pass (domain: mvista.com, ip: 209.85.216.41, mailfrom: pdoshi@mvista.com)
Received: by mail-pj1-f41.google.com with SMTP id c15-20020a17090a1d0f00b0021365864446so1877528pjd.4
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Nov 2022 05:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NotJYldOC8YRoEyupi0ws7Md/PcDkHCmVB2X0617nT4=;
        b=O0htYgCxlXpT0GtAVKkv7V7k82Kneha/o9KEbBbSbWckQNud60BBVy4FB/RhQGOrYQ
         y5PRVlWGPlmut8mXkB0GXB60M6UJDifRjWE71VIlCENlcBvaqGhMmfGB0bHTcLrUJlij
         0EVQrolmSHl9SZFc6FLdP+8ileDJ7d7jATjRM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NotJYldOC8YRoEyupi0ws7Md/PcDkHCmVB2X0617nT4=;
        b=NitYMSTm7wQUvQBpLy57L+PLNTkIXZccwgy4GITWXDmWpvC90+6Jr+ZJG82ZxBFmz+
         3fNBq2tJJtxgRGGUl3YX+XodusJmBNKTDToQ/t5rHw0P39fvb2mhGv/Nt1w9RHx5eaWn
         rcTBEXAtKk/i6r0kj2Mb8+KqAC0kI0phjx028aRMb0qVn7EhJAxqrUegII6AbN9erwg0
         b7PA9mXUAxkF8TMYGcC785Ihct8jp5NOZR7f3NZc9pZjgJaPE14yoSSwQt8+tiY1TXZ+
         2/ZqZiPfIQdMeds3FUcu4aF/3NTT9LJ0CFLeJPpMoecvMagn3oA9xsPhdNXiSm6g9hVn
         LjrA==
X-Gm-Message-State: ACrzQf11HVcM13rmBIObzfNK4dOjh3HVHTcQgJKY8PZOdD2Fzd7Bfyc3
	F2f+SLjpzBLe3OoXD5TU9Scfpa/zUN4TFw==
X-Google-Smtp-Source: AMsMyM4Kd8AsenhcK85q4xNsU4xoiPR8toSenizEsNpodbmMF6zxrM0aHGjPpyYfOA5ghQHC5VY73w==
X-Received: by 2002:a17:902:a611:b0:178:6b71:2ee5 with SMTP id u17-20020a170902a61100b001786b712ee5mr60144626plq.53.1668000320601;
        Wed, 09 Nov 2022 05:25:20 -0800 (PST)
Received: from logan.mvista.com ([182.74.28.237])
        by smtp.gmail.com with ESMTPSA id n4-20020a170902e54400b0017f73dc1549sm9068811plf.263.2022.11.09.05.25.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 09 Nov 2022 05:25:20 -0800 (PST)
From: pdoshi@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Priyal Doshi <pdoshi@mvista.com>
Subject: [OE-core][dunfell][PATCH] tzdata: update to 2022f
Date: Wed,  9 Nov 2022 18:54:43 +0530
Message-Id: <1668000283-8148-1-git-send-email-pdoshi@mvista.com>
X-Mailer: git-send-email 2.7.4
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Nov 2022 13:25:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173018

From: Priyal Doshi <pdoshi@mvista.com>

Signed-off-by: Priyal Doshi <pdoshi@mvista.com>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index d3c78e9..c4cdb77 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2022d"
+PV = "2022f"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata \
@@ -14,6 +14,6 @@ SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "d644ba0f938899374ea8cb554e35fb4afa0f7bd7b716c61777cd00500b8759e0"
-SRC_URI[tzdata.sha256sum] = "6ecdbee27fa43dcfa49f3d4fd8bb1dfef54c90da1abcd82c9abcf2dc4f321de0"
+SRC_URI[tzcode.sha256sum] = "e4543e90f84f91fa82809ea98930052fdbc13880c8a623ee3a4eaa42f8a64c15"
+SRC_URI[tzdata.sha256sum] = "9990d71f675d212567b931fe8aae1cab7027f89fefb8a79d808a6933a67af000"
 
-- 
2.7.4


