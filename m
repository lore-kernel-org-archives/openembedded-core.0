Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E789EC43217
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 22:00:16 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.3038.1639000815528788386
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 14:00:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dpURzAIE;
 spf=pass (domain: gmail.com, ip: 209.85.221.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id v11so6456558wrw.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 14:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZxqveqrwC31WWYRjaV85JIXa5OqKDYz6CyzuZCNz7+s=;
        b=dpURzAIE7bjNmA1XsaZla5hpBk1vNLWqK3tpLLHHsdRd2bo7drHCS3etKFfRRIEjpe
         gjtAvn/B/eGqyXml9k2thSsJwYOaUI22Phlq494N8ZexW968YHvX4iphAVi+oZfzWnaC
         F4z8HtuU3NJ7fBD4mXEajUU2jp/5ueKWknb352yDBAsvtlPg03YacIni7xQgmQrG5uqQ
         2tFdacIC/5VgJHBBw3EriALeu4zLXKAj9v5cNr2fGXJZNmGDqJGf7DwfAtp6cXROQH1l
         57iX2TvMUleSNKGtsrLvrYkW+6QB9pN0XQi4LCWcCLB/in2DuGZajnCmBs4xQ3v2oK4e
         bBkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZxqveqrwC31WWYRjaV85JIXa5OqKDYz6CyzuZCNz7+s=;
        b=zCSBeyO8r6hwOj3nb7FIJci12xEcHrAMXPM9NqoSW95isUspLkRahSjpLHPBNFrLqF
         j8pN8tqzDoeFGY5OP8uquDK3OinBsTLKRQpB02EMkRn/C1Hwm673LWKV232HogMPSI4q
         kexorTH+or/z1pA+PW3mIvriLxiq0fBE4COAJ/pBKqrDeGAbUrqED4j77t76IipDhFXt
         E8yX72Sl7wNTII1rVGSoTXxtAtzM+toflkLG6lR/AsJ+PousNfE8ltEGvsiqrdlMVJvp
         kpirgT4x9sZqkIgHVouwEDqmICSBg14frsFpay7RhME26sbj3RoFlI15cz5cbc/EfB5M
         Nbhw==
X-Gm-Message-State: AOAM5314kyJUPg57Wjl5qDPKD/Fo88KpsDpGDAm8xzfVWSfo4OL1QfB/
	X5pQ2xRLfHTrIBAFc2jy1jZKXbs8E6GBXw==
X-Google-Smtp-Source: 
 ABdhPJwwHe5IAG+W9U1MsJvXq7xlt+7LsYoj+v/UPRwtXNP8YwAAFzSfemA9nmVr6Fd8C1XcjxKRFQ==
X-Received: by 2002:a05:6000:1a48:: with SMTP id
 t8mr1653311wry.66.1639000814169;
        Wed, 08 Dec 2021 14:00:14 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 c6sm9177170wmq.46.2021.12.08.14.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 14:00:13 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 25/29] enchant2: upgrade 2.3.1 -> 2.3.2
Date: Wed,  8 Dec 2021 22:59:43 +0100
Message-Id: <20211208215947.1979470-25-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211208215947.1979470-1-alex@linutronix.de>
References: <20211208215947.1979470-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Dec 2021 22:00:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159391

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../enchant/{enchant2_2.3.1.bb => enchant2_2.3.2.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/enchant/{enchant2_2.3.1.bb => enchant2_2.3.2.bb} (92%)

diff --git a/meta/recipes-support/enchant/enchant2_2.3.1.bb b/meta/recipes-support/enchant/enchant2_2.3.2.bb
similarity index 92%
rename from meta/recipes-support/enchant/enchant2_2.3.1.bb
rename to meta/recipes-support/enchant/enchant2_2.3.2.bb
index 72603045c8..c7b6504a40 100644
--- a/meta/recipes-support/enchant/enchant2_2.3.1.bb
+++ b/meta/recipes-support/enchant/enchant2_2.3.2.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0"
 inherit autotools pkgconfig
 
 SRC_URI = "https://github.com/AbiWord/enchant/releases/download/v${PV}/enchant-${PV}.tar.gz"
-SRC_URI[sha256sum] = "7b4b1afcf2cd8bfa691deea6188404d337f23174bbc39b9c2add2bf340736e9c"
+SRC_URI[sha256sum] = "ce9ba47fd4d34031bd69445598a698a6611602b2b0e91d705e91a6f5099ead6e"
 
 UPSTREAM_CHECK_URI = "https://github.com/AbiWord/enchant/releases"
 
-- 
2.20.1


