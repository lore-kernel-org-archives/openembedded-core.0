Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3C5BC4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 11:53:03 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.8698.1699357982422493774
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Nov 2023 03:53:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mt9Bq9qI;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: zboszor@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-9e1fb7faa9dso134934766b.2
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Nov 2023 03:53:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699357980; x=1699962780; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QheVU55AOpi97kz7e8dFLi9TKtD2wpZJt88Q1+YXLh0=;
        b=mt9Bq9qIT5wd1ZTAU24N+aMITACz/8FzjE2JT1JM+9P+VO4RLfRquW2ZtOujPXFYWy
         KDVieL6yL4PiOQivbL9aVd0Z2qwPTRxl9bP8/E0r4IscmJCeIGSuVSrnFi0NIEDNugi5
         gFxXcaDW+hU09Ur/a8nnlUZn9QHdgMtTSFHfAOANUk/p57UHDeR/h2CBEuVkMBCFyG8O
         zolOj/Bkw6lj5eMOwFupz5r7jQOIpR+VkS8h1EjTDc+gdtHW4dvPtiGdsm7b6aJMmnc9
         GyMAV5TB+FmI/TNs8uqTLlFn5Aoaqx7xWJrFnREgGXHUuoAaRTj6OSsGFFvZ51QLr9jo
         3oQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699357980; x=1699962780;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QheVU55AOpi97kz7e8dFLi9TKtD2wpZJt88Q1+YXLh0=;
        b=RAyu/oe1Xx5fR+PDaGfxwAIBgBHVFrMb+f/4/rG7Z0WJcckR7mtB4+5gJVCsJh3aX9
         q5QLYwxHJNz4QBy65GnJ/43FF+uHuALHcSEEv+UJTvrvmffxvogfkpXVvPn9QjKcQ8ac
         +KPvcz3IaYieVw8pX31Gkmr/kATnHWFQ+aJb2VxwVwqGbWaUN/H2hB5Qj3XzPMO0jDDm
         lKZ+skUpFve56Ubwve+p/fDMeSdh7GFMq12hqrGBjhh64bcAvPbREJt2TPQ7gy1JVObm
         IQyCm3qgcgDeukkxtESDdwtm3IiVdCReuXczopCue93dNFcQND2AYvuLh5X3s8EwigzA
         2L1A==
X-Gm-Message-State: AOJu0YyulHPE+VLwInc2e7usuCcrX7i/QtR11rPUhnlnToUJilcNY/J4
	ZG76Eo1zaSz6LF4gmZbMtRkTHRPc/gY=
X-Google-Smtp-Source: AGHT+IGYla7dhkYKWiEpSVIubrYUHG2hRTOYrC8fKXIm0XfiFAeqT6p0tywNg2Sfg2BszUT/4euTmA==
X-Received: by 2002:a17:907:26c9:b0:9e0:dde:cc9f with SMTP id bp9-20020a17090726c900b009e00ddecc9fmr5372988ejc.22.1699357980388;
        Tue, 07 Nov 2023 03:53:00 -0800 (PST)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id h5-20020a170906718500b009dbe08bc793sm971422ejk.18.2023.11.07.03.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 03:53:00 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH] common-licenses: Add Baekmuk license
Date: Tue,  7 Nov 2023 12:52:58 +0100
Message-ID: <20231107115258.172865-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Nov 2023 11:53:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190270

The Baekmuk font uses this license.

The license file was extracted from
http://kldp.net/baekmuk/release/865-baekmuk-ttf-2.2.tar.gz

The SPDX link for this license:
https://spdx.org/licenses/Baekmuk.html

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/files/common-licenses/Baekmuk | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta/files/common-licenses/Baekmuk

diff --git a/meta/files/common-licenses/Baekmuk b/meta/files/common-licenses/Baekmuk
new file mode 100644
index 0000000000..04322ec737
--- /dev/null
+++ b/meta/files/common-licenses/Baekmuk
@@ -0,0 +1,11 @@
+Copyright (c) 1986-2002 Kim Jeong-Hwan
+All rights reserved.
+
+Permission to use, copy, modify and distribute this font is
+hereby granted, provided that both the copyright notice and
+this permission notice appear in all copies of the font,
+derivative works or modified versions, and that the following
+acknowledgement appear in supporting documentation:
+    Baekmuk Batang, Baekmuk Dotum, Baekmuk Gulim, and
+    Baekmuk Headline are registered trademarks owned by
+    Kim Jeong-Hwan.
-- 
2.41.0


