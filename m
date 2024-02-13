Return-Path: <pdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2E84C48260
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 12:50:24 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.10571.1707828617803812306
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Feb 2024 04:50:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=LDz8Jiq0;
 spf=pass (domain: mvista.com, ip: 209.85.210.178, mailfrom: pdoshi@mvista.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6e09143c7bdso2189981b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 04:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1707828617; x=1708433417; darn=lists.openembedded.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CE+DTpSs56p2QctayT/tiC+UiT3iem8Z959HlYmHX3c=;
        b=LDz8Jiq0ARl1c4t+Agu1TjWPQUGIUzCYdTsSc1LyYeukzufd0VaFuePIvyJXFNMF9E
         2LDOaW5s3GvDCvgGaqua8D+y+HM9lBIc9hGJaOCRfH+bhaPldKLVsyVdZ8ImZgvTwWWo
         /zLi5EG5YtygasRjE9/ldiE2NZT6A0ChUfAEQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707828617; x=1708433417;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CE+DTpSs56p2QctayT/tiC+UiT3iem8Z959HlYmHX3c=;
        b=HmqhLCMeHBuBCM13NkCfHNPJpsfwWaToBCQ/lYyEpRdbbEYwR1zozzOb9w45bTev7E
         hownauy3hiO9u6T8FoUx0ut+lba+MaabmLPzaFu/uHZ0xtAxQakHJwDagSRmldD605Fw
         rvh03RxvqoIWhRnbAoFWewkwT5lOvEphrA+dCc2T00q3QlIErJWFCca+FCsXbfVqalTq
         fu5wiYsz5QgWTCrpqZfeVo/dZg8WHYpE+SufQX2ODQOqxDENPPmY31c8W9zp58JCMDfu
         24XKJpqth3wKAugUHm8QubCJIU5ZEEBzn7WE5H7g+L9x7qYDFD3LQvt8ID4Uk1Idl9ZC
         ENmA==
X-Gm-Message-State: AOJu0YxESzIN62Wjs5VE0oulkftUXTjV5E+lO6TREP1Eut2SsNHMz9rb
	jkAtvyIy7LXwFdrCvXIdoRBCy6sReGBPkQFqoG3mppnioKeVVT0+F1R3x6+EmJY/k9cCBUCAqln
	r
X-Google-Smtp-Source: AGHT+IGbPM9bhNMQLL0omMLUa1h28W1Rl4DQZOr2UASMNfFOwsy/plCqVLPTrjXispncy5YIeANixg==
X-Received: by 2002:a62:e405:0:b0:6e0:5254:c9f1 with SMTP id r5-20020a62e405000000b006e05254c9f1mr8048388pfh.18.1707828617017;
        Tue, 13 Feb 2024 04:50:17 -0800 (PST)
Received: from localhost.localdomain ([182.74.28.237])
        by smtp.gmail.com with ESMTPSA id v11-20020a056a00148b00b006e0334e3dd9sm7217095pfu.76.2024.02.13.04.50.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Feb 2024 04:50:16 -0800 (PST)
From: pdoshi@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Priyal Doshi <pdoshi@mvista.com>
Subject: [OE-core][PATCH] tzdata : Upgrade to 2024a
Date: Tue, 13 Feb 2024 18:20:00 +0530
Message-Id: <1707828600-28283-1-git-send-email-pdoshi@mvista.com>
X-Mailer: git-send-email 2.7.4
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 12:50:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195396

From: Priyal Doshi <pdoshi@mvista.com>

Signed-off-by: Priyal Doshi <pdoshi@mvista.com>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index 2774e5e..4734adc 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2023d"
+PV = "2024a"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
@@ -16,5 +16,5 @@ S = "${WORKDIR}/tz"
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "e9a5f9e118886d2de92b62bb05510a28cc6c058d791c93bd6b84d3292c3c161e"
-SRC_URI[tzdata.sha256sum] = "dbca21970b0a8b8c0ceceec1d7b91fa903be0f6eca5ae732b5329672232a08f3"
+SRC_URI[tzcode.sha256sum] = "80072894adff5a458f1d143e16e4ca1d8b2a122c9c5399da482cb68cba6a1ff8"
+SRC_URI[tzdata.sha256sum] = "0d0434459acbd2059a7a8da1f3304a84a86591f6ed69c6248fffa502b6edffe3"
-- 
2.7.4


