Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12C4AC4332F
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 19:24:22 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.127808.1669663451996868354
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Nov 2022 11:24:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=p69uVdLA;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 83-20020a1c0256000000b003d03017c6efso11848388wmc.4
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 11:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SSKj1dQa5W/tb0KWibgLiFN9GyoWsGYu4aHuowwSgH8=;
        b=p69uVdLAoFtOvVXdY7PskkiC0bUNTpKZ57JZUs2Z6eR5hQzxGA3t59MJUJwQqnUNIs
         wsX19sOwf+z7KEosGts3PQ+nsmEX/pXnC+qRwHmhqxXOuS5YNn0yOkCDZngPcoYAVrHz
         FRPvHFH1X5P9DsAQGD2pcY7Uvar+9WVzhFHMisoeOMY9x6wsK72c8cSIWZFtG/f9XjSF
         UQKBAIhxkHYB4k0FZiehn8AezG0o6ZAjuqxLU3vBuoRvY9WRxXtbMYt2fROLuRx1T+xO
         ge9ND25cwMB5ceHjjADVTSN0ZE9Y7FIF/fn93Rnl6NyJ4ZBSBMAPnJsc6O3X8wdNy9pj
         Tqzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SSKj1dQa5W/tb0KWibgLiFN9GyoWsGYu4aHuowwSgH8=;
        b=T5hCiPnmW3HwC+OC2BcL1Z046104YEXaGOSJtuXVpL0zbF1K5B1M3vLKSmDLfhrMj2
         CMXyBAvidvoZ7LkfoSi972dwdkFMWM1o5p6AI1cD+4Xs3FlorPJ9q0ma2bbKe7a9dkMS
         mKXYdY/D8u8JqxkxTzVPCmASoX0lVmL0TFgHQhpdBeyq2x42C6w9eVvD73+vrhYU8ezj
         3bNN/rk1grvlwyy+utAcwWjkXfhF8MOAA5JYY/zyr1bBFF4T4JlTAd6RVBA+wCtRq6l2
         I72q9RecBWwCydZoxrnaChJcB4Bqs+Di1MxGrm2PhIHoZobGjvnkHhC3FRFbBx6ByLo8
         ZX2Q==
X-Gm-Message-State: ANoB5pn2VH7zvK5H1gDiIRMGLvWdfvt/3NWYIF32x5lYNC/J5+pGigkO
	YUxsiT/XroD+xya2DokUCUc0ddj0ZKc=
X-Google-Smtp-Source: AA0mqf4+0B2aNitleAGujyqYlJAu5BUGpugcjrf+ViBsF0mJ+m+okgpql691YhFJR8WCH6uRb30p2A==
X-Received: by 2002:a05:600c:1f1b:b0:3cf:35c8:289f with SMTP id bd27-20020a05600c1f1b00b003cf35c8289fmr30704637wmb.153.1669663450415;
        Mon, 28 Nov 2022 11:24:10 -0800 (PST)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id a7-20020a05600c348700b003cf75f56105sm17944560wmq.41.2022.11.28.11.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 11:24:10 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>,
	steve@sakoman.com
Subject: [PATCH 4/4][kirkstone] tiff: add CVE tag to b258ed69a485a9cfb299d9f060eb2a46c54e5903.patch
Date: Mon, 28 Nov 2022 20:24:05 +0100
Message-Id: <20221128192405.2163736-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 19:24:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173943

* according to https://bugzilla.redhat.com/show_bug.cgi?id=2118863
  this commit should be the fix for CVE-2022-2868

* resolves false-possitive entry in:
  https://lists.yoctoproject.org/g/yocto-security/message/705

  CVE-2022-2868 (CVSS3: 8.1 HIGH): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2868

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../tiff/b258ed69a485a9cfb299d9f060eb2a46c54e5903.patch      | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/libtiff/tiff/b258ed69a485a9cfb299d9f060eb2a46c54e5903.patch b/meta/recipes-multimedia/libtiff/tiff/b258ed69a485a9cfb299d9f060eb2a46c54e5903.patch
index 272dd3d713..83d5db7fc6 100644
--- a/meta/recipes-multimedia/libtiff/tiff/b258ed69a485a9cfb299d9f060eb2a46c54e5903.patch
+++ b/meta/recipes-multimedia/libtiff/tiff/b258ed69a485a9cfb299d9f060eb2a46c54e5903.patch
@@ -5,11 +5,12 @@ Subject: [PATCH] Move the crop_width and crop_length computation after the
  sanity check to avoid warnings when built with
  -fsanitize=unsigned-integer-overflow.
 
-Upstream-Status: Backport
-[https://gitlab.com/libtiff/libtiff/-/commit/b258ed69a485a9cfb299d9f060eb2a46c54e5903?merge_request_iid=294]
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/b258ed69a485a9cfb299d9f060eb2a46c54e5903?merge_request_iid=294]
 
 Signed-off-by: Teoh Jay Shen <jay.shen.teoh@intel.com>
 
+CVE: CVE-2022-2868
+
 ---
  tools/tiffcrop.c | 5 ++---
  1 file changed, 2 insertions(+), 3 deletions(-)
-- 
2.38.1


