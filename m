Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D8EFC54799
	for <webhook@archiver.kernel.org>; Sun, 18 May 2025 21:30:58 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.37980.1747603854814934443
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 May 2025 14:30:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b29bmiJF;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so2999214b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 18 May 2025 14:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747603854; x=1748208654; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LXpBEqSv8rf3qkRdPzLv5vu2nWb0mlgocHoTc3Nrgfg=;
        b=b29bmiJFkvxx3J4WTawJe0vPRwHO5xH4NXwrU+eobKvz98SQFimy/i3kCtq8l/MYZM
         zJ7K9Ru/XbrU9suR9Dj9QxCAZvZ0z8VhERqrY5zqQkX/1Hf53YU3+UPmxEy5BdVMb4Q9
         tB2PJfAzi3P3bBlN15ywMZbPVVpabYfUiyEwy+TOgCsJ2+W9H1bBCI5/TEPJE5f9kBn6
         xnkh0hjpew25dxRNAMDOi06G/biTYKmk1BdqkS58uPb+l59vAc44ek89BrmB8RFSTekn
         UO5h0CA5u31ixvrFCEt2Qszqri0EtGPkzZeNOAdPBJr3WgzLqsvQL4n9L7q3IxSQzQlC
         1dUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747603854; x=1748208654;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LXpBEqSv8rf3qkRdPzLv5vu2nWb0mlgocHoTc3Nrgfg=;
        b=a6EvZkSuP3vCw5MaVrxnmqyuWTNdZmJ77lh4kPPf0ZbDn8Wpn/KKkSC8a/Wukcq6br
         9hyTMVpkNwMJlwlXCCJ1uHnBslPdueWKFpUvku90SOBhVhdfZV2OOyBj8nFgUG246Cr6
         Aai36hvKXMj0p+AIJAZnCezix/YEpG2DQjtyEwQUi2Nvzacqih0IDf7Tsf1KXA0FyGCi
         xow6VUD0DGWaKyvD0jH3+yLXr2SzESfSNxbOpLYqAGGIcg1qCJOiqODplwaP1mdiQYuL
         yNDRW+2ZpEXvCPIGx5pg67zSv18msbCrVSkIRxwK5PTuMGwowVJmvGSGv1B8V+VyFFM8
         N82g==
X-Gm-Message-State: AOJu0Yz2sADxOIZBiBjjktRHfFvWN/3utGWqAjYGDUn07KlTYhQizB4Y
	LxiSk/iMEwJ8Q77mjwAspJVGT3Bwjwh7iaPGs27/nzO5fgZdM6piTDuAjYq1HfIN
X-Gm-Gg: ASbGnctXF7QFOqTCv1jKEDM2epmoA78PzCawlqZgucKU/rx0+7qAaiCVj2jrTIgGy/r
	0saeHiPZqauLSsTg/qh42LhbYEQee77VXNwXuqPZEBJX+qJLTkhBARRa5iv8PKWihYIkA/B5VAY
	b+xXNGFrbxo2ydImp+P7WnlkEG7XdQCD0DGi37Xrsw+ucEqI7RQsoqpFmn5URWHOe11MTRaEjne
	lzWgYJDJLunvUkEMc/utGllR6FsrVwSXAebSNpo4U6SUqSn4n+4loEFsJYzpRUX4Ww8D7vugscf
	aOODRWjfH0GSTQ4w4sWcPagfmlC9M14XxwOIg3fMqmA=
X-Google-Smtp-Source: AGHT+IHFF+jRYp249OkuFwbu3IYn7Nv1wIqph1ezwgoyubewt+tmCP1dB+3DlSLSOfhMTxODe1lqvA==
X-Received: by 2002:a05:6a21:a341:b0:215:ef08:5555 with SMTP id adf61e73a8af0-2162189eed3mr15305533637.11.1747603853747;
        Sun, 18 May 2025 14:30:53 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eb081aa2sm4976849a12.48.2025.05.18.14.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 14:30:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 18 May 2025 14:30:40 -0700
Subject: [PATCH 05/21] vte: Disable gi data generation when using clang on
 arm
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250518-clang-toolchain-v1-5-5be46f8c4af5@gmail.com>
References: <20250518-clang-toolchain-v1-0-5be46f8c4af5@gmail.com>
In-Reply-To: <20250518-clang-toolchain-v1-0-5be46f8c4af5@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 May 2025 21:30:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216789

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


