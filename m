Return-Path: <nishaparrakat@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C03CC433FE
	for <webhook@archiver.kernel.org>; Mon, 24 Jan 2022 17:16:38 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.76.1643044587654039194
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jan 2022 09:16:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=R++yyDaF;
 spf=pass (domain: gmail.com, ip: 209.85.221.45,
 mailfrom: nishaparrakat@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id u15so14884807wrt.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jan 2022 09:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=1P27CsZKfL6okmQm3CtSCgJLz3bvOmoPmFCxaZocDNw=;
        b=R++yyDaF6J23NehTdHoc9SXXc2WvZ1s7UplJ5TKDCIGMSKhd3dqhNF8SuR2ZU2sWy+
         2gqkA5MtJ+DfDZh3hFY7z5nDnM9r+VOKSDwQBoXrGYaxJ39sU38FiZ306S+K6kuTpMbT
         wZrdq2KmNZs4RicpmRsoljbXHSVJeQTDyAePhxuugXY9XxE29L/hOZhl0BSFbKNvZ46r
         gfQt6TNoTweT1t6P5H2Bdzgf6soBzZ4yHxmr198V+U7D4dWsoB7ZaN8O4tSqrtZQ8ee3
         PEBXedSQJUC6aBNBvJoAwMdq50opQ8H4ZNc/zGS9SFqGeGd3jzllS/mU8+UlZn/He2EG
         F6+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=1P27CsZKfL6okmQm3CtSCgJLz3bvOmoPmFCxaZocDNw=;
        b=uJFs2+vKSLJH/YB//QH4oZDvpngJiKUUSZdas/kT+/o6mpiqbsdNBubeSMDO5wsdJy
         w41ESN9fYFw8FBxtFirf/WyjoDeJs917OuOMfv2rdtAR9F5mE+1CQTYNTwzG2SaAIKqu
         jPPRJ4NqOFeag5iOD8qmEC77ID+Soc0/yzTQDM6I154Qh5twROlNWMpTT/FfUveRtQZp
         6Rt41m/ONFpI+wiqf8oxeDArl2hwZbIQdkf7wQxCpkeAtU1E7+BDw4ldLx0cgKGu9mzs
         HDd17Z5NvLnHTzOq/9q4377nYOyOf+g1jcU35d1AgNH5vCPmypM6ilxuwz5gB7GDNrno
         h1Fw==
X-Gm-Message-State: AOAM53186XH43VenqvRfYQ3G1bEFvLvPQlQHiRkCkE1HQC1ShZSvSWUN
	k6fTdKI0F1gX/e5AkFgSTJGxVs8GL6E=
X-Google-Smtp-Source: 
 ABdhPJy81LsozqZpyT9sFbrm4ZCmo6i72UmhT42jtoVXfLT3hDUk7/Mj4pxGEaGWOM6W9VV0rqs9tw==
X-Received: by 2002:a5d:588c:: with SMTP id
 n12mr15022462wrf.413.1643044586176;
        Mon, 24 Jan 2022 09:16:26 -0800 (PST)
Received: from nishap-at-office.bmw-carit.intra ([212.118.206.70])
        by smtp.googlemail.com with ESMTPSA id
 o14sm3085839wry.104.2022.01.24.09.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 09:16:25 -0800 (PST)
From: Nisha Parrakat <nishaparrakat@gmail.com>
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: Joshua Watt <JPEWhacker@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [poky][dunfell][PATCH 2/6] tzdata: Remove BSD License specifier
Date: Mon, 24 Jan 2022 18:16:05 +0100
Message-Id: <20220124171609.20282-2-nishaparrakat@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220124171609.20282-1-nishaparrakat@gmail.com>
References: <20220124171609.20282-1-nishaparrakat@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jan 2022 17:16:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160885

From: Joshua Watt <JPEWhacker@gmail.com>

The code in question is licensed under the BSD-3-Clause license, so
including the generic "BSD" license is unnecessary.

(From OE-Core rev: c39fc075ce3fd5b53c2a2fccb43500ee0a12f39d)

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Nisha Parrakat <nishaparrakat@gmail.com>
---
 meta/recipes-extended/timezone/timezone.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index e9eb249afe..43d14d7f12 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -3,7 +3,7 @@ DESCRIPTION = "The Time Zone Database contains code and data that represent \
 the history of local time for many representative locations around the globe."
 HOMEPAGE = "http://www.iana.org/time-zones"
 SECTION = "base"
-LICENSE = "PD & BSD & BSD-3-Clause"
+LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
 PV = "2021e"
-- 
2.17.1


