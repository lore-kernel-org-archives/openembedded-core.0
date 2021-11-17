Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D695C433F5
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 15:35:29 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web09.8791.1637163328703490192
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 07:35:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DnJ0mbNW;
 spf=pass (domain: gmail.com, ip: 209.85.128.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id
 z1-20020a05600c220100b00337f97d2464so4015196wml.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 07:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2Jzys4IyLkbl6yM3wJTl+hwoaSOIRvPYimG+se4oNac=;
        b=DnJ0mbNW44a9lI5nBIV6/E89NN25t6SmijS+ZBI5M7XDo42HUpEhq175A8yWoM0Nc7
         mOciVjjE6yRARizeG3plUbJjxjJUUy/7mC/UNPdlHNIBfnQ3ln+dmnpP6pg5ZI1ZxSvp
         L8xIZXl+jIVKNFRP+4VVAIl89dl9lvF0UJUF9CIAPM7W+senLfYrsT1nEedbJAfpP/Ww
         HBwBLrI04wwYvoNLEIkOEBhv6hhGgn2SW1vi2P7415FXoG0FUXbl38PHS07zww/0gjk7
         xo5siRPHdUueBat5RypZq5HFhBGrFTzPTqK33u6QOvCv22hIy7JAclum6BAo6m4hhFOW
         2yYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2Jzys4IyLkbl6yM3wJTl+hwoaSOIRvPYimG+se4oNac=;
        b=z9zDq2JdqjUCMisiROR3YP+q8TdWodk1bNczM5sscdpW2XGlCU2Dy5/OmHUoDCiksB
         8vwTUpcX+Cjmri6gOsfxHGW2F2sPAzouw4NySW7c4kqcyqdp+wKaPYk+paUmmQnre975
         u98GAj4K7RSs+/xmsoNR6oAM++bexatyB7vciWGo8FXPB/qBbmakBTHbipVKW24O1i+v
         +HcYJZeYCVAHctbfMTIbX6r9/+3GyfGsCwHIdv138LERymqEgCyhntKcCLUxXuvNF0GS
         ScDlIOy273dgz2a1hb883/HVJqmJ10o9rvSLDMEjJxe6jACMKG1isdoRQHVUhNFx8W9u
         i7uQ==
X-Gm-Message-State: AOAM5339V3Y6cy6pdyJnXhmM+wtVcZMmGYz2CtohrGp9XFe18MFCw6ap
	VcqrrAXzGrEkYir3K8/YS0Rq91lWyOw=
X-Google-Smtp-Source: 
 ABdhPJyI1FzdVaj/3kl832MBkIOUN3BHbej+pSYhmQ6Y4/m937HHlHpicAgtMymrroydGTbP4UjjQQ==
X-Received: by 2002:a05:600c:1548:: with SMTP id
 f8mr621770wmg.67.1637163327163;
        Wed, 17 Nov 2021 07:35:27 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id o9sm221272wrs.4.2021.11.17.07.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 07:35:26 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 01/36] ovmf: submit patch upstream
Date: Wed, 17 Nov 2021 16:34:50 +0100
Message-Id: <20211117153525.257146-1-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Nov 2021 15:35:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158396

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-core/ovmf/ovmf/0005-debug-prefix-map.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/ovmf/ovmf/0005-debug-prefix-map.patch b/meta/recipes-core/ovmf/ovmf/0005-debug-prefix-map.patch
index e467d6f152..9e345f4dda 100644
--- a/meta/recipes-core/ovmf/ovmf/0005-debug-prefix-map.patch
+++ b/meta/recipes-core/ovmf/ovmf/0005-debug-prefix-map.patch
@@ -14,7 +14,7 @@ overflowing section sizes and causing small changes in the binary output.
 Previously we relied on the stripped output being the same which isn't always
 the case if the size of the debug symbols varies.
 
-Upstream-Status: Pending [gcc parts may be upstreamable, nasm patch isn't upstream yet]
+Upstream-Status: Submitted [https://github.com/tianocore/edk2/pull/2202]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 ---
-- 
2.20.1


