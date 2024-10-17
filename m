Return-Path: <mail2szahir@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9928D2F7EC
	for <webhook@archiver.kernel.org>; Thu, 17 Oct 2024 05:32:22 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.42016.1729143133740563250
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Oct 2024 22:32:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CufzcSLj;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: mail2szahir@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-20ca388d242so3941985ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Oct 2024 22:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729143133; x=1729747933; darn=lists.openembedded.org;
        h=message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xpcsrxRGMfaS7AGxohnT6hMKNTrDZ6TAlxK0pgEj15M=;
        b=CufzcSLjS6k2ntN01q6x8tbMPf//sSqYTovYhOrfz47+X3GiXAMIZ2XtzLC3FKntde
         CAGZ2AQjvyU6xpo+ykzITuPysJ2PxE3DriIQhKskauqmnZ/kLUeTyaVRD6chIOp/bTyK
         vFwFxVcD2jd5IqpyAPoZGbkL4xlyJv4RQ/fGJnR4NZnpujMkL1gSZ9K+BN6EQ1qGzYGI
         54YtOxEwkxviZH43U+ooBrSpErWNvOu+TquJ4Rzj2Bmra/GWMOupaSdNENENukj5QrwQ
         /jRDsUpCp6J6H0NsYRnV05zI4Ksn0XACyAKvdLNlh/1bUCxkROq5IEVpjTv9s4+aD9LE
         qEdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729143133; x=1729747933;
        h=message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xpcsrxRGMfaS7AGxohnT6hMKNTrDZ6TAlxK0pgEj15M=;
        b=QHqmuRRaRB3iGWq0KSYShOruQ/h8KSPtFx5/iFSLqPal/5PxEyiExUEVYudvp1CdTB
         wW6NPyurc0OjryhUx0So9RsO0v07nFKzkw86FuJKgyM81mwybAyeBWXVaL5M4xhZ/88q
         oZpffszZRXkidVeph3ZC4EgfMblWxuNFePHQ014aFo1QypKu+wRDeUkSpN5DylncII+i
         Ynk5XhRp8qX1gO5rwIniqQ1uGq0scLRjHyeUbLFlYpq/gUUM87DTLQRenxQW1ovu56T0
         Ruv5JNN5WCzJvEZ/QGplYLrfrLhFPgL+5L4srokBte/xQGvD+whkylPYbaaFg7dkkYzi
         0M2w==
X-Gm-Message-State: AOJu0Yzt1U9l+Qle0RK/z23wjkJyTVb/kN9BVWS6IBk8GkMYO46rnu1O
	u3X/p9w2W/f2EqoYUMjsVkcfPxkTr8UtWx67SFJrN0kuO/KThi/zfQDDtw==
X-Google-Smtp-Source: AGHT+IHTfan+ljuFvwUgF3wqTKW4ap5X2nlz1DLlWrZzK34Y+69G8iM/kXY50JcRJXS1QzGzjvMvpw==
X-Received: by 2002:a17:902:fc50:b0:20c:8c0f:f986 with SMTP id d9443c01a7336-20cbb1a91camr248633085ad.24.1729143131380;
        Wed, 16 Oct 2024 22:32:11 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:e02e:c09b:c9d9:c3ae:a2fd:5978])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e3e08dd7b9sm886658a91.34.2024.10.16.22.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 22:32:10 -0700 (PDT)
From: aszh07 <mail2szahir@gmail.com>
To: openembedded-core@lists.openembedded.org,
	zahir.basha@kpit.com
Subject: [OE-core][master][PATCH] ffmpeg: Add "libswresample libavcodec" to CVE_PRODUCT
Date: Thu, 17 Oct 2024 11:01:42 +0530
Message-Id: <20241017053142.21353-1-mail2szahir@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Oct 2024 05:32:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205982

Currently, CVE_PRODUCT only detects vulnerabilities where the product is "ffmpeg".

However, there are also vulnerabilities where the product is "libswresample",
and "libavcodec" as shown below.
https://app.opencve.io/vendors/?vendor=ffmpeg

Therefore, add "libswresample libavcodec" to CVE_PRODUCT to detect vulnerabilities
where the product is "libswresample libavcodec" as well.

Signed-off-by: aszh07 <mail2szahir@gmail.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb
index af66104ebf..4a7d67ea09 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb
@@ -181,3 +181,5 @@ FILES:libpostproc = "${libdir}/libpostproc${SOLIBS}"
 FILES:libswresample = "${libdir}/libswresample${SOLIBS}"
 FILES:libswscale = "${libdir}/libswscale${SOLIBS}"
 FILES:${PN}-examples = "${datadir}/${PN}/examples"
+
+CVE_PRODUCT = "ffmpeg libswresample libavcodec"
-- 
2.17.1


