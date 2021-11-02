Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76455C433EF
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 08:43:13 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web08.6566.1635842592461759411
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 01:43:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=T0yn6voO;
 spf=pass (domain: gmail.com, ip: 209.85.128.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id
 g191-20020a1c9dc8000000b0032fbf912885so1481047wme.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 01:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xW+M4TUPhO+OipKXaCYDvACSBLyTvm1ZoyuQcKXSQZY=;
        b=T0yn6voOn71u3BIG60aoJthEi176nqFRrpT/xqbXLUla6nLb2nXVMeWveYKPTPv+pP
         IpHVaKa+SP5LByOkjty8yxJkvd6LyPQzyK+TcNkYS7GG4l5wgVrmUyE5kP1Y9utGTNYp
         kiy+PWIOVEuzNlZ/AxMaKX1Ja3L+eShEdQBwr/RKRC4kwHM1h3YoEl5uE2j55NmESi/m
         aqkaEoXSbxpRIjb/SaH1O04yIcq3RtePWCMc5grBomH6pRSpETLiYiF8XvhByl6xe7Aj
         Q7jgSe3Gzto9UegiykaMJK7ADHnFFaiNrdhSUUL9c8HbbE0n8XhsA9RYvtm3efwXUXMh
         QkrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xW+M4TUPhO+OipKXaCYDvACSBLyTvm1ZoyuQcKXSQZY=;
        b=5KRflsWOTjklckaDhGzUQiRfINWlFAXtoFHdpRnU6oCs0yEL6baCdi5G8Rp/Bg0bhd
         sYBlkMJd357+TIgU39Z2oqTUN3RYtmETKJ926CueFT+J6WZMteB2aJSVXoeE+gky7L+U
         R6zJZe1evQsfrQK3fLX4CoKCDGDa2ABxvj8m8fat2eh9bekVmvMlOz/YSS8xDFnSjwLV
         w2LXCkrohsqa2jwkCUxO8ZvxZniCqXYpCpgYTMfcwXV89kkAtMgK/iDMokGF9keaNF5Y
         NgnK7IoKjvKosn/xyQrzg4RluaYguA4YbSAy/1pf8rgaF53M4y+vOa6X2JBAz8siv9p+
         9I1w==
X-Gm-Message-State: AOAM532E7pEJFYcwts3AEaUAES1bPn2tq/1jo2/Zi8Ku5GbSfPYLFkg+
	OyOFlahdsFSySx0jr/6+8VCMHcr3YCc=
X-Google-Smtp-Source: 
 ABdhPJyRE1dG/l8kh6A5BJqoIYJ/6hVSi8K3xQSfLjzMoYb7Byn4d4uD5JYDphmRmDwny76mw3TCVg==
X-Received: by 2002:a1c:8:: with SMTP id 8mr5237409wma.106.1635842591077;
        Tue, 02 Nov 2021 01:43:11 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 v191sm1761890wme.36.2021.11.02.01.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 01:43:10 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 10/33] vala: upgrade 0.54.2 -> 0.54.3
Date: Tue,  2 Nov 2021 09:42:40 +0100
Message-Id: <20211102084303.2974802-10-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211102084303.2974802-1-alex@linutronix.de>
References: <20211102084303.2974802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Nov 2021 08:43:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157748

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/vala/{vala_0.54.2.bb => vala_0.54.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/vala/{vala_0.54.2.bb => vala_0.54.3.bb} (50%)

diff --git a/meta/recipes-devtools/vala/vala_0.54.2.bb b/meta/recipes-devtools/vala/vala_0.54.3.bb
similarity index 50%
rename from meta/recipes-devtools/vala/vala_0.54.2.bb
rename to meta/recipes-devtools/vala/vala_0.54.3.bb
index faaf76148d..d3390b2ea8 100644
--- a/meta/recipes-devtools/vala/vala_0.54.2.bb
+++ b/meta/recipes-devtools/vala/vala_0.54.3.bb
@@ -2,4 +2,4 @@ require ${BPN}.inc
 
 SRC_URI += " file://0001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch"
 
-SRC_URI[sha256sum] = "884de745317d4d56e4e8cede993dc8f04d50cfca36cf60d2f2f278c30c2b1311"
+SRC_URI[sha256sum] = "ed1d5fe4cbc0cd2845d0de4f1ffefb15afb06892d230c7cca695781672e8fb60"
-- 
2.20.1


