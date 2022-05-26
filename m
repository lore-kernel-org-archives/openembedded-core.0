Return-Path: <ranjitsinhrathod1991@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F0EFC433EF
	for <webhook@archiver.kernel.org>; Thu, 26 May 2022 09:26:12 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.17734.1653557168331993903
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 May 2022 02:26:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=I8/PDMjo;
 spf=pass (domain: gmail.com, ip: 209.85.210.175,
 mailfrom: ranjitsinhrathod1991@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id f21so1247049pfa.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 26 May 2022 02:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=wuX1Ole1NQ8VrJf12p6IBcXnVVLzwpDI8gm7MWLP8dk=;
        b=I8/PDMjoky6HNkJdaCmQlOk84yaIl0euN1v6vh148DSsMl1hN15rbgxEzE0ChBP7CI
         LNOgEB07brBVuHM7fRr+vlEyb7WHAA6WynoWEI6sI/vRnrPjwcluJ69XtaTG03XhIxls
         OPfuJxuGbThyOuXQ5+b/zbSSXB7ml8ZBLWsjEIFfcwJzNRighhqfOHi+GlmlhzwFzm9A
         +de40Rd2j0czd19FW0OrteAymrp/GvOQNBToDlQ9lo7rM30WbVSEtfUv+YUvgyEdbWoS
         DTbPXRHnMfwUDBQYDig43mLh6OrsjHsxbYGm6coWywA3VeMlX4K1cYGai3IpY5I15A9/
         SWKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=wuX1Ole1NQ8VrJf12p6IBcXnVVLzwpDI8gm7MWLP8dk=;
        b=mHzibx5mStrtQFBM04SNsHunVm398dpnuY/TXcgz4oJQLeGlOjANM78XxKrog1L28U
         hcD2f5wtPOJWS5jCNlRLyggitX2F3pjf0pnM00E1miTT4LHDoCoGYiaAzEUddvWbeQW7
         DBU8jKpc24SXwG03VHOq9aZ32hx1+HnBBvOsRI/7DF0MsxRXT+QwncIGMk9lahrRohXx
         d9wXyG2scIk5A0iKSJGUIf9VeGES0qfC6Ot8cM2ThGYTWCdLw0TaVUTUnSOS5LcE/GW6
         wkyKUiaYsRxaI6rACYKJAW/MtGa0wAG2DcAyDu1Bm9YzxJi6uazRandg/QPDx7iI2q55
         ngiA==
X-Gm-Message-State: AOAM530ZyBpU0dCb3eoAy7VCl4wQlZBXXUydG4o0B76oaEn5bgzNArn2
	325oGb3kqB0vwVFXoQXQZ0kEwppHi74=
X-Google-Smtp-Source: 
 ABdhPJyHarG2oHg0UNzpBf+08iR+JUYk3So9dtiUZFnIidHpHtGWXPhvSf42wdv36WB5Z2+LLfxPBA==
X-Received: by 2002:aa7:88cc:0:b0:518:931b:7d0e with SMTP id
 k12-20020aa788cc000000b00518931b7d0emr22838325pff.21.1653557167508;
        Thu, 26 May 2022 02:26:07 -0700 (PDT)
Received: from localhost.localdomain ([103.238.105.13])
        by smtp.gmail.com with ESMTPSA id
 j2-20020aa79282000000b005187f4ebd12sm948556pfa.123.2022.05.26.02.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 02:26:06 -0700 (PDT)
From: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Subject: [OE-Core][dunfell][PATCH 2/2] ruby: Whitelist CVE-2021-28966 as this
 affects Windows OS only
Date: Thu, 26 May 2022 14:55:17 +0530
Message-Id: <20220526092517.22032-2-ranjitsinhrathod1991@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220526092517.22032-1-ranjitsinhrathod1991@gmail.com>
References: <20220526092517.22032-1-ranjitsinhrathod1991@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 May 2022 09:26:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166179

From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>

As per below debian link, CVE-2021-28966 affects Windows only
Link: https://security-tracker.debian.org/tracker/CVE-2021-28966

Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
---
 meta/recipes-devtools/ruby/ruby_2.7.6.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/ruby/ruby_2.7.6.bb b/meta/recipes-devtools/ruby/ruby_2.7.6.bb
index 658a17659a..3af321a83e 100644
--- a/meta/recipes-devtools/ruby/ruby_2.7.6.bb
+++ b/meta/recipes-devtools/ruby/ruby_2.7.6.bb
@@ -12,6 +12,10 @@ SRC_URI += " \
 SRC_URI[md5sum] = "f972fb0cce662966bec10d5c5f32d042"
 SRC_URI[sha256sum] = "e7203b0cc09442ed2c08936d483f8ac140ec1c72e37bb5c401646b7866cb5d10"
 
+# CVE-2021-28966 is Windows specific and not affects Linux OS
+# https://security-tracker.debian.org/tracker/CVE-2021-28966
+CVE_CHECK_WHITELIST += "CVE-2021-28966"
+
 PACKAGECONFIG ??= ""
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 
-- 
2.17.1


