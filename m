Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E842DC3DA79
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 19:21:13 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.142642.1671132068307840906
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 11:21:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=x25le+60;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id w23so7860422ply.12
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 11:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=skQSfjDGg4wk3ai7s64SlrqngFj010lakxerTRFvwaQ=;
        b=x25le+60hc2U+GgoiKPf6lX1+YDivimVMjY5vMPEjlZGzu7PD45epjjrIgWbSrciJZ
         aGmOihUjrIhFjSX/B6mkiJ8hDR7GIbtVyUpTVbd9uwiibgwpLf3gU2IfEteT4y9Rwv+E
         ga6yI6nRXfY7IzFDRRCi0rDHP9M1pb1GG3L1UctxCIQbreCx2+maNR7PhC9Ec9H2ZDPV
         iAB0kUvxRBq8EENkjp4gikqW7QZb3Dv0FPvPGYDo2cCuePV9jYqx7hemhEllMPqkeya1
         LTrcUVlXNVGBNa6aE1dJxvA6tJOncs7bqjsbCfp0E4+Xr5PxtHCM1gdgwBTdigFiNDsF
         TXJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=skQSfjDGg4wk3ai7s64SlrqngFj010lakxerTRFvwaQ=;
        b=wYVBcbajJK9SI1zZ6TNa/1uE3pM4r9W+dcWxmRty7Fp8vZeU9BnA+eGSPthLYl23HT
         H1sBkvZEQNQR0vzkpwASxkSLpkJpCsxCOjLimnzIAOAsTviabvqbIsOUIE0TOZ2nPQAg
         9U89X0gKlLS7y5Px+aIlTQlYh312Tl421Fh5MXu6lqaAIW9UAphLFDz6wjreX81p2OU3
         ipL8a/6AmnEj2nttFWf9nlyoFVB71ZukNuqrNTAXu38uasxiiOjgz2E4UwfiQnU2p4xd
         IdUKtKhRXzcSvUhotrSTwZ33//pFqcJ6jqJbpcgGw1MJorO1fmbZKKmO8yb2BjVp5Fc2
         /UBw==
X-Gm-Message-State: ANoB5pnPW3MWkvy/25wUx2WhL2rkFf9XXPdu4EWVxwDfQQK8cqOjTSki
	yV2H7C/k73woIrFrAY4QoeCLVqq7QSifpxuYA8s=
X-Google-Smtp-Source: AA0mqf4YChX1kZUIxb1szrFSx5wxZvFgjOBKC1YzYowjMsp8pAgXJuAxaxKOEXJjS+/ycFa23hxgWA==
X-Received: by 2002:a17:903:2689:b0:189:5265:a647 with SMTP id jf9-20020a170903268900b001895265a647mr26797675plb.41.1671132067361;
        Thu, 15 Dec 2022 11:21:07 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id r19-20020a170902c61300b001869b988d93sm4167095plr.187.2022.12.15.11.21.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 11:21:06 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 03/30] dbus: Add missing CVE product name
Date: Thu, 15 Dec 2022 09:20:27 -1000
Message-Id: <6c51aa51bdeb06b4ac114d5c75d5e2d205af8f17.1671122751.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1671122751.git.steve@sakoman.com>
References: <cover.1671122751.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 19:21:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174595

From: Mathieu Dubois-Briand <mathieu.dubois-briand@hyprua.org>

Signed-off-by: Mathieu Dubois-Briand <mbriand@witekio.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 67b2db202834f1213bed3580badda2a67655ab7d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/dbus/dbus_1.14.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/dbus/dbus_1.14.0.bb b/meta/recipes-core/dbus/dbus_1.14.0.bb
index 0046b9fda2..863e35faf7 100644
--- a/meta/recipes-core/dbus/dbus_1.14.0.bb
+++ b/meta/recipes-core/dbus/dbus_1.14.0.bb
@@ -182,3 +182,5 @@ do_install:class-nativesdk() {
 	rm -rf ${D}${localstatedir}/run
 }
 BBCLASSEXTEND = "native nativesdk"
+
+CVE_PRODUCT += "d-bus_project:d-bus"
-- 
2.25.1


