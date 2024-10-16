Return-Path: <mail2szahir@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E704D1AD43
	for <webhook@archiver.kernel.org>; Wed, 16 Oct 2024 10:22:36 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.19566.1729074134908802540
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Oct 2024 03:22:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XaJaBKVn;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: mail2szahir@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-208cf673b8dso66879405ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Oct 2024 03:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729074134; x=1729678934; darn=lists.openembedded.org;
        h=message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DHNhO4+5mzaZMXcA1yoRS34ZAx5w35geiiR/NcImBvo=;
        b=XaJaBKVnsdKYGRDIZ9PH/W4ccNMNpLOMlWdmY2+46HfzhBs4HhDYS4aNF+aupRXnbS
         vdsy4pjPm+6rAKZagco0oMpIRkWo8t7GESJxDvxd/K1+znsOksMQtx2rtQ1ci777PrZF
         vlBz+RfiP0KPuQiUaMTFWXrxp/HDg3Bc4EV02tz6Ka8AN8iHn3kSpkDJu1FN2+tP+pPw
         7uIV5EA8UvUDlzbwKnPQV19jNGCVXt+na8wuhMmPV7ymJzvkSlrbBf+dFWwlANVYxVuh
         QhQux9+R9TTD0DUmgOFIZLryFfdfQRQeXjCFxwom0mQQsc2ttDHP4pCZkkg7fdruoE7P
         DpNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729074134; x=1729678934;
        h=message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DHNhO4+5mzaZMXcA1yoRS34ZAx5w35geiiR/NcImBvo=;
        b=NTEfWftmc7/cOhSSNU1oSmxYyF6sOa902z13mTkZqSkVq3Kea/D3XDueXPBD1i1vWy
         9SkJWeRzXfo6heVycvxsQZIesFRZVY/Qyr6A+50BgqQcBZO1GifuEnpVM6vJLqz0Xl6l
         t8/QyVmZm5oCCEKxu++sfg6EhrCD0sG9EQmZUjcYOYzFUnn/WSf1qJUmxsXKgiWyqUvN
         20VNBpcc5CnRhsWWwbfEGwHogr2OxZKKgLk7/RKTRiwu7AnF0CQPNpOHLK1Cev3loZyO
         Evrv72ARmIJRZpjuEHNe4zKkSinfc6+Qz/nH3CzeLZa2yKUT7vqUXHWr2unKxaeAQxYn
         7p2g==
X-Gm-Message-State: AOJu0YxL3921lmnxgf+4l3kTWkH5pzESBY0zqvonbiYp1tKJXkSDtWc/
	pyatAB1Ht2HldmjVajv1QZINu47Jsh3lOWAcNxhiAJRE7v0uicarNIrTow==
X-Google-Smtp-Source: AGHT+IEkplwmHQyktxlu6WvimhCdvCWBsGLt/zAwbMrGNIiDcDwkdvq69pEiISH9mTQVkoFX51HXpg==
X-Received: by 2002:a17:902:d504:b0:20c:af07:a816 with SMTP id d9443c01a7336-20d27efc3e6mr47195125ad.31.1729074133975;
        Wed, 16 Oct 2024 03:22:13 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:e02e:c09b:5488:e10:6781:7d0e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20d17f87ea3sm25856895ad.26.2024.10.16.03.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 03:22:13 -0700 (PDT)
From: aszh07 <mail2szahir@gmail.com>
To: openembedded-core@lists.openembedded.org,
	zahir.basha@kpit.com
Subject: [OE-core][scarthgap][PATCH] ffmpeg: Add "libswresample libavcodec" to CVE_PRODUCT
Date: Wed, 16 Oct 2024 15:52:01 +0530
Message-Id: <20241016102201.27566-1-mail2szahir@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Oct 2024 10:22:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205963

Currently, CVE_PRODUCT only detects vulnerabilities where the product is "ffmpeg".

However, there are also vulnerabilities where the product is "libswresample",
and "libavcodec" as shown below.
https://app.opencve.io/vendors/?vendor=ffmpeg

Therefore, add "libswresample libavcodec" to CVE_PRODUCT to detect vulnerabilities
where the product is "libswresample libavcodec" as well.

Signed-off-by: aszh07 <mail2szahir@gmail.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
index 13051f4e36..84bba3b7b6 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
@@ -194,3 +194,5 @@ INSANE_SKIP:${MLPREFIX}libavutil = "textrel"
 INSANE_SKIP:${MLPREFIX}libswscale = "textrel"
 INSANE_SKIP:${MLPREFIX}libswresample = "textrel"
 INSANE_SKIP:${MLPREFIX}libpostproc = "textrel"
+
+CVE_PRODUCT = "ffmpeg libswresample libavcodec"
-- 
2.17.1


