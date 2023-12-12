Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 329C9C41535
	for <webhook@archiver.kernel.org>; Tue, 12 Dec 2023 14:28:12 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.2836.1702391286835789189
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Dec 2023 06:28:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=k0ZW8Fvo;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6ce72730548so4943587b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 06:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1702391286; x=1702996086; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wwf49Wt6NhpJsxtUIs2dYij3wBWgCkysuu++EfUpvPU=;
        b=k0ZW8Fvo+C+krSgwJrFEvxaz5mFX22DegLRfVaCrVVZ0By9ci7hAnlCCB77rJoARfZ
         ti5XKf3ABDkypKr1Dm3k6Cm+vFpMgXjj5nhVFCf9v4tqplDId2RPMS4EfMSGvKm/k453
         VoKK++IG9NZ/stoOYeBvUIyQemyEOemjJdcAb0mF+Ubqrg0X/X6s7lXoGWJ966ePk4ng
         6HmEAuKaSKdZ/zDdj0rvISkkq+HJ36+vS210ypZDvwoigPL0/tt0M5Dkw2yR/8ox2JCe
         8tFzS9Za6pQPfykq9sU0D9xp04yKe6Ht5Ch27cSYAZZ4S/Wg6n8L0soyIdkCyR6hx8wz
         y05g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702391286; x=1702996086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wwf49Wt6NhpJsxtUIs2dYij3wBWgCkysuu++EfUpvPU=;
        b=iyYNWnFf1kvnHDq9GnhK462XtLYxNHScLNV3JcNMmJvAnw2tjln8uEfGh2KBanrFJJ
         PEdctXkmem14vM/Ew3R4CcVU0V+dJVydvwwDtqiqaY+EBKgsRpZRwnMssX6ndQYIBNxe
         FtW5nkfWur+ql2mU6PkhAYZHzgRmgRQHGC8QbZyqJ2eNxH0Ar0afECSHZCoitie0GUCg
         bJ1FGkzXTwyJR3rQa9BYTuQviuTFWYSYob8dRdjQhYn3Z5eMsptDuBBtNLa5ZBUg/Wqf
         328Zk14Ebkp73cYCJcMoFHUnHJZN0vwf5KV5MfBVBaDXUDF1UFKaDo7bTRyj25T/Gwkk
         ZMYg==
X-Gm-Message-State: AOJu0YxJGZUKl4S2u8dQBdMvb2Ju2KWg06VgsJM8rjw4R5qC2wy+Fy28
	QhbFTcwOT2G07BXDl8hvtKxM+GenPVV7okO5Nus=
X-Google-Smtp-Source: AGHT+IFFzjgRLAcUL3qIh+iztHQiwYC4hTbbnl81fmYYPccnv1MHSxu13K6ZAWcnSAOGkaSLhRjynQ==
X-Received: by 2002:a05:6a00:17a1:b0:6ce:6d8b:275d with SMTP id s33-20020a056a0017a100b006ce6d8b275dmr6852384pfg.20.1702391285957;
        Tue, 12 Dec 2023 06:28:05 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id n23-20020a056a000d5700b006cbb40669b1sm8188928pfv.23.2023.12.12.06.28.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 06:28:05 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 12/29] kern-tools: bump SRCREV for queue processing changes
Date: Tue, 12 Dec 2023 04:27:18 -1000
Message-Id: <5a57d0e451dc24e7ec4effa41c32812f1c5edc89.1702391115.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702391115.git.steve@sakoman.com>
References: <cover.1702391115.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 14:28:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192216

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Bumping the SRCREV to pickup a new option to the patch and
merge queue handling scripts.

The new option '--prev' allows us to change the behaviour
of a subsequent runs to retry a failed patch, versus skipping
it.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 231256485ae528773a4da9fad8bf4baff26fc0d2)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index e109cd7454..e4b5eea659 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "\
 
 DEPENDS = "git-native"
 
-SRCREV = "270f9ccc5e2998cd1f3ed1e32d02e356793e4680"
+SRCREV = "0ae81fdbb1ae1546371206aeb3f5fb530dff8ddc"
 PV = "0.3+git"
 
 inherit native
-- 
2.34.1


