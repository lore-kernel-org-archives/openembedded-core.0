Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CE0AC47258
	for <webhook@archiver.kernel.org>; Wed, 31 Jan 2024 12:39:37 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.12847.1706704768156841429
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Jan 2024 04:39:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Qy2PTiKe;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40e9101b5f9so53546145e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 31 Jan 2024 04:39:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706704766; x=1707309566; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AmQGjY1te0AGqhInnPQPcrxg275ASE4XHxYII59HiYs=;
        b=Qy2PTiKezLY4gbQb4Z2E1bjaRg5ZCwzn1EGxrtHELG/Ge1dKOUn6cdD7tC//GN7YvJ
         gLs+5BL7pQT3cnfDh9xC54/SpdUMh2qYwtnJ2mMpNohPfFK9ULPFa/K9NVitHRHxO3GR
         jm7Uee8AA20rWeHvVG3lwdmruRJ6ONBJCHNyzgFcxotaOBvXtlTv7S3s7Ef5zWiXkXp8
         CTsq71nRHiXk2hh4WQRJXLvRsMt272l7f6+3VCtsx9/EoSOVmMc40jvHUB1/j+oTsm7K
         ZTc3gE1c+e2yP06lXEtH1tovS3HqQTkJTC2y/5gZKGO7ZLoRNO6fBAO7qGu0RycUdWq8
         RNJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706704766; x=1707309566;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AmQGjY1te0AGqhInnPQPcrxg275ASE4XHxYII59HiYs=;
        b=H5KSiYsBLB7tWXtByLDOk2fFqMv2dCTOsAzBdPloAZgG62F778cUBcmyUpGNFPjn21
         eNCKfKqhg16UpJWLBjVMbUZLogZxoBrb9BQuTypLheIfKgdqdFpjJtnvLxd+NiXg/RwI
         9Ng7yWRvcNfxKuHmcibowv36QeEzT8PVAlXmrimsT3sLCCBzME0GDCmknJdp6zEExfp7
         f/2Slnm1JDEPsvS2H/Lh0ij7lWGR3N/tviEwZhihC16cKh2mTt8YjeBnrLq+J2Ey/NNu
         WPkNCeQDi1x+fyn/2cZdC6FLrQx3b0zKN6Fr7gQYaSKR16qRvC64u0fvjt4/l3W3shec
         c2BA==
X-Gm-Message-State: AOJu0Yw12YW7ajKfmCsayfFJweeLMrYxU6vYMBa1gO/Ebs+Ni0y3yf2/
	xZvmwNhsgfjOlPxNBoEyBAvEU1CqyFg2+6kJ7ZPTfEKfRgJ1+GPQoRYi1/Ha
X-Google-Smtp-Source: AGHT+IGcY5wE3KeMdzULcWf322Tvg2YL4Erk/I6X1y2SHHuG8FfBe8yhnTmFdAfU/dEnbhZHzmurfg==
X-Received: by 2002:a05:600c:3504:b0:40e:aecc:25ac with SMTP id h4-20020a05600c350400b0040eaecc25acmr1100213wmq.30.1706704766468;
        Wed, 31 Jan 2024 04:39:26 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ba1-20020a0560001c0100b0033ae593e830sm10898058wrb.23.2024.01.31.04.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 04:39:26 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/5] meta/conf/templates/default/conf-description.txt: add a template description
Date: Wed, 31 Jan 2024 13:39:04 +0100
Message-Id: <20240131123908.1098544-1-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Jan 2024 12:39:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194519

Existing conf-notes.txt is not adequate in situations where the user
needs to select a config template from several, or get an overview of them and
is interested only in a brief explanation of what the template is for,
but not extended multi-paragraph instructions for how to use it.

Such descriptions can be provided via conf-description.txt and
this patch adds such a description for the oe-core default template.

Updates to the tools and a tool for selecting templates which
will make specific use of the description will follow.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/templates/default/conf-description.txt | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 meta/conf/templates/default/conf-description.txt

diff --git a/meta/conf/templates/default/conf-description.txt b/meta/conf/templates/default/conf-description.txt
new file mode 100644
index 00000000000..e49172fa0ce
--- /dev/null
+++ b/meta/conf/templates/default/conf-description.txt
@@ -0,0 +1 @@
+This is the default build configuration for the openembedded-core layer.
-- 
2.39.2


