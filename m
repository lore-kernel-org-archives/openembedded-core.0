Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1CBCCF5385
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 12:35:21 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.7693.1729686913535063546
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Oct 2024 05:35:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ZsORyQno;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-20c803787abso6817865ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 05:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1729686913; x=1730291713; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uiS6NBjdX2G1RROox0jPpNZY/T8O7esSsOX2pSRfz2I=;
        b=ZsORyQno6VB95L7jn6p4Uagmr2z1JGlFn4zh+0mjh0tnVFOLwwcyzXDlqXxADk680J
         lFGaljz3hZOi68vDw6FYVce1lEq/9Wb82TPUrH6TIasq6u9ThaICqa+/EuFngWu40v3D
         IkbdNBaH1gx+ttxEc/JwmC/EiJpCHkEX5uAyCMI+kLhuhbiIVJHopfsFBZZQyDnoltPQ
         jOQdjVAHGlfDnsfC8IO5itsW3nP1RTy8bxt9rQpSGbxK+/xf7cno3/4Y7nzwV2CpaDno
         yo99brept5OeqNJlXVhuBQr5yvTdOtBdgybY6so+U2tnTAKq6NBiGfgSOs+M8zQElYsh
         ywuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729686913; x=1730291713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uiS6NBjdX2G1RROox0jPpNZY/T8O7esSsOX2pSRfz2I=;
        b=auY7icu5d5wNN5rxfoPDVr1tpJpVPDraBRum/vqF6nnjVGrZAYDu8WYshJlnUs0hl7
         jCyYVvfEw9Zj7PQhkwvljuqeSFAke8kOWXnfGkIVNkFUU+rh92YVJ6Cq7xfpmi68559y
         07KuskJwo6LAPIkES2RPiA2K1IdGlcFokm2TEnADA4QUmORFXTGrpgYIYLT6lDMM1LSR
         nvT4JsrmIphYFAQxcVGYSJunNsGeEzBt0Js29WUWBi/gRJ3rxZTK/AAn9fJ1Nb5JPsbW
         mE8CRVhLIrMAhdCocpWZAnTHqt3ZFLthyZP8AbuG/HAjfn2ngZcZyjbrGyL7s7XnfMcD
         X6iQ==
X-Gm-Message-State: AOJu0YwdywEeIWBzJqIVM7/2GewyR3Jo2+kMZnhalhxSiKWYEMgZxSh3
	veqEnMmgKW9Abo8Wx2g9RJvi04n3KyCulL3egL1n0RLGXYsDSJOOvQJ2lgY1+nnzPCyjamgXt8F
	z
X-Google-Smtp-Source: AGHT+IGwfhZKjUzqomTWZP6RTgJ8hzzuQY2kC0YY8Qlz+yGWtpKu9FZhQfFdDtEdgRs/gYfW9BNAlA==
X-Received: by 2002:a17:902:ea07:b0:205:8a8b:bd2a with SMTP id d9443c01a7336-20e970c657emr89543285ad.22.1729686912808;
        Wed, 23 Oct 2024 05:35:12 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:4a40:d08b:8aa5:305c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0de3dasm57294245ad.226.2024.10.23.05.35.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 05:35:12 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 18/27] binutils: Add missing perl modules to RDEPENDS for nativsdk variant
Date: Wed, 23 Oct 2024 05:34:26 -0700
Message-Id: <75773577d8dd9c9d61aa039e1da2482c064c666a.1729686660.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1729686660.git.steve@sakoman.com>
References: <cover.1729686660.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 12:35:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206229

From: Harish Sadineni <Harish.Sadineni@windriver.com>

In SDK, missing perl modules causes 'x86_64-pokysdk-linux-gp-display-html --help' to abort with below errors..
  - Can't locate bignum.pm in @INC (you may need to install the feature module).
  - Can't locate Math/BigInt.pm in @INC (you may need to install the Math::BigInt module)

By adding the following perl modules to RDEPENDS fixes the above errors:
  nativesdk-perl-module-bignum
  nativesdk-perl-module-bigint
  nativesdk-perl-module-math-bigint

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 05f1099acbbb10b6ce33ea117d313749f7dc4a47)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/binutils/binutils_2.43.1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/binutils/binutils_2.43.1.bb b/meta/recipes-devtools/binutils/binutils_2.43.1.bb
index 2cce40f1ef..8594db9bfb 100644
--- a/meta/recipes-devtools/binutils/binutils_2.43.1.bb
+++ b/meta/recipes-devtools/binutils/binutils_2.43.1.bb
@@ -72,5 +72,9 @@ SRC_URI:append:class-nativesdk =  " file://0003-binutils-nativesdk-Search-for-al
 
 USE_ALTERNATIVES_FOR:class-nativesdk = ""
 FILES:${PN}:append:class-nativesdk = " ${bindir}"
+RDEPENDS:gprofng:class-nativesdk = " nativesdk-perl-module-bignum \
+                                     nativesdk-perl-module-bigint \
+                                     nativesdk-perl-module-math-bigint \
+"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


