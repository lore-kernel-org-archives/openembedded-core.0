Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91AD1C3DA6D
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 03:52:46 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web11.41004.1747972365154011295
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 20:52:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GA1HKZiV;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b26f7d2c1f1so6571083a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 20:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747972364; x=1748577164; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LXpBEqSv8rf3qkRdPzLv5vu2nWb0mlgocHoTc3Nrgfg=;
        b=GA1HKZiVgYYN5AC1SR5Z1lJlv6A9lKoQLMOQZFoeqyc1t3QKeDmBAU+KzhaEoRj+eA
         qqQ1Cy5vza82BL1uilW0IiSM5WtagMqiE0LekC1+9Rino8hATPykcLwPhHiTd+UY6ulg
         m+oWkv2Cz4VAn0GTRV6Cro88tbVVHECO+aZPvqHx1qxYvLQBiywThBEwd8P4F9ODFbgG
         LbFHJObiZ3EXP+mcc+/7hF5zibFRu3beGq1NYya7F86QNRsFuldK7+8rQfw3/M0St5tx
         1KB7FpJz1GTJdkJ/HD/FPDxWWrU6kuCsUfE4SkwJxnfRpmI88idrZM8zfF6Hk/Al+Yxl
         MONQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747972364; x=1748577164;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LXpBEqSv8rf3qkRdPzLv5vu2nWb0mlgocHoTc3Nrgfg=;
        b=WKE6i9fVphQMYxQ+85xU/v0/HjLtL0KQllUm8c71i7dgNEVUzV2+1eJO4c0iZI/Eu0
         blvZBWS1OLiZXXG3Ia2pjjbW5awNPpmM68m0rDixv7qf2fglCU2AsFwRq0g4Dqi2NING
         iZiaPUJVqXacWND3kpSyLZQYv6tp1I5PcfZ90YrfqSEKoyoPqozzBWXr91QoiwP1Fpk7
         4yRLtLovJKCfo2eXnqjmXM2SrwuViY8f+QIN5eLhwjUC6tpHq+OaeUan7hBpYr9Ns9Rl
         /yP9Y8Fs2z9mofHpJ6dbVpfVGAo9T9V15zJGdlUXLYAR8QI+7DUBYw9hu/wW16uqBfhe
         yu1w==
X-Gm-Message-State: AOJu0Yw9qMrcYd260BK6iwKIjJY/2LJPYC/luIuFU20YSsleR0hB2hu0
	PA/MBv6TCUozuBpcQSchjq8ELvp2oq6o2UnskK4Ccnoxk5Ez0HSZ+a/zkqXGfbPJ
X-Gm-Gg: ASbGnctdEmYZ0uHa7C5lz0JA1EK1R9KfX2SDKqfvgUPOt/+7NYM5WEk8+EsP50d88yu
	LPbo8PW5FzF0cwTFkMDdANucxEjxDWQLCVynAWYHINqb1ulcibyYPLUMC1QR6GHpBUzpaEGGl5n
	wVPjBsTbqLeogRCMuQqr4WqnkS+lV2rWEjmWo/3HjI/uDS5G4umW7C3CvdXzudn8/xvfhXZaNp5
	pWwS1GCwh48dPcFCcRGQxQPa3+xm2MxhfGnFDd1yqdfhUJp2SBzqcjBiCZ+oToWgWazmXURGcwr
	f+8/x+QX2BKCtPNQX+b5T6WFsVDkeubjdgjLH7mjkcY=
X-Google-Smtp-Source: AGHT+IGmkm/3sP1FsufCeLq/+dedshXYVqi5kV25HqTT0OQX6OUbs7+My50aSsOVPRVtsDFwFltAog==
X-Received: by 2002:a17:903:320d:b0:224:1781:a947 with SMTP id d9443c01a7336-231de36ba3cmr359605895ad.21.1747972364318;
        Thu, 22 May 2025 20:52:44 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5f56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231ecd5ea41sm107181155ad.228.2025.05.22.20.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 20:52:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 22 May 2025 20:52:37 -0700
Subject: [PATCH v3 03/13] vte: Disable gi data generation when using clang
 on arm
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-clang-toolchain-v3-3-16cfc6d9891b@gmail.com>
References: <20250522-clang-toolchain-v3-0-16cfc6d9891b@gmail.com>
In-Reply-To: <20250522-clang-toolchain-v3-0-16cfc6d9891b@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 May 2025 03:52:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217163

Fixes Qemu usermode crashes

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/vte/vte_0.78.2.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-support/vte/vte_0.78.2.bb b/meta/recipes-support/vte/vte_0.78.2.bb
index 0593d16cd8678d010c240581138caf22f2908659..e37d59833cf3313bdb369f4e0957dfc5e3cb3ace 100644
--- a/meta/recipes-support/vte/vte_0.78.2.bb
+++ b/meta/recipes-support/vte/vte_0.78.2.bb
@@ -26,6 +26,10 @@ SRC_URI[archive.sha256sum] = "35d7bcde07356846b4a12881c8e016705b70a9004a9082285e
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
+# qemu usermode crashes when using clang as system compiler but works with gcc
+# see https://patchwork.yoctoproject.org/project/oe-core/patch/20240923234336.3978188-1-raj.khem@gmail.com/
+GI_DATA_ENABLED:pn-vte:toolchain-clang:armv7ve = "False"
+
 EXTRA_OEMESON += "${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-Dvapi=true', '-Dvapi=false', d)}"
 EXTRA_OEMESON:append = " ${@bb.utils.contains('GI_DATA_ENABLED', 'False', '-Ddocs=false', '', d)}"
 

-- 
2.49.0


