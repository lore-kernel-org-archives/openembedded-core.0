Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E7E7C36000
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 13:26:10 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.21076.1742563566087855953
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Mar 2025 06:26:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=HH/t5S4N;
 spf=pass (domain: linaro.org, ip: 209.85.208.171, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30c461a45f8so20213011fa.1
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 06:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742563564; x=1743168364; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ALVr6r/uvKn6zuQDHQgIRccVCwpoa+Tg3F1piZ4GOo=;
        b=HH/t5S4NeClvKMqnoUEP36TkYuwhTnikjfAuscMlocj7hIM4YBmkKKxfU7JRqb3PLA
         3Rs5GDyN2DJ50ohDE8WB1LvCNo2ILnA+mV+wTI4WO/S0PxXorjC5D1AWB0rFI+WFV8+l
         xpyyu6++Dvcu3vx+Jmpfh9MeMNDKAY1a0bA6xDJuaaxwm03ix8HxgjAhT7rwNU9FhiRJ
         KbDtXBip6QzezNF/MRxSMNNJBuHTJbeApFKum7hstKbyTGRD+11v5yCvjIfTR/693H7d
         W6ZwnqzMsLgLuhoGskc88IGf68VK//qJ8rFhiuaV0odPT7ezlDvBE9AQtu9OgLcbteTc
         nJkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742563564; x=1743168364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4ALVr6r/uvKn6zuQDHQgIRccVCwpoa+Tg3F1piZ4GOo=;
        b=WatJLjwE08VeLU52QP/Rl9gCjyRQLd36AKHr7ooSyDg153SqiAXILOX1ImhjUIDKNm
         7bnL9b33z22qbDqQY9dZtwd5BwZKhTTkm3/f3bWGbBg7LxKDDWten5xR3pOXLDOuW5Md
         KRC+h1HIFPznOwsM5xCKJzYLXgRK9c89Tcjg9/TfrlkxKsBPGoEMCDDqxdlGtRi22L48
         KYlvCSo7E4X1yUeG90SBAPWaXH/mjgNJcObAGNyosaEZma6GjGQ/7Sqd7gsJ+MHfAb69
         cyGMNir8m8izsJp3b1ngmBNwtlJfD1R6MCOQ/jhoa7zBwBH5DU3Q6SU/09MOWi8tX+Fg
         8aSQ==
X-Gm-Message-State: AOJu0YxU8Je0+GVWkX0eUfdViGt9iLLPBGBAXGlpU7abwA0o82zCb7Yn
	15R8z6OviMaIL+5ft4aMBUfc9QhUt/gV1U4GE3xN35xlbr4//Js6t9MIm9wccSr3mzDXc6D+imC
	ebw4=
X-Gm-Gg: ASbGncvLD+j3GMBeUhDD3PAx9R1T8iPYBhBV6WoG3fW6thYEPMQ65Jp1Qv4h+ZCv5eO
	Js7F/NlGgAtrjTpwfja9DfWyD0ZxqiUEcEs3YKzh0ZLD2QdiNVkT33dH3nRnKkfu408ObZhtgl1
	AHUkLhpg6+6B7FNkFi9WXnbCcrRTfyRbKcKXM5UqoCW0Nhhk4Iv+rrDwk6pt4MvyqYKe6b3Rv9u
	Yt72F6IRn54I/KScavx08S8tIwZouW3LiLgp7bocFXATa7+d2U6hBEacLjzAgBpnzY3is1Y378J
	ljyy0/u8yYIqtRmmW/nkbpg8IYmu8N1l398ibudXMZt7M15OAZz+aN8luT3VAGofDC/YT7DikyT
	X1sWFtjL9tvifxYuGX3iyQPZttLMjjNpO
X-Google-Smtp-Source: AGHT+IFC/m/n8WjEecjTjebyyYsDwGCs+auJo7+jMD48whFEpRMux0jcFa7S4NpHU07Zoq6wI3o1bg==
X-Received: by 2002:a05:6512:1392:b0:545:d70:1d1c with SMTP id 2adb3069b0e04-54ad6470ae0mr1206436e87.11.1742563564077;
        Fri, 21 Mar 2025 06:26:04 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad6468a25sm182634e87.11.2025.03.21.06.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 06:26:02 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v2 09/11] image_types_wic.bbclass: capture verbose wic output by default
Date: Fri, 21 Mar 2025 15:25:15 +0200
Message-ID: <20250321132517.670372-10-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250321132517.670372-1-mikko.rapeli@linaro.org>
References: <20250321132517.670372-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 13:26:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213465

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


