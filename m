Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25C0CC433F5
	for <webhook@archiver.kernel.org>; Thu,  3 Feb 2022 19:51:39 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web08.2936.1643917898741290099
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 11:51:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=AccmYIl1;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id k17so3166189plk.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 11:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Vo0mziygcECIVcVOWEQKFXmgPR8W8NVv4ujjXkitGHc=;
        b=AccmYIl1K6BMshxUl0vE1ptGnmb2nJDVRU02EW61JOGUlt8u7YCuxXgp0DCIZ1990b
         CcWdPBqj0ak6urjv5rsWp0HkFysmDAQNpYWTnH2OtuKzF0peQtYJ/UFGl7q0TvAtGjYV
         0R4DWy4dkQkXZk3rmX7Ux9kmXvd/jtP72EpkL+aAZ1pSJRq2LssbtQibbycR1o68KnOk
         LKJ3awNo+Y1gUPMrtUeotnwapntu7Si3OvzhDRrKekpNBFiLVQnPTK+i1iz0ZTjMU+vk
         4gi0yi+IpZ318q1eA9Zxc6R/r76F9UrUNORDKpzJDb+eRIz4+BfwiAwLDLIaZITf3Gn9
         GwWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Vo0mziygcECIVcVOWEQKFXmgPR8W8NVv4ujjXkitGHc=;
        b=y68i0HRdDnU5o9g9DtkF7t3hPq/sje9TmITt6pJvFZst9SV5PzfP1pTaPftsKg71YU
         g7b8cYaQHZMz3yHCFEoaDK5dMxOG2nJATuvRQR9x+Dr/RiGaD+lM7PTCClyt2xIsie/Q
         cUmmREvQUrXvc1R504EtsYJiYmDMnYmu9rxyk0zDJhuZSt/QCV2f7dG124Y5YRka218I
         0RwdUWyzhQVCkrYfVafYAMumz7dhyo9u5f8xu7jYSqHwR03F/9D9m5irAUy0m3b+pMsp
         OTpRIsWlF2Y3ovTFwiyc5537A46P05hUv2h4OxfTwRP3EuXxcwdusU0M2pfsnBPoklSV
         1gzQ==
X-Gm-Message-State: AOAM533608CtQcK2qT1JPy8L0b+HRXaC1eNWXUj0/q9yc9oWqNtDR5AX
	SlMbxrcDaAfzXJfBok0OUfVl7HrRdxLztDlw
X-Google-Smtp-Source: 
 ABdhPJwRHV8vEFowazvVTygjz+ZyE6vOv2odcrS0lVTCSQjPaEUewCg93DLFSgH0XHNSGja0yjNPcQ==
X-Received: by 2002:a17:90b:4b88:: with SMTP id
 lr8mr15469020pjb.12.1643917897776;
        Thu, 03 Feb 2022 11:51:37 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 s4sm27762216pgg.80.2022.02.03.11.51.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 11:51:37 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 16/20] shadow: Use specific BSD license variant
Date: Thu,  3 Feb 2022 09:50:40 -1000
Message-Id: 
 <ba07df183a848b85cf02cd07a8e476382bb19030.1643917717.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1643917717.git.steve@sakoman.com>
References: <cover.1643917717.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Feb 2022 19:51:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161311

From: Joshua Watt <JPEWhacker@gmail.com>

Make the license more accurate by specifying the specific variant of BSD
license instead of the generic one. This helps with SPDX license
attribution as "BSD" is not a valid SPDX license.

(From OE-Core rev: 65e3b23e1b266653fd30c90222e953f7e37fba0c)

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Nisha Parrakat <nisha.m.parrakat@bmw.de>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/shadow/shadow.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 7061dc7505..bfe50c18f6 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://github.com/shadow-maint/shadow"
 DESCRIPTION = "${SUMMARY}"
 BUGTRACKER = "http://github.com/shadow-maint/shadow/issues"
 SECTION = "base/utils"
-LICENSE = "BSD | Artistic-1.0"
+LICENSE = "BSD-3-Clause | Artistic-1.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ed80ff1c2b40843cf5768e5229cf16e5 \
                     file://src/passwd.c;beginline=2;endline=30;md5=5720ff729a6ff39ecc9f64555d75f4af"
 
-- 
2.25.1


