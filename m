Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 576A2C47095
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:07 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web09.6053.1650450222873130380
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 03:23:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=dXIuyanK;
 spf=pass (domain: linaro.org, ip: 209.85.167.46,
 mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f46.google.com with SMTP id bu29so2173010lfb.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 03:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zDFn1n7zGLFVmSLRm9cQKF+gshI4bxEuTYQU+Az9adw=;
        b=dXIuyanK2GObQnT9RdO3EpO8zL/+aTFEI7jNNxVIufekDvDglSOWbgTT4YkpYbjZOY
         FH0fOZwJO4aWL2u/uRy+48FDnM6uvFJT3HtMxOC07FxXYH/PArkhtZcjLpPKywnsJTfR
         JQJuCrIOTWsTZK1u5QwuliH48J9Yw8K9/f0zol8a7uCi+1BDlMsm8ZL/RjfjJb7QuyOe
         WRoASXrpCyoXoO9O36wfdvH03aMaqssCRCzoMIP4zQVwUg9/Ptyqvl/6XFVvE4ODKeP7
         PKCa4xTbzZ85ydLTXKKcAxAzvMfre3FUk6wovrgNTmgO5zNRGxXjKMxY5ppxsbsMrNat
         O/DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zDFn1n7zGLFVmSLRm9cQKF+gshI4bxEuTYQU+Az9adw=;
        b=yTpGFcxa37OskuU+nFdC70Y4r85P8jGsPAgJhTJxMaDgknL53HWzZN/Jj6LnQv4p8V
         YaSOvMn7YvMQty+1i+KDKDrUff+cjf30bOp/W4VVQVeTwzntuileliQ7rz0/VSBo6T9N
         +KnAG77FXGCaDKiXtTfLeafvW3V+3g+64wXAazW6v00mFXPFDFjs1JfiWcETdOhDKY0W
         3nM6nBlwEZEyWIA4L6O3TzI6VJpLln9/qLCrqKgXfjdOgrJG3xR47mgQtLUlVKH7EQwl
         xLdzW9IWmlUQpt8MGLi6ESJqrnUGVmT/KJwod/Yk1FjXFtwFSzpLGssDE0CUzeHcmfLC
         gQ8A==
X-Gm-Message-State: AOAM532GJXKklb5Oq/M7fvI8bzp55cEb4LygEQmk2/9mq37cSaHpwtU+
	s9O+zK0LQLGtPuy2Yx1Y9ovTbkFsEHbqtw==
X-Google-Smtp-Source: 
 ABdhPJxOUkQ5vbnICVgox6PPVHkL7QIN6dESn/73/3XBEh1vvvyg5QrPA2axf/OHPnb15MO16miu6w==
X-Received: by 2002:a05:6512:3a88:b0:471:9d5d:685f with SMTP id
 q8-20020a0565123a8800b004719d5d685fmr8227126lfu.450.1650450220644;
        Wed, 20 Apr 2022 03:23:40 -0700 (PDT)
Received: from umbar.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id
 h13-20020ac24dad000000b0046d13289d3csm1776679lfe.249.2022.04.20.03.23.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 03:23:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] arch-armv8-2a.inc: fix a typo in TUNEVALID variable
Date: Wed, 20 Apr 2022 13:23:39 +0300
Message-Id: <20220420102339.2962323-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164663

Fix a typo in the TUNEVALID[armv8-2a]: It enables instructions for
ARMv8.2-a, not just ARMv8-a.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 meta/conf/machine/include/arm/arch-armv8-2a.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/arm/arch-armv8-2a.inc b/meta/conf/machine/include/arm/arch-armv8-2a.inc
index 30f2870811ed..95368b0af79e 100644
--- a/meta/conf/machine/include/arm/arch-armv8-2a.inc
+++ b/meta/conf/machine/include/arm/arch-armv8-2a.inc
@@ -1,6 +1,6 @@
 DEFAULTTUNE ?= "armv8-2a"
 
-TUNEVALID[armv8-2a] = "Enable instructions for ARMv8-a"
+TUNEVALID[armv8-2a] = "Enable instructions for ARMv8.2-a"
 TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'armv8-2a', ' -march=armv8.2-a', '', d)}"
 # TUNE crypto will be handled by arch-armv8a.inc below
 MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv8-2a', 'armv8-2a:', '', d)}"
-- 
2.30.2


