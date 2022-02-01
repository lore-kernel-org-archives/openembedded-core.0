Return-Path: <nishaparrakat@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 642A1C433F5
	for <webhook@archiver.kernel.org>; Tue,  1 Feb 2022 07:28:50 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web09.45560.1643700529427603942
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jan 2022 23:28:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=O+8Hzt7a;
 spf=pass (domain: gmail.com, ip: 209.85.221.52,
 mailfrom: nishaparrakat@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id k18so30133129wrg.11
        for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jan 2022 23:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=J3zy6aUawcF17318TrgbQOjDAVqRJ3qtU25ydeP18AA=;
        b=O+8Hzt7afb30155oL4/amv0W3jOzHQyDCL+xzLT09ryUsMKzE0sZQuaqklWu4cCtuX
         lnzjXO4IV3o1lXmqvpmfINHjhnmIxiihm7SO0QRZ8yuxazLAE1BbPXh+xxnXaJfH1+k/
         fPjqq4CG7Dyz7xBMy5busMWD1LgLsxDMllGojbIX7vpt+5c8DFdApuqbRv02FaERAIit
         JcsJTaSK3dqvliXZ6fFhaw1I46m2srq2lENnm/S5g9o1nuiymwIGZ267zIH2QdLhJWab
         frRJMD7Wv35SC5qtP5xrOUn9uRtA/iRIMav0c250bE4PaO94nPe8ddLXEECLH0iDz/mn
         tOfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=J3zy6aUawcF17318TrgbQOjDAVqRJ3qtU25ydeP18AA=;
        b=XC/cl4FR5rSJ7qwabl5SJBHBNgvhDtopRQ9bNShGLLeX3rM51XZP644OlLp1dr546I
         2QZB1Xr3jkrEk+ikjPcTdWf98NvZHuUvSolT8T00ZakIfecbT8lymYUK515ork6bA9IK
         4Zf/bGGMxu0/kAH3uHu+EDyQHTacxKg/PB8W09CuZ7OsewxIuMBMHdBNsdpt76mc7I+U
         d6dr6tBKwhWl7P/RLprNum0tkOIqeXHODhxLnRCsYFHN8hEQU1nt8v1GeOLrlQqHFhKX
         WFoLV8QrvpL8M44zX0ylQXL9n189p1oytpn2mQkc84bKFigCLcwr1rwq5iSlLJ7xrhrq
         rIGw==
X-Gm-Message-State: AOAM530lPl7jkxboU+IQFjBPpIaPkT7xS8wo8xvXeRO8CLPC2MvtsIsn
	91kvZLsLgVFq2V8E4OBcHFdDYtL9/7E=
X-Google-Smtp-Source: 
 ABdhPJzYuNQW3rU9VqySjreUMxOv5WchylLRahqReuNd1JCwBVsHIghWNF1nptgv2DxXv57R8AOa+Q==
X-Received: by 2002:a5d:6489:: with SMTP id o9mr19050898wri.628.1643700527982;
        Mon, 31 Jan 2022 23:28:47 -0800 (PST)
Received: from nishap-at-office.bmw-carit.intra ([212.118.206.70])
        by smtp.googlemail.com with ESMTPSA id
 n18sm13667370wrm.47.2022.01.31.23.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 23:28:47 -0800 (PST)
From: Nisha Parrakat <nishaparrakat@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Nisha Parrakat <nisha.m.parrakat@bmw.de>
Subject: [poky][dunfell][PATCH 3/8] tzdata: Remove BSD License specifier
Date: Tue,  1 Feb 2022 08:28:26 +0100
Message-Id: <20220201072831.34695-3-nishaparrakat@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220201072831.34695-1-nishaparrakat@gmail.com>
References: <20220201072831.34695-1-nishaparrakat@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Feb 2022 07:28:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161147

From: Joshua Watt <JPEWhacker@gmail.com>

The code in question is licensed under the BSD-3-Clause license, so
including the generic "BSD" license is unnecessary.

(From OE-Core rev: c39fc075ce3fd5b53c2a2fccb43500ee0a12f39d)

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Nisha Parrakat <nisha.m.parrakat@bmw.de>
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


