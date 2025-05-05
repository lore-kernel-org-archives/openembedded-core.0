Return-Path: <emailaddress.ashish@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF805C3ABB7
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 09:06:35 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.46259.1746435994949190435
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 May 2025 02:06:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ftcTgGKt;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: emailaddress.ashish@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22c33e4fdb8so40919915ad.2
        for <openembedded-core@lists.openembedded.org>; Mon, 05 May 2025 02:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746435994; x=1747040794; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3/EkaZoqweWApJSgy4y1hE4cEDUiDlLwmBU9HWXKOUE=;
        b=ftcTgGKtk8X/+LZBuz3avUk34hXDSLJui03TjJLwxEEQFG+IcnR82EBTx5s8mmBOGZ
         0ctd064T5onDBEG2mn0PJ3hYMqsoduvt4QvmqtxV2BUsq/GLEatApusjZ8y9y32Ene8+
         c72KcSMzlUHafW+InhQ66FnyroXD6RAjIF8Fea/5e4pc2yi5s6Ri6avHWzVGBjnlJeQM
         tS/zhbPaaqUFPmoEtq1xs2ublHQhDGG3ooRIOOa3vQ0efqTublPZUQ4kdzKsTkT8nej0
         JK+idSbV3zWLP/VTQR2KbnnhRXAJ6aeW5le/C85gae12IrwGgJE1oCf+wHIxzPUxnRtn
         h0KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746435994; x=1747040794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3/EkaZoqweWApJSgy4y1hE4cEDUiDlLwmBU9HWXKOUE=;
        b=dMq50OXyIlnFdTzMvKY+a8I+Bf26CapXChMiBJbbZi35JpgP938sYEtrz2S+mQ4C+n
         mhRlvUlYR2vl35BcZsmRNLN+ce0TOyjtss2enX2xhke1di0m26Zds8GiznhOLbr25Z9R
         ANoVcgDNDh0djAM9Hj1kQLDocID1ZL9lo6NGVJs5/ByBVee/tV5rN35s5DGM/KIoFM5v
         1NeAJNVi+CK8K3p8XjFE/JYKppwvgXoaUkkahnKyC9O31y8uOp5dj5o+mA6F6ovJVLB6
         D5VuLtFr3ZMAayfzW0f5Y5ncpAMJd06l4EtxcZIdtmyaNArqMMJ7DVHN1r90w7W3v+Lv
         G7Rg==
X-Gm-Message-State: AOJu0Ywn3SPO92oVVPs09P6zciFf+aYBu/5CmicyR5jiI0DSYcjtYsEb
	M7l6T898gT5bBTmpJHTRqFOXrbSmAb93TVvBUvgUE2kZHj2wxMLPhmy/kw==
X-Gm-Gg: ASbGncuoXIGUlPhKKGAZoQP1J8LPmnlfygZPvTpYji8Ail/ahHSds3knv4L0Piz4U9X
	2/OaKNz7yen0Ei3L+bS78vrYk3fmV2y+4qMORsA/v4NP4MLFKi7AMNnW7JM2/Zxg1747oF5J6xz
	tYc5jE2XxqzDz9T+KdZ9ucpPxyntWpzSSby388CgEH9grW3dxsGe0zBL4kWF0697xE+axE7iHx4
	D9DyhPwDmnJWEdUt1zJOnLO1dCWsualaCMGGhlpLb+Dsx/PHcHgVM1K8AtAymrj3ctZ1T4WpcqY
	Djv4xuHd7TspEIPT3T9eX8y71hpJpjWyDvQ1UUhhncCj2p2aKuaF
X-Google-Smtp-Source: AGHT+IH+TyhaQpjVwst9WGfBIQEJfI4eTlkwEpR3jTffWOfc6XWCfYl1v0KzgY2IsMXvh4n/n51OGA==
X-Received: by 2002:a17:903:2412:b0:224:78e:4eb4 with SMTP id d9443c01a7336-22e1ea6da9amr91403735ad.39.1746435994105;
        Mon, 05 May 2025 02:06:34 -0700 (PDT)
Received: from MVIN00210.. ([182.74.28.237])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e152290efsm49698595ad.190.2025.05.05.02.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 02:06:33 -0700 (PDT)
From: Ashish Mishra <emailaddress.ashish@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: henning@itconsulting-heinold.de,
	otavio@ossystems.com.br,
	Ashish Mishra <emailaddress.ashish@gmail.com>
Subject: [meta-java][PATCH 4/4] Updates the SRC_URI for fastjar recipe
Date: Mon,  5 May 2025 14:36:13 +0530
Message-ID: <20250505090613.818330-5-emailaddress.ashish@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250505090613.818330-1-emailaddress.ashish@gmail.com>
References: <20250505090613.818330-1-emailaddress.ashish@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 May 2025 09:06:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216000

Signed-off-by: Ashish Mishra <emailaddress.ashish@gmail.com>
---
 recipes-core/fastjar/fastjar.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/fastjar/fastjar.inc b/recipes-core/fastjar/fastjar.inc
index 8412236..97e79bb 100644
--- a/recipes-core/fastjar/fastjar.inc
+++ b/recipes-core/fastjar/fastjar.inc
@@ -7,7 +7,7 @@ PR = "r1"
 
 DEPENDS = "zlib"
 
-SRC_URI = "http://download.savannah.nongnu.org/releases/fastjar/fastjar-${PV}.tar.gz"
+SRC_URI = "http://download-mirror.savannah.nongnu.org/releases/fastjar/fastjar-${PV}.tar.gz"
 
 inherit autotools update-alternatives
 

