Return-Path: <dpmin7@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94AE1CA0FF0
	for <webhook@archiver.kernel.org>; Mon,  1 Sep 2025 08:08:18 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.46380.1756714098160399863
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Sep 2025 01:08:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gwMEjNsA;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: dpmin7@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-248de53d12dso24048335ad.2
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 01:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756714097; x=1757318897; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VAzsND5v6Qw2P353ridXmFzWsAr360g311EBhkZrwBU=;
        b=gwMEjNsAg1Ry277GOV+5UELMcvkKE7FuM/PbGwSWzNgt7li6TQ9UgzuDxJOYpjANSu
         OG82mWGGjYbJBVrVovhbkGonUWFR8oYK5zNjQKKPQMF2JDVAqXIPkD/IXy5K6tvp+UJ/
         +scyWQ7/rojKjbqCSeUS6o11R6xgGQC8m36brJJD87CKZBJ07YXh8J8SaTDJNxwqq+XG
         KMCKlNPUrzR7kmtXFrPNv0S/qvfNIVnCIuu+b1jLjuuezYX2svovsZeP9qx1ERzhztP/
         QxnZAhCKUeiotpk5B6YEZ1upAkbeq1d5ZQSkFN1iR1c1qQ1xwF2GEJ+71sZtYJQHe9aE
         Fm1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756714097; x=1757318897;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VAzsND5v6Qw2P353ridXmFzWsAr360g311EBhkZrwBU=;
        b=JE53/cRan/5V9rk1FdL0hZiXr068/6YYwD2dinGVcaB7CFcqSK6iQnEk7kfJQm0voi
         3HXL/9a7GYC/uN/J85mPKXZLLpWimjFs5d8AquD4ZzT1iZn5Qo+/1WRwouLaA5XGVn3n
         ENUXkmPRw5GblUfQ0qfXCIUrDgGB2dLt7ryGvmI1qtSSUY/WwMkI15k8b2+vsK2hdl2+
         lAijz5xMhrysbMVABKx1QGvnfvdSZh02/30TkzWW7eY81Q4oy0ugmQOFtO0EE5DZwTsM
         KjZ3DZ2/YzjrwAnJPbkQJYT2i6NK0rhD62anrSeyuZqIHd/1FMDn7KrEqHBSvKUJ6Wx8
         bLgA==
X-Gm-Message-State: AOJu0YzJ0H9EbKE/AaAL9ZGIMZ2T09Qjf5Mi7dharEW9i9AjF2fPv73H
	HwgRMHqaQdlLs+SILWWTuoVnu1KI+FqVrOyZf21ABW9RypcZc2CZ0sB+R1mAGw==
X-Gm-Gg: ASbGnct4VbdV3QZerG55Aw2dbUeu4+Y+TT2MtAiEfXKlqfscVwV7QxPqQmuhSsPnHyr
	y5mSC75xStMmAKEZS8Yng0FR7PZOwP6+5wUVMrmSTpsuEpGIRauVxCj2Ca1OmjuYXHfOpndvsH4
	fQ6BVvQ/89RlQIXvoq7H6epkLfm6VkeYy0maC4bK7i6yhuizbTDBqrMqdyU6j0GFDPZGbvBmJHj
	9NG8b8LJyPDkIdJXvfBC3AVkT1be09d44VVolKfqS4nFuWPEuHMcZQAk6OyynwSoPSYtD4iGuki
	S99wPT7fpMs/QCW23/ElzUTfpWsze9OrwLxSoETUQNcJAsO7zcGIOPRitoQ96M08IAbhUxG1Beu
	CM53LFdS4kFc=
X-Google-Smtp-Source: AGHT+IGOUjhUhduA9bJ17v9OFUOaJZXrRdRIYd+Qyw7EZUOgKivGalsQstqAnWZf8OYdvnyLqtcKsA==
X-Received: by 2002:a17:903:1a2e:b0:249:2cef:1d08 with SMTP id d9443c01a7336-24944a98422mr101736535ad.31.1756714096885;
        Mon, 01 Sep 2025 01:08:16 -0700 (PDT)
Received: from dpmin-PC.. ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24906395cfdsm97097295ad.101.2025.09.01.01.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 01:08:16 -0700 (PDT)
From: Kyungjik Min <dpmin7@gmail.com>
X-Google-Original-From: Kyungjik Min <dp.min@lge.com>
To: openembedded-core@lists.openembedded.org
Cc: Kyungjik Min <dpmin7@gmail.com>
Subject: [scarthgap][PATCH] pulseaudio: Add audio group explicitly
Date: Mon,  1 Sep 2025 17:08:10 +0900
Message-Id: <20250901080810.897360-1-dp.min@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 08:08:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222647

From: Kyungjik Min <dpmin7@gmail.com>

Since pulseaudio-server requires the audio group, we explicitly add it.

When use useradd-staticids or do not use the default group in
base-passwd, an error will occur because the audio group is not defined.

NOTE: pulseaudio: Performing useradd with [--root
TOPDIR/tmp/work/cortexa72-poky-linux/pulseaudio/17.0/recipe-sysroot
--home-dir /var/run/pulse --gid 998 --groups audio,pulse
--no-create-home --system --shell /bin/false --uid 998 pulse]
useradd: group 'audio' does not exist
ERROR: pulseaudio: useradd command did not succeed.

Signed-off-by: Kyungjik Min <dpmin7@gmail.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 1ab3831519..a93ef8f338 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -146,7 +146,7 @@ do_install:append() {
 }
 
 USERADD_PACKAGES = "pulseaudio-server"
-GROUPADD_PARAM:pulseaudio-server = "--system pulse"
+GROUPADD_PARAM:pulseaudio-server = "--system audio; --system pulse"
 USERADD_PARAM:pulseaudio-server = "--system --home /var/run/pulse \
                               --no-create-home --shell /bin/false \
                               --groups audio,pulse --gid pulse pulse"

