Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD579C433FE
	for <webhook@archiver.kernel.org>; Fri, 18 Nov 2022 12:46:50 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web11.10632.1668775608340575726
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Nov 2022 04:46:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=VqYqZcoH;
 spf=pass (domain: linaro.org, ip: 209.85.208.177, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lj1-f177.google.com with SMTP id b9so6650103ljr.5
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 04:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O4KWhwG2H4nd2zrN1rk+9shF6kvqEMW/Gbjcs6fmp9s=;
        b=VqYqZcoHFSUHB/Rd5L9j3eUBc+YLv5zW/XBll4nG7ewNH+Od6u6nMPz61yoFs3ww9/
         JMtrmtEFSdJrg9MOY5WhjervL+gnGJUOatxVORSH/UF2M5jQiHgHj2PtS1IHTkgyO5L+
         8BhaGl5pE8pdr8kn5fKXodKiYLmkcS6W0Cp5wjxX/o3rZO81ACFhFO3gxDsF9coZ98PL
         hAHsD7jT72N01JmVglvI/i2FVMKuUDnTqT5S3WHvykZKT9XCaAifD7zt+GSHaZ+uQp8x
         YVtg76iHWqz+1tdFApQIh9+zK0Lkqj9QTx43Ms5iNAcNmwrkqwYQJ553sFyI77thNv3r
         Qd/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O4KWhwG2H4nd2zrN1rk+9shF6kvqEMW/Gbjcs6fmp9s=;
        b=dxKWm9BhOQwGxHAI95ytJUMUTKoGleLjJlKHZzrEIwYiu15hPoidGcGatVaXvwnyUZ
         2rIrYfxhI9yXOkq65HGMAtI+VgjqHpnn0HH0KRupmo7e2MHL0sRz+iVSZe8x/60CLfZt
         /iuogl9kD3W8j+32mfEDw7+E7Ux8//VxVzVFfl+8lOBGAjYOAO3Q9RC8kJtkpOk1KtfJ
         tuzvQ5XQalWiETyuOIeT8prrjoGThkvNbn60vr5dF5JnvtlrHFWz4XUlMmuEHR1Ox5zn
         QHFHCL51YFQdhI1Cg6idJB5F+I0AtKCdGP264wsq0k22ZIdJ3jTkWFi54b1PIYc590Df
         uDmA==
X-Gm-Message-State: ANoB5pnLpJJDnn4Ak5LN7sjq3hCmr9c4AQRjZesabl0h3Jga5vIl6Ep6
	OCihJvOx3IWAZbovk6QEVSBo5aouQGjwqg==
X-Google-Smtp-Source: AA0mqf7C12pwQAzocM08Y1tUHrN099H8QWZse5SXqhA6RxwM+faFp5lpeV+UOJ4E+J6IOdIBTsPF1g==
X-Received: by 2002:a05:651c:1952:b0:26f:dfb2:9b9c with SMTP id bs18-20020a05651c195200b0026fdfb29b9cmr2275480ljb.461.1668775606450;
        Fri, 18 Nov 2022 04:46:46 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t11-20020ac243ab000000b004a03eb21c4fsm643407lfl.288.2022.11.18.04.46.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 04:46:46 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] linux-firmware: add new fw file to ${PN}-qcom-adreno-a530
Date: Fri, 18 Nov 2022 15:46:39 +0300
Message-Id: <20221118124639.553228-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221118124639.553228-1-dmitry.baryshkov@linaro.org>
References: <20221118124639.553228-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 12:46:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173457

Extend the linux-firmware-qcom-adreno-a530 package with the squashed
Adreno 530 zap shader.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20221109.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20221109.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20221109.bb
index dc977c2bb780..b05b960ebd44 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20221109.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20221109.bb
@@ -993,7 +993,7 @@ FILES:${PN}-qcom-vpu-2.0 = "${nonarch_base_libdir}/firmware/qcom/vpu-2.0/*"
 FILES:${PN}-qcom-adreno-a2xx = "${nonarch_base_libdir}/firmware/qcom/leia_*.fw"
 FILES:${PN}-qcom-adreno-a3xx = "${nonarch_base_libdir}/firmware/qcom/a3*_*.fw ${nonarch_base_libdir}/firmware/a300_*.fw"
 FILES:${PN}-qcom-adreno-a4xx = "${nonarch_base_libdir}/firmware/qcom/a4*_*.fw"
-FILES:${PN}-qcom-adreno-a530 = "${nonarch_base_libdir}/firmware/qcom/a530*.*"
+FILES:${PN}-qcom-adreno-a530 = "${nonarch_base_libdir}/firmware/qcom/a530*.* ${nonarch_base_libdir}/firmware/qcom/apq8096/a530*.*"
 FILES:${PN}-qcom-adreno-a630 = "${nonarch_base_libdir}/firmware/qcom/a630*.* ${nonarch_base_libdir}/firmware/qcom/sdm845/a630*.*"
 FILES:${PN}-qcom-adreno-a650 = "${nonarch_base_libdir}/firmware/qcom/a650*.* ${nonarch_base_libdir}/firmware/qcom/sm8250/a650*.*"
 FILES:${PN}-qcom-adreno-a660 = "${nonarch_base_libdir}/firmware/qcom/a660*.*"
-- 
2.30.2


