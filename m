Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31F05C2BD08
	for <webhook@archiver.kernel.org>; Wed, 19 Jun 2024 09:00:12 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.16259.1718787608466069243
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jun 2024 02:00:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Xs4KUCei;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-35f1dc4ab9aso5184733f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 02:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718787607; x=1719392407; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wWJtYRURQwISLRZiDYT8+b5QPDlmv7EL99IZNfRxpCQ=;
        b=Xs4KUCeiBE5iQqSw2RDUk2qIZ7galvn4FXVHyRsL7++/a4rJbs9Y5Y2v5Fub8KdDx/
         pi/USxkLyWVQC/E2IJ3YnIasPB8KtpD1hbtGWG74W/WUtsuHboe2dlU4aeKHPGkENqr6
         wUfN3GUQo6GURaHWaWVKk7I+1iblWw0lQ0dYPSnitCNosQiGptTT5WVlqdEbX4dijOaO
         PDw+tFB0h1QMG82EDy1uXNNKOlEIuQbSka5xzZPZyLmlyxfUJD/gxxEUInFpeu/G3e91
         GXE37++2YfYi+65M/9lDS84gadWVZJ5zS9mFQLY+Uk1DxTmkAc2W/3kpBJnFY0S2BTgJ
         WR0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718787607; x=1719392407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wWJtYRURQwISLRZiDYT8+b5QPDlmv7EL99IZNfRxpCQ=;
        b=C0aFs8YmPfT2o/y9A+9/owAc6oAZtKJIBu4CugFTzI2ozSjRKsvfZqFsCZIsj9eCgG
         clrwEo9hx9TVaBGJ0PafJXU8pF6T0FZYQhbCh3W2tvALmeD+RIGSqvbppox65PfVV9CJ
         UYDxJKEeDqa9vYmBB9QBmceHJ7YU5DoZZO5WCMLOOR6AwGUu1qJGRBl02vN12xsMkwqb
         D/0nYQwKVfVsirXBd+LKGdak/iUNtJY8gzEjj2wPdfAEF5oiyAhsnV5sM79LgVHJvqz5
         x6Hxl2McmLNZP8AwkGeivDH6OIy/N33M1zzgwHG5kLUV33pQYUKZ5yIBGGWckH4rEJcu
         aAeg==
X-Gm-Message-State: AOJu0YxgFm7sPPTuGhxQDeFqkSJqutiqafleHXzEWSEjymxntlct86Fl
	VT4xMAMFkXg9byo3Ug6kI/EA4MfL4vLW5E+G5NfgjuYJceEA3h80p3JPKw==
X-Google-Smtp-Source: AGHT+IGPawMC44QEGE8W5rFeNcwhG7Sa21BRo+t2w8PY4kN/AHzec7aEl6Kos01sc+tj8L2knjsYDw==
X-Received: by 2002:adf:e5c7:0:b0:35f:1b75:c3d0 with SMTP id ffacd0b85a97d-363175b7b29mr1357438f8f.22.1718787606816;
        Wed, 19 Jun 2024 02:00:06 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36076515a80sm16401876f8f.76.2024.06.19.02.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 02:00:06 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 10/15] glslang: mark 0001-generate-glslang-pkg-config.patch as Inappropriate
Date: Wed, 19 Jun 2024 10:59:52 +0200
Message-Id: <20240619085957.2787700-10-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240619085957.2787700-1-alex.kanavin@gmail.com>
References: <20240619085957.2787700-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 09:00:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200896

From: Alexander Kanavin <alex@linutronix.de>

Issue is already being independently fixed upstream.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../glslang/glslang/0001-generate-glslang-pkg-config.patch      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch b/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
index e6bb6ec8e3c..5001d631443 100644
--- a/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
+++ b/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
@@ -5,7 +5,7 @@ Subject: [PATCH] generate glslang pkg-config
 
 Based on https://src.fedoraproject.org/rpms/glslang/blob/main/f/0001-pkg-config-compatibility.patch
 
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [independently developed patch submitted at https://github.com/KhronosGroup/glslang/pull/3371]
 
 Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
 ---
-- 
2.39.2


