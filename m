Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC598C4167B
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 20:58:10 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.5148.1701377881757661674
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Nov 2023 12:58:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=n96/jrYo;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6cc02e77a9cso1369416b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 12:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1701377881; x=1701982681; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8TxCZiVrtw3m4MrN00NPriz7JcQHq+MmYRw3VhMfNBA=;
        b=n96/jrYo8VFwrsj2zUM+aR8P0tDUuiF3GBAvU/yQx/MDTk23JswMHKXkdYYAkvD1oW
         DUL/SJWHG2zJ+lS+DDEiY5qU0c+lSEp8LD15HpsWqP0JuzZgFLWsoVoGr2njf/Yf2y0Z
         5v/aD7z4YYI0wL+vfVPC5nDHlteMXJGaMnkQf4l07tRRz9zhees2etcLvjva0TNL/QJh
         y5IRAs7tNPXikfWW3Gk11i+mlFqLRr60b4k7t/deWyia6+zsH647OEgl+PHml4EubTNL
         efEAykFkMn8WFSkq3ijRBZMExU9Iiy8bYR+5xdiY8674lAUqpZYqnrej1Z5hPMGHPsPi
         aeIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701377881; x=1701982681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8TxCZiVrtw3m4MrN00NPriz7JcQHq+MmYRw3VhMfNBA=;
        b=cjTo3PSrm47FkMJXN/B+dIDuLdMwQdKRQIuD7zI+ckNfT2n8USK8iCAicWTHAVi9y0
         YZkVQen5WnNx/7iy7UTxDqnY7R9dQ31smTKaDUsQm1s8mbYcVxFQFQ+olZHjJ1h6tF9S
         wNgsbd1tmcrGV73OtvPtZ01cnDjBNzqDwc/eJQqeHttFskF2zPp8ZPFfqYVhNAVMo0my
         /a2QxiwX2fFMhecu2dHspJxRlI84SgYU+TCVGT16mB1Sbg+bpfnHqQfmZSou1Tsj2SSq
         xeClQZBCq2WT2erS4qrkPiTIMgDpXBfCbOI9FOy+VUtuO5dtieIDvBDGcybHNVjLQtth
         XxNQ==
X-Gm-Message-State: AOJu0YyS0luz9P4OXSnzLBb7Gq+E6TlRbqXl9gR4Q6f/e5WUMmt+mliL
	K6S6YKN2144fnfQiTOiZJvNYZuJRWKB+S/KBk7vgzg==
X-Google-Smtp-Source: AGHT+IH7Ra0WFlLKeoDz8zyOj6TuLKnG9xcG7cCrs+stIv44ICJ92IXRvD90HxoJu3O9KeHccAA9nw==
X-Received: by 2002:a05:6a20:e68c:b0:18b:cd6c:5147 with SMTP id mz12-20020a056a20e68c00b0018bcd6c5147mr24836734pzb.8.1701377880942;
        Thu, 30 Nov 2023 12:58:00 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id f18-20020aa79d92000000b006cbbc07a1c0sm1635418pfq.156.2023.11.30.12.58.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 12:58:00 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 12/25] linux-firmware: add missing depenencies on license packages
Date: Thu, 30 Nov 2023 10:57:20 -1000
Message-Id: <fe05fc9be2b8a58c721df2da602fa4465e07947d.1701377676.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701377676.git.steve@sakoman.com>
References: <cover.1701377676.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 20:58:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191530

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

Several Adreno packages lack dependency on the package with the license
file. Add corresponding RDEPENDS.

Fixes: bf00a042d2fa ("linux-firmware: split platform-specific Adreno shaders to separate packages")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 9b9f7fef59cca72c3cd0aedd040a15e77ad5a2b2)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
index fd38253dfd..895d36cc02 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
@@ -1380,16 +1380,19 @@ RDEPENDS:${PN}-qcom-adreno-a650 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-a660 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-apq8016-modem = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-apq8016-wifi = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-apq8096-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-apq8096-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-apq8096-modem = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sc8280xp-lenovo-x13s-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sc8280xp-lenovo-x13s-compute = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sc8280xp-lenovo-x13s-sensors = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-sdm845-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sdm845-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sdm845-compute = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sdm845-modem = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sdm845-thundercomm-db845c-sensors = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-sm8250-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sm8250-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sm8250-compute = "${PN}-qcom-license"
 
-- 
2.34.1


