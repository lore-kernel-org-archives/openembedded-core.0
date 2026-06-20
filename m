Return-Path: <aleksandar.nikolic010@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA1EBCD98E4
	for <webhook@archiver.kernel.org>; Sat, 20 Jun 2026 20:57:56 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13412.1781989067757503604
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Jun 2026 13:57:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=miEcSi0k;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: aleksandar.nikolic010@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c0115a3794bso596151566b.0
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 13:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781989066; x=1782593866; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bkxn2Znq2suCWvs5gQQmuU6unIucXZfSrKAjh9DnHZg=;
        b=miEcSi0kiK2xSh0kVOtK9VIqVoK1oKoUdj01J6bLKbNmnNuOGzrfXR6GZ87Vb2usYo
         YQYv/3XRGc/mKFvVX9JtBDN520InvmV+6NeKQ3vVG/ZwG/RCFRSSkR06amwlo8GWvcvF
         hPuKJHuu7HsB1+yCqeBPHlTmKJacnNx0w0wqINKr+NyZLdUI+K5p2A40/8+nJkO+Lcbg
         5qX6CIgqBGCBW7LRcv3gMZ88ST7wC0XNpk+LXoYfJGf5kB5Xp46KJPDvyOIxpcJIYhP7
         6ScLDmV5YQVOI6F82AKPkY0RN2PE88bLEdG4dH3z0YwuJIEO9wy7qcJIGaObn8XDavs4
         DiWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781989066; x=1782593866;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bkxn2Znq2suCWvs5gQQmuU6unIucXZfSrKAjh9DnHZg=;
        b=RbtR2heyfF4J5aHfpolFbAxse2/rhx2ZnmdtREuUS0xu8KOanCSkiQ5yO82AF4bZfz
         CQwUI/pYRCNyTszYwMuVRzElejKPrpswQ6eC1MgTBwwm8UR1CJ5ZAAp38ZbfHS52KF55
         t+V/wz6IsMi0rStFS8DbINffJHFOGRMyVc69d/cF2l2laajHNv1g7ihecgxyW318OfB8
         vXBN/I+QPd3ZzvvWuk2x+H8eMJJGbAet1GS3QxXeHXY/ikffGKve6Xq93urkH5edmyuA
         Wc+8N4CIiK6EaTcCwwyeeyNDprvCVDA4PbFVFPLIZbgKuGyCuEHe6LN8Sf6xtI6KwoJD
         nTCA==
X-Gm-Message-State: AOJu0YySHt8K10DVBjAUWFfM81hRd2eT+ZaXfLU2cf+k2ovfB05L+v9b
	JYk1KPyLOWv2nbM42crupLM6arHUuPb90nerBWUlakCS/baXJbrTC1dRUwfNvLMc
X-Gm-Gg: AfdE7cm2YE4sNPFar9pLK+UhGWRVO+yvGbjlRH9L/6BFwKxLgSSXIqApwdYyzYeMXms
	qLcY7XshVa6fInhbTxaPyiNEluNO/JrO98hUev6l/Sz/+5nNncRvtyb9aqus/fIeDq15BAQfSHz
	e9cVbRLOGMiTJDfSMDAt3qYHWjXmWIGBZF4xmvqe7YZjHxwvcAt48BAOwG0A4jCU3hXcWY8qQsz
	72foeGUPYBAySxeBE6xU90TVXPQBkXyLvNwFQgqtftz2yAGbqtMGbk4rEEq5wA+S95V2CmMrMXU
	CKJM5FhJeZThjRrImi8o8hKVP6OgKPHo7PXFfujrAoaMEGTjs3aApRZ4i3SYp5KKen5x0X3WpYo
	iiJt2QNZosm+DhydwPu05BU+KnihTFWFTCeLGmIJajAmmupcFG00l4MMNYNmFtPVFsIoVD6JqIJ
	3qlvPSZwDmSwCaPNHIhJQOpzscP2/GLgCgP6J4
X-Received: by 2002:a17:907:9445:b0:c08:5c5c:5bc with SMTP id a640c23a62f3a-c097ae018abmr460423466b.6.1781989065652;
        Sat, 20 Jun 2026 13:57:45 -0700 (PDT)
Received: from localhost.localdomain ([2a02:810d:60a:2b00:46b1:66c9:a143:74d0])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c610e5280sm139343966b.53.2026.06.20.13.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 13:57:44 -0700 (PDT)
From: Aleksandar Nikolic <aleksandar.nikolic010@gmail.com>
X-Google-Original-From: Aleksandar Nikolic <aleksandar.nikolic22@pm.me>
To: openembedded-core@lists.openembedded.org
Cc: Aleksandar Nikolic <aleksandar.nikolic22@pm.me>
Subject: [scarthgap][PATCH 0/1] Backport "wic: Fix updating fstab for nvme devices"
Date: Sat, 20 Jun 2026 15:57:40 -0500
Message-ID: <20260620205741.175107-1-aleksandar.nikolic22@pm.me>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 20:57:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239248

The patch is backported from the wic repository (commit f20cda73b4).

Aleksandar Nikolic (1):
  wic: Fix updating fstab for nvme devices

 scripts/lib/wic/plugins/imager/direct.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

-- 
2.47.3


