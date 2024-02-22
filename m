Return-Path: <pdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED118C48BEB
	for <webhook@archiver.kernel.org>; Thu, 22 Feb 2024 04:25:54 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.6255.1708575949821425301
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Feb 2024 20:25:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=gzNUfDZ7;
 spf=pass (domain: mvista.com, ip: 209.85.214.175, mailfrom: pdoshi@mvista.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1d93edfa76dso48684005ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Feb 2024 20:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1708575949; x=1709180749; darn=lists.openembedded.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L9B3tojdL4JJd15ZfuLcNRUkm8WZSj+2Y5TOfarHnqg=;
        b=gzNUfDZ7c6TM164O0bTeozJsN2z0l8s0ATXEGdgBZbtJjCwVBDAbj+9Y8DzB3kFICp
         vi+V9gQsjdx/iK09Z/4Vu83o64MKMgzDVbldIakr7v700UejBesxvWgTPB8+2pNRlak8
         vM/Yvwx76L7gi1/pWZxr2AtCnoEIyNL2cxudk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708575949; x=1709180749;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L9B3tojdL4JJd15ZfuLcNRUkm8WZSj+2Y5TOfarHnqg=;
        b=AfZwT6UpRoiCyFFySCzACBWMgwmnKvAulz0dgtzADCm3m7wYEANQJoYdPu2Oq7Y5DR
         3cU5JZZEvs+PJq5t100OhF7nOLs8IUTamFRFNGd7S6t4eZD13QmRR6+h9LWqaRX62lYB
         B+wrQvE+BIVkIn6vKX6aWc574WK700zpE8LqgdXHEafSqvydPRzwHYWmVGY3qsyRx5f8
         00MaCtBEZi1YVvvQ/2bC9yrs2OJaXD5uj1RwfytfWLV0mfjfAt7+mtrLX8wwLUMpBXef
         gdl5kJ+qWTbypNzfgqdF649ovuxj1fOeOHY2Mf/wIhnEo1DRqsF+94ojPLymOxWnYPU3
         xMew==
X-Gm-Message-State: AOJu0YzhPyq5lYNb82FBegchlWgHLskNrPqKi5BeVdHh2YZhnVFuE0c+
	oN8x8i+8uSJn42LZhMH+diB3B+xoaJYHiivysGhlyJQOSLY6lcpH1ExbK1jtPKrbIbTcCfrCfY5
	o
X-Google-Smtp-Source: AGHT+IHWaQgemfj80NORgQR4RrIphojHA3YPEZI75/RLsCuzx4M1R+0RI99NKLLsYdJlwmopSIA+sg==
X-Received: by 2002:a17:902:e94d:b0:1db:8eae:b98e with SMTP id b13-20020a170902e94d00b001db8eaeb98emr25070920pll.38.1708575948820;
        Wed, 21 Feb 2024 20:25:48 -0800 (PST)
Received: from localhost.localdomain ([182.74.28.237])
        by smtp.gmail.com with ESMTPSA id h18-20020a170902f2d200b001d913992d8csm8923051plc.242.2024.02.21.20.25.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 21 Feb 2024 20:25:48 -0800 (PST)
From: pdoshi@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Priyal Doshi <pdoshi@mvista.com>
Subject: [OE-core][dunfell][PATCH] tzdata: Upgrade to 2024a
Date: Thu, 22 Feb 2024 09:55:41 +0530
Message-Id: <1708575941-18696-1-git-send-email-pdoshi@mvista.com>
X-Mailer: git-send-email 2.7.4
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Feb 2024 04:25:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196006

From: Priyal Doshi <pdoshi@mvista.com>

Signed-off-by: Priyal Doshi <pdoshi@mvista.com>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index 75f13cf..46bc1b7 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2023d"
+PV = "2024a"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata \
@@ -14,5 +14,5 @@ SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "e9a5f9e118886d2de92b62bb05510a28cc6c058d791c93bd6b84d3292c3c161e"
-SRC_URI[tzdata.sha256sum] = "dbca21970b0a8b8c0ceceec1d7b91fa903be0f6eca5ae732b5329672232a08f3"
+SRC_URI[tzcode.sha256sum] = "80072894adff5a458f1d143e16e4ca1d8b2a122c9c5399da482cb68cba6a1ff8"
+SRC_URI[tzdata.sha256sum] = "0d0434459acbd2059a7a8da1f3304a84a86591f6ed69c6248fffa502b6edffe3"
-- 
2.7.4


