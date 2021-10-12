Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71F69C433F5
	for <webhook@archiver.kernel.org>; Tue, 12 Oct 2021 02:09:03 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.8041.1634004542415210261
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Oct 2021 19:09:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Yhw2zV2P;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id
 pf6-20020a17090b1d8600b0019fa884ab85so738591pjb.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Oct 2021 19:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O7c/QDnmqdDisoyLRWlP6xilmxrrnNL9w6gIefSOJlY=;
        b=Yhw2zV2P0Uvt1ZOgsI4L4a+IhZgwzIho9Z1PgH8jUklVFLrAtzyqzbGVOD6VGj3wZ/
         TBcB609lbqrURCiGeWQ+dn4NpP0g1gPheAuPui0dEExxrTIvDCLm8yo3DD/GiIOyFgON
         1Q07dLAOL0lHk0KIfs2JsEas5+FdkbHPvxRMkOFKzcxzwLV9nfNBbKuscnizyQnFpgJj
         CEyxXGqpgl96bHoeIQV/R2kzi7hu6BCMO50VKA2ijBbyDJRCGj5PgrJD2aYnLRihDP4u
         pqDueMztkZkuoWclwPyeCwtgyWXVUoY3GabCiXoSGXouMT3pZ6XlPMXB1nbFMc/XJQbD
         b3Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O7c/QDnmqdDisoyLRWlP6xilmxrrnNL9w6gIefSOJlY=;
        b=Twcgb7QnSeS4Y70JS1mGkU/FGJ8ZodpKbxXkmieAHqjvpIMSZdAxieet/Xn2sdHwyX
         Yh79bDAcn03Yr24RfT8P5lf9MpLNT44AS4RWKbX2JFgocTQtRIaNDd4uEqchaZGo3r3Q
         ApGTZM91UgJioEesPnnmIkt2m4VDc6R+7AnFKoS6c8Qb1Vybk0tHXy9VrK+C6W4ys//4
         GsVliAJrk5/PaO0Yxf1kL3p3546FfTL9RhQJDDvqxPd6I0e1RR7KUggCN08/KWMTyegZ
         rxDQAXJd6HXHDakmKvvxUOhy0YpllI2yvfGD0tPec/drCWesFOivWm3krXcHONu5vFu0
         DANw==
X-Gm-Message-State: AOAM533BT0wZ+MFyb7wxS6Fc6gHtvndGHhez98Zouf6CwsNxH+3MjJPU
	3Pdh+Vw84bf4N2/mwCxza3bDYRZFlx04TA==
X-Google-Smtp-Source: 
 ABdhPJxkBvsP5okAfSQG2fCLMSgVAg4Areo4DqtGOEJG1xnhBopUuUow2B+gXtv44WGvi3FfXVdKjQ==
X-Received: by 2002:a17:90a:eb07:: with SMTP id
 j7mr3007919pjz.20.1634004541580;
        Mon, 11 Oct 2021 19:09:01 -0700 (PDT)
Received: from thetis.hsd1.or.comcast.net ([2601:1c0:6000:1830::17e1])
        by smtp.gmail.com with ESMTPSA id
 l207sm8949601pfd.199.2021.10.11.19.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 19:09:01 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@intel.com>
Subject: [PATCH 1/7] python3-hypothesis: upgrade 6.15.0 -> 6.23.2
Date: Tue, 12 Oct 2021 02:08:48 +0000
Message-Id: <20211012020854.2073998-1-timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Oct 2021 02:09:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156852

For changes, see:
https://hypothesis.readthedocs.io/en/latest/changes.html#v6-23-2

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 ...ython3-hypothesis_6.15.0.bb => python3-hypothesis_6.23.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.15.0.bb => python3-hypothesis_6.23.2.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.15.0.bb b/meta/recipes-devtools/python/python3-hypothesis_6.23.2.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.15.0.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.23.2.bb
index 1ea6bb56e6d..4ffba1c612a 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.15.0.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.23.2.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "10699f595eebb9410fd902908aa13aece19be5c437b405092be34f60f69f7999"
+SRC_URI[sha256sum] = "b71b257916c91484716a10220ed2b9a0cf82acc3ed8ef421bb2aa0a671761053"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.30.2


