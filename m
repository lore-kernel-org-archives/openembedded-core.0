Return-Path: <emailaddress.ashish@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DEADCAC5A5
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 03:56:44 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.7901.1758254186758000120
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Sep 2025 20:56:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Xp/qmEHW;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: emailaddress.ashish@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-32e372c413aso1714660a91.0
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 20:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758254186; x=1758858986; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OOQaDi9XYxiXoGfdctKhbEBUm2xZn0kGQwBouK8IdaM=;
        b=Xp/qmEHWmtK8SY9yKyWRAtsrHPtAvwvVMK7yWU07aE17wAZeL9aNyRFD/j2zWoIkwL
         Sa7B4MOD+3qtuPH32d3MP6UQqAwHsJj7xFrKPHS6W9/lCkzXwpqvfz6bcPTI7TbIBtlA
         2aM32WTtVKCwccIl0qovyq3ByLCc7FrEHMQQsRGZ32kps3Ymr0QPxMkdOLgO0sMMCA3Q
         tbvg+5dXE18dD7Y9MGWqCH9AZTn857fm7VsvWfw7HcFc8A2KZpdS8jxCLSSrVlPo78Um
         NBlLo0FSscrUFmdSEGNdCLzZ/ByPkOQJ+0DuCZw81ZScCJoPHcViwS5iBSlWB/4bA2if
         sBHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758254186; x=1758858986;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OOQaDi9XYxiXoGfdctKhbEBUm2xZn0kGQwBouK8IdaM=;
        b=Eyrvkrx0QRzCxGpTYa7QD639pI+ViwxZ9pgibpTDE9+qRGS6AfaG8RbSq1bYPP12dx
         vLaHa9bWiU1eHT2s2gpyZlCBOR2ArIuvzwBYE6wp+kQiruXRTV8gdBsMTV/JdwQQtNPt
         NrbSW/rcI4Cte9uwx3l7In/INknFSyCdZHsLh2/1kcmU/tlK8QbNxssB7f1g1avRQSJ0
         yNm/lElbAr9ObCybTinS+TFSt4tzdzNspSmHxAlNtj902iObhHxePoSRP4WuZuBoNq8C
         QDJcaTho3rOd+cUyP3vkU8EPWcIa2uqbBj4bxy/3MM+Snk9Y1H1n1pSxKOUS2smdofAl
         O65Q==
X-Gm-Message-State: AOJu0YwGrVin+RIep1sxXx+LW2Uxx+W6QxHBP81QIBbudti2OnIum+cg
	T6ldi0yRXWNVgTwreW1g7u+VnMeQfZPKFYJDGlVQ4V1Jj6i4roqWOHphVOj3mQ==
X-Gm-Gg: ASbGncvqzuiCkaRC4gLA0OpzaBAdeKdj5914xX0CWcXhRW1VAdRwjGFwgHE7AGO/5PL
	/eLjnC9KXB9tdywcc6xkHXFeDf5UBxeslYkt0WesZtZiZ/pug9zQUlAcdoKDp/gezrsjqaD/FxM
	kCMmAmYaTT9UdcNLv8208vyl8oEDe1FJ1C46S22QvXSAxiLIwPPa/PGwAsesgpMN/VIrXD96AmC
	WKmYA8pQ2Jo2LkWTfYNnOwe0WE88jQFFT2AMMXmta+w73rxwEwB0mE6aquZXrR76inhcrrQ2zCe
	l+2ePeBWcGRYOJLex7RYyxHcHOXb5d/Qxj3bhUmVRZAYKhdWiZnqueSHE+nmm2zE9tp5iyMbkqn
	q6vSvP51BqmmkJaV32pjr
X-Google-Smtp-Source: AGHT+IFSkDsFj0ZqMARu124F278BDjAxDYVFKGUdpk5kWM8YHY2Y5mq3q7F/VEtvqWesR729SrP0jQ==
X-Received: by 2002:a17:90a:d60e:b0:32e:528c:60ee with SMTP id 98e67ed59e1d1-3309834dffbmr2206987a91.24.1758254185747;
        Thu, 18 Sep 2025 20:56:25 -0700 (PDT)
Received: from ashishkumar.. ([2401:4900:1f27:b34:7f9c:b789:de11:2858])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32ed26a592dsm6888466a91.10.2025.09.18.20.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 20:56:25 -0700 (PDT)
From: AshishKumar Mishra <emailaddress.ashish@gmail.com>
X-Google-Original-From: AshishKumar Mishra
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com,
	AshishKumar Mishra <emailaddress.ashish@gmail.com>,
	Philip Lorenz <philip.lorenz@bmw.de>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH 1/2] p11-kit: backport fix for handle USE_NLS from master
Date: Fri, 19 Sep 2025 09:26:15 +0530
Message-ID: <20250919035615.6474-1-emailaddress.ashish@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 03:56:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223720

From: AshishKumar Mishra <emailaddress.ashish@gmail.com>

Disable NLS in the build when USE_NLS is off.

(From OE-Core rev: b94798ecd535956ef4565663710ea9a701ff21ed)

This change corresponds to upstream eeb3974472429a99a724f324dc8a63e435741f68
from master .
Since the p11-kit version are different between master & scarthgap
applied the patch manually

Signed-off-by: Philip Lorenz <philip.lorenz@bmw.de>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: AshishKumar Mishra <emailaddress.ashish@gmail.com>
---
 meta/recipes-support/p11-kit/p11-kit_0.25.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/p11-kit/p11-kit_0.25.3.bb b/meta/recipes-support/p11-kit/p11-kit_0.25.3.bb
index 2ede38deba..5921a46c88 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.25.3.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.25.3.bb
@@ -20,6 +20,7 @@ PACKAGECONFIG ??= ""
 PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false,libxslt-native"
 PACKAGECONFIG[trust-paths] = "-Dtrust_paths=/etc/ssl/certs/ca-certificates.crt,,,ca-certificates"
 
+EXTRA_OEMESON:append = " -Dnls=${@'false' if d.getVar('USE_NLS') == 'no' else 'true'}"
 GTKDOC_MESON_OPTION = 'gtk_doc'
 
 FILES:${PN} += " \
-- 
2.43.0


