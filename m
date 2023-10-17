Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12FEFCDB482
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 18:42:51 +0000 (UTC)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
 by mx.groups.io with SMTP id smtpd.web10.238787.1697568167940858329
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Oct 2023 11:42:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=od21A+1Q;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.47, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-57b635e3fd9so3081131eaf.3
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 11:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697568167; x=1698172967; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=99X75jAI8Mm4vx5lrQIbgiGG4BdfRRuZfYM2n1ZR+u4=;
        b=od21A+1QImLORLtEKzV3T40NTRTqjJsRXumSV4acmC94eCRVHu0FC1weO5T3dZMaX2
         7SpBJe0pWYizWS7v14sR+GY9DaQ4crzv+l6IM0/nM9ytV6p+BCcxLV/T7TyB4y2xwszp
         NPGcFZwmlKExMbKROzcqH7uQaJ/LEk5U/kzCuM4KRD+1O5AzKN23eo+tEhYCpd50Z6Gi
         AZieBGRP/DVG78Kq61RXKlsEtgesUI0mPMmHtgWVgZ5+RQJr8Og/cJIAuPViZkEZ+DCJ
         Y0WvgRBDv+AO76V+VKgXr1aTb5Y9YxJc1matPgT3/sEwXyWstn0uNq3QDRFaAber/92Z
         iEPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697568167; x=1698172967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=99X75jAI8Mm4vx5lrQIbgiGG4BdfRRuZfYM2n1ZR+u4=;
        b=U+JDSy55P9DkduE+s8DQiilWeIwYR5ydc5wPv0SHGL5lBbAh6GKZY97p6QrUyAw3b5
         JV26vEzlfwfvdh0uqNkCtdxGAzch9MAjyvTxdfqxM5mVYuOibbDSnhW5GBTPGrLRlUDY
         qlWjBjeyE4NEWMcktUz/I1YkKAGFCscOQoaECdRolNaaibPPqS9PUBEBQxcFkXr4VUr/
         wtutdTu5GN2rc7RpSJ1Ay08TuVKD9I0zQ8g0VygUDTdCp7q9X5OAk0cyhitqYSB+V4eU
         a+40a0+Yd5c1ZhySnlO38fSd6RBOcYrveghlkjl+kySee8CoU3N9/uXmICfklSJ81xpU
         DSgA==
X-Gm-Message-State: AOJu0Yw1l/3WnlWWo9QS6Dp5zz4DfyOvVWAYoiWX1HL81KIzU7M9ELH+
	rFj+LiS7LMKhsugUKIyZweXfmDGFbXwhGoBMoP0=
X-Google-Smtp-Source: AGHT+IERYjKyzAgsifwi3NMx1tCBpBvCfik2BArcsfPDkTsmyQuy4xjfZQjIBo9kiMwGG5OPTu/MKA==
X-Received: by 2002:a05:6359:59f:b0:145:6560:d86d with SMTP id ee31-20020a056359059f00b001456560d86dmr2868054rwb.32.1697568166738;
        Tue, 17 Oct 2023 11:42:46 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id w123-20020a626281000000b0066a31111cc5sm1838715pfb.152.2023.10.17.11.42.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 11:42:46 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/10] vim: Upgrade 9.0.1894 -> 9.0.2009
Date: Tue, 17 Oct 2023 08:42:26 -1000
Message-Id: <624081236d5554dbc7c044396caabc3464b1b3ac.1697567211.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697567211.git.steve@sakoman.com>
References: <cover.1697567211.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 18:42:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189357

From: Siddharth Doshi <sdoshi@mvista.com>

This includes CVE fix for CVE-2023-5441.

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 73e639d7b1..51247cbe0a 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -19,8 +19,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".1894"
-SRCREV = "e5f7cd0a60d0eeab84f7aeb35c13d3af7e50072e"
+PV .= ".2009"
+SRCREV = "54844857fd6933fa4f6678e47610c4b9c9f7a091"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.34.1


