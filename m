Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5573AC433EF
	for <webhook@archiver.kernel.org>; Tue, 17 May 2022 18:25:37 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.1214.1652811934553005054
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 11:25:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=HbhPPh6i;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id v10so17631766pgl.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 11:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=w0ThiyUREBWIxuRe+WQ+UlqJ5BEnEXiqMYpY8xlnfTU=;
        b=HbhPPh6i5BzH9MH3J5iPlwG+WIaee6kWGUch2syoz4QalANY8AJdmOLdOr9CWXHCYg
         P79XQHIc1KoqPo0F3xwra1Gzhw4jNyGp34rVOf7bZCJhqD5jcQ66rMTHB4PTDt2oZ/w5
         osb+73lnNlSg6c2V8JtvyxCnJMVfS5Jr5X0eS/ga/Fl8AtH4XLuVgIEmnUdOploH0v2t
         JsRNzlKpPcJrzPSty/jcqibI9x1WJKVxUBppeZoDMPE3e9xAF7g+VxtfSyog8W7ZOgj1
         R2W7+0TA0WYBwoNfLpePP1mfsVYLD9FBW0RaHjQlceIeHuDVPi+mLaZQCdyJyfHjEi6H
         3OLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=w0ThiyUREBWIxuRe+WQ+UlqJ5BEnEXiqMYpY8xlnfTU=;
        b=yH7Pl0tL3MV97dDeMVwysI5I6/vBM14YDd9EN16LKVlm0QMUGUlLZV4QEqPagEu3yL
         y+kYmTlnW0SpNAlBcpB9WYuaFX1RwNKDbXcP8cGMlqBoz5nYDD3cW61wzhf2Xy+Puocz
         1iFyMIer3jeRHNiJZm/aE//M/zjSr0luV94dJAThZLI57/9l2nJZKDZ3EDi6k34+db/P
         ahSwiLpD5MWpqZZRoHc3Lss3tI1pwCLvpYEsbbM7B5AeQV9YllI0qy3PKVZzRWee4ASI
         W1oZogsDbkrAU3R67NoSv/8F9Yc+lzVNkHkJ6QGwLticmeQ39o+z7lFvxt5zKJM3+BTI
         5GbA==
X-Gm-Message-State: AOAM532GCcd1lrMe4czCGRDAij6Nt+PMoEwt/Um4bwhNxfGg2mYCUcG9
	Fhp24S8WVXAnFbhFuhWvO0Y1R3bhz+QL2VMH
X-Google-Smtp-Source: 
 ABdhPJwfF4BaxHbCVDOm3CXC82F5+1XjUAZJTtuOKwLQZcFy/PxzEO1tp5uWffpywcPW0wrBoG016A==
X-Received: by 2002:a63:d743:0:b0:3f5:f77a:a516 with SMTP id
 w3-20020a63d743000000b003f5f77aa516mr98598pgi.210.1652811933396;
        Tue, 17 May 2022 11:25:33 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f9-20020a170902684900b0015e8d4eb1d1sm9408188pln.27.2022.05.17.11.25.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 11:25:32 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 23/31] pypi.bbclass: Set CVE_PRODUCT to
 PYPI_PACKAGE
Date: Tue, 17 May 2022 08:24:09 -1000
Message-Id: 
 <80a1de36bc86a864d52292ef9770b77480f3c67b.1652811454.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652811454.git.steve@sakoman.com>
References: <cover.1652811454.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 May 2022 18:25:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165768

From: Alex Kiernan <alex.kiernan@gmail.com>

The CVE product name for PyPI packages is (usually) the same as the PyPI
package name (and not our recipe name), so use that as the default.

Signed-off-by: Alex Kiernan <alexk@zuma.ai>
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 61f6b0ad09bf87cdc2d3f08770b7c44cad1d0e58)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/pypi.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/pypi.bbclass b/meta/classes/pypi.bbclass
index 9405d58601..5fa7b8a6ae 100644
--- a/meta/classes/pypi.bbclass
+++ b/meta/classes/pypi.bbclass
@@ -24,3 +24,5 @@ S = "${WORKDIR}/${PYPI_PACKAGE}-${PV}"
 
 UPSTREAM_CHECK_URI ?= "https://pypi.org/project/${PYPI_PACKAGE}/"
 UPSTREAM_CHECK_REGEX ?= "/${PYPI_PACKAGE}/(?P<pver>(\d+[\.\-_]*)+)/"
+
+CVE_PRODUCT ?= "python:${PYPI_PACKAGE}"
-- 
2.25.1


