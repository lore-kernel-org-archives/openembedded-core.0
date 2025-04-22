Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB948C369D9
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 14:35:26 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.41494.1745332526159966026
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Apr 2025 07:35:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=V8X3tHtZ;
 spf=pass (domain: linaro.org, ip: 209.85.167.46, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54b166fa41bso5812385e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 07:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745332524; x=1745937324; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ALVr6r/uvKn6zuQDHQgIRccVCwpoa+Tg3F1piZ4GOo=;
        b=V8X3tHtZiz1mM21hMPsyVJTxDJ8veXwPuT3B3Ai2lYW240ShDmdSLcmvupaXYNGdS4
         ZVGQkGsArVs7Is2nBZqi0WQZ9XXg18M4Ai4NDgXU6q5vARxHKYuzeIVN6oC6WsXqCbaT
         877ErM5qzzCpyG5dzktrfSleHgreip6Q1/yVhOmV9L3wpdNnyqc24RK/S05oPhrIQVdE
         R65IUbligQGzonN2hw5l4snbhD1PhkNs2xeLtAUksUosLS3i+9q+tll1Zmbr8uW4QGyP
         3HuMVBSUS91B4X7lBAJYIt+wVLXR8fvnPzJ8Gy85y7OjdfMrLUFBbKFWQDf8XK2zZDtx
         GxeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745332524; x=1745937324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4ALVr6r/uvKn6zuQDHQgIRccVCwpoa+Tg3F1piZ4GOo=;
        b=BST6V7+osLvhzAh74NLGPCIfECCm8sk02r7ivbyfO34pSVuN42d2T6Wlp9KjEcVAa8
         OrJbbNZszX6hqpGzyJ7Kna6GUkOMP575bj87MA3+zlqvW3ivYO8bXDoHkXXNMdKCbOnj
         ppJHf7ByiEtEasPRb1j+b431fiBuH7FEYFEahG43RrqGcIVikQSd4fwyC1kw02lQU/w1
         LU0428RSGpYBwU/YKDn4c7b+TPaLRV0qoGZ2q0dMdNccoY9h5ig4m1tyhw9ECSN4gG+F
         SejR1pif/AflpBDTerVY0/JAIGLDxSkFKjAiRwVw5RQdlBhBAaK7/byYP51n5wgAF5fU
         lTdg==
X-Gm-Message-State: AOJu0YzCNHeGGa7kOJ5XPjI6xPTesXB0P0HVMD76MGQbQ1VF1KPjV0r+
	o3Y17ckbDsSI0i/AxydF7utARvNcAqXqFI8Upxc0G1usWjTf0vj4k0Dv+inKJvxSRDJEAcZ03Cp
	KXUs=
X-Gm-Gg: ASbGncsmLeZcw6ZyYszMP0Bf54LCGKypjBzW3MVuZLLSBqyFzR01Q2Mgk3GkRlDuUvd
	b7LHfxSOdj+cHTAxoOKlsaSbnMm0xQ/nB48bVU5aFRXRSvHzd+V9dV/L2+gbDrKsqNyuB8gxQ9n
	Ow3bb3GNs4rPFLCKxgbKDDpXneISB/LvWMqUmfpgz7UwrMevBQ9wdTXiRlAMdLd6btCtDErn5fQ
	9tTnj3o0SyvF9J6tlpQaAU3TFsPtAARjcTW7I//CPM8jmRhAwzFeY7bVYlLPk3L8+UeUXtuhfYV
	uOeKyF5Iew+ACQY+YevKYHlALFaCKTarGBQT6RqSUBev+WxnG0Lya3ZeqJ8RcQMmStYwGba8wV6
	EHOzwqIxwG+SC3xfufw==
X-Google-Smtp-Source: AGHT+IFvOsV3hee2yXoHoQfXYDhA8rnWSroDdioBCwnk5MXhycL/Ut4CD9UfES076E8cgfd6UKjVyA==
X-Received: by 2002:a05:6512:b06:b0:54a:d68f:6ecc with SMTP id 2adb3069b0e04-54d6e61b917mr3470014e87.2.1745332524088;
        Tue, 22 Apr 2025 07:35:24 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e5d0837sm1236503e87.118.2025.04.22.07.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 07:35:23 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v4 7/9] image_types_wic.bbclass: capture verbose wic output by default
Date: Tue, 22 Apr 2025 17:34:59 +0300
Message-ID: <20250422143501.99565-8-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422143501.99565-1-mikko.rapeli@linaro.org>
References: <20250422143501.99565-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 14:35:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215221

Call wic with --debug to capture logs from wic internals
so that it's clear which partitions get created and which
files get copied where. wic plugins contain for example
race conditions which don't install files at all and thus
images fail to boot and it's not possible to debug these without
something in wic task logs.

For example core-image-initramfs-boot do_image_wic
log is now 576 lines which is not excessive but very
important when debugging problems, especially race
conditions which are only hit in some builds in CI.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/classes-recipe/image_types_wic.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/image_types_wic.bbclass b/meta/classes-recipe/image_types_wic.bbclass
index 1b422b6280..10888bc12b 100644
--- a/meta/classes-recipe/image_types_wic.bbclass
+++ b/meta/classes-recipe/image_types_wic.bbclass
@@ -72,7 +72,7 @@ IMAGE_CMD:wic () {
 	if [ -z "$wks" ]; then
 		bbfatal "No kickstart files from WKS_FILES were found: ${WKS_FILES}. Please set WKS_FILE or WKS_FILES appropriately."
 	fi
-	BUILDDIR="${TOPDIR}" PSEUDO_UNLOAD=1 wic create "$wks" --vars "${STAGING_DIR}/${MACHINE}/imgdata/" -e "${IMAGE_BASENAME}" -o "$build_wic/" -w "$tmp_wic" ${WIC_CREATE_EXTRA_ARGS}
+	BUILDDIR="${TOPDIR}" PSEUDO_UNLOAD=1 wic create --debug "$wks" --vars "${STAGING_DIR}/${MACHINE}/imgdata/" -e "${IMAGE_BASENAME}" -o "$build_wic/" -w "$tmp_wic" ${WIC_CREATE_EXTRA_ARGS}
 
 	# look to see if the user specifies a custom imager
 	IMAGER=direct
-- 
2.43.0


