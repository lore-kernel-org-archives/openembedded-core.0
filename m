Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B0CFCA0EFF
	for <webhook@archiver.kernel.org>; Sun, 31 Aug 2025 07:53:51 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.25558.1756626827425144240
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Aug 2025 00:53:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DClyjbaS;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45b77f59bd8so18056915e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 31 Aug 2025 00:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756626825; x=1757231625; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fCuXqSn5y7jS4g9J1nwtbmoCYLhS3wkwV5zc9PfL8IE=;
        b=DClyjbaSPpUE00wlW9v+c2ba2Xe2DceAIOlS9Mj1O3lYlejIJJHMnPlbCGTs5Es40u
         cE8Rksrnds9fiHLYiwMtVFB3f33xWl0NoaEmH0uHngKuQp4Xwp5Gb/cW+CH2om+nQE5z
         Ku6RLDAmMQTaybYFKrjkuZ4MJ6fWNMlUdW/Z9Kp7cjL+fuTdYxQty9jBB1HD5gBAtWb5
         9bAuaOUJ6Z3ViwAaA5uox3KduAM5H93P0sN0sL8+X50uI2K0lyOQVX4FJGcPU1UkldZI
         eFG3/W1HzJghbWL/KPGGCgz7WUFn2uanfhlKpPVRZEKutag9s18hGTorjjkVqTrWiQdQ
         ORuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756626825; x=1757231625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fCuXqSn5y7jS4g9J1nwtbmoCYLhS3wkwV5zc9PfL8IE=;
        b=r6RWxvQ9qmbo5lwf8JfudXv7utRJxnEyTdaq8+QKExtNcsgRYJ463ht1eyiROkAsoj
         WQY27kr4uqRgTpjQDonUbTpSQL/uRQOQRhHPmEmAT1IxnCVBEOOiitA6d/NRxIfPWIkz
         M3ED8umH0hPga6v1p87tGDqzZxGMaPW14+NCpy+tmfkMKQhMnvZTFTfz63Z9A93oSnfq
         ekOvhvV0KHFdOhs+mtnBXlXDkyaiC0Ki34WM81we4vJYduq9C+s2qrIlgQCTNbYcX2wb
         ZdaOd8YgED6jHP2/wsIQxXc0kyJtKRooUOFEO1ms0XhX9vaUCi1ihv/FSDU30QnysxvS
         KTzA==
X-Gm-Message-State: AOJu0YxuW2ywSMtuU4bu3AxTdmDtAg/BLtX4D/aLg4DfHtHKhgBcYhJt
	xeuB7hziU0DQIIawxBYHnaMb1plCXrObncdfVI2yY5Ie1yKmpFuNAJKwVQkkig==
X-Gm-Gg: ASbGncshDHZPGG+o5LOErbWJiTbR0m1DDcsT3IqCBJ7+gF/rPgnVnxELBUc2FDJ5LZv
	S0mUVQvpx9xZhjE5KOy2lOaZEGkTTBEMkJnGOJ8V4lm+pibaGiFfvrhsU4QHBr71rDHl6EVgliC
	28aPT5gAULrcSPBwqubQne+fyLyIVMPprWc3RRMQvSBCmu/IPJfuJXZVbfyi1CTAiBlH/Y0kTL8
	oL+yVafZj7nnbXrRMisr/XFeSJxRB+dlnwPVxvq7jCoWyPDZvHB96TnQWttC2PDgJJOTazsT9Ep
	PawR+D1WFYTYL9P4Zc+/Wb+X7YGrhiLMSqc66lHlAUbKPOIT7ETaw6K8dwesqU5m30b8xmGDhCt
	KwBBiYK4xH5lF29PnBIBKInccorxSItsZcUZWJ555kYjJ
X-Google-Smtp-Source: AGHT+IF86Ymc9uoKuSoNgXHQPAqC6JiubAMPNOoqwPHiRr1ZrMFtFyFHcuNH4Ybslt7rwSbhVuWWtQ==
X-Received: by 2002:a05:600c:17d8:b0:456:1146:5c01 with SMTP id 5b1f17b1804b1-45b84c586e8mr22017145e9.12.1756626825298;
        Sun, 31 Aug 2025 00:53:45 -0700 (PDT)
Received: from fedora (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf34491a7fsm9823394f8f.57.2025.08.31.00.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 00:53:44 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"Signed-off-by : Alexander Kanavin" <alex@linutronix.de>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH] tiff: Disable liblerc
Date: Sun, 31 Aug 2025 09:53:36 +0200
Message-ID: <20250831075336.7857-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 Aug 2025 07:53:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222629

tiff-native may pick up liblerc from the host, in which case
it's added as a private requirement in libtiff-4.pc.
That in turn causes a build error in gtk4-native in Yocto.

This was observed on Fedora 42 with gdk-pixbuf2-devel installed
on the host, where libtiff 4.7.0 is built with liblerc enabled.

Since liblerc does not exist in Yocto, disable its use in tiff.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
Backport-to: walnascar
---
 meta/recipes-multimedia/libtiff/tiff_4.7.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/libtiff/tiff_4.7.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.7.0.bb
index 26e3811ff8..c21b352d3c 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.7.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.7.0.bb
@@ -32,6 +32,8 @@ inherit autotools multilib_header
 
 CACHED_CONFIGUREVARS = "ax_cv_check_gl_libgl=no"
 
+EXTRA_OECONF = "--disable-lerc"
+
 PACKAGECONFIG ?= "cxx jpeg zlib lzma \
                   strip-chopping extrasample-as-alpha check-ycbcr-subsampling"
 
-- 
2.51.0


