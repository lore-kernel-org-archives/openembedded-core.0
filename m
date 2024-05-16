Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70C6CC25B7C
	for <webhook@archiver.kernel.org>; Thu, 16 May 2024 11:26:57 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.11210.1715858816135144505
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 May 2024 04:26:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DSBaOMZs;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a59b81d087aso268725366b.3
        for <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 04:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715858814; x=1716463614; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sSMrn0NH9XUGVDEzcmc6ZVwsu68bBEEU9pkp8eTXDME=;
        b=DSBaOMZs2KKH2DdvISC3THj3DJfUwa+WNrL3c3VCuXTQ9y9Oe28rtkulINzk5pEUyH
         9/olCkVevBETaqrYwJacq2VxtXpOcZo6nt5+i3SSda+dXkmhgA5Jwy9kAuDuPZY31bR5
         5aiUCLS+Nvwmt3gFF8/Aeg53VZE97AY2HxoQCBfRY34P2nxJqeV4hIJStwYrgcl8Rxs/
         517njAbdvrMyrsG7nG7XYPb+9/urm3rgoIRI58KfLIhqC9UeJKoCvYJ2RSxNOZA7O9Zn
         qwQUOioP0jRJaqaky6h/BpeJOPCldVt8Vr6tM6f8grMCfuNX6io83rAdNnOyzWtVBwEc
         OOOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715858814; x=1716463614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sSMrn0NH9XUGVDEzcmc6ZVwsu68bBEEU9pkp8eTXDME=;
        b=SYGeOwWSlkPTAjIqDJhQnT8dYD4o5OqLjXDDcEXwYFerRoAOihVAjjDZDK7Q/YkBBh
         mePajfoOqqVWUwxxHt12rRBDgr76VN7pSdR2pPVyRiV2ghMY3gOqWmZXK0jluBH1qtdi
         Rkb8apJ5YwAKD/WYvezMtcKLCz4/ho/irjlFF3IysZsrEruV+fY5QW2j7HGO8AXHX57e
         jrCysphJO27kYb5LBaf9Geox4TFd6uqzFxfnHW/G78iUboesFVF+YhbLK1qsRunW/Bzq
         4YJ7SHyBOiMgcbVUDlzygpxzydsMbmvm0xVy3TtyRudbeySh8KNsIL2cU4PT48keGFU1
         QMRg==
X-Gm-Message-State: AOJu0Yz3WgXqO7eZakQ91ZcvdpBw5P63cw67r3nYFCQDgqWXdfum57NI
	guCS730gJsEipQb9OPvoR4yl7/NdQH9kTyRA4rZhYzd1RpCc1QNzoZE4oQ==
X-Google-Smtp-Source: AGHT+IHJbqA83dTrxYuP72V9RM1P+AbKLR6Ziyw1twyuhWp3BLdlSHVj0D/FnCo9b3UTq2pJxKcjig==
X-Received: by 2002:a17:906:66ca:b0:a59:c2c3:bb4c with SMTP id a640c23a62f3a-a5a2d675a9dmr1631974066b.70.1715858814318;
        Thu, 16 May 2024 04:26:54 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17b18110sm973898366b.225.2024.05.16.04.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 May 2024 04:26:53 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 04/13] vorbis: mark patch as Inactive-Upstream
Date: Thu, 16 May 2024 13:26:31 +0200
Message-Id: <20240516112640.2145789-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240516112640.2145789-1-alex.kanavin@gmail.com>
References: <20240516112640.2145789-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 11:26:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199471

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libvorbis/libvorbis/0001-configure-Check-for-clang.patch    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/libvorbis/libvorbis/0001-configure-Check-for-clang.patch b/meta/recipes-multimedia/libvorbis/libvorbis/0001-configure-Check-for-clang.patch
index b06029b98b7..d4fac605b66 100644
--- a/meta/recipes-multimedia/libvorbis/libvorbis/0001-configure-Check-for-clang.patch
+++ b/meta/recipes-multimedia/libvorbis/libvorbis/0001-configure-Check-for-clang.patch
@@ -5,9 +5,9 @@ Subject: [PATCH] configure: Check for clang
 
 Disable gcc specific options if using clang
 
+Upstream-Status: Inactive-Upstream [https://gitlab.xiph.org/xiph/vorbis,https://github.com/xiph/vorbis]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
-Upstream-Status: Pending
 
  configure.ac | 19 +++++++++++++++++--
  1 file changed, 17 insertions(+), 2 deletions(-)
-- 
2.39.2


