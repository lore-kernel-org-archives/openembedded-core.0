Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web11.5995.1630418602812104835
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Aug 2021 07:03:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fHYJfuXn;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: andrey.z@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id q17so27035284edv.2
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Aug 2021 07:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=oBmeSh5pZmM+wcRzbfNNUAtGGAfHJenOe0qc7Jp3ERo=;
        b=fHYJfuXnHqvqkT567aRyW2L2LheyQ6bXNiMSlLfCHrgPIf2Uot+jnLRkHyebBaSS99
         FANaq/unMRX2pxYS76Hck4XTLIZS3StmHfOCuyH2CwAV1BUdGd7w07IXFR9xPDG2a5fq
         tgEUYGfPSd6GgX5mOq9IBsO+Ks4+TgViafdM/i9XBNjPgEx2SoGc8X4RRIjwn6o0zAsN
         lVbD2DfhFUnXDq1dZqWuvHdWxkB0K7ntViHakGBEBrDOYHVmiZNnAFOUtc2Tn/T/tmlv
         qbmK22yRGT3gKH8Wlcyj1G5fSL2TjC6WGimbXpa4wRjeZAQQpEV7fp0XilbWtKdezFuT
         5f4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=oBmeSh5pZmM+wcRzbfNNUAtGGAfHJenOe0qc7Jp3ERo=;
        b=PLvs/H4qo4UcYoSb4lwNo5q+ehyu147BrK4ap5pEBf3kXNvnZQKNARzF/72img9Hap
         wh/mbHDqpdVAWylRT4/4GixR2dENC+c5CtD+ZL+z1AV98o9zHQ4IkIb6xsiTl4zmHs2h
         6pzOJ6bbqRhqSVKOmy++R3JK668S0ZUTE/MiqkhHneDmZ0+6LU+468Ms4Qr4OqMGrTf/
         2gbPcSjze6x1YQa9ViQ9T8UeubITqsLna20Co27keFZ/+Rtq676avQPu3f7YhK0piOwf
         t5XHXubWad/0xnjEYP/n5MipXg337LYlVK2OL2wg/9NC6DJKd44pYVGdwhPlzmGR9Pz2
         f8gA==
X-Gm-Message-State: AOAM530oeHumi2JKGGfgs1obFT95hEsZLwkcquA/5iru6kc3V46GL4pj
	WSTfSyneOuq90tTLsZmFtvcazw+O8vEWeDJO
X-Google-Smtp-Source: ABdhPJzvi5iLop4+UyeAiKoTUKXKz08qtZMeBW1B6uPT3JDcP+qfghKvW4oXIpoVQeCelBZOH6/ynQ==
X-Received: by 2002:a05:6402:424e:: with SMTP id g14mr3496388edb.372.1630418601225;
        Tue, 31 Aug 2021 07:03:21 -0700 (PDT)
Return-Path: <andrey.z@gmail.com>
Received: from aherlnxbspsrv01.lgs-net.com ([193.8.40.126])
        by smtp.gmail.com with ESMTPSA id p23sm9426464edt.71.2021.08.31.07.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 07:03:20 -0700 (PDT)
From: "Andrey Zhizhikin" <andrey.z@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Andrey Zhizhikin <andrey.z@gmail.com>
Subject: [OE-core][PATCH] nativesdk-packagegroup-sdk-host: add perl integer module
Date: Tue, 31 Aug 2021 14:02:51 +0000
Message-Id: <20210831140251.7281-1-andrey.z@gmail.com>
X-Mailer: git-send-email 2.17.1

Kernel commit 12dd461ebd19 ("crypto: arm64 - generate *.S by Perl at
build time instead of shipping them") uses perl to generate assembler
files for crypto functionality, which relies on the integer.pm module to
be provided.

Add perl module to package group and export it in SDK.

Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
---
 .../packagegroups/nativesdk-packagegroup-sdk-host.bb             | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
index 64e5883f95a..984398462fb 100644
--- a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
+++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
@@ -27,6 +27,7 @@ RDEPENDS:${PN} = "\
     nativesdk-sdk-provides-dummy \
     nativesdk-bison \
     nativesdk-flex \
+    nativesdk-perl-module-integer \
     "
 
 RDEPENDS:${PN}:darwin = "\
-- 
2.17.1

